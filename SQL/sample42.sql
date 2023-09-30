-- In this query I compare a turnover between two periods(quarters)

USE main_db;
GO

DECLARE @datefrom SMALLDATETIME, @dateto SMALLDATETIME, @dfromprev SMALLDATETIME; 

SET @dateto = DATEADD(HOUR, -6, CAST(CAST(GETDATE() AS DATE) AS SMALLDATETIME));
SET @datefrom = DATEADD(MONTH, -3, @dateto);
SET @dfromprev = DATEADD(MONTH, -3, @datefrom);

WITH main AS (
SELECT DISTINCT
	--TOP (100)
	ts.identifier [Magazine],
	ts.mrhId [Merchant_ID],
	tsv.displayData [Merchant_Site],

	(
		SELECT CAST(tr.modified AS SMALLDATETIME) 
		FROM dbo._table_Request tr 
		LEFT JOIN dbo._table_Shop tsh ON tsh.mrhId = tr.mrhId
		WHERE
		tr.typeLabel = 'activation'
		AND tsh.Role = 'MerchantJur'
		AND tr.stateId = 3 
		AND tsh.Id = ts.id
	)  [Activation_Date]

 FROM
	dbo._table_Shop ts 
	JOIN dbo._table_Request tr ON tr.mrhId = ts.mrhId
	JOIN dbo._table_ShopValue tsv ON tsv.shopId = ts.id AND tsv.itemId = 11001
 WHERE
	ts.stateLabel = 'Active'
),

lastQuaterTurnover AS (
SELECT
	m.Merchant_ID,
	CAST(SUM(ta.IncAmount) AS DECIMAL(20,2)) [Last_quarter_turnover]
 FROM
	main m
	JOIN dbo._table_op tp ON m.merchant_ID = tp.mrh_id
	JOIN dbo._table_ops o ON tp.op_id = o.id
	JOIN dbo._table_head th ON o.id = th.OpId
	JOIN dbo._table_state ts ON th.OpId = ts.op_id AND ts.state = 'done'
	JOIN dbo._table_Amounts ta ON ts.op_id = ta.OpId
 WHERE
	th.LastStateDate BETWEEN @datefrom AND @dateto
 GROUP BY
	m.Merchant_ID
),

previousQuarterTurnover AS (
SELECT 
	m.Merchant_ID,
	CAST(SUM(ta.IncAmount) AS DECIMAL(20,2)) [Previous_quarter_turnover]
 FROM
	main m
	JOIN dbo._table_op tp ON m.merchant_ID = tp.mrh_id
	JOIN dbo._table_ops o ON tp.op_id = o.id
	JOIN dbo._table_head th ON o.id = th.OpId
	JOIN dbo._table_state ts ON th.OpId = ts.op_id AND ts.state = 'done'
	JOIN dbo._table_Amounts ta ON ts.op_id = ta.OpId
 WHERE
	th.LastStateDate BETWEEN @dfromprev AND @datefrom
 GROUP BY
	m.Merchant_ID
)

SELECT
	main.[Magazine],
    main.[Activation_Date],
	main.[Merchant_Site],
	lqt.[Last_quarter_turnover],
	pqt.[Previous_quarter_turnover]
 FROM
	main
	JOIN lastQuaterTurnover lqt ON lqt.Merchant_ID = main.Merchant_ID
	JOIN previousQuarterTurnover pqt ON pqt.Merchant_ID = main.Merchant_ID
 WHERE
	pqt.[Previous_quarter_turnover] > lqt.[Last_quarter_turnover];