source ~/.bashrc
# User specific environment and startup programs

export PATH=$PATH:$HOME/bin:$HOME/.gem/ruby/2.0.0/bin 
#.gem/ruby from http://stackoverflow.com/a/18294746/199217
# gem install --user-install

# Set default R Library

export R_LIBS_USER=${HOME}/R/library

# MODULES

## Loading modules

for myhostname in "biocluster.igb.illinois.edu" "ebi-cluster.igb.illinois.edu"; do
    if [[ "$HOSTNAME" == $myhostname || "$PBS_O_HOST" == $myhostname ]] ; then
      module load libxml2/2.9.1 nco/4.4.8 netcdf/4.3.3.1 gdal/1.11.2 udunits/2.1.24 R/3.1.1 JAGS gsl emacs mpich
    fi
done

if [ "$HOSTNAME" ==  "ebi-forecast.igb.illinois.edu" ]; then
      module load netcdf/4.1.3 gdal/1.9.2 libxml2/2.9.1 udunits/2.1.24 R/3.1.0
fi

## for roger.ncsa.illinois.edu
if [[ "$HOSTNAME" ==  "cg-gpu01" ]] || [[ "$PBS_O_HOST" == "cg-gpu01" ]]; then
      module load zlib hdf5 netcdf4 udunits R libxml2 mpich
fi

## Mac

if [ "$TERM_PROGRAM" == "Apple_Terminal" ]; then
# if [ "$HOSTNAME" == "Davids-MacBook-Pro.local" ]; then
  export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/9.4/bin
  export DYLD_FALLBACK_LIBRARY_PATH=$HOME/anaconda/lib/:$DYLD_FALLBACK_LIBRARY_PATH
  # added by Anaconda 2.3.0 installer
  export PATH="/Users/dlebauer/anaconda/bin:$PATH"
fi


