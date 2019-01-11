#!/bin/sh

${PYTHON} setup.py install --sundials-home=${PREFIX} --blas-home=${PREFIX}/lib --blas-name=openblas --lapack-home=${PREFIX}/lib
