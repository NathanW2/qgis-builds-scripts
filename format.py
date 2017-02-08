data = """
-DCMAKE_BUILD_TYPE=RelWithDebInfo ^
-DPYTHON_EXECUTABLE="%PY3%\python.exe" ^
-DWITH_BINDINGS=FALSE ^
-DWITH_INTERNAL_QWTPOLAR=TRUE ^
-DQCA_LIBRARY="c:\dev\qca\buildNinjaQt5\lib\qca-qt5d.lib" ^
-DQCA_INCLUDE_DIR="c:\dev\qca\include\QtCrypto" ^
-DQWT_INCLUDE_DIR="F:\dev\qgis\qwt-6.1.3\src" ^
-DQWT_LIBRARY="F:\dev\qgis\qwt-6.1.3\lib\qwt.lib" ^
-DQSCINTILLA_LIBRARY="f:\dev\qgis\QScintilla_gpl-2.9.3\QScintilla_gpl-2.9.3\Qt4Qt5\release\qscintilla2.lib" ^
-DQSCINTILLA_INCLUDE_DIR="f:\dev\qgis\QScintilla_gpl-2.9.3\QScintilla_gpl-2.9.3\Qt4Qt5" ^
-DSPATIALITE_LIBRARY="%OSGEO4W_ROOT%/lib/spatialite_i.lib" ^
-DSPATIALINDEX_LIBRARY="%OSGEO4W_ROOT%\lib\spatialindex-64.lib" ^
-DWITH_GRASS=FALSE ^
-DWITH_GRASS7=FALSE ^
-DWITH_QTWEBKIT=FALSE ^
-DENABLE_TESTS=FALSE ^
-DPROJ_LIBRARY="%OSGEO4W_ROOT%/lib/proj_i.lib"
"""

jsond = []
import pprint

for line in data.split(r"^"):
	data = line.split("=")
	name = data[0][3:]
	value = data[1].replace(r"\\", r"\\\\")
	jsond.append(dict(name=name, value=value))

pprint.pprint(jsond)