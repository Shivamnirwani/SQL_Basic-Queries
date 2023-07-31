CREATE TABLE F21_S003_17_Owner(
   Owner_Name     VARCHAR(18) NOT NULL
  ,Owner_ID       VARCHAR(10) NOT NULL PRIMARY KEY
  ,Owner_Email    VARCHAR(27) NOT NULL
  ,Owner_SSN      VARCHAR(11) NOT NULL
  ,Account_Number INTEGER  NOT NULL
  ,Routing_Number INTEGER  NOT NULL
  ,Payment        INTEGER  NOT NULL
);

CREATE TABLE F21_S003_17_Vehicle(
   Vehicle_ID        VARCHAR(17) NOT NULL
  ,Reg_Number        VARCHAR(17) NOT NULL
  ,Vehicle_Brand     VARCHAR(18) NOT NULL
  ,Number_Plate      INTEGER  NOT NULL
  ,Vehicle_Class     VARCHAR(15) NOT NULL
  ,Mileage           INTEGER  NOT NULL
  ,Maintainance_Cost INTEGER  NOT NULL
  ,Available         VARCHAR(13) NOT NULL
  ,Booked            VARCHAR(13) NOT NULL
  ,Category          VARCHAR(19) NOT NULL
  ,Owner_ID          VARCHAR(16) NOT NULL
  ,PRIMARY KEY(Vehicle_ID)
  ,FOREIGN KEY(Owner_ID) references F21_S003_17_Owner(Owner_ID) on delete cascade
);

CREATE TABLE F21_S003_17_Customer(
   Username     VARCHAR(18) NOT NULL
  ,Password     VARCHAR(18) NOT NULL
  ,Cust_Email   VARCHAR(23) NOT NULL
  ,Cust_License INTEGER  NOT NULL
  ,Cust_Name    VARCHAR(19) NOT NULL
  ,Vehicle_ID   VARCHAR(7) NOT NULL
  ,PRIMARY KEY(Username)
 ,FOREIGN KEY(Vehicle_ID) references F21_S003_17_Vehicle(Vehicle_ID) on delete cascade
);

CREATE TABLE F21_S003_17_CustomerCust_Phone(
   Username   VARCHAR(18) NOT NULL
  ,Cust_Phone VARCHAR(12) NOT NULL
  ,PRIMARY KEY(Username,Cust_Phone)
  ,FOREIGN KEY(Username) references F21_S003_17_Customer(Username) on delete cascade
);

CREATE TABLE F21_S003_17_Branch(
   Branch_ID   VARCHAR(10) NOT NULL
  ,Branch_Name VARCHAR(13) NOT NULL
  ,MngrEmp_ID  VARCHAR(7) NOT NULL
  ,PRIMARY KEY(Branch_ID)
);

CREATE TABLE F21_S003_17_Booking(
   Booking_ID      VARCHAR(16) NOT NULL
  ,Cust_Name       VARCHAR(19) NOT NULL
  ,Pickup_Location VARCHAR(24) NOT NULL
  ,Drop_Location   VARCHAR(24) NOT NULL
  ,Username        VARCHAR(18) NOT NULL
  ,Vehicle_ID      VARCHAR(7) NOT NULL
  ,Branch_ID       VARCHAR(10) NOT NULL
  ,PRIMARY KEY(Booking_ID)
  ,FOREIGN KEY(Vehicle_ID) references F21_S003_17_Vehicle(Vehicle_ID) on delete cascade
  ,FOREIGN KEY(Username) references F21_S003_17_Customer(Username) on delete cascade
  ,FOREIGN KEY(Branch_ID) references F21_S003_17_Branch(Branch_ID) on delete cascade
);

CREATE TABLE F21_S003_17_BookingCost(
   Booking_ID      VARCHAR(16) NOT NULL
  ,Trip_Cost       INTEGER  NOT NULL
  ,Booking_Time    TIMESTAMP NOT NULL
  ,Booking_Date    DATE NOT NULL
  ,Booking_EndTime TIMESTAMP NOT NULL
  ,PRIMARY KEY(Booking_ID,Booking_Time,Booking_Date,Booking_EndTime)
  ,FOREIGN KEY(Booking_ID) references F21_S003_17_Booking(Booking_ID) on delete cascade
);

CREATE TABLE F21_S003_17_Employee(
   Emp_SSN   VARCHAR(11) NOT NULL
  ,Emp_ID    VARCHAR(7) NOT NULL
  ,Emp_Name  VARCHAR(19) NOT NULL
  ,Emp_Email VARCHAR(28) NOT NULL
  ,Emp_DOB   VARCHAR(9) NOT NULL
  ,Salary    INTEGER 
  ,Branch_ID VARCHAR(10) NOT NULL
  ,Owner_ID  VARCHAR(6)
  ,PRIMARY KEY(Emp_ID)
  ,FOREIGN KEY(Branch_ID) references F21_S003_17_Branch(Branch_ID) on delete cascade
  ,FOREIGN KEY(Owner_ID) references F21_S003_17_Owner(Owner_ID) on delete cascade
);

CREATE TABLE F21_S003_17_BranchBranch_Locations(
   Branch_ID       VARCHAR(10) NOT NULL
  ,Branch_Location VARCHAR(14) NOT NULL
  ,PRIMARY KEY(Branch_ID,Branch_Location)
  ,FOREIGN KEY(Branch_ID) references F21_S003_17_Branch(Branch_ID) on delete cascade
);

CREATE TABLE F21_S003_17_EmployeeEmp_Address(
   Emp_ID      VARCHAR(7) NOT NULL
  ,Emp_Address VARCHAR(47) NOT NULL
  ,PRIMARY KEY(Emp_ID,Emp_Address)
  ,FOREIGN KEY(Emp_ID) references F21_S003_17_Employee(Emp_ID) on delete cascade
);

CREATE TABLE F21_S003_17_Got(
   Booking_ID VARCHAR(6) NOT NULL
  ,Vehicle_ID VARCHAR(7) NOT NULL
  ,PRIMARY KEY(Booking_ID,Vehicle_ID)
,FOREIGN KEY(Booking_ID) references F21_S003_17_Booking(Booking_ID) on delete cascade
,FOREIGN KEY(Vehicle_ID) references F21_S003_17_Vehicle(Vehicle_ID) on delete cascade
);

CREATE TABLE F21_S003_17_OwnerOwner_Address(
   Owner_ID      VARCHAR(6) NOT NULL
  ,Owner_Address VARCHAR(65) NOT NULL
  ,PRIMARY KEY(Owner_ID, Owner_Address)
 ,FOREIGN KEY(Owner_ID) references F21_S003_17_Owner(Owner_ID) on delete cascade
);

CREATE TABLE F21_S003_17_Reviews(
   Username       VARCHAR(18) NOT NULL
  ,Booking_ID     VARCHAR(16) NOT NULL
  ,Vehicle_Rating INTEGER 
  ,Trip_Rating    INTEGER 
  ,FeedBack       VARCHAR(34)
  ,PRIMARY KEY(Booking_ID, Username)
  ,FOREIGN KEY(Username) references F21_S003_17_Customer(Username) on delete cascade
  ,FOREIGN KEY(Booking_ID) references F21_S003_17_Booking(Booking_ID) on delete cascade
);

CREATE TABLE F21_S003_17_Work_As(
   Owner_ID  VARCHAR(16) NOT NULL
  ,Branch_ID VARCHAR(10)
  ,PRIMARY KEY(Owner_ID, Branch_ID)
 ,FOREIGN KEY(Owner_ID) references F21_S003_17_Owner(Owner_ID) on delete cascade
 ,FOREIGN KEY(Branch_ID) references F21_S003_17_Branch(Branch_ID) on delete cascade
);