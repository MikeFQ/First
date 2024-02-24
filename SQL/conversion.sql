-- counting the conversion in the last 30 days

USE TranDB;
GO

DECLARE @dateto DATETIME = GETDATE();
DECLARE @datefrom DATETIME = DATEADD(DAY, -30, @dateto);

WITH main AS (
SELECT DISTINCT
	cc.country_name [Country],
	COUNT (tmh.merchantId) [Amount of magazines],
	
	(
		SELECT COUNT(tbo.opId)
		FROM dbo._table_ops tbo
		WHERE tmh.merchantId = tbo.mrhId
		AND tbo1.op_Date BETWEEN @datefrom AND @dateto
	) [Amount of all operations],  --including success, rejected, canceled etc.
	
	(
		SELECT COUNT(tbo1.opId)
		FROM dbo._table_ops tbo1 
		WHERE tmh.merchantId = tbo1.mrhId 
		AND tbo1.op_State = 'done' --successful operations
		AND tbo1.op_Date BETWEEN @datefrom AND @dateto
	) [Amount of successful operations]
	
 FROM
	dbo._table_mrh tmh 
	JOIN dbo._country_codes cc ON tmh.merchant_Country = cc.alpha3
 WHERE
	tmh.mrh_State = 'Active'
	AND tmh.merchant_Country IN ('USA', 'CHN', 'IND', 'DEU', 'CAN', 'GBR', 'JPN') 
 GROUP BY
	cc.country_name
)

SELECT
	m.[Country],
	m.[Amount of successful operations],
	m.[Amount of all operations],
	m.[Amount of successful operations] * 100 / m.[Amount of all operations] [Conversion in the last 30 days]
 FROM
	main m


