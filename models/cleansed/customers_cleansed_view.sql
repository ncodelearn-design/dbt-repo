{{ config(materialized='view', schema='cleansed') }}

Select * from {{ ref ('customers_cleansed') }}