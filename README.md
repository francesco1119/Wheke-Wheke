# WHEKE-WHEKE
Is a T-SQL script tool which tentacles will allows you to centralize and monitor you SQL Server estate from your jump server
<p align="center">
  <img width="460" src="https://github.com/francesco1119/wheke-wheke/blob/main/images/image-1600003201sxM.jpg">
</p>

Wheke-Wheke takes his name from the Maori son Kina-Kina which lyrics are: 


<table border="0">
 <tr>
    <td><b style="font-size:30px">Maori</b></td>
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
    <td>Lorem ipsum ...</td>
 </tr>
</table>

How to Install
======

1) Download the query **Create SQL_Spring_Cleaning.sql** and edit the first 4 rows:
   ```
   DECLARE @YourEmail NVARCHAR(50) SET @YourEmail = 'Your_Email' --Put here your E-mail
   DECLARE @YourPassword NVARCHAR(50) SET @YourPassword = 'Your_Password' --Put here your E-mail
   DECLARE @YourSMTPSserver NVARCHAR(50) SET @YourSMTPSserver = 'Your_SMTP_Server' --Put here your SMTP Server
   DECLARE @YourPort int SET @YourPort = 'Your_Port_Number' --Put here your SMTP port
   ```
   Keep in mind that if you are using Outlook, Gmail or any other 2FA e-mail SQL Server will not be able to send e-mails for you.

2) Now edit the line:
   ```
   @recipients = 'YourEmail', -- replace with your email address
   ```
   entering your recipient e-mail address

Done! You can now press F5.

The e-mail you will receive will look like this:

#### Example:

![alt text](https://github.com/francesco1119/SQL_Spring_Cleaning/blob/master/images/newsletter_SQL_Spring_Cleaning.png)

How to Clean in case you made bubu
======

Download the query **Delete SQL_Spring_Claeaning.sql** and run it. 

This query delete your E-mail Account and Profile and both agent jobs
    
