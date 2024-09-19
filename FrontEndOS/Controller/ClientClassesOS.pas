//
// Created by the DataSnap proxy generator.
// 19/09/2024 01:09:47
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
  public
    constructor Create(ARestConnection: TDSRestConnection); overload;
    constructor Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    function GetOrders(pIDCodeOrder: string; pLimit: string; const ARequestFilter: string = ''): TFDJSONDataSets;
    function GetOrders_Cache(pIDCodeOrder: string; pLimit: string; const ARequestFilter: string = ''): IDSRestCachedTFDJSONDataSets;
    function GetOrders_Items(pIDCodeOrder: string; pLimit: string; const ARequestFilter: string = ''): TFDJSONDataSets;
    function GetOrders_Items_Cache(pIDCodeOrder: string; pLimit: string; const ARequestFilter: string = ''): IDSRestCachedTFDJSONDataSets;
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
  inherited;
end;

end.

