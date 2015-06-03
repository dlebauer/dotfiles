# User specific environment and startup programs

export PATH=$PATH:$HOME/bin

# Set default R Library

export R_LIBS_USER=${HOME}/R/library

# MODULES

## clear defaults

module purge

## Loading modules

for myhostname in "biocluster.igb.illinois.edu" "ebi-cluster.igb.illinois.edu"; do
    if [[ "$HOSTNAME" == $myhostname || "$PBS_O_HOST" == $myhostname ]] ; then
      module load nco/4.4.8 netcdf/4.3.3.1 gdal/1.11.2 udunits/2.1.24 R/3.1.1 JAGS gsl emacs
    fi
done

if [ "$HOSTNAME" ==  "ebi-forecast.igb.illinois.edu" ]; then
      module load netcdf/4.1.3 gdal/1.9.2 udunits/2.1.24 R/3.1.0
fi

## for roger.ncsa.illinois.edu
if [[ "$HOSTNAME" ==  "cg-gpu01" ]] || [[ "$PBS_O_HOST" == "cg-gpu01" ]]; then
      module load zlib hdf5 netcdf4 udunits R libxml2
fi