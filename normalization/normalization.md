# Normalization

## Pre-Normalized Tables

Directly after loading the data from CSV files into tables, we have two tables, `income_data` and `obesity_data`.

## Normalizing `income_data`

We have the following attributes:

 - `fips` (key)
 - `state`
 - `city_state`
 - `median_income`

We have the following relation:

 - R1 = {`fips`, `state`, `city_state`, `median_income`}

We have the following functional dependencies:

 - {`fips`} -> {`state`, `city_state`}
 - {`fips`} -> {`median_income`}

`income_data` is already in 1NF, because every value is a scalar value. There are no lists.

`income_data` is already in 2NF, because all three non-key attributes depend on the entirety of the key (`fips`).

`income_data` is already in 3NF, because there are no non-key attributes that depend on other non-key attributes (and thus, no attributes that are transitively dependent on the key).

`income_data` is already in BCNF, because every functional dependency of R1 depends on the entirety of the superkey (`fips`).

## Normalizing `obesity_data`

We have the following attributes:

 - `year` (key)
 - `stateabb`
 - `citystatename`
 - `cityname`
 - `category`
 - `uniqueid`
 - `obesitypercentage`
 - `lowconfidence`
 - `highconfidence`
 - `population`
 - `cityfips` (key)

We have the following relation:

 - R1 = {`year`, `stateabb`, `citystatename`, `cityname`, `category`, `uniqueid`, `obesitypercentage`, `lowconfidence`, `highconfidence`, `population`, `cityfips`}

We have the following functional dependencies:

 - {`cityfips`} -> {`cityname`, 
