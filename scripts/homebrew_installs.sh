set +e

echo
echo "GitX"
brew install --cask rowanj-gitx

echo
echo "Installing editors"
echo "Only installing Visual Studio Code and Vim by default"
echo "Uncomment other editors and rerun if you want them"
brew install --cask visual-studio-code
brew install --cask cursor
brew install nvim
echo
echo


echo "Installing Coreutils"
brew install coreutils
brew install curl
echo

echo "Installing rbenv, pyenv and nvm"
brew install rbenv
rbenv init
brew install pyenv
brew install nvm

echo "Installing Apps"
brew install --cask flycut
brew install --cask rectangle
brew install --cask iterm2
brew install --cask google-chrome
brew install --cask firefox
brew install --cask slack
brew install --cask zoom
brew install --cask dash # api browser
brew install --cask postman # api interaction tool
brew install --cask quicklook-json # OSX tool for viewing JSON
brew install --cask rowanj-gitx
