

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

##############################################################################
# 02. Aliases                                                                #
##############################################################################
# Enable colors in "ls" command output
alias ls="ls -Glah"
alias git-track-all="for remote in `git branch -r`; do git branch --track $remote; done"

export R_LIBS_USER=~/R/library
