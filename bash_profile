stty -ixon
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export TERM=xterm-256color
export BASH_SILENCE_DEPRECATION_WARNING=1
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
export PATH=~/.npm-global/bin:$PATH
export FZF_DEFAULT_COMMAND='rg --files --hidden --glob=!.git/*'
export DOCKER_HOST=192.168.64.8:2375
export KUBECONFIG=~/.kube/microk8s.config
export PGDATA=~/Projects/pgdata

alias w="cd ~/Projects"
alias gl="git log --graph"
alias gs="git status"
alias gf="git diff"
alias gb="git branch"
alias ll="ls -al"
alias k="kubectl"
alias mongod="mongod --dbpath /Users/phuc/Projects/mongo --config /usr/local/etc/mongod.conf --fork"

export STARSHIP_CONFIG=/Users/phuc/Projects/dotfiles/starship.toml
eval "$(starship init bash)"
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
