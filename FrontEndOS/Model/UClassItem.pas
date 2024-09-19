unit UClassItem;

interface

uses UConstants, System.SysUtils;

type
  TItem = class
  private
    Fcode_item: integer;
    Fname_item: String;
    Fdescription_item: String;
    Fprice_item: double;
    FAction: TAction;
    procedure Setname_item(const Value: String);

  protected
  public
    constructor Create;
    destructor Destroy; override;

    property Action           : TAction read FAction           write FAction;
    property code_item        : integer read Fcode_item        write Fcode_item;
    property name_item        : String  read Fname_item        write Setname_item;
    property description_item : String  read Fdescription_item write Fdescription_item;
    property price_item       : double  read Fprice_item       write Fprice_item;
  end;

implementation

{ TItem }

constructor TItem.Create;
begin

end;

destructor TItem.Destroy;
begin

  inherited;
end;

procedure TItem.Setname_item(const Value: String);
begin
  if Value = EmptyStr then
    raise EArgumentException.Create('Name needs to be filled in.');
  Fname_item := Value;
end;

end.
