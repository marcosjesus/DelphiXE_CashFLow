unit uFrmAddTransacao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic,
  dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinVS2010, dxSkinWhiteprint, dxSkinXmas2008Blue,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Vcl.ComCtrls, dxCore, cxDateUtils,
  Vcl.StdCtrls, cxDropDownEdit, cxCalendar, cxMaskEdit, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.DBCtrls, cxLabel, cxTextEdit,
  Vcl.ExtCtrls, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, cxCurrencyEdit,
  Vcl.Menus, cxButtons, cxCheckBox, Vcl.Samples.Spin;

type
  TfrmAddTransacao = class(TForm)
    Panel2: TPanel;
    cboTipoMov: TcxComboBox;
    sqlCentroCusto: TFDQuery;
    dsCentroCusto: TDataSource;
    lblpagamento: TLabel;
    edtFavorecido: TEdit;
    edtCategoria: TEdit;
    lblValor: TLabel;
    edtSubCategoria: TEdit;
    lblTransData: TLabel;
    dtDateTrans: TcxDateEdit;
    pnlTitulo: TPanel;
    editValor: TcxCurrencyEdit;
    lblTipoMov: TLabel;
    btnCancelar: TcxButton;
    btnSalvar: TcxButton;
    sqlSalvar: TFDQuery;
    cxForecast: TcxCheckBox;
    dsBank: TDataSource;
    sqlBank: TFDQuery;
    cboBank: TComboBox;
    cboCC: TComboBox;
    lblCentroCusto: TLabel;
    lblFavorecido: TLabel;
    lblCategoria: TLabel;
    lblSubCategoria: TLabel;
    edtRepeat: TSpinEdit;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    Idx, IdxCC : Integer;
    procedure LimpaTela;
    procedure FiltroCentrodeCusto(varFiltro : String);

    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAddTransacao: TfrmAddTransacao;

implementation

{$R *.dfm}

uses MensFun, uDados, uFunctions;

procedure TfrmAddTransacao.btnSalvarClick(Sender: TObject);
var
  i : Integer;
  varNextDate : TDatetime;
begin

  if cboBank.Text = '' then
  begin
    Mens_MensInf( Dados.RetornaMensagem('MEN_SELECTBANK'));
    cboBank.SetFocus;
    Exit;
  end;


  if cboTipoMov.ItemIndex = -1 then
  begin
    Mens_MensInf( Dados.RetornaMensagem('MEN_TIPO_TRANSACAO') );
    cboTipoMov.SetFocus;
    Exit;
  end;


  if editValor.Text = '' then
  begin
     Mens_MensInf( Dados.RetornaMensagem('MEN_MENS_INFTRAAMOU') );
     editValor.SetFocus;
     Exit;
  end;


  if dtDateTrans.Text = '' then
  begin
     Mens_MensInf( Dados.RetornaMensagem('MEN_MENS_INFTRADAT') );
     dtDateTrans.SetFocus;
     Exit;
  end;


  if cboCC.ItemIndex = -1 then
  begin
    Mens_MensInf( Dados.RetornaMensagem('MEN_MENS_SELCC') );
    cboCC.SetFocus;
    Exit;
  end;

  if edtFavorecido.Text = '' then
  begin
     Mens_MensInf( Dados.RetornaMensagem('MEN_MENS_INFCIA') );
     edtFavorecido.SetFocus;
     Exit;
  end;
  idx   := cboBank.ItemIndex;
  IdxCC := cboCC.ItemIndex;

  varNextDate :=  dtDateTrans.Date;
  for I := 1 to edtRepeat.Value - 1 do
  begin

      sqlSalvar.Close;
      sqlSalvar.SQL.Clear;
      sqlSalvar.SQL.Add('INSERT INTO TBTRANSACAO ');
      sqlSalvar.SQL.Add('           (ID_USER ');
      sqlSalvar.SQL.Add('           ,ID_BANKING');
      sqlSalvar.SQL.Add('           ,Tipo ');
      sqlSalvar.SQL.Add('           ,DataTransacao');
      sqlSalvar.SQL.Add('           ,Favorecido');
      if edtCategoria.Text <> '' then
        sqlSalvar.SQL.Add('         ,Categoria');
      if edtSubCategoria.Text <> '' then
        sqlSalvar.SQL.Add('         ,SubCategoria');
      sqlSalvar.SQL.Add('           ,Valor ');
      sqlSalvar.SQL.Add('           ,Forecast ');
      sqlSalvar.SQL.Add('           ,ID_USERBANK ');
      sqlSalvar.SQL.Add('           ,MODO ');
      sqlSalvar.SQL.Add('           ,CENTRODECUSTO) ');

      sqlSalvar.SQL.Add('     VALUES  ');
      sqlSalvar.SQL.Add('           (:ID_USER  ');
      sqlSalvar.SQL.Add('           ,:ID_BANKING');
      sqlSalvar.SQL.Add('           ,:TIPO');
      sqlSalvar.SQL.Add('           ,:DATATRANSACAO');
      sqlSalvar.SQL.Add('           ,:FAVORECIDO');
      if edtCategoria.Text <> '' then
        sqlSalvar.SQL.Add('         ,:CATEGORIA');
      if edtSubCategoria.Text <> '' then
        sqlSalvar.SQL.Add('         ,:SUBCATEGORIA');
      sqlSalvar.SQL.Add('           ,:VALOR');
      sqlSalvar.SQL.Add('           ,:Forecast ');
      sqlSalvar.SQL.Add('           ,:ID_USERBANK ');
      sqlSalvar.SQL.Add('           ,:MODO ');
      sqlSalvar.SQL.Add('           ,:CENTRODECUSTO)');

      sqlSalvar.Params.ParamByName('ID_USER').AsInteger :=  Dados.varID_USER;
      sqlSalvar.Params.ParamByName('ID_BANKING').AsInteger :=  Dados.varID_Bank;
      sqlSalvar.Params.ParamByName('TIPO').AsString :=  cboTipoMov.Text;
      sqlSalvar.Params.ParamByName('DATATRANSACAO').AsString :=  FormatDateTime('yyyy-mm-dd',(varNextDate));
      sqlSalvar.Params.ParamByName('FAVORECIDO').AsString := UpperCase(Trim(edtFavorecido.Text));

      if edtCategoria.Text <> '' then
        sqlSalvar.Params.ParamByName('CATEGORIA').AsString :=  UpperCase(Trim(edtCategoria.Text));
      if edtSubCategoria.Text <> '' then
        sqlSalvar.Params.ParamByName('SUBCATEGORIA').AsString := UpperCase(Trim(edtSubCategoria.Text));

      if cboTipoMov.ItemIndex = 0 then
         editValor.Value := editValor.Value * -1
      else editValor.Value := Abs(editValor.Value);

      sqlSalvar.Params.ParamByName('VALOR').AsString :=  FloatToStrWithDecimalPoint(editValor.Value, Dados.varRegiao);

      if cxForecast.Checked then
        sqlSalvar.Params.ParamByName('Forecast').AsInteger := 1
      else   sqlSalvar.Params.ParamByName('Forecast').AsInteger := 0;

      sqlSalvar.Params.ParamByName('MODO').AsString := 'M';
      sqlSalvar.Params.ParamByName('ID_USERBANK').AsInteger := Integer(cboBank.Items.Objects[Idx]);
      sqlSalvar.Params.ParamByName('CENTRODECUSTO').AsString := cboCC.Text;

      Try
        sqlSalvar.ExecSQL;
      except
        on E : Exception do
          Mens_MensErro(E.ClassName+' error raised, with message : '+E.Message);
      end;

       varNextDate := IncMonth(varNextDate, 1)
  end;

  Mens_MensInf( Dados.RetornaMensagem('MEN_REC_SAVE') );
  LimpaTela;

end;

procedure  TfrmAddTransacao.LimpaTela;
begin
 cboTipoMov.ItemIndex := -1;
 editValor.Text := '';
 dtDateTrans.Date := Now;
 cboCC.ItemIndex := -1;
 edtFavorecido.Text := '';
 edtCategoria.Text := '';
 edtSubCategoria.Text := '';
end;

procedure TfrmAddTransacao.FormCreate(Sender: TObject);
begin
 Dados.ConectarNoBanco;

 sqlBank.Close;
 sqlBank.sql.Clear;
 sqlBank.SQL.Add('Select * from TBBANKING order by ID_Banking');
 sqlBank.Open;
 sqlBank.First;
 cboBank.Items.Clear;
 while not sqlBank.Eof do
 begin
    cboBank.Items.AddObject(sqlBank.FieldByName('NAME').AsString, TObject(sqlBank.FieldByName('ID_BANKING').AsInteger ));
    sqlBank.Next;
 end;


 Caption                 := Dados.RetornaMensagem('MEN_MENS_ADDTRAN');
 pnlTitulo.Caption       := Dados.RetornaMensagem('MEN_MENS_ADDTRAN');
 lblpagamento.Caption    := Dados.RetornaMensagem('MEN_MENS_PAYMENT');
 lblTipoMov.Caption      := Dados.RetornaMensagem('MEN_TIPO_TRANSACAO');
 lblValor.Caption        := Dados.RetornaMensagem('MEN_VALUE');
 lblTransData.Caption    := Dados.RetornaMensagem('MEN_DATA_TRANSACAO');
 lblCentroCusto.Caption  := Dados.RetornaMensagem('MEN_MNU_NIVEL_0_2');
 lblFavorecido.Caption   := Dados.RetornaMensagem('MEN_DATA_FAVORECIDO');
 lblCategoria.Caption    := Dados.RetornaMensagem('MEN_MNU_NIVEL_0_1');
 lblSubCategoria.Caption := Dados.RetornaMensagem('MEN_MNU_NIVEL_0_5');
 btnSalvar.Caption       := Dados.RetornaMensagem('MEN_MNU_SALVAR');
 btnCancelar.Caption     := Dados.RetornaMensagem('MEN_MNU_FECHAR');

 dtDateTrans.Date         := Now;

 FiltroCentrodeCusto('');

end;

procedure  TfrmAddTransacao.FiltroCentrodeCusto(varFiltro : String);
begin
 sqlCentroCusto.Close;
 sqlCentroCusto.SQL.Clear;
 sqlCentroCusto.SQL.Add('Select * from CentrodeCusto Where ID_LANGUAGE = :ID_LANGUAGE and ID_USER = :ID_USER Order by CENTRODECUSTO, GRUPO ');
 sqlCentroCusto.Params.ParamByName('ID_LANGUAGE').AsInteger := 1; //Dados.varID_Language;
 sqlCentroCusto.Params.ParamByName('ID_USER').AsInteger := Dados.varID_USER;
 sqlCentroCusto.Open;

 sqlCentroCusto.First;
 while not sqlCentroCusto.Eof do
 begin
     cboCC.Items.AddObject(sqlCentroCusto.FieldByName('CentrodeCusto').AsString, TObject(sqlCentroCusto.FieldByName('ID_CentrodeCusto').AsInteger));
     sqlCentroCusto.Next;
 end;

end;

procedure TfrmAddTransacao.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if Key=VK_RETURN then
    frmAddTransacao.Perform(WM_NEXTDLGCTL, 0, 0);
end;

end.
