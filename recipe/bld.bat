
:: local superlu install
git clone -b v4.0.1 --depth 1 https://github.com/xiaoyeli/superlu_mt.git
cmake -LAH -G "Ninja" -B build_slu -S superlu_mt ^
  -DCMAKE_PREFIX_PATH=%LIBRARY_PREFIX:\=/% ^
  -DCMAKE_INSTALL_PREFIX="%SRC_DIR:\=/%/install_slu" ^
  -DSUPERLUMT_INSTALL_INCLUDEDIR="%SRC_DIR:\=/%/install_slu/include" ^
  -DPLAT="_OPENMP" -DBUILD_SHARED_LIBS=OFF -Denable_tests=OFF -Denable_examples=OFF
cmake --build build_slu --target install

rem  "%PYTHON%" setup.py install --sundials-home=%LIBRARY_PREFIX% --blas-home=%LIBRARY_PREFIX%\lib --lapack-home=%LIBRARY_PREFIX%\lib --superlu-home=%SRC_DIR%\install_slu
rem  if errorlevel 1 exit 1
rem  
rem  :: missing dlls
rem  xcopy %SP_DIR%\assimulo\.libs\*.dll %SP_DIR%\assimulo\lib
rem  if errorlevel 1 exit 1

git clone -b skbuild https://github.com/jschueller/Assimulo.git
cmake -LAH -G "Ninja" -B build -S Assimulo ^
  -DCMAKE_PREFIX_PATH=%LIBRARY_PREFIX:\=/% ^
  -DCMAKE_INSTALL_PATH=%LIBRARY_PREFIX:\=/% ^
  -DCMAKE_EXE_LINKER_FLAGS="" ^
  -DPYTHON_SITE_PACKAGE=%SP_DIR:\=/% ^
  -DSUPERLUMT_LIBRARY=%SRC_DIR:\=/%/install_slu/lib/superlu_mt_OPENMP.lib ^
  -DSUPERLUMT_INCLUDE_DIR=%SRC_DIR:\=/%/install_slu/include
cmake --build build --target install

