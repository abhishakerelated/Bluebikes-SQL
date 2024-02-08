-- Bluebikes 2016 Exploration

select * 
from bluebikes_2016 
limit 10; 

-- Count of subscribers for Bluebikes 2016 - 983,939

select count(*)
from bluebikes_2016
where user_type ilike 'Subscriber'; 

-- Count of non subscribers for Bluebikes 2016 - 252,264

select count(*)
from bluebikes_2016
where user_type ilike 'Customer';

-- Subscribers by user gender: 0 - 26,497; 1 - 719,474; 2 - 237,968;

select user_gender, count(*)
from bluebikes_2016 
where user_type ilike 'Subscriber'
group by user_gender

-- Customers by user gender: 0 - 205,792; 1 - 35,703; 2 - 10,769;

select user_gender, count(*)
from bluebikes_2016 
where user_type ilike 'Customer'
group by user_gender

-- List of top 10 start station with the count of each user type 

select s.name, count(b16.user_type)
from bluebikes_2016 as b16
join bluebikes_stations as s
on b16.start_station_id = s.id
group by s.name 
order by count(b16.user_type) desc
limit 10; 

-- List of top 10 end station with the count of each user type 

select s.name, count(b16.user_type)
from bluebikes_2016 as b16
join bluebikes_stations as s
on b16.end_station_id = s.id
group by s.name 
order by count(b16.user_type) desc
limit 10; 

-- Most starting station for subscribers 

select s.name, count(b16.bike_id), s.latitude, s.longitude
from bluebikes_2016 as b16 
join bluebikes_stations as s 
on b16.start_station_id = s.id 
where user_type like 'Subscriber'
group by s.name, s.latitude, s.longitude 
order by count(b16.bike_id) desc
limit 10; 

-- Most ending station for subscribers 

select s.name, count(b16.bike_id), s.latitude, s.longitude
from bluebikes_2016 as b16 
join bluebikes_stations as s 
on b16.end_station_id = s.id 
where user_type like 'Subscriber'
group by s.name, s.latitude, s.longitude 
order by count(b16.bike_id) desc
limit 10; 

-- Most starting station for customers 

select s.name, count(b16.bike_id), s.latitude, s.longitude
from bluebikes_2016 as b16 
join bluebikes_stations as s 
on b16.start_station_id = s.id 
where user_type like 'Customer'
group by s.name, s.latitude, s.longitude 
order by count(b16.bike_id) desc
limit 10; 

-- Most ending station for customers 

select s.name, count(b16.bike_id), s.latitude, s.longitude
from bluebikes_2016 as b16 
join bluebikes_stations as s 
on b16.end_station_id = s.id 
where user_type like 'Customer'
group by s.name, s.latitude, s.longitude 
order by count(b16.bike_id) desc
limit 10; 



--SELECT ROUND(AVG(EXTRACT(YEAR FROM CURRENT_DATE) - CAST(user_birth_year AS INTEGER))) AS average_age_of_subscribers
--FROM bluebikes_2016
--WHERE user_type ILIKE 'Subscriber' AND user_birth_year IS NOT NULL;



