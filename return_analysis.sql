-- Identify churned customers with returns
SELECT 
    c.customer_id,
    COUNT(r.return_id) AS total_returns
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN returns r ON o.order_id = r.order_id
WHERE c.churn_status = 'Yes'
GROUP BY c.customer_id
ORDER BY total_returns DESC;


-- Return reasons for churned customers
SELECT 
    r.return_reason,
    COUNT(*) AS frequency
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN returns r ON o.order_id = r.order_id
WHERE c.churn_status = 'Yes'
GROUP BY r.return_reason
ORDER BY frequency DESC;
