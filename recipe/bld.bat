
rem eol endings errors with recent conda build
patch -p1 -i %RECIPE_DIR%/disable-fortran-extensions.patch --binary
if errorlevel 1 exit 1

"%PYTHON%" setup.py install --sundials-home=%LIBRARY_PREFIX%
if errorlevel 1 exit 1
