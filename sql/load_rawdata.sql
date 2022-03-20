
-- set database and schema 
SET database_name = 'USER_INFINITELOOP'
SET schema_name = 'DEMO'

-- use database and schema
Use database identifier($database_name)
use schema identifier($schema_name)

-- copy stage into tables

COPY into customers
from @s3_customers_stage
pattern = '*.csv '

COPY into employees
from @s3_employees_stage
pattern = '*.csv'

COPY into products
from @s3_products_stage
pattern = '*.csv'

COPY into sales
from @s3_sales_stage
pattern = '*.csv'
