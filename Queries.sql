SELECT * FROM Passenger LIMIT 100;
SELECT * FROM Ticket LIMIT 100;
SELECT * FROM Port LIMIT 100;

SELECT p.Name, p.Age, s.Survived 
FROM Passenger p
JOIN Survival_Record s ON p.Passenger_ID = s.Passenger_ID
LIMIT 100;

SELECT Class, AVG(Fare) as Average_Fare, COUNT(*) as Passenger_Count
FROM Ticket
GROUP BY Class;