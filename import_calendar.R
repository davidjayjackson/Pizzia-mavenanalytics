## Uploaded Calander data to SQL SERVER
# 20222-10-07


library(tidyverse)
library(readxl)
library(janitor)
library(DBI)
library(odbc)

rm(list=ls())
calendar <- read_excel("./calendar_table.xlsx") %>% clean_names()

## https://db.rstudio.com/databases/microsoft-sql-server/
con <- DBI::dbConnect(odbc::odbc(), 
                      Driver = "SQL Server", 
                      Server = "localhost\\SQLEXPRESS", 
                      Database = "mavenanalytics", 
                      Trusted_Connection = "True")

# 

dbWriteTable(con, "calendar",calendar ,overwrite=TRUE)
dbListFields(con,"calendar")