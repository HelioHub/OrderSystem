program BackEndOS;
{$APPTYPE GUI}

uses
  Vcl.Forms,
  Web.WebReq,
  IdHTTPWebBrokerBridge,
  FormUOS in 'View\FormUOS.pas' {Form1},
  ServerMethodsUOS in 'Controller\ServerMethodsUOS.pas' {ServerMethods1: TDataModule},
  ServerContainerUOS in 'View\ServerContainerUOS.pas' {ServerContainer1: TDataModule},
  WebModuleUOS in 'View\WebModuleUOS.pas' {WebModule1: TWebModule},
  UDMOS in 'Model\UDMOS.pas' {DataModule1: TDataModule};

{$R *.res}

begin
  if WebRequestHandler <> nil then
    WebRequestHandler.WebModuleClass := WebModuleClass;
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TDataModule1, DataModule1);
  Application.Run;
end.
