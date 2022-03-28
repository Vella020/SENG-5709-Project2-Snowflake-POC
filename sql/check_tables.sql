Set databaseName = 'infiniteloop_sales';
Set schema_name = 'raw';

Use database identifier($databaseName);
Use schema identifier($schema_name);

DESCRIBE TABLE employees;

select * from employees;
select * from products;
select * from sales;
select * from customers;