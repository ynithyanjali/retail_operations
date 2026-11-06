SELECT
    category,
    COUNT(*) AS orders,
    ROUND(SUM(net_sales_usd), 2) AS net_sales_usd,
    ROUND(SUM(estimated_contribution_usd), 2) AS estimated_contribution_usd,
    ROUND(100.0 * SUM(estimated_contribution_usd)
          / NULLIF(SUM(net_sales_usd), 0), 2) AS contribution_margin_pct,
    ROUND(100.0 * SUM(was_returned) / COUNT(*), 2) AS return_rate_pct
FROM order_metrics
GROUP BY category
ORDER BY net_sales_usd DESC;
