#!/bin/sh

${PYTHON} setup.py install --sundials-home=${PREFIX} --extra-fortran-link-flags="-shared"
