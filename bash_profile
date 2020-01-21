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

export GO111MODULE=on
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
alias python="python3"
alias pip="pip3"
alias k="kubectl"
alias rg='rg --files --hidden --glob=!.git/*'

# postgresql
export PATH=~/.npm-global/bin:$PATH
export FZF_DEFAULT_COMMAND='rg --files --hidden --glob=!.git/*'
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# google cloud
export GOOGLE_APPLICATION_CREDENTIALS="/Users/phuc/.ssh/learngcp-262316-2db0d0022f4d.json"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/phuc/Projects/google-cloud-sdk/path.bash.inc' ]; then . '/Users/phuc/Projects/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/phuc/Projects/google-cloud-sdk/completion.bash.inc' ]; then . '/Users/phuc/Projects/google-cloud-sdk/completion.bash.inc'; fi
