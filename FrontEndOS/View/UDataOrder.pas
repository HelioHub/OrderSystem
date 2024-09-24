unit UDataOrder;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, Vcl.Menus, Vcl.StdCtrls, cxButtons, Vcl.ExtCtrls,
  cxControls, cxPCdxBarPopupMenu, cxContainer, cxEdit, cxTextEdit, cxGroupBox,
  cxRadioGroup, cxLabel, cxPC, dxSkinsCore, dxSkinDevExpressStyle,
  dxSkinscxPCPainter, dxSkinBlue, dxBarBuiltInMenu, UConstants, Vcl.ComCtrls,
  dxCore, cxDateUtils, cxMaskEdit, cxDropDownEdit, cxCalendar, cxCurrencyEdit;

type
  TFDataOrder = class(TForm)
    cxPageControlOrder: TcxPageControl;
    cxTabSheetOrder: TcxTabSheet;
    cxTCrodape: TcxTabControl;
    cxBOK: TcxButton;
    cxBCancel: TcxButton;
    cxLCode: TcxLabel;
    cxTECode: TcxTextEdit;
    cxLName: TcxLabel;
    cxTEName: TcxTextEdit;
    cxLPrice: TcxLabel;
    cxCEPrice: TcxCurrencyEdit;
    cxLDate: TcxLabel;
    cxLabel1: TcxLabel;
    cxDEini: TcxDateEdit;
    procedure cxBCancelClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure pEnableControls;
    procedure pDisableControls;

  public
    { Public declarations }
    cAction : TAction;

    destructor Destroy; override;
  end;

var
  FDataOrder: TFDataOrder;

implementation

{$R *.dfm}

uses UDMConnection;

procedure TFDataOrder.cxBCancelClick(Sender: TObject);
begin
  Close;
end;

destructor TFDataOrder.Destroy;
begin

  inherited;
end;

procedure TFDataOrder.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := CaFree;
end;

procedure TFDataOrder.FormShow(Sender: TObject);
begin
  case cAction of
    acInclude: Self.Caption := Self.Caption + ' - ' + cActionInclude;
    acAlter  : Self.Caption := Self.Caption + ' - ' + cActionAlter;
    acDelete : Self.Caption := Self.Caption + ' - ' + cActionDelete;
    else       Self.Caption := Self.Caption + ' - ' + cActionConsult;
  end;

  if cAction <> acInclude then
  begin
    //Order
  end;

  case cAction of
    acInclude: pEnableControls;
    acAlter  : pEnableControls;
    acDelete : pDisableControls;
    else       pDisableControls;
  end;

  if (cAction <> acDelete) and (cAction <> acConsult) then
    cxTEName.SetFocus;
end;

procedure TFDataOrder.pDisableControls;
begin
  cxTEName.Enabled  := False;
  cxDEini.Enabled   := False;
  cxCEPrice.Enabled := False;
end;

procedure TFDataOrder.pEnableControls;
begin
  cxTEName.Enabled  := True;
  cxDEini.Enabled   := True;
  cxCEPrice.Enabled := True;
end;

end.
