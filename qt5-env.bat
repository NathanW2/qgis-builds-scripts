CALL "C:\Qt\5.2.1\msvc2010\bin\qtenv2.bat"

if not "%PROGRAMFILES(X86)%"=="" set PF86=%PROGRAMFILES(X86)%
if "%PF86%"=="" set PF86=%PROGRAMFILES%
if "%PF86%"=="" (echo PROGRAMFILES not set & goto error)

call "%PF86%\Microsoft Visual Studio 14.0\VC\vcvarsall.bat" x86

cd %~dp0

cmd
