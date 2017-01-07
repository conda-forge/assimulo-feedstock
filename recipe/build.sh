#!/bin/sh

PY_LIB=`find $PREFIX/lib -name libpython${PY_VER}*${SHLIB_EXT}`

$PYTHON setup.py build --extra-fortran-link-flags="${PY_LIB}"

$PYTHON setup.py install --extra-fortran-link-flags="${PY_LIB}"
