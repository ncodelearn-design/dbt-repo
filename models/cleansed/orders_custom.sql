{{ config(materialized='table', schema='cleansed',
    pre_hook="insert into {{ source('reference', 'audit_log') }} 
              values ('{{ this.name }}', current_timestamp(), null, 'running')",
    post_hook="update {{ source('reference', 'audit_log') }}  a
                    set end_time=current_timestamp(),
                    status='success'
                from (select max(start_time) as start_time from {{ source('reference', 'audit_log') }}
                        where model_name = '{{ this.name }}' ) b 
                where a.model_name = '{{ this.name }}' 
                and a.start_time = b.start_time"
        ) 
}}

select * from {{ ref( 'orders_cleansed') }}