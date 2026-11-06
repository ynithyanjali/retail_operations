SELECT
    region,
    COUNT(*) AS orders,
    COUNT(DISTINCT customer_id) AS purchasing_customers,
    ROUND(SUM(net_sales_usd), 2) AS net_sales_usd,
    ROUND(100.0 * SUM(was_returned) / COUNT(*), 2) AS return_rate_pct,
    ROUND(100.0 * SUM(delivered_on_time) / COUNT(*), 2) AS on_time_delivery_pct
FROM order_metrics
GROUP BY region
ORDER BY net_sales_usd DESC;
