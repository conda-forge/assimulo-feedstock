#!/bin/sh

${PYTHON} setup.py install --sundials-home=${PREFIX} --blas-home=${PREFIX}/lib --lapack-home=${PREFIX}/lib --extra-fortran-compile-flags="-fallow-argument-mismatch"
