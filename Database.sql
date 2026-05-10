CREATE DATABASE IF NOT EXISTS titanic_db;
USE titanic_db;

DROP TABLE IF EXISTS Manifest;
DROP TABLE IF EXISTS Survival_Record;
DROP TABLE IF EXISTS Passenger;
DROP TABLE IF EXISTS Ticket;
DROP TABLE IF EXISTS Port;
DROP TABLE IF EXISTS Titanic_Staging;

CREATE TABLE Titanic_Staging (
    PassengerId INT, Survived INT, Pclass INT, Name VARCHAR(255), 
    Gender VARCHAR(50), Age FLOAT, SibSp INT, Parch INT, 
    Ticket VARCHAR(100), Fare FLOAT, Cabin VARCHAR(50), Embarked CHAR(1)
);

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
    Age FLOAT NULL,
    Gender VARCHAR(10)
) ENGINE=InnoDB;

CREATE TABLE Survival_Record (
    Passenger_ID INT PRIMARY KEY,
    Survived BOOLEAN NOT NULL,
    FOREIGN KEY (Passenger_ID) REFERENCES Passenger(Passenger_ID)
) ENGINE=InnoDB;

CREATE TABLE Manifest (
    Manifest_ID INT AUTO_INCREMENT PRIMARY KEY,
    Passenger_ID INT,
    Ticket_Number VARCHAR(100),
    Port_Code CHAR(1),
    FOREIGN KEY (Passenger_ID) REFERENCES Passenger(Passenger_ID),
    FOREIGN KEY (Ticket_Number) REFERENCES Ticket(Ticket_Number),
    FOREIGN KEY (Port_Code) REFERENCES Port(Port_Code)
) ENGINE=InnoDB;