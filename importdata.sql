USE titanic_db;

-- Import raw CSV [cite: 19, 20]
LOAD DATA LOCAL INFILE 'C:/Users/Moist/Downloads/Titanic Dataset.csv' 
INTO TABLE Titanic_Staging 
FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\r\n' IGNORE 1 ROWS;

-- Populate Port Reference table
INSERT IGNORE INTO Port (Port_Code, City_Name) VALUES 
('C', 'Cherbourg'), ('Q', 'Queenstown'), ('S', 'Southampton');

-- Populate Ticket and Passenger (Unique values only)
INSERT IGNORE INTO Ticket (Ticket_Number, Fare, Class)
SELECT DISTINCT Ticket, Fare, Pclass FROM Titanic_Staging;

INSERT IGNORE INTO Passenger (Passenger_ID, Name, Age, Gender)
SELECT PassengerId, Name, Age, Gender FROM Titanic_Staging;

-- Populate Survival and Manifest
INSERT IGNORE INTO Survival_Record (Passenger_ID, Survived)
SELECT PassengerId, Survived FROM Titanic_Staging;

INSERT IGNORE INTO Manifest (Passenger_ID, Ticket_Number, Port_Code)
SELECT PassengerId, Ticket, UPPER(TRIM(Embarked)) 
FROM Titanic_Staging 
WHERE Embarked IS NOT NULL AND TRIM(Embarked) != '';