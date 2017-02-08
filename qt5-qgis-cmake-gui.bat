@echo off

CALL %~dp0qgis-build-env.bat

start "CMake GUI" /B cmake-gui.exe
