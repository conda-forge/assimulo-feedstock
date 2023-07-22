
git clone -b fix https://github.com/jschueller/superlu_mt.git
cmake -LAH -G "Ninja" -B build_slu -S superlu_mt ^
  -DCMAKE_PREFIX_PATH=%LIBRARY_PREFIX% ^
  -DCMAKE_INSTALL_PREFIX="%SRC_DIR:\=/%/install_slu" ^
  -DSUPERLUMT_INSTALL_INCLUDEDIR="%SRC_DIR:\=/%/install_slu/include" ^
  -DPLAT="_OPENMP" -DBUILD_SHARED_LIBS=OFF
cmake --build build_slu --target install --config Release

"%PYTHON%" setup.py install --sundials-home=%LIBRARY_PREFIX% --blas-home=%LIBRARY_PREFIX%\lib --lapack-home=%LIBRARY_PREFIX%\lib --superlu-home=%SRC_DIR%\install_slu
if errorlevel 1 exit 1

:: missing dlls
xcopy %SP_DIR%\assimulo\.libs\*.dll %SP_DIR%\assimulo\lib
if errorlevel 1 exit 1

