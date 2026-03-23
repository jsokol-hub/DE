# Data modeling doc

## What is grain in my table? 

One row is one transaction in my virtual coffee shop. 

Each row contains:
- id as primary key
- order id
- order date 
- customer name if it exists
- ordered drink
- ordered drink size
- price, if exists
- branch
- payment method
- timestamp of data upload

## Identification key

The business key field is "order_id". It identifies each order in the system.
Also, there is a surrogate key ("id") - it guarantee table uniqueness.

## Table type

It's a fact table, cause it contains events and event metric as price. Events can be aggregated and metrics can be summarized.

## Metrics and attributes

- Metrics: price (can do AVG, SUM, COUNT)
- Attributes: order_id, order_date, customer_name, drink, size, branch, payment_method (can be filtered and grouped)