ALTER TABLE income_data DROP CONSTRAINT income_data_pkey;
ALTER TABLE obesity_data_cleaned DROP CONSTRAINT obesity_data_cleaned_pkey;

-- Add primary key to income_data
ALTER TABLE income_data
ADD CONSTRAINT income_data_pkey PRIMARY KEY (fips);

-- Add primary key to obesity_data_cleaned
ALTER TABLE obesity_data_cleaned
ADD CONSTRAINT obesity_data_cleaned_pkey PRIMARY KEY (year, city_fips);
