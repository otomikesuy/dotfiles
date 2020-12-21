# solarized darkを設定
eval `/usr/local/opt/coreutils/libexec/gnubin/dircolors ~/.dircolors-solarized/dircolors.ansi-dark`

# solarizedにgdicolorsを変更
eval $(gdircolors ~/.dircolors-solarized/dircolors.ansi-dark)

# Ctrl+D$B$G%m%0%"%&%H$7$F$7$^$&$3$H$rKI$0(B
setopt IGNOREEOF

# $BF|K\8l$rMxMQ$9$k(B
export LANG=ja_JP.UTF-8

# $BJd40(B
autoload -Uz compinit
compinit

# $B%3%^%s%I%_%9$r=$@5(B
setopt correct

# $B?'@_Dj(B
autoload -U colors
colors

# $B$b$7$+$7$F5!G=(B
setopt correct

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

# cd$B%3%^%s%I$N8e$K(Bls$B$r<B9T(B
chpwd() { gls -al --color=auto }

# $B8=:_CO$NI=<((B
# PS1="%{$fg[cyan]%}[${USER}@%~]%"

# PROMPT="%{$fg[cyan]%}[${USER}@%~]%"

# PCRE $B8_49$N@55,I=8=$r;H$&(B
setopt re_match_pcre

# $B%W%m%s%W%H$,I=<($5$l$k$?$S$K%W%m%s%W%HJ8;zNs$rI>2A!"CV49$9$k(B
setopt prompt_subst


GHOST=$'\U1F47B'
POOP=$'\U1F4A9'
ANGRY=$'\U1F4A2'
BOMB=$'\U1F4A3'
BYE=$'\U1F44B'
DASH=$'\U1F4A8'

# backuped$B%W%m%s%W%H;XDj(B
#PROMPT="
#[%n] %{${fg[yellow]}%}%~%{${reset_color}%}
#%(?.%{$fg[green]%}.%{$fg[blue]%})%(?!(*'-')${GHOST} <!(*;_;%)ehh? <)%{${reset_color}%} "

PROMPT="
[%n] %{${fg[yellow]}%}%~%{${reset_color}%}
%(?.%{$fg[green]%}.%{$fg[red]%})%(?!${GHOST}${GHOST}${GHOST} <BOO ${DASH} !${POOP}${POOP}${POOP} <PEE! ${DASH} )%{${reset_color}%} "

# $B%W%m%s%W%H;XDj(B($B%3%^%s%I$NB3$-(B)
PROMPT2='[%n]> '

# backuped$B$b$7$+$7$F;~$N%W%m%s%W%H;XDj(B
# SPROMPT="%{$fg[red]%}%{$suggest%}(*'~'%)? < probably... %B%r%b %{$fg[red]%}? [yep!(y), nope!(n),a,e]:${reset_color} "

# $B$b$7$+$7$?$i$N%W%m%s%W%H;XDj(B
SPROMPT="%{$fg[red]%}%{$suggest%}(*'~'%)? < probably... %B%r%b %{$fg[red]%}? [yep!(y), nope!(n),a,e]:${reset_color} "

# showing git current branch 
function rprompt-git-current-branch {
  local branch_name
 
  if [ ! -e  ".git" ]; then
    # git $B4IM}$5$l$F$$$J$$%G%#%l%/%H%j$O2?$bJV$5$J$$(B
    return
  fi
  branch_name=`git rev-parse --abbrev-ref HEAD 2> /dev/null`
  echo "[$branch_name]"
}

# $B%W%m%s%W%H$N1&B&$K%a%=%C%I$N7k2L$rI=<($5$;$k(B
RPROMPT='`rprompt-git-current-branch`'

# autosuggestion's color
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=white,bg=pink,bold,underline"

# PYENV$B$N4D6-@_Dj(B
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# OPENSSL$B$N%Q%9$N@_Dj(B
export PATH="/usr/local/opt/openssl/bin:$PATH"

# NVM$B$N4D6-@_Dj(B
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
alias ll="ls -alG"

# node.js express$BMQ$N4D6-@_Dj(B
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
