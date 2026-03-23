import psycopg2
from src.common.db import get_connection
import logging

logger = logging.getLogger(__name__)

def load(rows):
    conn = get_connection()
    cur = conn.cursor()
    try:
        cur.execute(
                'TRUNCATE TABLE staging.cafe_sales'
            )
        for row in rows:
            cur.execute(
                'INSERT INTO staging.cafe_sales (order_id, order_date, customer_name, drink, "size", price, branch, payment_method) VALUES (%s, %s, %s, %s, %s, %s, %s, %s)', (row["order_id"], row["order_date"], row["customer_name"], row["drink"], row["size"], row["price"], row["branch"], row["payment_method"])
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

    return