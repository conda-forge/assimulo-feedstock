
copy %RECIPE_DIR%\assimulo.solvers.__init__.py assimulo\solvers\__init__.py

"%PYTHON%" setup.py install --sundials-home=%LIBRARY_PREFIX%
if errorlevel 1 exit 1
