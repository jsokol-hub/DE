import sys
from pathlib import Path

sys.path.append(str(Path(__file__).resolve().parent.parent.parent))
from src.transform.clean_cafe_rows import transform


def test_none_values():
    rows = [
        {
            "order_id": "1",
            "order_date": " 2024-01-01 ",
            "customer_name": "",
            "drink": "  espresso ",
            "size": "S",
            "price": "3.00",
            "branch": "central",
            "payment_method": "card",
        }
    ]
    out = transform(rows)
    assert len(out) == 1
    r = out[0]
    assert r["order_date"] == "2024-01-01"
    assert r["customer_name"] is None
    assert r["drink"] == "espresso"


def test_deduplication():
    rows = [
        {
            "order_id": "1",
            "order_date": "2024-01-01",
            "customer_name": "Diana Orlova",
            "drink": "Espresso",
            "size": "S",
            "price": "3.00",
            "branch": "central",
            "payment_method": "card",
        },
        {
            "order_id": "1",
            "order_date": "2024-01-02",
            "customer_name": "Elena Kosova",
            "drink": "Espresso",
            "size": "L",
            "price": "5.50",
            "branch": "park",
            "payment_method": "cash",
        },
    ]
    out = transform(rows)
    assert len(out) == 1


def test_date():
    rows = [
        {
            "order_id": "1",
            "order_date": "01/02/2024",
            "customer_name": "Elena Kosova",
            "drink": "Espresso",
            "size": "S",
            "price": "3.00",
            "branch": "central",
            "payment_method": "card",
        }
    ]
    out = transform(rows)
    assert len(out) == 1
    r = out[0]
    assert r["order_date"] == "2024-02-01"
