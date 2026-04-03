-- Complaint vs churn relationship
SELECT 
    complaint_status,
    churn_status,
    COUNT(*) AS total
FROM customers
GROUP BY complaint_status, churn_status;


-- High-risk customers (low satisfaction + complaints)
SELECT *
FROM customers
WHERE satisfaction_score <= 2
AND complaint_status = 'Yes';


-- Revenue loss from churned customers
SELECT 
    SUM(o.order_value) AS lost_revenue
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
WHERE c.churn_status = 'Yes';
