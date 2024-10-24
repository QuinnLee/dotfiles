echo
echo 'Customizing OS X configuration'

# set menu clock
# see http://www.unicode.org/reports/tr35/tr35-31/tr35-dates.html#Date_Format_Patterns
defaults write com.apple.menuextra.clock "DateFormat" 'EEE MMM d  h:mm:ss a'
killall SystemUIServer

# hide the dock
defaults write com.apple.dock autohide -bool true
killall Dock

# fast key repeat rate, requires reboot to take effect
defaults write ~/Library/Preferences/.GlobalPreferences KeyRepeat -int 1
defaults write ~/Library/Preferences/.GlobalPreferences InitialKeyRepeat -int 15

# set finder to display full path in title bar
defaults write com.apple.finder '_FXShowPosixPathInTitle' -bool true

# stop Photos from opening automatically
defaults -currentHost write com.apple.ImageCapture disableHotPlug -bool true
#to revert use defaults -currentHost delete com.apple.ImageCapture disableHotPlug

# modify appearance of dock: remove standard icons, add chrome and iTerm
if ! dockutil ; then
  # dockutil is not installed
  brew install --cask hpedrorodrigues/tools/dockutil
fi
dockutil --list | awk -F\t '{print "dockutil --remove \""$1"\" --no-restart"}' | sh
dockutil --add /Applications/Google\ Chrome.app --no-restart
dockutil --add /Applications/iTerm.app

# Force Preference Refresh
killall -u $USER cfprefsd

echo
echo "Configuring iTerm"
cp configs/com.googlecode.iterm2.plist ~/Library/Preferences

echo "Configuring Rectangle"
cp configs/com.knollsoft.Rectangle.plist ~/Library/Preferences/com.knollsoft.Rectangle.plist
open /Applications/Rectangle.app

echo "Configuring FlyCut"
open /Applications/Flycut.app

set +e

echo "Installing Oh My Zsh (and don't exit if it's already installed)"
ZSH= sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" "" --unattended

echo "Ignoring insecure completion-dependent directories."
echo "Needed when multiple admin users are using oh-my-zsh."
echo "

# Ignoring insecure completion-dependent directories.
# Needed when multiple admin users are using oh-my-zsh.
ZSH_DISABLE_COMPFIX=true

set -e
