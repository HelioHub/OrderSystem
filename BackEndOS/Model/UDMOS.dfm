object DMOS: TDMOS
  OldCreateOrder = False
  Height = 400
  Width = 720
  object OSConnection: TFDConnection
    Params.Strings = (
      'Database=ordersystem'
      'User_Name=sa'
      'Password=197382'
      'Server=HELIOLENOVO\SQLEXPRESS'
      'DriverID=MSSQL')
    LoginPrompt = False
    Left = 49
    Top = 24
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Console'
    Left = 160
    Top = 24
  end
  object FDPhysIBDriverLink1: TFDPhysIBDriverLink
    Left = 264
    Top = 24
  end
  object FDStanStorageJSONLink1: TFDStanStorageJSONLink
    Left = 264
    Top = 72
  end
  object FDStanStorageBinLink1: TFDStanStorageBinLink
    Left = 264
    Top = 128
  end
  object OSOrders: TFDQuery
    Connection = OSConnection
    SQL.Strings = (
      'SELECT TOP (1000) a.[code_order]'
      '      ,a.[date_order]'
      '      ,a.[code_client]'
      '      ,b.[name_client]'
      '      ,b.[address_client]'
      '      ,b.[phone_client]'
      '      ,b.[email_client]'
      '      ,a.[value_order]'
      '      ,dbo.fn_get_total_value_ordered(26) as valueorder '
      'FROM [dbo].[tab_orders] a'
      
        'INNER JOIN [dbo].[tab_clients] b ON b.code_client = a.code_clien' +
        't '
      '')
    Left = 49
    Top = 81
    object OSOrderscode_order: TFDAutoIncField
      FieldName = 'code_order'
      Origin = 'code_order'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object OSOrdersdate_order: TSQLTimeStampField
      FieldName = 'date_order'
      Origin = 'date_order'
      Required = True
    end
    object OSOrderscode_client: TIntegerField
      FieldName = 'code_client'
      Origin = 'code_client'
      Required = True
    end
    object OSOrdersname_client: TStringField
      FieldName = 'name_client'
      Origin = 'name_client'
      Required = True
      Size = 100
    end
    object OSOrdersaddress_client: TStringField
      FieldName = 'address_client'
      Origin = 'address_client'
      Size = 250
    end
    object OSOrdersphone_client: TStringField
      FieldName = 'phone_client'
      Origin = 'phone_client'
    end
    object OSOrdersemail_client: TStringField
      FieldName = 'email_client'
      Origin = 'email_client'
      Size = 50
    end
    object OSOrdersvalue_order: TFMTBCDField
      FieldName = 'value_order'
      Origin = 'value_order'
      Precision = 20
      Size = 4
    end
    object OSOrdersvalueorder: TFMTBCDField
      FieldName = 'valueorder'
      Origin = 'valueorder'
      ReadOnly = True
      Precision = 20
      Size = 4
    end
  end
  object OSOrders_Items: TFDQuery
    Connection = OSConnection
    SQL.Strings = (
      'SELECT TOP (1000) a.[code_order_item]'
      '      ,a.[code_order]'
      '      ,a.[code_item]'
      '      ,a.[amount_order_item]'
      '      ,a.[unitprice_order_item]'
      
        '      ,a.[amount_order_item] * a.[unitprice_order_item] as value' +
        '_item'
      '      ,b.[name_item]'
      '      ,b.[description_item]'
      'FROM [dbo].[tab_order_item] a'
      'INNER JOIN [dbo].[tab_item] b ON b.[code_item] = a.[code_item] '
      '')
    Left = 49
    Top = 135
    object OSOrders_Itemscode_order_item: TFDAutoIncField
      FieldName = 'code_order_item'
      Origin = 'code_order_item'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object OSOrders_Itemscode_order: TIntegerField
      FieldName = 'code_order'
      Origin = 'code_order'
      Required = True
    end
    object OSOrders_Itemscode_item: TIntegerField
      FieldName = 'code_item'
      Origin = 'code_item'
      Required = True
    end
    object OSOrders_Itemsamount_order_item: TFMTBCDField
      FieldName = 'amount_order_item'
      Origin = 'amount_order_item'
      Precision = 20
      Size = 4
    end
    object OSOrders_Itemsunitprice_order_item: TFMTBCDField
      FieldName = 'unitprice_order_item'
      Origin = 'unitprice_order_item'
      Precision = 20
      Size = 4
    end
    object OSOrders_Itemsvalue_item: TFMTBCDField
      FieldName = 'value_item'
      Origin = 'value_item'
      ReadOnly = True
      Precision = 38
      Size = 6
    end
    object OSOrders_Itemsname_item: TStringField
      FieldName = 'name_item'
      Origin = 'name_item'
      Required = True
      Size = 100
    end
    object OSOrders_Itemsdescription_item: TStringField
      FieldName = 'description_item'
      Origin = 'description_item'
      Size = 250
    end
  end
  object OSItems: TFDQuery
    Connection = OSConnection
    SQL.Strings = (
      'SELECT TOP (100) a.[code_item] '
      #9' ,a.[name_item]         '
      #9' ,a.[description_item]  '
      #9' ,a.[price_item]        '
      'FROM [dbo].[tab_item] a '
      'ORDER BY a.[code_item] ')
    Left = 49
    Top = 195
    object OSItemscode_item: TFDAutoIncField
      FieldName = 'code_item'
      Origin = 'code_item'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object OSItemsname_item: TStringField
      FieldName = 'name_item'
      Origin = 'name_item'
      Required = True
      Size = 100
    end
    object OSItemsdescription_item: TStringField
      FieldName = 'description_item'
      Origin = 'description_item'
      Size = 250
    end
    object OSItemsprice_item: TFMTBCDField
      FieldName = 'price_item'
      Origin = 'price_item'
      Precision = 20
      Size = 4
    end
  end
  object OSReportOrders: TFDQuery
    Connection = OSConnection
    SQL.Strings = (
      'SELECT TOP (1000) a.[code_order]'
      '      ,a.[date_order]'
      '      ,a.[code_client]'
      '      ,b.[name_client]'
      '      ,b.[phone_client]'
      '      ,b.[email_client]'
      #9'  ,c.[code_item]'
      #9'  ,d.[name_item]'
      #9'  ,c.[amount_order_item]'
      #9'  ,c.[unitprice_order_item]'
      
        #9'  ,(c.[amount_order_item] * c.[unitprice_order_item]) as valueo' +
        'rder'
      
        #9'  ,dbo.fn_get_total_value_ordered(a.[code_order]) as totalorder' +
        ' '
      'FROM [dbo].[tab_orders] a'
      
        'INNER JOIN [dbo].[tab_clients]    b ON b.[code_client]= a.[code_' +
        'client] '
      
        'INNER JOIN [dbo].[tab_order_item] c ON c.[code_order] = a.[code_' +
        'order] '
      
        'INNER JOIN [dbo].[tab_item]       d ON d.[code_item]  = c.[code_' +
        'item] '
      'ORDER BY a.[code_order], a.[date_order]')
    Left = 49
    Top = 253
    object OSReportOrderscode_order: TFDAutoIncField
      FieldName = 'code_order'
      Origin = 'code_order'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object OSReportOrdersdate_order: TSQLTimeStampField
      FieldName = 'date_order'
      Origin = 'date_order'
      Required = True
    end
    object OSReportOrderscode_client: TIntegerField
      FieldName = 'code_client'
      Origin = 'code_client'
      Required = True
    end
    object OSReportOrdersname_client: TStringField
      FieldName = 'name_client'
      Origin = 'name_client'
      Required = True
      Size = 100
    end
    object OSReportOrdersphone_client: TStringField
      FieldName = 'phone_client'
      Origin = 'phone_client'
    end
    object OSReportOrdersemail_client: TStringField
      FieldName = 'email_client'
      Origin = 'email_client'
      Size = 50
    end
    object OSReportOrderscode_item: TIntegerField
      FieldName = 'code_item'
      Origin = 'code_item'
      Required = True
    end
    object OSReportOrdersname_item: TStringField
      FieldName = 'name_item'
      Origin = 'name_item'
      Required = True
      Size = 100
    end
    object OSReportOrdersamount_order_item: TFMTBCDField
      FieldName = 'amount_order_item'
      Origin = 'amount_order_item'
      Precision = 20
      Size = 4
    end
    object OSReportOrdersunitprice_order_item: TFMTBCDField
      FieldName = 'unitprice_order_item'
      Origin = 'unitprice_order_item'
      Precision = 20
      Size = 4
    end
    object OSReportOrdersvalueorder: TFMTBCDField
      FieldName = 'valueorder'
      Origin = 'valueorder'
      ReadOnly = True
      Precision = 38
      Size = 6
    end
    object OSReportOrderstotalorder: TFMTBCDField
      FieldName = 'totalorder'
      Origin = 'totalorder'
      ReadOnly = True
      Precision = 20
      Size = 4
    end
  end
end
