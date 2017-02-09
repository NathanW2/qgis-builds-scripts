REM @echo off

ECHO Setting up QGIS DEV ENV

CALL %~dp0qt5-env-qgis.bat

set QT_PLUGIN_PATH=C:\Qt\Tools\QtCreator\bin\plugins;%QT_PLUGIN_PATH%
start "Qt Creator" /B "C:\Qt\Tools\QtCreator\bin\qtcreator.exe" %*