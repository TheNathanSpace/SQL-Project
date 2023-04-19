DROP TABLE IF EXISTS county_city_fips;
DROP TABLE IF EXISTS county_city_fips_temp;

-- Create temp table
CREATE TABLE county_city_fips_temp (
	county_name TEXT,
	state CHAR(2),
	county_fips TEXT,
	cbsa2022 TEXT,
	city_name TEXT,
	ssa_code TEXT,
	state_name TEXT,
	county_name_2 TEXT
);

-- Load from CSV
\copy county_city_fips_temp FROM database_management/project/city_county_fips.csv WITH (FORMAT csv, HEADER true)

-- Remove irrelavant rows
DELETE FROM county_city_fips_temp
WHERE city_name IS NULL;

-- Create final table
CREATE TABLE county_city_fips (
	county_fips TEXT,
	city_state_name TEXT
);

-- Populate final table
INSERT INTO county_city_fips
SELECT county_fips, city_name
FROM county_city_fips_temp;

-- Drop temp table
DROP TABLE county_city_fips_temp;
