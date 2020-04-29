
rem patch -p1 -i %RECIPE_DIR%/sundials5.patch --binary
git config --global user.email "you@example.com"
git config --global user.name "Your Name"
git remote add js https://github.com/jschueller/Assimulo.git && git fetch js && git cherry-pick 0b07e2fd9f3810fe5ab72e477907e4b50618c1f3
rem f613fd2639c52c94c4ad14e7402fb8b4543dd6fe
if errorlevel 1 exit 1

rem eol endings errors with recent conda build
rem patch -p1 -i %RECIPE_DIR%/disable-fortran-extensions.patch --binary
if errorlevel 1 exit 1



"%PYTHON%" setup.py install --sundials-home=%LIBRARY_PREFIX%
if errorlevel 1 exit 1

dir /p %PREFIX%
dir /p %SP_DIR%
dir /p %SP_DIR%\Assimulo-3.2-py3.7-win-amd64.egg
if errorlevel 1 exit 1

