# Airbnb – Hospitality Intelligence Hub


select * from listings;
select * from details;


#1.Import Data from both the .CSV files to create tables, Listings and Booking Details.
select * from listings;
select * from details;

#2.Write a query to show names from Listings table
select name from details;

#3.Write a query to fetch total listings from the listings table
select count(listing_id) from listings;

#4. Write a query to fetch total listing_id from the booking_details table
select count(id) from details;

#5.Write a query to fetch host ids from listings table
select host_id from details;

#6.Write a query to fetch all unique host name from listings table
select distinct host_name from details;

#7.Write a query to show all unique neighbourhood_group from listings table
select distinct neighbourhood_group from details;

#8.Write a query to show all unique neighbourhood from listings table
select distinct neighbourhood from details;

#9.Write a query to fetch unique room_type from listings tables
select distinct room_type from details;

#10.Write a query to show all values of Brooklyn & Manhattan from listings tables
select * from details where neighbourhood_group in ( 'brooklyn', 'manhattan');

#11.Write a query to show maximum price from booking_details table
select max(price) from listings;

#12.Write a query to show minimum price fron booking_details table
select min(price) from listings;

#13.Write a query to show average price from booking_details table
select avg(price) from listings;

#14.Write a query to show minimum value of minimum_nights from booking_details table
select min(minimum_nights) from listings;

#15 Write a query to show maximum value of minimum_nights from booking_details table
select max(minimum_nights) from listings;

##16.Write a query to show average availability_365
select avg(availability_365) from listings;

#17.Write a query to show id , availability_365 and all availability_365 values greater than 300
select listing_id, availability_365 from listings l 
where availability_365>300;

#18.Write a query to show count of id where price is in between 300 to 400
select count(listing_id) from listings 
where price between 300 and 400;

#19 Write a query to show count of id where minimum_nights spend is less than 5
select count(listing_id) from listings where minimum_nights<5;

#20.Write a query to show count where minimum_nights spend is greater than 100
select count(listing_id) from listings where minimum_nights>100;

#21.Write a query to show all data of listings & booking_details
select * from listings inner join details on listings.listing_id = details.id;

#22.Write a query to show host name and price
select d.host_name, l.price
 from details d inner join listings l
 on d.id= l.listing_id;

#23.Write a query to show room_type and price
select d.room_type, l.price
from details d inner join listings l
on d.id=l.listing_id;

#24.Write a query to show neighbourhood_group & minimum_nights spend
select d.neighbourhood_group, l.minimum_nights
from details d inner join listings l
on d.id=l.listing_id;

#25.Write a query to show neighbourhood & availability_365
select d.neighbourhood, l.availability_365
from details d inner join listings l
on d.id=l.listing_id;

#26.Write a query to show total price by neighbourhood_group
select  sum(l.price) total_price, d.neighbourhood_group
from listings l inner join details d
on d.id= l.listing_id
group by neighbourhood_group;

#27.Write a query to show maximum price by neighbourhood_group
select neighbourhood_group, max(price) max_price 
from details d inner join listings l
on d.id=l.listing_id 
group by neighbourhood_group;

#28 Write a query to show maximum night spend by neighbourhood_group
select neighbourhood_group, max(minimum_nights) max_price 
from details d inner join listings l
on d.id=l.listing_id 
group by neighbourhood_group;

#29.Write a query to show maximum reviews_per_month spend by neighbourhood
select d.neighbourhood, max(l.reviews_per_month) max_review
from details d inner join listings l
on d.id=l.listing_id 
group by neighbourhood;

#30.Write a query to show maximum price by room type
select room_type, max(price) max_price
from listings l inner join details d
on d.id=l.listing_id group by room_type;

#31.Write a query to show average number_of_reviews by room_type
select room_type, avg(number_of_reviews) avg_review
from listings l inner join details d
on d.id=l.listing_id group by room_type;

#32. Write a query to show average price by room type
select room_type, avg(price) avg_price
from listings l inner join details d
on d.id=l.listing_id group by room_type;

#33. Write a query to show average night spend by room type
select room_type, avg(minimum_nights) avg_nights
from listings l inner join details d
on d.id=l.listing_id group by room_type;
 
#34.Write a query to show average price by room type but average price is less than 100
select room_type, avg(price) avg_price
from details d inner join listings l
on d.id=l.listing_id 
group by room_type
having avg_price<100;

#35.Write a query to show average night by neighbourhood and average_nights is greater than 5
select neighbourhood, avg(minimum_nights) avg_nights
from listings l inner join details d
on l.listing_id= d.id 
group by d.neighbourhood 
having avg_nights>5;

#36.Write a query to show all data from listings where price is greater than 200 using sub-query.
select * from listings where listing_id in (select listing_id from listings where Price  > 200);

#37.Write a query to show all values from booking_details table where host id is 314941 using sub-query.
select * from details where id in (select host_id from details where host_id=314941);

#38.Find all pairs of id having the same host id, each pair coming once only.  
select distinct l1.listing_id , d.host_id 
from listings l1 inner join details d
where  d.host_id = l1.listing_id;


#39.Write an sql query to show fetch all records that have the term cozy in name
select * from details where name= 'cozy';

#40 Write an sql query to show price, host id, neighbourhood_group of manhattan neighbourhood_group
select l.price, d.host_id, d.neighbourhood_group
from listings l inner join details d
on l.listing_id=d.id 
where neighbourhood_group= 'manhattan';

#41.Write a query to show id , host name, neighbourhood and price but only for Upper West Side & Williamsburg neighbourhood, 
#also make sure price is greater than 100

select id, host_name, neighbourhood, price 
from listings l inner join details d
on l.listing_id=d.id
where neighbourhood in ( 'upper west side', 'williamsburg')
having price>200;

#42.Write a query to show id , host name, neighbourhood and price for host name Elise and neighbourhood is Bedford-Stuyvesant
select id, host_name, neighbourhood, price
from listings l inner join details d
on l.listing_id=d.id 
where host_name= 'elise' and neighbourhood='bedford-stuyvesant';

#43.Write a query to show host_name, availability_365,minimum_nights only for 100+ availability_365 and minimum_nights
select host_name, availability_365, minimum_nights 
from listings l inner join details d
on l.listing_id= d.id 
where availability_365>100 and minimum_nights>100;

#44.Write a query to show to fetch id , host_name , number_of_reviews, and reviews_per_month but show only that records
#where number of reviews are 500+ and review per month is 5+
select id, host_name, number_of_reviews as reviews, reviews_per_month as month
from listings l inner join details d
on l.listing_id=d.id 
where number_of_reviews>500  and reviews_per_month>5;

#45.Write a query to show neighbourhood_group which have most total number of review
select neighbourhood_group, sum(number_of_reviews) as total_review
from listings l inner join details d
on l.listing_id= d.id 
group by neighbourhood_group
order by total_review desc
limit 1;

#46.Write a query to show host name which have most cheaper total price
select host_name, sum(price) as min_price
from listings l inner join details d
on l.listing_id=d.id 
group by d.host_name 
order by min_price asc
limit 1;

#47.Write a query to show host name which have most costly total price
select host_name, sum(price) total_price
from listings l inner join details d
on l.listing_id=d.id 
group by d.host_name 
order by total_price desc
limit 1;


#48. Write a query to show host name which have max price using sub-query
select host_name, price
from listings l inner join details d
on l.listing_id=d.id 
where price in (select max(price) from listings);

#49.      Write a query to show neighbourhood_group where price is less than 100
select neighbourhood_group, price
from listings l inner join details d
on l.listing_id=d.id
having price<100;

#50.      Write a query to find max price, average availability_365 for each room type and order in ascending by maximum price.
select room_type,max(price) max_price, avg(availability_365)
from listings l inner join details d
on l.listing_id=d.id 
group by d.room_type 
order by max_price asc;

