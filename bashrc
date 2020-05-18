# /etc/skel/.bashrc
#
# This file is sourced by all *interactive* bash shells on startup,
# including some apparently interactive shells such as scp and rcp
# that can't tolerate any output.  So make sure this doesn't display
# anything or bad things will happen !


# Test for an interactive shell.  There is no need to set anything
# past this point for scp and rcp, and it's important to refrain from
# outputting anything in those cases.
if [[ $- != *i* ]] ; then
	# Shell is non-interactive.  Be done now!
	return
fi

export XAUTHORITY="/tmp/.Xauthority"
if [ -z "$DISPLAY" ] && [ $(tty) == "/dev/tty1" ]; then
	exec startx -logverbose -1
fi

umask 022

#HISTCONTROL=ignoredups:erasedups
# PROMPT_COMMAND="history -n; history -w; history -c; history -r; $PROMPT_COMMAND"
shopt -s histappend
PROMPT_COMMAND=`history -a`
shopt -s cdspell
export HISTCONTROL="ignoredups"

set -o vi
bind '"\e."':yank-last-arg

alias gcmds="vim ~/media/configs/cmds.txt.gpg"
alias prsync="rsync -ah --info=progress2 --partial"

PATH="$PATH:/home/yos/bin/:/home/yos/.local/bin/"

export SSH_AUTH_SOCK=/run/user/$UID/ssh-agent.session
ps ax | grep ssh-agent | grep $SSH_AUTH_SOCK | grep -v grep > /dev/null || {
    rm $SSH_AUTH_SOCK > /dev/null 2>&1
    ssh-agent -t 300 -a $SSH_AUTH_SOCK > /dev/null 2>&1
}

export VIEWER='vimpager'

alias sshmount='sudo sshfs -o allow_other -o workaround=rename'
alias sshumount='sudo fusermount -u'

alias wallpaper='feh --bg-center --bg-max --randomize /home/yos/media/wallpapers/'

alias ag='ag --silent --path-to-ignore ~/.ignore'
alias dps="docker ps -q | xargs docker inspect --format '{{ .Id }} - {{ .Name }} - {{ .NetworkSettings.IPAddress }}'"
alias tm="tmux new -A -s "

alias post="curl -X POST -H 'Content-Type: application/json'"

export NODE_PATH=/usr/lib64/node_modules/
