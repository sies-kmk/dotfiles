# ~/.bashrc: executed by bash(1) for non-login shells.
# Josh B version: 1.05 (9.14.2015)  

# couple of links to help you out n00b
# http://linuxconfig.org/bash-prompt-basics
# http://www.cyberciti.biz/tips/bash-aliases-mac-centos-linux-unix.html
# https://wiki.archlinux.org/index.php/Color_Bash_Prompt


# environment

#read all write only me
#umask 022

#no one can read
#umask 007

# check to see if we have a alias file
if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend


# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
        # We have color support; assume it's compliant with Ecma-48
        # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
        # a case would tend to support setf rather than setaf.)
        color_prompt=yes
    else
        color_prompt=
    fi
fi

unset color_prompt force_color_prompt

# Change bash prompt. See the article
# http://www-106.ibm.com/developerworks/library/l-tip-prompt/
# use if not using screen

#export PS1='\d \@ \[\e[32;1m\]\u\[\e[34;1m\]@\[\e[36;1m\]\H \[\e[34;1m\]\w\[\e[32;1m\] $ \[\e[0m\]'

# new bash prompt 9.9.15
 export PS1="\`if [ \$? = 0 ]; then echo \[\e[33m\]^_^\[\e[0m\]; else echo \[\e[31m\]O_O\[\e[0m\]; fi\` \u@\h[\w] ==> "
# export PS1="\`if [ \$? = 0 ]; then echo \[\e[33m\]^_^\[\e[0m\]; else echo \[\e[31m\]O_O\[\e[0m\]; fi\` \u@\h\[[\033[01;34m\]\w\[\033[00m\]] ==> "



# ~~~the fun stuff~~~


alias reload='source ~/.bashrc'
alias gohome='cd ~; clear'
alias showalias='cat ~/.bash_aliases'
alias la='ls --color -lah'
alias ports='sudo netstat -tulanp'
alias home='ssh josh@miserybox.ddns.net -A'
alias lmi='ssh cyrano@shell.lmi.net'

# Monitor logs

# alias syslog='sudo tail -100f /var/log/syslog'
# alias messages='sudo tail -100f /var/log/messages'

# Because less is more and more is less
alias more='less'

# List paths
alias path='echo -e ${PATH//:/\\n}'

# system stuffs

# Correct dir spellings
shopt -q -s cdspell

# Make sure display get updated when terminal window get resized
shopt -q -s checkwinsize

# Turn on the extended pattern matching features
# shopt -q -s extglob

# Append rather than overwrite history on exit
shopt -s histappend

# Make multi-line commandsline in history
shopt -q -s cmdhist

# Get immediate notification of background job termination
set -o notify

# Disable [CTRL-D] which is used to exit the shell
set -o ignoreeof

## get rid of command not found ##
# alias cd..='cd ..'

# This is GOLD for finding out what is taking so much space on your drives!
alias diskspace='du -S | sort -n -r | more'

# remote screen no dot.config file 

#if [ "$TERM" = "screen" ]; then
#echo "[ screen is activated ]"
#fi

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
     alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi







