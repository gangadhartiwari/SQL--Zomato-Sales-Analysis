-- Data insertion :- 

-- the data was inserted into the PostgreSQL database through the built-in import functionality. 
-- This method allows you to load CSV files directly into their respective tables
-- without manually writing SQL COPY or INSERT INTO commands. The import feature automatically maps columns, 
-- detects data types, and ensures smooth data insertion



-- Note : - you can also use copy or insert into command for data insetion

\c zomato_db;


--  #COPY mainly used for bulk data loading from CSV files. It is faster than multiple 
--  INSERT INTO statements and is an alternative to the Import option in pgAdmin.


-- Load customers data
COPY customers FROM 'E:\PostgresSQL\zomato analysis\customers.csv' DELIMITER ',' CSV HEADER;

-- Load restaurants data
COPY restaurants FROM 'E:\PostgresSQL\zomato analysis\restaurants.csv' DELIMITER ',' CSV HEADER;

-- Load food data
COPY food FROM 'E:\PostgresSQL\zomato analysis\food.csv' DELIMITER ',' CSV HEADER;

-- Load menu data
COPY menu FROM 'E:\PostgresSQL\zomato analysis\menu.csv' DELIMITER ',' CSV HEADER;

-- Load orders data
COPY orders FROM 'E:\PostgresSQL\zomato analysis\orders.csv' DELIMITER ',' CSV HEADER;


-- OR

-- Insert into customers table
INSERT INTO customers (cust_name, email, password, age, gender, marital_status, occupation, monthly_income) 
VALUES ('Rahul Sharma', 'rahul@example.com', 'password123', 30, 'Male', 'Single', 'Software Engineer', '70000');

-- Insert into restaurants table
INSERT INTO restaurants (rest_id, rest_name, city, rating, rating_count, cost, cuisine, lic_no, address) 
VALUES (101, 'Spice Garden', 'Mumbai', 4.5, 120, 800, 'Indian', 'LIC123456', 'Andheri East, Mumbai');

-- Insert into food table
INSERT INTO food (food_id, item, veg_or_non_veg) 
VALUES ('F001', 'Paneer Butter Masala', 'Veg');

-- Insert into menu table
INSERT INTO menu (menu_id, rest_id, food_id, cuisine, price) 
VALUES ('M001', 101, 'F001', 'North Indian', 350.00);

-- Insert into orders table
INSERT INTO orders (order_date, sales_qty, sales_amount, currency, cust_id, rest_id) 
VALUES ('2025-03-17', 2, 700.00, 'INR', 1, 101);



-- INSERT INTO method is useful for manually adding or modifying individual records. 
-- Choosing the right method depends on the scale of data insertion and the specific use case of the project


-- Verify data insertion

SELECT COUNT(*) FROM customers;
SELECT COUNT(*) FROM restaurants;
SELECT COUNT(*) FROM food;
SELECT COUNT(*) FROM menu;
SELECT COUNT(*) FROM orders;

OR 

SELECT * FROM customers;
SELECT * FROM food;
SELECT * FROM restaurants;
SELECT * FROM menu;
SELECT * FROM orders;


-- Check for Null or Missing Values of important column


SELECT * FROM customers 
WHERE
    cust_id IS NULL  OR
    cust_name IS NULL;

SELECT * FROM restaurants 
WHERE 
    rest_id IS NULL  OR
    rest_name IS NULL;

SELECT * FROM menu 
WHERE  
     food_id IS NULL OR
	 menu_id IS NULL;
	 
SELECT * FROM food 
WHERE 
     food_id IS NULL OR
     item IS NULL;

SELECT * FROM orders 
WHERE 
     order_id IS NULL OR
     order_date IS NULL;


-- Deletion of unusual and null values

DELETE FROM customers 
WHERE
    cust_id IS NULL  OR
    cust_name IS NULL;

DELETE FROM restaurants 
WHERE 
    rest_id IS NULL  OR
    rest_name IS NULL;

DELETE FROM menu 
WHERE  
     food_id IS NULL OR
	 menu_id IS NULL;
	 DELETE  FROM food 
WHERE 
     food_id IS NULL OR
     item IS NULL;

DELETE FROM orders 
WHERE 
     order_id IS NULL OR
     order_date IS NULL;
