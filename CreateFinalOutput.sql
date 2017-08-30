CREATE TABLE final_output AS

SELECT osm_id
	,osm_id AS part_osm_id
	,height
	,min_height
	,NAME AS NAME
	,color
	,"building:material" AS material
	,"building"
	,NULL AS "building:part"
	,wkb_geometry
FROM PUBLIC.building

UNION ALL

SELECT osm_id
	,part_osm_id
	,height
	,min_height
	,NAME
	,color
	,material
	,"building"
	,"building:part"
	,wkb_geometry
FROM PUBLIC.building
