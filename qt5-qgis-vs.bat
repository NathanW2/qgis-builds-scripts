REM @echo off

ECHO Setting up QGIS DEV ENV

ECHO OFF

set OSGEO4W_ROOT=C:\OSGeo4W64

SET QTBASE=C:\Qt\
SET QTROOT=%QTBASE%\5.7\msvc2015_64

call "%OSGEO4W_ROOT%\bin\o4w_env.bat"

SET PY3=C:\Python35_64
SET PYTHONHOME=%PY3%

SET PATH=F:\dev\build-tools\GnuWin32\bin;%QTBASE%\Tools\QtCreator\bin;%QTROOT%\bin;C:\dev;C:\Program Files\doxygen;C:\Program Files (x86)\CMake\bin;%PATH%
SET PATH=%PY3%;%PY3%\Scripts;F:\dev\qgis\qwt-6.1.3\lib;F:\dev\qgis\QScintilla_gpl-2.9.3\QScintilla_gpl-2.9.3\Qt4Qt5\release;C:\dev\qca;%PATH%
ECHO %PATH%

SET QT_PLUGIN_PATH=%QTROOT%\plugins;
SET QTINCLUDE=%QTROOT%\include
SET QTBIN=%QTROOT%\bin
SET QTLIB=%QTROOT%\lib

set LIB=%LIB%;%QTLIB%;%OSGEO4W_ROOT%\lib;%PROGRAMFILES%\Microsoft SDKs\Windows\v7.1\lib
set INCLUDE=%INCLUDE%;%QTROOT%\include;%OSGEO4W_ROOT%\include

start "Qt Creator" /B "C:\Program Files (x86)\Microsoft Visual Studio\2017\Community\Common7\IDE\devenv.exe" %*