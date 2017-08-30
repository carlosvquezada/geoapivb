
SELECT  
	, 	osm_id
	,   part_osm_id
	,	building
	, 	"building:part"
	,
	,
	, 	COALESCE("building:colour", "part_bulding:colour") as color
	,	COALESCE("building:material", "part_bulding:material") as material
	
	
	FROM 
	
	(

SELECT *

FROM building_part

LEFT JOIN building
	ON ST_Contains(building.wkb_geometry, building_part.part_wkb_geometry)
    limit 25
)
