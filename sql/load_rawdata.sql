Set databaseName = 'infiniteloop_sales';
Set schema_name = 'raw';

Use database identifier($databaseName);
use schema identifier($schema_name);

-- copy stage into tables

COPY into customers
from @s3_customers_stage
on_error = continue
pattern = '.*\.csv';

COPY into employees
from @s3_employees_stage
on_error = continue
pattern = '.*\.csv';

COPY into products
from @s3_products_stage
on_error = continue
pattern = '.*\.csv';

COPY into sales
from @s3_sales_stage
on_error = continue
pattern = '.*\.csv';
