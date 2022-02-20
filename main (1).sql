CREATE TABLE IF NOT EXISTS PASSENGER (
  Passenger_name VARCHAR(10),
  Category VARCHAR(10),
  Gender VARCHAR(10),
  Boarding_City VARCHAR(10),
  Destination_City VARCHAR(10),
  Distance INT,
  Bus_Type VARCHAR(10));

insert into PASSENGER(Passenger_name, Category, Gender, Boarding_City, Destination_City, Distance, Bus_Type) values("Sejal","AC","F","Bengaluru","Chennai",350,"Sleeper");
insert into PASSENGER(Passenger_name, Category, Gender, Boarding_City, Destination_City, Distance, Bus_Type) values("Anmol","Non-AC","M","Mumbai","Hyderabad",700,"Sitting");
insert into PASSENGER(Passenger_name, Category, Gender, Boarding_City, Destination_City, Distance, Bus_Type) values("Pallavi","AC","F","Panaji","Bengaluru",600,"Sleeper");
insert into PASSENGER(Passenger_name, Category, Gender, Boarding_City, Destination_City, Distance, Bus_Type) values("Khusboo","AC","F","Chennai","Mumbai",1500,"Sleeper");
insert into PASSENGER(Passenger_name, Category, Gender, Boarding_City, Destination_City, Distance, Bus_Type) values("Udit","Non-AC","M","Trivandrum","Panaji",1000,"Sleeper");
insert into PASSENGER(Passenger_name, Category, Gender, Boarding_City, Destination_City, Distance, Bus_Type) values("Ankur","AC","M","Nagpur","Hyderabad",500,"Sitting");
insert into PASSENGER(Passenger_name, Category, Gender, Boarding_City, Destination_City, Distance, Bus_Type) values("Hemant","Non-AC","M","Panaji","Mumbai",700,"Sleeper");
insert into PASSENGER(Passenger_name, Category, Gender, Boarding_City, Destination_City, Distance, Bus_Type) values("Manish","Non-AC","M","Hyderabad","Bengaluru",500,"Sitting");
insert into PASSENGER(Passenger_name, Category, Gender, Boarding_City, Destination_City, Distance, Bus_Type) values("Piyush","AC","M","Pune","Nagpur",700,"Sitting");

Select * from PASSENGER;
CREATE TABLE IF NOT EXISTS PRICE (
  Bus_Type VARCHAR(10),
  Distance INT,
  Price INT);

insert into PRICE(Bus_Type, Distance, Price) values("Sleeper",350,770);
insert into PRICE(Bus_Type, Distance, Price) values("Sleeper",500,1100);
insert into PRICE(Bus_Type, Distance, Price) values("Sleeper",600,1320);
insert into PRICE(Bus_Type, Distance, Price) values("Sleeper",700,1540);
insert into PRICE(Bus_Type, Distance, Price) values("Sleeper",1000,2200);
insert into PRICE(Bus_Type, Distance, Price) values("Sleeper",1200,2640);
insert into PRICE(Bus_Type, Distance, Price) values("Sleeper",1500,2700);
insert into PRICE(Bus_Type, Distance, Price) values("Sitting",500,620);
insert into PRICE(Bus_Type, Distance, Price) values("Sitting",600,744);
insert into PRICE(Bus_Type, Distance, Price) values("Sitting",700,868);
insert into PRICE(Bus_Type, Distance, Price) values("Sitting",1000,1240);
insert into PRICE(Bus_Type, Distance, Price) values("Sitting",1200,1488);
insert into PRICE(Bus_Type, Distance, Price) values("Sitting",1500,1860);

Select * from Price;

SELECT COUNT(CASE WHEN (Gender) = 'F'THEN 1 END) AS Female, COUNT(CASE WHEN (Gender) = 'M'THEN 1 END) AS Male FROM PASSENGER WHERE Distance >=600;

SELECT MIN(Price) FROM PRICE WHERE Bus_Type="sleeper";

SELECT * FROM PASSENGER WHERE Passenger_name LIKE 'S%';

SELECT p1.Passenger_name , p1.Boarding_City, p1.Destination_city, p1.Bus_Type, p2.Price FROM PASSENGER p1, PRICE p2 WHERE p1.Distance = p2.Distance and p1.Bus_type = p2.Bus_type;

SELECT p1.Passenger_name, p2.Price FROM PASSENGER p1, PRICE p2 WHERE p1.Distance = p2.Distance and p1.Distance=1000 and p2.Bus_type = "Sitting";

SELECT DISTINCT p1.Passenger_name, p1.Boarding_city as Destination_city, p1.Destination_city as Boardng_city, p1.Bus_type, p2.Price FROM PASSENGER p1, PRICE p2 WHERE Passenger_name = 'Pallavi' and p1.Distance = p2.Distance;

SELECT DISTINCT distance FROM PASSENGER ORDER BY Distance desc;

SELECT Passenger_name, Distance * 100.0/ (SELECT SUM(Distance) FROM passenger)FROM passenger GROUP BY Distance;


SELECT Distance,
       Price,
       CASE 
           WHEN Price>1000 
               THEN "Expensive"
           WHEN Price>500 and Price<1000
               THEN "Average Cost"
           ELSE "Cheap" 
       END category
FROM 
    PRICE;

