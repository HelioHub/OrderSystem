object FUnitTest: TFUnitTest
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Unit Test'
  ClientHeight = 526
  ClientWidth = 510
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 32
    Top = 72
    Width = 69
    Height = 13
    Caption = '1 Test. Order:'
  end
  object Label2: TLabel
    Left = 32
    Top = 104
    Width = 69
    Height = 13
    Caption = '2 Test. Order:'
  end
  object Label3: TLabel
    Left = 32
    Top = 136
    Width = 69
    Height = 13
    Caption = '3 Test. Order:'
  end
  object Label4: TLabel
    Left = 32
    Top = 168
    Width = 69
    Height = 13
    Caption = '4 Test. Order:'
  end
  object Label5: TLabel
    Left = 32
    Top = 200
    Width = 69
    Height = 13
    Caption = '5 Test. Order:'
  end
  object Label6: TLabel
    Left = 288
    Top = 53
    Width = 74
    Height = 13
    Caption = 'expected value'
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 510
    Height = 41
    Align = alTop
    Caption = 'Functions Tests - UnitTest'
    TabOrder = 0
  end
  object Edit1: TEdit
    Left = 120
    Top = 74
    Width = 121
    Height = 21
    TabOrder = 1
    Text = '31'
  end
  object Edit2: TEdit
    Left = 120
    Top = 101
    Width = 121
    Height = 21
    TabOrder = 2
    Text = '32'
  end
  object Edit3: TEdit
    Left = 120
    Top = 133
    Width = 121
    Height = 21
    TabOrder = 3
    Text = '33'
  end
  object Edit4: TEdit
    Left = 120
    Top = 164
    Width = 121
    Height = 21
    TabOrder = 4
    Text = '34'
  end
  object Edit5: TEdit
    Left = 120
    Top = 197
    Width = 121
    Height = 21
    TabOrder = 5
    Text = '37'
  end
  object cxCurrencyEdit1: TcxCurrencyEdit
    Left = 264
    Top = 72
    EditValue = 55.000000000000000000
    TabOrder = 6
    Width = 121
  end
  object cxCurrencyEdit2: TcxCurrencyEdit
    Left = 264
    Top = 99
    EditValue = 40.000000000000000000
    TabOrder = 7
    Width = 121
  end
  object cxCurrencyEdit3: TcxCurrencyEdit
    Left = 264
    Top = 133
    EditValue = 20.000000000000000000
    TabOrder = 8
    Width = 121
  end
  object cxCurrencyEdit4: TcxCurrencyEdit
    Left = 264
    Top = 164
    EditValue = 50.000000000000000000
    TabOrder = 9
    Width = 121
  end
  object cxCurrencyEdit5: TcxCurrencyEdit
    Left = 264
    Top = 197
    EditValue = 20.000000000000000000
    TabOrder = 10
    Width = 121
  end
  object Button1: TButton
    Left = 408
    Top = 70
    Width = 75
    Height = 25
    Caption = 'Test 1'
    TabOrder = 11
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 408
    Top = 101
    Width = 75
    Height = 25
    Caption = 'Test 2'
    TabOrder = 12
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 408
    Top = 132
    Width = 75
    Height = 25
    Caption = 'Test 3'
    TabOrder = 13
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 408
    Top = 163
    Width = 75
    Height = 25
    Caption = 'Test 4'
    TabOrder = 14
    OnClick = Button4Click
  end
  object Button5: TButton
    Left = 408
    Top = 194
    Width = 75
    Height = 25
    Caption = 'Test 5'
    TabOrder = 15
    OnClick = Button5Click
  end
  object BAllTest: TButton
    Left = 408
    Top = 225
    Width = 75
    Height = 25
    Caption = 'Test All'
    TabOrder = 16
    OnClick = BAllTestClick
  end
  object MemoTest: TMemo
    Left = 32
    Top = 296
    Width = 451
    Height = 193
    Lines.Strings = (
      'MemoTest')
    TabOrder = 17
  end
  object FDQueryTeste: TFDQuery
    Connection = OSConnection
    SQL.Strings = (
      
        'SELECT top 1 dbo.fn_get_total_value_ordered(:PCodeOrder) as valu' +
        'etotal '
      'FROM tab_clients')
    Left = 536
    Top = 64
    ParamData = <
      item
        Name = 'PCODEORDER'
        DataType = ftString
        ParamType = ptInput
      end>
  end
  object FDQueryOrderTotalValue: TFDQuery
    Connection = OSConnection
    SQL.Strings = (
      
        'SELECT top 5 a.code_order, ISNULL(SUM(b.amount_order_item * b.un' +
        'itprice_order_item), 0) as totalvalue'
      'FROM tab_orders a WITH (NOLOCK)'
      
        'INNER JOIN tab_order_item b WITH(NOLOCK) ON b.code_order = a.cod' +
        'e_order '
      'GROUP BY a.code_order')
    Left = 536
    Top = 124
  end
  object OSConnection: TFDConnection
    Params.Strings = (
      'Database=ordersystem'
      'User_Name=sa'
      'Password=197382'
      'Server=HELIOLENOVO\SQLEXPRESS'
      'DriverID=MSSQL')
    LoginPrompt = False
    Left = 633
    Top = 64
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Console'
    Left = 744
    Top = 64
  end
  object FDPhysIBDriverLink1: TFDPhysIBDriverLink
    Left = 848
    Top = 64
  end
  object FDStanStorageJSONLink1: TFDStanStorageJSONLink
    Left = 856
    Top = 120
  end
  object FDStanStorageBinLink1: TFDStanStorageBinLink
    Left = 848
    Top = 168
  end
end
