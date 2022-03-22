
-- set database and schema 
SET database_name = 'USER_INFINITELOOP'
SET schema_name = 'DEMO'

CREATE SCHEMA if NOT EXISTS ($schema_name)
-- use database and schema
Use database identifier($database_name)
use schema identifier($schema_name)


-- create table
CREATE TABLE IF NOT EXISTS DEMO.customers (
   CustomerID int,
   FirstName varchar,
   MiddleInitial varchar,
   LastName varchar)
   COMMENT = 'customers table';
