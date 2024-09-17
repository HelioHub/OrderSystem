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
