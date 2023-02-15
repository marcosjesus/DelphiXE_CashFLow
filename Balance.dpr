program Balance;

uses
  Vcl.Forms,
  uFrmPrincipal in 'uFrmPrincipal.pas' {frmPrincipal},
  uFunctions in 'uFunctions.pas',
  uFrmLogin in 'uFrmLogin.pas' {FrmLogin},
  uDados in 'uDados.pas' {Dados: TDataModule},
  MensFun in 'MensFun.pas' {scrErro};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TDados, Dados);
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TscrErro, scrErro);
  Application.Run;
end.
