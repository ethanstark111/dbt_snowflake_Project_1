--  This model is for demo of how pre and post hook works
-- We have to create user_log table in debt_default schema


{{
    config(
        materialized='view',
        pre_hook=["INSERT INTO dbt_default.user_log (model,activity, timestamp) VALUES('{{this}}', 'Insert Start',current_timestamp())"],
        post_hook=["INSERT INTO dbt_default.user_log (model,activity, timestamp) VALUES('{{this}}', 'Insert Complete',current_timestamp())"]
    )
}}

select 
    A.ID as listing_id,
    LISTING_URL,
    A.NAME as listing_name,
    ROOM_TYPE,
    MINIMUM_NIGHTS,
    HOST_ID,
    SUBSTRING(PRICE,2) as price,
    A.CREATED_AT as listings_created_at,
    A.UPDATED_AT as listings_updated_at,
    B.NAME as host_name,
    IS_SUPERHOST,
    B.CREATED_AT as host_created_at,
    B.UPDATED_AT as host_updated_at
from
    {{ref('listings_model')}} A JOIN {{ref('hosts_model')}} B
ON A.host_id = B.id


