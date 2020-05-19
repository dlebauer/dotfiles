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

# Set terminal title to hostname: /file/path 
# http://stackoverflow.com/a/10517239/199217

export PROMPT_COMMAND='echo -ne "\033]0;${HOSTNAME}: ${PWD}\007"'


# set default editor (-nw open in terminal)
EDITOR="\emacs -nw"

# use rbenv to install gems locally
#if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

##############################################################################
# 02. Aliases                                                                #
##############################################################################
# Enable colors in "ls" command output

alias ls="ls -Glah"
alias dprune="docker image ls | awk '\$1 == \"<none>\" && \$2 == \"<none>\" {print $3}' | xargs docker image rm -f"

if [ "$TERM_PROGRAM" == "Apple_Terminal" ]
then
   alias emacs="/Applications/Emacs.app/Contents/MacOS/Emacs"
   alias e="emacs -nw"
else
   alias e="emacs -nw"
fi

