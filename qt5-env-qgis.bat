ECHO OFF

set OSGEO4W_ROOT=C:\OSGeo4W

if not exist "%OSGEO4W_ROOT%\bin\o4w_env.bat" (echo o4w_env.bat not found & goto error)
call "%OSGEO4W_ROOT%\bin\o4w_env.bat"
call "%OSGEO4W_ROOT%\bin\py3_env.bat"
call "%OSGEO4W_ROOT%\bin\qt5_env.bat"

set O4W_ROOT=%OSGEO4W_ROOT:\=/%
set LIB_DIR=%O4W_ROOT%

if not "%PROGRAMFILES(X86)%"=="" set PF86=%PROGRAMFILES(X86)%
if "%PF86%"=="" set PF86=%PROGRAMFILES%
if "%PF86%"=="" (echo PROGRAMFILES not set & goto error)

call "%PF86%\Microsoft Visual Studio 14.0\VC\vcvarsall.bat" x86
if exist "c:\Program Files\Microsoft SDKs\Windows\v7.1\Bin\SetEnv.Cmd" call "c:\Program Files\Microsoft SDKs\Windows\v7.1\Bin\SetEnv.Cmd" /x86 /Release
SET PATH=%PF86%\Microsoft Visual Studio 14.0\VC\bin;%~dp0;%path%
set CMAKE_COMPILER_PATH=%PF86%\Microsoft Visual Studio 14.0\VC\bin
set SETUPAPI_LIBRARY=c:\Program Files (x86)\Windows Kits\10\Lib\10.0.14393.0\um\x86\SetupAPI.Lib

set QT_PLUGIN_PATH=%OSGEO4W_ROOT%\apps\qgis-dev\qtplugins;"%OSGEO4W_ROOT%\apps\Qt5\plugins"

set PYTHONPATH=
SET PATH=%PATH%;F:\dev\build-tools\GnuWin32\bin;%PF86%\CMake\bin
set LIB=%PF86%\Microsoft Visual Studio 14.0\VC\lib;%PF86%\Windows Kits\10\Lib\10.0.10240.0\ucrt\x86;%PF86%\Windows Kits\10\Lib\10.0.10240.0\um\x86;%OSGEO4W_ROOT%\apps\Qt5\lib;%OSGEO4W_ROOT%\lib;%LIB%
set INCLUDE=%PF86%\VC\include;%PF86%\Windows Kits\10\Include\10.0.10240.0\ucrt;%OSGEO4W_ROOT%\apps\Qt5\include;%OSGEO4W_ROOT%\include;%INCLUDE%