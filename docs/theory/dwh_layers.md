DWH is a layer structure

1st layer: Staging - almost raw layer, text fields, no transformations, data as it is
2nd layer: ODS (operational data store) - layer for transformations, CAST, CASE, ect.
3rd layer: Mart - ready to use analytical tables. Contains metrics, aggregations and schemas. Joins, aggregations, metrics and buisiness logic. Marts - human readable.

In my study project:
Staging layer: staging.cafe_sales
ODS: analytics.cafe_orders; analytics.dim_customers; analytics.dim_drinks; analytics.dim_branches
Mart: no marts for now