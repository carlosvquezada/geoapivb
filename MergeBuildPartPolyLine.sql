CREATE TABLE building_part AS

SELECT "building"
	,"building:colour"
	,NULL AS "building:level"
	,"building:levels"
	,"building:material"
	,"building:min_level"
	,"building:part"
	,NULL AS "colour"
	,"full_id"
	,cast("height" AS DECIMAL(8, 2))
	,"material"
	,cast("min_height" AS DECIMAL(8, 2))
	,"name"
	,"nycdoitt:bin"
	,"ogc_fid"
	,"osm_id"
	,"osm_type"
	,"roof:material"
	,"roof:shape"
	,"wkb_geometry"
FROM manhattan_building_part_poly

UNION

SELECT NULL AS "building"
	,"building:colour"
	,"building:level"
	,"building:levels"
	,"building:material"
	,"building:min_level"
	,"building:part"
	,"colour"
	,"full_id"
	,cast("height" AS DECIMAL(8, 2))
	,"material"
	,cast("min_height" AS DECIMAL(8, 2))
	,"name"
	,"nycdoitt:bin"
	,"ogc_fid"
	,"osm_id"
	,"osm_type"
	,"roof:material"
	,"roof:shape"
	,"wkb_geometry"
FROM manhattan_building_part_lines;
