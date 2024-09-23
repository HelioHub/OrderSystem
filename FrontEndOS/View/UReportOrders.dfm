object FReportOrders: TFReportOrders
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Report Orders'
  ClientHeight = 196
  ClientWidth = 565
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object cxPageControlOrder: TcxPageControl
    Left = 0
    Top = 0
    Width = 565
    Height = 196
    Align = alClient
    TabOrder = 0
    Properties.ActivePage = cxTabSheetOrder
    Properties.CustomButtons.Buttons = <>
    ClientRectBottom = 191
    ClientRectLeft = 2
    ClientRectRight = 560
    ClientRectTop = 25
    object cxTabSheetOrder: TcxTabSheet
      Caption = 'Settings'
      ImageIndex = 0
      object cxTCrodape: TcxTabControl
        Left = 0
        Top = 112
        Width = 558
        Height = 54
        Align = alBottom
        TabOrder = 6
        Properties.CustomButtons.Buttons = <>
        ClientRectBottom = 49
        ClientRectLeft = 2
        ClientRectRight = 553
        ClientRectTop = 2
        object cxBReport: TcxButton
          Left = 333
          Top = 2
          Width = 110
          Height = 47
          Align = alRight
          Caption = 'Report'
          Default = True
          LookAndFeel.NativeStyle = True
          OptionsImage.ImageIndex = 6
          OptionsImage.Images = DMConnection.cxILImageBig
          TabOrder = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          OnClick = cxBReportClick
        end
        object cxBCancel: TcxButton
          Left = 443
          Top = 2
          Width = 110
          Height = 47
          Align = alRight
          Cancel = True
          Caption = 'Cancelar'
          OptionsImage.ImageIndex = 1
          OptionsImage.Images = DMConnection.cxILImageBig
          TabOrder = 1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          OnClick = cxBCancelClick
        end
      end
      object cxLPeriod: TcxLabel
        Left = 12
        Top = 57
        Caption = 'Order Period:'
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -16
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.IsFontAssigned = True
      end
      object cxDEini: TcxDateEdit
        Left = 118
        Top = 55
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -16
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.IsFontAssigned = True
        TabOrder = 2
        Width = 194
      end
      object cxLa: TcxLabel
        Left = 316
        Top = 57
        Caption = '/'
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -16
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.IsFontAssigned = True
      end
      object cxDEcon: TcxDateEdit
        Left = 331
        Top = 55
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -16
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.IsFontAssigned = True
        TabOrder = 4
        Width = 194
      end
      object cxLCodeClient: TcxLabel
        Left = 12
        Top = 24
        Caption = 'Code Client:'
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -16
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.IsFontAssigned = True
      end
      object cxCECodeClient: TcxCurrencyEdit
        Left = 118
        Top = 22
        Hint = 'Blank all customers...'
        ParentFont = False
        ParentShowHint = False
        Properties.AssignedValues.DisplayFormat = True
        Properties.DecimalPlaces = 0
        ShowHint = True
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -16
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.IsFontAssigned = True
        TabOrder = 0
        Width = 83
      end
    end
  end
end
