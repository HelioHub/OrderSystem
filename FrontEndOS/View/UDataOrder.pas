unit UDataOrder;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, Vcl.Menus, Vcl.StdCtrls, cxButtons, Vcl.ExtCtrls,
  cxControls, cxPCdxBarPopupMenu, cxContainer, cxEdit, cxTextEdit, cxGroupBox,
  cxRadioGroup, cxLabel, cxPC, dxSkinsCore, dxSkinDevExpressStyle,
  dxSkinscxPCPainter, dxSkinBlue, dxBarBuiltInMenu;

type
  TFDataOrder = class(TForm)
    cxPageControl1: TcxPageControl;
    cxTabSheet1: TcxTabSheet;
    cxTCrodape: TcxTabControl;
    cxBOK: TcxButton;
    cxBCancel: TcxButton;
    procedure cxBCancelClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    GAction : String[1];
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

procedure TFDataOrder.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := CaFree;
end;

procedure TFDataOrder.FormShow(Sender: TObject);
begin
  If GAction = 'A' Then
     cxTabSheet1.Caption := 'Alter Order'
  Else
     cxTabSheet1.Caption := 'Include Order';
end;

end.
