/* 
This query was developed for extracting daily historical information about the Transactions that happened historically in the app. 
This information allowed to me to check for the trends in order to come up with forecasting for the inbound volume in different phone, chat and sms 
Business lines. This was a pioneering in the organization, since it was the first time there was some forecasting done outside a SaaS application. 
The results were outstanding since the MAPE was better with this method than using the SaaS service. 
*/

SELECT 
CAST(when_created as date) AS transaction_date
-- when_created::date AS transaction_date
,extract(year from when_created) AS trasaction_year
,extract(month from when_created) AS trasaction_month_number
,to_char(when_created,'Month') AS transaction_month_name
,extract(week from when_created) AS transaction_week_number
,extract(dow from when_created) AS trasaction_day_of_week_number
,to_char(when_created,'Day') AS transaction_day_of_week_name

,COUNT(tx_id) AS transfers
FROM SchemaDB.DBObject.trxnsTable
GROUP BY 1,2,3,4,5,6,7 
ORDER BY 1,5,6;
