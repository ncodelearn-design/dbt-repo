{{ config(materialized='ephemeral') }}

select 
    country, count(*) as number_of_people
   from {{ source( 'dbt_raw', 'customers_ext') }}
   group by country