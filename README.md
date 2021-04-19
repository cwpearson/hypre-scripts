# hypre-scripts

Hypre's CMake does not support CUDA yet, so we gotta use `configure`.

# Summit

Edit `configure-summit.sh` to choose the install directory.

## Building examples

Haven't figure out how to do this yet with CUDA.

Edit `hypre/src/examples/Makefile` to be consistent with the configure

* MPICC=nvcc -ccbin=mpixlC
* remove `-Wall` from `COPTS`
