# Star schema


                                analytics.dim_branches
                                        |
                                        |
    analytics.dim_customers --- analytics.cafe_orders --- analytics.dim_drinks


# Fact table
    analytics.cafe_orders

# Dimension tables
    analytics.dim_branches
    analytics.dim_customers
    analytics.dim_drinks

# Connection
Right now tables aren't connected. But they should be by using dim tables id and name to id replacement in fact table

# Connection proposes
    analytics.cafe_orders.branch -> analytics.dim_branches.branch_id

    analytics.cafe_orders.customer_name -> analytics.dim_customers.customer_id

    analytics.cafe_orders.drink -> analytics.dim_drinks.drink_id