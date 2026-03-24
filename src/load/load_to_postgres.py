import psycopg2
from src.common.db import get_connection
import logging

logger = logging.getLogger(__name__)

def load(rows, table_name, columns):
    conn = get_connection()
    cur = conn.cursor()
    col_names = ", ".join(columns)
    placeholders = ", ".join(["%s"]*len(columns))
    sql = f"INSERT INTO {table_name} ({col_names}) VALUES ({placeholders})"
    try:
        cur.execute(
            f'TRUNCATE TABLE {table_name}'
        )
        for row in rows:
            values = tuple(row[col] for col in columns)
            cur.execute(sql, values)
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