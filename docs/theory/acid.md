# ACID
A - atomicity
C - consistency
I - isolation
D - durability

Atomicity - run all or nothing. Uploading full dataset, not only part (rollback in error cases)
Consistency - data always following defined rules (order_id IS NOT NULL)
Isolation - parallel transactions are not disturbing each other. (until I commit the changes I cannot see them from other requests)
Durability - if commit accepted - data will not dissapear 