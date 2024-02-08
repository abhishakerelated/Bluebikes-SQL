-- Bluebikes 2017 Exploration

select * 
from bluebikes_2017 
limit 10; 

-- Count of subscribers for Bluebikes 2017 - 1,104,738

select count(*)
from bluebikes_2017
where user_type ilike 'Subscriber'; 

-- Count of non subscribers for Bluebikes 2017 - 209,036

select count(*)
from bluebikes_2017
where user_type ilike 'Customer';

-- Subscribers by user gender: 0 - 6,742; 1 - 830,821; 2 - 267,175;

select user_gender, count(*)
from bluebikes_2017 
where user_type ilike 'Subscriber'
group by user_gender

-- Customers by user gender: 0 - 209,036; 1 - ; 2 - ;

select user_gender, count(*)
from bluebikes_2017
where user_type ilike 'Customer'
group by user_gender


-- List of top 10 start station with the count of each user type 
select s.name, count(b17.user_type)
from bluebikes_2017 as b17
join bluebikes_stations as s
on b17.start_station_id = s.id
group by s.name 
order by count(b17.user_type) desc
limit 10; 


-- List of top 10 end station with the count of each user type 
select s.name, count(b17.user_type)
from bluebikes_2017 as b17
join bluebikes_stations as s
on b17.end_station_id = s.id
group by s.name 
order by count(b17.user_type) desc
limit 10; 

-- Most starting station for subscribers 

select s.name, count(b17.bike_id), s.latitude, s.longitude
from bluebikes_2017 as b17 
join bluebikes_stations as s 
on b17.start_station_id = s.id 
where user_type like 'Subscriber'
group by s.name, s.latitude, s.longitude 
order by count(b17.bike_id) desc
limit 10; 

-- Most ending station for subscribers 

select s.name, count(b17.bike_id), s.latitude, s.longitude
from bluebikes_2017 as b17 
join bluebikes_stations as s 
on b17.end_station_id = s.id 
where user_type like 'Subscriber'
group by s.name, s.latitude, s.longitude 
order by count(b17.bike_id) desc
limit 10; 

-- Most starting station for customers 

select s.name, count(b17.bike_id), s.latitude, s.longitude
from bluebikes_2017 as b17
join bluebikes_stations as s 
on b17.start_station_id = s.id 
where user_type like 'Customer'
group by s.name, s.latitude, s.longitude 
order by count(b17.bike_id) desc
limit 10; 

-- Most ending station for customers 

select s.name, count(b17.bike_id), s.latitude, s.longitude
from bluebikes_2017 as b17
join bluebikes_stations as s 
on b17.end_station_id = s.id 
where user_type like 'Customer'
group by s.name, s.latitude, s.longitude 
order by count(b17.bike_id) desc
limit 10; 