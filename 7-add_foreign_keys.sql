-- Add necessary foreign keys
ALTER TABLE obesity_data_cleaned
ADD CONSTRAINT city_fips_fkey
FOREIGN KEY (city_fips) REFERENCES fips_map(city_fips);

ALTER TABLE income_data
ADD CONSTRAINT county_fips_fkey
FOREIGN KEY (county_fips) REFERENCES fips_map(county_fips);

