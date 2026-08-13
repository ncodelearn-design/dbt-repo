SELECT count(customer_id), order_id
FROM {{ ref('orders_cleansed') }} 
group by order_id
having count(customer_id) > 1