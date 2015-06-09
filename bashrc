

##############################################################################
#   Filename: .bashrc                                                        #
#                                                                            #
# Sections:                                                                  #
#   01. General ................. General Bash behavior                      #
#   02. Aliases ................. Aliases                                    #
#   03. Module loading ........... For HPC systems with Modules package      #
##############################################################################

##############################################################################
# 01. General                                                                #
##############################################################################

export R_LIBS_USER=${HOME}/R/library

# store all commands in history.txt
# http://software-carpentry.org/blog/2015/02/instructor-debriefing-2015-02-10.html#comment-1858667184

#export PROMPT_COMMAND="history 1 >> ~/history.txt"

# Set terminal title to hostname: /file/path http://stackoverflow.com/a/10517239/199217

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

export R_LIBS_USER=~/R/library


##############################################################################
# 03. Servers with Modules
##############################################################################
for myhostname in "biocluster.igb.illinois.edu" "ebi-cluster.igb.illinois.edu"; do
    if [ "$HOSTNAME" == $myhostname ]; then
      module load nco/4.4.8
      module load netcdf/4.3.3.1
      module load parallel-netcdf/1.4.1
      module load gdal/1.11.2
      module load udunits/2.1.24
      module load R/3.1.1
      module load JAGS
      module load gsl
      module load emacs
    fi
done

if [ "$HOSTNAME" ==  "ebi-forecast.igb.illinois.edu" ]; then
      module load netcdf/4.1.3
      module load gdal/1.9.2
      module load udunits/2.1.24
      module load R/3.1.0
fi