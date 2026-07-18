/*--------------------------------------------------------------------------------------------------
   create databases & drop if exsists
   ---------------------------------------------------------------------------------------------------
Script Purpose:
Creates three separate databases: bronze, silver, and gold. 
If any of these databases already exist, the script will drop (delete) them first and then recreate them fresh.

warning:
This script will permanently delete all existing data in the bronze, silver, and gold databases. 
Make sure you have a backup of your data before running this script, in case you need it later.
*/

--creating db and schemas using create 
use master;
go

if exists(select 1 from sys.databases where name = 'DataWarehouse')
begin
	alter database DataWarehouse set single_user with rollback immediate;
	drop database DataWarehouse;
end;
go
create database DataWarehouse;
go

use DataWarehouse;
go

create schema bronze;
go

create schema silver;
go

create schema gold;
