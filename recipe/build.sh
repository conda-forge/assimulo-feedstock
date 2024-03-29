#!/bin/sh

# local superlu install
git clone --depth 1 https://github.com/xiaoyeli/superlu_mt.git
cmake -LAH -G "Ninja" -B build_slu -S superlu_mt \
  -DCMAKE_PREFIX_PATH=${PREFIX} \
  -DCMAKE_INSTALL_PREFIX=${SRC_DIR}/install_slu \
  -DCMAKE_INSTALL_LIBDIR=${SRC_DIR}/install_slu/lib \
  -DSUPERLUMT_INSTALL_INCLUDEDIR=${SRC_DIR}/install_slu/include \
  -DPLAT="_OPENMP" -DBUILD_SHARED_LIBS=OFF
cmake --build build_slu --target install

# some logs are missing
sed -i.bak 's|L.warning|print|g' setup.py
sed -i.bak 's|L.debug|print|g' setup.py

${PYTHON} setup.py install --sundials-home=${PREFIX} --blas-home=${PREFIX}/lib --lapack-home=${PREFIX}/lib --extra-fortran-compile-flags="-fallow-argument-mismatch" --superlu-home=${SRC_DIR}/install_slu
