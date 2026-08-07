{{ config(materialized='table', schema='cleansed') }}

select customer_id,
    UPPER(first_name) first_name,
    UPPER(last_name) last_name,
    email,
    phone,
    city,
    state,
    country,
   from {{ source( 'dbt_raw', 'customers_ext') }}