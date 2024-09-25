program FrontEndOS;

uses
  Vcl.Forms,
  UDataOrder in 'View\UDataOrder.pas' {FDataOrder},
  UViewOrder in 'View\UViewOrder.pas' {FViewOrder},
  UDMConnection in 'Model\UDMConnection.pas' {DMConnection: TDataModule},
  ClientClassesOS in 'Controller\ClientClassesOS.pas',
  UOS in 'View\UOS.pas' {FOS},
  UViewItems in 'View\UViewItems.pas' {FViewItems},
  UDataItems in 'View\UDataItems.pas' {FDataItems},
  UConstants in 'UConstants.pas',
  UClassItem in 'Model\UClassItem.pas',
  UReportOrders in 'View\UReportOrders.pas' {FReportOrders};

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := True;

  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDMConnection, DMConnection);
  Application.CreateForm(TFOS, FOS);
  Application.Run;
end.
