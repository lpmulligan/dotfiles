# # --------------------------------------------------------------------
# # PS1 
# # --------------------------------------------------------------------
#autoload -U colors && colors
# Define ANSI color sequences
NORMAL="\[\033[0m\]"
#NORMAL=$(print -P '\e[0m')
WHITE="\[\033[0;37;40m\]"
#WHITE=$(print -P '\e[0;37;40m')
MAGENTA="\[\033[0;35;40m\]"
#MAGENTA=$(print -P '\e[0;35;40m')
GREEN="\[\033[0;32;40m\]"
#GREEN=$(print -P '\e[0;32;40m')
BRIGHTBLUE="\[\033[1;34;40m\]"
#BRIGHTBLUE=$(print -P '\e[1;34;40m')
BRIGHTYELLOW="\[\033[1;33;40m\]"
#BRIGHTYELLOW=$(print -P '\e[1;33;40m')
BRIGHTRED="\[\033[1;31;40m\]"
#BRIGHTRED=$(print -P '\e[1;31;40m')
BRIGHTWHITE="\[\033[1;37;40m\]"
#BRIGHTWHITE=$(print -P '\e[1;37;40m')
BRIGHTGREEN="\[\033[1;32;40m\]"
#BRIGHTGREEN=$(print -P '\e[1;32;40m')

# Find out if we are root
if [ $UID -eq 0 ] ; then
   # The # character serves as an extra reminder that I am root
   SYM='#'
else
   SYM='-'
fi

# Define the actual prompt
# This is split up for easier reading within this book
#P1="$GREEN$SYM$BRIGHTGREEN-$BRIGHTBLUE($WHITE\u$GREEN@$WHITE"
#P2="\h$BRIGHTBLUE)$BRIGHTGREEN-$BRIGHTBLUE($BRIGHTWHITE\w$BRIGHTBLUE"
#P3=")$BRIGHTGREEN-$GREEN$SYM$NORMAL\n$GREEN$SYM$BRIGHTGREEN-"
#P4="$BRIGHTBLUE($BRIGHTWHITE\$?$BRIGHTBLUE)$GREEN>$NORMAL "
#
#Yellow instead of Blue
#
#P1="$GREEN$SYM$BRIGHTGREEN-$BRIGHTYELLOW($WHITE\u$GREEN@$WHITE"
#P2="\h$BRIGHTYELLOW)$BRIGHTGREEN-$BRIGHTYELLOW($BRIGHTWHITE\w$BRIGHTYELLOW"
#P3=")$BRIGHTGREEN-$GREEN$SYM$NORMAL\n$GREEN$SYM$BRIGHTGREEN-"
#P4="$BRIGHTYELLOW($BRIGHTWHITE\$?$BRIGHTYELLOW)$GREEN>$NORMAL "
#
#Red instead of Blue
#
P1="$GREEN$SYM$BRIGHTGREEN-$BRIGHTRED($WHITE\u$GREEN@$WHITE"
P2="\h$BRIGHTRED)$BRIGHTGREEN-$BRIGHTRED($BRIGHTWHITE\w$BRIGHTRED"
P3=")$BRIGHTGREEN-$GREEN$SYM$NORMAL
$GREEN$SYM$BRIGHTGREEN-"
P4="$BRIGHTRED($BRIGHTWHITE\$?$BRIGHTRED)$GREEN>$NORMAL "
#
#Put PS1 Together
#
PS1="$P1$P2$P3$P4"

function whodat
{
        USER=$1
        grep $USER /etc/passwd | awk -F":" '{ print "User is: " $5}'
}

# Change the window title of X terminals
case $TERM in
   xterm*|eterm|Eterm|rxvt|aterm)
         #PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/$HOME/~}\007"'
         PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/$HOME/~}\007"'
                  ;;
    screen)
             PROMPT_COMMAND='echo -ne "\033_${USER}@${HOSTNAME%%.*}:${PWD/$HOME/~}\033\\"'
                                                      ;;
esac

PATH=/opt/local/bin:/opt/chef/embedded/bin:$PATH:~/bin/packer
