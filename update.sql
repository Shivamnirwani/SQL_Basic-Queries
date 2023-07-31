update F21_S003_17_Owner 
set Owner_Name= 'Paul Alfred', Owner_Email='alfred23@gmail.com', Payment= 200 
where Owner_ID='ow0001';

delete from F21_S003_17_EmployeeEmp_Address 
where Emp_ID ='Emp0017';


update F21_S003_17_Booking
set Pickup_Location= 'Las Vegas', Drop_Location= 'Los Angeles', Branch_ID= 'Branch0005' 
Where Booking_ID='BID001';

update F21_S003_17_Booking
set Pickup_Location= 'Las Vegas', Drop_Location= 'Los Angeles', Branch_ID= 'Branch0005' 
Where Booking_ID='BID021';

update F21_S003_17_Booking
set Pickup_Location= 'Baytown', Drop_Location= 'Houston', Branch_ID= 'Branch0002' 
Where Booking_ID='BID022';

update F21_S003_17_Booking
set Pickup_Location= 'Austin', Drop_Location= 'Temple', Branch_ID= 'Branch0003' 
Where Booking_ID='BID026';





update F21_S003_17_Vehicle
set Vehicle_Class= 'Sedan', Maintainance_cost= 22, Category='Car'
Where Vehicle_ID='vh00003';

update F21_S003_17_Vehicle
set Vehicle_Class= 'Scooter', Maintainance_cost=33 , Category='Bike'
Where Vehicle_ID='vh00007';

update F21_S003_17_Vehicle
set Vehicle_Class= 'SUV', Maintainance_cost=38 , Category='Minitruck', Booked='Yes'
Where Vehicle_ID='vh00018';

update F21_S003_17_Vehicle
set Vehicle_Class= 'Hatchback', Maintainance_cost=25, Category='Minitruck', Booked='Yes'
Where Vehicle_ID='vh00014';

update F21_S003_17_Vehicle
set Vehicle_Class= 'Sport', Maintainance_cost=43 , Category='Car', Booked='Yes'
Where Vehicle_ID='vh00016';

update F21_S003_17_Vehicle
set Vehicle_Class= 'Sedan', Maintainance_cost=28 , Category='Bike', Booked='Yes'
Where Vehicle_ID='vh00020';

update F21_S003_17_Vehicle
set Vehicle_Class= 'Scooter', Maintainance_cost=28 , Category='Car', Booked='Yes'
Where Vehicle_ID='vh00021';

update F21_S003_17_Vehicle
set Vehicle_Class= 'Hatchback', Maintainance_cost=35 , Category='Bike'
Where Vehicle_ID='vh00017';

update F21_S003_17_BookingCost
set Trip_Cost= 325, Booking_Date= '17-Nov-2021' 
Where Booking_ID='BID001';

update F21_S003_17_BookingCost
set Trip_Cost= 625, Booking_Date= '22-Nov-2021'
Where Booking_ID='BID014';

update F21_S003_17_BookingCost
set Trip_Cost= 500, Booking_Date= '15-Nov-2021'
Where Booking_ID='BID018';

update F21_S003_17_BookingCost
set Trip_Cost= 325, Booking_Date= '06-Nov-2021'
Where Booking_ID='BID001';

update F21_S003_17_BookingCost
set Trip_Cost= 305, Booking_Date= '19-Nov-2021'
Where Booking_ID='BID003';

update F21_S003_17_BookingCost
set Trip_Cost= 475, Booking_Date= '09-Nov-2021'
Where Booking_ID='BID020';

update F21_S003_17_BookingCost
set Trip_Cost= 457, Booking_Date= '15-Jun-2021', Booking_Time= '15-Jun-2021 11:00:00 AM' ,Booking_EndTime='15-Jun-2021 10:00:00 PM'
Where Booking_ID='BID016';

update F21_S003_17_BookingCost
set Trip_Cost= 700, Booking_Date= '27-Apr-2021', Booking_Time= '15-Apr-2021 11:00:00 AM' ,Booking_EndTime='15-Apr-2021 10:00:00 PM'
Where Booking_ID='BID009';

update F21_S003_17_BookingCost
set Trip_Cost= 444, Booking_Date= '11-Mar-2021', Booking_Time= '15-Mar-2021 11:00:00 AM' ,Booking_EndTime='15-Mar-2021 10:00:00 PM'
Where Booking_ID='BID007';

update F21_S003_17_BookingCost
set Trip_Cost= 440, Booking_Date= '12-Nov-2021', Booking_Time= '12-Nov-2021 01:30:00 PM' ,Booking_EndTime='12-Nov-2021 10:00:00 PM'
Where Booking_ID='BID036';

update F21_S003_17_BookingCost
set Trip_Cost= 380, Booking_Date= '13-Nov-2021', Booking_Time= '13-Nov-2021 10:30:00 AM' ,Booking_EndTime='13-Nov-2021 10:00:00 PM'
Where Booking_ID='BID037';




update F21_S003_17_Reviews
set Vehicle_Rating= 10, Trip_Rating= 10
Where Booking_ID='BID007';

update F21_S003_17_Reviews
set Vehicle_Rating= 8, Trip_Rating= 9
Where Booking_ID='BID011';

update F21_S003_17_Reviews
set Vehicle_Rating= 9, Trip_Rating= 9
Where Booking_ID='BID029';

update F21_S003_17_Reviews
set Vehicle_Rating= 7, Trip_Rating= 9
Where Booking_ID='BID030';

update F21_S003_17_Reviews
set Vehicle_Rating= 9, Trip_Rating= 9
Where Booking_ID='BID031';
