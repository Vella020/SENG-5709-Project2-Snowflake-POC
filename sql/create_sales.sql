-- set database and schema 
SET database_name = 'USER_INFINITELOOP'
SET schema_name = 'DEMO'

-- use database and schema
Use database identifier($database_name)
use schema identifier($schema_name)

-- create table
CREATE TABLE IF NOT EXISTS DEMO.sales ()
   Orderid int,
   SalesPersoniD int,
   CustomeriD int,
   ProductiD int,
   Quantity int,
   Date timestamp)
   COMMENT = 'sales table'