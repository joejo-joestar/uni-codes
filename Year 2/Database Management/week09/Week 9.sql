USE 20220019db;
USE Practice;

drop table products;
CREATE TABLE products(
    product_id INT(11) NOT NULL AUTO_INCREMENT,
    product_name VARCHAR(50) NOT NULL,
    price DECIMAL(10,2),
    CONSTRAINT priducts_pk PRIMARY KEY (product_id)
);

INSERT INTO products (product_name, price) VALUES ('Product 1', 10.99),
                                                  ('Product 2', 20.99),
                                                  ('Product 3', 30.99),
                                                  ('Product 4', 40.99),
                                                  ('Product 5', 50.99),
                                                  ('Product 6', 60.99),
                                                  ('Product 7', 70.99);

SELECT * FROM products;

drop table employees;
CREATE TABLE employees (
   employee_id INT(11) NOT NULL AUTO_INCREMENT,
   first_name VARCHAR(30) NOT NULL,
   last_name VARCHAR(30) NOT NULL,
   email VARCHAR(50),
   hire_date DATE,
   CONSTRAINT employees_pk PRIMARY KEY (employee_id)
);

INSERT INTO employees (first_name, last_name, email, hire_date)
VALUES ('John'     , 'a' , 'john.doe@example.com' , CURDATE()),
       ('sreeni'   , 'b' , 'john.doe@example.com' , CURDATE()),
       ('stelling' , 'c' , 'john.doe@example.com' , CURDATE()),
       ('joeseph'  , 'd' , 'john.doe@example.com' , CURDATE()),
       ('agarwal'  , 'e' , 'john.doe@example.com' , CURDATE()),
       ('ryan'     , 'f' , 'john.doe@example.com' , CURDATE()),
       ('nandu'    , 'g' , 'john.doe@example.com' , CURDATE());

drop procedure insert_contact1;
drop procedure update_customer_balance;
drop function get_total_contacts2;
drop procedure delete_contact3;
drop function get_average_price;
drop procedure insert_employee;


-- Procedure to insert a new contact into the contacts1 table
DELIMITER //
CREATE PROCEDURE insert_contact1(
    IN p_last_name VARCHAR(30),
    IN p_first_name VARCHAR(25),
    IN p_birthday DATE
)
BEGIN
    INSERT INTO contacts1 (last_name, first_name, birthday)
    VALUES (p_last_name, p_first_name, p_birthday);
END //

DELIMITER;
CALL insert_contact1('Mathew', 'John', '1990-05-15');
SELECT * FROM contacts1;




-- Procedure to update a customer's balance in the customer table
DELIMITER //
CREATE PROCEDURE update_customer_balance(
    IN p_acc_no INTEGER,
    IN p_amount DECIMAL
)
BEGIN
    UPDATE customer
    SET avail_balance = avail_balance + p_amount
    WHERE acc_no = p_acc_no;
END //


DELIMITER;
CALL update_customer_balance(1000, 100.2);
SELECT * FROM customer;









-- Function to get the total number of contacts in the contacts2 table
DELIMITER //
CREATE FUNCTION get_total_contacts2()
RETURNS INT
READS SQL DATA
BEGIN
    DECLARE total_contacts INT;
    SELECT COUNT(*) INTO total_contacts FROM contacts2;
    RETURN total_contacts;
END //

DELIMITER ;
SELECT get_total_contacts2();
SELECT * FROM contacts2;






-- Procedure to delete a contact from the contacts3 table
DELIMITER //
CREATE PROCEDURE delete_contact3(
    IN p_contact_id INT
)
BEGIN
    DELETE FROM contacts3 WHERE contact_id = p_contact_id;
END //

DELIMITER ;
SELECT * FROM contacts3;
CALL delete_contact3(11);






-- Function to get the average price of products in the products table
DELIMITER //
CREATE FUNCTION get_average_price()
RETURNS DECIMAL(10, 2)
READS SQL DATA
BEGIN
    DECLARE avg_price DECIMAL(10, 2);
    SELECT AVG(price) INTO avg_price FROM products;
    RETURN avg_price;
END //

DELIMITER ;
SELECT get_average_price();




-- Procedure to insert a new employee into the employees table
DELIMITER //
CREATE PROCEDURE insert_employee(
    IN p_first_name VARCHAR(30),
    IN p_last_name VARCHAR(30),
    IN p_email VARCHAR(50),
    IN p_hire_date DATE
)
BEGIN
    INSERT INTO employees (first_name, last_name, email, hire_date)
    VALUES (p_first_name, p_last_name, p_email, p_hire_date);
END //

DELIMITER ;
CALL insert_employee('Python', 'Iyer', "Python@Iyer.com", '01-01-0001');
Select * from employees;


