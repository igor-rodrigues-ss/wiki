# Cursor Based Pagination

```python
"""
Usage:

# First execution
python cp.py

# Next execution
python cp.py --created_at "created_at" --id ID
"""
import os
import sqlite3
from typing import Optional
from pprint import pprint

def get_conn():
    if os.path.exists("app.db"):
        os.remove("app.db")

    conn = sqlite3.connect("app.db")
    return conn


conn = get_conn()


def migration():
    cur = conn.cursor()
    
    cur.execute("""
        CREATE TABLE IF NOT EXISTS products (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
            name TEXT,
            price FLOAT
        );
    """)

    cur.execute("""
        INSERT INTO products (id, name, price, created_at) VALUES
            (1,  'Gaming Mouse',      29.90, '2026-02-22 08:05:00'),
            (2,  'Mech Keyboard',     89.90, '2026-02-22 08:42:00'),
            (3,  'Wireless Headset',  69.00, '2026-02-22 09:18:00'),
            (4,  'FHD Monitor 24',   179.99, '2026-02-22 09:55:00'),
            (5,  'HD Webcam',         39.50, '2026-02-22 10:33:00'),
            (6,  'Ultrabook 14',     999.00, '2026-02-22 11:07:00'),
            (7,  'NVMe SSD 1TB',      79.90, '2026-02-22 11:44:00'),
            (8,  'USB Drive 128GB',   12.90, '2026-02-22 12:26:00'),
            (9,  'Ergo Chair',       249.00, '2026-02-23 08:03:00'),
            (10, 'Monitor Arm',       34.90, '2026-02-23 08:41:00'),
            (11, 'USB-C Hub',         49.90, '2026-02-23 09:22:00'),
            (12, 'GaN Charger 65W',   39.90, '2026-02-23 10:05:00'),
            (13, 'Smartwatch Fit',   129.00, '2026-02-23 10:48:00'),
            (14, 'BT Speaker',        59.90, '2026-02-23 11:26:00'),
            (15, 'USB Mic',           89.00, '2026-02-23 11:59:00')
        ON CONFLICT(id) DO NOTHING;
    """)
    
    conn.commit()

def cursor_based_pagination(created_at: Optional[str] = None, seq_id: Optional[int] = None, limit: int = 3):
    SQL = f"SELECT id, created_at, name, price FROM products ORDER BY created_at DESC, id DESC limit {limit}"
    
    if created_at:
        SQL = f"""
        SELECT id, created_at, name, price FROM products
        WHERE (created_at, id) < ('{created_at}', {seq_id})
        ORDER BY created_at DESC, id DESC
        limit {limit}
        """
    
    cursor = conn.cursor()
    cursor.execute(SQL)
    data_page = cursor.fetchall()

    pprint(data_page)

    print("Pointer to next page ===============================")
    last_page_item = data_page[-1]

    print(f"created_at: {last_page_item[1]}")
    print(f"id: {last_page_item[0]}")
    print("====================================================")


if __name__ == "__main__":
    import argparse

    parser = argparse.ArgumentParser(description="Cursor params")

    parser.add_argument("--created_at", default=None, help="Created timestamp")
    parser.add_argument("--id", default=None, type=int, help="Record ID")

    args = parser.parse_args()

    migration()
    cursor_based_pagination(args.created_at, args.id)

```