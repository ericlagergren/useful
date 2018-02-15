# .bashrc

if [ -x /usr/libexec/path_helper ]; then
    eval `/usr/libexec/path_helper -s`
fi

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

export HISTFILE=~/.bash_sessions/.bash_history_${ITERM_SESSION_ID%:*}

######################################
### SET PATHS AND EDITORS AND SUCH ###
######################################

# homebrew
export HOMEBREW_NO_INSECURE_REDIRECT=1
export HOMEBREW_CASK_OPTS=--require-sha
export HOMEBREW_NO_ANALYTICS=1

# Go
export GOROOT_BOOTSTRAP=/usr/lib/go
export GOPATH=$HOME/gopath
export GOBIN=$GOPATH/bin
export GO15VENDOREXPERIMENT=1
export GODEV_BIN=/usr/local/godev/bin

# Editors and such.
export EDITOR=/usr/local/bin/vim
export TEX_PATH=/Library/TeX/texbin
export MYSQL_BIN=/usr/local/mysql/bin

# PHP
export PEAR_PATH="$HOME/pear/bin"
export PHAR_PATH="$HOME/.composer/vendor/bin"

# PATH
export PATH=$PATH:/sbin:/usr/local/sbin:$HOME/bin:$GOBIN:$TEX_PATH:$MYSQL_BIN:$PEAR_PATH:$PHAR_PATH:$GODEV_BIN

##############
#### GPG #####
##############

export GPG_TTY=$(tty)

gpg-connect-agent /bye
gpg-connect-agent updatestartuptty /bye > /dev/null

# Point the SSH_AUTH_SOCK to the one handled by gpg-agent
if [ -S $(gpgconf --list-dirs agent-ssh-socket) ]; then
  export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
else
  echo "$(gpgconf --list-dirs agent-ssh-socket) doesn't exist. Is gpg-agent running?"
fi

###############
### COLORS ####
###############

export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
export TERM=xterm-256color

white="\[\033[01;37m\]"
red="\[\033[01;31m\]"
green="\[\033[00;32m\]"
blue="\[\033[01;34m\]"
reset="\[\033[00m\]"

function git_prompt {
    # check if we're in a git repo
    git rev-parse --is-inside-work-tree &>/dev/null || return
    echo -n " ${blue}on ${white}$(git rev-parse --abbrev-ref HEAD) "
    git diff --quiet --ignore-submodules HEAD &>/dev/null
    [ $? -eq 1  ] && echo -n '❌ '  || echo '✅ '
}

function prompt {
    PS1="${white}\$?:\$((SHLVL -1)) \
$([[ $SSH_TTY ]] && echo -n \"@${HOSTNAME}\")\
${green}\w$(git_prompt) ${blue}\$${reset} "
}

# return value visualisation
PROMPT_COMMAND=prompt

# Colored ManPages:
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

###################
### SET ALIASES ###
###################

alias keyon='osascript -e '\''tell application "yubiswitch" to KeyOn'\'''
alias keyoff='osascript -e '\''tell application "yubiswitch" to KeyOff'\'''

alias ag='rg -i '
alias rgi='rg -i '

alias ls='ls -G'
alias h?='history | grep -i '
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
alias .......='cd ../../../../../..'
alias pong="ping 8.8.8.8 -c 4"
alias myip='curl -s icanhazip.com'
alias gerp='grep'
alias tial='tail'
alias gpom='git push origin master'
alias lsa='ls -a'
alias lsal='ls -al'
alias lsl='ls -l'

#################
### FUNCTIONS ###
#################

# Performs ls -l on cd

function cd {
    dir="${@:-$HOME}"  # ~ isn't expanded when in quotes
    [ -z "${dir}" ] && dir=~
    if ! builtin cd "$dir"
    then
        dir=`compgen -d "${dir}" | head -1`
        if builtin cd "$dir"
        then
            clear
            pwd
            ls -l
        fi
    else
        clear
        pwd
        ls -l
    fi
}

dcleanup(){
	docker rm -v $(docker ps --filter status=exited -q 2>/dev/null) 2>/dev/null
	docker rmi $(docker images --filter dangling=true -q 2>/dev/null) 2>/dev/null
}

ed() { command ed -p\* "$@" ; }

###########################################
## This does something important I think ##
###########################################

shopt -s extglob

# check the window size after each command and, if necessary, update the values of LINES and COLUMNS.
shopt -s checkwinsize
