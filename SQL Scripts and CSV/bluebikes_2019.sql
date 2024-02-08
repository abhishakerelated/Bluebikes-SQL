-- Bluebikes 2019 Exploration

select * 
from bluebikes_2019
limit 10; 

-- Count of subscribers for Bluebikes 2019 - 1,988,467

select count(*)
from bluebikes_2019
where user_type ilike 'Subscriber'; 

-- Count of non subscribers for Bluebikes 2019 - 534,070

select count(*)
from bluebikes_2019
where user_type ilike 'Customer';

-- Subscribers by user gender: 0 - 20,234; 1 - 1,468,597; 2 - 499,636;

select user_gender, count(*)
from bluebikes_2019
where user_type ilike 'Subscriber'
group by user_gender

-- Customers by user gender: 0 - 257,314; 1 - 184,047; 2 - 92,709;

select user_gender, count(*)
from bluebikes_2019 
where user_type ilike 'Customer'
group by user_gender


-- List of top 10 start station with the count of each user type 
select s.name, count(b19.user_type)
from bluebikes_2019 as b19
join bluebikes_stations as s
on b19.start_station_id = s.id
group by s.name 
order by count(b19.user_type) desc
limit 10; 


-- List of top 10 end station with the count of each user type 
select s.name, count(b19.user_type)
from bluebikes_2019 as b19
join bluebikes_stations as s
on b19.end_station_id = s.id
group by s.name 
order by count(b19.user_type) desc
limit 10; 

-- Most starting station for subscribers 

select s.name, count(b19.bike_id), s.latitude, s.longitude
from bluebikes_2019 as b19
join bluebikes_stations as s 
on b19.start_station_id = s.id 
where user_type like 'Subscriber'
group by s.name, s.latitude, s.longitude 
order by count(b19.bike_id) desc
limit 10; 

-- Most ending station for subscribers 

select s.name, count(b19.bike_id), s.latitude, s.longitude
from bluebikes_2019 as b19 
join bluebikes_stations as s 
on b19.end_station_id = s.id 
where user_type like 'Subscriber'
group by s.name, s.latitude, s.longitude 
order by count(b19.bike_id) desc
limit 10; 

-- Most starting station for customers 

select s.name, count(b19.bike_id), s.latitude, s.longitude
from bluebikes_2019 as b19
join bluebikes_stations as s 
on b19.start_station_id = s.id 
where user_type like 'Customer'
group by s.name, s.latitude, s.longitude 
order by count(b19.bike_id) desc
limit 10; 

-- Most ending station for customers 

select s.name, count(b19.bike_id), s.latitude, s.longitude
from bluebikes_2019 as b19
join bluebikes_stations as s 
on b19.end_station_id = s.id 
where user_type like 'Customer'
group by s.name, s.latitude, s.longitude 
order by count(b19.bike_id) desc
limit 10; 


-- 
select user_birth_year, count(*)
from bluebikes_2019
where user_type ilike 'subscriber'
group by user_birth_year
order by user_birth_year desc;

SELECT ROUND(AVG(EXTRACT(YEAR FROM CURRENT_DATE) - CAST(user_birth_year AS INTEGER))) AS average_age_of_subscribers
FROM bluebikes_2019
WHERE user_type ILIKE 'Subscriber' AND user_birth_year IS NOT NULL;


