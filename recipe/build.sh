#!/bin/sh

${PYTHON} setup.py install --sundials-home=${PREFIX} --extra-fortran-link-flags="-shared" --blas-home=${PREFIX}/lib --blas-name="openblas" --lapack-home=${PREFIX}/lib
