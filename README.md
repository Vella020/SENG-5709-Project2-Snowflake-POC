
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

### Team name/ Slack channel Name 
`#infinite-loop`

### Team/project Members
   - Corin McHargue
   - Bhavdeep Kumar
   - Mashfique Anwar
   - Ryan Kleeberger
   - Suvarna Vellanki

### **Snowflaks setup**
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

Set security key from AWS as per the below link to suessfully download data from S3
 `https://docs.snowflake.com/en/user-guide/snowsql-start.html#using-named-connections`

### Load data from s3 to tables

#### Create empty tables:
`$ snowsql -c <connectionName> -f "<Local folder path>/SENG-5709-Project2-Snowflake-POC/sql/create_tables.sql";`

#### Load data from S3 to stage:
`$ snowsql -c <connectionName> -f "<Local folder path>/SENG-5709-Project2-Snowflake-POC/sql/stage_raw_s3.sql";`

#### Load data from stage to tables created above: 
`$ snowsql -c <connectionName> -f "<Local folder path>/SENG-5709-Project2-Snowflake-POC/sql/load_rawdata.sql";`
  
#### Validate that tables and data exist:
`$ snowsql -c <connectionName> -f "<Local folder path>/SENG-5709-Project2-Snowflake-POC/sql/check_tables.sql";`
