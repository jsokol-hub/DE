import pytest
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


def test_empty_list():
    rows = []
    out = transform(rows)
    assert len(out) == 0


def test_empty_string():
    rows = [
        {
            "order_id": "",
            "order_date": "",
            "customer_name": "",
            "drink": "",
            "size": "",
            "price": "",
            "branch": "",
            "payment_method": "",
        }
    ]
    out = transform(rows)
    assert len(out) == 1
    r = out[0]
    assert r["order_id"] is None
    assert r["order_date"] is None
    assert r["customer_name"] is None
    assert r["drink"] is None
    assert r["size"] is None
    assert r["price"] is None
    assert r["branch"] is None
    assert r["payment_method"] is None


def test_absolete_row():
    rows = [
        {
            "order_date": "",
            "customer_name": "",
            "drink": "",
            "size": "",
            "price": "",
            "branch": "",
            "payment_method": "",
        }
    ]
    with pytest.raises(KeyError):
        transform(rows)
