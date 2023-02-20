export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="lukerandall"
source $ZSH/oh-my-zsh.sh
plugins=(git osx python brew npm pip vi-mode vagrant python3 docker docker-compose kubectl)

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
export EDITOR=nvim

# color support for less/more
export LESS="--ignore-case --quiet --chop-long-lines --quit-if-one-screen --no-init --raw-control-chars"

# aliases
if [ -e "$HOME/.aliases" ]; then
  source "$HOME/.aliases"
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

export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

source $HOME/.cargo/env

# pnpm
export PNPM_HOME="/Users/pancakes/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end
export PATH="$HOME/.fuelup/bin:$PATH"

eval "$(rbenv init - zsh)"
