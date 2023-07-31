--for readability
set lin 3000;
set pages 3000;
column rank format 99;


--b1 List of branches from most to least number of bookings, with this we can eliminate branches with poor performance?

pro Branches ranked from most bookings to least

select dense_rank()over (order by count desc)as Rank,Branch_name,count as Number_of_Bookings
 from
(
select Branch_ID as branch, count(Branch_ID)as count
from F21_S003_17_Booking
group by Branch_ID
order by count(Branch_ID) ) bb,F21_S003_17_branch b
where bb.branch=b.branch_id
order by count desc;


--b2.Which categories of vehicles are rented frequently so that we can increase the number of vehicles of that category?

pro Categories of vehicles which are rented frequently

select category,count(*) as Times_booked 
from
(
select category,booked 
from F21_S003_17_vehicle
) 
where booked='Yes' 
group by rollup(category) 
order by count(*) 
desc;

--b3.During which time of the day we have a greater number of bookings and/or active trips compared to the rest of the day?

pro Time of the day with greater number of bookings

column Booking_Start_Time FORMAT A20;
select distinct TT as Booking_Start_Time,count(*) as Occurence
 from (SELECT TO_CHAR(Booking_time, 'HH24:MI') TT
 FROM F21_S003_17_BookingCost
 bc )
 group by TT
 order by count(*) desc;

--b4.Most popular drop location

pro Most popular drop locations

select dense_rank()over (order by count(*) desc)as Rank, Drop_Location, count(*) as Occurence
from F21_S003_17_Booking 
where Drop_Location is not null 
group by Drop_Location
order by count(*) desc;

--b4.Most popular pickup location

pro Most popular pickup locations

select dense_rank()over (order by count(*) desc)as Rank, Pickup_Location, count(*) as Occurence
from F21_S003_17_Booking 
where Pickup_Location is not null 
group by Pickup_Location
order by count(*) desc;

--b5,6.What is the revenue generated and operating cost by each class of vehicle?

pro Revenue generated, Net profit and operating cost by each class of vehicle

select rank()over (order by trip_cost desc)as Rank,Vehicle_class,Trip_cost as revenue, Maintainance_cost as operating_cost, Trip_cost-Maintainance_cost as Net_Profit
from 
(
select distinct vehicle_class,max(Trip_cost) as Trip_cost,max(mc) as Maintainance_cost 
from
(
select id as ko ,sum(Trip_cost)as trip_cost,sum(Maintainance_cost)as mc,vehicle_class
 from
(
select vehicle_id as id,Trip_cost  
from F21_S003_17_booking b,F21_S003_17_BookingCost bc 
where b.booking_id=bc.booking_id
)
vt,F21_S003_17_vehicle v 
where vt.id=v.vehicle_id 
group by rollup(Vehicle_class,Trip_cost,id,maintainance_cost)) 
group by vehicle_class 
order by trip_cost desc)
group by (Vehicle_class,trip_cost,maintainance_cost);

--b7.List the vehicles of each class by rating, what is the average rating of all vehicles? Which classes have better ratings than the average?

pro Cumulative rating of every vehicle in each class, ranked best to worst

select rank() over(order by Vehicle_rating desc)as rank,
vehicle_class,vehicle_rating as cumulative_vehicle_rating
from (
select distinct vehicle_class,max(vehicle_rating) as vehicle_rating
from (
select vehicle_class,sum(vehicle_rating) as vehicle_rating
from F21_S003_17_Vehicle v,
(
select vehicle_id as vid, vehicle_rating
from F21_S003_17_Got g,F21_S003_17_Reviews r
where g.booking_id=r.booking_id) rv
where v.vehicle_id=rv.vid
group by rollup(vehicle_class,vehicle_rating))
group by vehicle_class)
group by(vehicle_class,vehicle_rating)
order by vehicle_rating desc;

--b8.Which locations are more likely to be overbooked? Can we increase the availability of vehicles in those locations?
-- same as b4

--b9.What is the average duration for a trip booking? Which durations do customers prefer the most?

pro Durations which customers prefer the most and total average booking duration

column duration_in_hours format 99.99;
column Average_Duration format 99.9999;

select distinct duration_in_hours,count(*) as Occurence , avg(duration_in_hours) as Average_Duration
from 	(SELECT 
		(to_number(TO_CHAR(F21_S003_17_BookingCost.Booking_EndTime,'HH24'))+(to_number(TO_CHAR(F21_S003_17_BookingCost.Booking_EndTime,'MI'))/60)-to_number(TO_CHAR(F21_S003_17_BookingCost.Booking_Time,'HH24'))-(to_number(TO_CHAR(F21_S003_17_BookingCost.Booking_Time,'MI'))/60)) as duration_in_hours FROM F21_S003_17_BookingCost) 
group by cube(duration_in_hours)
order by count(*) desc;

--b10.Which days of the week have higher demand for vehicles compared to the rest of the week? Which category of vehicles have higher demand on which days?

pro Days of the week ranked acoording to demand for vehicles by each day

select dense_rank()over (order by count(*) desc)as Rank,day,count(*) as Occurence
from (SELECT TO_CHAR(Booking_date, 'DY') Day FROM F21_S003_17_BookingCost)
 group by day;