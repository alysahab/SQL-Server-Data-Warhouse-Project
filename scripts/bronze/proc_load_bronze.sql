
CREATE OR ALTER PROCEDURE bronze.load_bronze AS
BEGIN
	
	DECLARE @start_time DATETIME, @end_time DATETIME, @start_batch_time DATETIME, @end_batch_time DATETIME;

	Begin Try
	SET @start_batch_time = GETDATE();

		Print('================================================');
		Print('Loading Bronze Layer...');
		Print('================================================');

	
		Print('------------------------------------------------');
		Print('Loading CRM Table');
		Print('------------------------------------------------');

		SET @start_time = GETDATE();
		Print('>> Truncating bronze.crm_cust_info Table');
		Truncate Table bronze.crm_cust_info;
		Print('>> Inserting bronze.crm_cust_info Table');
		BULK INSERT bronze.crm_cust_info
		FROM 'C:\Users\aly98\Desktop\Data Engineer\My DWH Project\datasets\source_crm\cust_info.csv'
		WITH
		(
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT('		-Duration is: ' + CAST(DateDiff(Second, @start_time, @end_time) as NVARCHAR) + ' Seconds');
		Print('-------------------');

		SET @start_time = GETDATE();
		Print('>> Truncating bronze.crm_prd_info Table');
		Truncate Table bronze.crm_prd_info;
		Print('>> Inserting bronze.crm_prd_info Table');
		BULK INSERT bronze.crm_prd_info
		FROM 'C:\Users\aly98\Desktop\Data Engineer\My DWH Project\datasets\source_crm\prd_info.csv'
		WITH
		(
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GetDATE();
		PRINT('		-Duration is: ' + CAST(DateDiff(Second, @start_time, @end_time) as NVARCHAR) + ' Seconds');
		Print('-------------------');

		SET @start_time = GETDATE();
		Print('>> Truncating bronze.crm_sales_details Table');
		Truncate Table bronze.crm_sales_details;
		Print('>> Inserting bronze.crm_sales_details Table');
		BULK INSERT bronze.crm_sales_details
		FROM 'C:\Users\aly98\Desktop\Data Engineer\My DWH Project\datasets\source_crm\sales_details.csv'
		WITH
		(
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GetDATE();
		PRINT('		-Duration is: ' + CAST(DateDiff(Second, @start_time, @end_time) as NVARCHAR) + ' Seconds');
		Print('-------------------');


		Print('------------------------------------------------');
		Print('Loading ERP Table');
		Print('------------------------------------------------');

		SET @start_time = GETDATE()
		Print('>> Truncating bronze.erp_cust_az12 Table');
		Truncate Table bronze.erp_cust_az12;
		Print('>> Inserting bronze.erp_cust_az12 Table');
		BULK INSERT bronze.erp_cust_az12
		FROM 'C:\Users\aly98\Desktop\Data Engineer\My DWH Project\datasets\source_erp\cust_az12.csv'
		WITH
		(
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GetDATE();
		PRINT('		-Duration is: ' + CAST(DateDiff(Second, @start_time, @end_time) as NVARCHAR) + ' Seconds');
		Print('-------------------');

		SET @start_time = GETDATE()
		Print('>> Truncating bronze.erp_loc_a101 Table');
		Truncate Table bronze.erp_loc_a101;
		Print('>> Inserting bronze.erp_loc_a101 Table');
		BULK INSERT bronze.erp_loc_a101
		FROM 'C:\Users\aly98\Desktop\Data Engineer\My DWH Project\datasets\source_erp\loc_a101.csv'
		WITH
		(
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GetDATE();
		PRINT('		-Duration is: ' + CAST(DateDiff(Second, @start_time, @end_time) as NVARCHAR) + ' Seconds');
		Print('-------------------');

		SET @start_time = GETDATE()
		Print('>> Truncating bronze.erp_px_cat_g1v2 Table');
		Truncate Table bronze.erp_px_cat_g1v2;
		Print('>> Inserting bronze.erp_px_cat_g1v2 Table');
		BULK INSERT bronze.erp_px_cat_g1v2
		FROM 'C:\Users\aly98\Desktop\Data Engineer\My DWH Project\datasets\source_erp\px_cat_g1v2.csv'
		WITH
		(
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GetDATE();
		PRINT('		-Duration is: ' + CAST(DateDiff(Second, @start_time, @end_time) as NVARCHAR) + ' Seconds');
		Print('-------------------');

	SET @end_batch_time = GETDATE();
	PRINT('====================================');
	PRINT('BRONZE LAYER LOADED SUCCESSFULLY');
	PRINT('		- Total Load Duration is: ' + CAST(DateDiff(Second, @start_batch_time, @end_batch_time) as NVARCHAR) + ' Seconds');
	PRINT('====================================');

	END Try
	Begin Catch
		Print('======================================');
		Print('Error occured loading Bronze Layer');
		Print('Error Message' + Error_Message());
		Print('Error Number' + Cast(Error_Number() AS NVARCHAR));
		Print('Error State' + Cast(Error_State() as NVARCHAR));
		Print('======================================');
	END CATCH
END