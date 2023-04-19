-- Remove unusable entries in obesity_data_cleaned (where there's no associated income_data point)
DELETE FROM obesity_data_cleaned
WHERE city_fips NOT IN (
	SELECT city_fips
	FROM fips_map
);

-- Add city_fips foreign key between obesity_data_cleaned and fips_maps 
ALTER TABLE obesity_data_cleaned
ADD CONSTRAINT city_fips_fkey
FOREIGN KEY (city_fips) REFERENCES fips_map(city_fips);
