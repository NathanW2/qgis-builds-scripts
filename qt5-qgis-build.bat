@ECHO OFF
CALL %~dp0qt5-env-qgis.bat

set GRASS_VERSION=6.4.4
set GRASS_PREFIX=%O4W_ROOT%/apps/grass/grass-%GRASS_VERSION%

SET BUILDDIR=buildqt5ninja

cd qgis
if not exist %BUILDDIR% mkdir %BUILDDIR%
cd %BUILDDIR%

set BUILDCONF=Release

del CMakeCache.txt

ninja --version

set CMAKE_OPT=^
	-D SIP_BINARY_PATH=%O4W_ROOT%/apps/Python36/sip.exe ^
	-D CMAKE_CXX_FLAGS_RELWITHDEBINFO="/MD /ZI /MP /Od /D NDEBUG /D QGISDEBUG" ^
	-D CMAKE_PDB_OUTPUT_DIRECTORY_RELWITHDEBINFO=%BUILDDIR%\apps\%PACKAGENAME%\pdb ^
	-D SPATIALINDEX_LIBRARY=%O4W_ROOT%/lib/spatialindex_i.lib

ECHO Running CMake..
cmake -G Ninja ^
	-D CMAKE_CXX_COMPILER="%CMAKE_COMPILER_PATH:\=/%/cl.exe" ^
	-D CMAKE_C_COMPILER="%CMAKE_COMPILER_PATH:\=/%/cl.exe" ^
	-D CMAKE_LINKER="%CMAKE_COMPILER_PATH:\=/%/link.exe" ^
	-D PEDANTIC=TRUE ^
	-D WITH_QSPATIALITE=TRUE ^
	-D WITH_SERVER=TRUE ^
	-D SERVER_SKIP_ECW=TRUE ^
	-D WITH_GRASS=TRUE ^
	-D WITH_GRASS6=FALSE ^
	-D WITH_GRASS7=FALSE ^
	-D WITH_GLOBE=FALSE ^
	-D WITH_TOUCH=TRUE ^
	-D WITH_ORACLE=FALSE ^
	-D WITH_QTWEBKIT=FALSE ^
	-D WITH_CUSTOM_WIDGETS=TRUE ^
	-D CMAKE_CXX_FLAGS_RELEASE="/MD /MP /O2 /Ob2 /D NDEBUG" ^
	-D CMAKE_BUILD_TYPE=%BUILDCONF% ^
	-D CMAKE_CONFIGURATION_TYPES=%BUILDCONF% ^
	-D GEOS_LIBRARY=%O4W_ROOT%/lib/geos_c.lib ^
	-D SQLITE3_LIBRARY=%O4W_ROOT%/lib/sqlite3_i.lib ^
	-D SPATIALITE_LIBRARY=%O4W_ROOT%/lib/spatialite_i.lib ^
	-D PYTHON_EXECUTABLE=%O4W_ROOT%/bin/python3.exe ^
	-D PYTHON_INCLUDE_PATH=%O4W_ROOT%/apps/Python36/include ^
	-D PYTHON_LIBRARY=%O4W_ROOT%/apps/Python36/libs/python36.lib ^
	-D QT_BINARY_DIR=%O4W_ROOT%/bin ^
	-D QT_LIBRARY_DIR=%O4W_ROOT%/lib ^
	-D QT_HEADERS_DIR=%O4W_ROOT%/apps/qt5/include ^
	-D FCGI_INCLUDE_DIR=%O4W_ROOT%/include ^
	-D FCGI_LIBRARY=%O4W_ROOT%/lib/libfcgi.lib ^
	-D WITH_INTERNAL_JINJA2=FALSE ^
	-D WITH_INTERNAL_MARKUPSAFE=FALSE ^
	-D WITH_INTERNAL_PYGMENTS=FALSE ^
	-D WITH_INTERNAL_REQUESTS=FALSE ^
	-D WITH_INTERNAL_DATEUTIL=FALSE ^
	-D WITH_INTERNAL_PYTZ=FALSE ^
	-D WITH_INTERNAL_SIX=FALSE ^
	-D WITH_INTERNAL_NOSE2=FALSE ^
	-D WITH_INTERNAL_MOCK=FALSE ^
	-D WITH_INTERNAL_HTTPLIB2=FALSE ^
	-D WITH_INTERNAL_FUTURE=FALSE ^
	-D QCA_INCLUDE_DIR=%OSGEO4W_ROOT%\apps\Qt5\include\QtCrypto ^
	-D QCA_LIBRARY=%OSGEO4W_ROOT%\apps\Qt5\lib\qca-qt5.lib ^
	-D QSCINTILLA_LIBRARY=%OSGEO4W_ROOT%\apps\Qt5\lib\qscintilla2.lib ^
	-D SUPPRESS_SIP_WARNINGS=TRUE ^
	%CMAKE_OPT% ^
	..
  
if errorlevel 1 goto error

Echo Builing...
REM ninja clean
ninja

if errorlevel 1 goto error

cd ..

:error

cd ..\..

ECHO %PATH%
pause

:END
pause