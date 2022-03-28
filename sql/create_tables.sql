Set databaseName = 'infiniteloop_sales';
Set schema_name = 'raw';
CREATE DATABASE if NOT EXISTS identifier($databaseName);
CREATE SCHEMA if NOT EXISTS identifier($schema_name);

Use database identifier($databaseName);
Use schema identifier($schema_name);

CREATE TABLE IF NOT EXISTS raw.customers (
   CustomerID int,
   FirstName varchar,
   MiddleInitial varchar,
   LastName varchar)
   COMMENT = 'customers table';

CREATE TABLE IF NOT EXISTS raw.employees (
   EmployeeID int,
   FirstName varchar,
   MiddleInitial varchar,
   LastName varchar,
   Region varchar)
   COMMENT = 'employees table';

CREATE TABLE IF NOT EXISTS raw.products (
   ProductiD int,
   Name varchar,
   Price decimal)
   COMMENT = 'products table';

CREATE TABLE IF NOT EXISTS raw.sales (
   Orderid int,
   SalesPersoniD int,
   CustomeriD int,
   ProductiD int,
   Quantity int,
   Date timestamp)
   COMMENT = 'sales table';