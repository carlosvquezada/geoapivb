c:
cd\Program Files\GDAL
CALL GDALShell.bat
cd\project\Shape Retrieval 3.0
ogr2ogr -f "PostgreSQL" "PG:host=localhost dbname=gis user=postgres password=postgres" "building_lines.geojson" -nln manhattan_building_lines 
ogr2ogr -f "PostgreSQL" "PG:host=localhost dbname=gis user=postgres password=postgres" "building_multipolygons.geojson" -nln manhattan_building_poly
ogr2ogr -f "PostgreSQL" "PG:host=localhost dbname=gis user=postgres password=postgres" "building_part_lines.geojson" -nln manhattan_building_part_lines 
ogr2ogr -f "PostgreSQL" "PG:host=localhost dbname=gis user=postgres password=postgres" "building_part_multipolygons.geojson" -nln manhattan_building_part_poly

