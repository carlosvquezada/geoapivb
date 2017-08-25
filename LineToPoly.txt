-- set column type to generic geometries
ALTER TABLE manhattan_building_lines ALTER COLUMN wkb_geometry SET DATA TYPE geometry;
ALTER TABLE manhattan_building_poly  ALTER COLUMN wkb_geometry SET DATA TYPE geometry;
ALTER TABLE manhattan_building_part_lines ALTER COLUMN wkb_geometry SET DATA TYPE geometry;
ALTER TABLE manhattan_building_part_poly  ALTER COLUMN wkb_geometry SET DATA TYPE geometry;




-- Transform LINESTRINGS TO POLYGONS 

	UPDATE manhattan_building_lines
	set wkb_geometry = ST_CollectionExtract(ST_MakeValid(ST_MakePolygon(ST_ForceClosed(wkb_geometry))), 3)
	WHERE GeometryType(wkb_geometry) = 'LINESTRING';

	UPDATE manhattan_building_part_lines
	set wkb_geometry = ST_CollectionExtract(ST_MakeValid(ST_MakePolygon(ST_ForceClosed(wkb_geometry))), 3)
	WHERE GeometryType(wkb_geometry) = 'LINESTRING';

