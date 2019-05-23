##############################################################################
#   Filename: .bashrc                                                        #
#                                                                            #
# Sections:                                                                  #
#   01. General ................. General Bash behavior                      #
#   02. Aliases ................. Aliases                                    #
##############################################################################

##############################################################################
# 01. General                                                                #
##############################################################################
# set history to infinite
export HISTTIMEFORMAT="%y-%m-%d %T "
export HISTSIZE=
export HISTFILESIZE=

# store all commands in history.txt
# http://software-carpentry.org/blog/2015/02/instructor-debriefing-2015-02-10.html#comment-1858667184
#export PROMPT_COMMAND="history 1 >> ~/history.txt"

# Set terminal title to hostname: /file/path 
# http://stackoverflow.com/a/10517239/199217

export PROMPT_COMMAND='echo -ne "\033]0;${HOSTNAME}: ${PWD}\007"'

# set command prompt
#PS1="[\u@\h:\W]\$ "
#PS1="\u \W\$ "
if [ -f /etc/bash_completion.d/git-prompt ]; then
   source /etc/bash_completion.d/git-prompt
   export PS1='\W$(__git_ps1 "(%s)")\$ '
else 
   export PS1="[\W]\$ "
fi

# set default editor (-nw open in terminal)
EDITOR="\emacs -nw"

# use rbenv to install gems locally
#if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

##############################################################################
# 02. Aliases                                                                #
##############################################################################
# Enable colors in "ls" command output

alias ls="ls -Glah"
if [ "$TERM_PROGRAM" == "Apple_Terminal" ]
then
   alias emacs="/Applications/Emacs.app/Contents/MacOS/Emacs"
else
   alias emacs="emacs -nw"
fi

