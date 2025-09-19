-- This is a singular test, which will throw error if atleast 1 row is returned by following query
-- This is not reusable test

select * from {{ref('listings_model')}}
where id < 0 limit 10