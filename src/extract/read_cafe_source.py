import csv
import logging
from pathlib import Path

logger = logging.getLogger(__name__)

def read_data(file_path):
    file_path = Path(file_path)
    if not file_path.exists():
        raise FileNotFoundError(f"File not found: {file_path}")
    with open(file_path, newline="", encoding="utf-8") as raw_file:
        reader = csv.DictReader(raw_file)
        rows = list(reader)
        logger.info("Number of rows: %d", len(rows))
    return rows
