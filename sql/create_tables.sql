Set databaseName = 'infiniteloop_sales';
Set schema_name = 'raw';

CREATE DATABASE if NOT EXISTS identifier($databaseName);
CREATE SCHEMA if NOT EXISTS identifier($schema_name);

Use database identifier($databaseName);
Use schema identifier($schema_name);

CREATE TABLE IF NOT EXISTS raw.customers (
   CustomerID int NOT NULL UNIQUE,
   FirstName varchar NOT NULL,
   MiddleInitial varchar,
   LastName varchar NOT NULL);

CREATE TABLE IF NOT EXISTS raw.employees (
   EmployeeID int NOT NULL UNIQUE,
   FirstName varchar NOT NULL,
   MiddleInitial varchar,
   LastName varchar NOT NULL,
   Region varchar NOT NULL);

CREATE TABLE IF NOT EXISTS raw.products (
   ProductiD int NOT NULL UNIQUE,
   Name varchar NOT NULL,
   Price decimal NOT NULL);

CREATE TABLE IF NOT EXISTS raw.sales (
   Orderid int NOT NULL UNIQUE,
   SalesPersoniD int NOT NULL,
   CustomeriD int NOT NULL,
   ProductiD int NOT NULL,
   Quantity int NOT NULL,
   Date timestamp);