CREATE TABLE joined_targets AS

SELECT tp.propertyid
	,tp.addressid
	,tp.address
	,tp.osm_id AS prop_osm_id
	,tp.bin AS prop_bin
	,b."nycdoitt:bin" AS "b_bin"
	,b.*
FROM PUBLIC.targetprops AS tp
LEFT JOIN building b ON ST_Within(tp.geom, b.wkb_geometry);
