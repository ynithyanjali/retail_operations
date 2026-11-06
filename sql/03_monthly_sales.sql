-- Refunds are attributed to the original order month, NOT refund posting month.
SELECT
    order_month,
    COUNT(*) AS orders,
    ROUND(SUM(discounted_sales_usd), 2) AS sales_after_discounts_usd,
    ROUND(SUM(refund_usd), 2) AS refunds_usd,
    ROUND(SUM(net_sales_usd), 2) AS net_sales_usd,
    ROUND(SUM(estimated_contribution_usd), 2) AS estimated_contribution_usd
FROM order_metrics
GROUP BY order_month
ORDER BY order_month;
