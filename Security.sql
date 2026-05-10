USE titanic_db;

CREATE ROLE IF NOT EXISTS 'titanic_analyst';
CREATE USER IF NOT EXISTS 'analyst_1'@'localhost' IDENTIFIED BY 'Pass123!';
GRANT 'titanic_analyst' TO 'analyst_1'@'localhost';
GRANT SELECT ON titanic_db.* TO 'titanic_analyst';

FLUSH PRIVILEGES;