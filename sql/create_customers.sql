
-- -- set database and schema 
Set databaseName = 'USER_INFINITELOOP';
Set schema_name = 'DEMO';
-- CREATE SCHEMA if NOT EXISTS USER_INFINITELOOP.DEMO;
 CREATE SCHEMA if NOT EXISTS identifier($schema_name);
-- -- use database and schema
Use database identifier($databaseName);
Use schema identifier($schema_name);

-- create table
CREATE TABLE IF NOT EXISTS DEMO.customers (
   CustomerID int,
   FirstName varchar,
   MiddleInitial varchar,
   LastName varchar)
   COMMENT = 'customers table';
