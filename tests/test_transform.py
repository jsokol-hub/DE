"""Unit tests for sales CSV transform (no database required)."""

from src.transform.clean_rows import transform


def test_strips_whitespace_and_empty_to_none():
    rows = [
        {
            "order_id": "1",
            "order_date": " 2024-01-01 ",
            "customer_id": "c1",
            "customer_name": "",
            "product_name": "  Widget ",
            "category": "electronics",
            "quantity": "2",
            "unit_price": "10",
            "city": "NYC",
            "country": "US",
        }
    ]
    out = transform(rows)
    assert len(out) == 1
    r = out[0]
    assert r["order_date"] == "2024-01-01"
    assert r["customer_name"] is None
    assert r["product_name"] == "Widget"
    assert r["category"] == "Electronics"


def test_normalizes_dd_mm_yyyy_date():
    rows = [
        {
            "order_id": "1",
            "order_date": "15/03/2024",
            "customer_id": "c1",
            "customer_name": "A",
            "product_name": "P",
            "category": "x",
            "quantity": "1",
            "unit_price": "1",
            "city": "X",
            "country": "Y",
        }
    ]
    out = transform(rows)
    assert out[0]["order_date"] == "2024-03-15"


def test_deduplicates_by_order_product_quantity():
    row = {
        "order_id": "1",
        "order_date": "2024-01-01",
        "customer_id": "c1",
        "customer_name": "A",
        "product_name": "P",
        "category": "Cat",
        "quantity": "1",
        "unit_price": "5",
        "city": "X",
        "country": "Y",
    }
    out = transform([row, dict(row)])
    assert len(out) == 1
