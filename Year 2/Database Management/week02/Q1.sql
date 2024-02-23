USE       20220019db;

CREATE    TABLE Salesman (salesman_id INT PRIMARY KEY, s_name VARCHAR(30), city VARCHAR(30), commission FLOAT(3, 2));

CREATE    TABLE Customer (
          customer_id INT PRIMARY KEY,
          cust_name VARCHAR(30),
          city VARCHAR(30),
          grade INT,
          salesman_id INT,
          FOREIGN KEY (salesman_id) REFERENCES Salesman (salesman_id) ON DELETE SET NULL
          );

CREATE    TABLE Orders (
          ord_no INT PRIMARY KEY,
          purch_amt FLOAT,
          ord_date DATE,
          customer_id INT,
          salesman_id INT,
          FOREIGN KEY (customer_id) REFERENCES Customer (customer_id) ON DELETE SET NULL,
          FOREIGN KEY (salesman_id) REFERENCES Salesman (salesman_id) ON DELETE SET NULL
          );

INSERT    INTO Salesman
VALUES    (5001, "James Hoog", "New York", 0.15),
          (5002, "Nail Knite", "Paris", 0.13),
          (5005, "Pit Alex", "London", 0.11),
          (5006, "Mc Lyon", "Paris", 0.14),
          (5003, "Lauson Hen", NULL, 0.12),
          (5007, "Paul Adam", "Rome", 0.13);

INSERT    INTO Customer
VALUES    (3002, "Nick Rimando", "New York", 100, 5001),
          (3005, "Graham Zusi", "California", 200, 5002),
          (3001, "Brad Guzan", "London", NULL, 5005),
          (3004, "Fabian Johns", "Paris", 300, 5006),
          (3007, "Brad Davis", "New York", 200, 5001),
          (3009, "Geoff Camero", "Berlin", 100, 5003),
          (3008, "Julian Green", "London", 300, 5002),
          (3003, "Jozy Altidor", "Moscow", 200, 5007);

INSERT    INTO Orders
VALUES    (70001, 150.5, "2012-10-05", 3005, 5002),
          (70009, 270.65, "2012-09-10", 3001, 5005),
          (70002, 65.26, "2012-10-05", 3002, 5001),
          (70004, 110.5, "2012-08-17", 3009, 5003),
          (70007, 948.5, "2012-09-10", 3005, 5002),
          (70005, 2400.6, "2012-07-27", 3007, 5001),
          (70008, 5760, "2012-09-10", 3002, 5001),
          (70010, 1983.43, "2012-10-10", 3004, 5006),
          (70003, 2480.4, "2012-10-10", 3009, 5003),
          (70012, 250.45, "2012-06-27", 3008, 5002),
          (70011, 75.29, "2012-08-17", 3003, 5007),
          (70013, 3045.6, "2012-04-25", 3002, 5001);

-- q1
SELECT    cust_name,
          sa.s_name,
          sa.city
FROM      Customer AS cu,
          Salesman AS sa
WHERE     cu.city = sa.city;

-- q2
SELECT    cust_name,
          sa.s_name
FROM      Customer AS cu,
          Salesman AS sa
WHERE     cu.salesman_id = sa.salesman_id;

-- q3
SELECT    cust_name,
          ord_no
FROM      Salesman AS sa,
          Customer AS cu,
          Orders AS o
WHERE     o.salesman_id = sa.salesman_id
AND       o.customer_id = cu.customer_id
AND       cu.salesman_id = sa.salesman_id
AND       cu.city != sa.city;

-- q4
SELECT    ord_no,
          cust_name
FROM      Customer AS cu,
          Orders AS o
WHERE     o.customer_id = cu.customer_id;

-- q5
SELECT    cust_name,
          grade,
          ord_no
FROM      Customers AS cu,
          Salesman AS sa,
          Orders AS o
WHERE     o.customer_id = cu.customer_id
AND       grade IS NOT NULL
AND       cu.salesman_id = sa.salesman_id
AND       sa.city IS NOT NULL;

-- q6
SELECT    cust_name,
          cu.city,
          sa.s_name,
          commission
FROM      Customer AS cu,
          Salesman AS sa
WHERE     cu.salesman_id = sa.salesman_id
AND       commission > 0.12
AND       commission < 0.14;

-- q7
SELECT    ord_no,
          cu.cust_name,
          commission,
          (commission * purch_amt) AS earned_commission
FROM      Orders AS o,
          Salesman AS sa,
          Customer AS cu
WHERE     cu.grade >= 200
AND       o.customer_id = cu.customer_id
AND       o.salesman_id = sa.salesman_id;

-- q8
SELECT    cust_name,
          grade
FROM      Customer
WHERE     grade > 100;

-- q9
SELECT    cust_name
FROM      Customer
WHERE     grade > 100
AND       city = "New York";

-- q10
SELECT    cust_name
FROM      Customer
WHERE     grade <= 100
OR        city != "New York";

-- q11
SELECT    cust_name
FROM      Customer
WHERE     grade <= 100
AND       city != "New York";

-- q12
SELECT    ord_no,
          ord_date
FROM      Orders AS o
WHERE     ord_date != '2012-09-10'
AND       salesman_id <= 5005
OR        purch_amt <= 1000;