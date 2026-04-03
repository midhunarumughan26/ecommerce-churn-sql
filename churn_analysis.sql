-- Overall churn rate
SELECT 
    churn_status,
    COUNT(*) AS total_customers,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM customers), 2) AS percentage
FROM customers
GROUP BY churn_status;


-- Churn by tenure
SELECT 
    CASE 
        WHEN tenure < 6 THEN '0-6 Months'
        WHEN tenure BETWEEN 6 AND 12 THEN '6-12 Months'
        ELSE '12+ Months'
    END AS tenure_group,
    churn_status,
    COUNT(*) AS customers
FROM customers
GROUP BY tenure_group, churn_status
ORDER BY tenure_group;


-- Churn by satisfaction score
SELECT 
    satisfaction_score,
    churn_status,
    COUNT(*) AS customers
FROM customers
GROUP BY satisfaction_score, churn_status
ORDER BY satisfaction_score;


-- Churn by payment mode
SELECT 
    payment_mode,
    churn_status,
    COUNT(*) AS customers
FROM customers
GROUP BY payment_mode, churn_status
ORDER BY customers DESC;
