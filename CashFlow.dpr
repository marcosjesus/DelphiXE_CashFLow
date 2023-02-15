program CashFlow;



uses
  Vcl.Forms,
  System.SysUtils,
  IdSSLOpenSSLHeaders,
  uDados in 'uDados.pas' {Dados: TDataModule},
  uFrmLogin in 'uFrmLogin.pas' {FrmLogin},
  uMenuPrincipal in 'uMenuPrincipal.pas' {frmMenuPrincipal},
  ufrmAccount in 'ufrmAccount.pas' {frmAccount},
  uFrmAddTransacao in 'uFrmAddTransacao.pas' {frmAddTransacao},
  uFrmCategoria in 'uFrmCategoria.pas' {frmCategoria},
  ufrmCentroDeCusto in 'ufrmCentroDeCusto.pas' {frmCentroDeCusto},
  ufrmCreateAccount in 'ufrmCreateAccount.pas' {frmCreateAccount},
  uFrmPrincipal in 'uFrmPrincipal.pas' {frmPrincipal},
  uFrmVincularCentroCusto in 'uFrmVincularCentroCusto.pas' {frmVincularCentroCusto},
  uImportFile in 'uImportFile.pas' {frmImportFile};

{$R *.res}

begin
  Application.Initialize;
  IdOpenSSLSetLibPath(ExtractFilePath(Application.ExeName));
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDados, Dados);
  Application.CreateForm(TfrmMenuPrincipal, frmMenuPrincipal);
  //  Application.CreateForm(TfrmAccount, frmAccount);
  // Application.CreateForm(TfrmPrincipal, frmPrincipal);

  Application.Run;
end.
