source ~/.bashrc

# Set default R Library

export R_LIBS_USER=${HOME}/R/library

# MODULES

## Loading modules

for myhostname in "biocluster.igb.illinois.edu" "ebi-cluster.igb.illinois.edu"; do
    if [[ "$HOSTNAME" == $myhostname || "$PBS_O_HOST" == $myhostname ]] ; then
      module load libxml2/2.9.1 nco/4.4.8 netcdf/4.3.3.1 gdal/1.11.2 udunits/2.1.24 R/3.1.1 JAGS gsl emacs mpich
    fi
done

## Macbook

if [ "$TERM_PROGRAM" == "Apple_Terminal" ]; then
# if [ "$HOSTNAME" == "Davids-MacBook-Pro.local" ]; then
  export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/9.4/bin
  export DYLD_FALLBACK_LIBRARY_PATH=$HOME/anaconda/lib/:$DYLD_FALLBACK_LIBRARY_PATH
  # for pyenv https://github.com/pyenv/pyenv#basic-github-checkout
  eval "$(pyenv init -)"
  pyenv global 3.5.2
  export JAVA_HOME="$(/usr/libexec/java_home)"
fi


# colors
PS1='\w\[\033[0;32m\]$( git branch 2> /dev/null | cut -f2 -d\* -s | sed "s/^ / [/" | sed "s/$/]/" )\[\033[0m\] \$ '

# Tell grep to highlight matches
export GREP_OPTIONS='--color=auto'

# Tell ls to be colourful
export CLICOLOR=1
export LSCOLORS=Exfxcxdxbxegedabagacad

if [ "$TERM_PROGRAM" == "Apple_Terminal" ]; then
  # >>> conda initialize >>>
  # !! Contents within this block are managed by 'conda init' !!
  __conda_setup="$('/usr/local/Caskroom/miniconda/base/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
  if [ $? -eq 0 ]; then
      eval "$__conda_setup"
  else
      if [ -f "/usr/local/Caskroom/miniconda/base/etc/profile.d/conda.sh" ]; then
          . "/usr/local/Caskroom/miniconda/base/etc/profile.d/conda.sh"
      else
          export PATH="/usr/local/Caskroom/miniconda/base/bin:$PATH"
      fi
  fi
  unset __conda_setup
  # <<< conda initialize <<<
fi

