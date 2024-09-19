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
	  ,dbo.fn_get_total_value_ordered(26) as valueorder 
FROM [dbo].[tab_orders] a
INNER JOIN [dbo].[tab_clients] b ON b.code_client = a.code_client 

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








