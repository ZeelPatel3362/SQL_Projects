# Blinkit: Grocery Product Analysis

select * from gstore;


#1. Import Data from table Grocery Sales using the provided CSV File.

select * from gstore;

#2. Write an SQL query to show all Item_Identifier

select item_identifier from gstore;

#3. Write an SQL query to show count of total Item_Identifier.

select count(item_identifier) from gstore;

#4. Write an SQL query to show maximum Item Weight.

select max(item_weight) from gstore;

#5. Write an SQL query to show minimum Item Weight.

select min(item_weight) from gstore;

#6. Write an SQL query to show average Item_Weight.

select avg(item_weight) from gstore;

#7. Write an SQL query to show count of Item_Fat_Content WHERE Item_Fat_Content is Low Fat.

select count(item_fat_content) from gstore 
where item_fat_content = 'low fat';

#8. Write an SQL query to show count of Item_Fat_Content WHERE Item_Fat_Content is Regular.

select count(item_fat_content) from gstore 
where item_fat_content = 'regular';

#9. Write an SQL query to show maximum Item_MRP

select max(item_mrp) from gstore;

#10. Write an SQL query to show minimum Item_MRP

select min(item_mrp) from gstore;

#11. Write an SQL query to show Item_Identifier , Item_Fat_Content ,Item_Type, Item_MRP whose Item_MRP is greater than 200.

select Item_Identifier , Item_Fat_Content ,Item_Type, Item_MRP  from gstore 
where item_mrp > 200;

#12. Write an SQL query to show maximum Item_MRP WHERE Item_Fat_Content is Low Fat

select max(item_mrp) from gstore 
where item_fat_content = 'low fat';

#13. Write an SQL query to show minimum Item_MRP whose Item_Fat_Content is Low Fat

select min(item_mrp) from gstore 
where item_fat_content = 'low fat';

#14. Write an SQL query to show ALL DATA WHERE item MRP is BETWEEN 50 to 100

select * from gstore 
where item_mrp between 50 and 100;

#15. Write an SQL query to show ALL UNIQUE value of Item_Fat_Content

select distinct item_fat_content from gstore;

#16. Write an SQL query to show ALL UNIQUE value of  Item_Type

select distinct item_type from gstore;

#17. Write an SQL query to show ALL DATA in descending ORDER by Item MRP

select * from gstore 
order by item_mrp desc;

#18. Write an SQL query to show ALL DATA in ascending ORDER by Item_Outlet_Sales

select * from gstore 
order by item_outlet_sales;

#19. Write an SQL query to show ALL DATA in ascending by Item_Type

select * from gstore 
order by item_type;

#20. Write an SQL query to show DATA of item_type dairy & Meat

select * from gstore 
where item_type in ('dairy','meat');

#21. Write an SQL query to show ALL UNIQUE value of Outlet_Size

select distinct outlet_size from gstore;

#22. Write an SQL query to show ALL UNIQUE value of Outlet_Location_Type

select distinct outlet_location_type from gstore;

#23. Write an SQL query to show ALL UNIQUE value of Outlet_Type

select distinct outlet_type from gstore;

#24. Write an SQL query to show count of number of items by Item_Type  and order it in descending order

select item_type, count(item_identifier) from gstore 
group by item_type 
order by count(item_identifier) desc;

#25. Write an SQL query to show count of number of items by Outlet_Size and ordered it in ascending order

select outlet_size, count(item_identifier) from gstore 
group by outlet_size 
order by count(item_identifier);

#26. Write an SQL query to show count of number of items by Outlet_Type  and ordered it in descending order.

select outlet_type, count(item_identifier) from gstore 
group by outlet_type 
order by count(item_identifier) desc;

#27. Write an SQL query to show count of items by Outlet_Location_Type and order it indescending order

select Outlet_Location_Type, count(item_identifier) from gstore 
group by outlet_location_type
order by count(item_identifier) desc;

#28. Write an SQL query to show maximum MRP by Item_Type

select item_type , max(item_mrp) from gstore 
group by item_type;

#29. Write an SQL query to show minimum MRP by Item_Type

select item_type , min(item_mrp) from gstore 
group by item_type;

#30. Write an SQL query to show minimum MRP by Outlet_Establishment_Year and order it in descending order.

select Outlet_Establishment_Year  , min(item_mrp) from gstore 
group by outlet_establishment_year
order by min(item_mrp) desc;

#31. Write an SQL query to show maximum MRP by Outlet_Establishment_Year and order it in descending order.

select Outlet_Establishment_Year  , max(item_mrp) from gstore 
group by outlet_establishment_year
order by max(item_mrp) desc;

#32. Write an SQL query to show average MRP by Outlet_Size and order it in descending order.

select Outlet_size  , avg(item_mrp) from gstore 
group by outlet_size
order by avg(item_mrp) desc;

#33. Write an SQL query to Average MRP by Outlet_Type and ordered in ascending order.

select Outlet_type  , avg(item_mrp) from gstore 
group by outlet_type
order by avg(item_mrp);

#34. Write an SQL query to show maximum MRP by Outlet_Type

select Outlet_type  , max(item_mrp) from gstore 
group by outlet_type
order by max(item_mrp);

#35. Write an SQL query to show maximum Item_Weight by Item_Type

select item_type,max(item_weight) from gstore
group by item_type
order by max(item_weight) desc;

#36. Write an SQL query to show maximum Item_Weight by Outlet_Establishment_Year

select outlet_establishment_year,max(item_weight) from gstore
group by outlet_establishment_year
order by max(item_weight);

#37. Write an SQL query to show minimum Item_Weight by Outlet_Type

select outlet_type, min(item_weight) from gstore 
group by outlet_type;

#38. Write an SQL query to show average Item_Weight by Outlet_Location_Type and arrange it by descending order

select Outlet_Location_Type, avg(item_weight) from gstore 
group by outlet_location_type
order by avg(item_weight) desc;

#39. Write an SQL query to show maximum Item_Outlet_Sales by Item_Type

select item_type,max(item_outlet_sales) from gstore
group by item_type;

#40. Write an SQL query to show minimum Item_Outlet_Sales by Item_Type

select item_type,min(item_outlet_sales) from gstore
group by item_type;

#41. Write an SQL query to show minimum Item_Outlet_Sales by Outlet_Establishment_Year

select outlet_establishment_year,min(item_outlet_sales) from gstore
group by outlet_establishment_year;

#42. Write an SQL query to show maximum Item_Outlet_Sales by Outlet_Establishment_Year and order it by descending order

select outlet_establishment_year,max(item_outlet_sales) from gstore
group by outlet_establishment_year
order by max(item_outlet_sales) desc;

#43. Write an SQL query to show average Item_Outlet_Sales by Outlet_Size and order it it descending order

select outlet_size, avg(item_outlet_sales) from gstore 
group by outlet_size 
order by avg(item_outlet_sales) desc;

#44. Write an SQL query to show average Item_Outlet_Sales by Outlet_Type

select outlet_type, avg(item_outlet_sales) from gstore 
group by outlet_type; 

#45. Write an SQL query to show maximum Item_Outlet_Sales by Outlet_Type

select outlet_type, max(item_outlet_sales) from gstore 
group by outlet_type; 

#46. Write an SQL query to show total Item_Outlet_Sales by Item_Type

select item_type, sum(item_outlet_sales) from gstore 
group by item_type; 

#47. Write an SQL query to show total Item_Outlet_Sales by Item_Fat_Content

select item_fat_content, sum(item_outlet_sales) from gstore 
group by item_fat_content; 

#48. Write an SQL query to show maximum Item_Visibility by Item_Type

select item_type, max(item_visibility) from gstore 
group by item_type; 

#49. Write an SQL query to show Minimum Item_Visibility by Item_Type

select item_type, min(item_visibility) from gstore 
group by item_type; 

#50. Write an SQL query to show total Item_Outlet_Sales by Item_Type but only WHERE Outlet_Location_Type is Tier 1

select item_type, sum(item_outlet_sales) from gstore 
where outlet_location_type = 'tier 1'
group by item_type
order by sum(item_outlet_sales) desc;

#51. Write an SQL query to show total Item_Outlet_Sales by Item_Type WHERE Item_Fat_Content is ONLY Low Fat & LF

select item_type, sum(item_outlet_sales) from gstore 
where item_fat_content in ('low fat','lf')
group by item_type
order by sum(item_outlet_sales) desc;











