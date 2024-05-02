CREATE DATABASE Employee_Q2;
USE Employee_Q2;
CREATE TABLE Source (
	ID INT,
    Name VARCHAR(50),
    City VARCHAR(50), -- SCD Field
    Email VARCHAR(50), -- SCD Field
    Update_Date DATETIME
);
CREATE TABLE Employee_Current (
    ID INT PRIMARY KEY,
    Name VARCHAR(50),
    City VARCHAR(50), -- SCD Field
    Email VARCHAR(50), -- SCD Field
    Update_Date DATETIME
);

DROP TABLE Employee_History
CREATE TABLE Employee_History (
    ID INT,
    Name VARCHAR(50),
    City VARCHAR(50),
    Email VARCHAR(50),
    Start_Date DATETIME,
    End_Date DATETIME
);

INSERT INTO Employee_Q2.dbo.Source(ID, Name, City, Email, Update_Date)
VALUES
	(1001, 'Ashraf', 'Alex', 'ahmed@mail.com', '2024-04-20'),
    (1002, 'Nehal', 'Giza', 'nehal@mail.com', '2024-04-20'),
    (1003, 'Asem', 'Cairo', 'asem@mail.com', '2024-04-20');

UPDATE Employee_Q2.dbo.Source
SET Name = 'Ashraf Ahmed', Update_Date = GETDATE()
WHERE ID = 1001; -- Replace 1001 with the ID of the employee you want to update

delete from Source where ID=1004

Delete from Employee_Current 
Delete from Employee_History
Delete from Source 

SELECT * FROM Source
SELECT * FROM Employee_Current
SELECT * FROM Employee_History

SELECT ID,
	Name,
	City,
	Email,
	Update_Date,
	Change_Date FROM Employee_History WHERE End_Date = '9999-12-31' ; 


SELECT CONVERT(date, GETDATE()) AS CurrentDate;

-- insert old record into history
INSERT INTO Employee_History (ID, Name, City, Email, Update_Date, Change_Date)
SELECT ID, Name, City, Email, Update_Date, GETDATE() AS Change_Date FROM Source where ID = 1003

UPDATE Employee_Current
SET Name = ?, City = ?, Email = ?, Update_Date = GETDATE()
WHERE ID = ?


-- Insert new record into Employee_History for changed city
INSERT INTO Employee_History (ID, Name, City, Email, Update_Date, Change_Date)
SELECT s.ID, s.Name, s.City, s.Email, s.Update_Date, GETDATE() AS Change_Date
FROM Source s
WHERE s.ID = 1003
AND NOT EXISTS (
    SELECT 1
    FROM Employee_Current ec
    WHERE ec.ID = s.ID
    AND (ec.City = s.City AND ec.Email = s.Email)
)



INSERT INTO Employee_History (ID, Name, City, Email, Update_Date, Change_Date)
SELECT ID, Name, City, Email, Update_Date, GETDATE() AS Change_Date FROM Source where ID = ?

Drop table Config_Table
CREATE Table Config_Table (
	Last_Updated DATETIME
	)

 SELECT MAX(Update_Date) FROM Source 

SELECT * FROM Source WHERE Update_Date > '2024-05-20'
SELECT MAX(Update_Date) FROM Source 
SELECT MAX(Update_Date) FROM Source 


CREATE TABLE test (
	ID INT,
    Name VARCHAR(50),
    City VARCHAR(50), -- SCD Field
    Email VARCHAR(50), -- SCD Field
    Update_Date DATE
);

Insert into test Select * from Source where Update_Date > '2024-05-01'
Select * From Source where Update_Date > CONVERT(DATE, '2024-05-01')

SELECT MAX(Update_Date) FROM Source


INSERT INTO Config_Table Select MAX(Update_Date) from Source
SELECT MAX(Last_Updated) FROM Config_Table

select * from test


INSERT INTO Employee_History (ID, Name, City, Email, Start_Date, End_Date)
SELECT s.ID, s.Name, s.City, s.Email, s.Update_Date, GETDATE() AS End_Date
FROM Source s
WHERE s.ID = 1001
AND NOT EXISTS (
    SELECT 1
    FROM Employee_Current ec
    WHERE ec.ID = s.ID
    AND (ec.City = s.City AND ec.Email = s.Email)
)


IF NOT EXISTS (SELECT 1 FROM Employee_Current WHERE ID = 1001)
    INSERT INTO Employee_Current (ID, Name, City, Email, Update_Date)
    VALUES (11, 'n', 'n', 'n', GETDATE());
ELSE
    UPDATE Employee_Current
    SET Name = 'x',
        City = 'x',
        Email = 'x',
        Update_Date = GETDATE()
    WHERE ID = 1001;




Delete from Config_Table --
INSERT INTO Config_Table SELECT MAX(Update_Date) FROM Source
select * from Config_Table

drop database Employee_Q2


INSERT INTO Employee_History (ID, Name, City, Email, Start_Date, End_Date)
SELECT s.ID, s.Name, s.City, s.Email, s.Update_Date, GETDATE() AS End_Date
FROM Source s
WHERE s.ID = 1001

UPDATE Employee_Current
SET Name = 'ashraf', City = 'ashraf', Email = 'ashraf', Update_Date = GETDATE()
WHERE ID = 1001;
