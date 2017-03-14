#!/bin/sh

if test `uname` = "Darwin"
then
  # copy instead of patching because of problematic line endings
  cp ${RECIPE_DIR}/assimulo.solvers.__init__.py assimulo/solvers/__init__.py
fi

${PYTHON} setup.py install --sundials-home=${PREFIX}
