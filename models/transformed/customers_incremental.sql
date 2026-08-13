{{ config(materialized='incremental', schema='transformed', incremental_strategy='merge', unique_key='customer_id') }}

Select *, current_datetime() as insert_datetime from {{ ref ('customers_cleansed') }}

{% if is_incremental() %}
where updated_at > 
(select max(updated_at) from {{ this }})
{% endif %}