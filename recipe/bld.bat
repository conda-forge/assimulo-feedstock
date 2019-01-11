
rem force cython rebuild
del assimulo\*.c assimulo\solvers\*.c

set CC=mingw32

%PYTHON% setup.py install --sundials-home=%LIBRARY_PREFIX% --no-msvcr True
if errorlevel 1 exit 1
