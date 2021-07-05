# WHEKE-WHEKE
Is a T-SQL script tool which tentacles will allows you to discover unused SQL Server database across your SQL Server estate
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

I wrote a tool called [SQL_Spring_Cleaning](https://github.com/francesco1119/SQL_Spring_Cleaning)  that allows you to identify unused database on your SQL Server. But what to do if you need to discover unused SQL Server databases in a data warehouse scenario? 
Th idea of deploying a script on each server of the data warehouse will make freak out every product manager.
Here is when **Wheke-Wheke** comes handy: this tools allows you to monitor remotely the whole data wharehouse with zero code deployed on the remote servers; all data will be centralized on your jump-server with minimal impact on your Test/Dev/Staging/Prod machines. 

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

![alt text](https://github.com/francesco1119/SQL_Spring_Cleaning/blob/master/images/newsletter_SQL_Spring_Cleaning.png)

How to Clean in case you made bubu
======

Download the query **Delete WHEKE-WHEKE.sql** and run it. 

This query delete your E-mail Account and Profile and both agent jobs
    
