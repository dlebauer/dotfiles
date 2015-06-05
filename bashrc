

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

# store all commands in history.txt
# http://software-carpentry.org/blog/2015/02/instructor-debriefing-2015-02-10.html#comment-1858667184
#export PROMPT_COMMAND="history 1 >> ~/history.txt"

# set command prompt
#PS1="[\u@\h:\W]\$ "
#PS1="\u \W\$ "
if [ -f /etc/bash_completion.d/git-prompt ]; then
   source /etc/bash_completion.d/git-prompt
   export PS1='\u@\h \W$(__git_ps1 "(%s)")\$ '
else 
   export PS1="[\u@\h:\W]\$ "
fi
# set default editor (-nw open in terminal)
EDITOR="emacs -nw"	
##############################################################################
# 02. Aliases                                                                #
##############################################################################
# Enable colors in "ls" command output

alias ls="ls -Glah"
alias emacs="emacs -nw"
#alias git-track-all="for remote in `git branch -r`; do git branch --track $remote; done"
