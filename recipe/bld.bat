
:: want lib prefix
copy %LIBRARY_PREFIX%\\lib\\blas.lib %LIBRARY_PREFIX%\\lib\\libblas.lib
copy %LIBRARY_PREFIX%\\lib\\lapack.lib %LIBRARY_PREFIX%\\lib\\liblapack.lib
if errorlevel 1 exit 1

"%PYTHON%" setup.py install --sundials-home=%LIBRARY_PREFIX% --blas-home=%LIBRARY_PREFIX%\lib --lapack-home=%LIBRARY_PREFIX%\lib --log=DEBUG --extra-fortran-link-flags="-lblas -llapack"
if errorlevel 1 exit 1

:: missing dlls
xcopy %SP_DIR%\assimulo\.libs\*.dll %SP_DIR%\assimulo\lib
if errorlevel 1 exit 1

