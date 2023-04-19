-- \i database_management/project/0-load_data.sql
\i database_management/project/1-transfer_obesity_data.sql
\i database_management/project/2-clean_data.sql
\i database_management/project/3-add_constraints.sql
\i database_management/project/4-normalization.sql
\i database_management/project/5-load_county_city_data.sql
\i database_management/project/6-map_fips_codes.sql

ALTER TABLE s23_group27.obesity_data_cleaned OWNER TO s23_group27;
ALTER TABLE s23_group27.fips_map OWNER TO s23_group27;
