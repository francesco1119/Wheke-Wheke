# WHEKE-WHEKE
Is a T-SQL script tool which tentacles will allows you to discover unused SQL Server database across your SQL Server data warehouse estate
<p align="center">
  <img width="460" src="https://github.com/francesco1119/wheke-wheke/blob/main/images/image-1600003201sxM.jpg">
</p>

Wheke-Wheke takes its name from the Māori song Kina-Kina which lyrics are: 

<table border="0">
 <tr>
    <td><b style="font-size:30px">Māori</b></td>
    <td><b style="font-size:30px">English</b></td>
 </tr>
 <tr>
    <td>Kina - Kina </br>
Wheke - Wheke </br>
Ika - Ika </br>
Tuna - tuna </br>
Pipi - Pipi </br>
Paua - paua </br>
Kaimoana e hi! </br></td>
    <td>Sea egg - sea egg </br>
Octopus - octopus </br>
Scaly fish - scaly fish </br>
Slimy eel - slimy eel </br>
Sandy white shellfish </br>
Abalone - abalone </br>
They're all food from the sea!</td>
 </tr>
</table>

Why Wheke-Wheke
======

I wrote a tool called [SQL_Spring_Cleaning](https://github.com/francesco1119/SQL_Spring_Cleaning)  that allows you to identify unused database on your SQL Server. 

But what to do if you need to discover unused SQL Server databases in a data warehouse scenario? 

The idea of deploying a script on each server of the data warehouse will make freak out every product manager.

Here is when **Wheke-Wheke** comes handy: this tools allows you to monitor remotely the whole data wharehouse with zero code deployed on the remote servers; all data will be centralized on your jump-server with minimal impact on your Test/Dev/Staging/Prod machines. 

How it works under the hood
======

Here is where the magic happens: 

```
DECLARE @ServerName varchar(50), @DynamicSQL NVARCHAR(MAX)
DECLARE @myTableVariable TABLE (id INT, ServerName varchar(50))
insert into @myTableVariable values(1,'TESLABSQL01T'),(2,'TESLABSQL02T') -- Add your SQL Server list here
select * from @myTableVariable

Declare VarCursor cursor for
Select ServerName from @myTableVariable
Open VarCursor
FETCH NEXT FROM VarCursor INTO @ServerName
WHILE @@FETCH_STATUS = 0 
BEGIN
    SET @DynamicSQL='
	INSERT INTO [msdb].[dbo].[ConnectionCounts_Remote]
	SELECT '''+@ServerName+''' AS [ServerName]
                 ,NAME AS DatabaseName 
                 ,COUNT(STATUS) AS [NumberOfConnections]
                 ,GETDATE() AS [TimeStamp]
                 ,hostname
                 ,program_name
                 ,loginame
    FROM OPENDATASOURCE(''MSOLEDBSQL'', ''Server='+@ServerName+';TrustServerCertificate=Yes;Trusted_Connection=Yes;'').master.sys.databases sd
    LEFT JOIN .master.sys.sysprocesses sp ON sd.database_id = sp.dbid
    WHERE database_id NOT BETWEEN 1 AND 4
    GROUP BY NAME,hostname ,program_name ,loginame'
    

    EXEC (@DynamicSQL)

    FETCH NEXT FROM VarCursor INTO @ServerName
END
CLOSE VarCursor
DEALLOCATE VarCursor
```
The Agent Job uses [OPENDATASOURCE](https://docs.microsoft.com/en-us/sql/t-sql/functions/opendatasource-transact-sql?view=sql-server-ver15) to fetch and connect to each server. 

`OPENDATASOURCE` provides ad hoc connection without using a linked server.

You can reuse this approach in multiple ways. In the example above I'm querying `.master.sys.databases` and `.master.sys.sysprocesses` in all the server that I have listed in the line `@myTableVariable`. 

Can you see how handy it can be? 

You can now query the whole data wharehouse as it was a big database! 




How to Install
======

1) Download the query **Create WHEKE-WHEKE.sql** and edit the first 4 rows:
   ```
   DECLARE @YourEmail NVARCHAR(50) SET @YourEmail = 'Your_Email' --Put here your E-mail
   DECLARE @YourPassword NVARCHAR(50) SET @YourPassword = 'Your_Password' --Put here your E-mail
   DECLARE @YourSMTPSserver NVARCHAR(50) SET @YourSMTPSserver = 'Your_SMTP_Server' --Put here your SMTP Server
   DECLARE @YourPort int SET @YourPort = 'Your_Port_Number' --Put here your SMTP port
   ```
   Keep in mind that if you are using Outlook, Gmail or any other 2FA e-mail SQL Server will not be able to send e-mails for you.

2) Now edit the line and add a list of your SQL Servers:
   ```
   insert into @myTableVariable values(1,''Server_A''),(2,''Server_B'') -- Add your SQL Server list here
   ```
   
3) Now edit the line and enter your recipient e-mail address:
   ```
   @recipients = 'YourEmail', -- replace with your email address
   ```
   
Done! You can now press F5.

The e-mail you will receive will look like this:

#### Example:

![alt text](https://github.com/francesco1119/wheke-wheke/blob/main/images/newsletter_wheke-wheke.png)

How to Clean in case you made bubu
======

Download the query **Delete WHEKE-WHEKE.sql** and run it. 

This query delete your E-mail Account and Profile and both agent jobs
    
