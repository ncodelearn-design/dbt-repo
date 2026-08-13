{% snapshot customers_snapshot %}
{{ config( target_schema='transformed', unique_key=['customer_id', 'email'], strategy='timestamp', updated_at='updated_at' )}}

Select *, current_datetime() as insert_datetime from {{ ref ('customers_cleansed') }}

{% endsnapshot %}