CREATE TABLE joined_parts AS 
SELECT  
	, 	osm_id
	,   part_osm_id
	,	part_height as height
	,	part_min_height as min_height
	,	COALESCE("part_name", "name") as name
	,	building
	, 	"building:part"
	,	COALESCE("part_color", "color") as color
	, 	COALESCE("part_bulding:material", "building:material") as material
	, 	part_wkb_geometry  as wkb_geometry
	FROM 
	
	(SELECT * FROM building_part 
		LEFT JOIN building
			ON ST_Contains(building.wkb_geometry, building_part.part_wkb_geometry)
		)