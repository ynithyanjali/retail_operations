-- Groups are order-level; discount % is the original order discount.
SELECT
    CASE
        WHEN discount_pct = 0 THEN '0%'
        WHEN discount_pct <= 10 THEN '1-10%'
        ELSE '11%+'
    END AS discount_band,
    COUNT(*) AS orders,
    ROUND(SUM(net_sales_usd), 2) AS net_sales_usd,
    ROUND(SUM(estimated_contribution_usd), 2) AS estimated_contribution_usd,
    ROUND(100.0 * SUM(was_returned) / COUNT(*), 2) AS return_rate_pct
FROM order_metrics
GROUP BY CASE
    WHEN discount_pct = 0 THEN '0%'
    WHEN discount_pct <= 10 THEN '1-10%'
    ELSE '11%+'
END
ORDER BY discount_band;
