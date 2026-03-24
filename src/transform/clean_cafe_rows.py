import logging

#commenting for fafo

logger = logging.getLogger(__name__)

def transform(rows):
    logger.info("Input rows: %s", len(rows))
    counter_null = 0
    cleaned = []
    for row in rows:
        cleaned_row = {}
        for key, value in row.items():
            value = value.strip()
            if value == "":
                value = None
            if key == "price" and value is None:
                counter_null +=1
            if (key == "drink" or key == "payment_method" or key == "branch") and value is not None:
                value = value.lower()
            if key == "order_date" and value is not None and "/" in value:
                value = value.split("/")
                value = f"{value[2]}-{value[1]}-{value[0]}"
            cleaned_row[key] = value
        cleaned.append(cleaned_row)
    logger.info("NULL value rows: %s", counter_null)

    counter_dupl = 0
    seen = set()
    deduplicated = []
    for row in cleaned:
        key = (row["order_id"],)
        if key in seen:
            counter_dupl +=1
            continue
        else:
            seen.add(key)
            deduplicated.append(row)
    logger.info("Deduplicated rows: %s", counter_dupl)
    logger.info("Output rows: %s", len(deduplicated))
    
    return deduplicated