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


