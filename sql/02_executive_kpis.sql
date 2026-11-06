-- Overall KPIs for orders placed during 2025.
SELECT
    COUNT(*) AS order_count,
    COUNT(DISTINCT customer_id) AS purchasing_customers,
    ROUND(SUM(discounted_sales_usd), 2) AS sales_after_discounts_usd,
    ROUND(SUM(refund_usd), 2) AS refunds_usd,
    ROUND(SUM(net_sales_usd), 2) AS net_sales_usd,
    ROUND(SUM(estimated_contribution_usd), 2) AS estimated_contribution_usd,
    ROUND(100.0 * SUM(estimated_contribution_usd)
          / NULLIF(SUM(net_sales_usd), 0), 2) AS contribution_margin_pct,
    ROUND(AVG(net_sales_usd), 2) AS average_net_order_value_usd,
    ROUND(100.0 * SUM(was_returned) / COUNT(*), 2) AS return_rate_pct,
    ROUND(100.0 * SUM(delivered_on_time) / COUNT(*), 2) AS on_time_delivery_pct
FROM order_metrics;
