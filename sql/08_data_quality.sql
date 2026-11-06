-- Expected: 0 failures in each check.
SELECT 'Orders missing customer' AS quality_check,
       COUNT(*) AS problem_count
FROM orders o LEFT JOIN customers c ON c.customer_id = o.customer_id
WHERE c.customer_id IS NULL
UNION ALL
SELECT 'Orders missing product', COUNT(*)
FROM orders o LEFT JOIN products p ON p.product_id = o.product_id
WHERE p.product_id IS NULL
UNION ALL
SELECT 'Returns missing order', COUNT(*)
FROM returns r LEFT JOIN orders o ON o.order_id = r.order_id
WHERE o.order_id IS NULL
UNION ALL
SELECT 'Duplicate returns per order', COUNT(*)
FROM (SELECT order_id FROM returns GROUP BY order_id HAVING COUNT(*) > 1) duplicates
UNION ALL
SELECT 'Invalid quantities or discounts', COUNT(*)
FROM orders WHERE quantity <= 0 OR discount_pct < 0 OR discount_pct > 100
UNION ALL
SELECT 'Missing delivery dates', COUNT(*)
FROM orders WHERE actual_delivery_date IS NULL OR promised_delivery_date IS NULL
   OR actual_delivery_date = '' OR promised_delivery_date = '';
