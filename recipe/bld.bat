
:: sundials 5.x support
git config --global user.email "you@example.com" && git config --global user.name "Your Name"
git remote add js https://github.com/jschueller/Assimulo.git && git fetch js && git cherry-pick 0b07e2fd9f3810fe5ab72e477907e4b50618c1f3
if errorlevel 1 exit 1

"%PYTHON%" setup.py install --sundials-home=%LIBRARY_PREFIX% --blas-home=%LIBRARY_PREFIX%\lib --lapack-home=%LIBRARY_PREFIX%\lib
if errorlevel 1 exit 1

:: missing dlls
xcopy %SP_DIR%\Assimulo-%PKG_VERSION%-py%PY_VER%-win-amd64.egg\assimulo\.libs\*.dll %SP_DIR%\Assimulo-%PKG_VERSION%-py%PY_VER%-win-amd64.egg\assimulo\lib
if errorlevel 1 exit 1
