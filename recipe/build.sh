#!/bin/sh

if test `uname` = "Darwin"
then
  ${PYTHON} setup.py install --sundials-home=${PREFIX} --blas-home=${PREFIX}/lib --lapack-home=${PREFIX}/lib
else
  ${PYTHON} setup.py install --sundials-home=${PREFIX} --blas-home=${PREFIX}/lib --lapack-home=${PREFIX}/lib --extra-fortran-compile-flags="-fallow-argument-mismatch"
fi

