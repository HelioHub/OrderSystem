unit UDMOS;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MSSQL,
  FireDAC.ConsoleUI.Wait, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  FireDAC.Stan.StorageBin, FireDAC.Stan.StorageJSON, FireDAC.Phys.IBBase,
  FireDAC.Phys.IB, FireDAC.Comp.UI;

type
  TDMOS = class(TDataModule)
    OSConnection: TFDConnection;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    FDPhysIBDriverLink1: TFDPhysIBDriverLink;
    FDStanStorageJSONLink1: TFDStanStorageJSONLink;
    FDStanStorageBinLink1: TFDStanStorageBinLink;
    OSOrders: TFDQuery;
    OSOrderscode_order: TFDAutoIncField;
    OSOrdersdate_order: TSQLTimeStampField;
    OSOrderscode_client: TIntegerField;
    OSOrdersname_client: TStringField;
    OSOrdersaddress_client: TStringField;
    OSOrdersphone_client: TStringField;
    OSOrdersemail_client: TStringField;
    OSOrdersvalue_order: TFMTBCDField;
    OSOrdersvalueorder: TFMTBCDField;
    OSOrders_Items: TFDQuery;
    OSOrders_Itemscode_order_item: TFDAutoIncField;
    OSOrders_Itemscode_item: TIntegerField;
    OSOrders_Itemsamount_order_item: TFMTBCDField;
    OSOrders_Itemsunitprice_order_item: TFMTBCDField;
    OSOrders_Itemsvalue_item: TFMTBCDField;
    OSOrders_Itemsname_item: TStringField;
    OSOrders_Itemsdescription_item: TStringField;
    OSOrders_Itemscode_order: TIntegerField;
    OSItems: TFDQuery;
    OSItemscode_item: TFDAutoIncField;
    OSItemsname_item: TStringField;
    OSItemsdescription_item: TStringField;
    OSItemsprice_item: TFMTBCDField;
    OSReportOrders: TFDQuery;
    OSReportOrderscode_order: TFDAutoIncField;
    OSReportOrdersdate_order: TSQLTimeStampField;
    OSReportOrderscode_client: TIntegerField;
    OSReportOrdersname_client: TStringField;
    OSReportOrdersphone_client: TStringField;
    OSReportOrdersemail_client: TStringField;
    OSReportOrderscode_item: TIntegerField;
    OSReportOrdersname_item: TStringField;
    OSReportOrdersamount_order_item: TFMTBCDField;
    OSReportOrdersunitprice_order_item: TFMTBCDField;
    OSReportOrdersvalueorder: TFMTBCDField;
    OSReportOrderstotalorder: TFMTBCDField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMOS: TDMOS;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
