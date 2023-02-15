unit uMenuPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.RibbonLunaStyleActnCtrls, Vcl.Ribbon,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer,
  cxEdit, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMetropolis, dxSkinMetropolisDark, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinPumpkin, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinTheAsphaltWorld,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, cxLabel, Vcl.ExtCtrls, cxGroupBox, dxRibbonSkins,
  dxSkinsdxRibbonPainter, dxRibbonCustomizationForm, dxSkinsdxBarPainter, cxPC,
  dxSkinscxPCPainter, dxBarBuiltInMenu, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, dxBar,
  dxRibbonRadialMenu, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  dxTabbedMDI, Vcl.ImgList, dxStatusBar, dxRibbonStatusBar, Vcl.Grids,
  Vcl.ValEdit, cxTextEdit, cxMaskEdit, cxScrollBox, dxGallery, dxGalleryControl,
  dxRibbonBackstageViewGalleryControl, dxBevel, dxRibbonBackstageView,
  cxClasses, dxRibbon, cxFormats, dxGDIPlusClasses,  cxGridExportLink;

type
  TfrmMenuPrincipal = class(TForm)
    dxRibbon: TdxRibbon;
    dxRibbonTabSIOP: TdxRibbonTab;
    dxRibbonStatusBar: TdxRibbonStatusBar;
    dxBarManager: TdxBarManager;
    dxBarManagerBarBarraAcessoRapido: TdxBar;
    dxBarManagerBarSIOPRelatorio: TdxBar;
    dxBarManagerBarCargaMaquinaPainel: TdxBar;
    dxBarManagerBarCargaMaquinaCadastro: TdxBar;
    dxBarManagerBarAdministrativoCadastro: TdxBar;
    dxBarManagerBarSIOPCadastros: TdxBar;
    dxBarManagerBarCargaMaquinaRelatorio: TdxBar;
    dxBarManagerBarEngenhariaRelatorio: TdxBar;
    dxBarManagerBarDetranProcessamento: TdxBar;
    dxBarManagerBarCSConsulta: TdxBar;
    dxBarManagerBarInovarCadastro: TdxBar;
    dxBarManagerBarInovarConsulta: TdxBar;
    dxBarManagerBarIQFCadastro: TdxBar;
    dxBarManagerBarIQFImportacao: TdxBar;
    dxBarManagerBarIQFRelatorio: TdxBar;
    dxBarManagerBarGrossMarginImportacao: TdxBar;
    dxBarManagerBarGrossMarginRelatorios: TdxBar;
    dxBarManagerBarProdutoSeton: TdxBar;
    dxBarManagerBarUploadProdutoSeton: TdxBar;
    dxBarManagerBarMarketing: TdxBar;
    dxBarManagerBarParametros: TdxBar;
    dxBarButton1: TdxBarButton;
    dxBarSubItem1: TdxBarSubItem;
    dxBarButtonProdutoSeton: TdxBarButton;
    dxBarButtonUploadProdutoSeton: TdxBarButton;
    dxBarButtonSetonForecast: TdxBarButton;
    dxBarSubItem2: TdxBarSubItem;
    dxBarButtonSIOPCadastroCliente: TdxBarButton;
    dxBarButton3: TdxBarButton;
    dxBarButton4: TdxBarButton;
    dxBarButtonEditorEmail: TdxBarButton;
    dxBarLargeEditorEmail: TdxBarLargeButton;
    dxBarButton6: TdxBarButton;
    dxBarButtonIQFCadastroMeta: TdxBarButton;
    dxBarButton5: TdxBarButton;
    dxBarLargeButton1: TdxBarLargeButton;
    dxBarLargeButton2: TdxBarLargeButton;
    dxBarButton7: TdxBarButton;
    dxBarLargeButtonMKTConfig: TdxBarLargeButton;
    dxBarLargeButtonMKTLista: TdxBarLargeButton;
    dxBarButtonCategoria: TdxBarButton;
    dxBarButton8: TdxBarButton;
    dxBarLargeButtonUploadDistribuidores: TdxBarLargeButton;
    dxBarButton9: TdxBarButton;
    dxBarLargeButtonVerPrecoSite: TdxBarLargeButton;
    dxBarButtonBarraAcessoRapidoSalvar: TdxBarButton;
    dxBarButtonBarraAcessoRapidoExcluir: TdxBarButton;
    dxBarButtonBarraAcessoRapidoNovo: TdxBarButton;
    dxBarButtonSIOPCadastroSiteDePara: TdxBarButton;
    dxBarButtonSIOPCadastroCanalDePara: TdxBarButton;
    dxBarButtonSIOPCadastroFamilia: TdxBarButton;
    dxBarButtonSIOPCadastroFamiliaDePara: TdxBarButton;
    dxBarButtonSIOPCadastroGrupoCliente: TdxBarButton;
    dxBarButtonSIOPCadastroGrupoClienteDePara: TdxBarButton;
    dxBarButtonSIOPCadastroRepresentante: TdxBarButton;
    dxBarButtonClientes: TdxBarButton;
    dxBarButtonSIOPCadastroRepresentanteDePara: TdxBarButton;
    dxBarLargeButtonSIOPRelatoriosTabelaPreco: TdxBarLargeButton;
    dxBarLargeButtonSIOPRelatorioPartNumber: TdxBarLargeButton;
    dxBarLargeButtonSIOPRelatoriosFaturamentoPedido: TdxBarLargeButton;
    dxBarLargeButtonSIOPRelatoriosVendas: TdxBarLargeButton;
    dxBarLargeButtonSIOPRecuperacaodeContas: TdxBarLargeButton;
    dxBarLargeButtonSIOPGestaoMercado: TdxBarLargeButton;
    dxBarLargeButtonSIOPDashBoard: TdxBarLargeButton;
    dxBarLargeButtonCargaMaquinaPainelOperador: TdxBarLargeButton;
    dxBarLargeButtonCargaMaquinaPainelLiderTambore: TdxBarLargeButton;
    dxBarLargeButtonCargaMaquinaPainelLiderManaus: TdxBarLargeButton;
    dxBarLargeButtonCargaMaquinaPainelYNumber: TdxBarLargeButton;
    dxBarLargeButtonCargaMaquinaCadastroSite: TdxBarButton;
    dxBarLargeButtonCargaMaquinaCadastroCelula: TdxBarButton;
    dxBarLargeButtonCargaMaquinaCadastroMaquina: TdxBarButton;
    dxBarLargeButtonCargaMaquinaCadastroOperador: TdxBarButton;
    dxBarLargeButtonCargaMaquinaCadastroAtividade: TdxBarButton;
    dxBarLargeButtonCargaMaquinaCadastroApontamento: TdxBarButton;
    dxBarLargeButtonCargaMaquinaRelatorioAnaliseApontamento: TdxBarLargeButton;
    dxBarButtonGridToolsLayoutSalvar: TdxBarButton;
    dxBarButtonGridToolsExportarExcel: TdxBarButton;
    dxBarSubItemGridToolsLayout: TdxBarSubItem;
    dxBarSubItemGridToolsExportar: TdxBarSubItem;
    dxBarButtonGridToolsLayoutColunaCaption: TdxBarButton;
    dxBarLargeButtonEngenhariaRelatorioUtilizacaoMaquina: TdxBarLargeButton;
    dxBarLargeButtonDetranProcessamentoGerarListaEtiqueta: TdxBarLargeButton;
    dxBarLargeButtonCSConsultaNotaFiscal: TdxBarLargeButton;
    dxBarButtonInovarCadastroCliente: TdxBarButton;
    dxBarButtonInovarCadastroCFOP: TdxBarButton;
    dxBarButtonInovarCadastroParcelaDedutivel: TdxBarButton;
    dxBarButtonInovarConsultaParcelaDedutivel: TdxBarButton;
    dxBarButtonInovarCadastroNotaFiscal: TdxBarButton;
    dxBarButtonIQFCadastroParametros: TdxBarButton;
    dxBarButtonIQFCadastroForncedor: TdxBarButton;
    dxBarButtonIQFCadastroPeriodo: TdxBarButton;
    dxBarButtonIQFImportacaoImportar: TdxBarButton;
    dxBarLargeButtonIQFKPI: TdxBarLargeButton;
    dxBarButtonIQFImportacaoFornecedor: TdxBarButton;
    dxBarButtonIQFCadastroRegra: TdxBarButton;
    dxBarButtonGrossMarginImportacaoBOM: TdxBarButton;
    dxBarButtonGrossMarginImportacaoRouting: TdxBarButton;
    dxBarButtonGrossMarginImportacaoCustoEstoque: TdxBarButton;
    dxBarButtonGrossMarginImportacaoTaxasHoras: TdxBarButton;
    dxBarButtonGrossMarginImportacaoCalcularGrossMargin: TdxBarButton;
    dxBarButtonProduto: TdxBarButton;
    cxSmallImages: TcxImageList;
    cxLargeImages: TcxImageList;
    dxTabbedMDIManager: TdxTabbedMDIManager;
    FDQueryTSIS_Menu: TFDQuery;
    FDQueryTSIS_MenuTSIS_MENCOD: TFDAutoIncField;
    FDQueryTSIS_MenuTSIS_MENNOM: TStringField;
    FDQueryTSIS_MenuTSIS_MENOBJ: TStringField;
    SqlAux: TFDQuery;
    dxBarLargeButton3: TdxBarLargeButton;
    dxBarEdit1: TdxBarEdit;
    dxBarLargeButton4: TdxBarLargeButton;
    SaveDialog: TSaveDialog;
    Timer1: TTimer;
    dxBarManagerBar1: TdxBar;
    dxBarLargeButton5: TdxBarLargeButton;
    procedure dxBarLargeButtonSIOPRelatoriosFaturamentoPedidoClick(
      Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure dxBarLargeButton4Click(Sender: TObject);
    procedure dxBarLargeButtonSIOPRelatoriosTabelaPrecoClick(Sender: TObject);
    procedure dxBarLargeButtonSIOPRelatoriosVendasClick(Sender: TObject);
    procedure dxBarLargeButtonSIOPRelatorioPartNumberClick(Sender: TObject);
    procedure dxBarLargeButtonSIOPRecuperacaodeContasClick(Sender: TObject);
    procedure dxBarLargeButtonSIOPGestaoMercadoClick(Sender: TObject);
    procedure dxBarLargeButtonSIOPDashBoardClick(Sender: TObject);
    procedure dxBarLargeButton5Click(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }
    FFormatoBR: TFormatSettings;
  end;

var
  frmMenuPrincipal: TfrmMenuPrincipal;

implementation

{$R *.dfm}

uses ufrmAccount, uDados, uFrmLogin, uFrmPrincipal, MensFun, uFrmCategoria,
  ufrmCentroDeCusto, uImportFile, uFrmAddTransacao;

procedure TfrmMenuPrincipal.dxBarLargeButton4Click(Sender: TObject);
begin
  if not Assigned(FrmLogin) then
    FrmLogin := TFrmLogin.Create(Self) ;
    FrmLogin.Show;
    Dados.varLogado := False;

    FrmLogin.Visible := True;
    FrmLogin.BringToFront;
    FrmLogin.Update;

end;


procedure TfrmMenuPrincipal.dxBarLargeButton5Click(Sender: TObject);
var
  I: Integer;
begin
  for I := 0 to MDIChildCount - 1 do begin
    if MDIChildren[I] is TForm then
    begin
         MDIChildren[I].Close;
    end;
  end;

  dxRibbonStatusBar.Panels[0].Text := '';
  dxRibbonStatusBar.Panels[1].Text := '';
  dxRibbonStatusBar.Panels[2].Text := '';

  Dados.FDConnection.Connected := False;

  Dados.varLogado := False;
  Timer1.Enabled  := True;

end;

procedure TfrmMenuPrincipal.dxBarLargeButtonSIOPDashBoardClick(Sender: TObject);
begin
 if Dados.varLogado = False Then Exit;

 if not Assigned(frmPrincipal) then Exit;

 if ((Dados.BuscaDados = False) or (frmPrincipal.sqlRelat01.IsEmpty)) Then Exit;

  if frmPrincipal.Page.ActivePageIndex = 0 then
  begin
        if frmPrincipal.sqlRelat01.IsEmpty then
            raise Exception.Create('Não há dados para serem exportados ao Excel');

      //  SaveDialog.InitialDir := GetCurrentDir;
        frmPrincipal.Mensagem('Aguarde, Salvando Planilha...');
        if SaveDialog.Execute then
        begin
           Screen.Cursor := crHourGlass;
           ExportGridToExcel(SaveDialog.FileName, frmPrincipal.cxGrid1, True, True);
           frmPrincipal.Mensagem( pChar( 'Planilha exportada em  ' + ExtractFilePath(SaveDialog.FileName) ) );

        end;
        Screen.Cursor := crDefault;
        frmPrincipal.Mensagem( EmptyStr );
  end;
end;

procedure TfrmMenuPrincipal.dxBarLargeButtonSIOPGestaoMercadoClick(
  Sender: TObject);
begin
  if Dados.varLogado = False  then Exit;

  if not Assigned(frmPrincipal) then Exit;


  Try
    Application.CreateForm(TfrmAddTransacao, frmAddTransacao);
    frmAddTransacao.ShowModal;
    if Dados.varBanco = '1' then
      frmPrincipal.RelatorioCentroCustoSQLServer(frmPrincipal.chkForecast.Checked, frmPrincipal.chkBalance.Checked)
    else if Dados.varBanco = '2' then
    begin
      frmPrincipal.RelatorioCentroCustoSQLITE(frmPrincipal.chkForecast.Checked, frmPrincipal.chkBalance.Checked);
    end;

  Finally
    FreeAndNil(frmAddTransacao);
  End;
end;

procedure TfrmMenuPrincipal.dxBarLargeButtonSIOPRecuperacaodeContasClick(
  Sender: TObject);
begin
   if Dados.varLogado = False  then Exit;

  if not Assigned(frmPrincipal) then
    frmPrincipal := TfrmPrincipal.Create(Self);
    frmPrincipal.Show;

    frmPrincipal.Visible := True;
    frmPrincipal.BringToFront;
    frmPrincipal.Update;
end;

procedure TfrmMenuPrincipal.dxBarLargeButtonSIOPRelatorioPartNumberClick(
  Sender: TObject);
begin
  if Dados.varLogado = False  then Exit;

  if not Assigned(frmImportFile) then
    frmImportFile := TfrmImportFile.Create(Self);
    frmImportFile.Show;

    frmImportFile.Visible := True;
    frmImportFile.BringToFront;
    frmImportFile.Update;
end;

procedure TfrmMenuPrincipal.dxBarLargeButtonSIOPRelatoriosFaturamentoPedidoClick(
  Sender: TObject);
begin
  if Dados.varLogado = False  then Exit;

  if not Assigned(FrmAccount) then
    frmAccount := TfrmAccount.Create(Self);
    FrmAccount.Show;

    frmAccount.Visible := True;
    frmAccount.BringToFront;
    frmAccount.Update;
end;

procedure TfrmMenuPrincipal.dxBarLargeButtonSIOPRelatoriosTabelaPrecoClick(
  Sender: TObject);
begin
  if Dados.varLogado = False  then Exit;

 if not Assigned(frmCategoria) then
    frmCategoria := TfrmCategoria.Create(Self);
    frmCategoria.Show;

 frmCategoria.Visible := True;
 frmCategoria.BringToFront;
 frmCategoria.Update;

end;

procedure TfrmMenuPrincipal.dxBarLargeButtonSIOPRelatoriosVendasClick(
  Sender: TObject);
begin
  if Dados.varLogado = False  then Exit;

  if not Assigned(frmCentroDeCusto) then
    frmCentroDeCusto := TfrmCentroDeCusto.Create(Self);
    frmCentroDeCusto.Show;

    frmCentroDeCusto.Visible := True;
    frmCentroDeCusto.BringToFront;
    frmCentroDeCusto.Update;


end;

procedure TfrmMenuPrincipal.Timer1Timer(Sender: TObject);
var
 GVersao : String;
begin

   Timer1.Enabled := False;

   if dados.varLogado = False then
   begin
     Timer1.Enabled := True;
     Exit;
   end;


   Dados.ConectarNoBanco;

   Try
     if not Dados.FDConnection.Connected then
     begin
       Mens_MensErro('Error Connecting Database!');
       Close;
       Exit;
     end;

     SqlAux.Close;
     SqlAux.Sql.Clear;
     SqlAux.SQL.Add('select DESCRIPTION_CONTENT From TBPARAMETERS WHERE DESCRIPTION_VALUE = ''VERSION''' );
     try
         SqlAux.Open;
     Except
       ShowMessage('Deu erro ao ler tabela de parametro');
     End;

     GVersao := SqlAux.FieldByName('DESCRIPTION_CONTENT').AsString;

    {
     If ( GVersao <> FileVersion ) Then
     Begin
         Mens_MensInf('Programa necessita de Atualizacão, clique e aguarde o DOWNLOAD !!') ;
         //Endereco := 'http://www.escsistemas.com.br/ESCGestao' + GVersao + '.exe';
         //shellExecute(Handle, 'Open', PChar(Endereco), nil, nil, sw_shownormal);
         Application.Terminate ;
         Exit ;
     end;
     }
    { frmMenuPrincipal.Enabled := False;

     FrmLogin := TFrmLogin.Create(Self) ;
     FrmLogin.Show;
     {If ( FrmLogin.Showmodal <> mrOk ) Then
     Begin
         FrmLogin.Close;
         Close ;
         Exit ;
     End ;


     frmMenuPrincipal.Enabled := True;
     {
      MainMenu1.Items[0].Caption          := Dados.RetornaMensagem('MEN_MNU_NIVEL_0');
      MainMenu1.Items[0].Items[0].Caption := Dados.RetornaMensagem('MEN_MNU_NIVEL_0_0');
      MainMenu1.Items[0].Items[2].Caption := Dados.RetornaMensagem('MEN_MNU_NIVEL_0_1');
      MainMenu1.Items[0].Items[3].Caption := Dados.RetornaMensagem('MEN_MNU_NIVEL_0_2');
      MainMenu1.Items[0].Items[5].Caption := Dados.RetornaMensagem('MEN_MNU_NIVEL_0_3');

      lblMesAno.Caption    := Dados.RetornaMensagem('MEN_MES_ANO');
      lblTipoMov.Caption   := Dados.RetornaMensagem('MEN_TIPO_TRANSACAO');
      lblPropConta.Caption := Dados.RetornaMensagem('MEN_SELECTBANK');

      StatusBar1.Panels[0].Text := 'User: ' + Dados.varUsuario;
      StatusBar1.Panels[1].Text := 'Region: ' + Dados.varRegiao;
      StatusBar1.Panels[2].Text := 'DB: ' + Dados.FDConnection.Params.Values['Database'];
            }
      dxRibbonStatusBar.Panels[0].Text := 'User: ' + Dados.varUsuario;
      dxRibbonStatusBar.Panels[1].Text := 'Region: ' + Dados.varRegiao;
      dxRibbonStatusBar.Panels[2].Text := 'DB: ' + Dados.FDConnection.Params.Values['Database'];
      dxRibbonStatusBar.Panels[2].Text := BoolToStr(Dados.Connection.Connected);

      FFormatoBR  := TFormatSettings.Create;
      //Dados Somente em Ingles
      if Dados.varRegiao = '1' then
      begin
            FFormatoBR.ThousandSeparator := ',';
            FFormatoBR.DecimalSeparator := '.';
            FFormatoBR.CurrencyDecimals := 2;
            FFormatoBR.DateSeparator := '/';
            FFormatoBR.ShortDateFormat :=  'MM/dd/yyyy';
            FFormatoBR.LongDateFormat :=   'MM/dd/yyyy';
            FFormatoBR.TimeSeparator := ':';
            FFormatoBR.TimeAMString := 'AM';
            FFormatoBR.TimePMString := 'PM';
            FFormatoBR.ShortTimeFormat := 'hh:mm';
            FFormatoBR.LongTimeFormat := 'hh:mm:ss';
            FFormatoBR.CurrencyString := 'U$';
      end
      else if Dados.varRegiao = '2' then
           begin

            FFormatoBR.ThousandSeparator := ',';
            FFormatoBR.DecimalSeparator := '.';
            FFormatoBR.CurrencyDecimals := 2;
            FFormatoBR.DateSeparator := '/';
            FFormatoBR.ShortDateFormat :=  'dd/MM/yyyy';
            FFormatoBR.LongDateFormat :=   'dd/MM/yyyy';
            FFormatoBR.TimeSeparator := ':';
            FFormatoBR.TimeAMString := 'AM';
            FFormatoBR.TimePMString := 'PM';
            FFormatoBR.ShortTimeFormat := 'hh:mm';
            FFormatoBR.LongTimeFormat := 'hh:mm:ss';
            FFormatoBR.CurrencyString := 'R$ ';


           end;

     cxFormatController.BeginUpdate;
     cxFormatController.UseDelphiDateTimeFormats := True;
     // change other settings of the cxFormatController...
     cxFormatController.EndUpdate;
     cxFormatController.GetFormats;
     cxFormatController.NotifyListeners;

     FormatSettings := FFormatoBR;


     //dtDateTrans       := (Now);


     Dados.BuscaCaminhodoArquivo;

   //  FrmLogin.Close;


     if Dados.CheckBank = 0 then
     begin
        Try
          Application.CreateForm(TfrmAccount, frmAccount);
          frmAccount.ShowModal;
          //ListaBancos;
        Finally
          FreeAndNil(FrmAccount);
        End;
     end;

  except
    on E : Exception do
      Mens_MensErro(E.ClassName+' error raised, with message : '+E.Message);
  end;

end;

end.
