
:: sundials 5.x support
git config --global user.email "you@example.com" && git config --global user.name "Your Name"
git cherry-pick 6126688246d28775d11bf74039f91c7066b8de04
if errorlevel 1 exit 1

"%PYTHON%" setup.py install --sundials-home=%LIBRARY_PREFIX% --blas-home=%LIBRARY_PREFIX%\lib --lapack-home=%LIBRARY_PREFIX%\lib
if errorlevel 1 exit 1

:: missing dlls
xcopy %SP_DIR%\Assimulo-%PKG_VERSION%-py%PY_VER%-win-amd64.egg\assimulo\.libs\*.dll %SP_DIR%\Assimulo-%PKG_VERSION%-py%PY_VER%-win-amd64.egg\assimulo\lib
if errorlevel 1 exit 1
