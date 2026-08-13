{{ config(materialized='incremental', schema='transformed') }}

Select *, current_datetime() as insert_datetime from {{ ref ('customers_cleansed') }}

{% if is_incremental() %}
where created_at > 
(select max(created_at) from {{ this }})
{% endif %}