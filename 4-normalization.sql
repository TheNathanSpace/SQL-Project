DROP TABLE IF EXISTS city_fips;

-- `obesity_data_cleaned` is not in 2NF. FD 3 shows that `state_abb` and `city` do not depend on the entire primary key (both `year` and `city_fips`). To fix this, we must move `state_abb` and `city` to a new table.

-- Create the new table
CREATE TABLE city_fips (
	city_fips TEXT PRIMARY KEY,
	state_abb CHAR(2),
	city TEXT
);

-- Insert new entries
INSERT INTO city_fips
SELECT city_fips, state_abb, city
FROM obesity_data_cleaned;

-- Delete redundant columns from obesity_data_cleaned
ALTER TABLE obesity_data_cleaned
DROP COLUMN state_abb,
DROP COLUMN city;

/*
-- Add necessary foreign keys
ALTER TABLE obesity_data_cleaned
ADD CONSTRAINT city_fips_fkey
FOREIGN KEY (city_fips) REFERENCES city_fips(city_fips);

ALTER TABLE income_data
ADD CONSTRAINT city_fips_fkey
FOREIGN KEY (county_fips) REFERENCES city_fips(city_fips);
*/
