create Table FLIGHT
(Flight_ID NUMBER,
departure_time VARCHAR(5),
arrival_time VARCHAR(5),
total_seats NUMBER,
price FLOAT,
flight_date date,
Primary key (Flight_ID));

Create Table PASSENGER_PROFILE
(Profile_ID NUMBER,
first_name VARCHAR(20),
last_name VARCHAR(20),
phone_number NUMBER,
email_id VARCHAR(20),
Primary key (Profile_ID));


Create table TICKET_INFO(
Ticket_ID NUMBER,
Flight_ID NUMBER,
Profile_ID NUMBER,
primary key (Ticket_ID),
foreign key (Flight_ID) references FLIGHT (Flight_ID),
foreign key (Profile_ID) references PASSENGER_PROFILE (Profile_ID));


Create Table AIRLINE(
Airline_ID NUMBER,
Flight_ID NUMBER,
Airline_name varchar(20),
primary key(Airline_ID),
foreign key (Flight_ID) references FLIGHT (Flight_ID));


Create Table AIRPORT(
Airport_ID NUMBER,
Flight_ID NUMBER,
Airport_name varchar(20),
Airport_address varchar(20),
primary key(Airport_ID),
foreign key (Flight_ID) references FLIGHT (Flight_ID));

Create table CREDIT_CARD_DETAILS(
Card_No NUMBER,
Profile_ID NUMBER,
Card_type VARCHAR(20),
expiration_month NUMBER,
expiration_year NUMBER,
primary key (Card_No),
foreign key (Profile_ID) references PASSENGER_PROFILE (Profile_ID));



Insert into Flight values (1,11,22,150,1200,'4-Dec-2021');
Insert into Flight values (2,8,19,200,1350,'10-Dec-2021');
Insert into Flight values (3,7,11,70,1500,'16-Dec-2021');
Insert into Flight values (4,13,20,100,1000,'20-Dec-2021');
Insert into Flight values (5,15,23,350,900,'25-Dec-2021');

Insert into PASSENGER_PROFILE values (1,'Abdul','Rahim',9661234567,'abdulrahim@gmail.com');
Insert into PASSENGER_PROFILE values (2,'Abdullah','Ameer',9665674563,'ammer07@gmail.com');
Insert into PASSENGER_PROFILE values (3,'Hammad','Qudoos',9669088675,'H.Qudoos1@gmail.com');
Insert into PASSENGER_PROFILE values (4,'Qasim','Javed',9665578342,'Javed_010@gmail.com');
Insert into PASSENGER_PROFILE values (5,'Ali','Bin Shoiab',9661123556,'BinSh_Ali@gmail.com');


Insert into TICKET_INFO values (1,2,1);
Insert into TICKET_INFO values (2,3,4);
Insert into TICKET_INFO values (3,4,2);
Insert into TICKET_INFO values (4,5,3);
Insert into TICKET_INFO values (5,1,5);


Insert into AIRLINE values (1,2,'Flynas');
Insert into AIRLINE values (2,4,'Al Anwa Aviation');
Insert into AIRLINE values (3,3,'Saudi Gulf Airlines');
Insert into AIRLINE values (4,5,'ASACO Airlines');
Insert into AIRLINE values (5,1,'SNAS Aviation');


Insert into AIRPORT values (1,2,'Abdulaziz Airport','Jeddah');
Insert into AIRPORT values (2,3,'Khaled Airport','Riyadh');
Insert into AIRPORT values (3,1,'King Fahd Airport','Ad Dammam');
Insert into AIRPORT values (4,5,'Al-Jawf Airport','Al-Jawf');
Insert into AIRPORT values (5,4,'Ta’if Airport','Ta’if');


Insert into CREDIT_CARD_DETAILS values (1,1,'Master Card',3,2025);
Insert into CREDIT_CARD_DETAILS values (2,3,'Visa Card',1,2028);
Insert into CREDIT_CARD_DETAILS values (3,2,'Master Card',5,2024);
Insert into CREDIT_CARD_DETAILS values (4,4,'Visa Card',11,2025);
Insert into CREDIT_CARD_DETAILS values (5,5,'Union Pay Card',10,2030);

SELECT FLIGHT_ID, FLIGHT_DATE 
FROM FLIGHT 
ORDER BY FLIGHT_DATE DESC;

select card_type, count(card_No) as card_count from 
CREDIT_CARD_DETAILS
 group by card_type;

Select flight_id, flight_date, price ,
case when price <3000 then 'Air_passenger ‘
when price between 3000 and 4000 then 'Air_bus'
 when price >4000 then 'Executive_passenger' 
else 'n/a’
 end Flight_Tme 
from FLIGHT

SELECT 
FLIGHT_ID, total_seats,flight_date,price 
FROM FLIGHT 
WHERE price = (SELECT MAX (price) 
FROM Flight)



--2 create procedure from first name and flight date to give ticket information for all customer the resulting print ticket information

create or replace procedure TICKET_INFO_Passenger (vfirst_name in TICKET_INFO.first_name%type, vflight_date TICKET_INFO.flight_date%type)
is
cursor curs_prop is 
select p.first_name,last_name,departure_time,arrival_time,flight_date,phone_number,price,Airline_name,
Airport_name,Airport_address 
from TICKET_INFO  p where p.first_name =vfirst_name  and p.flight_date <=vflight_date ;

begin
    for rec in curs_prop 
    loop
        dbms_output.put_line (rec.first_name || '/'||rec.last_name || ' '||rec.arrival_time || '/' ||
        rec.departure_time || '/' ||rec.flight_date || '/' ||rec.phone_number || '/' ||rec.price ||'/' ||rec.Airline_name||'/' ||rec.Airport_name|| '/' ||rec.Airport_address  );
   
end loop;
end;
--3 execute the procedure
Exec TICKET_INFO_Passenger ('Abdul', '4-Dec-2021');
Exec TICKET_INFO_Passenger ('Abdullah', '10-Dec-2021');
Exec TICKET_INFO_Passenger ('Hammad', '16-Dec-2021');
-----------------------------------------------------------------------------------
--1 create the database tables and insert data 

create Table FLIGHT
(Flight_ID NUMBER,
departure_time VARCHAR(10),
arrival_time VARCHAR(10),
total_seats NUMBER,
price FLOAT,
flight_date date,
Primary key (Flight_ID));


Insert into Flight values (1,'11:00AM','2:00PM',150,1200,'4-Dec-2021');
Insert into Flight values (2,'8:00AM','1:00PM',200,1350,'10-Dec-2021');
Insert into Flight values (3,'7;00PM','12:00AM',70,1500,'16-Dec-2021');
Insert into Flight values (4,'5:30PM','10:30PM',100,1000,'20-Dec-2021');
Insert into Flight values (5,'2:45AM','7:00AM',350,900,'25-Dec-2021');


---Procedure priceCheck has (MinPrice) as a parameter compares the flight price with the Minimum price and then print the 
(flight_ID,price) of any flight with price that is less than MinPrice.

Create or replace procedure priceCheck (
MinPrice number) AS 
CURSOR executive IS 
SELECT Flight_ID,price
price FROM FLIGHT 
WHERE price > MinPrice;
BEGIN
FOR v_cursrec IN executive LOOP 
dbms_output. put_line 
(v_cursrec.Flight_ID||' '||v_cursrec.price);
END LOOP;
END priceCheck;

EXEC priceCheck(500);
EXEC priceCheck(900);







