import logging
import sys
from pathlib import Path

import psycopg2

sys.path.append(str(Path(__file__).resolve().parent.parent.parent))

from src.extract.read_source import extract
from src.transform.clean_cafe_rows import transform
from src.load.load_to_postgres import load

logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)

table_name = "staging.cafe_sales"
columns = ["order_id", "order_date", "customer_name", "drink", "size", "price", "branch", "payment_method"]

if __name__ == "__main__":
    try:
        logger.info("Extracting data")
        extracted = extract("data/raw/cafe_orders.csv")
        logger.info("Applying transformations")
        transformed = transform(extracted)
        logger.info("Uploading data")
        load(transformed,table_name,columns)
        logger.info("Data successfully loaded")
    except FileNotFoundError as e:
        logger.error("File not found: %s", e)
    except psycopg2.OperationalError as e:
        logger.error("DB connection error: %s", e)
    except psycopg2.Error as e:
        logger.error("SQL error: %s", e)
    except Exception as e:
        logger.error("Something going wrong in transformations: %s", e)