
"%PYTHON%" setup.py install --sundials-home=%LIBRARY_PREFIX% --blas-home=%LIBRARY_PREFIX%\lib --lapack-home=%LIBRARY_PREFIX%\lib
if errorlevel 1 exit 1

:: missing dlls
xcopy %SP_DIR%\assimulo\.libs\*.dll %SP_DIR%\assimulo\lib
if errorlevel 1 exit 1

