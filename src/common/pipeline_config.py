PIPELINES = {
    "cafe": {
        "source_file": "data/raw/cafe_orders.csv",
        "table_name": "staging.cafe_sales",
        "columns": ["order_id", "order_date", "customer_name", "drink", "size", "price", "branch", "payment_method"],
        "transform": "cafe",
    },
    "sales": {
        "source_file": "data/raw/sales_data.csv",
        "table_name": "staging.raw_sales",
        "columns": ["order_id", "order_date", "customer_id", "customer_name", "product_name", "category", "quantity", "unit_price", "city", "country"],
        "transform": "sales",
    },
}