
rem eol endings errors with recent conda build
rem patch -p1 -i %RECIPE_DIR%/disable-fortran-extensions.patch --binary
rem if errorlevel 1 exit 1

set CFG=%USERPROFILE%\pydistutils.cfg
echo [config] > "%CFG%"
echo compiler=mingw32 >> "%CFG%"
echo [build] >> "%CFG%"
echo compiler=mingw32 >> "%CFG%"
echo [build_ext] >> "%CFG%"
echo compiler=mingw32 >> "%CFG%"

rem force cython rebuild
del assimulo\*.c assimulo\solvers\*.c

"%PYTHON%" setup.py install --sundials-home=%LIBRARY_PREFIX%
if errorlevel 1 exit 1
