SELECT
    return_reason,
    COUNT(*) AS returned_orders,
    ROUND(SUM(refund_amount_usd), 2) AS total_refunds_usd,
    ROUND(SUM(return_processing_cost_usd), 2) AS total_processing_cost_usd
FROM returns
GROUP BY return_reason
ORDER BY returned_orders DESC;
