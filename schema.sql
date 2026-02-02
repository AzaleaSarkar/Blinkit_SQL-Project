CREATE DATABASE blinkit;

CREATE TABLE blinkit_customers(
customer_id INT PRIMARY KEY,
customer_name VARCHAR(100),
email VARCHAR(100),
phone_no VARCHAR(15),
area VARCHAR(50),
pincode VARCHAR(50),
customer_segment VARCHAR(50),
registration_date DATE
);

CREATE TABLE blinkit_products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(150),
    category VARCHAR(50),
    brand VARCHAR(50),
    price DECIMAL(10,2),
    mrp DECIMAL(10,2),
    margin_percent DECIMAL(5,2),
    shelf_life_days INT,
    min_stock_level INT,
    max_stock_level INT
);


CREATE TABLE blinkit_orders (
    order_id BIGINT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    promised_delivery_time DATETIME,
    actual_delivery_time DATETIME,
    delivery_status VARCHAR(30),
    order_total DECIMAL(10,2),
    payment_method VARCHAR(20),
    delivery_partner_id INT,
    store_id INT,
    FOREIGN KEY (customer_id) REFERENCES blinkit_customers(customer_id)
);

CREATE TABLE blinkit_order_items (
    order_id BIGINT,
    product_id INT,
    quantity INT,
    unit_price DECIMAL(10,2),
    PRIMARY KEY (order_id, product_id),
    FOREIGN KEY (order_id) REFERENCES blinkit_orders(order_id),
    FOREIGN KEY (product_id) REFERENCES blinkit_products(product_id)
);

CREATE TABLE blinkit_delivery_performance (
    order_id BIGINT PRIMARY KEY,
    delivery_partner_id INT,
    promised_time DATETIME,
    actual_time DATETIME,
    delivery_time_minutes INT,
    distance_km DECIMAL(6,2),
    delivery_status VARCHAR(30),
    delay_reason VARCHAR(100),
    FOREIGN KEY (order_id) REFERENCES blinkit_orders(order_id)
);

CREATE TABLE blinkit_inventory (
    product_id INT,
    stock_date DATE,
    stock_received INT,
    damaged_stock INT,
    PRIMARY KEY (product_id, stock_date),
    FOREIGN KEY (product_id) REFERENCES blinkit_products(product_id)
);


CREATE TABLE blinkit_marketing_performance (
    campaign_id INT PRIMARY KEY,
    campaign_name VARCHAR(100),
    campaign_date DATE,
    channel VARCHAR(30),
    target_audience VARCHAR(50),
    impressions INT,
    clicks INT,
    conversions INT,
    spend DECIMAL(10,2),
    revenue_generated DECIMAL(10,2),
    roas DECIMAL(5,2)
);

