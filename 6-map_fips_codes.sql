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
SELECT DISTINCT city_fips.state_abb, city_fips.city, county_fips, city_fips.city_fips
FROM city_fips JOIN county_city_fips ON city_state_name LIKE  '%' || city || '%' || ', ' || state_abb;

DROP TABLE city_fips;
DROP TABLE county_city_fips;

-- Remove duplicate entries (one city can have multiple counties, but this doesn't help us) 
DELETE FROM fips_map
WHERE (state_abb, city, county_fips, city_fips) NOT IN (
        SELECT
                MAX(state_abb),
                MAX(city),
                MAX(county_fips),
                MAX(city_fips)
        FROM fips_map
        GROUP BY city_fips
);

-- Add primary key to fips_map
ALTER TABLE fips_map
ADD CONSTRAINT fips_map_pkey
PRIMARY KEY (city_fips);
