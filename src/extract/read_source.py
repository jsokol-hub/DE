import csv
import logging
from pathlib import Path

logger = logging.getLogger(__name__)

def extract(file_path):
    file_path = Path(file_path)
    logger.info("Reading raw file %s", file_path)
    if not file_path.exists():
        raise FileNotFoundError(f"File not found: {file_path}")
    logger.info("Opening file: %s", file_path.name)
    with open(file_path, newline="", encoding="utf-8") as raw_file:
        reader = csv.DictReader(raw_file)
        rows = list(reader)
        logger.info("Number of rows: %d", len(rows))
    return rows