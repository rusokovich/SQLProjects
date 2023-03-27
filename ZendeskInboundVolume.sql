SELECT  
CAST(tt.created_at as date) as ticket_date
,EXTRACT(YEAR from CAST(tt.created_at as date)) ticket_year_number
,EXTRACT(MONTH FROM CAST(tt.created_at as date)) ticket_month_number
,FORMAT_DATETIME("%B", CAST(tt.created_at as date)) as ticket_month_name
,EXTRACT(WEEK(SUNDAY) FROM CAST(tt.created_at as date)) ticket_week_number
,EXTRACT(DAYOFWEEK from CAST(tt.created_at as date)) AS ticket_day_of_week_number 
,FORMAT_DATETIME("%A", CAST(tt.created_at as date)) as ticket_day_name

,COUNT(distinct tt.id) amount_tickets
from zendeskTicketTable tt
Inner join ZendeskTicketTags ta on tt.id=ta.ticket_id
  WHERE (ta.tag like 'talkdesk_inbound_call' AND tt.via_channel IN ('api'))

-- where cast(tt.created_at as datetime) between '2022-01-01' and '2022-09-30'
GROUP BY 1,2,3,4,5,6,7
ORDER BY 1,5,6
