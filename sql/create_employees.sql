-- set database and schema 
Set databaseName = 'USER_INFINITELOOP';
Set schema_name = 'DEMO';

-- use database and schema
Use database identifier($databaseName);
use schema identifier($schema_name);

-- create table
CREATE TABLE IF NOT EXISTS demo.employees (
   EmployeeiD int,
   FirstName varchar,
   MiddleInitial varchar,
   LastName varchar,
   Region varchar)
   COMMENT = 'employees table';
