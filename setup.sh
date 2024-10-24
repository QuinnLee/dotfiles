#!/usr/bin/env bash
set -e

echo "Caching password..."
sudo -K
sudo true;
clear

MY_DIR="$(dirname "$0")"
SKIP_ANALYTICS=${SKIP_ANALYTICS:-0}
if (( SKIP_ANALYTICS == 0 )); then
    clientID=$(od -vAn -N4 -tx  < /dev/urandom)
    source ${MY_DIR}/scripts/helpers/google-analytics.sh ${clientID} start $@
else
    export HOMEBREW_NO_ANALYTICS=1
fi

echo "Symlinking dot files"
echo
echo
for file in files/*; do
  target="$HOME/.$file"
  base_file=$(basename "$file")

  # Create a symlink in the home directory with a dot prefix
  if [ -e "$target" ]; then
    if [ ! -L "$target" ]; then
      echo "WARNING: $target exists but is not a symlink."
    fi
  else
     if [ -f "$file" ]; then
      ln -sf $PWD"/$file" "$HOME/.$base_file"
      echo "Symlinked $file to $HOME/.$base_file"
    else
      echo "$file is not a regular file, skipping."
    fi
  fi
done
echo
echo

# Note: Homebrew needs to be set up first
source ${MY_DIR}/scripts/homebrew.sh
source ${MY_DIR}/scripts/homebrew_install.sh
source ${MY_DIR}/scripts/configure-osx.sh

bash git clone https://github.com/NvChad/starter ~/.config/nvim && nvim

