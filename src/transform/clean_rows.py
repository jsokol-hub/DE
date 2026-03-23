import logging
import sys
from pathlib import Path

logger = logging.getLogger(__name__)

def transform(rows):
    logger.info("Transforming dataset")
    cleaned = []
    for row in rows:
        cleaned_row = {}
        for key, value in row.items():
            value = value.strip()
            if value == "":
                value = None
            if key == "category" and value is not None:
                value = value.title()
            if key == "order_date" and value is not None and "/" in value:
                value = value.split("/")
                value = f"{value[2]}-{value[1]}-{value[0]}"
            cleaned_row[key] = value
        cleaned.append(cleaned_row)
    
    logger.info("Checking duplicates")
    seen = set()
    deduped = []
    for row in cleaned:
        key = (row["order_id"], row["product_name"], row["quantity"])
        if key in seen:
            continue
        else:
            seen.add(key)
            deduped.append(row)
    
    logger.info("Success")

    return deduped

if __name__ == "__main__":
    sys.path.append(str(Path(__file__).resolve().parent.parent.parent))
    from src.extract.read_source import extract
    logging.basicConfig(level=logging.INFO)
    test = extract("data/raw/sales_data.csv")
    logger.info("Dataset loaded")
    test2 = transform(test)