USE titanic_db;

CREATE OR REPLACE VIEW Safety_Report AS
SELECT 
    p.Name, 
    t.Class, 
    s.Survived, 
    COALESCE(po.City_Name, 'Unknown') AS Embarked_From,
    t.Fare
FROM Passenger p
JOIN Manifest m ON p.Passenger_ID = m.Passenger_ID
-- Connect the Manifest to the Ticket and Port tables 
JOIN Ticket t ON m.Ticket_Number = t.Ticket_Number
JOIN Survival_Record s ON p.Passenger_ID = s.Passenger_ID
LEFT JOIN Port po ON m.Port_Code = po.Port_Code;

SELECT * FROM Safety_Report 
ORDER BY Name ASC 
LIMIT 100;