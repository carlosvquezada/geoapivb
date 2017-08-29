--Create table of target property data per columns in source csv file, PLUS a geometry field
	CREATE TABLE TargetProps (
		propertyID VARCHAR
		,AddressID VARCHAR
		,Address VARCHAR
		,Latitude VARCHAR
		,Longitude VARCHAR
		,OSM_ID VARCHAR
		,BIN VARCHAR
		,geom GEOMETRY
		)

--Import data from .csv file 	
	COPY TargetProps FROM '/project/Shape Retrieval 3.0/leasecomps.csv' WITH (FORMAT csv);

--Create geometry data from coordinate data
update  leasecomps set geom = ST_SetSRID(ST_MakePoint(cast(leasecomps.longitude as float), cast(leasecomps.latitude as float)),4326)
