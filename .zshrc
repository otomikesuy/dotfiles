# Setup solarized dark
eval `/usr/local/opt/coreutils/libexec/gnubin/dircolors ~/.dircolors-solarized/dircolors.ansi-dark`

# Apply solarized dark
eval $(gdircolors ~/.dircolors-solarized/dircolors.ansi-dark)

# Prevent Ctrl+D from logging-out
setopt IGNOREEOF

# Apply jp environment
export LANG=ja_JP.UTF-8

# Setup auto completion
autoload -Uz compinit
compinit

# Correct command mistakes
setopt correct

# Set colors
autoload -U colors
colors

# ------------------------------
# Alias Command
# ------------------------------
alias ll='gls -al --color=auto'
alias ls='gls --color=auto'
alias vi='vim'
alias vz='vim ~/.zshrc'
alias rm='rm -i'
alias cp='cp -i'
alias mkdir='mkdir -p'
alias so='source'
alias vt='vi ~/.tmux.conf'
alias mongod='mongod --dbpath /usr/local/var/mongodb'

# ls after cd command
chpwd() { gls -al --color=auto }

# PCRE regexp
setopt re_match_pcre

# command substitution in prompt
setopt prompt_subst


GHOST=$'\U1F47B'
POOP=$'\U1F4A9'
ANGRY=$'\U1F4A2'
BOMB=$'\U1F4A3'
BYE=$'\U1F44B'
DASH=$'\U1F4A8'

# prompt backups
#PROMPT="
#[%n] %{${fg[yellow]}%}%~%{${reset_color}%}
#%(?.%{$fg[green]%}.%{$fg[blue]%})%(?!(*'-')${GHOST} <!(*;_;%)ehh? <)%{${reset_color}%} "

# prompt first line
PROMPT="
[%n] %{${fg[yellow]}%}%~%{${reset_color}%}
%(?.%{$fg[green]%}.%{$fg[red]%})%(?!${GHOST}${GHOST}${GHOST} <BOO ${DASH} !${POOP}${POOP}${POOP} <PEE! ${DASH} )%{${reset_color}%} "

# prompt second line
PROMPT2='[%n]> '

# sprompt backups
# SPROMPT="%{$fg[red]%}%{$suggest%}(*'~'%)? < probably... %B%r%b %{$fg[red]%}? [yep!(y), nope!(n),a,e]:${reset_color} "

# sprompt 
SPROMPT="%{$fg[red]%}%{$suggest%}(*'~'%)? < probably... %B%r%b %{$fg[red]%}? [yep!(y), nope!(n),a,e]:${reset_color} "

# showing git current branch 
function rprompt-git-current-branch {
  local branch_name
 
  if [ ! -e  ".git" ]; then
    # Doen't show any branchs if any of files are managed under github
    return
  fi
  branch_name=`git rev-parse --abbrev-ref HEAD 2> /dev/null`
  echo "[$branch_name]"
}

# add current branch to right prompt
RPROMPT='`rprompt-git-current-branch`'

# autosuggestion's color
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=white,bg=pink,bold,underline"

# PYENV setup
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# OPENSSL path setup
export PATH="/usr/local/opt/openssl/bin:$PATH"

# NVM setup
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
alias ll="ls -alG"

# node.js express path setup
export PATH=/usr/local/share/npm/bin:$PATH
export NODE_PATH=/usr/local/lib/node_modules

# history memory
export HISTFILE=${HOME}/.zsh_history
export HISTSIZE=1000000
export SAVEHIST=1000000
setopt hist_ignore_dups
setopt EXTENDED_HISTORY
setopt share_history

# peco find directory
function find_cd() {
  cd "$(find . -type d | peco)"
}
alias fc="find_cd"

# history(peco) settinigs
function peco-history-selection() {
  BUFFER=`history -n 1 | tail -r | awk '!a[$0]++' | peco`
  CURSOR=$#BUFFER
  zle reset-prompt
}

zle -N peco-history-selection
bindkey '^R' peco-history-selection

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# goenv path setting
# followd this url on 20200725 https://github.com/syndbg/goenv/blob/master/INSTALL.md
export GOENV_ROOT="$HOME/.goenv"
export PATH="$GOENV_ROOT/bin:$PATH"
eval "$(goenv init -)"
export PATH="$GOROOT/bin:$PATH"
export PATH="$PATH:$GOPATH/bin"
