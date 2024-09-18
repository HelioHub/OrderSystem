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
  FROM [ordersystem].[dbo].[tab_order_item]


  -- Request Function 
  select dbo.fn_get_total_value_ordered(26)
  go