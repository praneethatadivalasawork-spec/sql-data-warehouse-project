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

DROP DATABASE IF EXISTS bronze;
DROP DATABASE IF EXISTS silver;
DROP DATABASE IF EXISTS gold;

CREATE DATABASE bronze;
CREATE DATABASE silver;
CREATE DATABASE gold;

