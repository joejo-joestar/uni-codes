USE       20220019db;

CREATE    TABLE Admission (E_No INT PRIMARY KEY AUTO_INCREMENT, E_Name VARCHAR(32), Age INT, Department VARCHAR(32), DateofAdm DATE, Fee INT, Sex CHAR(1));

INSERT    INTO Admission (E_Name, Age, Department, DateofAdm, Fee, Sex)
VALUES    ('Pankaj', 24, 'Computer', '2002-10-12', 120, 'M'),
          ('Shalini', 21, 'History', '2012-02-25', 200, 'F'),
          ('Sanjay', 22, 'Hindi', '2010-10-10', 300, 'F'),
          ('Sudha', 25, 'History', '2015-05-30', 400, 'F'),
          ('Rakesh', 22, 'Hindi', '2012-12-12', 250, 'M'),
          ('Shakeel', 30, 'History', '2016-01-03', 300, 'M'),
          ('Surya', 34, 'Computer', '2013-03-30', 210, 'M');

SELECT    *
FROM      Admission;

UPDATE    Admission
SET       Age = 27
WHERE     E_No = 1;

ALTER     TABLE Admission
ADD       City VARCHAR(30);

UPDATE    Admission
SET       Fee = 425
WHERE     E_No = 4;

ALTER     TABLE Admission
DROP      COLUMN City;
