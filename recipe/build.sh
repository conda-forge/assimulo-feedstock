#!/bin/sh

# local superlu install
git clone -b v4.0.1 --depth 1 https://github.com/xiaoyeli/superlu_mt.git
cmake -LAH -G "Ninja" -B build_slu -S superlu_mt \
  -DCMAKE_PREFIX_PATH=${PREFIX} \
  -DCMAKE_INSTALL_PREFIX=${SRC_DIR}/install_slu \
  -DCMAKE_INSTALL_LIBDIR=${SRC_DIR}/install_slu/lib \
  -DSUPERLUMT_INSTALL_INCLUDEDIR=${SRC_DIR}/install_slu/include \
  -DPLAT="_OPENMP" -DBUILD_SHARED_LIBS=OFF -Denable_tests=OFF -Denable_examples=OFF
cmake --build build_slu --target install

# some logs are missing
sed -i.bak 's|L.warning|print|g' setup.py
sed -i.bak 's|L.debug|print|g' setup.py

# python setup.py install fails on osx so build wheel first
${PYTHON} setup.py bdist_wheel --sundials-home=${PREFIX} --blas-home=${PREFIX}/lib --lapack-home=${PREFIX}/lib --superlu-home=${SRC_DIR}/install_slu
${PYTHON} -m pip install build/dist/*.whl --no-deps -vv
