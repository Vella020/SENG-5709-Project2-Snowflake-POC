Set databaseName = 'infiniteloop_sales';
Set schema_name = 'raw';
Use database identifier($databaseName);
use schema identifier($schema_name);

-- Show any duplicates on the customer table
select CustomerID,
    FirstName,
    MiddleInitial,
    LastName,
    COUNT(*)
from customers
group by CustomerID,
    FirstName,
    MiddleInitial,
    LastName
having COUNT(*) > 1;

-- Create new customer table without duplicates
create or replace table customers_non_duplicates as
select st.*
from customers st qualify row_number() over (
        partition by CustomerID,
        FirstName,
        MiddleInitial,
        LastName
        order by CustomerID
    ) = 1;

-- Swap new table and old
alter table customers swap with customers_non_duplicates;

-- drop customers_non_duplicates
drop table customers_non_duplicates;

-- Show any duplicates on the employee table
select employeeID,
    FirstName,
    MiddleInitial,
    LastName,
    Region,
    COUNT(*)
from employees
group by employeeID,
    FirstName,
    MiddleInitial,
    LastName,
    Region
having COUNT(*) > 1;

-- Create new employee table without duplicates
create or replace table employees_non_duplicates as
select st.*
from employees st qualify row_number() over (
        partition by employeeID,
        FirstName,
        MiddleInitial,
        LastName,
        Region
        order by employeeID
    ) = 1;

-- Swap new table and old
alter table employees swap with employees_non_duplicates;

-- drop employees_non_duplicates
drop table employees_non_duplicates;

-- Show any duplicates on the sales table
select orderID,
    SalesPersoniD,
    CustomeriD,
    ProductiD,
    Quantity,
    Date,
    COUNT(*)
from sales
group by orderID,
    SalesPersoniD,
    CustomeriD,
    ProductiD,
    Quantity,
    Date
having COUNT(*) > 1;

-- Create new sales table without duplicates
create or replace table sales_non_duplicates as
select st.*
from sales st qualify row_number() over (
        partition by orderID,
    SalesPersoniD,
    CustomeriD,
    ProductiD,
    Quantity,
    Date
        order by orderid
    ) = 1;

-- Swap new table and old
alter table sales swap with sales_non_duplicates;

-- drop sales_non_duplicates
drop table sales_non_duplicates;