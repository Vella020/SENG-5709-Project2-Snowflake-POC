
# Snowflake POC by Infinte Loop
 
This Project involves ingesting sales data from the data warehouse
into Snowflake and preparing it for analysis and consumption. The data warehouse team has delivered a portion of the data for us in an S3 bucket to use in the Proof-of-Concept (POC).


To clone this repo, please run:

```
git clone https://github.com/Vella020/SENG-5709-Project2-Snowflake-POC.git
```

#### Slack Channel: `#infinite-loop`

### Team/Project Members
   - Corin McHargue
   - Bhavdeep Kumar
   - Mashfique Anwar
   - Ryan Kleeberger
   - Suvarna Vellanki

   
### Table of Contents
1. [Deployment Run Book] (#deployment-run-book)
	- [Snowflake Setup] (#snowflake-setup)
	- [Load data from S3 to tables] (#load-data-from-s3-to-tables)
2. [User Documentation] (#user-documentation)
	- [Data Models / Table Schema](#data-models-/-table-schema)
	- [Quality Analysis] (#quality-analysis) 
3. [Materialized View Use Cases] (#materialized-view-use-cases)

## Deployment Run Book

### **Snowflake Setup**
Step 1 Signup for snowsql `https://signup.snowflake.com/`
Step 2 Add connection parameters in `~/.snowsql/config`

```
[connections.infiniteloop]
accountname = <accountName> 
username = <userName>
password = <password>
dbname = <dbname>
schemaname = <schema>
warehousename = <compute_wh>
```

Set security key from AWS as per the below link to successfully download data from S3
 `https://docs.snowflake.com/en/user-guide/snowsql-start.html#using-named-connections`

### Load data from S3 to tables

#### Create empty tables:
See User Documentation section for info about the tables:
`$ snowsql -c <connectionName> -f "<Local folder path>/SENG-5709-Project2-Snowflake-POC/sql/create_tables.sql";`

#### Load data from S3 to stage:
This script automatically downloads files from S3 and uploads them to Snowflake.
`$ snowsql -c <connectionName> -f "<Local folder path>/SENG-5709-Project2-Snowflake-POC/sql/stage_raw_s3.sql";`

#### Load data from stage to tables created above: 
`$ snowsql -c <connectionName> -f "<Local folder path>/SENG-5709-Project2-Snowflake-POC/sql/load_rawdata.sql";`
  
#### Validate that tables and data exist:
`$ snowsql -c <connectionName> -f "<Local folder path>/SENG-5709-Project2-Snowflake-POC/sql/check_tables.sql";`


## User Documentation

Database Name = `infiniteloop_sales` 

Schema Name = `raw`

### Data Models / Table Schema
- Customers
	- CustomerID `int`
	- FirstName `varchar`
	- MiddleInitial `varchar`
	- LastName `varchar`
- Employees
	- EmployeeID `int`
	- FirstName `varchar`
	- MiddleInitial `varchar`
	- LastName `varchar`
	- Region `varchar`
- Products
	- ProductID `int`
	- Name `varchar`
	- Price `decimal`
- Sales
	-  OrderID `int`
	-  SalesPersonID `int`
	-  CustomerID `int`
	-  ProductID `int`
	-  Quantity `int`
	-  Date `timestamp`

### Quality Analysis

TODO: 

## Materialized View Use Cases

### 1. Historical Weekly / Monthly / Annual Sales Report
Report(s) could be updated automatically by Snowflake as new data is ingested periodically into the database. It'll be especially useful for Analytics and Business Intelligence users, who run a lot of queries on historical data, and current data. For e.g. to compare last 6 month sale trends with current month, the data from last 6 months (or some `n` months) could be stored in materialized view(s).

### 2. Determining how Price affects Sales & Price Trends

During holidays and sale seasons, many products tend to have lowered prices. One could compare prices during non-holidays vs holidays and learn how it affects sales numbers. Materialized views of table joins such as `products` and `sales` could come in handy in this case. The materialized view results could also filter non-holiday prices and sales.













