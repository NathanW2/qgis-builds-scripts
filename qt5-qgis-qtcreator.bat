REM @echo off

ECHO Setting up QGIS DEV ENV

CALL %~dp0qt5-env-qgis.bat

start "Qt Creator" /B "C:\Qt\Tools\QtCreator\bin\qtcreator.exe" %*