
-- set database and schema 
SET database_name = 'USER_INFINITELOOP'
SET schema_name = 'DEMO'

-- use database and schema
Use database identifier($database_name)
use schema identifier($schema_name)

-- create stage on S3
CREATE or replace stage s3_customers_stage url='s3://seng5709/customers/'
file_format = (type = 'CSV' field_delimiter = '|' skip_header = 1);

CREATE or replace stage s3_employees_stage url='s3://seng5709/employees/'
file_format = (type = 'CSV' field_delimiter = '|' skip_header = 1);

CREATE or replace stage s3_products_stage url='s3://seng5709/products/'
file_format = (type = 'CSV' field_delimiter = '|' skip_header = 1);

CREATE or replace stage s3_sales_stage url='s3://seng5709/sales/'
file_format = (type = 'CSV' field_delimiter = '|' skip_header = 1);

