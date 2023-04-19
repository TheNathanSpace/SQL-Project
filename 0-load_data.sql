DROP TABLE IF EXISTS income_data_temp;

-- Create temporary table
CREATE TABLE income_data_temp (
	fips TEXT,
	state CHAR(2),
	area_name TEXT,
	attribute TEXT,
	value TEXT
);

-- Copy full CSV to temp table
\copy income_data_temp FROM database_management/project/Unemployment.csv WITH (FORMAT csv, HEADER true)

-- Copy relavant columns to real table
INSERT INTO income_data
SELECT fips, state, area_name, CAST(value AS NUMERIC(6,0))
FROM income_data_temp
WHERE attribute = 'Median_Household_Income_2020';

-- Drop temp table
DROP TABLE income_data_temp;
