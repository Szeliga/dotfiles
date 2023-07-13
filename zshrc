# Oh-My-Zsh config
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="agnoster"
DISABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"
plugins=(git history history-substring-search cp kubectl docker ripgrep fd sudo zsh-interactive-cd)
export KEYTIMEOUT=1
export LC_MONETARY="pl_PL.UTF-8"
export LC_NUMERIC="pl_PL.UTF-8"
export LC_TIME="pl_PL.UTF-8"
export NVIM_LISTEN_ADDRESS=/tmp/nvimsocket

# Better searching in command mode
bindkey -M vicmd '?' history-incremental-search-backward
bindkey -M vicmd '/' history-incremental-search-forward

# ENV vars
export EDITOR="nvim"
export GPG_TTY=$(tty)
export FZF_DEFAULT_COMMAND="rg --files --hidden --glob '!.git/*' --smart-case"

# Git aliases & functions
alias ts='tig status'
alias gcob='git checkout $(git branch | fzf)'
alias gdb='git branch -D $(git branch | fzf -m)'

# Personal aliases
alias ba='bin/app'
alias dc='docker-compose'
alias vim='lvim'
alias fcd='cd $(fd --type d --exclude node_modules --exclude vendor --exclude build --exclude _build --exclude bundle --exclude Godeps | fzf)'
alias be='bundle exec'
alias fzfp="fzf --preview 'bat --style=numbers --color=always {} | head -500'"
alias hal-wakeup="wakeonlan 70:8b:cd:53:b4:17"

function decrypt() {
  openssl enc -aes256 -in $1 -out $2 -salt -d
}

function encrypt() {
  openssl enc -aes256 -in $1 -out $2 -salt
}

function pogoda {
  curl "http://wttr.in/${1:-nadolice-wielkie}" | less
}

function show-size {
  du $1 | awk 'BEGIN{FS=" "} {sum+=$1} END {print sum/1024/1024 " GB"}'
}

function git-clean() {
  git fetch -p && for branch in `LANG=en_US git branch -vv | grep ': gone]' | awk '{print $1}'`
    do git branch -D $branch
  done
}

function gimmeport() {
  lsof -n -i4TCP:$1 | grep LISTEN
}

function c() {
  mkdir -p "$(dirname "$1")" && touch "$1"
}

function branch-name() {
  id=$(echo -n "$1" | md5 | head -c 8)
  echo "ss-$id"
  echo -n "ss-$id" | pbcopy
}

source $ZSH/oh-my-zsh.sh

if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH
fi

bindkey -v

function kubectl() {
    if ! type __start_kubectl >/dev/null 2>&1; then
        source <(command kubectl completion zsh)
    fi

    command kubectl "$@"
}
if command -v op  &> /dev/null
then
  eval "$(op completion zsh)"; compdef _op op
fi

function workdays() {
  LANG=en LC_ALL=en ncal -h -m $1 | grep -vE "^S|^ |^$" | sed "s/[[:alpha:]]//g" | fmt -w 1 | sort -n | wc -l
}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

if [ -f "${HOME}/.gemrc.local" ]; then
  export GEMRC="${HOME}/.gemrc.local"
fi

# RVM
export GOPATH="$HOME/go"
export PATH="$HOME/.rvm/bin:$PATH:$HOME/.local/bin:./bin:$HOME/Library/Python/3.7/bin:$GOPATH/bin"
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

export CDPATH="$CDPATH:$HOME/work:$HOME/coding:$HOME/.config"

files=(~/.config/dotfiles/extras/zsh/*(N))
for f in $files
do
  source $f
done

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
