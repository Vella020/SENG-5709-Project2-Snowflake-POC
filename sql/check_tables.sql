Set databaseName = 'USER_INFINITELOOP';
Set schema_name = 'DEMO';

Use database identifier($databaseName);
Use schema identifier($schema_name);

DESCRIBE TABLE employees;

select * from employees;
select * from products;
select * from sales;
select * from customers;