-- A SQL query that shows how the datasets are integrated in ODS
-- Find all the users who gave a 5-star review for the business "Rogue Running"
select u.name
  from yelp_business b 
  join yelp_review r on b.business_id=r.business_id
  join yelp_user u on u.user_id=r.user_id
 where r.stars=5 and b.name='Rogue Running' limit 10;
