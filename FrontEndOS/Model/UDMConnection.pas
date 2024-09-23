unit UDMConnection;

interface

uses
  System.SysUtils, System.Classes, Vcl.ImgList, Vcl.Controls,
  cxImageList, cxGraphics, IPPeerClient,
  Datasnap.DSClientRest, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.StorageBin, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, FireDAC.Stan.StorageJSON, Data.FireDACJSONReflect, Rest.JSON, System.JSON,
  ClientClassesOS, UClassItem, frxClass, frxDBSet;

type
  TDMConnection = class(TDataModule)
    cxImageSmall: TcxImageList;
    cxILImageBig: TcxImageList;
    DSRestConnectionOS: TDSRestConnection;
    FDStanStorageJSONLink1: TFDStanStorageJSONLink;
    FDStanStorageBinLink1: TFDStanStorageBinLink;
    MemTableOrders: TFDMemTable;
    MemTableOrderscode_order: TFDAutoIncField;
    MemTableOrdersdate_order: TSQLTimeStampField;
    MemTableOrderscode_client: TIntegerField;
    MemTableOrdersvalueorder: TFMTBCDField;
    MemTableOrdersname_client: TStringField;
    MemTableOrdersaddress_client: TStringField;
    MemTableOrdersphone_client: TStringField;
    MemTableOrdersemail_client: TStringField;
    MemTableOrdersvalue_order: TFMTBCDField;
    MemTableOrders_Items: TFDMemTable;
    MemTableOrders_Itemscode_item: TIntegerField;
    MemTableOrders_Itemsamount_order_item: TFMTBCDField;
    MemTableOrders_Itemsunitprice_order_item: TFMTBCDField;
    MemTableOrders_Itemsvalue_item: TFMTBCDField;
    MemTableOrders_Itemsname_item: TStringField;
    MemTableOrders_Itemsdescription_item: TStringField;
    MemTableOrders_Itemscode_order_item: TAutoIncField;
    MemTableOrders_Itemscode_order: TIntegerField;
    MemTableItems: TFDMemTable;
    MemTableItemscode_item: TFDAutoIncField;
    MemTableItemsname_item: TStringField;
    MemTableItemsdescription_item: TStringField;
    MemTableItemsprice_item: TFMTBCDField;
    frxDBDatasetReportOrders: TfrxDBDataset;
    MemTableReportOrders: TFDMemTable;
    MemTableReportOrderscode_order: TFDAutoIncField;
    MemTableReportOrdersdate_order: TSQLTimeStampField;
    MemTableReportOrderscode_client: TIntegerField;
    MemTableReportOrdersname_client: TStringField;
    MemTableReportOrdersphone_client: TStringField;
    MemTableReportOrdersemail_client: TStringField;
    MemTableReportOrderscode_item: TIntegerField;
    MemTableReportOrdersname_item: TStringField;
    MemTableReportOrdersamount_order_item: TFMTBCDField;
    MemTableReportOrdersunitprice_order_item: TFMTBCDField;
    MemTableReportOrdersvalueorder: TFMTBCDField;
    MemTableReportOrderstotalorder: TFMTBCDField;
    frxReportOrders: TfrxReport;
  private
    { Private declarations }

    FInstanceOwner: Boolean;
    FServerMethods1Client: TServerMethodsOSClient;
    function GetServerMethods1Client: TServerMethodsOSClient;
public
    { Public declarations }
    //Orders
    procedure LoadOrders(const pIDCodeOrder: string; const pLimit: string; pDateI: String; pDateF: String);
    procedure LoadOrders_Items(const pIDCodeOrder: string; const pLimit: string);

    //Items
    procedure LoadItems(const pIDCodeItem: string; const pLimit: string);
    procedure PersistItem(pObjItem : TItem);

    //ReportOrders
    procedure LoadReportOrders(const pIDCodeClient: string; pDateI: string; pDateF: string);

    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    property InstanceOwner: Boolean read FInstanceOwner write FInstanceOwner;
    property ServerMethods1Client: TServerMethodsOSClient read GetServerMethods1Client write FServerMethods1Client;
  end;

var
  DMConnection: TDMConnection;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDMConnection }

constructor TDMConnection.Create(AOwner: TComponent);
begin
  inherited;
  FInstanceOwner := True;
end;

destructor TDMConnection.Destroy;
begin
  FServerMethods1Client.Free;
  inherited;
end;

function TDMConnection.GetServerMethods1Client: TServerMethodsOSClient;
begin
  if FServerMethods1Client = nil then
    FServerMethods1Client:= TServerMethodsOSClient.Create(DSRestConnectionOS, FInstanceOwner);
  Result := FServerMethods1Client;
end;

procedure TDMConnection.LoadItems(const pIDCodeItem, pLimit: string);
var LDataSetList: TFDJSONDataSets;
begin
  LDataSetList := ServerMethods1Client.GetItems(pIDCodeItem, pLimit);

  MemTableItems.Close;
  MemTableItems.AppendData(TFDJSONDataSetsReader.GetListValue(LDataSetList, 0));
  MemTableItems.Open;
end;

procedure TDMConnection.LoadOrders(const pIDCodeOrder, pLimit: string; pDateI: String; pDateF: String);
var LDataSetList: TFDJSONDataSets;
begin
  LDataSetList := ServerMethods1Client.GetOrders(pIDCodeOrder, pLimit, pDateI, pDateF);

  MemTableOrders.Close;
  MemTableOrders.AppendData(TFDJSONDataSetsReader.GetListValue(LDataSetList, 0));
  MemTableOrders.Open;
end;

procedure TDMConnection.LoadOrders_Items(const pIDCodeOrder, pLimit: string);
var LDataSetList: TFDJSONDataSets;
begin
  LDataSetList := ServerMethods1Client.GetOrders_Items(pIDCodeOrder, pLimit);

  MemTableOrders_Items.Close;
  MemTableOrders_Items.AppendData(TFDJSONDataSetsReader.GetListValue(LDataSetList, 0));
  MemTableOrders_Items.Open;
end;

procedure TDMConnection.LoadReportOrders(const pIDCodeClient: string; pDateI,
  pDateF: string);
var LDataSetList: TFDJSONDataSets;
begin
  LDataSetList := ServerMethods1Client.GetReportOrders(pIDCodeClient, pDateI, pDateF);

  MemTableReportOrders.Close;
  MemTableReportOrders.AppendData(TFDJSONDataSetsReader.GetListValue(LDataSetList, 0));
  MemTableReportOrders.Open;
end;

procedure TDMConnection.PersistItem(pObjItem: TItem);
var jObjectPessoa : TJSONObject;
begin
  jObjectPessoa := TJson.ObjectToJsonObject(pObjItem);
  ServerMethods1Client.PersistenceItem(jObjectPessoa);
end;

end.
