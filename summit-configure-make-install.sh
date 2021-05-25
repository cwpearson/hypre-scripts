#!/bin/bash

#use this script to configure and build hypre on summit

set -eou pipefail

# when you build hypre examples, you should load these as well
module load cuda
module load gcc

set -x

#first, clone into this directory
# git clone git@github.com:hypre-space/hypre.git
# git checkout v2.19.0 
HYPRE_DIR=$HOME/AMG/hypre
INSTALL_DIR=$HOME/AMG

cd $HYPRE_DIR

# find the CUDA directory
NVCC=`which nvcc`
NVCC=`dirname $NVCC`
export CUDA_HOME=$NVCC/..
export HYPRE_CUDA_SM=70


cd $HYPRE_DIR/src
./configure \
  --prefix=$INSTALL_DIR\
  --with-cuda \
  --with-MPI \
  --enable-gpu-aware-mpi \
  --enable-shared \
  --enable-unified-memory \
  CC=mpicc CXX=mpicxx

nice -n20 make -j `nproc` install

