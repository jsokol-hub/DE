Normalizations is the process of data organization for:
1. exclude duplicates
2. exclude anomalies 
3. make data logacally clean\

1NF - first normal form
There are no multiple values in one cell. One cell - one value - atomic value

2NF - second normal form
Each column depends on one id in a row. каждый неключевой столбец зависит от всего первичного ключа, а не от его части. Это важно когда ключ составной. Например, если ключ — (order_id, drink), то branch не должен зависеть только от order_id.

3NF - third normal form
No transaction dependencies. Do not duplicate dimension in tables. Если customer_name → city, а order_id → customer_name, значит city зависит от ключа транзитивно — выносим в отдельную таблицу.

Denormalization uses in analytical cases. It makes queries lighter and faster 