DROP TABLE IF EXISTS fips_map;

-- Create full table
CREATE TABLE fips_map (
	state_abb CHAR(2),
	city TEXT,
	county_fips TEXT,
	city_fips TEXT
);

-- Insert joined rows from the other two FIPS tables
INSERT INTO fips_map
SELECT city_fips.state_abb, city_fips.city, county_fips, city_fips.city_fips
FROM city_fips JOIN county_city_fips ON city_state_name LIKE  '%' || city || '%' || ', ' || state_abb;

DROP TABLE city_fips;
DROP TABLE county_city_fips;

ALTER TABLE fips_map
ADD CONSTRAINT fips_map_pkey 
PRIMARY KEY (state_abb, city, county_fips, city_fips);
