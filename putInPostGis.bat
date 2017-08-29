c:
@echo off
@echo Setting environment for using the GDAL Utilities.
set SDK_ROOT=%~dp0
set SDK_ROOT=%SDK_ROOT:\\=\%
SET "PATH=%SDK_ROOT%;%PATH%"
SET "GDAL_DATA=%SDK_ROOT%gdal-data"
SET "GDAL_DRIVER_PATH=%SDK_ROOT%gdalplugins"
SET "PROJ_LIB=%SDK_ROOT%projlib"
SET "PYTHONPATH=%SDK_ROOT%python"
setlocal
:PROMPT
SET /P AREYOUSURE=Load data into PostGIS (Y/[N])?
IF /I "%AREYOUSURE%" NEQ "Y" GOTO END

@echo on
cd\project\Shape Retrieval 3.0
ogr2ogr -f "PostgreSQL" "PG:host=localhost dbname=testdoc user=postgres password=postgres" "building_lines.geojson" -nln nyc_building_lines 
ogr2ogr -f "PostgreSQL" "PG:host=localhost dbname=testdoc user=postgres password=postgres" "building_multipolygons.geojson" -nln nyc_building_poly
ogr2ogr -f "PostgreSQL" "PG:host=localhost dbname=testdoc user=postgres password=postgres" "part_lines.geojson" -nln nyc_part_lines 
ogr2ogr -f "PostgreSQL" "PG:host=localhost dbname=testdoc user=postgres password=postgres" "part_multipolygons.geojson" -nln nyc_part_poly

:END
PAUSE
endlocal