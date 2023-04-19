# Normalization

## Pre-Normalized Tables

Directly after loading the data from CSV files into tables and cleaning it, we have two tables, `income_data` and `obesity_data_cleaned`.

## Normalizing `income_data`

We have the following attributes:

 - `county_fips` (key)
 - `state`
 - `city_state`
 - `median_income`

We have the following relation:

 1. {`county_fips`, `state`, `city_state`, `median_income`}

We have the following functional dependencies:

 1. {`county_fips`} -> {`state`, `city_state`}
 2. {`county_fips`} -> {`median_income`}

`income_data` is already in 1NF, because every value is a scalar value. There are no lists.

`income_data` is already in 2NF, because all three non-key attributes depend on the entirety of the key (`county_fips`).

`income_data` is already in 3NF, because there are no non-key attributes that depend on other non-key attributes (and thus, no attributes that are transitively dependent on the key).

`income_data` is already in BCNF, because every functional dependency of R1 depends on the entirety of the superkey (`county_fips`).

## Normalizing `obesity_data_cleaned`

We have the following attributes:

 - `year` (key)
 - `state_abb`
 - `city`
 - `city_fips` (key)
 - `obesity_percentage`
 - `low_conf_limit`
 - `high_conf_limit`
 - `population`

We have the following relation:

 1. {`year`, `state_abb`, `city`, `city_fips`, `obesity_percentage`, `low_conf_limit`, `high_conf_limit`, `population`}

We have the following functional dependencies:

 1. {`year`, `city_fips`} -> {`obesity_percentage`, `low_conf_limit`, `high_conf_limit`}
 2. {`year`, `city_fips`} -> {`population`}
 3. {`city_fips`} -> {`state_abb`, `city`}

`obesity_data_cleaned` is already in 1NF, because every value is a scalar value. There are no lists.

`obesity_data_cleaned` is not in 2NF. FD 3 shows that `state_abb` and `city` do not depend on the entire primary key (both `year` and `city_fips`). To fix this, we must move `state_abb` and `city` to a new table.
