"""Run SQL analysis against synthetic CSV files using Python's built-in SQLite.

Run in project root: py run_sql_analysis.py
Requires Python 3.10+. No database installation or third-party packages.
"""
from pathlib import Path
import csv
import sqlite3

BASE = Path(__file__).resolve().parent
DATA_DIR = BASE / "data"
SQL_DIR = BASE / "sql"
OUTPUT_DIR = BASE / "results" / "sql"

TABLES = ("customers", "products", "orders", "returns")
REPORTS = (
    "02_executive_kpis",
    "03_monthly_sales",
    "04_category_performance",
    "05_region_performance",
    "06_return_reasons",
    "07_discount_analysis",
    "08_data_quality",
)


def import_table(conn, name):
    filename = DATA_DIR / f"{name}.csv"
    if not filename.exists():
        raise FileNotFoundError(f"Missing dataset: {filename}. Download all four CSVs into data/ first.")
    with filename.open(newline="", encoding="utf-8-sig") as f:
        reader = csv.DictReader(f)
        columns = reader.fieldnames
        if not columns:
            raise ValueError(f"No columns in {filename}")
        rows = [tuple(row[col] for col in columns) for row in reader]

    placeholders = ", ".join("?" for _ in columns)
    column_names = ", ".join(columns)
    conn.executemany(
        f"INSERT INTO {name} ({column_names}) VALUES ({placeholders})", rows
    )
    print(f"Loaded {name}: {len(rows)} records")


def export_report(conn, name):
    sql_path = SQL_DIR / f"{name}.sql"
    cursor = conn.execute(sql_path.read_text(encoding="utf-8"))
    headers = [col[0] for col in cursor.description]
    rows = cursor.fetchall()
    OUTPUT_DIR.mkdir(parents=True, exist_ok=True)
    output = OUTPUT_DIR / f"{name}.csv"
    with output.open("w", newline="", encoding="utf-8") as f:
        writer = csv.writer(f)
        writer.writerow(headers)
        writer.writerows(rows)
    print(f"Saved {output.relative_to(BASE)} ({len(rows)} rows)")
    return headers, rows


def main():
    conn = sqlite3.connect(":memory:")
    try:
        conn.execute("PRAGMA foreign_keys = ON")
        conn.executescript((SQL_DIR / "00_schema.sql").read_text(encoding="utf-8"))
        for table in TABLES:
            import_table(conn, table)
        conn.executescript((SQL_DIR / "01_order_metrics_view.sql").read_text(encoding="utf-8"))
        print("\nRunning SQL business reports...")
        outputs = {name: export_report(conn, name) for name in REPORTS}
        executive_headers, executive_rows = outputs["02_executive_kpis"]
        print("\nEXECUTIVE KPIs")
        for col, value in zip(executive_headers, executive_rows[0]):
            print(f"  {col}: {value}")
        quality = outputs["08_data_quality"][1]
        if any(row[1] for row in quality):
            raise ValueError(f"Data quality checks reported problems: {quality}")
        print("\nAll data quality checks passed. Reports are ready for review.")
    finally:
        conn.close()


if __name__ == "__main__":
    main()
