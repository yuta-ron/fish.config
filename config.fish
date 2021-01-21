# alias
alias ll='ls -lha'
alias d='docker'
alias dc='docker-compose'
alias dcrun='docker-compose run'
alias dcup='docker-compose up'
alias dcupd='docker-compose up -d'
alias dclog='docker-compose logs -f'
alias dconls='docker container ls'
alias dps='docker ps'
alias dcdown='docker-compose down'
alias dkill='docker kill'
alias dkillall='docker kill (docker ps -q)'
alias ddps='docker ps --format "{{.ID}}\t{{.Image}}\t{{.Status}}\t{{.Command}}\t{{.Names}}\t{{.RunningFor}}"'
alias dexecsh='docker exec -it (ddps | peco | cut -f 1) sh'
alias dexecbash='docker exec -it (ddps | peco | cut -f 1) /bin/bash'
alias pripcopy='ipconfig getifaddr en0 | pbcopy'
alias gipcopy='curl --silent https://ifconfig.io | pbcopy'
alias gche='git checkout'
alias gp='git pull'
alias gcm='git commit -m'
alias gcam='git commit --amend'
alias gstat='git status'
alias gsth='git stash'
alias gsa='git stash apply'
alias gsas='git stash apply stash@'
alias gdiff='git diff'
alias gdc='git diff --cached'
alias gad='git add'
alias gcpeco='git branch -a --sort=-authordate | cut -b 3- | grep -v -- "->" | peco | sed -e "s%remotes/origin/%%"'
alias gcheckout='git checkout (gcpeco)' 
alias curlpostjson='curl -X POST -H "Content-Type: application/json" -d'
alias gpoh='git push origin HEAD'
alias hostsrefresh='sudo killall -HUP mDNSResponder'
alias curlw='curl -so /dev/nul -w "http_code: %{http_code}\ntime_namelookup: %{time_namelookup}\ntime_connect: %{time_connect}\ntime_appconnect: %{time_appconnect}\ntime_pretransfer: %{time_pretransfer}\ntime_starttransfer: %{time_starttransfer}\ntime_total: %{time_total}\n"'
alias k='kubectl'
alias untrackedclean='git clean -df && git checkout .'
alias k='kubectl'
alias ku='kustomize'

# 普段Fishなので気軽にREPLで動かしたい
alias dsh='docker run -it bash:5.1.4 /bin/sh'
alias dbash='docker run -it bash:5.1.4 /usr/local/bin/bash'

function fish_user_key_bindings
  bind \c] peco_change_directory # Bind for peco change directory to Ctrl+F
end

#pyenv
#set PATH $HOME/.pyenv/shims $PATH
#eval (pyenv init - | source)

#phpenv
set -x PATH $HOME/.phpenv/bin $PATH
set -x PATH $HOME/.phpenv/shims $PATH
phpenv rehash >/dev/null ^&1

set -x EDITOR /usr/local/bin/vim
set -x GOPATH $HOME/.go
set -x PATH $PATH $GOPATH/bin

set -x PATH $HOME/.rbenv/bin $PATH
status --is-interactive; and source (rbenv init -|psub)

rbenv init - | source

direnv hook fish | source
eval (direnv hook fish)
eval (gh completion -s fish| source)
starship init fish | source
