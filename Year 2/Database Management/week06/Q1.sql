USE       20220019db;

SELECT    *
FROM      salesman05;

SELECT    *
FROM      customer05;

UPDATE    salesman05
SET       city = "San Jose"
WHERE     salesman_id = 5003;

-- Q1
SELECT    NAME,
          cust_name
FROM      salesman05 AS sa
JOIN      customer05 AS cu ON (
          sa.salesman_id = cu.salesman_id
          );

-- Q2
SELECT    DISTINCT cust_name
FROM      customer05 AS cu
JOIN      salesman05 AS sa ON (
          sa.salesman_id = cu.salesman_id
          )
WHERE     commission > 0.12;

-- Q3
SELECT    DISTINCT cust_name
FROM      customer05 AS cu
JOIN      salesman05 AS sa ON (
          sa.salesman_id = cu.salesman_id
          )
WHERE     commission > 0.12
AND       cu.city != sa.city;

-- Q4
SELECT    *
FROM      salesman05
JOIN      customer05 USING salesman_id
JOIN      orders05 USING salesman_id;

-- Q5
SELECT    cust_name
FROM      customer05 c
ORDER BY  cust_name