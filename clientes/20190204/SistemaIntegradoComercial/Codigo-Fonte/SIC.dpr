program SIC;

uses
  Forms,
  frmPrincipal in 'principal\frmPrincipal.pas' {FFrmPrincipal},
  uAtualizarSistema in 'internet\uAtualizarSistema.pas',
  uInternet in 'internet\uInternet.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFFrmPrincipal, FFrmPrincipal);
  Application.Run;
end.
