

##############################################################################
#   Filename: .bashrc                                                        #
#                                                                            #
# Sections:                                                                  #
#   01. General ................. General Bash behavior                      #
#   02. Aliases ................. Aliases                                    #
#   03. Theme/Colors ............ Colors, prompts, fonts, etc.               #
##############################################################################

##############################################################################
# 01. General                                                                #
##############################################################################

export R_LIBS_USER=${HOME}/R/library

# store all commands in history.txt
# http://software-carpentry.org/blog/2015/02/instructor-debriefing-2015-02-10.html#comment-1858667184

export PROMPT_COMMAND="history 1 >> ~/history.txt"

# set command prompt
#PS1="[\u@\h:\W]\$ "
#PS1="\u \W\$ "
source /etc/bash_completion.d/git-prompt
export PS1='\u \W$(__git_ps1 "(%s)")\$ '
# set default editor (-nw open in terminal)
EDITOR="emacs -nw"	
##############################################################################
# 02. Aliases                                                                #
##############################################################################
# Enable colors in "ls" command output

alias ls="ls -Glah"
alias e="emacs -nw"
#alias git-track-all="for remote in `git branch -r`; do git branch --track $remote; done"

# added by Anaconda 2.1.0 installer
export PATH="/home/dlebauer/anaconda/bin:$PATH"
