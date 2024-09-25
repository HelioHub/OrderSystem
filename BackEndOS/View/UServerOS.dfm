object FServerOS: TFServerOS
  Left = 271
  Top = 114
  BorderIcons = [biSystemMenu]
  Caption = 'Server Order System DataSnap REST FireDAC'
  ClientHeight = 191
  ClientWidth = 300
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 117
    Top = 105
    Width = 24
    Height = 13
    Caption = 'Port:'
  end
  object LWK: TLabel
    Left = 0
    Top = 0
    Width = 300
    Height = 46
    Align = alTop
    Alignment = taCenter
    Caption = 'Order System'
    Color = clSilver
    Font.Charset = ANSI_CHARSET
    Font.Color = clRed
    Font.Height = -40
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    ExplicitWidth = 262
  end
  object ButtonStart: TButton
    Left = 76
    Top = 65
    Width = 75
    Height = 25
    Caption = 'Start'
    TabOrder = 0
    OnClick = ButtonStartClick
  end
  object ButtonStop: TButton
    Left = 155
    Top = 65
    Width = 75
    Height = 25
    Caption = 'Stop'
    TabOrder = 1
    OnClick = ButtonStopClick
  end
  object EditPort: TEdit
    Left = 147
    Top = 102
    Width = 40
    Height = 21
    TabOrder = 2
    Text = '9090'
  end
  object ButtonOpenBrowser: TButton
    Left = 76
    Top = 130
    Width = 154
    Height = 25
    Caption = 'Open Browser'
    TabOrder = 3
    OnClick = ButtonOpenBrowserClick
  end
  object ButtonTestUnit: TButton
    Left = 76
    Top = 154
    Width = 154
    Height = 25
    Caption = 'Test Unit'
    TabOrder = 4
    OnClick = ButtonTestUnitClick
  end
  object ApplicationEvents1: TApplicationEvents
    OnIdle = ApplicationEvents1Idle
    Left = 280
    Top = 136
  end
end
