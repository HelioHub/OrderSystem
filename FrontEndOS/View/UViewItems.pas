unit UViewItems;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, dxBarBuiltInMenu, Vcl.Menus, cxContainer, cxEdit,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxNavigator,
  cxDataControllerConditionalFormattingRulesManagerDialog, Data.DB, cxDBData,
  cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxClasses, cxGridCustomView, cxGrid, cxTextEdit, cxLabel, Vcl.StdCtrls,
  cxButtons, dxBevel, cxPC;

type
  TFViewItems = class(TForm)
    cxTabControl1: TcxTabControl;
    dxBevel2: TdxBevel;
    cxBInclude: TcxButton;
    cxBAlter: TcxButton;
    cxBClose: TcxButton;
    cxBDelete: TcxButton;
    cxBRefresh: TcxButton;
    cxLabel4: TcxLabel;
    cxTENumberRecords: TcxTextEdit;
    DSItems: TDataSource;
    cxGridItems: TcxGrid;
    cxGridItemsDBTableView1: TcxGridDBTableView;
    cxGridItemsDBTableView1Column_code_item: TcxGridDBColumn;
    cxGridItemsDBTableView1Column_name_item: TcxGridDBColumn;
    cxGridItemsDBTableView1Column_description: TcxGridDBColumn;
    cxGridItemsDBTableView1Column_price_item: TcxGridDBColumn;
    cxGridItemsLevel1: TcxGridLevel;
    cxLookAndFeelController1: TcxLookAndFeelController;
    procedure cxBRefreshClick(Sender: TObject);
    procedure cxBCloseClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FViewItems: TFViewItems;

implementation

{$R *.dfm}

uses UDMConnection;

procedure TFViewItems.cxBCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TFViewItems.cxBRefreshClick(Sender: TObject);
var sNumberRecords : String;
begin
  Try
    sNumberRecords := IntToStr(StrToInt(Trim(cxTENumberRecords.Text)));
  Except
    ShowMessage('Attention! Invalid number of records.');
  End;

  DSItems.DataSet.Close;
  DMConnection.LoadItems('', sNumberRecords);
end;

procedure TFViewItems.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := CaFree;
end;

end.
