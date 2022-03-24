
# SENG-5709-Project2-Snowflake-POC 
This Project is all about ingest the sales data from the data warehouse
into Snowflake and prepare it for analysis and consumption. The data warehouse team has delivered a
portion of the data to you in an S3 bucket to use in the Proof-of-Concept (POC).


To clone this repo, run 

`git clone https://github.com/Vella020/SENG-5709-Project2-Snowflake-POC.git`
Basic git command
```
git pull
git commit
git push
```

- **Team name/ Slack channel Name** : **infinite-loop**

- **Team/project Members**
   - Corin McHargue
   - Bhavdeep Kumar
   - Mashfique Anwar
   - Ryan Kleeberger
   - Suvarna Vellanki

- **Snowflaks setup**
- Download snowsql
- Set below config parameters in config file by (open ~/.snowsql/config) command
- `https://docs.snowflake.com/en/user-guide/snowsql-start.html#using-named-connections`
  `     - [connections.<connectionName>
       - accountname = <accountName> 
       - username = <userName> 
       - password = <password>`
- set security key from AWS as per the below link to suessfully download data from S3
- Now run below commands in squence to run load data from s3 to tables
  - create empty Tables
 ` - snowsql -c <connectionName> -f "<Local folder path>/SENG-5709-Project2-Snowflake-POC/sql/create_customers.sql";
  - snowsql -c /<connectionName> -f "<Local folder path>/SENG-5709-Project2-Snowflake-POC/sql/create_employees.sql";
  - snowsql -c <connectionName> -f "<Local folder path>/SENG-5709-Project2-Snowflake-POC/sql/create_products.sql";
  - snowsql -c <connectionName> -f "<Local folder path>/SENG-5709-Project2-Snowflake-POC/sql/create_sales.sql";`
  -   Load data from S3 to stage 
  - `snowsql -c <connectionName> -f "<Local folder path>/SENG-5709-Project2-Snowflake-POC/sql/stage_raw_s3.sql";`
  -   Load data from stage to tables created above 
  - `snowsql -c <connectionName> -f "<Local folder path>/SENG-5709-Project2-Snowflake-POC/sql/load_rawdata.sql";`




- Now check the table values cli using below commands
- by logging on to `https://<accounName>.snowflakecomputing.com/console#/internal/worksheet`
`- -  - DESCRIBE TABLE  employees;
- select * from  employees;
- select * from  products;
- select * from  sales;
- select * from customers; `
