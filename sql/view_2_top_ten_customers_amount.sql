Set databaseName = 'infiniteloop_sales';
Set schema_name = 'curated';

Use database identifier($databaseName);
Use schema identifier($schema_name);

/* Create temporary view to fetch first 10 Customer Id's and total lifetime purchased amount*/
create view curated.top_ten_customerID_amount_view AS
select top 10 CustomerID AS CustomerID,
SUM (sa.Quantity * pr.price) AS TotalLifetimePurchasedAmount
from raw.sales sa, raw.products pr
where sa.ProductID = pr.ProductID
group by CustomerID
order by TotalLifetimePurchasedAmount desc;

/* Create Second view to return top ten customers sorted by total dollar amount in sales from highest to lowest*/
create view curated.top_ten_customers_amount_view AS
select cu.CustomerID,
LastName as "CustomerLastName",
FirstName as "CustomerFirstName",
TotalLifetimePurchasedAmount
from raw.customers cu, curated.top_ten_customerID_amount_view vi
where cu.CustomerID = vi.CustomerID;