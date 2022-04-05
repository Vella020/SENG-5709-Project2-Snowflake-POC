Set databaseName = 'infiniteloop_sales';
Set schema_name = 'curated';
CREATE SCHEMA if NOT EXISTS identifier($schema_name);

Use database identifier($databaseName);
Use schema identifier($schema_name);

/* Create temporary view to fetch Customer Id and aggregate total amount of all products purchased by month for 2019*/
create view curated.customerID_monthly_sales_2019_view AS
select CustomerID AS CustomerID,
to_char(Date, 'yyyy') AS Year,
to_char(Date, 'mm') AS Month,
SUM (Price) AS TotalAmount
from raw.sales sa, raw.products pr
where sa.ProductID = pr.ProductID
and to_char(Date, 'yyyy') = 2019
group by CustomerID, to_char(Date, 'yyyy'), to_char(Date, 'mm');

/* Create First view to fetch Customer Info and aggregate total amount of all products purchased by month for 2019*/
create view curated.customer_monthly_sales_2019_view AS
select cu.CustomerID,
LastName as "CustomerLastName",
FirstName as "CustomerFirstName",
Year,
Month,
TotalAmount
from raw.customers cu, curated.customerID_monthly_sales_2019_view vi
where cu.CustomerID = vi.CustomerID;


/*Fetch the Data*/
select * from curated.customer_monthly_sales_2019_view;
