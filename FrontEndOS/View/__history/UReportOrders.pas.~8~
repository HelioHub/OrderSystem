unit UReportOrders;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, dxBarBuiltInMenu, Vcl.Menus, Vcl.StdCtrls, cxButtons,
  cxPC, cxContainer, cxEdit, Vcl.ComCtrls, dxCore, cxDateUtils, cxCurrencyEdit,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, cxLabel;

type
  TFReportOrders = class(TForm)
    cxPageControlOrder: TcxPageControl;
    cxTabSheetOrder: TcxTabSheet;
    cxTCrodape: TcxTabControl;
    cxBReport: TcxButton;
    cxBCancel: TcxButton;
    cxLPeriod: TcxLabel;
    cxDEini: TcxDateEdit;
    cxLa: TcxLabel;
    cxDEcon: TcxDateEdit;
    cxLCodeClient: TcxLabel;
    cxCECodeClient: TcxCurrencyEdit;
    procedure cxBCancelClick(Sender: TObject);
    procedure cxBReportClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FReportOrders: TFReportOrders;

implementation

{$R *.dfm}

procedure TFReportOrders.cxBCancelClick(Sender: TObject);
begin
  ModalResult := mrCancel;
  Close;
end;

procedure TFReportOrders.cxBReportClick(Sender: TObject);
var sData : String;
begin
  sData := cxDEini.Text;
  if Trim(sData) = ''  then
  begin
    Beep;
    ShowMessage('Enter the start date!');
    cxDEini.SetFocus;
    Exit;
  end;

  sData := cxDEcon.Text;
  if Trim(sData) = ''  then
  begin
    Beep;
    ShowMessage('Enter the end date!');
    cxDEcon.SetFocus;
    Exit;
  end;

  ModalResult := mrOk;
end;

end.
