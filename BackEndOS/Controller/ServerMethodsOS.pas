unit ServerMethodsOS;

interface

uses System.SysUtils, System.Classes, System.Json,
     Datasnap.DSServer, Datasnap.DSAuth, DataSnap.DSProviderDataModuleAdapter,
     FireDAC.Stan.StorageBin, FireDAC.Stan.StorageJSON, Data.FireDACJSONReflect,
     Rest.JSON, UClassItem;
type
{$METHODINFO ON}
  TServerMethodsOS = class(TDataModule)
    FDStanStorageJSONLink1: TFDStanStorageJSONLink;
    FDStanStorageBinLink1: TFDStanStorageBinLink;
  private
    { Private declarations }
    //Orders
    procedure PrepareOrders(const pIDCodeOrder: String=''; const pLimit: String='');
    procedure PrepareOrders_Items(const pIDCodeOrder: String=''; const pLimit: String='');

    //Items
    procedure PrepareItems(const pIDCodeItem: String=''; const pLimit: String='');
    procedure InsertItem(const oItem: TItem);
    procedure UpdateItem(const oItem: TItem);
    procedure DeleteItem(const oItem: TItem);

  public
    { Public declarations }

    //Orders
    function GetOrders(const pIDCodeOrder: String; const pLimit: String): TFDJSONDataSets;
    function GetOrders_Items(const pIDCodeOrder: String; const pLimit: String): TFDJSONDataSets;

    //Items
    function GetItems(const pIDCodeItem: String; const pLimit: String): TFDJSONDataSets;
    procedure PersistenceItem(const jObjectItem: TJSONObject);
  end;
{$METHODINFO OFF}

implementation


{$R *.dfm}


uses UDMOS, UConstants;

function TServerMethodsOS.GetItems(const pIDCodeItem,
  pLimit: String): TFDJSONDataSets;
begin
  PrepareItems(pIDCodeItem, pLimit);

  Result := TFDJSONDataSets.Create;
  TFDJSONDataSetsWriter.ListAdd(Result, DMOS.OSItems);
end;

function TServerMethodsOS.GetOrders(const pIDCodeOrder: String;
  const pLimit: String): TFDJSONDataSets;
begin
  PrepareOrders(pIDCodeOrder, pLimit);

  Result := TFDJSONDataSets.Create;
  TFDJSONDataSetsWriter.ListAdd(Result, DMOS.OSOrders);
end;


function TServerMethodsOS.GetOrders_Items(const pIDCodeOrder,
  pLimit: String): TFDJSONDataSets;
begin
  PrepareOrders_Items(pIDCodeOrder, pLimit);

  Result := TFDJSONDataSets.Create;
  TFDJSONDataSetsWriter.ListAdd(Result, DMOS.OSOrders_Items);
end;

procedure TServerMethodsOS.PersistenceItem(const jObjectItem: TJSONObject);
var oItem: TItem;
begin
  try
    oItem := TJson.JsonToObject<TItem>(jObjectItem);

    DMOS.OSConnection.StartTransaction;
    try
      case oItem.Action of
         acInclude: InsertItem(oItem);
         acAlter  : UpdateItem(oItem);
         acDelete : DeleteItem(oItem);
      end;

      DMOS.OSConnection.Commit;
    except
      on E: Exception do
      begin
        DMOS.OSConnection.Rollback;
        raise Exception.Create('There was a problem recording. Contact Support.'+cEOL+
                               'Error Message: ' + E.Message);
      end;
    end;
  finally
    FreeAndNil(oItem);
  end;
end;

procedure TServerMethodsOS.PrepareItems(const pIDCodeItem, pLimit: String);
var sSQL, sLimit, sIDCodeItem: string;
begin
  sLimit := pLimit;
  sIDCodeItem := pIDCodeItem;

  if not sLimit.IsEmpty then
     sLimit := 'TOP ('+sLimit+')'
  else
     sLimit := '';

  if not sIDCodeItem.IsEmpty then
     sIDCodeItem := 'WHERE a.[code_item] = '+sIDCodeItem
  else
     sIDCodeItem := '';


  sSQL := 'SELECT '+sLimit+' a.[code_item] '+
          ' ,a.[name_item]         '+
          ' ,a.[description_item]  '+
          ' ,a.[price_item]        '+
          'FROM [dbo].[tab_item] a '+
          sIDCodeItem+
          ' ORDER BY a.[code_item] ';

  DMOS.OSItems.Active   := False;
  DMOS.OSItems.SQL.Text := sSQL;
end;

procedure TServerMethodsOS.PrepareOrders(const pIDCodeOrder, pLimit: String);
var sSQL, sLimit, sIDCodeOrder: string;
begin
  sLimit := pLimit;
  sIDCodeOrder := pIDCodeOrder;

  if not sLimit.IsEmpty then
     sLimit := 'TOP ('+sLimit+')'
  else
     sLimit := '';

  if not sIDCodeOrder.IsEmpty then
     sIDCodeOrder := 'WHERE a.[code_order] = '+sIDCodeOrder
  else
     sIDCodeOrder := '';


  sSQL := 'SELECT '+sLimit+' a.[code_order] '+
          ' ,a.[date_order]      '+
          ' ,a.[code_client]     '+
          ' ,b.[name_client]     '+
          ' ,b.[address_client]  '+
          ' ,b.[phone_client]    '+
          ' ,b.[email_client]    '+
          ' ,a.[value_order]     '+
          ' ,dbo.fn_get_total_value_ordered(a.[code_order]) as valueorder '+
          'FROM [dbo].[tab_orders] a '+
          'INNER JOIN [dbo].[tab_clients] b ON b.code_client = a.code_client '+
          sIDCodeOrder+
          ' ORDER BY a.[code_order] ';

  DMOS.OSOrders.Active   := False;
  DMOS.OSOrders.SQL.Text := sSQL;
end;

procedure TServerMethodsOS.PrepareOrders_Items(const pIDCodeOrder,  pLimit: String);
var sSQL, sLimit, sIDCodeOrder: string;
begin
  sLimit := pLimit;
  sIDCodeOrder := pIDCodeOrder;

  if not sLimit.IsEmpty then
     sLimit := 'TOP ('+sLimit+')'
  else
     sLimit := '';

  if not sIDCodeOrder.IsEmpty then
     sIDCodeOrder := 'WHERE a.[code_order] = '+sIDCodeOrder
  else
     sIDCodeOrder := '';


  sSQL := 'SELECT '+sLimit+' a.[code_order_item] '+
          ',a.[code_order]                                 '+
          ',a.[code_item]                                  '+
          ',a.[amount_order_item]                          '+
          ',a.[unitprice_order_item]                       '+
          ',a.[amount_order_item] * a.[unitprice_order_item] as value_item '+
          ',b.[name_item]                                                  '+
          ',b.[description_item]                                           '+
          'FROM [dbo].[tab_order_item] a                                   '+
          'INNER JOIN [dbo].[tab_item] b ON b.[code_item] = a.[code_item]  '+
          sIDCodeOrder+
          ' ORDER BY a.[code_item] ';

  DMOS.OSOrders_Items.Active   := False;
  DMOS.OSOrders_Items.SQL.Text := sSQL;
end;

procedure TServerMethodsOS.InsertItem(const oItem: TItem);
var sSQL: String;
begin
  sSQL := 'INSERT INTO [dbo].[tab_item] ([name_item], [description_item], [price_item]) '+
          ' VALUES ('+QuotedStr(oItem.name_item)         +', '+
                      QuotedStr(oItem.description_item)  +', '+
                      FloatToStr(oItem.price_item)       +') ';
  DMOS.OSConnection.ExecSQL(sSQL);
end;

procedure TServerMethodsOS.UpdateItem(const oItem: TItem);
var sSQL: String;
begin
  sSQL := 'UPDATE [dbo].[tab_item] SET '+
          ' [name_item]        = '+ QuotedStr(oItem.name_item)        +', '+
          ' [description_item] = '+ QuotedStr(oItem.description_item) +', '+
          ' [price_item]       = '+ FloatToStr(oItem.price_item)      +'  '+
          'WHERE [code_item]  = '+IntToStr(oItem.code_item);
  DMOS.OSConnection.ExecSQL(sSQL);
end;

procedure TServerMethodsOS.DeleteItem(const oItem: TItem);
var sSQL: String;
begin
  sSQL := 'DELETE FROM [dbo].[tab_item] '+
          'WHERE [code_item] = '+IntToStr(oItem.code_item);
  DMOS.OSConnection.ExecSQL(sSQL);
end;

end.

