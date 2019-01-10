
rem eol endings errors with recent conda build
patch -p1 -i %RECIPE_DIR%/disable-fortran-extensions.patch --binary
if errorlevel 1 exit 1

rem force cython rebuild
del assimulo\*.c assimulo\solvers\*.c

"%PYTHON%" setup.py install --sundials-home=%LIBRARY_PREFIX%
if errorlevel 1 exit 1
