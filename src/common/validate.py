from datetime import datetime
import logging

logger = logging.getLogger(__name__)

def validate(rows):
    total = len(rows)
    valid_counter = 0
    invalid_counter = 0
    issues = []
    data_is_valid = True

    seen = set()

    for row in rows:
        row_is_valid = True
        order_id = row.get("order_id")
        price = row.get("price")
        order_date = row.get("order_date")
        
        if order_id in seen:
            issues.append(f"Duplicate order_id: {order_id}")
            row_is_valid = False
        else:
            seen.add(order_id)
        
        if price is not None:
            try:
                float(price)
            except ValueError:
                issues.append(f"Invalid price in order_id: '{order_id}', value = '{price}'")
                row_is_valid = False
        
        if order_date is not None:
            try:
                datetime.strptime(order_date, "%Y-%m-%d")
            except ValueError:
                issues.append(f"Invalid order_date in order_id: '{order_id}', value = '{order_date}', expected format YYYY-MM-DD")
                row_is_valid = False

        if row_is_valid:
            valid_counter += 1
        else:
            invalid_counter += 1

    if invalid_counter != 0:
        data_is_valid = False
        logger.error("Invalid data detected. Please, check the logs")

    
    return {
        "total": total,
        "valid": valid_counter,
        "invalid": invalid_counter,
        "issues": issues,
        "data_is_valid": data_is_valid,
    }
