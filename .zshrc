# solarized darkを設定
eval `/usr/local/opt/coreutils/libexec/gnubin/dircolors ~/.dircolors-solarized/dircolors.ansi-dark`

# solarizedにgdicolorsを変更
eval $(gdircolors ~/.dircolors-solarized/dircolors.ansi-dark)

# Ctrl+Dでログアウトしてしまうことを防ぐ
setopt IGNOREEOF

# 日本語を利用する
export LANG=ja_JP.UTF-8

# 補完
autoload -Uz compinit
compinit

# コマンドミスを修正
setopt correct

# 色設定
autoload -U colors
colors

# もしかして機能
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

# cdコマンドの後にlsを実行
chpwd() { gls -al --color=auto }

# 現在地の表示
# PS1="%{$fg[cyan]%}[${USER}@%~]%"

# PROMPT="%{$fg[cyan]%}[${USER}@%~]%"

# PCRE 互換の正規表現を使う
setopt re_match_pcre

# プロンプトが表示されるたびにプロンプト文字列を評価、置換する
setopt prompt_subst


GHOST=$'\U1F47B'
POOP=$'\U1F4A9'
ANGRY=$'\U1F4A2'
BOMB=$'\U1F4A3'
BYE=$'\U1F44B'
DASH=$'\U1F4A8'

# backupedプロンプト指定
#PROMPT="
#[%n] %{${fg[yellow]}%}%~%{${reset_color}%}
#%(?.%{$fg[green]%}.%{$fg[blue]%})%(?!(*'-')${GHOST} <!(*;_;%)ehh? <)%{${reset_color}%} "

PROMPT="
[%n] %{${fg[yellow]}%}%~%{${reset_color}%}
%(?.%{$fg[green]%}.%{$fg[red]%})%(?!${GHOST}${GHOST}${GHOST} <BOO ${DASH} !${POOP}${POOP}${POOP} <PEE! ${DASH} )%{${reset_color}%} "

# プロンプト指定(コマンドの続き)
PROMPT2='[%n]> '

# backupedもしかして時のプロンプト指定
# SPROMPT="%{$fg[red]%}%{$suggest%}(*'~'%)? < probably... %B%r%b %{$fg[red]%}? [yep!(y), nope!(n),a,e]:${reset_color} "

# もしかしたらのプロンプト指定
SPROMPT="%{$fg[red]%}%{$suggest%}(*'~'%)? < probably... %B%r%b %{$fg[red]%}? [yep!(y), nope!(n),a,e]:${reset_color} "

# showing git current branch 
function rprompt-git-current-branch {
  local branch_name
 
  if [ ! -e  ".git" ]; then
    # git 管理されていないディレクトリは何も返さない
    return
  fi
  branch_name=`git rev-parse --abbrev-ref HEAD 2> /dev/null`
  echo "[$branch_name]"
}

# プロンプトの右側にメソッドの結果を表示させる
RPROMPT='`rprompt-git-current-branch`'

# autosuggestion's color
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=white,bg=pink,bold,underline"

# PYENVの環境設定
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# OPENSSLのパスの設定
export PATH="/usr/local/opt/openssl/bin:$PATH"

# NVMの環境設定
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
alias ll="ls -alG"

# node.js express用の環境設定
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
