unit uFrmPrincipal;

interface

uses
  System.DateUtils,
  System.StrUtils,
  ShellAPI,
  cxCurrencyEdit,
  uDados,
  cxFormats,
  cxGridExportLink,
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel,
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
  dxSkinXmas2008Blue, cxTextEdit, cxMaskEdit, cxButtonEdit, Data.DbxSqlite,
  Data.DB, Data.SqlExpr, Data.FMTBcd, Datasnap.Provider, Datasnap.DBClient,
  Vcl.Grids, Vcl.DBGrids, dxSkinscxPCPainter, dxBarBuiltInMenu, cxPC,
  Data.DBXMSSQL, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error,
  FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait, FireDAC.Comp.UI,
  FireDAC.Comp.Client, FireDAC.Phys.ODBCBase, FireDAC.Phys.MSSQL,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet, cxClasses, cxCustomData, cxStyles, cxCustomPivotGrid,
  cxPivotGrid, cxDBPivotGrid, Vcl.ComCtrls, dxCore, cxDateUtils, cxDropDownEdit,
  cxCalendar, cxLabel, cxFilter, cxData, cxDataStorage, cxNavigator, cxDBData,
  cxGridLevel, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridBandedTableView, cxGridDBBandedTableView, cxGrid, Vcl.Menus, cxButtons,
  cxGridDBTableView, VclTee.TeeGDIPlus, VCLTee.TeEngine, VCLTee.Series,
  VCLTee.TeeProcs, VCLTee.Chart, VCLTee.DBChart, Vcl.DBCtrls, dxGDIPlusClasses,
  cxGridChartView, cxGridDBChartView, cxCheckBox, dxSkinsForm;

type
  TfrmPrincipal = class(TForm)
    dsTransacao: TDataSource;
    cdsTransacao: TClientDataSet;
    dspTransacao: TDataSetProvider;
    Page: TcxPageControl;
    sqlTransacao: TFDQuery;
    cdsTransacaoId: TAutoIncField;
    cdsTransacaoTipo: TStringField;
    cdsTransacaoDataTransacao: TDateField;
    cdsTransacaoFavorecido: TStringField;
    cdsTransacaoCategoria: TStringField;
    cdsTransacaoSubCategoria: TStringField;
    cdsTransacaoValor: TBCDField;
    cdsTransacaoDataCriacao: TSQLTimeStampField;
    cdsTransacaoConta: TStringField;
    cdsTransacaoCENTRODECUSTO: TStringField;
    Panel2: TPanel;
    cxGrid1: TcxGrid;
    cxGrid1DBBandedTableView1: TcxGridDBBandedTableView;
    cxGrid1Level1: TcxGridLevel;
    lblPeriodo: TLabel;
    TabDetalhe: TcxTabSheet;
    pnlDetalhe: TPanel;
    cxGridDet: TcxGrid;
    cxGridDetDBTableView1: TcxGridDBTableView;
    cxGridDetLevel1: TcxGridLevel;
    sqlDetalhe: TFDQuery;
    dsDetalhe: TDataSource;
    cxGridDetDBTableView1Favorecido: TcxGridDBColumn;
    cxGridDetDBTableView1Categoria: TcxGridDBColumn;
    cxGridDetDBTableView1SubCategoria: TcxGridDBColumn;
    cxGridDetDBTableView1DataTransacao: TcxGridDBColumn;
    cxGridDetDBTableView1Valor: TcxGridDBColumn;
    cxGridDetDBTableView1mes: TcxGridDBColumn;
    cxGridDetDBTableView1ano: TcxGridDBColumn;
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    Import1: TMenuItem;
    N1: TMenuItem;
    Category1: TMenuItem;
    CostCenter1: TMenuItem;
    N2: TMenuItem;
    User1: TMenuItem;
    N3: TMenuItem;
    Exit1: TMenuItem;
    SqlAux: TFDQuery;
    sqlRelat01: TFDQuery;
    dsRelat01: TDataSource;
    cdsTransacaoID_USER: TIntegerField;
    Timer1: TTimer;
    TabSpend: TcxTabSheet;
    sqlGrafico1: TFDQuery;
    dsGrafico1: TDataSource;
    sqlCentroCusto: TFDQuery;
    dsCentroCusto: TDataSource;
    sqlCentroCustoID_CENTRODECUSTO: TIntegerField;
    sqlCentroCustoCENTRODECUSTO: TStringField;
    sqlItem: TFDQuery;
    dsItem: TDataSource;
    Page2: TcxPageControl;
    cxTabSheet1: TcxTabSheet;
    cxTabSheet2: TcxTabSheet;
    Panel5: TPanel;
    DBChart1: TDBChart;
    Series2: TPieSeries;
    cxGrid2: TcxGrid;
    cxGrid2DBTableView1: TcxGridDBTableView;
    cxGrid2DBTableView1Favorecido: TcxGridDBColumn;
    cxGrid2DBTableView1Unnamed2: TcxGridDBColumn;
    cxGrid2DBTableView1datatransacao: TcxGridDBColumn;
    cxGrid2DBTableView1VALOR: TcxGridDBColumn;
    cxGrid2Level1: TcxGridLevel;
    DBChart2: TDBChart;
    Series1: TBarSeries;
    sqlGraficoBarra: TFDQuery;
    dsGraficoBarra: TDataSource;
    StatusBar1: TStatusBar;
    sqlBank: TFDQuery;
    dsBank: TDataSource;
    Panel3: TPanel;
    lblMesAno: TLabel;
    Panel1: TPanel;
    Panel6: TPanel;
    cxTipo: TcxComboBox;
    SaveDialog: TSaveDialog;
    cxTabSheet3: TcxTabSheet;
    Panel4: TPanel;
    cboMonth: TcxComboBox;
    cxLabel1: TcxLabel;
    DBChart3: TDBChart;
    sqlGraficoWeek: TFDQuery;
    dsGraficoWeek: TDataSource;
    cxLabel2: TcxLabel;
    cboYear: TComboBox;
    sqlGrafIE: TFDQuery;
    dsGrafIE: TDataSource;
    Series3: TBarSeries;
    TabIE: TcxTabSheet;
    TabTransacao: TcxTabSheet;

    Panel7: TPanel;
    cboMonth3: TcxComboBox;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    cboYear3: TComboBox;
    cxGridTMAQ_ApontamentoGrafico01: TcxGrid;
    cxTableViewSEMANA: TcxGridDBChartView;
    cxTableViewSEMANADataGroup1: TcxGridDBChartDataGroup;
    cxTableViewSEMANASeries1: TcxGridDBChartSeries;
    cxTableViewSEMANASeries2: TcxGridDBChartSeries;
    cxGridLevelTMAQ_ApontamentoGrafico01: TcxGridLevel;
    chkForecast: TcxCheckBox;
    chkBalance: TcxCheckBox;
    cboAnoBase: TComboBox;
    cboBank: TComboBox;
    dxSkinController1: TdxSkinController;
    cxLookAndFeelController1: TcxLookAndFeelController;
    sqlItemFavorecido: TStringField;
    sqlItemCategoria: TStringField;
    sqlItemDataTransacao: TDateField;
    sqlItemVALOR: TBCDField;
    lblPropConta: TcxLabel;
    lblTipoMov: TcxLabel;
    sqlGraficoBarraCENTRODECUSTO: TStringField;
    sqlGraficoBarraMES: TIntegerField;
    sqlGraficoBarraANO: TIntegerField;
    sqlGraficoBarraVALOR: TFMTBCDField;
    sqlGraficoWeekCENTRODECUSTO: TStringField;
    sqlGraficoWeekWEEK: TIntegerField;
    sqlGraficoWeekVALOR: TFMTBCDField;
    sqlDetalheId: TFDAutoIncField;
    sqlDetalheFavorecido: TStringField;
    sqlDetalheCategoria: TStringField;
    sqlDetalheSubCategoria: TStringField;
    sqlDetalheDataTransacao: TDateField;
    sqlDetalheValor: TBCDField;
    sqlDetalhemes: TIntegerField;
    sqlDetalheano: TIntegerField;
    sqlGrafico1LEGENDA: TStringField;
    sqlGrafico1VALOR: TFMTBCDField;
    sqlGrafIESEMANA: TIntegerField;
    PanelSQLSplashScreen: TPanel;
    ImageSQLSplashScreen: TImage;
    cxLabelMensagem: TcxLabel;
    procedure cxGrid1DBBandedTableView1CellDblClick(
      Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure Import1Click(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cxGridDetDBTableView1CellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure Timer1Timer(Sender: TObject);
    procedure CostCenter1Click(Sender: TObject);
    procedure Category1Click(Sender: TObject);
    procedure User1Click(Sender: TObject);
    procedure PageChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cboShowMePropertiesChange(Sender: TObject);
    procedure dtDateTransPropertiesChange(Sender: TObject);
    procedure cboCentroCustoCloseUp(Sender: TObject);
    procedure cboMonthPropertiesChange(Sender: TObject);
    procedure cboYearChange(Sender: TObject);
    procedure cboYear3Change(Sender: TObject);
    procedure cxTableViewSEMANACategoriesGetValueDisplayText(Sender: TObject;
      const AValue: Variant; var ADisplayText: string);
    procedure chkForecastClick(Sender: TObject);
    procedure cxTipoPropertiesChange(Sender: TObject);
    procedure cboBankingCloseUp(Sender: TObject);
    procedure chkBalanceClick(Sender: TObject);
    procedure cboMonth3PropertiesChange(Sender: TObject);
    procedure cboAnoBaseChange(Sender: TObject);
    procedure cxGrid1DBBandedTableView1StylesGetContentStyle(
      Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
      AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
    procedure cboBankCloseUp(Sender: TObject);
  private
    idx : Integer;
    dtDateTrans : TDateTime;
    ABand  : TcxGridBand;
    varMesesArrayB, varMesesArrayF, varMesesArrayA : Array of TDateTime;
    varMesAtual, varMesAnterior, varIMes, VarIMesAnterior, VarSum : Array of String;

    varMesesComLabel,
    varMesesComLabelB,
    varMesesComLabelA,
    //varMesesComLabelF,
    varMesesSemLabelB,
    varMesesSemLabelA,

    varMesesSemLabelT,
    varMesesSomaLinha : WideString;


    function BuscaMes(Data: TDateTime; bLabel: Boolean; Alias: String;
      SomarLinha, TotalLinha : Boolean; VersaoBanco : String): String;
    function MontaStringMes(bMostraLabel: Boolean; Alias, Tipo: String;
      SomarL,  TotalL: Boolean): WideString;
    procedure AddColumn;
    procedure GerarGraficoTotal;
    procedure GerarGraficoCC;
    procedure MostraItem;
    procedure MostraGrafBarra;
    procedure GerarGraficoIE(varPeriodo : String);
    procedure ListaBancos;
    { Private declarations }
  public

    FFormatoBR: TFormatSettings;
    { Public declarations }
    procedure Mensagem(pMensagem: String);
    procedure RelatorioCentroCustoSQLServer(Forecast : Boolean = False; Balance : Boolean = False);
    procedure RelatorioCentroCustoSQLITE(Forecast : Boolean = False; Balance : Boolean = False);

  end;

var
  frmPrincipal: TfrmPrincipal;


implementation

{$R *.dfm}

uses uFrmVincularCentroCusto, uImportFile, uFrmLogin, MensFun, uFunctions,
  ufrmCentroDeCusto, uFrmCategoria, uFrmAddTransacao, uFrmAccount;



procedure TfrmPrincipal.Import1Click(Sender: TObject);
begin
   Try
      Application.CreateForm(TfrmImportFile, frmImportFile);
      frmImportFile.ShowModal;
   Finally
      FreeAndNil(frmImportFile);
   End;
end;

procedure TfrmPrincipal.RelatorioCentroCustoSQLITE(Forecast, Balance: Boolean);
begin


 cxGrid1DBBandedTableView1.ClearItems;
 if ABand <> Nil then
 begin
     ABand.Bands.Clear;
 end;

 Try
    Dados.ConectarNoBanco;

    if cboBank.Items.Count > 0 then
       idx := cboBank.ItemIndex;

    varMesesComLabel   := MontaStringMes(True,'','B',False,False);
    varMesesComLabelA  := MontaStringMes(True,'','A',True, False);
    sqlRelat01.Close;
    sqlRelat01.SQL.Clear;

    if Balance then
    begin

      sqlRelat01.SQL.Add(' SELECT  ''R'' AS SOURCE, 0 AS GRUPO,  ''BALANCE'' AS  [Centro de Custo],  ');
      sqlRelat01.SQL.Add( varMesesComLabelA );
      sqlRelat01.SQL.Add(', SUM(COALESCE(VALOR,0)) AS Total ');
      sqlRelat01.SQL.Add(' 	FROM TBTRANSACAO T   ');
      sqlRelat01.SQL.Add('  LEFT OUTER JOIN CENTRODECUSTO CC ON CC.CENTRODECUSTO = T.CENTRODECUSTO and CC.ID_USER = T.ID_USER and  CC.ID_USER =' + IntToStr(Dados.varID_USER) + ' and CC.ID_LANGUAGE = ' + IntToStr(Dados.varID_Language));
      sqlRelat01.SQL.Add(' 	WHERE  1 = 1  ');
      sqlRelat01.SQL.Add(' 	&WHERE6 ');
      sqlRelat01.SQL.Add(' 	&WHERE7 ');
      sqlRelat01.SQL.Add('  &WHERE1  ');
      sqlRelat01.SQL.Add('  &WHERE2  ');
      sqlRelat01.SQL.Add('  &WHERE3  ');
      sqlRelat01.SQL.Add('  AND T.FORECAST = 0 ');

      sqlRelat01.MacroByName( 'WHERE6' ).AsRaw := ' AND T.DATATRANSACAO BETWEEN ' + QuotedStr(FormatDateTime('yyyy-mm-dd',IncMonth(IncMonth(System.DateUtils.StartOfTheMonth(dtDateTrans), +1), -14)));
      sqlRelat01.MacroByName( 'WHERE7' ).AsRaw := ' AND  ' + QuotedStr(FormatDateTime('yyyy-mm-dd',(IncMonth(IncMonth(System.DateUtils.EndOfTheMonth(dtDateTrans), -12), 11))));

      //sqlRelat01.SQL.SaveToFile('C:\BIBanco\Relatorio_BALANCE.sql');

      sqlRelat01.SQL.Add(' UNION ALL ');

    end;

    if Forecast = False then
    begin

      sqlRelat01.SQL.Add(' SELECT  ''R'' AS SOURCE, CC.GRUPO, T.CENTRODECUSTO [' + Dados.RetornaMensagem('MEN_CENTROCUSTO') + '] ');
      sqlRelat01.SQL.Add( varMesesComLabel );
      sqlRelat01.SQL.Add( ',SUM(COALESCE(VALOR,0)) AS Total ' );
      sqlRelat01.SQL.Add(' 	FROM TBTRANSACAO T   ');
      sqlRelat01.SQL.Add('  LEFT OUTER JOIN CENTRODECUSTO CC ON CC.CENTRODECUSTO = T.CENTRODECUSTO  and CC.ID_USER = T.ID_USER and  CC.ID_USER =' + IntToStr(Dados.varID_USER) + ' and CC.ID_LANGUAGE = ' + IntToStr(Dados.varID_Language));
      sqlRelat01.SQL.Add(' 	WHERE  1 = 1  ');
      sqlRelat01.SQL.Add('  &WHERE1  ');
      sqlRelat01.SQL.Add('  &WHERE2  ');
      sqlRelat01.SQL.Add('  &WHERE3  ');
      sqlRelat01.SQL.Add('  AND T.FORECAST = 0 ');
      sqlRelat01.SQL.Add(' 	&WHERE4 ');
      sqlRelat01.SQL.Add(' 	&WHERE5 ');
      sqlRelat01.SQL.Add(' 	GROUP BY T.CENTRODECUSTO, (strftime(''%m'', DATATRANSACAO)   ');
      sqlRelat01.SQL.Add(' 	ORDER BY CC.GRUPO   ');


      //sqlRelat01.SQL.SaveToFile('C:\BIBanco\Relatorio_SQLITE_ForecastFalse.sql');

    end
    else if Forecast then
    begin

      sqlRelat01.SQL.Add(' SELECT  ''R'' AS SOURCE, CC.GRUPO, T.CENTRODECUSTO [' + Dados.RetornaMensagem('MEN_CENTROCUSTO') + '] ');
      sqlRelat01.SQL.Add( varMesesComLabel );
      sqlRelat01.SQL.Add( ',SUM(COALESCE(VALOR,0)) AS Total ' );
      sqlRelat01.SQL.Add(' 	FROM TBTRANSACAO T   ');
      sqlRelat01.SQL.Add('  LEFT OUTER JOIN CENTRODECUSTO CC ON CC.CENTRODECUSTO = T.CENTRODECUSTO and CC.ID_USER = T.ID_USER and   CC.ID_USER =' + IntToStr(Dados.varID_USER) + ' and CC.ID_LANGUAGE = ' + IntToStr(Dados.varID_Language));
      sqlRelat01.SQL.Add(' 	WHERE  1 = 1  ');
      sqlRelat01.SQL.Add('  &WHERE1  ');
      sqlRelat01.SQL.Add('  &WHERE2  ');
      sqlRelat01.SQL.Add('  &WHERE3  ');
      sqlRelat01.SQL.Add('  AND T.FORECAST = 1 ');
      sqlRelat01.SQL.Add(' 	&WHERE4 ');
      sqlRelat01.SQL.Add(' 	&WHERE5 ');
      sqlRelat01.SQL.Add(' 	GROUP BY T.CENTRODECUSTO, (strftime(''%m'', DATATRANSACAO)  ');
      sqlRelat01.SQL.Add(' 	ORDER BY CC.GRUPO   ');

      //sqlRelat01.SQL.SaveToFile('C:\BIBanco\Relatorio_SQLITE_ForecastTrue.sql');

    end;


    sqlRelat01.MacroByName( 'WHERE4' ).AsRaw := ' AND T.DATATRANSACAO BETWEEN ' + QuotedStr(FormatDateTime('yyyy-mm-dd',IncMonth(IncMonth(System.DateUtils.StartOfTheMonth(dtDateTrans), +1), -13)));
    sqlRelat01.MacroByName( 'WHERE5' ).AsRaw := ' AND  ' + QuotedStr(FormatDateTime('yyyy-mm-dd',(IncMonth(IncMonth(System.DateUtils.EndOfTheMonth(dtDateTrans), -12), 12))));


    //sqlRelat01.Params.ParamByName( 'ID_USER' ).AsInteger      :=  Dados.varID_USER;
    //sqlRelat01.Params.ParamByName( 'ID_LANGUAGE' ).AsInteger  :=  1; //Dados.varID_Language;

    lblPeriodo.Caption := 'Periodo: ' + DateToStr(IncMonth(IncMonth(System.DateUtils.StartOfTheMonth(dtDateTrans), +1), -13)) + ' - ' +
              DateToStr(IncMonth(IncMonth(System.DateUtils.EndOfTheMonth(dtDateTrans), -12), 11));

    sqlRelat01.MacroByName( 'WHERE1' ).AsRaw := ' AND T.ID_USER = ' + IntToStr(Dados.varID_USER);

    if cxTipo.Text <> '' then
      sqlRelat01.MacroByName( 'WHERE2' ).AsRaw := ' AND T.TIPO = ' + QuotedStr(cxTipo.Text);

   if idx <> -1 then
   begin

      sqlRelat01.MacroByName( 'WHERE3' ).AsRaw := ' AND T.ID_USERBANK = ' + IntToStr(Integer(cboBank.Items.Objects[Idx]));


   end;

    sqlRelat01.Open;


    AddColumn;

  except
    on E : Exception do
      Mens_MensErro(E.ClassName+' error raised, with message : '+E.Message);
  end;


end;

procedure  TfrmPrincipal.RelatorioCentroCustoSQLServer(Forecast, Balance: Boolean);
begin

 cxGrid1DBBandedTableView1.ClearItems;
 if ABand <> Nil then
 begin
     ABand.Bands.Clear;
 end;

 Try
    Dados.ConectarNoBanco;

    if cboBank.Items.Count > 0 then
      idx := cboBank.ItemIndex;


    varMesesComLabel  := MontaStringMes(True,'','B',False,False);
    varMesesComLabel  := Copy(varMesesComLabel, 1, Length(varMesesComLabel)-1);

    varMesesComLabelA  := MontaStringMes(True,'','A',True, False);
    varMesesComLabelA  := Copy(varMesesComLabelA, 1, Length(varMesesComLabelA)-1);

    //varMesesComLabelF  := MontaStringMes(True,'F','F', False);
    //varMesesComLabelF  := Copy(varMesesComLabelF, 1, Length(varMesesComLabelF)-1);

    varMesesComLabelB  := MontaStringMes(True,'B','B', False, False);

    varMesesSemLabelB  := MontaStringMes(False,'','B',False, False);
    varMesesSemLabelB  := Copy(varMesesSemLabelB, 1, Length(varMesesSemLabelB)-1);

    varMesesSemLabelA  := MontaStringMes(False,'','A', False, False);
    varMesesSemLabelA  := Copy(varMesesSemLabelA, 1, Length(varMesesSemLabelA)-1);


    varMesesSemLabelT  := MontaStringMes(False,'','B',False, True);
    varMesesSemLabelT  := Copy(varMesesSemLabelT, 1, Length(varMesesSemLabelT)-1);

    //varMesesSomaLinha   := MontaStringMes(True,'F','F', True);
    //varMesesSomaLinha  := '(' + Copy(varMesesSomaLinha, 1, Length(varMesesSomaLinha)-1) + ') as Total';


    sqlRelat01.Close;
    sqlRelat01.SQL.Clear;

    sqlRelat01.SQL.Add('  with dados ');
    sqlRelat01.SQL.Add('  as ');
    sqlRelat01.SQL.Add('  ( ');
    if Balance then
    begin
      sqlRelat01.SQL.Add('   SELECT ''R'' AS SOURCE, 0 AS GRUPO, ''BALANCE'' AS  [Centro de Custo], ');
      sqlRelat01.SQL.Add( varMesesComLabelA );
      sqlRelat01.SQL.Add('FROM ');
      sqlRelat01.SQL.Add('( ');
      sqlRelat01.SQL.Add('	SELECT CENTRODECUSTO  ');
      sqlRelat01.SQL.Add('		 ,VALOR = CAST(SUM(ISNULL(VALOR,0.00)) AS NUMERIC(12,2)) ');
      sqlRelat01.SQL.Add('		 ,CONVERT(CHAR(4),DATATRANSACAO, 100) + CONVERT(CHAR(4), DATATRANSACAO, 120) AS MES  ');
      sqlRelat01.SQL.Add('	FROM TBTRANSACAO ');
      sqlRelat01.SQL.Add('	WHERE  1 = 1  ');

      sqlRelat01.SQL.Add('    &WHERE1  ');
      sqlRelat01.SQL.Add('    &WHERE2  ');
      sqlRelat01.SQL.Add('    &WHERE3  ');
      sqlRelat01.SQL.Add('    AND FORECAST = 0 ');
      sqlRelat01.SQL.Add(' 	AND DATATRANSACAO >= :MES_INIANTERIOR ');
      sqlRelat01.SQL.Add(' 	AND DATATRANSACAO <= :MES_FIMANTERIOR ');

      sqlRelat01.SQL.Add('	GROUP BY CENTRODECUSTO, DATATRANSACAO  ');
      sqlRelat01.SQL.Add('  ) A ');
      sqlRelat01.SQL.Add('  PIVOT ');
      sqlRelat01.SQL.Add('  ( ');
      sqlRelat01.SQL.Add('   SUM(VALOR)  ');
      sqlRelat01.SQL.Add('  FOR Mes IN ( ' + varMesesSemLabelA + ')');
      sqlRelat01.SQL.Add(' ) AS PIVOTTABLE LEFT OUTER JOIN CENTRODECUSTO CC ON CC.CENTRODECUSTO = PIVOTTABLE.CENTRODECUSTO ');
      sqlRelat01.SQL.Add(' and  CC.ID_USER = :ID_USER and CC.ID_LANGUAGE = :ID_LANGUAGE');

      sqlRelat01.SQL.Add(' UNION ALL  ');
    end;

    if Forecast = False then
    begin
      sqlRelat01.SQL.Add(' SELECT  ''R'' AS SOURCE, CC.GRUPO, CC.CENTRODECUSTO [' + Dados.RetornaMensagem('MEN_CENTROCUSTO') + '],  ');
      sqlRelat01.SQL.Add( varMesesComLabel );
      sqlRelat01.SQL.Add(' FROM  ');
      sqlRelat01.SQL.Add(' (  ');
      sqlRelat01.SQL.Add(' 	SELECT CENTRODECUSTO   ');
      sqlRelat01.SQL.Add(' 		 ,VALOR = CAST(SUM(ISNULL(VALOR,0.00)) AS NUMERIC(12,2))   ');
      sqlRelat01.SQL.Add(' 		 ,CONVERT(CHAR(4),DATATRANSACAO, 100) + CONVERT(CHAR(4), DATATRANSACAO, 120) AS MES  ');
      sqlRelat01.SQL.Add(' 	FROM TBTRANSACAO    ');

      sqlRelat01.SQL.Add(' 	WHERE  1 = 1  ');

      sqlRelat01.SQL.Add('    &WHERE1  ');
      sqlRelat01.SQL.Add('    &WHERE2  ');
      sqlRelat01.SQL.Add('    &WHERE3  ');

      sqlRelat01.SQL.Add('    AND FORECAST = 0 ');
      sqlRelat01.SQL.Add(' 	AND DATATRANSACAO >= :MES_INI ');
      sqlRelat01.SQL.Add(' 	AND DATATRANSACAO <= :MES_FIM    ');

      sqlRelat01.SQL.Add(' 	GROUP BY CENTRODECUSTO, DATATRANSACAO   ');
      sqlRelat01.SQL.Add('   ) SQ     ');
      sqlRelat01.SQL.Add('   PIVOT  ');
      sqlRelat01.SQL.Add('   (          ');
      sqlRelat01.SQL.Add('    SUM(VALOR)  ' );
      sqlRelat01.SQL.Add('  FOR Mes IN ( ' + varMesesSemLabelB + ')');
      sqlRelat01.SQL.Add(' ) AS PIVOTTABLE LEFT OUTER JOIN CENTRODECUSTO CC ON CC.CENTRODECUSTO = PIVOTTABLE.CENTRODECUSTO and CC.ID_USER = :ID_USER and CC.ID_LANGUAGE = :ID_LANGUAGE ');


    end
    else if Forecast then
    begin

        sqlRelat01.SQL.Add(' SELECT  ''F'' AS SOURCE, CC.GRUPO, CC.CENTRODECUSTO [' + Dados.RetornaMensagem('MEN_CENTROCUSTO') + '],  ');
        sqlRelat01.SQL.Add( varMesesComLabel );
        sqlRelat01.SQL.Add(' FROM  ');
        sqlRelat01.SQL.Add(' (  ');
        sqlRelat01.SQL.Add(' 	SELECT CENTRODECUSTO   ');
        sqlRelat01.SQL.Add(' 		 ,VALOR = CAST(SUM(ISNULL(VALOR,0.00)) AS NUMERIC(12,2))   ');
        sqlRelat01.SQL.Add(' 		 ,CONVERT(CHAR(4),DATATRANSACAO, 100) + CONVERT(CHAR(4), DATATRANSACAO, 120) AS MES  ');
        sqlRelat01.SQL.Add(' 	FROM TBTRANSACAO    ');

        sqlRelat01.SQL.Add(' 	WHERE  1 = 1  ');

        sqlRelat01.SQL.Add('    &WHERE1  ');
        sqlRelat01.SQL.Add('    &WHERE2  ');
        sqlRelat01.SQL.Add('    &WHERE3  ');

        sqlRelat01.SQL.Add('    AND FORECAST = 1 ');
        sqlRelat01.SQL.Add(' 	AND DATATRANSACAO >= :MES_INI ');
        sqlRelat01.SQL.Add(' 	AND DATATRANSACAO <= :MES_FIM    ');

        sqlRelat01.SQL.Add(' 	GROUP BY CENTRODECUSTO, DATATRANSACAO   ');
        sqlRelat01.SQL.Add('   ) SQ     ');
        sqlRelat01.SQL.Add('   PIVOT  ');
        sqlRelat01.SQL.Add('   (          ');
        sqlRelat01.SQL.Add('    SUM(VALOR)  ' );
        sqlRelat01.SQL.Add('  FOR Mes IN ( ' + varMesesSemLabelB + ')');
        sqlRelat01.SQL.Add(' ) AS PIVOTTABLE LEFT OUTER JOIN CENTRODECUSTO CC ON CC.CENTRODECUSTO = PIVOTTABLE.CENTRODECUSTO and CC.ID_USER = :ID_USER and CC.ID_LANGUAGE = :ID_LANGUAGE ');

    end;


    sqlRelat01.SQL.Add(' ) ');
    sqlRelat01.SQL.Add(' SELECT *, ' + varMesesSemLabelT  + ' as TOTAL FROM DADOS ');

    sqlRelat01.SQL.Add('  ORDER BY GRUPO, [Centro de Custo]');


    sqlRelat01.Params.ParamByName( 'MES_INI' ).AsDateTime := IncMonth(IncMonth(System.DateUtils.StartOfTheMonth(dtDateTrans), +1), -13);
    sqlRelat01.Params.ParamByName( 'MES_FIM' ).AsDatetime := IncMonth(IncMonth(System.DateUtils.EndOfTheMonth(dtDateTrans), -12), 12);

    if Balance then
    begin
      sqlRelat01.Params.ParamByName( 'MES_INIANTERIOR' ).AsDateTime := IncMonth(IncMonth(System.DateUtils.StartOfTheMonth(dtDateTrans), +1), -14);
      sqlRelat01.Params.ParamByName( 'MES_FIMANTERIOR' ).AsDatetime := IncMonth(IncMonth(System.DateUtils.EndOfTheMonth(dtDateTrans), -12), 12);
    end;

    sqlRelat01.Params.ParamByName( 'ID_USER' ).AsInteger  :=  Dados.varID_USER;
    sqlRelat01.Params.ParamByName( 'ID_LANGUAGE' ).AsInteger  :=  1; //Dados.varID_Language;

    lblPeriodo.Caption := 'Periodo: ' + DateToStr(IncMonth(IncMonth(System.DateUtils.StartOfTheMonth(dtDateTrans), +1), -13)) + ' - ' +
              DateToStr(IncMonth(IncMonth(System.DateUtils.EndOfTheMonth(dtDateTrans), -12), 12));

    sqlRelat01.MacroByName( 'WHERE1' ).AsRaw := ' AND ID_USER = ' + IntToStr(Dados.varID_USER);

    if cxTipo.Text <> '' then
      sqlRelat01.MacroByName( 'WHERE2' ).AsRaw := ' AND TIPO = ' + QuotedStr(cxTipo.Text);

   if idx <> -1 then
      sqlRelat01.MacroByName( 'WHERE3' ).AsRaw := ' AND ID_USERBANK = ' + IntToStr(Integer(cboBank.Items.Objects[Idx]));


    //sqlRelat01.SQL.SaveToFile('C:\BIBanco\Relatorio012.sql');
    sqlRelat01.Open;

    AddColumn;

  except
    on E : Exception do
      Mens_MensErro(E.ClassName+' error raised, with message : '+E.Message);
  end;

end;



procedure TfrmPrincipal.GerarGraficoCC;
begin
    if sqlRelat01.IsEmpty then exit;

   if cboBank.Items.Count > 0 then
      idx := cboBank.ItemIndex;

    sqlGrafico1.Close;
    sqlGrafico1.SQL.Clear;
    sqlGrafico1.SQL.Add('SELECT CENTRODECUSTO AS LEGENDA, SUM(VALOR * -1) AS VALOR ');
    sqlGrafico1.SQL.Add('FROM TBTRANSACAO ');
    sqlGrafico1.SQL.Add('WHERE 1 = 1 and FORECAST = 0 ' );
    sqlGrafico1.SQL.Add('    &WHERE1  ');
    sqlGrafico1.SQL.Add('    &WHERE2  ');
    sqlGrafico1.SQL.Add('    &WHERE3  ');

    sqlGrafico1.SQL.Add(' AND DATATRANSACAO BETWEEN :MES_INI AND :MES_FIM  ');
    sqlGrafico1.SQL.Add('AND CENTRODECUSTO IS NOT NULL  ');
    sqlGrafico1.SQL.Add(' GROUP BY CENTRODECUSTO ');

    sqlGrafico1.MacroByName( 'WHERE1' ).AsRaw := ' AND ID_USER = ' + IntToStr(Dados.varID_USER);

    sqlGrafico1.MacroByName( 'WHERE2' ).AsRaw := ' AND CENTRODECUSTO = ' + QuotedStr(sqlRelat01.Fields.Fields[2].AsString);

   if idx <> -1 then
      sqlGrafico1.MacroByName( 'WHERE3' ).AsRaw := ' AND ID_USERBANK = ' + IntToStr(Integer(cboBank.Items.Objects[Idx]));


    sqlGrafico1.Params.ParamByName( 'MES_INI' ).AsDateTime := IncMonth(IncMonth(System.DateUtils.StartOfTheMonth(dtDateTrans), +1), -13);
    sqlGrafico1.Params.ParamByName( 'MES_FIM' ).AsDatetime := IncMonth(IncMonth(System.DateUtils.EndOfTheMonth(dtDateTrans), -12), 12);

    //sqlGrafico1.SQL.SaveToFile('C:\BIBanco\sqlGrafico1.sql');
    sqlGrafico1.Open;

    GerarGraficoTotal;

    DBChart1.SubTitle.Text.Clear;
    DBChart1.SubTitle.Text.Add(sqlRelat01.Fields.Fields[2].AsString);

  MostraItem;


end;

procedure  TfrmPrincipal.GerarGraficoTotal;
begin
   if sqlRelat01.IsEmpty then exit;

    if cboBank.Items.Count > 0 then
      idx := cboBank.ItemIndex;

  if Dados.varBanco ='1' then
  begin
      sqlGrafico1.Close;
      sqlGrafico1.SQL.Clear;
      sqlGrafico1.SQL.Add('SELECT CAST(''TOTAL'' AS VARCHAR(100)) AS LEGENDA, CAST(SUM(IFNULL(VALOR * -1,0.00)) AS NUMERIC(12,2)) AS VALOR ');
      sqlGrafico1.SQL.Add('FROM TBTRANSACAO ');
      sqlGrafico1.SQL.Add('WHERE 1 = 1 and FORECAST = 0 ' );
      sqlGrafico1.SQL.Add(' &WHERE1  ');
      sqlGrafico1.SQL.Add(' &WHERE3  ');

      sqlGrafico1.SQL.Add(' AND DATATRANSACAO BETWEEN :MES_INI AND :MES_FIM  ');
      sqlGrafico1.SQL.Add('AND CENTRODECUSTO IS NOT NULL  AND TIPO = ''EXPENSE''   ');

      sqlGrafico1.SQL.Add('UNION ALL     ');

      sqlGrafico1.SQL.Add('SELECT CAST(CENTRODECUSTO AS VARCHAR(100)) AS LEGENDA, CAST(SUM(IFNULL(VALOR * -1,0.00)) AS NUMERIC(12,2)) AS VALOR   ');
      sqlGrafico1.SQL.Add('FROM TBTRANSACAO   ');
      sqlGrafico1.SQL.Add('WHERE 1 = 1 and FORECAST = 0 ' );
      sqlGrafico1.SQL.Add(' AND DATATRANSACAO BETWEEN :MES_INI AND :MES_FIM  ');
      sqlGrafico1.SQL.Add(' &WHERE1  ');
      sqlGrafico1.SQL.Add(' &WHERE2  ');
      sqlGrafico1.SQL.Add(' &WHERE3  ');
      sqlGrafico1.SQL.Add(' AND CENTRODECUSTO IS NOT NULL  ');
      sqlGrafico1.SQL.Add(' GROUP BY CENTRODECUSTO  ');

      sqlGrafico1.MacroByName( 'WHERE1' ).AsRaw := ' AND ID_USER = ' + IntToStr(Dados.varID_USER);

      sqlGrafico1.MacroByName( 'WHERE2' ).AsRaw := ' AND CENTRODECUSTO = ' + QuotedStr(sqlRelat01.Fields.Fields[2].AsString);

      if idx <> -1 then
          sqlGrafico1.MacroByName( 'WHERE3' ).AsRaw := ' AND ID_USERBANK = ' + IntToStr(Integer(cboBank.Items.Objects[Idx]));



      sqlGrafico1.Params.ParamByName( 'MES_INI' ).AsDateTime := IncMonth(IncMonth(System.DateUtils.StartOfTheMonth(dtDateTrans), +1), -13);
      sqlGrafico1.Params.ParamByName( 'MES_FIM' ).AsDatetime := IncMonth(IncMonth(System.DateUtils.EndOfTheMonth(dtDateTrans), -12), 12);


      //sqlGrafico1.SQL.SaveToFile('C:\BIBanco\GraficoTotal.sql');
      sqlGrafico1.Open;

  end
  else
  begin
      sqlGrafico1.Close;
      sqlGrafico1.SQL.Clear;
      sqlGrafico1.SQL.Add('SELECT CAST(''TOTAL'' AS VARCHAR(100)) AS LEGENDA,  Sum(IFNULL(VALOR * -1,0.00)) AS "VALOR ::FLOAT"');
      sqlGrafico1.SQL.Add('FROM TBTRANSACAO ');
      sqlGrafico1.SQL.Add('WHERE 1 = 1 and FORECAST = 0 ' );
      sqlGrafico1.SQL.Add(' &WHERE1  ');
      sqlGrafico1.SQL.Add(' &WHERE3  ');

      sqlGrafico1.SQL.Add(' AND DATATRANSACAO BETWEEN :MES_INI AND :MES_FIM  ');
      sqlGrafico1.SQL.Add('AND CENTRODECUSTO IS NOT NULL  AND TIPO = ''EXPENSE''   ');

      sqlGrafico1.SQL.Add('UNION ALL     ');

      sqlGrafico1.SQL.Add('SELECT CAST(CENTRODECUSTO AS VARCHAR(100)) AS LEGENDA,  Sum(IFNULL(VALOR * -1,0.00)) AS "VALOR ::FLOAT"   ');
      sqlGrafico1.SQL.Add('FROM TBTRANSACAO   ');
      sqlGrafico1.SQL.Add('WHERE 1 = 1 and FORECAST = 0 ' );
      sqlGrafico1.SQL.Add(' AND DATATRANSACAO BETWEEN :MES_INI AND :MES_FIM  ');
      sqlGrafico1.SQL.Add(' &WHERE1  ');
      sqlGrafico1.SQL.Add(' &WHERE2  ');
      sqlGrafico1.SQL.Add(' &WHERE3  ');
      sqlGrafico1.SQL.Add(' AND CENTRODECUSTO IS NOT NULL  ');
      sqlGrafico1.SQL.Add(' GROUP BY CENTRODECUSTO  ');

      sqlGrafico1.MacroByName( 'WHERE1' ).AsRaw := ' AND ID_USER = ' + IntToStr(Dados.varID_USER);

      sqlGrafico1.MacroByName( 'WHERE2' ).AsRaw := ' AND CENTRODECUSTO = ' + QuotedStr(sqlRelat01.Fields.Fields[2].AsString);

      if idx <> -1 then
          sqlGrafico1.MacroByName( 'WHERE3' ).AsRaw := ' AND ID_USERBANK = ' + IntToStr(Integer(cboBank.Items.Objects[Idx]));



      sqlGrafico1.Params.ParamByName( 'MES_INI' ).AsDateTime := IncMonth(IncMonth(System.DateUtils.StartOfTheMonth(dtDateTrans), +1), -13);
      sqlGrafico1.Params.ParamByName( 'MES_FIM' ).AsDatetime := IncMonth(IncMonth(System.DateUtils.EndOfTheMonth(dtDateTrans), -12), 12);


      //sqlGrafico1.SQL.SaveToFile('C:\BIBanco\GraficoTotal.sql');
      sqlGrafico1.Open;

  end;
  MostraItem;
end;


procedure TfrmPrincipal.Timer1Timer(Sender: TObject);
var
 GVersao : String;
begin

   Timer1.Enabled := False;

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
     frmPrincipal.Enabled := False;

     FrmLogin := TFrmLogin.Create(Self) ;
     If ( FrmLogin.Showmodal <> mrOk ) Then
     Begin
         FrmLogin.Close;
         Close ;
         Exit ;
     End ;
      frmPrincipal.Enabled := True;

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
     ListaBancos;

     Dados.BuscaCaminhodoArquivo;

     FrmLogin.Close;

   
     if Dados.CheckBank = 0 then
     begin
        Try
          Application.CreateForm(TfrmAccount, frmAccount);
          frmAccount.ShowModal;
          ListaBancos;
        Finally
          FreeAndNil(FrmAccount);
        End;
     end;



      {
     sqlCentroCusto.Close;
     sqlCentroCusto.SQL.Clear;
     sqlCentroCusto.SQL.Add('WITH DADOS (ID_CENTRODECUSTO, CENTRODECUSTO, ID_USER, ID_LANGUAGE, GRUPO)  AS ');
     sqlCentroCusto.SQL.Add('( ');
     sqlCentroCusto.SQL.Add('	SELECT TOP 1 -1 as ID_CENTRODECUSTO , ''ALL COST CENTER'' as CENTRODECUSTO , 1 as ID_USER, 1 AS ID_LANGUAGE, 2 AS GRUPO FROM CENTRODECUSTO WHERE 1 = 1 ');
     sqlCentroCusto.SQL.Add('	UNION ALL   ');
     sqlCentroCusto.SQL.Add('	SELECT ID_CENTRODECUSTO, CENTRODECUSTO, ID_USER, ID_LANGUAGE, GRUPO  FROM CENTRODECUSTO ');
     sqlCentroCusto.SQL.Add(')   ');
     sqlCentroCusto.SQL.Add(' SELECT ID_CENTRODECUSTO, CENTRODECUSTO FROM DADOS ');
     sqlCentroCusto.SQL.Add('   WHERE ID_USER = :ID_USER AND ID_LANGUAGE = :ID_LANGUAGE AND GRUPO = 2  ');
     sqlCentroCusto.SQL.Add(' ORder by ID_CENTRODECUSTO, CENTRODECUSTO');


     sqlCentroCusto.Params.ParamByName('ID_USER').AsInteger := Dados.varID_USER;
     sqlCentroCusto.Params.ParamByName('ID_LANGUAGE').AsInteger := 1;
     sqlCentroCusto.Open;
     sqlCentroCusto.First;

     sqlBank.Close;
     sqlBank.Open;
     MostraItem;

       }


  except
    on E : Exception do
      Mens_MensErro(E.ClassName+' error raised, with message : '+E.Message);
  end;


end;



procedure TfrmPrincipal.MostraItem;
begin
  if sqlRelat01.IsEmpty then exit;

    if cboBank.Items.Count > 0 then
      idx := cboBank.ItemIndex;


  sqlItem.Close;
  sqlItem.SQL.Clear;
  sqlItem.SQL.Add('SELECT Favorecido, CAST(Categoria + ''_'' + SubCategoria AS VARCHAR(100)) as Categoria, datatransacao, VALOR  AS VALOR ');
  sqlItem.SQL.Add('FROM TBTRANSACAO ');
  sqlItem.SQL.Add('WHERE 1 = 1  and FORECAST = 0 ');
  sqlItem.SQL.Add(' AND DataTransacao >= :MES_INI and  DataTransacao <= :MES_FIM  ');
  sqlItem.SQL.Add('    &WHERE1  ');
  sqlItem.SQL.Add('    &WHERE2  ');
  sqlItem.SQL.Add('    &WHERE3  ');


  sqlItem.SQL.Add(' AND CENTRODECUSTO IS NOT NULL  AND TIPO = ''EXPENSE''  ');
  sqlItem.SQL.Add('Order by  CAST(DATATRANSACAO   AS DATE) desc   ');

   if Dados.varUsuario  <> '' then
      sqlItem.MacroByName( 'WHERE1' ).AsRaw := ' AND ID_USER = ' + IntToStr(Dados.varID_USER);

  sqlItem.MacroByName( 'WHERE2' ).AsRaw := ' AND CENTRODECUSTO = ' + QuotedStr(sqlRelat01.Fields.Fields[2].AsString);

  if idx <> -1 then
      sqlItem.MacroByName( 'WHERE3' ).AsRaw := ' AND ID_USERBANK = ' +IntToStr(Integer(cboBank.Items.Objects[Idx]));


  sqlItem.Params.ParamByName( 'MES_INI' ).AsDateTime := IncMonth(IncMonth(System.DateUtils.StartOfTheMonth(dtDateTrans), +1), -13);
  sqlItem.Params.ParamByName( 'MES_FIM' ).AsDatetime := IncMonth(IncMonth(System.DateUtils.EndOfTheMonth(dtDateTrans), -12), 12);


  sqlItem.Open;

  MostraGrafBarra;
end;


procedure  TfrmPrincipal.MostraGrafBarra;
begin
   if sqlRelat01.IsEmpty then exit;

   if cboBank.Items.Count > 0 then
      idx := cboBank.ItemIndex;


   sqlGraficoBarra.Close;
   sqlGraficoBarra.SQL.Clear;
   if Dados.varBanco = '1' then
    sqlGraficoBarra.SQL.Add('SELECT CENTRODECUSTO,  MONTH(DATATRANSACAO) AS MES , YEAR(DATATRANSACAO) AS ANO, SUM(VALOR * -1)  AS VALOR ')
   else  sqlGraficoBarra.SQL.Add('SELECT CENTRODECUSTO,  strftime(''%m'', DATATRANSACAO) AS MES , strftime(''%Y'', DATATRANSACAO) AS ANO, Sum(IFNULL(VALOR * -1,0.00)) AS "VALOR ::FLOAT" ');

   sqlGraficoBarra.SQL.Add('FROM TBTRANSACAO ');
   sqlGraficoBarra.SQL.Add('WHERE 1 = 1 and FORECAST = 0 ');

   sqlGraficoBarra.SQL.Add(' AND DataTransacao >= :MES_INI and  DataTransacao <= :MES_FIM  ');

   sqlGraficoBarra.SQL.Add(' AND CENTRODECUSTO IS NOT NULL   ');
   sqlGraficoBarra.SQL.Add('    &WHERE1  ');
   sqlGraficoBarra.SQL.Add('    &WHERE2  ');
   sqlGraficoBarra.SQL.Add('    &WHERE3  ');
   sqlGraficoBarra.SQL.Add('GROUP BY CENTRODECUSTO, MONTH(DATATRANSACAO) , YEAR(DATATRANSACAO) ');
   if Dados.varBanco = '1' then
     sqlGraficoBarra.SQL.Add('ORDER BY MONTH(DATATRANSACAO) , YEAR(DATATRANSACAO) DESC ')
    else   sqlGraficoBarra.SQL.Add('ORDER BY strftime(''%m'', DATATRANSACAO)  ,  strftime(''%Y'', DATATRANSACAO) DESC ');


   if Dados.varUsuario  <> '' then
     sqlGraficoBarra.MacroByName( 'WHERE1' ).AsRaw := ' AND ID_USER = ' + IntToStr(Dados.varID_USER);

   sqlGraficoBarra.MacroByName( 'WHERE2' ).AsRaw := ' AND CENTRODECUSTO = ' + QuotedStr(sqlRelat01.Fields.Fields[2].AsString);

  if Idx <> -1 then
      sqlGraficoBarra.MacroByName( 'WHERE3' ).AsRaw := ' AND ID_USERBANK = ' + IntToStr(Integer(cboBank.Items.Objects[Idx]));



   sqlGraficoBarra.Params.ParamByName( 'MES_INI' ).AsDateTime := IncMonth(IncMonth(System.DateUtils.StartOfTheMonth(dtDateTrans), +1), -13);
   sqlGraficoBarra.Params.ParamByName( 'MES_FIM' ).AsDatetime := IncMonth(IncMonth(System.DateUtils.EndOfTheMonth(dtDateTrans), -12), 12);

   sqlGraficoBarra.Open;

   DBChart2.SubTitle.Text.Clear;
   DBChart2.SubTitle.Text.Add(sqlRelat01.Fields.Fields[2].AsString);
end;

procedure TfrmPrincipal.User1Click(Sender: TObject);
begin
    Try
      Application.CreateForm(TfrmAccount, frmAccount);
      frmAccount.ShowModal;
      ListaBancos;
    Finally
      FreeAndNil(FrmAccount);
    End;
end;

procedure TfrmPrincipal.AddColumn;
var
  AColumn: TcxGridDBBandedColumn;
  I  : Integer;
begin

   cxGrid1DBBandedTableView1.BeginUpdate();
   cxGrid1DBBandedTableView1.DataController.CreateAllItems;
   cxGrid1DBBandedTableView1.OptionsView.FixedBandSeparatorWidth := 2;

   try

    ABand := cxGrid1DBBandedTableView1.Bands.Add;
    ABand.Index := 0;
    ABand.HeaderAlignmentHorz := taCenter;
    ABand.Caption := '';
    ABand.FixedKind :=  fkLeft;


    ABand := cxGrid1DBBandedTableView1.Bands.Add;
    ABand.Index := 1;
    ABand.HeaderAlignmentHorz := taCenter;
    ABand.Caption :=  Dados.RetornaMensagem('MEN_VALUE');

    AColumn := cxGrid1DBBandedTableView1.CreateColumn;
    AColumn.Width := 120;
    AColumn.Caption := '';
    AColumn.DataBinding.FieldName := sqlRelat01.Fields[1].FieldName;
    AColumn.Position.BandIndex := 0;
    AColumn.Visible := False;

    AColumn := cxGrid1DBBandedTableView1.CreateColumn;
    AColumn.Width := 120;
    AColumn.Caption := '';
    AColumn.DataBinding.FieldName := sqlRelat01.Fields[2].FieldName;
    AColumn.Position.BandIndex := 0;


    for I := 3 to sqlRelat01.FieldList.Count  - 1  do
    begin

        AColumn := cxGrid1DBBandedTableView1.CreateColumn;
        AColumn.DataBinding.FieldName := sqlRelat01.Fields[I].FieldName;
        AColumn.Caption := sqlRelat01.Fields[I].FieldName;
        AColumn.Width := 80;
        AColumn.Position.BandIndex := 1;
        AColumn.PropertiesClass := TcxCurrencyEditProperties;
        TcxCurrencyEditProperties(AColumn.Properties).DisplayFormat := '$,#.##;($,#.##)';

        cxGrid1DBBandedTableView1.DataController.Summary.FooterSummaryItems.Add(AColumn, spFooter, skSum, '#,###,###.##');

    end;

   {
    for I := 20 to 33  do
    begin

          AColumn := cxGrid1DBBandedTableView1.CreateColumn;
          AColumn.DataBinding.FieldName := FDQueryForecast.Fields[I].FieldName;
          if I >= 21 then
            AColumn.Styles.Content := cxStyleFamilia;
          if I <= 32 then
            AColumn.Caption := FormatDateTime('mmm',varMesesArrayF[i-20]) + '-' + IntToStr(Yearof(varMesesArrayF[i-20]))
          else   AColumn.Caption := 'Total';

          AColumn.PropertiesClass := TcxCurrencyEditProperties;
          TcxCurrencyEditProperties(AColumn.Properties).DisplayFormat := 'R$,0.00;(R$,0.00)';

          AColumn.Width := 80;
          AColumn.Position.BandIndex := 2;

          cxGrid1DBBandedTableView1.DataController.Summary.FooterSummaryItems.Add(AColumn, spFooter, skSum,  '##.###.###,##');
    end;
       }
    cxGrid1DBBandedTableView1.DataController.DataSource := dsRelat01;
    cxGrid1DBBandedTableView1.OptionsView.Footer := True;
    cxGrid1DBBandedTableView1.OptionsView.GroupFooters := gfVisibleWhenExpanded;
    cxGrid1DBBandedTableView1.OptionsView.GroupFooterMultiSummaries := True;


  finally
    cxGrid1DBBandedTableView1.EndUpdate;
  end;
end;


function TfrmPrincipal.MontaStringMes(bMostraLabel : Boolean; Alias : String; Tipo : String; SomarL, TotalL : Boolean): WideString;
var
 I, Y         : Integer;
 NovaData     : TDateTime;
 varResultado : String;

 YY,MM,DD : Word;

begin
  SetLength(varMesesArrayB, 12);
  SetLength(varMesesArrayF, 12);
  SetLength(varMesesArrayA, 12);
  SetLength(varMesAtual, 12);
  SetLength(varMesAnterior, 12);
  SetLength(varIMes, 12);
  SetLength(VarIMesAnterior, 12);
  SetLength(VarSum , 12);

  for Y := 0 to 11 do
  begin
     varMesesArrayB[Y]  := 0;
     varMesesArrayF[Y]  := 0;
     varMesesArrayA[Y]  := 0;
     varMesAtual[Y]     := '';
     varMesAnterior[Y]  := '';
     varIMes[Y]         := '';
     VarIMesAnterior[Y] := '';
     VarSum[Y] := '';
  end;

  varResultado := '';


  YY := StrToInT(cboAnoBase.Text);
  DD := 1;
  MM := 1;
  dtDateTrans := EnCodeDate(YY,Mm, Dd);

  NovaData := System.DateUtils.StartOfTheMonth(dtDateTrans);

  if ((Alias = '') or  (Alias = 'B'))  and (Tipo = 'B') then
    NovaData     :=  IncMonth(System.DateUtils.StartOfTheMonth(NovaData), -12)

  else if ((Alias = '') or  (Alias = 'A'))  and (Tipo = 'A') then
    NovaData     :=  IncMonth(System.DateUtils.StartOfTheMonth(NovaData), -13);



  varResultado := '';
  if ((Alias = '')or (Alias = 'B')) and (Tipo = 'B') then
  begin
    for I := 0 to 11 do
    begin
      varMesesArrayB[I] := NovaData;
      varResultado      := varResultado + BuscaMes(NovaData, bMostraLabel,Alias,SomarL, TotalL, Dados.varBanco);
      NovaData          := IncMonth(NovaData,1);
    end;
  end
  else
  if  ((Alias = '')or (Alias = 'A')) and (Tipo = 'A') then
  begin
    for I := 0 to 11 do
    begin
      varMesesArrayB[I] := NovaData;
      varResultado      := varResultado + BuscaMes(NovaData, bMostraLabel,Alias,SomarL, TotalL, Dados.varBanco);
      NovaData          := IncMonth(NovaData,1);
    end;
  end
  else
  begin
    for I := 0 to 11 do
    begin
      varMesesArrayF[I] := NovaData;
      varResultado      := varResultado + BuscaMes(NovaData, bMostraLabel,Alias, SomarL, TotalL, Dados.varBanco);
      NovaData          := IncMonth(NovaData,1);
    end;
  end;

  result := varResultado;
end;





procedure TfrmPrincipal.PageChange(Sender: TObject);
begin
   if ((Page.ActivePage = TabDetalhe) or (Page.ActivePage = TabSpend)  or (Page.ActivePage = TabIE)) Then
     if ((Dados.BuscaDados = False) or  (sqlRelat01.IsEmpty)) then
          Page.ActivePage := TabTransacao;

   if Page.ActivePage = TabIE then
   begin
      cboYear3.ItemIndex := cboYear.ItemIndex;
      cboYear3.OnChange(Nil);
   end;

end;

function TfrmPrincipal.BuscaMes(Data: TDateTime; bLabel : Boolean; Alias : String; SomarLinha, TotalLinha : Boolean; VersaoBanco : String) : String;
var
 AnoAnterior, MesAnterior, DiaAnterior, Ano, Mes, Dia: Word;
 MesFiscal, MesFiscalAnterior, MesAbrev, MesAbrevAnterior : String;
 strFormatDate, strFormatDateAnterior : string;
 DataAnterior : TDateTime;
begin


   DataAnterior := IncMonth(Data);
   DecodeDate(DataAnterior, AnoAnterior, MesAnterior, DiaAnterior);
   MesAbrevAnterior := formatdatetime('mmm', DataAnterior);

   DecodeDate(Data, Ano, Mes, Dia);
   MesAbrev := formatdatetime('mmm', Data);


   MesAbrevAnterior := StringReplace(MesAbrevAnterior,'dez','Dec',[rfReplaceAll, rfIgnoreCase]);
   MesAbrevAnterior := StringReplace(MesAbrevAnterior,'set','Sep',[rfReplaceAll, rfIgnoreCase]);
   MesAbrevAnterior := StringReplace(MesAbrevAnterior,'abr','Apr',[rfReplaceAll, rfIgnoreCase]);
   MesAbrevAnterior := StringReplace(MesAbrevAnterior,'ago','Aug',[rfReplaceAll, rfIgnoreCase]);
   MesAbrevAnterior := StringReplace(MesAbrevAnterior,'mai','May',[rfReplaceAll, rfIgnoreCase]);
   MesAbrevAnterior := StringReplace(MesAbrevAnterior,'out','Oct',[rfReplaceAll, rfIgnoreCase]);
   MesAbrevAnterior := StringReplace(MesAbrevAnterior,'fev','Feb',[rfReplaceAll, rfIgnoreCase]);
   MesAbrevAnterior := StringReplace(MesAbrevAnterior,'nov','Nov',[rfReplaceAll, rfIgnoreCase]);
   MesAbrevAnterior := StringReplace(MesAbrevAnterior,'jan','Jan',[rfReplaceAll, rfIgnoreCase]);
   MesAbrevAnterior := StringReplace(MesAbrevAnterior,'mar','Mar',[rfReplaceAll, rfIgnoreCase]);
   MesAbrevAnterior := StringReplace(MesAbrevAnterior,'jun','Jun',[rfReplaceAll, rfIgnoreCase]);
   MesAbrevAnterior := StringReplace(MesAbrevAnterior,'jul','Jul',[rfReplaceAll, rfIgnoreCase]);
   strFormatDateAnterior :=  '[' + MesAbrevAnterior  + ' ' + IntToStr(AnoAnterior)  +  ']';



   MesAbrev := StringReplace(MesAbrev,'dez','Dec',[rfReplaceAll, rfIgnoreCase]);
   MesAbrev := StringReplace(MesAbrev,'set','Sep',[rfReplaceAll, rfIgnoreCase]);
   MesAbrev := StringReplace(MesAbrev,'abr','Apr',[rfReplaceAll, rfIgnoreCase]);
   MesAbrev := StringReplace(MesAbrev,'ago','Aug',[rfReplaceAll, rfIgnoreCase]);
   MesAbrev := StringReplace(MesAbrev,'mai','May',[rfReplaceAll, rfIgnoreCase]);
   MesAbrev := StringReplace(MesAbrev,'out','Oct',[rfReplaceAll, rfIgnoreCase]);
   MesAbrev := StringReplace(MesAbrev,'fev','Feb',[rfReplaceAll, rfIgnoreCase]);
   MesAbrev := StringReplace(MesAbrev,'nov','Nov',[rfReplaceAll, rfIgnoreCase]);
   MesAbrev := StringReplace(MesAbrev,'jan','Jan',[rfReplaceAll, rfIgnoreCase]);
   MesAbrev := StringReplace(MesAbrev,'mar','Mar',[rfReplaceAll, rfIgnoreCase]);
   MesAbrev := StringReplace(MesAbrev,'jun','Jun',[rfReplaceAll, rfIgnoreCase]);
   MesAbrev := StringReplace(MesAbrev,'jul','Jul',[rfReplaceAll, rfIgnoreCase]);
   strFormatDate :=  '[' + MesAbrev  + ' ' + IntToStr(Ano)  +  ']';

   if VersaoBanco = '1' then // SQL SERVER
   begin


       if bLabel then
       begin

         Case Mes Of
             1   : MesFiscal := strFormatDate + ','; // + ' AS JANEIRO,' ;
             2   : MesFiscal := strFormatDate + ','; // + ' AS FEVEREIRO,' ;
             3   : MesFiscal := strFormatDate + ','; // + ' AS MARÇO,' ;
             4   : MesFiscal := strFormatDate + ','; // + ' AS ABRIL,' ;
             5   : MesFiscal := strFormatDate + ','; // + ' AS MAIO,' ;
             6   : MesFiscal := strFormatDate + ','; // + ' AS JUNHO,' ;
             7   : MesFiscal := strFormatDate + ','; // + ' AS JULHO,' ;
             8   : MesFiscal := strFormatDate + ','; // + ' AS AGOSTO,' ;
             9   : MesFiscal := strFormatDate + ','; // + ' AS SETEMBRO,' ;
             10  : MesFiscal := strFormatDate + ','; // + ' AS OUTUBRO,' ;
             11  : MesFiscal := strFormatDate + ','; // + ' AS NOVEMBRO,' ;
             12  : MesFiscal := strFormatDate + ','; // + ' AS DEZEMBRO,' ;
         End ;


         Case Mes Of
             1   : MesFiscalAnterior := strFormatDateAnterior + ','; // + ' AS JANEIRO,' ;
             2   : MesFiscalAnterior := strFormatDateAnterior + ','; // + ' AS FEVEREIRO,' ;
             3   : MesFiscalAnterior := strFormatDateAnterior + ','; // + ' AS MARÇO,' ;
             4   : MesFiscalAnterior := strFormatDateAnterior + ','; // + ' AS ABRIL,' ;
             5   : MesFiscalAnterior := strFormatDateAnterior + ','; // + ' AS MAIO,' ;
             6   : MesFiscalAnterior := strFormatDateAnterior + ','; // + ' AS JUNHO,' ;
             7   : MesFiscalAnterior := strFormatDateAnterior + ','; // + ' AS JULHO,' ;
             8   : MesFiscalAnterior := strFormatDateAnterior + ','; // + ' AS AGOSTO,' ;
             9   : MesFiscalAnterior := strFormatDateAnterior + ','; // + ' AS SETEMBRO,' ;
             10  : MesFiscalAnterior := strFormatDateAnterior + ','; // + ' AS OUTUBRO,' ;
             11  : MesFiscalAnterior := strFormatDateAnterior + ','; // + ' AS NOVEMBRO,' ;
             12  : MesFiscalAnterior := strFormatDateAnterior + ','; // + ' AS DEZEMBRO,' ;
         End ;


       end
       else
       begin
         Case Mes Of
             1   : MesFiscal := strFormatDate + ',' ;
             2   : MesFiscal := strFormatDate + ',' ;
             3   : MesFiscal := strFormatDate + ',' ;
             4   : MesFiscal := strFormatDate + ',' ;
             5   : MesFiscal := strFormatDate + ',' ;
             6   : MesFiscal := strFormatDate + ',' ;
             7   : MesFiscal := strFormatDate + ',' ;
             8   : MesFiscal := strFormatDate + ',' ;
             9   : MesFiscal := strFormatDate + ',' ;
             10  : MesFiscal := strFormatDate + ',' ;
             11  : MesFiscal := strFormatDate + ',' ;
             12  : MesFiscal := strFormatDate + ',' ;
         End ;
       end;


       //if (Alias <> '') then
       //    MesFiscal := Alias + '.' + MesFiscal;

       if TotalLinha then
       begin
          MesFiscal := Copy(MesFiscal,1,length(MesFiscal)-1);

          Case Mes Of
             1   : MesFiscal := 'IsNull(' +  MesFiscal + ',0) +' ;
             2   : MesFiscal := 'IsNull(' +  MesFiscal + ',0) +' ;
             3   : MesFiscal := 'IsNull(' +  MesFiscal + ',0) +' ;
             4   : MesFiscal := 'IsNull(' +  MesFiscal + ',0) +' ;
             5   : MesFiscal := 'IsNull(' +  MesFiscal + ',0) +' ;
             6   : MesFiscal := 'IsNull(' +  MesFiscal + ',0) +' ;
             7   : MesFiscal := 'IsNull(' +  MesFiscal + ',0) +' ;
             8   : MesFiscal := 'IsNull(' +  MesFiscal + ',0) +' ;
             9   : MesFiscal := 'IsNull(' +  MesFiscal + ',0) +' ;
             10  : MesFiscal := 'IsNull(' +  MesFiscal + ',0) +' ;
             11  : MesFiscal := 'IsNull(' +  MesFiscal + ',0) +' ;
             12  : MesFiscal := 'IsNull(' +  MesFiscal + ',0) +' ;
         End ;
       end;


       if SomarLinha then
       begin

            MesFiscalAnterior := Copy(MesFiscalAnterior,1,length(MesFiscalAnterior)-1);
            MesFiscal         := Copy(MesFiscal,1,length(MesFiscal)-1);

            if ((Ano < AnoAnterior) and (varMesAtual[0]= '')) then
            begin
              varMesAtual[0]    := MesFiscal;
              varMesAnterior[0] := MesFiscalAnterior;
              MesFiscalAnterior := 'Sum(' +  varMesAtual[0]  + ')   AS ' + varMesAnterior[0] + ',' ;
            end
            else
            //if (Ano = AnoAnterior) then
            begin
              varMesAtual[Mes]    := MesFiscal;
              varMesAnterior[Mes] := MesFiscalAnterior;

              Case Mes Of
                   1   : MesFiscalAnterior := 'Sum(' +  varMesAtual[0] + ') + Sum(' + varMesAnterior[0] + ')  AS ' + varMesAnterior[1]  + ',' ;
                   2   : MesFiscalAnterior := 'Sum(' +  varMesAtual[0] + ') + Sum(' + varMesAnterior[0] + ') + Sum( ' + varMesAnterior[1]  + ') AS ' + varMesAnterior[2]  + ',' ;
                   3   : MesFiscalAnterior := 'Sum(' +  varMesAtual[0] + ') + Sum(' + varMesAnterior[0] + ') + Sum( ' + varMesAnterior[1]  + ') + Sum( ' + varMesAnterior[2] + ') AS ' + varMesAnterior[3]  + ',' ;
                   4   : MesFiscalAnterior := 'Sum(' +  varMesAtual[0] + ') + Sum(' + varMesAnterior[0] + ') + Sum( ' + varMesAnterior[1]  + ') + Sum( ' + varMesAnterior[2] + ') + Sum ( ' + varMesAnterior[3] + ') AS ' + varMesAnterior[4]  + ',' ;
                   5   : MesFiscalAnterior := 'Sum(' +  varMesAtual[0] + ') + Sum(' + varMesAnterior[0] + ') + Sum( ' + varMesAnterior[1]  + ') + Sum( ' + varMesAnterior[2] + ') + Sum ( ' + varMesAnterior[3] + ') + Sum ( ' + varMesAnterior[4] + ') AS ' + varMesAnterior[5]  + ',' ;
                   6   : MesFiscalAnterior := 'Sum(' +  varMesAtual[0] + ') + Sum(' + varMesAnterior[0] + ') + Sum( ' + varMesAnterior[1]  + ') + Sum( ' + varMesAnterior[2] + ') + Sum ( ' + varMesAnterior[3] + ') + Sum ( ' + varMesAnterior[4] + ') + Sum ( ' + varMesAnterior[5] + ') AS ' + varMesAnterior[6]  + ',' ;
                   7   : MesFiscalAnterior := 'Sum(' +  varMesAtual[0] + ') + Sum(' + varMesAnterior[0] + ') + Sum( ' + varMesAnterior[1]  + ') + Sum( ' + varMesAnterior[2] + ') + Sum ( ' + varMesAnterior[3] + ') + Sum ( ' + varMesAnterior[4] + ') + Sum ( ' + varMesAnterior[5] + ') + Sum ( ' + varMesAnterior[6] + ') AS ' + varMesAnterior[7]  + ',' ;
                   8   : MesFiscalAnterior := 'Sum(' +  varMesAtual[0] + ') + Sum(' + varMesAnterior[0] + ') + Sum( ' + varMesAnterior[1]  + ') + Sum( ' + varMesAnterior[2] + ') + Sum ( ' + varMesAnterior[3] + ') + Sum ( ' + varMesAnterior[4] + ') + Sum ( ' + varMesAnterior[5] + ') + Sum ( ' + varMesAnterior[6] + ') + Sum ( ' + varMesAnterior[7] + ') AS ' + varMesAnterior[8]  + ',' ;
                   9   : MesFiscalAnterior := 'Sum(' +  varMesAtual[0] + ') + Sum(' + varMesAnterior[0] + ') + Sum( ' + varMesAnterior[1]  + ') + Sum( ' + varMesAnterior[2] + ') + Sum ( ' + varMesAnterior[3] + ') + Sum ( ' + varMesAnterior[4] + ') + Sum ( ' + varMesAnterior[5] + ') + Sum ( ' + varMesAnterior[6] + ') + Sum ( ' + varMesAnterior[7] + ') + Sum ( ' + varMesAnterior[8] + ') AS ' + varMesAnterior[9]  + ',' ;
                   10  : MesFiscalAnterior := 'Sum(' +  varMesAtual[0] + ') + Sum(' + varMesAnterior[0] + ') + Sum( ' + varMesAnterior[1]  + ') + Sum( ' + varMesAnterior[2] + ') + Sum ( ' + varMesAnterior[3] + ') + Sum ( ' + varMesAnterior[4] + ') + Sum ( ' + varMesAnterior[5] + ') + Sum ( ' + varMesAnterior[6] + ') + Sum ( ' + varMesAnterior[7] + ') + Sum ( ' + varMesAnterior[8] + ') + Sum ( ' + varMesAnterior[9] + ') AS ' + varMesAnterior[10]  + ',' ;
                   11  : MesFiscalAnterior := 'Sum(' +  varMesAtual[0] + ') + Sum(' + varMesAnterior[0] + ') + Sum( ' + varMesAnterior[1]  + ') + Sum( ' + varMesAnterior[2] + ') + Sum ( ' + varMesAnterior[3] + ') + Sum ( ' + varMesAnterior[4] + ') + Sum ( ' + varMesAnterior[5] + ') + Sum ( ' + varMesAnterior[6] + ') + Sum ( ' + varMesAnterior[7] + ') + Sum ( ' + varMesAnterior[8] + ') + Sum ( ' + varMesAnterior[9] + ') + Sum ( ' + varMesAnterior[10] + ') AS ' + varMesAnterior[11]   + ',' ;
                   12  : MesFiscalAnterior := 'Sum(' +  varMesAtual[0] + ') + Sum(' + varMesAnterior[0] + ') + Sum( ' + varMesAnterior[1]  + ') + Sum( ' + varMesAnterior[2] + ') + Sum ( ' + varMesAnterior[3] + ') + Sum ( ' + varMesAnterior[4] + ') + Sum ( ' + varMesAnterior[5] + ') + Sum ( ' + varMesAnterior[6] + ') + Sum ( ' + varMesAnterior[7] + ') + Sum ( ' + varMesAnterior[8] + ') + Sum ( ' + varMesAnterior[9] + ') + Sum ( ' + varMesAnterior[10] + ') + Sum ( ' + varMesAnterior[11] + ') AS ' + varMesAnterior[12]   + ',' ;

                   //12  : MesFiscalAnterior := '  (SELECT VALOR FROM  TBTRANSACAO WHERE ID_USER = 1 AND ID_BANKING = 1 AND CATEGORIA = ''BALANCE''' +
                   //   ' AND DataTransacao = ( SELECT MAX(DataTransacao) FROM TBTRANSACAO WHERE ID_USER = 1 AND ID_BANKING = 1 AND CATEGORIA = ''BALANCE'')) AS ' + MesFiscalAnterior  + ',' ;
               End ;
            end;
            {else
            if Ano  AnoAnterior then
            begin
               MesFiscalAnterior := 'Sum(' +  varMesAtual[0] + ') + Sum(' + varMesAnterior[0] + ') + Sum( ' + varMesAnterior[1]  + ') + Sum( ' + varMesAnterior[2] + ') + Sum ( ' + varMesAnterior[3] + ') + Sum ( ' + varMesAnterior[4] + ') + Sum ( ' + varMesAnterior[5] + ') + Sum ( ' + varMesAnterior[6] + ') + Sum ( ' + varMesAnterior[7] + ') + Sum ( ' + varMesAnterior[8] + ') + Sum ( ' + varMesAnterior[9] + ') + Sum ( ' + varMesAnterior[10] + ') + Sum ( ' + varMesAnterior[11] + ') AS ' + varMesAnterior[12]   + ',' ;
            end; }

           MesFiscal :=  MesFiscalAnterior;

    {
         if (Alias = 'B') and (bLabel) then
         begin
            MesFiscal := Copy(MesFiscal,1,length(MesFiscal)-1);

            Case Mes Of
               1   : MesFiscal :=  Alias +  '.' + MesFiscal + ' AS Jan_' + IntToStr(Ano) + ',' ;
               2   : MesFiscal :=  Alias +  '.' + MesFiscal + ' AS Fev_' + IntToStr(Ano) + ',' ;
               3   : MesFiscal :=  Alias +  '.' + MesFiscal + ' AS Mar_' + IntToStr(Ano) + ',' ;
               4   : MesFiscal :=  Alias +  '.' + MesFiscal + ' AS Abr_' + IntToStr(Ano) + ',' ;
               5   : MesFiscal :=  Alias +  '.' + MesFiscal + ' AS Mai_' + IntToStr(Ano) + ',' ;
               6   : MesFiscal :=  Alias +  '.' + MesFiscal + ' AS Jun_' + IntToStr(Ano) + ',' ;
               7   : MesFiscal :=  Alias +  '.' + MesFiscal + ' AS Jul_' + IntToStr(Ano) + ',' ;
               8   : MesFiscal :=  Alias +  '.' + MesFiscal + ' AS Ago_' + IntToStr(Ano) + ',' ;
               9   : MesFiscal :=  Alias +  '.' + MesFiscal + ' AS Set_' + IntToStr(Ano) + ',' ;
               10  : MesFiscal :=  Alias +  '.' + MesFiscal + ' AS Out_' + IntToStr(Ano) + ',' ;
               11  : MesFiscal :=  Alias +  '.' + MesFiscal + ' AS Nov_' + IntToStr(Ano) + ',' ;
               12  : MesFiscal :=  Alias +  '.' + MesFiscal + ' AS Dez_' + IntToStr(Ano) + ',' ;
           End ;
         end;
     }
       end;

   end
   else if VersaoBanco = '2' then
   begin
                                                                                                                                                                            //sqlRelat01.SQL.Add(', CAST(SUM(COALESCE(VALOR,0)) AS NUMERIC(12,2)) AS Total ');
     if bLabel then
     begin
 		     Case Mes Of
             1   : MesFiscal :=  ',CASE WHEN strftime(''%m'', DATATRANSACAO) == ''' + ZeroLeft(IntToStr(Mes),2)+ ''' AND strftime(''%Y'', DATATRANSACAO) == ''' + IntToStr(ano) + ''' THEN  CAST(SUM(COALESCE(VALOR,0)) AS NUMERIC(12,2)) END AS ' +  strFormatDate;
             2   : MesFiscal :=  ',CASE WHEN strftime(''%m'', DATATRANSACAO) == ''' + ZeroLeft(IntToStr(Mes),2)+ ''' AND strftime(''%Y'', DATATRANSACAO) == ''' + IntToStr(ano) + ''' THEN  CAST(SUM(COALESCE(VALOR,0)) AS NUMERIC(12,2)) END AS ' +  strFormatDate;
             3   : MesFiscal :=  ',CASE WHEN strftime(''%m'', DATATRANSACAO) == ''' + ZeroLeft(IntToStr(Mes),2)+ ''' AND strftime(''%Y'', DATATRANSACAO) == ''' + IntToStr(ano) + ''' THEN  CAST(SUM(COALESCE(VALOR,0)) AS NUMERIC(12,2)) END AS ' +  strFormatDate;
             4   : MesFiscal :=  ',CASE WHEN strftime(''%m'', DATATRANSACAO) == ''' + ZeroLeft(IntToStr(Mes),2)+ ''' AND strftime(''%Y'', DATATRANSACAO) == ''' + IntToStr(ano) + ''' THEN  CAST(SUM(COALESCE(VALOR,0)) AS NUMERIC(12,2)) END AS ' +  strFormatDate;
             5   : MesFiscal :=  ',CASE WHEN strftime(''%m'', DATATRANSACAO) == ''' + ZeroLeft(IntToStr(Mes),2)+ ''' AND strftime(''%Y'', DATATRANSACAO) == ''' + IntToStr(ano) + ''' THEN  CAST(SUM(COALESCE(VALOR,0)) AS NUMERIC(12,2)) END AS ' +  strFormatDate;
             6   : MesFiscal :=  ',CASE WHEN strftime(''%m'', DATATRANSACAO) == ''' + ZeroLeft(IntToStr(Mes),2)+ ''' AND strftime(''%Y'', DATATRANSACAO) == ''' + IntToStr(ano) + ''' THEN  CAST(SUM(COALESCE(VALOR,0)) AS NUMERIC(12,2)) END AS ' +  strFormatDate;
             7   : MesFiscal :=  ',CASE WHEN strftime(''%m'', DATATRANSACAO) == ''' + ZeroLeft(IntToStr(Mes),2)+ ''' AND strftime(''%Y'', DATATRANSACAO) == ''' + IntToStr(ano) + ''' THEN  CAST(SUM(COALESCE(VALOR,0)) AS NUMERIC(12,2)) END AS ' +  strFormatDate;
             8   : MesFiscal :=  ',CASE WHEN strftime(''%m'', DATATRANSACAO) == ''' + ZeroLeft(IntToStr(Mes),2)+ ''' AND strftime(''%Y'', DATATRANSACAO) == ''' + IntToStr(ano) + ''' THEN  CAST(SUM(COALESCE(VALOR,0)) AS NUMERIC(12,2)) END AS ' +  strFormatDate;
             9   : MesFiscal :=  ',CASE WHEN strftime(''%m'', DATATRANSACAO) == ''' + ZeroLeft(IntToStr(Mes),2)+ ''' AND strftime(''%Y'', DATATRANSACAO) == ''' + IntToStr(ano) + ''' THEN  CAST(SUM(COALESCE(VALOR,0)) AS NUMERIC(12,2)) END AS ' +  strFormatDate;
             10  : MesFiscal :=  ',CASE WHEN strftime(''%m'', DATATRANSACAO) == ''' + ZeroLeft(IntToStr(Mes),2)+ ''' AND strftime(''%Y'', DATATRANSACAO) == ''' + IntToStr(ano) + ''' THEN  CAST(SUM(COALESCE(VALOR,0)) AS NUMERIC(12,2)) END AS ' +  strFormatDate;
             11  : MesFiscal :=  ',CASE WHEN strftime(''%m'', DATATRANSACAO) == ''' + ZeroLeft(IntToStr(Mes),2)+ ''' AND strftime(''%Y'', DATATRANSACAO) == ''' + IntToStr(ano) + ''' THEN  CAST(SUM(COALESCE(VALOR,0)) AS NUMERIC(12,2)) END AS ' +  strFormatDate;
             12  : MesFiscal :=  ',CASE WHEN strftime(''%m'', DATATRANSACAO) == ''' + ZeroLeft(IntToStr(Mes),2)+ ''' AND strftime(''%Y'', DATATRANSACAO) == ''' + IntToStr(ano) + ''' THEN  CAST(SUM(COALESCE(VALOR,0)) AS NUMERIC(12,2)) END AS ' +  strFormatDate;
         End ;

       if SomarLinha then
       begin


           MesAbrevAnterior := StringReplace(MesAbrevAnterior,'dez','Dec',[rfReplaceAll, rfIgnoreCase]);
           MesAbrevAnterior := StringReplace(MesAbrevAnterior,'set','Sep',[rfReplaceAll, rfIgnoreCase]);
           MesAbrevAnterior := StringReplace(MesAbrevAnterior,'abr','Apr',[rfReplaceAll, rfIgnoreCase]);
           MesAbrevAnterior := StringReplace(MesAbrevAnterior,'ago','Aug',[rfReplaceAll, rfIgnoreCase]);
           MesAbrevAnterior := StringReplace(MesAbrevAnterior,'mai','May',[rfReplaceAll, rfIgnoreCase]);
           MesAbrevAnterior := StringReplace(MesAbrevAnterior,'out','Oct',[rfReplaceAll, rfIgnoreCase]);
           MesAbrevAnterior := StringReplace(MesAbrevAnterior,'fev','Feb',[rfReplaceAll, rfIgnoreCase]);
           MesAbrevAnterior := StringReplace(MesAbrevAnterior,'nov','Nov',[rfReplaceAll, rfIgnoreCase]);
           MesAbrevAnterior := StringReplace(MesAbrevAnterior,'jan','Jan',[rfReplaceAll, rfIgnoreCase]);
           MesAbrevAnterior := StringReplace(MesAbrevAnterior,'mar','Mar',[rfReplaceAll, rfIgnoreCase]);
           MesAbrevAnterior := StringReplace(MesAbrevAnterior,'jun','Jun',[rfReplaceAll, rfIgnoreCase]);
           MesAbrevAnterior := StringReplace(MesAbrevAnterior,'jul','Jul',[rfReplaceAll, rfIgnoreCase]);
           MesFiscalAnterior :=  '[' + MesAbrevAnterior  + ' ' + IntToStr(AnoAnterior)  +  ']';



           MesAbrev := StringReplace(MesAbrev,'dez','Dec',[rfReplaceAll, rfIgnoreCase]);
           MesAbrev := StringReplace(MesAbrev,'set','Sep',[rfReplaceAll, rfIgnoreCase]);
           MesAbrev := StringReplace(MesAbrev,'abr','Apr',[rfReplaceAll, rfIgnoreCase]);
           MesAbrev := StringReplace(MesAbrev,'ago','Aug',[rfReplaceAll, rfIgnoreCase]);
           MesAbrev := StringReplace(MesAbrev,'mai','May',[rfReplaceAll, rfIgnoreCase]);
           MesAbrev := StringReplace(MesAbrev,'out','Oct',[rfReplaceAll, rfIgnoreCase]);
           MesAbrev := StringReplace(MesAbrev,'fev','Feb',[rfReplaceAll, rfIgnoreCase]);
           MesAbrev := StringReplace(MesAbrev,'nov','Nov',[rfReplaceAll, rfIgnoreCase]);
           MesAbrev := StringReplace(MesAbrev,'jan','Jan',[rfReplaceAll, rfIgnoreCase]);
           MesAbrev := StringReplace(MesAbrev,'mar','Mar',[rfReplaceAll, rfIgnoreCase]);
           MesAbrev := StringReplace(MesAbrev,'jun','Jun',[rfReplaceAll, rfIgnoreCase]);
           MesAbrev := StringReplace(MesAbrev,'jul','Jul',[rfReplaceAll, rfIgnoreCase]);
           MesFiscal :=  '[' + MesAbrev  + ' ' + IntToStr(Ano)  +  ']';

           // MesFiscalAnterior := Copy(MesFiscalAnterior,1,length(MesFiscalAnterior)-1);
          //  MesFiscal         := Copy(MesFiscal,1,length(MesFiscal)-1);

            if ((Ano < AnoAnterior) and (varMesAtual[0]= '')) then
            begin
              varMesAtual[0]     := MesFiscal;
              varMesAnterior[0]  := MesFiscalAnterior;
              varIMes[0]         := ZeroLeft(IntToStr(Mes),2);
              varIMesAnterior[0] := ZeroLeft(IntToStr(MesAnterior),2);

              MesFiscalAnterior := 'SUM(CASE WHEN ((strftime(''%m'', DATATRANSACAO) == ''' + varIMes[0] +''') AND (strftime(''%Y'', DATATRANSACAO) == ''' + IntToStr(Ano) + ''')) THEN  COALESCE(VALOR,0) END) AS ' + varMesAnterior[0] + ',';

              VarSum[0]         := '((strftime(''%m'', DATATRANSACAO) == ''' + varIMes[0] +''') AND (strftime(''%Y'', DATATRANSACAO) == ''' + IntToStr(Ano) + ''')) || ';
            end
            else
            begin
              varMesAtual[Mes]     := MesFiscal;
              varMesAnterior[Mes]  := MesFiscalAnterior;
              varIMes[Mes]         := ZeroLeft(IntToStr(Mes),2);
              varIMesAnterior[Mes] := ZeroLeft(IntToStr(MesAnterior),2);

                                                                                                                                                                                            // 'CAST(COALESCE(VALOR,0) AS NUMERIC(12,2))
              Case Mes Of
                   1   : MesFiscalAnterior :=
                        'SUM(CASE  WHEN ' + VarSum[0] + '((strftime(''%m'', DATATRANSACAO) == ''' + varIMes[1] + ''') AND (strftime(''%Y'', DATATRANSACAO) == ''' + IntToStr(ano) + ''')) THEN CAST(COALESCE(VALOR,0) AS NUMERIC(15,2))  END) AS ' + varMesAnterior[1]+ ',';


                   2   : MesFiscalAnterior :=
                        'SUM(CASE  WHEN ' + VarSum[0] + VarSum[1] + '((strftime(''%m'', DATATRANSACAO) == ''' +  varIMes[2] + ''') AND (strftime(''%Y'', DATATRANSACAO) == ''' + IntToStr(ano) + ''')) THEN CAST(COALESCE(VALOR,0) AS NUMERIC(15,2)) END) AS ' + varMesAnterior[2]+ ',';

                   3   : MesFiscalAnterior :=
                         'SUM(CASE  WHEN ' + VarSum[0] + VarSum[1] + VarSum[2] + '((strftime(''%m'', DATATRANSACAO) == ''' +  varIMes[3] + ''') AND (strftime(''%Y'', DATATRANSACAO) == ''' + IntToStr(ano) + ''')) THEN CAST(COALESCE(VALOR,0) AS NUMERIC(15,2)) END) AS ' + varMesAnterior[3]+ ',';

                   4   : MesFiscalAnterior :=
                        'SUM(CASE  WHEN ' + VarSum[0] + VarSum[1] + VarSum[2] + VarSum[3] + '((strftime(''%m'', DATATRANSACAO) == ''' +  varIMes[4] + ''') AND (strftime(''%Y'', DATATRANSACAO) == ''' + IntToStr(ano) + ''')) THEN COALESCE(VALOR,0)  END) AS ' + varMesAnterior[4]+ ',';

                   5   : MesFiscalAnterior :=
                        'SUM(CASE  WHEN ' + VarSum[0] + VarSum[1] + VarSum[2] + VarSum[3] + VarSum[4] + '((strftime(''%m'', DATATRANSACAO) == ''' +  varIMes[5] + ''') AND (strftime(''%Y'', DATATRANSACAO) == ''' + IntToStr(ano) + ''')) THEN COALESCE(VALOR,0)  END) AS ' + varMesAnterior[5]+ ',';

                   6   : MesFiscalAnterior :=
                        'SUM(CASE  WHEN ' + VarSum[0] + VarSum[1] + VarSum[2] + VarSum[3] + VarSum[4] + VarSum[5] + '((strftime(''%m'', DATATRANSACAO) == ''' +  varIMes[6] + ''') AND (strftime(''%Y'', DATATRANSACAO) == ''' + IntToStr(ano) + ''')) THEN COALESCE(VALOR,0)  END) AS ' + varMesAnterior[6]+ ',';

                   7   : MesFiscalAnterior :=
                         'SUM(CASE  WHEN ' + VarSum[0] + VarSum[1] + VarSum[2] + VarSum[3] + VarSum[4] + VarSum[5] + VarSum[6] + '((strftime(''%m'', DATATRANSACAO) == ''' +  varIMes[7] + ''') AND (strftime(''%Y'', DATATRANSACAO) == ''' + IntToStr(ano) + ''')) THEN COALESCE(VALOR,0) END) AS ' + varMesAnterior[7]+ ',';

                   8   : MesFiscalAnterior :=
                        'SUM(CASE  WHEN '  + VarSum[0] + VarSum[1] + VarSum[2] + VarSum[3] + VarSum[4] + VarSum[5] + VarSum[6] + VarSum[7] + '((strftime(''%m'', DATATRANSACAO) == ''' +  varIMes[8] + ''') AND (strftime(''%Y'', DATATRANSACAO) == ''' + IntToStr(ano) + ''')) THEN COALESCE(VALOR,0)  END) AS ' + varMesAnterior[8]+ ',';

                   9   : MesFiscalAnterior :=
                        'SUM(CASE  WHEN '  + VarSum[0] + VarSum[1] + VarSum[2] + VarSum[3] + VarSum[4] + VarSum[5] + VarSum[6] + VarSum[7] + VarSum[8] + '((strftime(''%m'', DATATRANSACAO) == ''' +  varIMes[9] + ''') AND (strftime(''%Y'', DATATRANSACAO) == ''' + IntToStr(ano) + ''')) THEN COALESCE(VALOR,0)  END) AS ' + varMesAnterior[9]+ ',';

                   10  : MesFiscalAnterior :=
                        'SUM(CASE  WHEN ' + VarSum[0] + VarSum[1] + VarSum[2] + VarSum[3] + VarSum[4] + VarSum[5] + VarSum[6] + VarSum[7] + VarSum[8] + VarSum[9] + '((strftime(''%m'', DATATRANSACAO) == ''' + varIMes[10] + ''') AND (strftime(''%Y'', DATATRANSACAO) == ''' + IntToStr(ano) + ''')) THEN COALESCE(VALOR,0)  END) AS ' + varMesAnterior[10]+ ',';

                   11  : MesFiscalAnterior :=
                        'SUM(CASE  WHEN ' + VarSum[0] + VarSum[1] + VarSum[2] + VarSum[3] + VarSum[4] + VarSum[5] + VarSum[6] + VarSum[7] + VarSum[8] + VarSum[9] + VarSum[10] + '((strftime(''%m'', DATATRANSACAO) == ''' + varIMes[11] + ''') AND (strftime(''%Y'', DATATRANSACAO) == ''' + IntToStr(ano) + ''')) THEN COALESCE(VALOR,0) END) AS ' + varMesAnterior[11];

                   //12  : MesFiscalAnterior :=
                   //     'SUM(CASE  WHEN ' + VarSum[0] + VarSum[1] + VarSum[2] + VarSum[3] + VarSum[4] + VarSum[5] + VarSum[6] + VarSum[7] + VarSum[8] + VarSum[9] + VarSum[10]  + VarSum[11] + '((strftime(''%m'', DATATRANSACAO) == ''' + varIMes[12] + ''') AND (strftime(''%Y'', DATATRANSACAO) == ''' + IntToStr(ano) + ''')) THEN COALESCE(VALOR,0)  END) AS ' + varMesAnterior[12];

               End ;

               VarSum[Mes] :=  '((strftime(''%m'', DATATRANSACAO) == ''' + varIMes[Mes] +''') AND (strftime(''%Y'', DATATRANSACAO) == ''' + IntToStr(Ano) + ''')) || ';

            end;

            MesFiscal :=  MesFiscalAnterior;
       end;
     end
     else
     begin
            Case Mes Of
             1   : MesFiscal := strFormatDate + ',' ;
             2   : MesFiscal := strFormatDate + ',' ;
             3   : MesFiscal := strFormatDate + ',' ;
             4   : MesFiscal := strFormatDate + ',' ;
             5   : MesFiscal := strFormatDate + ',' ;
             6   : MesFiscal := strFormatDate + ',' ;
             7   : MesFiscal := strFormatDate + ',' ;
             8   : MesFiscal := strFormatDate + ',' ;
             9   : MesFiscal := strFormatDate + ',' ;
             10  : MesFiscal := strFormatDate + ',' ;
             11  : MesFiscal := strFormatDate + ',' ;
             12  : MesFiscal := strFormatDate + ',' ;
            end;

     end;

   end;
   Result :=  MesFiscal;

end;


procedure TfrmPrincipal.Mensagem(pMensagem: String);
begin
  cxLabelMensagem.Caption := pMensagem;
  PanelSQLSplashScreen.Visible := not pMensagem.IsEmpty;
  Update;
  Application.ProcessMessages;
end;


procedure TfrmPrincipal.Category1Click(Sender: TObject);
begin
   try
   Application.CreateForm( TfrmCategoria,  frmCategoria);
   frmCategoria.ShowModal;
  finally
   FreeAndNil(frmCategoria)
  end;
end;

procedure TfrmPrincipal.cboAnoBaseChange(Sender: TObject);
begin

  if (Dados.BuscaDados = False)  Then Exit;

  if  Dados.varBanco = '1' then
   RelatorioCentroCustoSQLServer(chkForecast.Checked, chkBalance.Checked)
  else if Dados.varBanco = '2' then
       RelatorioCentroCustoSQLITE(chkForecast.Checked, chkBalance.Checked);

end;

procedure TfrmPrincipal.cboBankCloseUp(Sender: TObject);
begin
  if (Dados.BuscaDados = False)  Then Exit;

 if cboBank.ItemIndex <> -1 then
 begin
   idx := cboBank.ItemIndex;
   Dados.varID_Bank := Dados.BuscaID_Bank(Integer(cboBank.Items.Objects[Idx]));

  if  Dados.varBanco = '1' then
     RelatorioCentroCustoSQLServer(chkForecast.Checked, chkBalance.Checked)
  else if Dados.varBanco = '2' then
            RelatorioCentroCustoSQLITE(chkForecast.Checked, chkBalance.Checked);

 end;

end;

procedure TfrmPrincipal.cboBankingCloseUp(Sender: TObject);
begin
  RelatorioCentroCustoSQLServer(chkForecast.Checked, chkBalance.Checked);
end;

procedure TfrmPrincipal.cboCentroCustoCloseUp(Sender: TObject);
begin
  //GerarGraficoCC;
end;

procedure TfrmPrincipal.cboMonth3PropertiesChange(Sender: TObject);
begin
 if Dados.varBanco = '1' then
 begin
    GerarGraficoIE(' and  DATEPART(MONTH, DATATRANSACAO) = ' + QuotedStr(IntToStr(cboMonth3.ItemIndex))
   + ' and DATEPART(YEAR, DATATRANSACAO) = ' + QuotedStr(cboYear3.Text));
 end
 else
 begin
     GerarGraficoIE(' and strftime(''%m'', DATATRANSACAO) = ' + QuotedStr(IntToStr(cboMonth3.ItemIndex))
   + ' and strftime(''%Y'', DATATRANSACAO)  = ' + QuotedStr(cboYear3.Text));
 end;
end;

procedure TfrmPrincipal.cboMonthPropertiesChange(Sender: TObject);
begin
   Dados.ConectarNoBanco;

   if cboBank.Items.Count > 0 then
      idx := cboBank.ItemIndex;

   if Dados.varBanco = '1' then
   begin
       sqlGraficoWeek.Close;
       sqlGraficoWeek.SQL.Clear;
       sqlGraficoWeek.SQL.Add('SELECT CENTRODECUSTO,  DATEPART(week, DATATRANSACAO) as [WEEK], SUM(VALOR * -1) AS VALOR ');
       sqlGraficoWeek.SQL.Add(' FROM TBTRANSACAO ');
       sqlGraficoWeek.SQL.Add(' WHERE 1 = 1 and FORECAST = 0 ');
       sqlGraficoWeek.SQL.Add(' &WHERE1 ');
       sqlGraficoWeek.SQL.Add(' &WHERE2 ');
       sqlGraficoWeek.SQL.Add(' &WHERE3 ');
       sqlGraficoWeek.SQL.Add(' &WHERE4 ');


       sqlGraficoWeek.SQL.Add(' AND CENTRODECUSTO IS NOT NULL ');
       sqlGraficoWeek.SQL.Add(' AND CENTRODECUSTO = :CentrodeCusto ');
       sqlGraficoWeek.SQL.Add(' GROUP BY CENTRODECUSTO,DATEPART(week, DATATRANSACAO) ');
       sqlGraficoWeek.SQL.Add(' ORDER BY DATEPART(week, DATATRANSACAO) ');

       sqlGraficoWeek.Params.ParamByName('CentrodeCusto').AsString := sqlRelat01.Fields.Fields[2].AsString;

       sqlGraficoWeek.MacroByName( 'WHERE1' ).AsRaw := ' AND ID_USER = ' + IntToStr(Dados.varID_USER);

       sqlGraficoWeek.MacroByName( 'WHERE2' ).AsRaw := ' AND MONTH(DATATRANSACAO) = ' + IntToStr(cboMonth.ItemIndex+1);

       sqlGraficoWeek.MacroByName( 'WHERE3' ).AsRaw := ' AND YEAR(DATATRANSACAO) = ' + cboYear.Text;


       if idx <> -1 then
          sqlGraficoWeek.MacroByName( 'WHERE4' ).AsRaw := ' AND ID_BANKING = ' +IntToStr(Integer(cboBank.Items.Objects[Idx]));

       sqlGraficoWeek.Open;
   end
   else if Dados.varBanco = '2' then
        begin

       sqlGraficoWeek.Close;
       sqlGraficoWeek.SQL.Clear;
       sqlGraficoWeek.SQL.Add('SELECT CENTRODECUSTO,  strftime(''%w'', DATATRANSACAO) as [WEEK], Sum(IFNULL(VALOR * -1,0.00)) AS "VALOR ::FLOAT"');
       sqlGraficoWeek.SQL.Add(' FROM TBTRANSACAO ');
       sqlGraficoWeek.SQL.Add(' WHERE 1 = 1 and FORECAST = 0 ');
       sqlGraficoWeek.SQL.Add(' &WHERE1 ');
       sqlGraficoWeek.SQL.Add(' &WHERE2 ');
       sqlGraficoWeek.SQL.Add(' &WHERE3 ');
       sqlGraficoWeek.SQL.Add(' &WHERE4 ');


       sqlGraficoWeek.SQL.Add(' AND CENTRODECUSTO IS NOT NULL ');
       sqlGraficoWeek.SQL.Add(' AND CENTRODECUSTO = :CentrodeCusto ');
       sqlGraficoWeek.SQL.Add(' GROUP BY CENTRODECUSTO, strftime(''%w'', DATATRANSACAO)  ');
       sqlGraficoWeek.SQL.Add(' ORDER BY strftime(''%w'', DATATRANSACAO) ');

       sqlGraficoWeek.Params.ParamByName('CentrodeCusto').AsString := sqlRelat01.Fields.Fields[2].AsString;

       sqlGraficoWeek.MacroByName( 'WHERE1' ).AsRaw := ' AND ID_USER = ' + IntToStr(Dados.varID_USER);

       sqlGraficoWeek.MacroByName( 'WHERE2' ).AsRaw := ' AND MONTH(DATATRANSACAO) = ' + IntToStr(cboMonth.ItemIndex+1);

       sqlGraficoWeek.MacroByName( 'WHERE3' ).AsRaw := ' AND YEAR(DATATRANSACAO) = ' + cboYear.Text;


       if idx <> -1 then
          sqlGraficoWeek.MacroByName( 'WHERE4' ).AsRaw := ' AND ID_BANKING = ' +IntToStr(Integer(cboBank.Items.Objects[Idx]));

       sqlGraficoWeek.Open;
   end
end;

procedure TfrmPrincipal.cboShowMePropertiesChange(Sender: TObject);
begin
//  GerarGraficoTotal;
end;

procedure TfrmPrincipal.cboYearChange(Sender: TObject);
begin
  cboMonth.Properties.OnChange(Nil);
end;

procedure TfrmPrincipal.cboYear3Change(Sender: TObject);
begin

  if Dados.BuscaDados = False then Exit;

  if Dados.varBanco = '1' then
    GerarGraficoIE(' and  DATEPART(YEAR, DATATRANSACAO) = ' + QuotedStr(cboYear3.Text) )
  else
    GerarGraficoIE(' and  strftime(''%Y'', DATATRANSACAO) = ' + QuotedStr(cboYear3.Text) )

end;

procedure TfrmPrincipal.chkBalanceClick(Sender: TObject);
begin
 if Dados.varBanco = '1' then
    RelatorioCentroCustoSQLServer(chkForecast.Checked, chkBalance.Checked)
 else if Dados.varBanco = '2' then
    RelatorioCentroCustoSQLITE(chkForecast.Checked, chkBalance.Checked)
end;

procedure TfrmPrincipal.chkForecastClick(Sender: TObject);
begin

  if Dados.varBanco = '1' then
  begin
      if chkForecast.Checked = True then
        RelatorioCentroCustoSQLServer(chkForecast.Checked)
      else
        RelatorioCentroCustoSQLServer(chkForecast.Checked, chkBalance.Checked);
  end
  else if Dados.varBanco = '2' then

  begin
     if chkForecast.Checked = True then
        RelatorioCentroCustoSQLITE(chkForecast.Checked)
      else
        RelatorioCentroCustoSQLITE(chkForecast.Checked, chkBalance.Checked);

  end;

end;

procedure TfrmPrincipal.CostCenter1Click(Sender: TObject);
begin
  try
   Application.CreateForm( TfrmCentroDeCusto,  frmCentroDeCusto);
   frmCentroDeCusto.ShowModal;
  finally
   FreeAndNil(frmCentroDeCusto)
  end;
end;

procedure TfrmPrincipal.cxGrid1DBBandedTableView1CellDblClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin

   Dados.ConectarNoBanco;

     if cboBank.Items.Count > 0 then
      idx := cboBank.ItemIndex;
   if Dados.varBanco = '1' then
   begin
       sqlDetalhe.Close;
       sqlDetalhe.SQL.Clear;
       sqlDetalhe.SQL.Add('SELECT ID, Favorecido, Categoria, SubCategoria, DataTransacao, Valor, month(datatransacao) as mes, year(datatransacao) as ano FROM TBTRANSACAO ');
       sqlDetalhe.SQL.Add(' Where CentrodeCusto = :CentrodeCusto and FORECAST = 0 and DataTransacao >= :MES_INI and  DataTransacao <= :MES_FIM ');
       sqlDetalhe.SQL.Add(' &WHERE1 ');
       sqlDetalhe.SQL.Add(' &WHERE2 ');
       sqlDetalhe.SQL.Add(' &WHERE3 ');

       sqlDetalhe.SQL.Add(' Order By CAST(DATATRANSACAO   AS DATE) Desc  ');

       sqlDetalhe.Params.ParamByName('CentrodeCusto').AsString := sqlRelat01.Fields.Fields[2].AsString;
       sqlDetalhe.Params.ParamByName('MES_INI').AsDateTime     := IncMonth(IncMonth(System.DateUtils.StartOfTheMonth(dtDateTrans), +1), -13);
       sqlDetalhe.Params.ParamByName('MES_FIM').AsDatetime     := IncMonth(IncMonth(System.DateUtils.EndOfTheMonth(dtDateTrans), -12), 12);

       sqlDetalhe.MacroByName( 'WHERE1' ).AsRaw := ' AND ID_USER = ' + IntToStr(Dados.varID_USER);

       if cxTipo.Text <> '' then
          sqlDetalhe.MacroByName( 'WHERE2' ).AsRaw := ' AND TIPO = ' + QuotedStr(cxTipo.Text);

       if idx <> -1 then
          sqlDetalhe.MacroByName( 'WHERE3' ).AsRaw := ' AND ID_BANKING = ' + IntToStr(Integer(cboBank.Items.Objects[Idx]));

       // sqlDetalhe.SQL.SaveToFile('C:\BIBanco\Detalhe.sql');
       sqlDetalhe.Open;
   end
   else
   begin
       sqlDetalhe.Close;
       sqlDetalhe.SQL.Clear;
       sqlDetalhe.SQL.Add('SELECT ID, Favorecido, Categoria, SubCategoria, DataTransacao, Valor, strftime(''%w'', DATATRANSACAO) as mes, year(datatransacao) as ano FROM TBTRANSACAO ');
       sqlDetalhe.SQL.Add(' Where CentrodeCusto = :CentrodeCusto and FORECAST = 0 and DataTransacao >= :MES_INI and  DataTransacao <= :MES_FIM ');
       sqlDetalhe.SQL.Add(' &WHERE1 ');
       sqlDetalhe.SQL.Add(' &WHERE2 ');
       sqlDetalhe.SQL.Add(' &WHERE3 ');

       sqlDetalhe.SQL.Add(' Order By strftime(''%w'', DATATRANSACAO) Desc  ');

       sqlDetalhe.Params.ParamByName('CentrodeCusto').AsString := sqlRelat01.Fields.Fields[2].AsString;
       sqlDetalhe.Params.ParamByName('MES_INI').AsDateTime     := IncMonth(IncMonth(System.DateUtils.StartOfTheMonth(dtDateTrans), +1), -13);
       sqlDetalhe.Params.ParamByName('MES_FIM').AsDatetime     := IncMonth(IncMonth(System.DateUtils.EndOfTheMonth(dtDateTrans), -12), 12);

       sqlDetalhe.MacroByName( 'WHERE1' ).AsRaw := ' AND ID_USER = ' + IntToStr(Dados.varID_USER);

       if cxTipo.Text <> '' then
          sqlDetalhe.MacroByName( 'WHERE2' ).AsRaw := ' AND TIPO = ' + QuotedStr(cxTipo.Text);

       if idx <> -1 then
          sqlDetalhe.MacroByName( 'WHERE3' ).AsRaw := ' AND ID_BANKING = ' + IntToStr(Integer(cboBank.Items.Objects[Idx]));

       // sqlDetalhe.SQL.SaveToFile('C:\BIBanco\Detalhe.sql');
       sqlDetalhe.Open;
   end;

   if not sqlDetalhe.IsEmpty then
   begin
      Page.ActivePage := TabDetalhe;
      pnlDetalhe.Caption := 'Centro de Custo: '  + sqlRelat01.Fields.Fields[2].AsString;
      //GerarGraficoCC;

      GerarGraficoTotal;

      cboMonth.Properties.OnChange(Nil);

   end;

end;




procedure TfrmPrincipal.cxGrid1DBBandedTableView1StylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
var
  AColumn  : TcxCustomGridTableItem;
  Tipo, Status, vStatus, Boleto, Conciliado : Variant;
begin
  {
  try

    Status  := ARecord.Values[cxGrid1DBBandedTableView1.Columns[0].Index];

    case Status of
//     0 : AStyle  := cxStyleBalance;
     1 : AStyle  := cxStyleIncome;
 //    2 : AStyle  :=  cxStyleExpense

    end;

   Except

  end;
   }

end;

procedure TfrmPrincipal.cxGridDetDBTableView1CellDblClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
   Try
     Application.CreateForm(TfrmVincularCentroCusto, frmVincularCentroCusto);
     frmVincularCentroCusto.lblFavorecido.Caption := sqlDetalhe.FieldByName('Favorecido').AsString;
     if sqlDetalhe.FieldByName('SubCategoria').AsString <> '' then
       frmVincularCentroCusto.lblCategoria.Caption := sqlDetalhe.FieldByName('Categoria').AsString + '_' + sqlDetalhe.FieldByName('SubCategoria').AsString
     else  frmVincularCentroCusto.lblCategoria.Caption := sqlDetalhe.FieldByName('Categoria').AsString ;
     frmVincularCentroCusto.lblValor.Caption := sqlDetalhe.FieldByName('Valor').AsString;
     frmVincularCentroCusto.lblDataCompra.Caption := sqlDetalhe.FieldByName('DataTransacao').AsString;
     frmVincularCentroCusto.bAlterar := True;
     frmVincularCentroCusto.ID_Transacao :=  sqlDetalhe.FieldByName('ID').AsInteger;
     frmVincularCentroCusto.ShowModal;

     if frmVincularCentroCusto.ModalResult = mrOk  then
     begin
        if frmVincularCentroCusto.bAlterar then
        begin
           sqlAux.Close;
           sqlAux.SQL.Clear;
           sqlAux.SQL.Add('Update TBTransacao Set CentrodeCusto = :CentrodeCusto');
           sqlAux.SQL.Add(' Where ID = :ID ');
           sqlAux.Params.ParamByName('CentrodeCusto').AsString :=  frmVincularCentroCusto.cboCC.Text;
           sqlAux.Params.ParamByName('ID').AsInteger           :=  sqlDetalhe.FieldByName('ID').AsInteger;
              Try
                 sqlAux.ExecSQL;
              except
                 on E : Exception do
                   Mens_MensErro(E.ClassName+' error raised, with message : '+E.Message);
              end;

        end;
        RelatorioCentroCustoSQLServer;
     end;


   Finally
     FreeAndNil(frmVincularCentroCusto);
   End;

end;

procedure TfrmPrincipal.cxTableViewSEMANACategoriesGetValueDisplayText(
  Sender: TObject; const AValue: Variant; var ADisplayText: string);
  function GetValueIndex: Integer;

  begin

    for Result := 0 to cxTableViewSEMANA.Categories.VisibleValueCount - 1 do

      if cxTableViewSEMANA.Categories.VisibleValues[Result] = AValue then

        Exit;

    Result := -1;

  end;

var

  AValueIndex: Integer;

  AValueCaption: string;


begin
  AValueIndex := GetValueIndex;

  if AValueIndex = -1 then

    Exit;


  AValueCaption := 'Expense:' + cxTableViewSEMANA.DiagramPie.GetValueCaption(cxTableViewSEMANASeries1, AValueIndex);
  AValueCaption := AValueCaption + ' Income:' +  cxTableViewSEMANA.DiagramPie.GetValueCaption(cxTableViewSEMANASeries2, AValueIndex);
  ADisplayText := ADisplayText + ' - ' + AValueCaption;

end;

procedure TfrmPrincipal.cxTipoPropertiesChange(Sender: TObject);
begin

 if (Dados.BuscaDados = False)  Then Exit;

 if cboBank.ItemIndex <> -1 then
 begin
   idx := cboBank.ItemIndex;
   Dados.varID_Bank := Dados.BuscaID_Bank(Integer(cboBank.Items.Objects[Idx]));

  if  Dados.varBanco = '1' then
     RelatorioCentroCustoSQLServer(chkForecast.Checked, chkBalance.Checked)
  else if Dados.varBanco = '2' then
            RelatorioCentroCustoSQLITE(chkForecast.Checked, chkBalance.Checked);

 end;

end;

procedure   TfrmPrincipal.GerarGraficoIE (varPeriodo : String);
begin
    Dados.ConectarNoBanco;

   if cboBank.Items.Count > 0 then
      idx := cboBank.ItemIndex;


    sqlGrafIE.Close;
    sqlGrafIE.SQL.Clear;
    if Dados.varBanco = '1' then
    begin

        sqlGrafIE.SQL.Add(' WITH DADOS AS ( ');
        sqlGrafIE.SQL.Add('SELECT DATEPART(WEEK, A.DATATRANSACAO) SEMANA,  ');
        sqlGrafIE.SQL.Add('(SELECT SUM(B.VALOR * -1) AS VALOR  ');
        sqlGrafIE.SQL.Add('FROM TBTRANSACAO B   ');
        sqlGrafIE.SQL.Add('WHERE B.TIPO = ''EXPENSE'' and FORECAST = 0  ');
        sqlGrafIE.SQL.Add( varPeriodo );
        sqlGrafIE.SQL.Add(' &WHERE1 ');
        sqlGrafIE.SQL.Add(' &WHERE2 ');
        sqlGrafIE.SQL.Add('AND B.CENTRODECUSTO IS NOT NULL  ');
        sqlGrafIE.SQL.Add('AND DATEPART(WEEK, B.DATATRANSACAO)  = DATEPART(WEEK, A.DATATRANSACAO)');
        sqlGrafIE.SQL.Add('AND B.TIPO = A.TIPO ');
        sqlGrafIE.SQL.Add('AND B.Favorecido = A.Favorecido ');
        sqlGrafIE.SQL.Add('AND B.Categoria = A.Categoria ');
        sqlGrafIE.SQL.Add('AND B.SubCategoria = A.SubCategoria ');
        sqlGrafIE.SQL.Add('AND B.ID = A.Id  ');
        sqlGrafIE.SQL.Add('GROUP BY B.TIPO, DATEPART(WEEK, B.DATATRANSACAO) ) AS VALOR_EXPENSE,');
        sqlGrafIE.SQL.Add('(SELECT SUM(C.VALOR) AS VALOR  ');
        sqlGrafIE.SQL.Add('FROM TBTRANSACAO C  ');
        sqlGrafIE.SQL.Add('WHERE C.TIPO = ''INCOME'' and FORECAST = 0  ');
        sqlGrafIE.SQL.Add( varPeriodo );
        sqlGrafIE.SQL.Add(' &WHERE1 ');
        sqlGrafIE.SQL.Add(' &WHERE2 ');
        sqlGrafIE.SQL.Add('AND C.CENTRODECUSTO IS NOT NULL  ');
        sqlGrafIE.SQL.Add('AND DATEPART(WEEK, C.DATATRANSACAO)  = DATEPART(WEEK, A.DATATRANSACAO) ');
        sqlGrafIE.SQL.Add('AND C.TIPO = A.TIPO');
        sqlGrafIE.SQL.Add('AND C.Favorecido = A.Favorecido  ');
        sqlGrafIE.SQL.Add('AND C.Categoria = A.Categoria ');
        sqlGrafIE.SQL.Add('AND C.SubCategoria = A.SubCategoria  ');
        sqlGrafIE.SQL.Add('AND C.ID = A.ID  ');
        sqlGrafIE.SQL.Add('GROUP BY C.TIPO, DATEPART(WEEK, C.DATATRANSACAO) ) AS VALOR_INCOME ');
        sqlGrafIE.SQL.Add('FROM TBTRANSACAO A WHERE  A.FORECAST = 0  ');
        sqlGrafIE.SQL.Add(')  ');
        sqlGrafIE.SQL.Add('SELECT SEMANA, SUM(VALOR_EXPENSE) AS EXPENSE, SUM (VALOR_INCOME) AS INCOME ');
        sqlGrafIE.SQL.Add('FROM DADOS ');
        sqlGrafIE.SQL.Add('GROUP BY SEMANA  ');
        sqlGrafIE.SQL.Add('ORDER BY SEMANA ');

        sqlGrafIE.MacroByName( 'WHERE1' ).AsRaw := ' AND ID_USER = ' + IntToStr(Dados.varID_USER);


        if idx <> -1 then
          sqlGrafIE.MacroByName( 'WHERE2' ).AsRaw := ' AND ID_BANKING = ' + IntToStr(Integer(cboBank.Items.Objects[Idx]));

        sqlGrafIE.Open;

    end
    else
    begin


       sqlGrafIE.SQL.Add('SELECT CAST(strftime(''%w'', DATATRANSACAO) AS "SEMANA ::BIGINT") AS SEMANA , ');

       sqlGrafIE.SQL.Add('coalesce(SUM((SELECT COALESCE(B.VALOR * -1,0) ');
       sqlGrafIE.SQL.Add('FROM TBTRANSACAO B  ');
       sqlGrafIE.SQL.Add('WHERE B.TIPO = ''EXPENSE'' and FORECAST = 0   ');
       sqlGrafIE.SQL.Add( varPeriodo );
       sqlGrafIE.SQL.Add(' &WHERE1 ');
       sqlGrafIE.SQL.Add(' &WHERE2 ');
       sqlGrafIE.SQL.Add('AND B.CENTRODECUSTO IS NOT NULL ');
       sqlGrafIE.SQL.Add('AND strftime(''%w'', B.DATATRANSACAO)  =  strftime(''%w'', A.DATATRANSACAO)  ');
       sqlGrafIE.SQL.Add('AND B.TIPO = A.TIPO ');
       sqlGrafIE.SQL.Add('AND B.Favorecido = A.Favorecido ');
       sqlGrafIE.SQL.Add('AND B.Categoria = A.Categoria  ');
       sqlGrafIE.SQL.Add('AND B.SubCategoria = A.SubCategoria  ');
       sqlGrafIE.SQL.Add('AND B.ID = A.Id  ');
       sqlGrafIE.SQL.Add('GROUP BY B.TIPO, strftime(''%w'', B.DATATRANSACAO) ');
       sqlGrafIE.SQL.Add(')), 0.00) AS VALOR_EXPENSE , ');

       sqlGrafIE.SQL.Add('coalesce(SUM((SELECT COALESCE(C.VALOR,0) ');
       sqlGrafIE.SQL.Add('FROM TBTRANSACAO C  ');
       sqlGrafIE.SQL.Add(' WHERE C.TIPO = ''INCOME'' and FORECAST = 0');
       sqlGrafIE.SQL.Add( varPeriodo );
       sqlGrafIE.SQL.Add(' &WHERE1 ');
       sqlGrafIE.SQL.Add(' &WHERE2 ');
       sqlGrafIE.SQL.Add('AND C.CENTRODECUSTO IS NOT NULL  ');
       sqlGrafIE.SQL.Add('AND strftime(''%w'', C.DATATRANSACAO)  = strftime(''%w'', A.DATATRANSACAO)  ');
       sqlGrafIE.SQL.Add('AND C.TIPO = A.TIPO ');
       sqlGrafIE.SQL.Add('AND C.Favorecido = A.Favorecido ');
       sqlGrafIE.SQL.Add('AND C.Categoria = A.Categoria ');
       sqlGrafIE.SQL.Add('AND C.SubCategoria = A.SubCategoria ');
       sqlGrafIE.SQL.Add('AND C.ID = A.ID   ');
       sqlGrafIE.SQL.Add('GROUP BY C.TIPO, strftime(''%w'', C.DATATRANSACAO)  ');
       sqlGrafIE.SQL.Add(')), 0.00) AS VALOR_INCOME ');

       sqlGrafIE.SQL.Add('FROM TBTRANSACAO A WHERE  A.FORECAST = 0 ');
       sqlGrafIE.SQL.Add('group by strftime(''%w'', DATATRANSACAO)   ');

       sqlGrafIE.MacroByName( 'WHERE1' ).AsRaw := ' AND ID_USER = ' + IntToStr(Dados.varID_USER);


       if idx <> -1 then
         sqlGrafIE.MacroByName( 'WHERE2' ).AsRaw := ' AND ID_BANKING = ' + IntToStr(Integer(cboBank.Items.Objects[Idx]));

       sqlGrafIE.SQL.SaveToFile('c:\bibanco\sqlGrafIE.sql');

       sqlGrafIE.Open;

    end;
end;

procedure TfrmPrincipal.dtDateTransPropertiesChange(Sender: TObject);
begin
  //GerarGraficoCC;
end;

procedure TfrmPrincipal.Exit1Click(Sender: TObject);
begin
  Close;
end;



procedure TfrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   cxGrid1DBBandedTableView1.ClearItems;
   if ABand <> Nil then
   begin
       ABand.Bands.Clear;
   end;

  frmPrincipal := nil;
  Action := caFree;

end;

procedure TfrmPrincipal.ListaBancos;
begin

  sqlBank.Close;
  sqlBank.sql.Clear;
  sqlBank.SQL.Add('Select  UB.ID_USERBANK, B.NAME, B.ID_BANKING, UB.APELIDO from TBBANKING B ');
  sqlBank.SQL.Add(' Inner join TBUSERBANK UB on UB.ID_BANK = B.ID_BANKING ');
  sqlBank.SQL.Add(' where UB.ID_USER = :ID_USER ' );
  sqlBank.SQL.Add(' order by UB.ID_BANK');
  sqlBank.Params.ParamByName('ID_USER').AsInteger := Dados.varID_USER;
  sqlBank.Open;
  sqlBank.First;
  cboBank.Items.Clear;
  while not sqlBank.Eof do
  begin
      cboBank.Items.AddObject(sqlBank.FieldByName('NAME').AsString + '-' + sqlBank.FieldByName('APELIDO').AsString , TObject(sqlBank.FieldByName('ID_USERBANK').AsInteger ));
      sqlBank.Next;
  end;

  idx := -1;
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
var
 varYear,varYearFuture: String;
 varDataAtual : TDateTime;
begin

   varYearFuture := '';
   SqlAux.Close;
   SqlAux.SQL.Clear;
   SqlAux.SQL.Add('select ANOFUTURO from TBPERIODO where ANOATUAL = :ANOATUAL');
   SqlAux.Params.ParamByName('ANOATUAL').AsString := IntToStr(YearOf(Now));
   SqlAux.Open;
   varYearFuture := SqlAux.FieldByName('ANOFUTURO').AsString;
   SqlAux.Close;
   Page.ActivePage := TabTransacao;

   if varYearFuture <> '' then
   begin
       varDataAtual       := StrToDate('01/01/' + varYearFuture);
       dtDateTrans        := varDataAtual;
       varYear            := IntToStr(Yearof(IncYear(varDataAtual, -1)));
       cboMonth.ItemIndex := MonthOf(varDataAtual)-1;
       cboYear.ItemIndex  := cboYear.Items.IndexOf(varYear);
   end;

   ListaBancos;

   if Dados.varBanco = '1' then
     RelatorioCentroCustoSQLServer(chkForecast.Checked, chkBalance.Checked)
   else if Dados.varBanco = '2' then
   begin
     RelatorioCentroCustoSQLITE(chkForecast.Checked, chkBalance.Checked);
   end;

end;

end.
