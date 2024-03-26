USE       20220019db;

-- 1.	Write a query to find salesmen with all information who lives in the city where any of the customers lives.
SELECT    *
FROM      salesman05 AS sa
WHERE     sa.city IN (
          SELECT    cu.city
          FROM      customer05 AS cu
          WHERE     cu.city = sa.city
          );

-- 2.	Write a query to display all the orders that had amounts that were greater than at least one of the orders on September 10th 2012.
SELECT    *
FROM      orders05
WHERE     purch_amt > SOME (
          SELECT    purch_amt
          FROM      orders05
          WHERE     ord_date = '2012-09-10'
          );

-- 3.	Write a query to display all orders with an amount smaller than any amount for a customer in London.
SELECT    *
FROM      orders05
WHERE     purch_amt < SOME (
          SELECT    purch_amt
          FROM      orders05
          WHERE     customer_id IN (
                    SELECT    customer_id
                    FROM      customer05
                    WHERE     city = "London"
                    )
          );

-- 4.	Write a query to display only those customers whose grade are, in fact, higher than every customer in New York.
SELECT    *
FROM      customer05
WHERE     grade > SOME (
          SELECT    grade
          FROM      customer05
          WHERE     city = "New York"
          );

-- 5.	Write a query to get all the information for those customers whose grade is not as the grade of customer who belongs to the city London.
SELECT    *
FROM      customer05
WHERE     grade NOT IN(
          SELECT    grade
          FROM      customer05
          WHERE     city = "London"
          );

-- 6.	Write a query to display all the orders from the orders table issued by the salesman 'Paul Adam'.
SELECT    *
FROM      orders05
WHERE     salesman_id IN (
          SELECT    salesman_id
          FROM      salesman05
          WHERE     NAME = "Paul Adam"
          );

-- 7.	Write a query to display all the orders for the salesman who belongs to the city London.
SELECT    *
FROM      orders05
WHERE     salesman_id IN (
          SELECT    salesman_id
          FROM      salesman05
          WHERE     city = "London"
          );

-- 8.	Write a query to display all the orders which values are greater than the average order value for 10th October 2012.
SELECT    *
FROM      orders05
WHERE     purch_amt > SOME (
          SELECT    AVG(purch_amt)
          FROM      order05
          WHERE     ord_date = '2012-10-10'
          );

-- 9.	Write a query to display the commission of all the salesmen servicing customers in Paris.
SELECT    commission
FROM      salesman05
WHERE     salesman_id IN (
          SELECT    salesman_id
          FROM      customer05
          WHERE     city = "Paris"
          );

-- 10.	Write a query to display all customers with orders on October 5, 2012.
SELECT    *
FROM      customer05
WHERE     customer_id IN (
          SELECT    customer_id
          FROM      orders05
          WHERE     ord_date = '2012-10-05'
          );