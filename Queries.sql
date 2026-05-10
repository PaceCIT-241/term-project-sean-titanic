USE titanic_db;

SELECT * FROM Passenger LIMIT 100;

SELECT p.Name, s.Survived 
FROM Passenger p
JOIN Survival_Record s ON p.Passenger_ID = s.Passenger_ID 
LIMIT 100;

SELECT Class, AVG(Fare) AS Average_Fare, COUNT(*) AS Total_Tickets 
FROM Ticket 
GROUP BY Class;