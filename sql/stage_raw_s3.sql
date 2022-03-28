Set databaseName = 'infiniteloop_sales';
Set schema_name = 'raw';
Use database identifier($databaseName);
use schema identifier($schema_name);

-- create file format

CREATE or replace file format mycsvformat
  type = 'CSV'
  field_delimiter = '|'
  skip_header = 1
  error_on_column_count_mismatch = false;

-- create stage on S3
CREATE or replace stage s3_customers_stage
    url='s3://seng5709/customers/'
    file_format = mycsvformat;

CREATE or replace stage s3_employees_stage
    url='s3://seng5709/employees/'
    file_format = mycsvformat;

CREATE or replace stage s3_products_stage
    url='s3://seng5709/products/'
    file_format = mycsvformat;

CREATE or replace stage s3_sales_stage
    url='s3://seng5709/sales/'
    file_format = mycsvformat;
