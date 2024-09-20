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

  -- Request Function 
select dbo.fn_get_total_value_ordered(26)
go

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
	  ,dbo.fn_get_total_value_ordered(a.[code_order]) as valueorder 
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



 SELECT TOP (100) a.[code_order_item] 
 ,a.[code_item]                         
 ,a.[amount_order_item]   
 ,a.[unitprice_order_item]       
 ,a.[amount_order_item] * a.[unitprice_order_item] as value_item 
 ,b.[name_item]        
 ,b.[description_item]                                           
 FROM [dbo].[tab_order_item] a                                   
 INNER JOIN [dbo].[tab_item] b ON b.[code_item] = a.[code_item]  
 WHERE a.[code_order] = 31 ORDER BY a.[code_item] 

 SELECT	TOP (100) a.[code_item] 
				 ,a.[name_item]         
				 ,a.[description_item]  
				 ,a.[price_item]        
 FROM [dbo].[tab_item] a 
 ORDER BY a.[code_item] 



USE [ordersystem]
go
SET DATEFORMAT ymd; 
GO
SELECT TOP (1000) a.[code_order]
      ,a.[date_order]
      ,a.[code_client]
      ,b.[name_client]
      ,b.[phone_client]
      ,b.[email_client]
	  ,c.[code_item]
	  ,d.[name_item]
	  ,c.[amount_order_item]
	  ,c.[unitprice_order_item]
	  ,(c.[amount_order_item] * c.[unitprice_order_item]) as valueorder
	  ,dbo.fn_get_total_value_ordered(a.[code_order]) as totalorder 
FROM [dbo].[tab_orders] a
INNER JOIN [dbo].[tab_clients]    b ON b.[code_client]= a.[code_client] 
INNER JOIN [dbo].[tab_order_item] c ON c.[code_order] = a.[code_order] 
INNER JOIN [dbo].[tab_item]       d ON d.[code_item]  = c.[code_item] 
WHERE a.[date_order] BETWEEN CAST('2024-09-17' AS DATETIME) AND CAST('2024-09-19' AS DATETIME)+1
--  AND a.[code_client] = 51
ORDER BY a.[code_order], a.[date_order]

/*
Head
----
REPORT ORDERS

Client: All
Period: 99/99/99 a 99/99/99

Group by
--------
Code Order:  31                       Date Order: 2024-09-17 00:00:00.000            
Code Client: 51
Name Client: HELIO MARQUES
Phone:       558599991111
E-mail:      558599991111@www.com										

Line
----
Code Item Name Item                    Amount Item Unit Price Item Value Item
-----------------------------------------------------------------------------
28	      Produto A	                        2.0000    10.0000	    20.000000
29	      Produto B	                        1.0000	  15.0000	    15.000000
30        Produto C	                        1.0000	  20.0000	    20.000000

                                                  Total do Pedido: R$ 55.0000
*/



DELETE FROM dbo.tab_order_item WHERE code_order_item = 35