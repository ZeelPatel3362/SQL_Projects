select * from u1;
select * from u2;
select * from u3;


## Basic Level Questions


#Q-1 What are & how many unique pickup locations are there in the dataset?

select distinct pickup_location from u2;
select count(distinct pickup_location) from u2;

#Q-2 What is the total number of rides in the dataset?

select count(*) from u2;

#Q-3 Calculate the average ride duration.

select avg(ride_duration) from u2;

#Q-4 List the top 5 drivers based on their total earnings.

select driver_name, sum(earnings) from u3
group by driver_name
order by sum(earnings) desc
limit 5;

#Q-5 Calculate the total number of rides for each payment method.

select distinct payment_method, count(*) from u2
group by payment_method;

#Q-6 Retrieve rides with a fare amount greater than 20.

select * from u2 u 
where fare_amount > 20;

#Q-7 Identify the most common pickup location.

select pickup_location, count(*) from u2
group by pickup_location
order by pickup_location desc
limit 1;

#Q-8 Calculate the average fare amount.

select avg(fare_amount) from u2;

#Q-9 List the top 10 drivers with the highest average ratings.

select driver_name, avg(rating) from u3 u 
group by driver_name 
order by avg(rating) desc
limit 10;

#Q-10 Calculate the total earnings for all drivers.

select sum(earnings) from u3;

#Q-11 How many rides were paid using the "Cash" payment method?

select payment_method, count(*) from u2 u 
where payment_method='cash'
group by payment_method;

#Q-12 Calculate the number of rides & average ride distance for rides originating from the 'Dhanbad' pickup location.

select pickup_location,count(*),avg(ride_distance) from u2
where pickup_location = 'Dhanbad';

#Q-13 Retrieve rides with a ride duration less than 10 minutes.

select * from u2 u 
where ride_duration < 10;

#Q-14 List the passengers who have taken the most number of rides.

SELECT passenger_id, COUNT(*) AS ride_count FROM u1 
GROUP BY passenger_id 
ORDER BY ride_count DESC ;
LIMIT 1;

#Q-15 Calculate the total number of rides for each driver in descending order.

select driver_id, count(*) from u3 u 
group by driver_id 
order by count(*) desc;


#Q-16 Identify the payment methods used by passengers who took rides from the 'Gandhinagar' pickup location.

select distinct payment_method from u2 u 
where pickup_location = 'Gandhinagar';

#Q-17 Calculate the average fare amount for rides with a ride distance greater than 10.

select avg(fare_amount) from u2 u 
where ride_distance > 10;

#Q-18 List the drivers in descending order accordinh to their total number of rides.

select driver_id, total_rides from u3 u 
order by total_rides desc;

#Q-19 Calculate the percentage distribution of rides for each pickup location.

select distinct pickup_location, count(*), round(count(*) * 100/ (select count(*) from u2),2) AS percentage from u2 u 
group by pickup_location
order by percentage desc;

#Q-20 Retrieve rides where both pickup and dropoff locations are the same.

select * from u2 u 
where pickup_location = dropoff_location;



## Intermediate Level Questions

select * from u1;
select * from u2;
select * from u3;



#Q-1. List the passengers who have taken rides from at least 300 different pickup locations.

select passenger_id,count(distinct pickup_location)  from u2
group by passenger_id
having count(pickup_location) >= 300;

#Q-2. Calculate the average fare amount for rides taken on weekdays.

select avg(fare_amount) from u2 u 
where dayofweek(str_to_date(ride_timestamp,'%m/%d/%Y %H:%i')) between 2 and 6;

#Q-3. Identify the drivers who have taken rides with distances greater than 19.

select distinct driver_id, ride_distance from u2 u 
where ride_distance > 19;

#Q-4. Calculate the total earnings for drivers who have completed more than 100 rides.

select driver_id, sum(earnings) from u3
where driver_id in (select driver_id from u2 group by driver_id having count(*)>100)
group by driver_id;

#Q-5. Retrieve rides where the fare amount is less than the average fare amount.

select * from u2 u 
where fare_amount < (select avg(fare_amount) from u2);

#Q-6. Calculate the average rating of drivers who have driven rides with both 'Credit Card' and 'Cash' payment methods.

select driver_id , avg(rating) from u3 u 
where driver_id in (select driver_id from u2 where payment_method in ('Cash','Credit Card') group by driver_id having count(distinct payment_method)=2)
group by driver_id; 

select u3.driver_id, avg(rating)
from u2 inner join u3
on u2.driver_id = u3.driver_id
where u2.payment_method in ('Cash','Credit Card')
group by u3.driver_id
having count(distinct u2.payment_method) = 2;

#Q-7. List the top 3 passengers with the highest total spending.

select u1.passenger_id, u1.passenger_name, sum(u2.fare_amount)
from u1 inner join u2
on u1.passenger_id = u2.passenger_id 
group by u1.passenger_id, u1.passenger_name
order by sum(u2.fare_amount) desc
limit 3;

SELECT p.passenger_id, p.passenger_name, SUM(r.fare_amount) AS total_spending
FROM u1 p
JOIN u2 r ON p.passenger_id = r.passenger_id
GROUP BY p.passenger_id, p.passenger_name
ORDER BY total_spending DESC
LIMIT 3;

#Q-8. Calculate the average fare amount for rides taken during different months of the year.

select month(str_to_date(ride_timestamp,'%m/%d/%Y %H:%i')) as month_of_year,avg(fare_amount) 
from u2
group by month_of_year;

#Q-9. Identify the most common pair of pickup and dropoff locations.

select pickup_location , dropoff_location , count(*) from u2 u 
group by pickup_location, dropoff_location
order by count(*) desc;


#Q-10. Calculate the total earnings for each driver and order them by earnings in descending order.

select driver_id, sum(earnings) from u3 u 
group by driver_id 
order by sum(earnings) desc;


#Q-11. List the passengers who have taken rides on their signup date.

select u1.passenger_id , u1.passenger_name, u1.signup_date, u2.ride_timestamp
from u1 inner join u2
on u1.passenger_id = u2.passenger_id 
where date(str_to_date(signup_date,'%d/%m/%Y')) = date(str_to_date(ride_timestamp,'%m/%d/%Y %H:%i'))
group by u1.passenger_id , u1.passenger_name, u1.signup_date, u2.ride_timestamp;


#Q-12. Calculate the average earnings for each driver and order them by earnings in descending order.

select driver_id, avg(earnings) from u3 u 
group by driver_id 
order by avg(earnings) desc;


#Q-13. Retrieve rides with distances less than the average ride distance.

select ride_id, avg(ride_distance) from u2 u 
where ride_distance < (select avg(ride_distance) from u2)
group by ride_id;


#Q-14. List the drivers who have completed the least number of rides.

select driver_name, count(driver_id) from u3 
group by driver_name
order by count(driver_id);


#Q-15. Calculate the average fare amount for rides taken by passengers who have taken at least 20 rides.

select avg(fare_amount) from u2 u 
where passenger_id in (select passenger_id from u2 group by passenger_id having count(passenger_id) >= 20 );


#Q-16. Identify the pickup location with the highest average fare amount.

select pickup_location , avg(fare_amount) from u2
group by pickup_location 
order by avg(fare_amount) desc
limit 1;


#Q-17. Calculate the average rating of drivers who completed at least 100 rides.

select avg(rating) from u3 u 
where driver_id in (select driver_id from u2 group by driver_id having count(*) >= 100);


#Q-18. List the passengers who have taken rides from at least 5 different pickup locations.

select passenger_id , count(distinct pickup_location) from u2 u 
group by passenger_id 
having count(distinct pickup_location) >= 300;


#Q-19. Calculate the average fare amount for rides taken by passengers with ratings above 4.

select avg(fare_amount) from u2 u 
where passenger_id in (select passenger_id from u1 where rating>4 );


#Q-20. Retrieve rides with the shortest ride duration in each pickup location.

SELECT *
FROM u2
WHERE ride_duration = (
    SELECT MIN(ride_duration)
    FROM u2
    WHERE pickup_location = u2.pickup_location
);



## Advance level Questions



select * from u1;
select * from u2;
select * from u3;



#Q-1. List the drivers who have driven rides in all pickup locations.

SELECT driver_id
FROM u3
GROUP BY driver_id
HAVING COUNT(DISTINCT driver_id) = (
    SELECT COUNT(*) FROM u2
);

#Q-2. Calculate the average fare amount for rides taken by passengers who have spent more than 300 in total.

select avg(fare_amount) from u2
where passenger_id in (select passenger_id from u1 where total_spent > 300);


#Q-3. List the bottom 5 drivers based on their average earnings.

select driver_id,driver_name, avg(earnings) from u3 u 
group by driver_id ,driver_name
order by avg(earnings) asc 
limit 5;


#Q-4. Calculate the sum fare amount for rides taken by passengers who have taken rides in different payment methods.

select sum(fare_amount) from u2 
where passenger_id in (select passenger_id from u2 group by passenger_id having count(distinct payment_method)>1 );


#Q-5. Retrieve rides where the fare amount is significantly above the average fare amount.

select * from u2 u 
where fare_amount > (select avg(fare_amount) from u2);


#Q-6. List the drivers who have completed rides on the same day they joined.

select u3.driver_id  
from u2 inner join u3
on u2.driver_id = u3.driver_id
where u2.ride_timestamp = u3.join_date;


#Q-7. Calculate the average fare amount for rides taken by passengers who have taken rides in different payment methods.

select avg(fare_amount) from u2
where passenger_id in (select passenger_id from u2 group by passenger_id having count(distinct payment_method)>1);


#Q-8. Identify the pickup location with the highest percentage increase in average fare amount compared to the overall average fare.

select pickup_location , avg(fare_amount), (AVG(fare_amount) - (SELECT AVG(fare_amount) from u2)) * 100.0 / (SELECT AVG(fare_amount) FROM u2) AS percentage_increase from u2
group by pickup_location 
order by percentage_increase desc 
limit 1;


#Q-9. Retrieve rides where the dropoff location is the same as the pickup location.

select * from u2 
where dropoff_location = pickup_location;


#Q-10. Calculate the average rating of drivers who have driven rides with varying pickup locations.

select avg(rating) from u3 
where driver_id in (select distinct driver_id from u2 group by driver_id having count(distinct pickup_location) > 1 );














