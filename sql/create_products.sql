-- set database and schema 
Set databaseName = 'USER_INFINITELOOP';
Set schema_name = 'DEMO';
CREATE SCHEMA if NOT EXISTS identifier($schema_name);
-- use database and schema
Use database identifier($databaseName);
use schema identifier($schema_name);

-- create table
CREATE TABLE IF NOT EXISTS demo.products (
   ProductiD int,
   Name varchar,
   Price decimal)
   COMMENT = 'products table';