SELECT MAX(backup_finish_date)
FROM msdb..backupset
WHERE type = 'D' AND database_name = 'Northwind'
