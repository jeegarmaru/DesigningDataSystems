
-- get review count by business state
select b.state, count(*) as review_count from fact_yelp_review r join dim_yelp_business b on b.business_id = r.business_id group by b.state;


-- Find average temperature & precipitation & average stars by postal-code for Las Vegas
select b.postal_code, avg(t.min), avg(precipitation), avg(r.stars) from fact_yelp_review r 
  join dim_temperature t on r.review_date=t.date
  join dim_precipitation p on r.review_date=p.date
  join dim_yelp_business b on b.business_id = r.business_id where b.city='Las Vegas'
group by b.postal_code;


-- Show how the average review stars correlate with the weather
select case when t.min<60 then 'COLD' when t.min < 90 then 'WARM' else 'HOT' end as weather, avg(r.stars) from fact_yelp_review r 
  join dim_temperature t on r.review_date=t.date where b.city='Las Vegas' group by weather;

-- SQL query that report business name, temperature, precipitation, and ratings
select b.name, t.min, t.max, p.precipitation, r.stars from fact_yelp_review r 
  join dim_temperature t on r.review_date=t.date
  join dim_precipitation p on r.review_date=p.date
  join dim_yelp_business b on b.business_id = r.business_id where b.city='Las Vegas';
