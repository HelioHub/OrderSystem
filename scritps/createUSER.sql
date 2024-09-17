USE [master]
GO

/* For security reasons the login is created disabled and with a random password. */
/****** Object:  Login [helio]    Script Date: 17/09/2024 02:19:42 ******/
CREATE LOGIN [helio] WITH PASSWORD=N'6knHWEV4biCMBQkEIrP8B4LL3ohYNtPs+tMk2BHaz7Q=', DEFAULT_DATABASE=[ordersystem], DEFAULT_LANGUAGE=[Português (Brasil)], CHECK_EXPIRATION=ON, CHECK_POLICY=ON
GO

ALTER LOGIN [helio] DISABLE
GO

ALTER SERVER ROLE [sysadmin] ADD MEMBER [helio]
GO

ALTER SERVER ROLE [securityadmin] ADD MEMBER [helio]
GO

ALTER SERVER ROLE [serveradmin] ADD MEMBER [helio]
GO

ALTER SERVER ROLE [setupadmin] ADD MEMBER [helio]
GO

ALTER SERVER ROLE [processadmin] ADD MEMBER [helio]
GO

ALTER SERVER ROLE [diskadmin] ADD MEMBER [helio]
GO

ALTER SERVER ROLE [dbcreator] ADD MEMBER [helio]
GO

ALTER SERVER ROLE [bulkadmin] ADD MEMBER [helio]
GO


