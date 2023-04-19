DROP TABLE IF EXISTS obesity_data_cleaned;

-- Create new table with int columns
-- This table will only contain data from whole cities, not tracts
CREATE TABLE obesity_data_cleaned (
	year NUMERIC(4,0),
	state_abb CHAR(2),
	city TEXT,
	city_fips TEXT,
	obesity_percentage NUMERIC(3,1),
	low_conf_limit NUMERIC(3,1),
	high_conf_limit NUMERIC(3,1),
	population NUMERIC(9,0)
);

-- Insert all data observations that are for entire cities, not tracts
INSERT INTO obesity_data_cleaned
SELECT 
	CAST(year as INTEGER),
	stateabb,
	cityname,
	cityfips,
	obesitypercentage,
	lowconfidence,
	highconfidence,
	CAST(replace(population, ',', '')  as INTEGER)
FROM obesity_data
WHERE uniqueid NOT LIKE '%-%';
