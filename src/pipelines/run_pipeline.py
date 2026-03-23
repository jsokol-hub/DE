import logging
import sys
from pathlib import Path

sys.path.append(str(Path(__file__).resolve().parent.parent.parent))

from src.extract.read_source import extract
from src.transform.clean_rows import transform
from src.load.load_to_postgres import load

logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)

if __name__ == "__main__":
    logger.info("Extracting data")
    extracted = extract("data/raw/sales_data.csv")
    logger.info("Applying transformations")
    transformed = transform(extracted)
    logger.info("Uploading data")
    load(transformed)
    logger.info("Data successfully loaded")
