/* Step 1: Drop kentucky_counties if it already exists  in the database */

drop table if exists
		lab_10.ky_opioid; -- end first statement

/* Step 2: Create ky_opioid from the results of the query of kentucky_counties and opioid_mortality */
create table
		lab_10.ky_opioid -- schema_name.table_name

as
select

		lab_10.kentucky_counties.id,
		lab_10.kentucky_counties.countyfp,
		lab_10.kentucky_counties.geom,
		lab_10.kentucky_counties.name,
		lab_10.kentucky_counties.lsad,
		lab_10.kentucky_counties.aland,
		lab_10.kentucky_counties.awater,
		lab_10.opoid_mortality.opioid_2018
		
from
		lab_10.kentucky_counties
		
left join -- keep all counties in output
		lab_10.opoid_mortality
on
		lab_10.kentucky_counties.name = lab_10.opoid_mortality.county;
		
alter table
		lab_10.ky_opioid
add primary key (id);
