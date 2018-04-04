export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="muse"
source $ZSH/oh-my-zsh.sh
plugins=(git osx rails ruby rbenv python brew npm pip vi-mode vagrant python3)

# Assure that the .rbenv -related have higher precedence (i.e. when using tmux)
# then de-dup PATH variable.
export PYENV_ROOT="$HOME/.pyenv"
# Add pyenv root to PATH
# and initialize pyenv
if [[ -d $PYENV_ROOT ]];then
    PATH="$PYENV_ROOT/bin:$PATH"
    # initialize pyenv
    eval "$(pyenv init -)"
    # initialize pyenv virtualenv
    eval "$(pyenv virtualenv-init -)"
fi

eval "$(rbenv init -)"
export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh
export PATH="$HOME/.rbenv/bin:$PATH"

export PATH="$HOME/.rbenv/shims:$PATH"
export PATH=$HOME/bin:/usr/local/bin:/usr/local/share/npm/bin:$PATH

autoload -U compinit
compinit

# use vim as an editor
export EDITOR=vim

# color support for less/more
export LESS="--ignore-case --quiet --chop-long-lines --quit-if-one-screen --no-init --raw-control-chars"

# aliases
if [ -e "$HOME/.aliases" ]; then
  source "$HOME/.aliases"
fi

# hitch for programming with pairs
if [ -e "$HOME/.hitch" ]; then
  source "$HOME/.hitch"
fi

# docker-related
eval $(docker-machine env -u)
if [ -e "$HOME/.dockerrc" ]; then
  source "$HOME/.dockerrc"
fi

# awesome cd movements from zshkit
setopt autocd
setopt autopushd pushdminus pushdsilent pushdtohome
setopt cdablevars

# Try to correct command line spelling
setopt correct

# Enable extended globbing
setopt extended_glob

# History-related
export HISTSIZE=10000
export SAVEHIST=10000
export HISTFILE=$HOME/.zsh_history
export IRBRC=$HOME/.irbrc

setopt APPEND_HISTORY
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_REDUCE_BLANKS
setopt HIST_IGNORE_SPACE
setopt HIST_VERIFY
setopt EXTENDED_HISTORY

set -o vi
# prompt
PROMPT='%{$fg_bold[red]%}➜ %{$fg[cyan]%}%c %{$fg_bold[blue]%}$(git_prompt_info)%{$fg_bold[blue]%} % %{$reset_color%}'

