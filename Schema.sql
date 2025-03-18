-- Zomato Sales Analysis using SQL


-- Drop Orders Table (depends on customers and restaurant)
DROP TABLE IF EXISTS orders;
-- Drop Menu Table (depends on restaurant and food)
DROP TABLE IF EXISTS menu;
-- Drop Restaurant Table (independent after menu and orders are removed)
DROP TABLE IF EXISTS restaurants;
-- Drop Food Table (independent after menu is removed)
DROP TABLE IF EXISTS food;
-- Drop Customers Table (independent after orders are removed)
DROP TABLE IF EXISTS customers;



-- Customers Table
CREATE TABLE customers (
    cust_id SERIAL PRIMARY KEY,
    cust_name VARCHAR(255) NOT NULL,
    email VARCHAR(255),
    password VARCHAR(255) NOT NULL,
    age INT ,
    gender VARCHAR(10),
    marital_status VARCHAR(50),
    occupation VARCHAR(255),
    monthly_income VARCHAR(50)
);

-- Food Table
CREATE TABLE food (
    food_id VARCHAR(10) PRIMARY KEY,
    item VARCHAR(255) NOT NULL,
    veg_or_non_veg VARCHAR(10) 
);

-- Restaurants Table
CREATE TABLE restaurants (
    rest_id INT PRIMARY KEY,
    rest_name VARCHAR(255) ,
    city VARCHAR(100) NOT NULL,
    rating DECIMAL(3,2),
    rating_count INT ,
    cost INT ,
    cuisine VARCHAR(255),
    lic_no VARCHAR(50) ,
    address TEXT
);

-- Menu Table
CREATE TABLE menu (
    menu_id VARCHAR(10),
    rest_id INT NOT NULL,
    food_id VARCHAR(10) NOT NULL,
    cuisine VARCHAR(255) ,
    price DECIMAL(10,2),
    FOREIGN KEY (rest_id) REFERENCES restaurants(rest_id),
    FOREIGN KEY (food_id) REFERENCES food(food_id)
);


-- Orders Table
CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    order_date DATE NOT NULL,
    sales_qty INT,
    sales_amount DECIMAL(10,2) ,
    currency VARCHAR(10),
    cust_id INT NOT NULL,
    rest_id INT NOT NULL,
    FOREIGN KEY (cust_id) REFERENCES customers(cust_id),
    FOREIGN KEY (rest_id) REFERENCES restaurants(rest_id)
);



-- End of Schema


