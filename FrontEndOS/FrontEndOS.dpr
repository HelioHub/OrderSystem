program FrontEndOS;

uses
  Vcl.Forms,
  UOS in 'View\UOS.pas' {Form2};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFOS, FOS);
  Application.Run;
end.
