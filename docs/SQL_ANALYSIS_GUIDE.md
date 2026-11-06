# SQL Analysis Guide | Retail Operations

## Purpose

This case study analyzes **fictional retail transactions** using reproducible SQL reports. All findings concern synthetic data, not a real company.

## How to reproduce

1. Keep the four files `customers.csv`, `products.csv`, `orders.csv`, and `returns.csv` in `data/`.
2. Keep the included `sql/` folder and `run_sql_analysis.py` in the repository root.
3. Download the GitHub repository ZIP and extract it, or use a local clone.
4. Open PowerShell in that folder, then run `py run_sql_analysis.py`.
5. The program writes seven CSV reports to `results/sql/`.

Python 3.10+ is sufficient. The runner uses **SQLite** built into Python; it does not require a MySQL installation. The SELECT queries use widely available SQL expressions, but MySQL would require importing the CSVs into its own tables first.

## Files & SQL reasoning

- `00_schema.sql`: four tables, keys, and data types.
- `01_order_metrics_view.sql`: order-level metrics shared across reports.
- `02_executive_kpis.sql`: total orders, net sales, returns, delivery, estimated contribution.
- `03_monthly_sales.sql`: monthly trend, attributed to original order month.
- `04_category_performance.sql`: product category performance.
- `05_region_performance.sql`: sales and delivery performance by customer region.
- `06_return_reasons.sql`: reasons and costs associated with returns.
- `07_discount_analysis.sql`: performance by discount range.
- `08_data_quality.sql`: referential, duplication, and validity checks.

## KPI definitions

- **Sales after discounts:** `quantity × unit price × (1 − discount_pct / 100)`.
- **Net sales:** sales after discounts minus the recorded refund.
- **Return rate:** returned orders divided by all orders, not returned items divided by items shipped.
- **On-time delivery rate:** orders whose actual delivery date is on or before the promised date, divided by all orders.
- **Estimated contribution:** net sales − recorded product unit costs − shipping costs − return processing costs. This is **not accounting net profit** and excludes overhead, tax, and other unmodeled costs. For returned goods, costs are conservatively treated as spent; inventory recovery is not modeled.
- **Contribution margin:** estimated contribution / net sales.
- **Average net order value:** net sales / orders.

## Data notes & limitations

- 1,200 orders, 180 customer records, 28 products, and 122 returns.
- Dates for the orders are in 2025; some returns are recorded in January 2026.
- Each order is a single line item for one product. A return is modeled at most once per order.
- Monthly refunds are attributed to the **original order month** for cohort comparisons, not the refund transaction month. Do not interpret monthly net sales as an accounting posting ledger.
- Region is the customer's region, not necessarily their shipping destination.
- Product returns and delays may be influenced by other omitted factors; this is descriptive analysis, not proof of causation.

## Suggested next steps

Plot `03_monthly_sales.csv`, `04_category_performance.csv`, and `05_region_performance.csv` in a BI dashboard. Use the findings to draft a business requirements document and prioritized recommendations.
