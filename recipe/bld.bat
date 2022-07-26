
"%PYTHON%" setup.py install --sundials-home=%LIBRARY_PREFIX% --blas-home=%LIBRARY_PREFIX%\lib --lapack-home=%LIBRARY_PREFIX%\lib
if errorlevel 1 exit 1

