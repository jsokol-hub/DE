import logging

logger = logging.getLogger(__name__)

def transform(rows):
    cleaned = []
    for row in rows:
        cleaned_row = {}
        for key, value in row.items():
            value = value.strip()
            if value == "":
                value = None
            if (key == "drink" or key == "payment_method" or key == "branch") and value is not None:
                value = value.lower()
            if key == "order_date" and value is not None and "/" in value:
                value = value.split("/")
                value = f"{value[2]}-{value[1]}-{value[0]}"
            cleaned_row[key] = value
        cleaned.append(cleaned_row)

    seen = set()
    deduplicated = []
    for row in cleaned:
        key = (row["order_id"],)
        if key in seen:
            continue
        else:
            seen.add(key)
            deduplicated.append(row)
    
    return deduplicated
    