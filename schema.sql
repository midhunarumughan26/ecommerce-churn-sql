-- Main customer table
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    gender VARCHAR(10),
    tenure INT,
    satisfaction_score INT,
    payment_mode VARCHAR(50),
    complaint_status VARCHAR(10),
    churn_status VARCHAR(10)
);

-- Orders table
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    order_value DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- Returns table (for churned customer behavior)
CREATE TABLE returns (
    return_id INT PRIMARY KEY,
    order_id INT,
    return_reason VARCHAR(100),
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);
