//
// Created by the DataSnap proxy generator.
// 20/09/2024 10:45:52
//

unit ClientClassesOS;

interface

uses System.JSON, Datasnap.DSProxyRest, Datasnap.DSClientRest, Data.DBXCommon, Data.DBXClient, Data.DBXDataSnap, Data.DBXJSON, Datasnap.DSProxy, System.Classes, System.SysUtils, Data.DB, Data.SqlExpr, Data.DBXDBReaders, Data.DBXCDSReaders, Data.FireDACJSONReflect, Data.DBXJSONReflect;

type

  IDSRestCachedTFDJSONDataSets = interface;

  TServerMethodsOSClient = class(TDSAdminRestClient)
  private
    FGetOrdersCommand: TDSRestCommand;
    FGetOrdersCommand_Cache: TDSRestCommand;
    FGetOrders_ItemsCommand: TDSRestCommand;
    FGetOrders_ItemsCommand_Cache: TDSRestCommand;
    FGetItemsCommand: TDSRestCommand;
    FGetItemsCommand_Cache: TDSRestCommand;
    FPersistenceItemCommand: TDSRestCommand;
    FGetReportOrdersCommand: TDSRestCommand;
    FGetReportOrdersCommand_Cache: TDSRestCommand;
  public
    constructor Create(ARestConnection: TDSRestConnection); overload;
    constructor Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    function GetOrders(pIDCodeOrder: string; pLimit: string; const ARequestFilter: string = ''): TFDJSONDataSets;
    function GetOrders_Cache(pIDCodeOrder: string; pLimit: string; const ARequestFilter: string = ''): IDSRestCachedTFDJSONDataSets;
    function GetOrders_Items(pIDCodeOrder: string; pLimit: string; const ARequestFilter: string = ''): TFDJSONDataSets;
    function GetOrders_Items_Cache(pIDCodeOrder: string; pLimit: string; const ARequestFilter: string = ''): IDSRestCachedTFDJSONDataSets;
    function GetItems(pIDCodeItem: string; pLimit: string; const ARequestFilter: string = ''): TFDJSONDataSets;
    function GetItems_Cache(pIDCodeItem: string; pLimit: string; const ARequestFilter: string = ''): IDSRestCachedTFDJSONDataSets;
    procedure PersistenceItem(jObjectItem: TJSONObject);
    function GetReportOrders(pIDCodeClient: string; pDateI: string; pDateF: string; const ARequestFilter: string = ''): TFDJSONDataSets;
    function GetReportOrders_Cache(pIDCodeClient: string; pDateI: string; pDateF: string; const ARequestFilter: string = ''): IDSRestCachedTFDJSONDataSets;
  end;

  IDSRestCachedTFDJSONDataSets = interface(IDSRestCachedObject<TFDJSONDataSets>)
  end;

  TDSRestCachedTFDJSONDataSets = class(TDSRestCachedObject<TFDJSONDataSets>, IDSRestCachedTFDJSONDataSets, IDSRestCachedCommand)
  end;

const
  TServerMethodsOS_GetOrders: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'pIDCodeOrder'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'pLimit'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TFDJSONDataSets')
  );

  TServerMethodsOS_GetOrders_Cache: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'pIDCodeOrder'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'pLimit'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerMethodsOS_GetOrders_Items: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'pIDCodeOrder'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'pLimit'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TFDJSONDataSets')
  );

  TServerMethodsOS_GetOrders_Items_Cache: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'pIDCodeOrder'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'pLimit'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerMethodsOS_GetItems: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'pIDCodeItem'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'pLimit'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TFDJSONDataSets')
  );

  TServerMethodsOS_GetItems_Cache: array [0..2] of TDSRestParameterMetaData =
  (
    (Name: 'pIDCodeItem'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'pLimit'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TServerMethodsOS_PersistenceItem: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: 'jObjectItem'; Direction: 1; DBXType: 37; TypeName: 'TJSONObject')
  );

  TServerMethodsOS_GetReportOrders: array [0..3] of TDSRestParameterMetaData =
  (
    (Name: 'pIDCodeClient'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'pDateI'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'pDateF'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TFDJSONDataSets')
  );

  TServerMethodsOS_GetReportOrders_Cache: array [0..3] of TDSRestParameterMetaData =
  (
    (Name: 'pIDCodeClient'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'pDateI'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'pDateF'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

implementation

function TServerMethodsOSClient.GetOrders(pIDCodeOrder: string; pLimit: string; const ARequestFilter: string): TFDJSONDataSets;
begin
  if FGetOrdersCommand = nil then
  begin
    FGetOrdersCommand := FConnection.CreateCommand;
    FGetOrdersCommand.RequestType := 'GET';
    FGetOrdersCommand.Text := 'TServerMethodsOS.GetOrders';
    FGetOrdersCommand.Prepare(TServerMethodsOS_GetOrders);
  end;
  FGetOrdersCommand.Parameters[0].Value.SetWideString(pIDCodeOrder);
  FGetOrdersCommand.Parameters[1].Value.SetWideString(pLimit);
  FGetOrdersCommand.Execute(ARequestFilter);
  if not FGetOrdersCommand.Parameters[2].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FGetOrdersCommand.Parameters[2].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TFDJSONDataSets(FUnMarshal.UnMarshal(FGetOrdersCommand.Parameters[2].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FGetOrdersCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TServerMethodsOSClient.GetOrders_Cache(pIDCodeOrder: string; pLimit: string; const ARequestFilter: string): IDSRestCachedTFDJSONDataSets;
begin
  if FGetOrdersCommand_Cache = nil then
  begin
    FGetOrdersCommand_Cache := FConnection.CreateCommand;
    FGetOrdersCommand_Cache.RequestType := 'GET';
    FGetOrdersCommand_Cache.Text := 'TServerMethodsOS.GetOrders';
    FGetOrdersCommand_Cache.Prepare(TServerMethodsOS_GetOrders_Cache);
  end;
  FGetOrdersCommand_Cache.Parameters[0].Value.SetWideString(pIDCodeOrder);
  FGetOrdersCommand_Cache.Parameters[1].Value.SetWideString(pLimit);
  FGetOrdersCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTFDJSONDataSets.Create(FGetOrdersCommand_Cache.Parameters[2].Value.GetString);
end;

function TServerMethodsOSClient.GetOrders_Items(pIDCodeOrder: string; pLimit: string; const ARequestFilter: string): TFDJSONDataSets;
begin
  if FGetOrders_ItemsCommand = nil then
  begin
    FGetOrders_ItemsCommand := FConnection.CreateCommand;
    FGetOrders_ItemsCommand.RequestType := 'GET';
    FGetOrders_ItemsCommand.Text := 'TServerMethodsOS.GetOrders_Items';
    FGetOrders_ItemsCommand.Prepare(TServerMethodsOS_GetOrders_Items);
  end;
  FGetOrders_ItemsCommand.Parameters[0].Value.SetWideString(pIDCodeOrder);
  FGetOrders_ItemsCommand.Parameters[1].Value.SetWideString(pLimit);
  FGetOrders_ItemsCommand.Execute(ARequestFilter);
  if not FGetOrders_ItemsCommand.Parameters[2].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FGetOrders_ItemsCommand.Parameters[2].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TFDJSONDataSets(FUnMarshal.UnMarshal(FGetOrders_ItemsCommand.Parameters[2].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FGetOrders_ItemsCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TServerMethodsOSClient.GetOrders_Items_Cache(pIDCodeOrder: string; pLimit: string; const ARequestFilter: string): IDSRestCachedTFDJSONDataSets;
begin
  if FGetOrders_ItemsCommand_Cache = nil then
  begin
    FGetOrders_ItemsCommand_Cache := FConnection.CreateCommand;
    FGetOrders_ItemsCommand_Cache.RequestType := 'GET';
    FGetOrders_ItemsCommand_Cache.Text := 'TServerMethodsOS.GetOrders_Items';
    FGetOrders_ItemsCommand_Cache.Prepare(TServerMethodsOS_GetOrders_Items_Cache);
  end;
  FGetOrders_ItemsCommand_Cache.Parameters[0].Value.SetWideString(pIDCodeOrder);
  FGetOrders_ItemsCommand_Cache.Parameters[1].Value.SetWideString(pLimit);
  FGetOrders_ItemsCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTFDJSONDataSets.Create(FGetOrders_ItemsCommand_Cache.Parameters[2].Value.GetString);
end;

function TServerMethodsOSClient.GetItems(pIDCodeItem: string; pLimit: string; const ARequestFilter: string): TFDJSONDataSets;
begin
  if FGetItemsCommand = nil then
  begin
    FGetItemsCommand := FConnection.CreateCommand;
    FGetItemsCommand.RequestType := 'GET';
    FGetItemsCommand.Text := 'TServerMethodsOS.GetItems';
    FGetItemsCommand.Prepare(TServerMethodsOS_GetItems);
  end;
  FGetItemsCommand.Parameters[0].Value.SetWideString(pIDCodeItem);
  FGetItemsCommand.Parameters[1].Value.SetWideString(pLimit);
  FGetItemsCommand.Execute(ARequestFilter);
  if not FGetItemsCommand.Parameters[2].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FGetItemsCommand.Parameters[2].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TFDJSONDataSets(FUnMarshal.UnMarshal(FGetItemsCommand.Parameters[2].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FGetItemsCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TServerMethodsOSClient.GetItems_Cache(pIDCodeItem: string; pLimit: string; const ARequestFilter: string): IDSRestCachedTFDJSONDataSets;
begin
  if FGetItemsCommand_Cache = nil then
  begin
    FGetItemsCommand_Cache := FConnection.CreateCommand;
    FGetItemsCommand_Cache.RequestType := 'GET';
    FGetItemsCommand_Cache.Text := 'TServerMethodsOS.GetItems';
    FGetItemsCommand_Cache.Prepare(TServerMethodsOS_GetItems_Cache);
  end;
  FGetItemsCommand_Cache.Parameters[0].Value.SetWideString(pIDCodeItem);
  FGetItemsCommand_Cache.Parameters[1].Value.SetWideString(pLimit);
  FGetItemsCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTFDJSONDataSets.Create(FGetItemsCommand_Cache.Parameters[2].Value.GetString);
end;

procedure TServerMethodsOSClient.PersistenceItem(jObjectItem: TJSONObject);
begin
  if FPersistenceItemCommand = nil then
  begin
    FPersistenceItemCommand := FConnection.CreateCommand;
    FPersistenceItemCommand.RequestType := 'POST';
    FPersistenceItemCommand.Text := 'TServerMethodsOS."PersistenceItem"';
    FPersistenceItemCommand.Prepare(TServerMethodsOS_PersistenceItem);
  end;
  FPersistenceItemCommand.Parameters[0].Value.SetJSONValue(jObjectItem, FInstanceOwner);
  FPersistenceItemCommand.Execute;
end;

function TServerMethodsOSClient.GetReportOrders(pIDCodeClient: string; pDateI: string; pDateF: string; const ARequestFilter: string): TFDJSONDataSets;
begin
  if FGetReportOrdersCommand = nil then
  begin
    FGetReportOrdersCommand := FConnection.CreateCommand;
    FGetReportOrdersCommand.RequestType := 'GET';
    FGetReportOrdersCommand.Text := 'TServerMethodsOS.GetReportOrders';
    FGetReportOrdersCommand.Prepare(TServerMethodsOS_GetReportOrders);
  end;
  FGetReportOrdersCommand.Parameters[0].Value.SetWideString(pIDCodeClient);
  FGetReportOrdersCommand.Parameters[1].Value.SetWideString(pDateI);
  FGetReportOrdersCommand.Parameters[2].Value.SetWideString(pDateF);
  FGetReportOrdersCommand.Execute(ARequestFilter);
  if not FGetReportOrdersCommand.Parameters[3].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FGetReportOrdersCommand.Parameters[3].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TFDJSONDataSets(FUnMarshal.UnMarshal(FGetReportOrdersCommand.Parameters[3].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FGetReportOrdersCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TServerMethodsOSClient.GetReportOrders_Cache(pIDCodeClient: string; pDateI: string; pDateF: string; const ARequestFilter: string): IDSRestCachedTFDJSONDataSets;
begin
  if FGetReportOrdersCommand_Cache = nil then
  begin
    FGetReportOrdersCommand_Cache := FConnection.CreateCommand;
    FGetReportOrdersCommand_Cache.RequestType := 'GET';
    FGetReportOrdersCommand_Cache.Text := 'TServerMethodsOS.GetReportOrders';
    FGetReportOrdersCommand_Cache.Prepare(TServerMethodsOS_GetReportOrders_Cache);
  end;
  FGetReportOrdersCommand_Cache.Parameters[0].Value.SetWideString(pIDCodeClient);
  FGetReportOrdersCommand_Cache.Parameters[1].Value.SetWideString(pDateI);
  FGetReportOrdersCommand_Cache.Parameters[2].Value.SetWideString(pDateF);
  FGetReportOrdersCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTFDJSONDataSets.Create(FGetReportOrdersCommand_Cache.Parameters[3].Value.GetString);
end;

constructor TServerMethodsOSClient.Create(ARestConnection: TDSRestConnection);
begin
  inherited Create(ARestConnection);
end;

constructor TServerMethodsOSClient.Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean);
begin
  inherited Create(ARestConnection, AInstanceOwner);
end;

destructor TServerMethodsOSClient.Destroy;
begin
  FGetOrdersCommand.DisposeOf;
  FGetOrdersCommand_Cache.DisposeOf;
  FGetOrders_ItemsCommand.DisposeOf;
  FGetOrders_ItemsCommand_Cache.DisposeOf;
  FGetItemsCommand.DisposeOf;
  FGetItemsCommand_Cache.DisposeOf;
  FPersistenceItemCommand.DisposeOf;
  FGetReportOrdersCommand.DisposeOf;
  FGetReportOrdersCommand_Cache.DisposeOf;
  inherited;
end;

end.

