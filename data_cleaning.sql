-- Standardize payment modes
UPDATE customers
SET payment_mode = 
    CASE 
        WHEN LOWER(payment_mode) IN ('cc', 'credit card') THEN 'Credit Card'
        WHEN LOWER(payment_mode) IN ('dc', 'debit card') THEN 'Debit Card'
        WHEN LOWER(payment_mode) LIKE '%upi%' THEN 'UPI'
        ELSE 'Other'
    END;

-- Handle missing satisfaction scores
UPDATE customers
SET satisfaction_score = (
    SELECT ROUND(AVG(satisfaction_score))
    FROM customers
    WHERE satisfaction_score IS NOT NULL
)
WHERE satisfaction_score IS NULL;

-- Standardize complaint status
UPDATE customers
SET complaint_status = 
    CASE 
        WHEN complaint_status IS NULL THEN 'No'
        ELSE complaint_status
    END;
