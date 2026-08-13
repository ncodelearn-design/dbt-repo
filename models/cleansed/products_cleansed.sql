{{ config(materialized='table', schema='cleansed') }}

select * from {{ source( 'dbt_raw', 'products_ext') }}