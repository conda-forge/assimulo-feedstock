
rem eol endings errors with recent conda build
patch -p1 -i %RECIPE_DIR%/disable-fortran-extensions.patch --binary
if errorlevel 1 exit 1


patch -p0 -i %RECIPE_DIR%/r831.patch --binary
if errorlevel 1 exit 1
patch -p0 -i %RECIPE_DIR%/r833.patch --binary
if errorlevel 1 exit 1
patch -p0 -i %RECIPE_DIR%/r836.patch --binary
if errorlevel 1 exit 1
patch -p0 -i %RECIPE_DIR%/r837.patch --binary
if errorlevel 1 exit 1
patch -p0 -i %RECIPE_DIR%/r838.patch --binary
if errorlevel 1 exit 1
patch -p0 -i %RECIPE_DIR%/r839.patch --binary
if errorlevel 1 exit 1
patch -p0 -i %RECIPE_DIR%/r840.patch --binary
if errorlevel 1 exit 1
patch -p0 -i %RECIPE_DIR%/r841.patch --binary
if errorlevel 1 exit 1
patch -p0 -i %RECIPE_DIR%/r845.patch --binary
if errorlevel 1 exit 1


"%PYTHON%" setup.py install --sundials-home=%LIBRARY_PREFIX%
if errorlevel 1 exit 1
