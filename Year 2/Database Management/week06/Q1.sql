USE       20220019db;

SELECT    *
FROM      salesman;

SELECT    *
FROM      customer;

UPDATE    salesman
SET       city = "San Jose"
WHERE     salesman_id = 5003;

-- Q1
SELECT    s_name,
          cust_name
FROM      salesman sa
JOIN      customer cu ON (
          sa.salesman_id = cu.salesman_id
          );

-- Q2
SELECT    DISTINCT cust_name
FROM      customer cu
JOIN      salesman sa ON (
          sa.salesman_id = cu.salesman_id
          )
WHERE     commission > 0.12;

-- Q3
SELECT    DISTINCT cust_name
FROM      customer cu
JOIN      salesman sa ON (
          sa.salesman_id = cu.salesman_id
          )
WHERE     commission > 0.12
AND       cu.city != sa.city;

-- Q4
SELECT    *
FROM      salesman
JOIN      customer USING salesman_id
JOIN      orders USING salesman_id;

-- Q5
SELECT    cust_name
FROM      customer c
ORDER BY  cust_name