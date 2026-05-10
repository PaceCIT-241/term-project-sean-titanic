USE titanic_db;

-- Requirement: View providing useful information
CREATE OR REPLACE VIEW Safety_Report AS
SELECT 
    p.Name, 
    t.Class, 
    s.Survived, 
    COALESCE(po.City_Name, 'Unknown') AS Embarked_From
FROM Passenger p
JOIN Survival_Record s ON p.Passenger_ID = s.Passenger_ID
JOIN Manifest m ON p.Passenger_ID = m.Passenger_ID
JOIN Ticket t ON m.Ticket_Number = t.Ticket_Number
LEFT JOIN Port po ON m.Port_Code = po.Port_Code;

-- Result set for presentation
-- Sorting by Name ensures you see a variety of ports in the first 100 rows
SELECT * FROM Safety_Report 
ORDER BY Name ASC 
LIMIT 100;