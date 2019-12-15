/* Step 1: Drop kentucky_counties if it already exists  in the database */
drop tabel if exists
		lab_10.kentucky_counties; -- end first statement
		
/* Step 2: Create kentucky_counties from the results of the query of cb_2018_us_county_20m */
create table
		lab_10.kentucky_counties -- schema_name.table_name
as
select
		id,
		countyfp,
		geoid,
		name,
		lsad,
		aland,
		awater
		
from
		lab_10.cb_2018_us_county_20m -- the source table
		
where
		lab_10.cb_2018_us_state_20m.statefp=21; -- end second statement
		
/* Step 3: Third statement  to designate primary key */
alter table
		lab_10.kentucky_counties
add primary key (id); -- end third statement