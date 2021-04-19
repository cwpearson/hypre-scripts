#!/bin/bash

#use this script to configure and build hypre on summit

set -eou pipefail

module load cuda

set -x

#first, clone into this directory
# git clone git@github.com:hypre-space/hypre.git $HYPRE_DIR
HYPRE_DIR=$HOME/repos/hypre

# we'll use v2.22.0
cd $HYPRE_DIR
git checkout v2.20.0 #sep 24, 2020

# find the CUDA directory
NVCC=`which nvcc`
NVCC=`dirname $NVCC`
export CUDA_HOME=$NVCC/..
export HYPRE_CUDA_SM=70

export BUILD_DIR=$HOME/hypre

cd $HYPRE_DIR/src
./configure \
  --prefix=$BUILD_DIR\
  --with-cuda \
  --enable-gpu-aware-mpi

nice -n20 make -j `nproc` install

