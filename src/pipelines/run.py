import logging
import sys
from pathlib import Path

import psycopg2

sys.path.append(str(Path(__file__).resolve().parent.parent.parent))

from src.common.pipeline_config import PIPELINES
from src.extract.read_source import extract
from src.transform.clean_cafe_rows import transform as transform_cafe
from src.transform.clean_rows import transform as transform_sales
from src.load.load_to_postgres import load

#CONFIG SETUP
pipeline_name = sys.argv[1]
config = PIPELINES[pipeline_name]
TRANSFORMS = {
    "cafe": transform_cafe,
    "sales": transform_sales,
}
transform_func = TRANSFORMS[config["transform"]]

logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)

if __name__ == "__main__":
    try:
        logger.info("Extracting data")
        extracted = extract(config["source_file"])
        logger.info("Applying transformations")
        transformed = transform_func(extracted)
        logger.info("Uploading data")
        load(transformed,config["table_name"],config["columns"])
        logger.info("Data successfully loaded")
    except FileNotFoundError as e:
        logger.error("File not found: %s", e)
    except psycopg2.OperationalError as e:
        logger.error("DB connection error: %s", e)
    except psycopg2.Error as e:
        logger.error("SQL error: %s", e)
    except Exception as e:
        logger.error("Something going wrong in transformations: %s", e)