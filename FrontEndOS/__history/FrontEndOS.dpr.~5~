program FrontEndOS;

uses
  Vcl.Forms,
  UOS in 'View\UOS.pas' {Form2},
  UDataOrder in 'View\UDataOrder.pas' {FDataOrder},
  UViewOrder in 'View\UViewOrder.pas' {FViewOrder},
  UDMConnection in 'Model\UDMConnection.pas' {DMConnection: TDataModule},
  ClientClassesOS in 'Controller\ClientClassesOS.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFOS, FOS);
  Application.CreateForm(TFDataOrder, FDataOrder);
  Application.CreateForm(TFViewOrder, FViewOrder);
  Application.CreateForm(TDMConnection, DMConnection);
  Application.Run;
end.
