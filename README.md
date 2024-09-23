# Customer Order Management System Project - Minerva Foods 

Develop Customer Order Management System for candidate evaluation -  Hélio Marques

## GIT to windows
	```
	https://www.youtube.com/watch?v=Am46OOLgV4sx
	https://gitforwindows.org
	```
	CMD:
	git config --global user.name "HelioHub"
	git config --global user.email "helio111171souza@gmail.com"
	git config --list	
	
	echo "# OrderSystem" >> README.md
	git init
	git add README.md
	git commit -m "first commit"
	git branch -M main
	git remote add origin git@github.com:HelioHub/OrderSystem.git
	git push -u origin main	

## Project Evolution

![## Diagrama de Entidade e Relacionamento Lógico OrderSystem](https://github.com/HelioHub/OrderSystem/blob/main/images/ProjectEvolution.png)
	
## DER Order System

### Logical Data Model
	````
	BRMW - Web
	https://app.brmodeloweb.com/#!/logic/%7B%22modelid%22:%2266e8c8a549573442c5b92fbc%22,%22conversionId%22:%22%22%7D
	````
	user:heliomsi@gmail.com 
	pw: @1x@9x@7x3x8x2@x@
	
![## Diagrama de Entidade e Relacionamento Lógico OrderSystem](https://github.com/HelioHub/OrderSystem/blob/main/images/modelOrderSystem.png)

### Physical Data Model
	````
	ERWIN - Desktop
	````
	
![## Diagrama de Entidade e Relacionamento Lógico OrderSystem](https://github.com/HelioHub/OrderSystem/blob/main/images/modelPhysicalOrderSystem.png)

## Code SQL Order System

### Database (DB)
	```SQL SERVER 2019
	HELIOLENOVO\SQLEXPRESS
	user sa/@1x@9x@7x3x8x2x@
	user helio/@1@9x@7@x@3@x8x2x
	```
	
### createDB.sql

	USE [master]
	GO

	/****** Object:  Database [ordersystem]    Script Date: 17/09/2024 02:06:37 ******/
	CREATE DATABASE [ordersystem]
	 CONTAINMENT = NONE
	 ON  PRIMARY 
	( NAME = N'ordersystem', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\ordersystem.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
	 LOG ON 
	( NAME = N'ordersystem_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\ordersystem_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
	 WITH CATALOG_COLLATION = DATABASE_DEFAULT
	GO

	IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
	begin
	EXEC [ordersystem].[dbo].[sp_fulltext_database] @action = 'enable'
	end
	GO
	ALTER DATABASE [ordersystem] SET ANSI_NULL_DEFAULT OFF 
	GO
	ALTER DATABASE [ordersystem] SET ANSI_NULLS OFF 
	GO
	ALTER DATABASE [ordersystem] SET ANSI_PADDING OFF 
	GO
	ALTER DATABASE [ordersystem] SET ANSI_WARNINGS OFF 
	GO
	ALTER DATABASE [ordersystem] SET ARITHABORT OFF 
	GO
	ALTER DATABASE [ordersystem] SET AUTO_CLOSE OFF 
	GO
	ALTER DATABASE [ordersystem] SET AUTO_SHRINK OFF 
	GO
	ALTER DATABASE [ordersystem] SET AUTO_UPDATE_STATISTICS ON 
	GO
	ALTER DATABASE [ordersystem] SET CURSOR_CLOSE_ON_COMMIT OFF 
	GO
	ALTER DATABASE [ordersystem] SET CURSOR_DEFAULT  GLOBAL 
	GO
	ALTER DATABASE [ordersystem] SET CONCAT_NULL_YIELDS_NULL OFF 
	GO
	ALTER DATABASE [ordersystem] SET NUMERIC_ROUNDABORT OFF 
	GO
	ALTER DATABASE [ordersystem] SET QUOTED_IDENTIFIER OFF 
	GO
	ALTER DATABASE [ordersystem] SET RECURSIVE_TRIGGERS OFF 
	GO
	ALTER DATABASE [ordersystem] SET  DISABLE_BROKER 
	GO
	ALTER DATABASE [ordersystem] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
	GO
	ALTER DATABASE [ordersystem] SET DATE_CORRELATION_OPTIMIZATION OFF 
	GO
	ALTER DATABASE [ordersystem] SET TRUSTWORTHY OFF 
	GO
	ALTER DATABASE [ordersystem] SET ALLOW_SNAPSHOT_ISOLATION OFF 
	GO
	ALTER DATABASE [ordersystem] SET PARAMETERIZATION SIMPLE 
	GO
	ALTER DATABASE [ordersystem] SET READ_COMMITTED_SNAPSHOT OFF 
	GO
	ALTER DATABASE [ordersystem] SET HONOR_BROKER_PRIORITY OFF 
	GO
	ALTER DATABASE [ordersystem] SET RECOVERY SIMPLE 
	GO
	ALTER DATABASE [ordersystem] SET  MULTI_USER 
	GO
	ALTER DATABASE [ordersystem] SET PAGE_VERIFY CHECKSUM  
	GO
	ALTER DATABASE [ordersystem] SET DB_CHAINING OFF 
	GO
	ALTER DATABASE [ordersystem] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
	GO
	ALTER DATABASE [ordersystem] SET TARGET_RECOVERY_TIME = 60 SECONDS 
	GO
	ALTER DATABASE [ordersystem] SET DELAYED_DURABILITY = DISABLED 
	GO
	ALTER DATABASE [ordersystem] SET ACCELERATED_DATABASE_RECOVERY = OFF  
	GO
	ALTER DATABASE [ordersystem] SET QUERY_STORE = OFF
	GO
	ALTER DATABASE [ordersystem] SET  READ_WRITE 
	GO

### createUSER.sql

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

### schemeDB.sql

	/****** SCHEME DB ORDER SYSTEM  Script Date: 17/09/2024 13:12:42 ******/
	/****** Hélio Marques ******/

	use [ordersystem]
	go

	/* DROPS */
	IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tab_order_item]') AND type in (N'U'))
	DROP TABLE [dbo].[tab_order_item]
	go
	IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tab_item]') AND type in (N'U'))
	DROP TABLE [dbo].[tab_item] 
	go
	IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tab_orders]') AND type in (N'U'))
	DROP TABLE [dbo].[tab_orders]
	go
	IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tab_clients]') AND type in (N'U'))
	DROP TABLE [dbo].[tab_clients]
	go

	/* CREATES */
	CREATE TABLE tab_clients
	(
		code_client  int  NOT NULL IDENTITY PRIMARY KEY,
		name_client  varchar(100)  NOT NULL ,
		address_client  varchar(250)  NULL ,
		phone_client  varchar(20)  NULL ,
		email_client  varchar(50)  NULL 
	)
	go
	CREATE INDEX XAKtab_clients_name ON tab_clients (name_client  ASC)
	go
	GRANT SELECT, UPDATE, DELETE, INSERT ON tab_clients TO helio;
	go

	CREATE TABLE tab_item
	(
		code_item  int  NOT NULL IDENTITY PRIMARY KEY,
		name_item  varchar(100)  NOT NULL ,
		description_item  varchar(250)  NULL ,
		price_item  decimal(20,4)  NULL 
	)
	go
	CREATE INDEX XAKtab_item_name ON tab_item (name_item  ASC)
	go
	GRANT SELECT, UPDATE, DELETE, INSERT ON tab_item TO helio;
	go


	CREATE TABLE tab_orders
	(
		code_order  int  IDENTITY PRIMARY KEY,
		code_client  int  NOT NULL, 
		date_order  datetime  NOT NULL ,
		value_order  decimal(20,4)  NULL 
	)
	go
	CREATE INDEX XIFKtab_orders_code_client ON tab_orders (code_client  ASC) 
	go
	GRANT SELECT, UPDATE, DELETE, INSERT ON tab_orders TO helio;
	go


	CREATE TABLE tab_order_item
	(
		code_order_item  int  IDENTITY PRIMARY KEY,
		code_order  int  NOT NULL ,
		code_item  int  NOT NULL ,
		amount_order_item  decimal(20,4)  NULL ,
		unitprice_order_item  decimal(20,4)  NULL 
	)
	go
	CREATE INDEX XIFKtab_order_item_code_order ON tab_order_item (code_order ASC)
	go
	CREATE INDEX XIFKtab_order_item_code_item ON tab_order_item (code_item ASC)
	go
	CREATE INDEX XIFKtab_order_item_code_order_item ON tab_order_item (code_order, code_item ASC)
	go
	GRANT SELECT, UPDATE, DELETE, INSERT ON tab_orders TO helio;
	go

	/* REFERENCES */
	ALTER TABLE tab_orders
	ADD  FOREIGN KEY (code_client) REFERENCES tab_clients(code_client)
			ON DELETE NO ACTION
			ON UPDATE NO ACTION
	go

	ALTER TABLE tab_order_item
	ADD  FOREIGN KEY (code_order) REFERENCES tab_orders(code_order)
			ON DELETE NO ACTION
			ON UPDATE NO ACTION
	go

	ALTER TABLE tab_order_item
	ADD  FOREIGN KEY (code_item) REFERENCES tab_item(code_item)
			ON DELETE NO ACTION
			ON UPDATE NO ACTION
	go

### insertClients_Items_Orders.sql

	USE [ordersystem]
	GO

	DELETE FROM [dbo].[tab_order_item] 
	GO

	DELETE FROM [dbo].[tab_orders] 
	GO

	DELETE FROM [dbo].[tab_clients] 
	GO
	/*CLIENTS*/
	INSERT INTO [dbo].[tab_clients] ([name_client],[address_client],[phone_client],[email_client])  
	VALUES('HELIO MARQUES',	'RUA 10, 1, CENTRO, FORTALEZA, CEARA, BRASIL',	'558599991111',	'558599991111@www.com')
	GO
	INSERT INTO [dbo].[tab_clients] ([name_client],[address_client],[phone_client],[email_client])  
	VALUES('PAULO PEDRO',	'RUA 10, 2, CENTRO, FORTALEZA, CEARA, BRASIL',	'558599992222',	'558599992222@www.com')
	GO
	INSERT INTO [dbo].[tab_clients] ([name_client],[address_client],[phone_client],[email_client])  
	VALUES('ISABEL LEGAL',	'RUA 10, 3, CENTRO, FORTALEZA, CEARA, BRASIL',	'558599993333',	'558599993333@www.com')
	GO
	INSERT INTO [dbo].[tab_clients] ([name_client],[address_client],[phone_client],[email_client])  
	VALUES('LUCAS JUCÁ',	'RUA 10, 4, CENTRO, FORTALEZA, CEARA, BRASIL',	'558599994444',	'558599994444@www.com')
	GO
	INSERT INTO [dbo].[tab_clients] ([name_client],[address_client],[phone_client],[email_client])  
	VALUES('VILMA MARIA',	'RUA 10, 5, CENTRO, FORTALEZA, CEARA, BRASIL',	'558599991111',	'558599991111@www.com')
	GO


	DELETE FROM [dbo].[tab_item] 
	GO
	/*ITEM*/
	INSERT INTO [dbo].[tab_item] ([name_item],[description_item],[price_item]) 
	VALUES ('Produto A','Produto referente a necessidade do público A',	10.0000)
	go
	INSERT INTO [dbo].[tab_item] ([name_item],[description_item],[price_item]) 
	VALUES ('Produto B','Produto referente a necessidade do público B',	15.0000)
	go
	INSERT INTO [dbo].[tab_item] ([name_item],[description_item],[price_item]) 
	VALUES ('Produto C','Produto referente a necessidade do público C',	20.0000)
	go

	/*ORDERS*/
	SET DATEFORMAT ymd; 
	GO
	INSERT INTO [dbo].[tab_orders] ([date_order],[value_order],[code_client]) VALUES (CAST('2024-09-17' AS DATETIME), 0, 
		(SELECT TOP (1) [code_client] FROM [ordersystem].[dbo].[tab_clients] WHERE [name_client] = 'HELIO MARQUES'))
	GO
	INSERT INTO [dbo].[tab_orders] ([date_order],[value_order],[code_client]) VALUES ('2024-09-18', 0, 
		(SELECT TOP (1) [code_client] FROM [ordersystem].[dbo].[tab_clients] WHERE [name_client] = 'LUCAS JUCÁ'))
	GO
	INSERT INTO [dbo].[tab_orders] ([date_order],[value_order],[code_client]) VALUES ('2024-09-19', 0, 
		(SELECT TOP (1) [code_client] FROM [ordersystem].[dbo].[tab_clients] WHERE [name_client] = 'VILMA MARIA'))
	GO
	INSERT INTO [dbo].[tab_orders] ([date_order],[value_order],[code_client]) VALUES ('2024-09-19', 0, 
		(SELECT TOP (1) [code_client] FROM [ordersystem].[dbo].[tab_clients] WHERE [name_client] = 'ISABEL LEGAL'))
	GO


	/*ORDER_ITEM*/
	INSERT INTO [dbo].[tab_order_item] ([code_order],[code_item],[amount_order_item],[unitprice_order_item]) VALUES (
				(SELECT TOP (1) [code_order]  FROM [ordersystem].[dbo].[tab_orders] WHERE [code_client] = (SELECT TOP (1) [code_client] FROM [ordersystem].[dbo].[tab_clients] WHERE [name_client] = 'HELIO MARQUES')),
				(SELECT TOP (1) [code_item]   FROM [ordersystem].[dbo].[tab_item]   WHERE [name_item]   = 'PRODUTO A'),
				1,
				(SELECT TOP (1) [price_item]  FROM [ordersystem].[dbo].[tab_item]   WHERE [name_item]   = 'PRODUTO A'))
	GO
	INSERT INTO [dbo].[tab_order_item] ([code_order],[code_item],[amount_order_item],[unitprice_order_item]) VALUES (
				(SELECT TOP (1) [code_order]  FROM [ordersystem].[dbo].[tab_orders] WHERE [code_client] = (SELECT TOP (1) [code_client] FROM [ordersystem].[dbo].[tab_clients] WHERE [name_client] = 'HELIO MARQUES')),
				(SELECT TOP (1) [code_item]   FROM [ordersystem].[dbo].[tab_item]   WHERE [name_item]   = 'PRODUTO B'),
				1,
				(SELECT TOP (1) [price_item]  FROM [ordersystem].[dbo].[tab_item]   WHERE [name_item]   = 'PRODUTO B'))
	GO
	INSERT INTO [dbo].[tab_order_item] ([code_order],[code_item],[amount_order_item],[unitprice_order_item]) VALUES (
				(SELECT TOP (1) [code_order]  FROM [ordersystem].[dbo].[tab_orders] WHERE [code_client] = (SELECT TOP (1) [code_client] FROM [ordersystem].[dbo].[tab_clients] WHERE [name_client] = 'HELIO MARQUES')),
				(SELECT TOP (1) [code_item]   FROM [ordersystem].[dbo].[tab_item]   WHERE [name_item]   = 'PRODUTO C'),
				1,
				(SELECT TOP (1) [price_item]  FROM [ordersystem].[dbo].[tab_item]   WHERE [name_item]   = 'PRODUTO C'))
	GO


	INSERT INTO [dbo].[tab_order_item] ([code_order],[code_item],[amount_order_item],[unitprice_order_item]) VALUES (
				(SELECT TOP (1) [code_order]  FROM [ordersystem].[dbo].[tab_orders] WHERE [code_client] = (SELECT TOP (1) [code_client] FROM [ordersystem].[dbo].[tab_clients] WHERE [name_client] = 'LUCAS JUCÁ')),
				(SELECT TOP (1) [code_item]   FROM [ordersystem].[dbo].[tab_item]   WHERE [name_item]   = 'PRODUTO A'),
				2,
				(SELECT TOP (1) [price_item]  FROM [ordersystem].[dbo].[tab_item]   WHERE [name_item]   = 'PRODUTO A'))
	GO
	INSERT INTO [dbo].[tab_order_item] ([code_order],[code_item],[amount_order_item],[unitprice_order_item]) VALUES (
				(SELECT TOP (1) [code_order]  FROM [ordersystem].[dbo].[tab_orders] WHERE [code_client] = (SELECT TOP (1) [code_client] FROM [ordersystem].[dbo].[tab_clients] WHERE [name_client] = 'LUCAS JUCÁ')),
				(SELECT TOP (1) [code_item]   FROM [ordersystem].[dbo].[tab_item]   WHERE [name_item]   = 'PRODUTO C'),
				1,
				(SELECT TOP (1) [price_item]  FROM [ordersystem].[dbo].[tab_item]   WHERE [name_item]   = 'PRODUTO C'))
	GO

	INSERT INTO [dbo].[tab_order_item] ([code_order],[code_item],[amount_order_item],[unitprice_order_item]) VALUES (
				(SELECT TOP (1) [code_order]  FROM [ordersystem].[dbo].[tab_orders] WHERE [code_client] = (SELECT TOP (1) [code_client] FROM [ordersystem].[dbo].[tab_clients] WHERE [name_client] = 'ISABEL LEGAL')),
				(SELECT TOP (1) [code_item]   FROM [ordersystem].[dbo].[tab_item]   WHERE [name_item]   = 'PRODUTO B'),
				2,
				(SELECT TOP (1) [price_item]  FROM [ordersystem].[dbo].[tab_item]   WHERE [name_item]   = 'PRODUTO B'))
	GO
	INSERT INTO [dbo].[tab_order_item] ([code_order],[code_item],[amount_order_item],[unitprice_order_item]) VALUES (
				(SELECT TOP (1) [code_order]  FROM [ordersystem].[dbo].[tab_orders] WHERE [code_client] = (SELECT TOP (1) [code_client] FROM [ordersystem].[dbo].[tab_clients] WHERE [name_client] = 'ISABEL LEGAL')),
				(SELECT TOP (1) [code_item]   FROM [ordersystem].[dbo].[tab_item]   WHERE [name_item]   = 'PRODUTO C'),
				1,
				(SELECT TOP (1) [price_item]  FROM [ordersystem].[dbo].[tab_item]   WHERE [name_item]   = 'PRODUTO C'))
	GO


	INSERT INTO [dbo].[tab_order_item] ([code_order],[code_item],[amount_order_item],[unitprice_order_item]) VALUES (
				(SELECT TOP (1) [code_order]  FROM [ordersystem].[dbo].[tab_orders] WHERE [code_client] = (SELECT TOP (1) [code_client] FROM [ordersystem].[dbo].[tab_clients] WHERE [name_client] = 'VILMA MARIA')),
				(SELECT TOP (1) [code_item]   FROM [ordersystem].[dbo].[tab_item]   WHERE [name_item]   = 'PRODUTO A'),
				2,
				(SELECT TOP (1) [price_item]  FROM [ordersystem].[dbo].[tab_item]   WHERE [name_item]   = 'PRODUTO A'))
	GO


### selectsDB.sql

	USE [ordersystem]
	go

	SELECT TOP (1000) [code_client]
		,[name_client]
		,[address_client]
		,[phone_client]
		,[email_client]
	FROM [ordersystem].[dbo].[tab_clients]

	SELECT TOP (1000) [code_item]
		,[name_item]
		,[description_item]
		,[price_item]
	FROM [ordersystem].[dbo].[tab_item]

	SELECT TOP (1000) [code_order]
		  ,[date_order]
		  ,[value_order]
		  ,[code_client]
	FROM [ordersystem].[dbo].[tab_orders]

	SELECT TOP (1000) [code_order_item]
		  ,[code_order]
		  ,[code_item]
		  ,[amount_order_item]
		  ,[unitprice_order_item]
	FROM [ordersystem].[dbo].[tab_order_item] a
	INNER JOIN 

	USE [ordersystem]
	go

	SELECT TOP (1000) a.[code_order]
		  ,a.[date_order]
		  ,a.[code_client]
		  ,b.[name_client]
		  ,b.[address_client]
		  ,b.[phone_client]
		  ,b.[email_client]
		  ,a.[value_order]
		  ,dbo.fn_get_total_value_ordered(26) as valueorder 
	FROM [dbo].[tab_orders] a
	INNER JOIN [dbo].[tab_clients] b ON b.code_client = a.code_client 

	USE [ordersystem]
	go

	SELECT TOP (1000) a.[code_order]
		  ,a.[code_order_item]
		  ,a.[code_item]
		  ,a.[amount_order_item]
		  ,a.[unitprice_order_item]
		  ,a.[amount_order_item] * a.[unitprice_order_item] as value_item
		  ,b.[name_item]
		  ,b.[description_item]
	FROM [dbo].[tab_order_item] a
	INNER JOIN [dbo].[tab_item] b ON b.[code_item] = a.[code_item] 

### Function T-SQL

	USE [ordersystem]
	go

    -- Request Function 
	select dbo.fn_get_total_value_ordered(26)
	go
	
	/* ------------------------------------- */
	/* FUNCTION - fn_get_total_value_ordered */
	/* Calculate the total value of an Order */
	/* Hélio Marques - 2024-09-17            */
	/* ------------------------------------- */
	USE [ordersystem]
	GO

	CREATE OR 
	 ALTER FUNCTION [dbo].[fn_get_total_value_ordered] (@pCode_Order INT) RETURNS DECIMAL(20,4)
	AS
	BEGIN
	  DECLARE @vTotalValue DECIMAL(20,4) = 0
			 
	  SELECT @vTotalValue = ISNULL(SUM(b.amount_order_item * b.unitprice_order_item), 0)
	  FROM tab_orders a WITH (NOLOCK)
	  INNER JOIN tab_order_item b WITH(NOLOCK) ON b.code_order = a.code_order 
	  WHERE a.code_order = @pCode_Order

	  RETURN @vTotalValue;
	END
	GO

### function: fn_get_total_value_ordered.sql

	/* ------------------------------------- */
	/* FUNCTION - fn_get_total_value_ordered */
	/* Calculate the total value of an Order */
	/* Hélio Marques - 2024-09-17            */
	/* ------------------------------------- */
	USE [ordersystem]
	GO

	CREATE OR 
	 ALTER FUNCTION [dbo].[fn_get_total_value_ordered] (@pCode_Order INT) RETURNS DECIMAL(20,4)
	AS
	BEGIN
	  DECLARE @vTotalValue DECIMAL(20,4) = 0
			 
	  SELECT @vTotalValue = ISNULL(SUM(b.amount_order_item * b.unitprice_order_item), 0)
	  FROM tab_orders a WITH (NOLOCK)
	  INNER JOIN tab_order_item b WITH(NOLOCK) ON b.code_order = a.code_order 
	  WHERE a.code_order = @pCode_Order

	  RETURN @vTotalValue;
	END
	GO

### Server, Main and Order Screen 
	````
	Server and Main Screen
	````
	
![## Diagrama de Entidade e Relacionamento Lógico OrderSystem](https://github.com/HelioHub/OrderSystem/blob/main/images/aplicacaoDataSnapRest.png)

	````
	Order Screen
	````
	
![## Diagrama de Entidade e Relacionamento Lógico OrderSystem](https://github.com/HelioHub/OrderSystem/blob/main/images/aplicacaoDataSnapRest2.png)

### View Items Screen

	````
	View Items
	````
	
![## Diagrama de Entidade e Relacionamento Lógico OrderSystem](https://github.com/HelioHub/OrderSystem/blob/main/images/viewitemscreen.png)

### CRUD Items screen

	````
	CRUD Items
	````
	
![## Diagrama de Entidade e Relacionamento Lógico OrderSystem](https://github.com/HelioHub/OrderSystem/blob/main/images/CRUD_Item.png)


### Report Order

	````
	Setting Report
	````
	
![## Diagrama de Entidade e Relacionamento Lógico OrderSystem](https://github.com/HelioHub/OrderSystem/blob/main/images/ReportOrderConfig.png)

	````
	Report
	````
	
![## Diagrama de Entidade e Relacionamento Lógico OrderSystem](https://github.com/HelioHub/OrderSystem/blob/main/images/ReportOrder1.png)

### Test function T_SQL

	````
	Attempt to create T-SQL function test
	````
	
![## Diagrama de Entidade e Relacionamento Lógico OrderSystem](https://github.com/HelioHub/OrderSystem/blob/main/images/Test.png)

### Variabels Fast Report

	````
	passing parameters to FAST REPORT
	````
	
![## Diagrama de Entidade e Relacionamento Lógico OrderSystem](https://github.com/HelioHub/OrderSystem/blob/main/images/ReportOrder2.png)

### Filters Order

	````
	Filter Code Order and Date Order
	````
	
![## Diagrama de Entidade e Relacionamento Lógico OrderSystem](https://github.com/HelioHub/OrderSystem/blob/main/images/FilterOrder.png)














