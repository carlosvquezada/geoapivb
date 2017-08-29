-- Merges Building Poly and Line data into one table
CREATE TABLE building AS

SELECT '' AS "bin"
	,NULL AS "building"
	,"building:colour" as "color"
	,NULL AS "building:level"
	,"building:levels"
	,"building:material"
	,"building:min_level"
	,"building:part"
	,"full_id"
	,cast("height" AS DECIMAL(8, 2))
	,NULL AS "level"
	,NULL AS "material"
	,cast("min_height" AS DECIMAL(8, 2))
	,"name"
	,NULL AS "nycdoitt:bin"
	,"ogc_fid"
	,"osm_id"
	,"osm_type"
	,NULL AS "roof"
	,"roof:material"
	,"roof:shape"
	, wkb_geometry
FROM manhattan_building_lines

UNION

SELECT "bin"
	,"building"
	,"building:colour" as "color"
	,"building:level"
	,"building:levels"
	,"building:material"
	,"building:min_level"
	,"building:part"
	,"full_id"
	,cast("height" AS DECIMAL(8, 2))
	,"level"
	,"material"
	,cast("min_height" AS DECIMAL(8, 2))
	,"name"
	,"nycdoitt:bin"
	,"ogc_fid"
	,"osm_id"
	,"osm_type"
	,"roof"
	,"roof:material"
	,"roof:shape"
	, wkb_geometry
FROM manhattan_building_poly;
