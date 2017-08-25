-- The update statements below modify the height and min_height fields so that 
-- null values are replaced with a calculation from other fields


	-- line heights
		UPDATE manhattan_building_lines
		set height = NULLIF("building:levels", '')::int * 4
		where "building:levels" is not null and height is not null;

		UPDATE manhattan_building_part_lines
		set height = NULLIF("building:levels", '')::int * 4
		where "building:levels" is not null and height is not null;

		
	-- poly heights
		
		UPDATE manhattan_building_poly
		set height = NULLIF("building:levels", '')::int * 4
		where "building:levels" is not null and height is not null;

		UPDATE manhattan_building_part_poly
		set height = NULLIF("building:levels", '')::int * 4
		where "building:levels" is not null and height is not null;


	-- line min_heights

		UPDATE manhattan_building_lines
		set min_height = NULLIF("building:min_level", '')::int * 4
		where "building:min_level" is not null and min_height is not null;

		UPDATE manhattan_building_part_lines
		set min_height = NULLIF("building:min_level", '')::int * 4
		where "building:min_level" is not null and min_height is not null;

		
	-- poly min_heights
				
		UPDATE manhattan_building_poly
		set min_height = NULLIF("building:min_level", '')::int * 4
		where "building:min_level" is not null and min_height is not null;

		UPDATE manhattan_building_part_poly
		set min_height = NULLIF("building:min_level", '')::int * 4
		where "building:min_level" is not null and min_height is not null;