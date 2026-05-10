-- CIT 241: Term Project Database Design [cite: 1]
CREATE DATABASE IF NOT EXISTS titanic_db;
USE titanic_db;

-- Drop tables in reverse order of relationships [cite: 14]
DROP TABLE IF EXISTS Manifest;
DROP TABLE IF EXISTS Survival_Record;
DROP TABLE IF EXISTS Passenger;
DROP TABLE IF EXISTS Ticket;
DROP TABLE IF EXISTS Port;
DROP TABLE IF EXISTS Titanic_Staging;

-- Staging Table for CSV import [cite: 19]
CREATE TABLE Titanic_Staging (
    PassengerId INT, Survived INT, Pclass INT, Name VARCHAR(255), 
    Gender VARCHAR(50), Age FLOAT, SibSp INT, Parch INT, 
    Ticket VARCHAR(100), Fare FLOAT, Cabin VARCHAR(50), Embarked CHAR(1)
);

-- Normalized Entities (3-8 entities required) [cite: 14]
CREATE TABLE Port (
    Port_Code CHAR(1) PRIMARY KEY,
    City_Name VARCHAR(50) NOT NULL
) ENGINE=InnoDB;

CREATE TABLE Ticket (
    Ticket_Number VARCHAR(100) PRIMARY KEY,
    Fare DECIMAL(10, 2),
    Class INT NOT NULL
) ENGINE=InnoDB;

CREATE TABLE Passenger (
    Passenger_ID INT PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Age FLOAT NULL, -- Null allowed for missing data [cite: 16]
    Gender VARCHAR(10)
) ENGINE=InnoDB;

CREATE TABLE Survival_Record (
    Passenger_ID INT PRIMARY KEY,
    Survived BOOLEAN NOT NULL,
    CONSTRAINT FK_Survival_Passenger FOREIGN KEY (Passenger_ID) REFERENCES Passenger(Passenger_ID)
) ENGINE=InnoDB;

CREATE TABLE Manifest (
    Manifest_ID INT AUTO_INCREMENT PRIMARY KEY,
    Passenger_ID INT NOT NULL,
    Ticket_Number VARCHAR(100) NOT NULL,
    Port_Code CHAR(1) NOT NULL,
    CONSTRAINT FK_Manifest_Passenger FOREIGN KEY (Passenger_ID) REFERENCES Passenger(Passenger_ID),
    CONSTRAINT FK_Manifest_Ticket FOREIGN KEY (Ticket_Number) REFERENCES Ticket(Ticket_Number),
    CONSTRAINT FK_Manifest_Port FOREIGN KEY (Port_Code) REFERENCES Port(Port_Code)
) ENGINE=InnoDB;