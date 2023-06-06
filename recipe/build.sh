#!/bin/sh

# local superlu install
curl -fSsL https://portal.nersc.gov/project/sparse/superlu/superlu_mt_3.1.tar.gz | tar xz
cd SuperLU_MT_3.1
if test `uname` = "Linux"
then
  MPLIB="-fopenmp"
fi
make CC=${CC} CFLAGS="-O2 -fPIC ${MPLIB}" BLASLIB="-lblas" PLAT="_OPENMP" MPLIB=${MPLIB} lib -j1
mv SRC include
cd -

${PYTHON} setup.py install --sundials-home=${PREFIX} --blas-home=${PREFIX}/lib --lapack-home=${PREFIX}/lib --extra-fortran-compile-flags="-fallow-argument-mismatch" --superlu-home=${PWD}/SuperLU_MT_3.1
