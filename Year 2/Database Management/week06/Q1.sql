USE       20220019db;

SELECT    *
FROM      salesman05;

SELECT    *
FROM      customer05;

UPDATE    salesman05
SET       city = "San Jose"
WHERE     salesman_id = 5003;

-- Q1
SELECT    sa.name,
          cu.cust_name
FROM      salesman05 sa
JOIN      customer05 cu ON (
          sa.salesman_id = cu.salesman_id
          );

-- Q2
SELECT    DISTINCT cust_name
FROM      customer05 cu
JOIN      salesman05 sa ON (
          sa.salesman_id = cu.salesman_id
          )
WHERE     commission > 0.12;

-- Q3
SELECT    DISTINCT cust_name
FROM      customer05 cu
JOIN      salesman05 sa ON (
          sa.salesman_id = cu.salesman_id
          )
WHERE     commission > 0.12
AND       cu.city != sa.city;

-- Qn4
SELECT    *
FROM      salesman05 sa
JOIN      customer05 cu ON (
          sa.salesman_ID = cu.salesman_ID
          )
JOIN      orders05 o ON (
          sa.salesman_ID = o.salesman_ID
          );

SELECT    *
FROM      salesman05
NATURAL   JOIN orders05 o,
          customer05 cu
WHERE     (
          o.customer_ID = cu.customer_ID
          );

SELECT    *
FROM      orders05
NATURAL   JOIN customer05
NATURAL   JOIN salesman05;

-- Qn5
SELECT    cu.cust_name
FROM      customer05 cu
JOIN      salesman05 sa ON (
          sa.salesman_ID = cu.salesman_ID
          )
ORDER BY  cu.cust_name;

-- Qn6
SELECT    *
FROM      customer05 cu
JOIN      salesman05 sa ON (
          sa.salesman_ID = cu.salesman_ID
          );

SELECT    *
FROM      customer05
CROSS     JOIN salesman05;

-- Qn7
CREATE    VIEW SalesView AS
          SELECT    sa.salesman_ID,
                    sa.Name,
                    sa.City
          FROM      salesman05 sa;

SELECT    *
FROM      SalesView;

-- Qn8
CREATE    VIEW CityView AS
          SELECT    *
          FROM      salesman05
          WHERE     sa.City = 'New York';

SELECT    *
FROM      CityView;

-- Qn9
CREATE    VIEW GradeView AS
          SELECT    Grade,
                    COUNT(Grade) 'Number'
          FROM      customer05
          GROUP BY  Grade;

SELECT    *
FROM      GradeView;

-- Qn10
CREATE    VIEW AvgView AS
          SELECT    Ord_Date,
                    COUNT(*)       'Count',
                    AVG(purch_amt) 'Average',
                    SUM(purch_amt) 'Total'
          FROM      orders05
          GROUP BY  Ord_Date;

SELECT    DISTINCT *
FROM      AvgView
ORDER BY  Ord_Date;

CREATE    VIEW UniqueNumber AS
          SELECT    COUNT(*) 'Count',
                    Ord_Date
          FROM      orders05
          GROUP BY  Ord_Date;

CREATE    VIEW Average (
          SELECT    AVG(purch_amt) 'Average',
                    Ord_Date
          FROM      orders05
          GROUP BY  Ord_Date
          );

CREATE    VIEW Total AS
          SELECT    SUM(purch_amt) 'Total',
                    Ord_Date
          FROM      orders05
          GROUP BY  Ord_Date;

SELECT    DISTINCT *
FROM      UniqueNumber
NATURAL   JOIN Average
NATURAL   JOIN Totaal
ORDER BY  Ord_Date;

-- Qn11
SELECT    *
FROM      Course
NATURAL   LEFT OUTER JOIN Prereq;

-- Qn12
SELECT    *
FROM      Course
NATURAL   RIGHT OUTER JOIN Prereq;

-- Qn13
SELECT    *
FROM      Course
UNION    
SELECT    *
FROM      Prereq;

SELECT    *
FROM      Course co
NATURAL FULL OUTER JOIN      Prereq prq ON co.Course_ID = prq.Course_ID;

SELECT    *
FROM      Course co FULL
JOIN      Prereq prq ON co.Course_ID = prq.Course_ID;