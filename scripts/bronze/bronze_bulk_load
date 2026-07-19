/* 
Applying full load -- fetch all records from local to data warehouse
using bulk insert.

note : check the database 'datawarehouse' is it connected to the right one.

warning -- if u run bulk insert query 2 to 3 times it will create duplicates
so before running the query just use truncate command and run these all.
*/
use DataWarehouse;
go

exec bronze.load_bronze;
go

create or alter procedure bronze.load_bronze as
begin
	declare @start_time datetime, @end_time datetime, @batch_start_time datetime, @batch_end_time datetime;
	begin try
		set @batch_start_time = getdate();
		print '===================================================';
		print 'Loading Bronze Layer';
		print '===================================================';

		print '---------------------------------------------------';
		print 'Loading CRM Tables';
		print '---------------------------------------------------';

		set @start_time = getdate();
		print '>> Truncating Table : bronze.crm_cust_info';
		--1 bronze.crm_cust_info
		truncate table bronze.crm_cust_info;

		Print '>> Inserting Data Into : bronze.crm_cust_info';
		bulk insert bronze.crm_cust_info
		from 'C:\Users\srinivas\OneDrive\Desktop\data warehouse\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\cust_info.csv'
		with(
			firstrow = 2,
			fieldterminator = ',',
			tablock
		);
		set @end_time = getdate();
		print'>> load Duration: '+ cast(datediff(second,@start_time,@end_time) as nvarchar) +' seconds';
		print '---------------------'


		set @start_time = getdate();
		--2 bronze.crm_prd_info
		print '>> Truncating Table : bronze.crm_prd_info ';
		truncate table bronze.crm_prd_info;

		print '>> Inserting Data into: bronze.crm_prd_info ';
		bulk insert bronze.crm_prd_info
		from 'C:\Users\srinivas\OneDrive\Desktop\data warehouse\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\prd_info.csv'
		with(
		 firstrow = 2,
		 fieldterminator = ',',
		 tablock
		);
		set @end_time= getdate();
		print '>> load Duration : '+ cast(datediff(second,@start_time,@end_time) as nvarchar) + ' seconds';
		print '---------------------'


		set @start_time = getdate();
		--3 bronze.crm_sales_details
		print '>> Truncating Table : bronze.crm_sales_details';
		truncate table bronze.crm_sales_details;

		print '>> Inserting Data Into : bronze.crm_sales_details';
		bulk insert bronze.crm_sales_details
		from 'C:\Users\srinivas\OneDrive\Desktop\data warehouse\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\sales_details.csv'
		with(
			firstrow = 2,
			fieldterminator = ',',
			tablock
		);
		set @end_time = getdate();
		print'>> load Duration: '+ cast(datediff(second,@start_time,@end_time) as nvarchar) +' seconds';
		print '---------------------'

		print '---------------------------------------------------';
		print 'Loading ERP Tables';
		print '---------------------------------------------------';

		set @start_time = getdate();
		--4 bronze.erp_cust_az12
		print '>>Truncating Table: bronze.erp_cust_az12';
		truncate table bronze.erp_cust_az12;

		print '>> Inserting Dataa Into : bronze.erp_cust_az12';
		bulk insert bronze.erp_cust_az12
		from 'C:\Users\srinivas\OneDrive\Desktop\data warehouse\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\cust_az12.csv'
		with(
			firstrow = 2,
			fieldterminator = ',',
			tablock
		);
		set @end_time = getdate();
		print '>> load Duration : ' + cast(datediff(second,@start_time,@end_time)as nvarchar) + ' seconds';
		print '---------------------'


		set @start_time = getdate();
		--5 bronze.erp_loc_a101
		print '>> Truncating Table : bronze.erp_loc_a101';
		truncate table bronze.erp_loc_a101;

		print '>> Inserting Data into:bronze.erp_loc_a101';
		bulk insert bronze.erp_loc_a101
		from 'C:\Users\srinivas\OneDrive\Desktop\data warehouse\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\loc_a101.csv'
		with (
			firstrow = 2,
			fieldterminator = ',',
			tablock
		);
		set @end_time = getdate();
		print '>> load Duration : ' + cast(datediff(second,@start_time,@end_time)as nvarchar) + ' seconds';
		print '---------------------'


		set @start_time = getdate();
		--6 bronze.erp_px_cat_g1v2
		print '>> Truncating Table : bronze.erp_px_cat_g1v2';
		truncate table bronze.erp_px_cat_g1v2;

		print '>> Inserting Data into:bronze.erp_px_cat_g1v2';
		bulk insert bronze.erp_px_cat_g1v2
		from 'C:\Users\srinivas\OneDrive\Desktop\data warehouse\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\px_cat_g1v2.csv'
		with(
			 firstrow = 2,
			 fieldterminator = ',',
			 tablock
		);
		set @end_time = getdate();
		print '>> load Duration : ' + cast(datediff(second,@start_time,@end_time)as nvarchar) + ' seconds';
		print '---------------------';

		set @batch_end_time = getdate();
		print'-------------------------------------------------------------------------';
		print'>> Total Duration : ' + cast(datediff(second,@batch_start_time,@batch_end_time) as nvarchar) + ' seconds';
		print'-------------------------------------------------------------------------';
	end try
	begin catch
		print '=======================================================';
		print 'Error occured during loading bronze layer';   
		print '=======================================================';
		print 'Error Message'+error_message();
		print 'Error Message'+ cast(error_number() as nvarchar);
		print 'ERROR Message' + cast(error_state() as nvarchar);
	end catch
end
