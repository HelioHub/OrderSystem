object FDataItems: TFDataItems
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Items'
  ClientHeight = 270
  ClientWidth = 752
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object cxPageControlItem: TcxPageControl
    Left = 0
    Top = 0
    Width = 752
    Height = 270
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    Properties.ActivePage = cxTabSheetItem
    Properties.CustomButtons.Buttons = <>
    ClientRectBottom = 265
    ClientRectLeft = 2
    ClientRectRight = 747
    ClientRectTop = 31
    object cxTabSheetItem: TcxTabSheet
      Caption = 'Item'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ImageIndex = 0
      ParentFont = False
      DesignSize = (
        745
        234)
      object cxTCrodape: TcxTabControl
        Left = 0
        Top = 180
        Width = 745
        Height = 54
        Align = alBottom
        TabOrder = 8
        Properties.CustomButtons.Buttons = <>
        ClientRectBottom = 49
        ClientRectLeft = 2
        ClientRectRight = 740
        ClientRectTop = 2
        object cxBOK: TcxButton
          Left = 520
          Top = 2
          Width = 110
          Height = 47
          Align = alRight
          Caption = 'OK'
          Default = True
          LookAndFeel.NativeStyle = True
          OptionsImage.ImageIndex = 3
          OptionsImage.Images = DMConnection.cxILImageBig
          TabOrder = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          OnClick = cxBOKClick
        end
        object cxBCancel: TcxButton
          Left = 630
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
      object cxLCode: TcxLabel
        Left = 6
        Top = 22
        Anchors = [akTop, akRight]
        Caption = 'Code:'
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -16
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.IsFontAssigned = True
      end
      object cxTECode: TcxTextEdit
        Left = 106
        Top = 20
        Anchors = [akTop, akRight]
        Enabled = False
        ParentFont = False
        Properties.Alignment.Horz = taRightJustify
        Properties.MaxLength = 100
        Properties.ReadOnly = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -16
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.IsFontAssigned = True
        TabOrder = 0
        Width = 67
      end
      object cxLName: TcxLabel
        Left = 6
        Top = 60
        Anchors = [akTop, akRight]
        Caption = 'Name:'
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -16
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.IsFontAssigned = True
      end
      object cxTEName: TcxTextEdit
        Left = 106
        Top = 59
        Anchors = [akTop, akRight]
        ParentFont = False
        Properties.Alignment.Horz = taLeftJustify
        Properties.MaxLength = 100
        Properties.ReadOnly = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -16
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.IsFontAssigned = True
        TabOrder = 2
        Width = 343
      end
      object cxLPrice: TcxLabel
        Left = 6
        Top = 136
        Anchors = [akTop, akRight]
        Caption = 'Price:'
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -16
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.IsFontAssigned = True
      end
      object cxCEPrice: TcxCurrencyEdit
        Left = 107
        Top = 134
        TabOrder = 6
        Width = 121
      end
      object cxLDescription: TcxLabel
        Left = 6
        Top = 98
        Anchors = [akTop, akRight]
        Caption = 'Description:'
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -16
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.IsFontAssigned = True
      end
      object cxTEDescription: TcxTextEdit
        Left = 107
        Top = 97
        Anchors = [akTop, akRight]
        ParentFont = False
        Properties.Alignment.Horz = taLeftJustify
        Properties.MaxLength = 250
        Properties.ReadOnly = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -16
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.IsFontAssigned = True
        TabOrder = 4
        Width = 583
      end
      object cxLabel1: TcxLabel
        Left = 175
        Top = 22
        Anchors = [akTop, akRight]
        Caption = '*Auto increment'
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = 12615680
        Style.Font.Height = -13
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.IsFontAssigned = True
        Properties.LineOptions.InnerColor = clBlack
        Properties.LineOptions.OuterColor = clBlack
      end
    end
  end
end
