DECLARE @JobID BINARY(16)

EXEC msdb.dbo.sp_add_job @job_id = @JobID OUTPUT ,
               @job_name = 'Run DBCC on Northwind',
               @enabled = 1, -- Active
               @owner_login_name = 'sa',
               @notify_level_eventlog = 2,
               @notify_level_email = 2,
               @notify_email_operator_name = 'SuperDBA'

SELECT @JobID

GO



EXEC msdb.dbo.sp_add_jobstep @job_name = 'Run DBCC on  
                                         Northwind',
                             @step_name = 'Run DBCC CheckDB on 
                                         Northwind',
                             @command = 'DBCC CheckDB 
                                        (''Northwind'')',
                             @subsystem = 'TSQL',
                             @output_file_name = 'C: \ 
                                                DBCCResult.txt'


GO



EXEC msdb.dbo.sp_add_jobschedule @job_name = 'Run DBCC on 
                                             Northwind',
                                 @name = 'Run DBCC Weekly',
                                 @freq_type = 8, -- Weekly
                                 @freq_interval = 2, -- Monday
                                 @active_start_time = 40000,
                                 @freq_recurrence_factor = 1
                                          -- Every week

GO