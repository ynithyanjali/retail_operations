-- Shared order-grain view to keep KPIs consistent across queries.
-- Each row = one original order. Dates use YYYY-MM-DD, so textual order works.
-- Returns are at most one per order in this synthetic dataset.
CREATE VIEW order_metrics AS
SELECT
    o.order_id,
    o.order_date,
    SUBSTR(o.order_date, 1, 7) AS order_month,
    o.customer_id,
    c.region,
    c.segment,
    o.product_id,
    p.product_name,
    p.category,
    o.quantity,
    o.discount_pct,
    o.shipping_cost_usd,
    ROUND(o.quantity * o.unit_price_usd * (1.0 - o.discount_pct / 100.0), 4)
        AS discounted_sales_usd,
    COALESCE(r.refund_amount_usd, 0) AS refund_usd,
    ROUND(
        o.quantity * o.unit_price_usd * (1.0 - o.discount_pct / 100.0)
        - COALESCE(r.refund_amount_usd, 0), 4
    ) AS net_sales_usd,
    ROUND(
        o.quantity * o.unit_price_usd * (1.0 - o.discount_pct / 100.0)
        - COALESCE(r.refund_amount_usd, 0)
        - o.quantity * p.unit_cost_usd
        - o.shipping_cost_usd
        - COALESCE(r.return_processing_cost_usd, 0), 4
    ) AS estimated_contribution_usd,
    CASE WHEN r.return_id IS NULL THEN 0 ELSE 1 END AS was_returned,
    CASE WHEN o.actual_delivery_date <= o.promised_delivery_date
         THEN 1 ELSE 0 END AS delivered_on_time
FROM orders o
JOIN customers c ON c.customer_id = o.customer_id
JOIN products p ON p.product_id = o.product_id
LEFT JOIN returns r ON r.order_id = o.order_id;
