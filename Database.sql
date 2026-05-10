-- Create the database if it doesn't exist
CREATE DATABASE IF NOT EXISTS titanic_db;

-- Tell MySQL to use this database for the following commands
USE titanic_db;

-- 1. Create Port Table
CREATE TABLE Port (
    Port_Code CHAR(1) PRIMARY KEY,
    City_Name VARCHAR(50) NOT NULL
);

-- 2. Create Ticket Table
CREATE TABLE Ticket (
    Ticket_Number VARCHAR(50) PRIMARY KEY,
    Fare DECIMAL(10, 2),
    Class INT NOT NULL -- 1, 2, or 3
);

-- 3. Create Passenger Table
CREATE TABLE Passenger (
    Passenger_ID INT PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Age INT NULL, -- Some ages are missing in the dataset [cite: 16]
    Gender VARCHAR(10)
);

-- 4. Create Survival Table (One-to-One with Passenger)
CREATE TABLE Survival_Record (
    Passenger_ID INT PRIMARY KEY,
    Survived BOOLEAN NOT NULL,
    FOREIGN KEY (Passenger_ID) REFERENCES Passenger(Passenger_ID)
);

-- 5. Create Manifest (Junction Table)
CREATE TABLE Manifest (
    Manifest_ID INT AUTO_INCREMENT PRIMARY KEY,
    Passenger_ID INT,
    Ticket_Number VARCHAR(50),
    Port_Code CHAR(1),
    FOREIGN KEY (Passenger_ID) REFERENCES Passenger(Passenger_ID),
    FOREIGN KEY (Ticket_Number) REFERENCES Ticket(Ticket_Number),
    FOREIGN KEY (Port_Code) REFERENCES Port(Port_Code)
);