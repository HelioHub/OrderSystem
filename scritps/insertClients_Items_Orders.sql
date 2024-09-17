USE [ordersystem]
GO

DELETE FROM [dbo].[tab_order_item] 
GO

DELETE FROM [dbo].[tab_orders] 
GO

DELETE FROM [dbo].[tab_clients] 
GO
/*CLIENTS*/
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


DELETE FROM [dbo].[tab_item] 
GO
/*ITEM*/
INSERT INTO [dbo].[tab_item] ([name_item],[description_item],[price_item]) VALUES ('Produto A','Produto referente a necessidade do público A',	10.0000)
go
INSERT INTO [dbo].[tab_item] ([name_item],[description_item],[price_item]) VALUES ('Produto B','Produto referente a necessidade do público B',	15.0000)
go
INSERT INTO [dbo].[tab_item] ([name_item],[description_item],[price_item]) VALUES ('Produto C','Produto referente a necessidade do público C',	20.0000)
go

/*ORDERS*/
SET DATEFORMAT ymd; 
GO
INSERT INTO [dbo].[tab_orders] ([date_order],[value_order],[code_client]) VALUES (CAST('2024-09-17' AS DATETIME), 0, 
            (SELECT TOP (1) [code_client] FROM [ordersystem].[dbo].[tab_clients] WHERE [name_client] = 'HELIO MARQUES'))
GO
INSERT INTO [dbo].[tab_orders] ([date_order],[value_order],[code_client]) VALUES ('2024-09-17', 0, 
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
            (SELECT TOP (1) [code_order]  FROM [ordersystem].[dbo].[tab_orders] WHERE [code_client] = (SELECT TOP (1) [code_client] FROM [ordersystem].[dbo].[tab_clients] WHERE [name_client] = 'ISABEL LEGAL')),
			(SELECT TOP (1) [code_item]   FROM [ordersystem].[dbo].[tab_item]   WHERE [name_item]   = 'PRODUTO B'),
			1,
			(SELECT TOP (1) [price_item]  FROM [ordersystem].[dbo].[tab_item]   WHERE [name_item]   = 'PRODUTO B'))
GO
INSERT INTO [dbo].[tab_order_item] ([code_order],[code_item],[amount_order_item],[unitprice_order_item]) VALUES (
            (SELECT TOP (1) [code_order]  FROM [ordersystem].[dbo].[tab_orders] WHERE [code_client] = (SELECT TOP (1) [code_client] FROM [ordersystem].[dbo].[tab_clients] WHERE [name_client] = 'ISABEL LEGAL')),
			(SELECT TOP (1) [code_item]   FROM [ordersystem].[dbo].[tab_item]   WHERE [name_item]   = 'PRODUTO C'),
			1,
			(SELECT TOP (1) [price_item]  FROM [ordersystem].[dbo].[tab_item]   WHERE [name_item]   = 'PRODUTO C'))
GO



