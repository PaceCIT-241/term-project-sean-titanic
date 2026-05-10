USE titanic_db;

-- 1. Top 100 rows from each table [cite: 22]
SELECT * FROM Passenger LIMIT 100;
SELECT * FROM Ticket LIMIT 100;

-- 2. Join statement for related tables [cite: 23]
SELECT p.Name, s.Survived 
FROM Passenger p
JOIN Survival_Record s ON p.Passenger_ID = s.Passenger_ID 
LIMIT 100;

-- 3. Aggregate query summarizing the data [cite: 24]
SELECT Class, AVG(Fare) AS Average_Fare, COUNT(*) AS Total_Tickets 
FROM Ticket 
GROUP BY Class;