
patch -p1 -i %RECIPE_DIR%/disable-fortran-extensions.patch --binary

"%PYTHON%" setup.py install --sundials-home=%LIBRARY_PREFIX%
if errorlevel 1 exit 1
