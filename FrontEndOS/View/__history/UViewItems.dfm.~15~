object FViewItems: TFViewItems
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Items'
  ClientHeight = 498
  ClientWidth = 888
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
  object cxTabControl1: TcxTabControl
    Left = 0
    Top = 0
    Width = 888
    Height = 54
    Align = alTop
    TabOrder = 0
    Properties.CustomButtons.Buttons = <>
    DesignSize = (
      888
      54)
    ClientRectBottom = 49
    ClientRectLeft = 2
    ClientRectRight = 883
    ClientRectTop = 2
    object dxBevel2: TdxBevel
      Left = 442
      Top = 2
      Width = 15
      Height = 47
      Align = alLeft
      ExplicitTop = 1
    end
    object cxBInclude: TcxButton
      Left = 2
      Top = 2
      Width = 110
      Height = 47
      Hint = 'Click to add new record'
      Align = alLeft
      Caption = 'Include'
      Default = True
      OptionsImage.ImageIndex = 2
      OptionsImage.Images = DMConnection.cxILImageBig
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = cxBIncludeClick
    end
    object cxBAlter: TcxButton
      Left = 112
      Top = 2
      Width = 110
      Height = 47
      Hint = 'Click to Change the positioned record (cursor)'
      Align = alLeft
      Caption = 'Alter'
      OptionsImage.ImageIndex = 3
      OptionsImage.Images = DMConnection.cxILImageBig
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = cxBAlterClick
    end
    object cxBClose: TcxButton
      Left = 457
      Top = 2
      Width = 110
      Height = 47
      Hint = 'Click to Close...'
      Align = alLeft
      Cancel = True
      Caption = 'Close'
      OptionsImage.ImageIndex = 1
      OptionsImage.Images = DMConnection.cxILImageBig
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = cxBCloseClick
    end
    object cxBDelete: TcxButton
      Left = 222
      Top = 2
      Width = 110
      Height = 47
      Hint = 'Click to delete the positioned record (cursor)'
      Align = alLeft
      Caption = 'Delete'
      OptionsImage.ImageIndex = 4
      OptionsImage.Images = DMConnection.cxILImageBig
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = cxBDeleteClick
    end
    object cxBRefresh: TcxButton
      Left = 332
      Top = 2
      Width = 110
      Height = 47
      Hint = 'Click to update data on screen...'
      Align = alLeft
      Caption = 'Refresh'
      OptionsImage.ImageIndex = 9
      OptionsImage.Images = DMConnection.cxILImageBig
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = cxBRefreshClick
    end
    object cxLabel4: TcxLabel
      Left = 665
      Top = 14
      Anchors = [akTop, akRight]
      Caption = 'Number of records:'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -16
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.IsFontAssigned = True
    end
    object cxTENumberRecords: TcxTextEdit
      Left = 811
      Top = 12
      Anchors = [akTop, akRight]
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
      TabOrder = 6
      Text = '100'
      Width = 67
    end
  end
  object cxGridItems: TcxGrid
    Left = 0
    Top = 54
    Width = 888
    Height = 444
    Hint = 'DoubleClick to Consultation...'
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    ExplicitTop = 55
    object cxGridItemsDBTableView1: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      Navigator.Buttons.Insert.Visible = False
      Navigator.Buttons.Delete.Visible = False
      Navigator.Buttons.Edit.Visible = False
      Navigator.Buttons.Post.Visible = False
      Navigator.Buttons.Cancel.Visible = False
      Navigator.Buttons.Refresh.Visible = True
      Navigator.Buttons.SaveBookmark.Visible = False
      Navigator.Buttons.GotoBookmark.Visible = False
      Navigator.InfoPanel.Visible = True
      Navigator.Visible = True
      DataController.DataSource = DSItems
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      FilterRow.Visible = True
      FilterRow.ApplyChanges = fracImmediately
      OptionsCustomize.ColumnsQuickCustomization = True
      OptionsSelection.MultiSelect = True
      OptionsSelection.CellMultiSelect = True
      OptionsSelection.InvertSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.Indicator = True
      object cxGridItemsDBTableView1Column_code_item: TcxGridDBColumn
        Caption = 'Code Item'
        DataBinding.FieldName = 'code_item'
        MinWidth = 5
        Width = 83
      end
      object cxGridItemsDBTableView1Column_name_item: TcxGridDBColumn
        Caption = 'Name Item'
        DataBinding.FieldName = 'name_item'
        MinWidth = 10
        Width = 224
      end
      object cxGridItemsDBTableView1Column_price_item: TcxGridDBColumn
        Caption = 'Price'
        DataBinding.FieldName = 'price_item'
        HeaderAlignmentHorz = taRightJustify
        Width = 94
      end
      object cxGridItemsDBTableView1Column_description: TcxGridDBColumn
        Caption = 'Description'
        DataBinding.FieldName = 'description_item'
        Width = 473
      end
    end
    object cxGridItemsLevel1: TcxGridLevel
      GridView = cxGridItemsDBTableView1
    end
  end
  object DSItems: TDataSource
    AutoEdit = False
    DataSet = DMConnection.MemTableItems
    Left = 392
    Top = 200
  end
  object cxLookAndFeelController1: TcxLookAndFeelController
    NativeStyle = False
    SkinName = 'Blue'
    Left = 392
    Top = 248
  end
end
