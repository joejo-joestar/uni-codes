USE       20220019db;

DROP TABLE IF EXISTS holiday;

CREATE    TABLE holiday (
          holiday_code VARCHAR(5) PRIMARY KEY,
          cost NUMERIC(7, 3)
          );

CREATE    TABLE airport (
          airport_code INT PRIMARY KEY,
          airport_name VARCHAR(20)
          );

CREATE    TABLE agent (
          agent_code INT PRIMARY KEY,
          agent_name VARCHAR(20)
          );

CREATE    TABLE quantity (
          batch_no INT,
          agent_code INT,
          holiday_code VARCHAR(5),
          airport_code INT,
          quantity_booked INT
          );

-- question 1 --
INSERT    INTO holiday
VALUES    ("B563", 363),
          ("B248", 248),
          ("B428", 322),
          ("C930", 568),
          ("A270", 972),
          ("B728", 248),
          ("A430", 279);

INSERT    INTO airport
VALUES    (1, "Luton"),
          (11, "Glasgow"),
          (12, "Edinburgh"),
          (14, "Newcastle");

INSERT    INTO agent
VALUES    (76, "Bairns Travel"),
          (142, "Active Holidays");

INSERT    INTO quantity
VALUES    (1, 76, "B563", 1, 10),
          (1, 76, "B248", 12, 20),
          (1, 76, "B428", 11, 18),
          (2, 142, "B563", 1, 15),
          (2, 142, "C930", 14, 2),
          (2, 142, "A270", 14, 1),
          (2, 142, "B728", 12, 5),
          (3, 76, "C930", 1, 11),
          (3, 76, "A430", 11, 15);

SELECT    *
FROM      holiday;

SELECT    *
FROM      agent;

SELECT    *
FROM      airport;

SELECT    *
FROM      quantity;

-- question 2 --
DROP VIEW TotalCost;

CREATE    VIEW TotalCost AS (
          SELECT    agent_name,
                    h.holiday_code,
                    cost,
                    quantity_booked,
                    airport_name,
                    q.batch_no,
                    cost * quantity_booked AS total_cost
          FROM      agent a,
                    holiday h,
                    airport air,
                    quantity q
          WHERE     q.agent_code = a.agent_code
          AND       q.holiday_code = h.holiday_code
          AND       air.airport_code = q.airport_code
          );

SELECT    *
FROM      TotalCost;

-- question 3 --
CREATE    TABLE CourseStudent (
          course_id INT,
          student_id INT,
          PRIMARY KEY (course_id, student_id)
          );

CREATE    TABLE CourseBook (
          course_id INT,
          ref_book VARCHAR(10),
          PRIMARY KEY (course_id, ref_book)
          );

ALTER     TABLE CourseBook
MODIFY    ref_book VARCHAR(30);

INSERT    INTO CourseStudent
VALUES    (101, 1000),
          (101, 1001),
          (101, 1005),
          (102, 1002),
          (102, 1003),
          (103, 1000),
          (104, 1002),
          (105, 1001),
          (106, 1002),
          (106, 1003);

INSERT    INTO CourseBook
VALUES    (
          101,
          "Calculus Extra Questions"
          ),
          (
          102,
          "Newtonian Mechanics Extras"
          ),
          (103, "Cyber Security"),
          (
          104,
          "Databse Designs in Real World"
          ),
          (105, "x86 Family "),
          (106, "RISC Architecture");

CREATE VIEW StudentCourses AS
SELECT course_id, student_id FROM CourseStudent;

CREATE VIEW CourseBooks AS
SELECT course_id, ref_book FROM CourseBook;

SELECT * FROM StudentCourses;

SELECT * FROM CourseBooks;


