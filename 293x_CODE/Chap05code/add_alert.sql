EXEC msdb..sp_add_alert @name = 'Alert: Object not found',
                        @severity = 11

/*
EXEC msdb..sp_add_notification 'Alert: Object not found',
                               'SuperDBA', 1

*/
