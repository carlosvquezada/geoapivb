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
		);

--Import data from .csv file 	
	COPY TargetProps FROM '/project/MYOUTPUTFOLDER/leasecomp.csv' WITH (FORMAT csv);

--Add geometry column
	ALTER TABLE TargetProps ADD COLUMN geom GEOMETRY;

--Create geometry data from coordinate data
	UPDATE  TargetProps SET geom = ST_SetSRID(ST_MakePoint(cast(TargetProps.longitude as float), cast(TargetProps.latitude as float)),4326);
