object DataModule1: TDataModule1
  OldCreateOrder = False
  Height = 400
  Width = 720
  object WKConnection: TFDConnection
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
  object WKPessoa: TFDQuery
    Connection = WKConnection
    SQL.Strings = (
      'SELECT * FROM PESSOA ORDER BY IDPESSOA')
    Left = 49
    Top = 76
  end
  object WKSequencial: TFDQuery
    Connection = WKConnection
    SQL.Strings = (
      '')
    Left = 49
    Top = 136
  end
end
