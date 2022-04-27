Set databaseName = 'infiniteloop_sales';
Set schema_name = 'curated';
Use database identifier($databaseName);
Use schema identifier($schema_name);

/* Create sales view that includes columns for sales year and month*/
create view curated.product_sales_view AS
select sa.OrderID,
    sa.SalesPersonID,
    sa.CustomerID,
    sa.ProductID,
    pr.name AS ProductName,
    pr.price AS ProductPrice,
    sa.Quantity,
    sa.Quantity * pr.price AS TotalSalesAmount,
    to_char(Date, 'yyyy-mm-dd') AS OrderDate,
    to_char(Date, 'yyyy') AS SalesYear,
    to_char(Date, 'mm') AS SalesMonth
from raw.sales sa,
    raw.products pr
where sa.ProductID = pr.ProductID;