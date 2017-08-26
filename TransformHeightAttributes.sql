-- The update statements below modify the height and min_height fields so that 
-- null values are replaced with a calculation from other fields


	-- line heights
		UPDATE manhattan_building_lines
		SET height = COALESCE(NULLIF(replace(split_part(height,';',1),'''',''),'')::float ,	NULLIF(split_part("building:levels",';',1),'')::float * 3.7 ,	0 );		
                                                                            
		UPDATE manhattan_building_part_lines
		SET height = COALESCE(NULLIF(replace(split_part(height,';',1),'''',''),'')::float ,	NULLIF(split_part("building:levels",';',1),'')::float * 3.7 ,	0 );		

		
	-- poly heights
		
		UPDATE manhattan_building_poly
		SET height = COALESCE(NULLIF(replace(split_part(height,';',1),'''',''),'')::float ,	NULLIF(split_part("building:levels",';',1),'')::float * 3.7 ,	0 );		

		UPDATE manhattan_building_part_poly
		SET height = COALESCE(NULLIF(replace(split_part(height,';',1),'''',''),'')::float ,	NULLIF(split_part("building:levels",';',1),'')::float * 3.7 ,	0 );


	-- line min_heights

		UPDATE manhattan_building_lines
		SET min_height = COALESCE(NULLIF(replace(split_part(min_height,';',1),'''',''),'')::float ,	NULLIF(split_part("building:min_level",';',1),'')::float * 3.7 ,	0 );
		

		UPDATE manhattan_building_part_lines
		SET min_height = COALESCE(NULLIF(replace(split_part(min_height,';',1),'''',''),'')::float ,	NULLIF(split_part("building:min_level",';',1),'')::float * 3.7 ,	0 );

		
	-- poly min_heights
				
		UPDATE manhattan_building_poly
		SET min_height = COALESCE(NULLIF(replace(split_part(min_height,';',1),'''',''),'')::float ,	NULLIF(split_part("building:min_level",';',1),'')::float * 3.7 ,	0 );

		UPDATE manhattan_building_part_poly
		SET min_height = COALESCE(NULLIF(replace(split_part(min_height,';',1),'''',''),'')::float ,	NULLIF(split_part("building:min_level",';',1),'')::float * 3.7 ,	0 );