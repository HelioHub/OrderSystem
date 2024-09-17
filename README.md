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
	
## DER Order System

### Data Model Creation (DER):
	````
	https://app.brmodeloweb.com/#!/logic/%7B%22modelid%22:%2266e8c8a549573442c5b92fbc%22,%22conversionId%22:%22%22%7D
	````
	user:heliomsi@gmail.com 
	pw: 1x9x7x3x8x2x
	
![## Diagrama de Entidade e Relacionamento Lógico OrderSystem](https://github.com/HelioHub/OrderSystem/blob/main/images/modelOrderSystem.png)
	
	````
	ERWIN
	````
![## Diagrama de Entidade e Relacionamento Lógico OrderSystem](https://github.com/HelioHub/OrderSystem/blob/main/images/modelPhysicalOrderSystem.png)

## Code SQL Order System

### Database (DB)
	```SQL SERVER 2019
	HELIOLENOVO\SQLEXPRESS
	user sa/1x9x7x3x8x2x
	user helio/1x9x7x3x8x2x
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

### insertClients_Items.sql

	USE [ordersystem]
	GO

	DELETE FROM [dbo].[tab_clients] 
	GO

	INSERT INTO [dbo].[tab_clients] ([name_client],[address_client],[phone_client],[email_client])  VALUES('HELIO MARQUES',	'RUA 10, 1, CENTRO, FORTALEZA, CEARA, BRASIL',	'558599991111',	'558599991111@www.com')
	GO
	INSERT INTO [dbo].[tab_clients] ([name_client],[address_client],[phone_client],[email_client])  VALUES('PAULO PEDRO',	'RUA 10, 2, CENTRO, FORTALEZA, CEARA, BRASIL',	'558599992222',	'558599992222@www.com')
	GO
	INSERT INTO [dbo].[tab_clients] ([name_client],[address_client],[phone_client],[email_client])  VALUES('ISABEL LEGAL',	'RUA 10, 3, CENTRO, FORTALEZA, CEARA, BRASIL',	'558599993333',	'558599993333@www.com')
	GO
	INSERT INTO [dbo].[tab_clients] ([name_client],[address_client],[phone_client],[email_client])  VALUES('LUCAS JUCÁ',	'RUA 10, 4, CENTRO, FORTALEZA, CEARA, BRASIL',	'558599994444',	'558599994444@www.com')
	GO
	INSERT INTO [dbo].[tab_clients] ([name_client],[address_client],[phone_client],[email_client])  VALUES('VILMA MARIA',	'RUA 10, 5, CENTRO, FORTALEZA, CEARA, BRASIL',	'558599991111',	'558599991111@www.com')
	GO

