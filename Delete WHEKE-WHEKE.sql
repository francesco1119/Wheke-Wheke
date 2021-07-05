EXECUTE msdb.dbo.sysmail_delete_profile_sp @profile_name = 'wheke-wheke_Profile';

EXECUTE msdb.dbo.sysmail_delete_account_sp @account_name = 'wheke-wheke_Account';

EXEC sp_delete_job @job_name = N'wheke-wheke_Remote';

EXEC sp_delete_job @job_name = N'GatherDbConnections_Remote';

USE [msdb];
GO

DROP TABLE [dbo].[ConnectionCounts_Remote]