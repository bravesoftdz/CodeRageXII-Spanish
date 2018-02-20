program Consumidor;

uses
  Vcl.Forms,
  ufrmMain in 'ufrmMain.pas' {frmMain},
  Webservice.Input in 'Webservice.Input.pas',
  Webservice.Interfaces in 'Webservice.Interfaces.pas',
  Webservice.Output in 'Webservice.Output.pas',
  Webservice in 'Webservice.pas',
  Webservice.Request in 'Webservice.Request.pas',
  Webservice.Response in 'Webservice.Response.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
