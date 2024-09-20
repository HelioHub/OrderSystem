unit UViewOrder;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxPCdxBarPopupMenu, Vcl.Menus, cxStyles, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData,
  dxBevel, cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, Vcl.StdCtrls, cxButtons, cxPC,
  cxTL, dxSkinBlue, dxSkinsCore, dxSkinscxPCPainter, cxLocalization,
  dxBarBuiltInMenu, cxDataControllerConditionalFormattingRulesManagerDialog,
  cxContainer, cxTextEdit, cxLabel, cxDBLabel;

type
  TFViewOrder = class(TForm)
    cxTabControl1: TcxTabControl;
    cxBInclude: TcxButton;
    cxGridOrdersDBTableView1: TcxGridDBTableView;
    cxGridOrdersLevel1: TcxGridLevel;
    cxGridOrders: TcxGrid;
    cxBAlter: TcxButton;
    cxBClose: TcxButton;
    dxBevel1: TdxBevel;
    cxBDelete: TcxButton;
    DSOrders: TDataSource;
    cxLookAndFeelController1: TcxLookAndFeelController;
    cxBRefresh: TcxButton;
    cxPageControl1: TcxPageControl;
    cxTabSheet1: TcxTabSheet;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    cxTENumberRecords: TcxTextEdit;
    cxGridOrdersDBTableView1Column_code_order: TcxGridDBColumn;
    cxGridOrdersDBTableView1Column_date_order: TcxGridDBColumn;
    cxGridOrdersDBTableView1Column_code_client: TcxGridDBColumn;
    cxGridOrdersDBTableView1Column_valueorder: TcxGridDBColumn;
    cxDBLabel2: TcxDBLabel;
    cxDBLabel3: TcxDBLabel;
    cxDBLabel4: TcxDBLabel;
    DSOrderItems: TDataSource;
    cxGridOrderItems: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    cxGridDBTableView1Column1: TcxGridDBColumn;
    cxGridDBTableView1Column2: TcxGridDBColumn;
    cxGridDBTableView1Column3: TcxGridDBColumn;
    cxGridDBTableView1Column4: TcxGridDBColumn;
    cxGridDBTableView1Column5: TcxGridDBColumn;
    cxGridDBTableView1Column6: TcxGridDBColumn;
    dxBevel2: TdxBevel;
    cxBItems: TcxButton;
    cxGridDBTableView1Column7: TcxGridDBColumn;
    cxBReportOrder: TcxButton;
    cxGridOrdersDBTableView1Column_name_client: TcxGridDBColumn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cxBCloseClick(Sender: TObject);
    procedure cxBIncludeClick(Sender: TObject);
    procedure cxBRefreshClick(Sender: TObject);
    procedure cxBDeleteClick(Sender: TObject);
    procedure cxBAlterClick(Sender: TObject);
    procedure cxBItemsClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cxBReportOrderClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FViewOrder: TFViewOrder;

implementation

{$R *.dfm}

uses UDMConnection, UDataOrder, UConstants, UReportOrders;

procedure TFViewOrder.cxBAlterClick(Sender: TObject);
var Form : TFDataOrder;
begin
  Form := TFDataOrder.Create (Application);
  Form.ShowModal;
end;

procedure TFViewOrder.cxBCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TFViewOrder.cxBDeleteClick(Sender: TObject);
begin
  Beep;
  ShowMessage('In Development!');
end;

procedure TFViewOrder.cxBIncludeClick(Sender: TObject);
var Form : TFDataOrder;
begin
  Form := TFDataOrder.Create (Application);
  Form.ShowModal;
end;

procedure TFViewOrder.cxBItemsClick(Sender: TObject);
var sNumberRecords : String;
begin
  Try
    sNumberRecords := cNumberRecords;
  Except
    ShowMessage('Attention! Invalid number of records.');
  End;

  DSOrderItems.DataSet.Close;
  DMConnection.LoadOrders_Items(DSOrders.DataSet.FieldByName('code_order').AsString, sNumberRecords);
end;

procedure TFViewOrder.cxBRefreshClick(Sender: TObject);
var sNumberRecords : String;
begin
  Try
    sNumberRecords := IntToStr(StrToInt(Trim(cxTENumberRecords.Text)));
  Except
    ShowMessage('Attention! Invalid number of records.');
  End;

  DSOrders.DataSet.Close;
  DMConnection.LoadOrders('', sNumberRecords);
end;

procedure TFViewOrder.cxBReportOrderClick(Sender: TObject);
var Form : TFReportOrders;
begin
  Form := TFReportOrders.Create (Application);
  If Form.ShowModal = mrOk Then
  begin
    DMConnection.MemTableReportOrders.Close;
    DMConnection.LoadReportOrders(Trim(Form.cxCECodeClient.Text), Form.cxDEini.Text, Form.cxDEcon.Text);
    DMConnection.frxReportOrders.ShowReport();
  end;
  Form.Destroy;
end;

procedure TFViewOrder.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := CaFree;
end;

procedure TFViewOrder.FormShow(Sender: TObject);
begin
  cxTENumberRecords.Text := cNumberRecords;
end;

end.
