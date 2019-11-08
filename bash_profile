stty -ixon
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export TERM=xterm-256color
export BASH_SILENCE_DEPRECATION_WARNING=1

function _update_ps1() {
    PS1="$(powerline-go  -modules=venv,user,ssh,cwd,git,exit,root,jobs,perms  -cwd-max-depth=1 -truncate-segment-width=0 $?)"
}

if [ "$TERM" != "linux" ]; then
    PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
fi

export EDITOR=vim
export PATH=/usr/local/bin:$PATH
export PATH=${PATH}:/usr/local/sbin
export PATH=/usr/local/php5/bin:$PATH
export PATH=/usr/local/bin:$PATH
export PATH="$PATH:$HOME/.composer/vendor/bin"

export GOPROXY=https://proxy.golang.org
export GOPATH=/Users/phuc/Projects/go
export PATH=${PATH}:$GOPATH/bin

alias gw="cd /Users/phuc/Projects/go/src/github.com/phucngome"
alias w="cd ~/Projects"
alias gl="git log --graph"
alias gs="git status"
alias gf="git diff"
alias gb="git branch"
alias ll="ls -al"
alias vscache="sh ~/.vscache"
alias mongod="mongod --config /usr/local/etc/mongod.conf --fork"
alias doctrine="vendor/bin/doctrine "

# postgresql
export PGDATA=/Users/phuc/Projects/pgdata
export PATH=~/.npm-global/bin:$PATH
export JAVA_HOME=$(/usr/libexec/java_home)

export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
