set +e

echo
echo "GitX"
brew install --cask rowanj-gitx

echo
echo "Installing editors"
echo "Only installing Visual Studio Code and Vim by default"
echo "Uncomment other editors and rerun if you want them"
brew install --cask visual-studio-code
brew install nvim
echo
echo


echo "Installing Coreutils"
brew install coreutils
brew install curl
brew install git
echo

echo "Installing rbenv, pyenv and nvm"
brew install rbenv
rbenv init
brew install pyenv
brew install nvm


echo
