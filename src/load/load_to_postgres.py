import psycopg2
from src.common.db import get_connection
import logging

logger = logging.getLogger(__name__)

def load(rows):
    conn = get_connection()
    cur = conn.cursor()
    try:
        cur.execute(
            'TRUNCATE TABLE staging.raw_sales'
        )
        for row in rows:
            cur.execute(
                "INSERT INTO staging.raw_sales (order_id, order_date, customer_id, customer_name, product_name, category, quantity, unit_price, city, country) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s)", (row["order_id"], row["order_date"], row["customer_id"], row["customer_name"], row["product_name"], row["category"], row["quantity"], row["unit_price"], row["city"], row["country"])
            )
        conn.commit()
        logger.info("Number of rows: %d", len(rows))
    
    except psycopg2.Error as e:
        conn.rollback()
        logger.error("Upload error: %s", e)
        raise

    finally:
        cur.close()
        conn.close()
    
    return len(rows)