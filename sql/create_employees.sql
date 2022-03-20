-- set database and schema 
SET database_name = 'USER_INFINITELOOP'
SET schema_name = 'DEMO'

-- use database and schema
Use database identifier($database_name)
use schema identifier($schema_name)

-- create table
CREATE TABEL IF NOT EXISTS demo.employees ()
   id int)