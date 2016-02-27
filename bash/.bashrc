# less
export LESS='--ignore-case --squeeze-blank-lines --RAW-CONTROL-CHARS --no-init --LONG-PROMPT'
export LESS_TERMCAP_mb=$'\E[01;31m'                     # begin blinking
export LESS_TERMCAP_md=$'\E[01;38;5;74m'                # begin bold
export LESS_TERMCAP_me=$'\E[0m'                         # end mode
export LESS_TERMCAP_se=$'\E[0m'                         # end standout-mode
export LESS_TERMCAP_so=$'\E[38;5;016m\E[48;5;220m'      # begin standout-mode - info box
export LESS_TERMCAP_ue=$'\E[0m'                         # end underline
export LESS_TERMCAP_us=$'\E[04;38;5;146m'               # begin underline

# aliases

## modified commands
alias ls='ls -hF --color=auto'
alias diff='colordiff'              # requires colordiff package
alias grep='grep --color=auto'
alias igrep='grep --ignore-case'
alias more='less'
alias df='df -h'
alias du='du -c -h'
alias mkdir='mkdir -p -v'
alias nano='nano -w'
alias ping='ping -c 5'
alias ..='cd ..'

## new commands
alias da='date "+%A, %B %d, %Y [%T]"'
alias du1='du --max-depth=1'
alias hist='history | grep $1'      # requires an argument
alias openports='netstat --all --numeric --programs --inet --inet6'
alias httpserver="echo '=> python -m http.server 8000' && python -m http.server 8000"

## privileged access
if [ $UID -ne 0 ]; then
    alias sudo='sudo '
    alias scat='sudo cat'
    alias svim='sudo vim'
    alias root='sudo su'
    alias reboot='sudo reboot'
    alias halt='sudo halt'
    alias netcfg='sudo netcfg2'
fi

## ls
alias lr='ls -R'                    # recursive ls
alias ll='ls -l'
alias la='ll -A'
alias lx='ll -BX'                   # sort by extension
alias lz='ll -rS'                   # sort by size
alias lt='ll -rt'                   # sort by date
alias lm='la | more'

## safety features
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -I'                    # 'rm -i' prompts for every file
alias ln='ln -i'
alias chown='chown --preserve-root'
alias chmod='chmod --preserve-root'
alias chgrp='chgrp --preserve-root'

## emacs
alias e="emacsclient -t -a '' $@"

## git
alias gt='git log --graph --decorate --pretty=oneline --abbrev-commit'
alias gl='git log --pretty=oneline --abbrev-commit'
alias gi='git status'

## arch
alias a='pacaur'

# userscripts
export PATH=~/bin:$PATH

# env
export EDITOR=~/bin/EDITOR
export TERM=xterm-256color
export WINEARCH=win32
export M2_HOME=/opt/maven
# export GTK_IM_MODULE=xim        # make sure that GTK+ apps do not use own tables with XCompose
# export XMODIFIERS=emacs         # get XCompose key working in emacs

# ruby
alias r='rake'

## rbenv
export PATH=~/.rbenv/bin:$PATH
eval "$(rbenv init -)"

## gem - add local gem directory to PATH
if which ruby >/dev/null && which gem >/dev/null; then
    PATH="$(ruby -rubygems -e 'puts Gem.user_dir')/bin:$PATH"
fi

## bundler - install gems locally
export GEM_HOME=$(ruby -rubygems -e 'puts Gem.user_dir')

# js
export PATH=~/var/npm-global/bin:$PATH
