
-- set database and schema 
Set databaseName = 'USER_INFINITELOOP';
Set schema_name = 'DEMO';
CREATE DATABASE if NOT EXISTS identifier($databaseName);
CREATE SCHEMA if NOT EXISTS identifier($schema_name);
-- use database and schema
Use database identifier($databaseName);
use schema identifier($schema_name);

-- copy stage into tables

COPY into customers
from @s3_customers_stage
pattern = '.*customers.*.csv';

COPY into employees
from @s3_employees_stage
pattern = '.*employees.*.csv';

COPY into products
from @s3_products_stage
pattern = '.*products.*.csv';

COPY into sales
from @s3_sales_stage
pattern = '.*sales.*.csv';
