-- Remove duplicate entries (artifact from 'Crude prevalence' and 'Age-adjusted prevalence' values)
DELETE FROM obesity_data_cleaned
WHERE (year, state_abb, city, city_fips, obesity_percentage, low_conf_limit, high_conf_limit, population) NOT IN (
	SELECT
        	MAX(year),
        	MAX(state_abb),
        	MAX(city),
        	MAX(city_fips),
        	MAX(obesity_percentage),
        	MAX(low_conf_limit),
        	MAX(high_conf_limit),
        	MAX(population)
	FROM obesity_data_cleaned
	GROUP BY city_fips
);

-- Some cities slipped through the previous command because their two entries are EXACTLY the same, so here we remove one of the duplicate entries
WITH ctid_fips AS (
	-- Subquery selects the CTID (kind of a non-permanent identifier) for each duplicate FIPS so that we can distinguish between the duplicates
	SELECT ctid, city_fips
	FROM obesity_data_cleaned
	WHERE obesity_data_cleaned.city_fips IN 
	(
		-- Subquery selects city_fips of all duplicate rows
        	SELECT city_fips
        	FROM obesity_data_cleaned
        	GROUP BY city_fips
        	HAVING COUNT(city_fips) > 1
	)
	ORDER BY city_fips
)
DELETE FROM obesity_data_cleaned
WHERE ctid IN (
	-- Subquery selects one of each duplicate row using CTID
	SELECT MIN(ctid)
	FROM ctid_fips
	GROUP BY (city_fips)
);

-- Remove Honolulu (doesn't use CityFIPS, only TractFIPS, which is useless for our purposes)
DELETE FROM obesity_data_cleaned
WHERE city_fips = '15003';

-- Remove NULL value (for the entire US)
DELETE from obesity_data_cleaned
WHERE city_fips IS NULL;
