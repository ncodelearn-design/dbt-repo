{{ config(materialized='table', schema='cleansed') }}

select customer_id,
    UPPER(first_name) first_name,
    UPPER(last_name) last_name,
    email,
    phone,
    city,
    state,
    created_at,
    a.country,
    number_of_people
   from {{ source( 'dbt_raw', 'customers_ext') }} a
LEFT JOIN {{ ref('customers_ephemeral') }} b
on a.country = b.country