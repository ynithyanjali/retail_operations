-- Designed to run in SQLite; analytical SELECT queries use common SQL syntax.
CREATE TABLE customers (
    customer_id TEXT PRIMARY KEY,
    region TEXT NOT NULL,
    segment TEXT NOT NULL,
    signup_date TEXT NOT NULL
);
CREATE TABLE products (
    product_id TEXT PRIMARY KEY,
    product_name TEXT NOT NULL,
    category TEXT NOT NULL,
    unit_cost_usd REAL NOT NULL,
    list_price_usd REAL NOT NULL
);
CREATE TABLE orders (
    order_id TEXT PRIMARY KEY,
    order_date TEXT NOT NULL,
    customer_id TEXT NOT NULL REFERENCES customers(customer_id),
    product_id TEXT NOT NULL REFERENCES products(product_id),
    quantity INTEGER NOT NULL,
    unit_price_usd REAL NOT NULL,
    discount_pct REAL NOT NULL,
    shipping_cost_usd REAL NOT NULL,
    shipped_date TEXT NOT NULL,
    promised_delivery_date TEXT NOT NULL,
    actual_delivery_date TEXT NOT NULL
);
CREATE TABLE returns (
    return_id TEXT PRIMARY KEY,
    order_id TEXT NOT NULL UNIQUE REFERENCES orders(order_id),
    return_date TEXT NOT NULL,
    return_reason TEXT NOT NULL,
    refund_amount_usd REAL NOT NULL,
    return_processing_cost_usd REAL NOT NULL
);
