
rem force cython rebuild
del assimulo\*.c assimulo\solvers\*.c

%PYTHON% setup.py install --sundials-home=%LIBRARY_PREFIX% --no-msvcr True
if errorlevel 1 exit 1
