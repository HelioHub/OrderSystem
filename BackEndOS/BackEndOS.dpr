program BackEndOS;
{$APPTYPE GUI}

uses
  Vcl.Forms,
  Web.WebReq,
  IdHTTPWebBrokerBridge,
  UDMOS in 'Model\UDMOS.pas' {DMOS: TDataModule},
  UServerOS in 'View\UServerOS.pas' {FServerOS},
  ServerMethodsOS in 'Controller\ServerMethodsOS.pas' {ServerMethodsOS: TDataModule},
  ServerContainerOS in 'View\ServerContainerOS.pas' {ServerContainerOS: TDataModule},
  WebModuleOS in 'View\WebModuleOS.pas' {WebModuleOS: TWebModule},
  UConstants in '..\FrontEndOS\UConstants.pas',
  UClassItem in '..\FrontEndOS\Model\UClassItem.pas',
  UnitTest in 'View\UnitTest.pas' {FUnitTest};

{$R *.res}

begin
  if WebRequestHandler <> nil then
    WebRequestHandler.WebModuleClass := WebModuleClass;
  Application.Initialize;
  Application.CreateForm(TDMOS, DMOS);
  Application.CreateForm(TFServerOS, FServerOS);
  Application.Run;
end.
