import psycopg2
from dotenv import load_dotenv
import os
import logging

logger = logging.getLogger(__name__)

load_dotenv()

def get_connection():
    db_host = os.getenv("DB_HOST")
    db_port = os.getenv("DB_PORT")
    db_name = os.getenv("DB_NAME")
    db_user = os.getenv("DB_USER")
    db_pass = os.getenv("DB_PASSWORD")

    logger.info("Connecting to %s:%s/%s", db_host, db_port, db_name)
    conn = psycopg2.connect(host=db_host,port=db_port,dbname=db_name,user=db_user,password=db_pass)
    return conn

if __name__ == "__main__":
    logging.basicConfig(level=logging.INFO)
    conn = get_connection()
    cur = conn.cursor()
    cur.execute("SELECT 1")
    print(cur.fetchone())
    cur.close()
    conn.close()