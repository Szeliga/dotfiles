# Oh-My-Zsh config
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="agnoster"
DISABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"
plugins=(git history history-substring-search cp kubectl docker docker-compose ripgrep fd sudo zsh-interactive-cd)
export KEYTIMEOUT=1
export LC_MONETARY="pl_PL.UTF-8"
export LC_NUMERIC="pl_PL.UTF-8"
export LC_TIME="pl_PL.UTF-8"
export NVIM_LISTEN_ADDRESS=/tmp/nvimsocket

# Better searching in command mode
bindkey -M vicmd '?' history-incremental-search-backward
bindkey -M vicmd '/' history-incremental-search-forward

# ENV vars
export EDITOR="lvim"
export GPG_TTY=$(tty)
export FZF_DEFAULT_COMMAND="rg --files --hidden --glob '!.git/*' --smart-case"


# Effectively aliases
alias eff='cd ~/coding/jagersoft/effectively'
#
# Rails aliases
alias rs='bin/rails s'
alias rc='bin/rails c'

# Git aliases & functions
alias hb="hub browse"
alias hbp="hub browse -- pulls"
alias ts='tig status'
alias gcob='git checkout $(git branch | fzf)'
alias gdb='git branch -D $(git branch | fzf -m)'

# Personal aliases
alias ba='bin/app'
alias dc='docker-compose'
alias vim='lvim'
alias fcd='cd $(fd --type d --exclude node_modules --exclude vendor --exclude build --exclude _build --exclude bundle --exclude Godeps | fzf)'
alias be='bundle exec'
alias blog="cd ~/coding/blog"
alias zshconfig="vim ~/.zshrc"
alias fzfp="fzf --preview 'bat --style=numbers --color=always {} | head -500'"
alias hal-wakeup="wakeonlan 70:8b:cd:53:b4:17"

# Utility functions
function hpr() {
  git push -u && \
    echo -e "$(git rev-list --format=%B --max-count=1 HEAD | tail -n +2) \n\n $(cat .github/pull_request_template.md)" |\
    hub pull-request \
      -b ${1:-master} \
      -F - |\
      xargs open
}

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

function workdays() {
  LC_ALL=en ncal -h | grep -vE "^S|^ |^$" | sed "s/[[:alpha:]]//g" | fmt -w 1 | sort -n | wc -l
}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# RVM
export PATH="$PATH:$HOME/.local/bin:./bin:$HOME/.rvm/bin:$HOME/Library/Python/3.7/bin"
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

export CDPATH="$CDPATH:$HOME/coding:$HOME/coding/codesono:$HOME/coding/codesono/apisono"
export PATH="$(python3 -m site --user-base)/bin:$PATH"

files=(~/.config/dotfiles/extras/zsh/*(N))
for f in $files
do
  source $f
done