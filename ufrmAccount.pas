unit ufrmAccount;

interface

uses

  System.DateUtils,
  System.StrUtils,
  ShellAPI,
  dxSpreadSheet,
  dxSpreadSheetTypes,
  dxSpreadSheetCore,
  cxCurrencyEdit,

  System.IOUtils,
  IniFiles,
  System.RegularExpressions,
  ComObj,
  Data.SqlTimSt,

  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore,
  dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
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
  dxSkinXmas2008Blue, Vcl.Menus, Vcl.StdCtrls, cxButtons, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  dxSkinscxPCPainter, dxBarBuiltInMenu, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxNavigator, Data.DB, cxDBData, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, cxPC, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.Mask, cxButtonEdit, Vcl.FileCtrl, Vcl.ComCtrls, dxCore, cxDateUtils,
  cxCalendar;

type
  TfrmAccount = class(TForm)
    pnlTitulo: TPanel;
    Page: TcxPageControl;
    TabUsuario: TcxTabSheet;
    sqlUsuario: TFDQuery;
    dsUsuario: TDataSource;
    Panel1: TPanel;
    lblFavorecido: TLabel;
    lblCategoria: TLabel;
    lblSubCategoria: TLabel;
    Label1: TLabel;
    edtPwd: TEdit;
    edtEmail: TEdit;
    edtFullname: TEdit;
    edtphone: TEdit;
    sqlAux: TFDQuery;
    sqlUsuarioBanco: TFDQuery;
    dsUsuarioBanco: TDataSource;
    sqlUsuarioBancoID_USERBANK: TFDAutoIncField;
    sqlUsuarioBancoNAME: TWideStringField;
    sqlUsuarioBancoSALDO_INICIAL: TBCDField;
    sqlUsuarioBancoPATH: TStringField;
    Panel2: TPanel;
    Panel3: TPanel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1DBTableView1NAME: TcxGridDBColumn;
    cxGrid1DBTableView1SALDO_INICIAL: TcxGridDBColumn;
    cxGrid1DBTableView1PATH: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    Panel4: TPanel;
    btnSalvar: TcxButton;
    btnCancelar: TcxButton;
    Label2: TLabel;
    cboBanco: TComboBox;
    Label3: TLabel;
    sqlBank: TFDQuery;
    sqlBankID_BANKING: TFDAutoIncField;
    sqlBankNAME: TStringField;
    dsBank: TDataSource;
    edtSaldoInicial: TcxCurrencyEdit;
    edtPathSalvar: TcxButtonEdit;
    edtApelido: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    sqlUsuarioBancoAPELIDO: TStringField;
    cxGrid1DBTableView1APELIDO: TcxGridDBColumn;
    sqlUsuarioBancoID_BANK: TIntegerField;
    Label6: TLabel;
    dtStartDate: TcxDateEdit;
    procedure btnSalvarClick(Sender: TObject);
    procedure edtPathSalvarClick(Sender: TObject);
    procedure cxGrid1DBTableView1CellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    Idx: Integer;
    varUpdate : Boolean;
    varIDUserBank : Integer;
    procedure ListaBancos;
  public
    { Public declarations }
  end;

var
  frmAccount: TfrmAccount;

implementation

{$R *.dfm}

uses MensFun, uDados, uFunctions;

procedure TfrmAccount.ListaBancos;
begin

  sqlBank.Close;
  sqlBank.sql.Clear;
  sqlBank.SQL.Add('Select B.NAME, UB.SALDO_INICIAL, UB.PATH from TBBANKING B ');
  sqlBank.SQL.Add(' Inner join TBUSERBANK UB on UB.ID_BANK = B.ID_BANKING ');
  sqlBank.SQL.Add(' where UB.ID_USER = :ID_USER ' );
  sqlBank.SQL.Add(' order by UB.ID_BANK');
  sqlBank.Params.ParamByName('ID_USER').AsInteger := Dados.varID_USER;
  sqlBank.Open;
  sqlBank.First;

end;


procedure TfrmAccount.btnCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmAccount.btnSalvarClick(Sender: TObject);
var
  varMsg: TStringList;
  varIdUser, varIdUserOLD,  varIdLanguage, VarNewBank : Integer;
begin


  if edtFullName.Text = '' then
  begin
     Mens_MensInf('Type your FullName.') ;
     edtFullName.SetFocus ;
     Exit ;
  end;

  if edtEmail.Text = '' then
  begin
     Mens_MensInf('Type your E-mail.') ;
     edtEmail.SetFocus ;
     Exit ;
  end;

  if IsValidEmailRegEx(edtEmail.Text) = False Then
  begin
     Mens_MensInf('Invalid E-mail.');
     edtEmail.SetFocus ;
     Exit ;
  end;

  if edtPwd.Text = '' then
  begin
     Mens_MensInf('Type your Password.') ;
     edtPwd.SetFocus ;
     Exit ;
  end;

  if EdtPhone.Text = '(999)999-9999' then
  begin
     Mens_MensInf('Type your Phone Number.') ;
     EdtPhone.SetFocus ;
     Exit ;
  end;




  sqlUsuario.Close;
  sqlUsuario.SQL.Clear;
  sqlUsuario.SQL.Add(' Update TBUSER  ');
  sqlUsuario.SQL.Add(' SET EMAIL = :EMAIL ');
  sqlUsuario.SQL.Add(' ,PWD  = :PWD ');
  sqlUsuario.SQL.Add(' ,PHONE_NUMBER = :PHONE_NUMBER ');
  sqlUsuario.SQL.Add(' WHERE ID_USER = :ID_USER ');

  sqlUsuario.Params.ParamByName('EMAIL').AsString        :=  edtEmail.Text;
  sqlUsuario.Params.ParamByName('PWD').AsString          :=  Trim(edtPwd.Text);
  sqlUsuario.Params.ParamByName('PHONE_NUMBER').AsString :=  EdtPhone.Text;
  sqlUsuario.Params.ParamByName('ID_USER').AsInteger     :=  Dados.varID_USER;

  Try
      sqlUsuario.ExecSQL;
  except
      on E : Exception do
        Mens_MensErro(E.ClassName+' error raised, with message : '+E.Message);
  end;



  idx := cboBanco.ItemIndex;

  if Idx <> -1 then
  begin
      if edtApelido.text = '' then begin
        Mens_MensInf( Dados.RetornaMensagem('MEN_SELECTFILE') + ' - APELIDO' );
        edtApelido.SetFocus;
        Exit;
      end;


      if edtPathSalvar.text = '' then begin
        Mens_MensInf( Dados.RetornaMensagem('MEN_SELECTFILE') );
        edtPathSalvar.SetFocus;
        Exit;
      end;

      if varUpdate = False then
      begin
          sqlAux.Close;
          sqlAux.SQL.Clear;
          sqlAux.SQL.Add('Insert into TBUSERBANK (ID_USER, ID_BANK, SALDO_INICIAL, PATH, APELIDO, DATA_SALDO_INICIAL) Values');
          sqlAux.SQL.Add('(:ID_USER, :ID_BANK, :SALDO_INICIAL, :PATH, :APELIDO, :DATA_SALDO_INICIAL)');
          sqlAux.Params.ParamByName('ID_USER').AsInteger     := Dados.varID_USER;
          sqlAux.Params.ParamByName('ID_BANK').AsInteger     := Integer(cboBanco.Items.Objects[Idx]);
          sqlAux.Params.ParamByName('SALDO_INICIAL').AsFloat := edtSaldoInicial.Value;
          sqlAux.Params.ParamByName('PATH').AsString         := edtPathSalvar.text ;
          sqlAux.Params.ParamByName('APELIDO').AsString      := edtApelido.text ;
          sqlAux.Params.ParamByName('DATA_SALDO_INICIAL').AsSQLTimeStamp  := DateTimeToSQLTimeStamp(dtStartDate.Date);

          Try
            sqlAux.ExecSQL;
          except
            on E : Exception do
              Mens_MensErro(E.ClassName+' error raised, with message : '+E.Message);
          end;
          VarNewBank := 0;
          if Dados.varBanco = '1' then
          begin
            sqlAux.Close;
            sqlAux.SQL.Clear;
            sqlAux.SQL.Add(' Select @@IDENTITY as ID_USER ');
            sqlAux.Open;
          end
          else if Dados.varBanco = '2' then
          begin
            sqlAux.Close;
            sqlAux.SQL.Clear;
            sqlAux.SQL.Add(' select last_insert_rowid() as ID_USER; ');
            sqlAux.Open;
          end;

           VarNewBank := sqlAux.FieldByName('ID_USER').AsInteger;

          if not System.IOUtils.TDirectory.Exists( edtPathSalvar.Text + '\BACKUP\'  ) then
          begin
              System.IOUtils.TDirectory.CreateDirectory( edtPathSalvar.Text + '\BACKUP\'  );
              Application.MessageBox( PWideChar( 'Backup folder created in ' + edtPathSalvar.Text + ' To Bank Files imported'),  'Account', MB_ICONINFORMATION);;
          end;

         sqlAux.Close;
         sqlAux.SQL.Clear;
         sqlAux.SQL.Add('Insert Into TBTransacao (ID_USER, ID_BANKING, Tipo, DataTransacao, Favorecido,  Valor, CentroDeCusto,ID_USERBANK, MODO) Values ( ');
         sqlAux.SQL.Add(':ID_USER, :ID_BANKING, :Tipo, :DataTransacao, :Favorecido,  :Valor, :CentroDeCusto,:ID_USERBANK, :MODO) ');
         sqlAux.Params.ParamByName('ID_USER').AsInteger      := Dados.varID_USER;
         sqlAux.Params.ParamByName('ID_BANKING').AsInteger   := Dados.varID_Bank;
         sqlAux.Params.ParamByName('Tipo').AsString          := 'INCOME';

         sqlAux.Params.ParamByName('DataTransacao').AsSQLTimeStamp  := DateTimeToSQLTimeStamp(System.DateUtils.EndOfTheYear(IncYear(dtStartDate.Date, -1)));

         sqlAux.Params.ParamByName('Favorecido').AsString    := Trim(edtFullName.Text);

         sqlAux.Params.ParamByName('Valor').AsFloat := edtSaldoInicial.Value;
         sqlAux.Params.ParamByName('CentroDeCusto').AsString := 'BALANCE';
         sqlAux.Params.ParamByName('ID_USERBANK').AsInteger  := VarNewBank;
         sqlAux.Params.ParamByName('MODO').AsString          := 'S';  // I - Importado - M - Manual - S - Saldo Inicial

         Try
            sqlAux.ExecSQL;
         except
            on E : Exception do
              Mens_MensErro(E.ClassName+' error raised, with message : '+E.Message);
         end;


      end
      else
      begin

          sqlAux.Close;
          sqlAux.SQL.Clear;
          sqlAux.SQL.Add('Update TBUSERBANK ');
          sqlAux.SQL.Add(' Set ID_BANK = :ID_BANK ');
          sqlAux.SQL.Add(' ,SALDO_INICIAL = :SALDO_INICIAL ');
          sqlAux.SQL.Add(' ,PATH = :PATH ');
          sqlAux.SQL.Add(' ,APELIDO = :APELIDO ');
          sqlAux.SQL.Add(' ,DATA_SALDO_INICIAL = :DATA_SALDO_INICIAL ');
          sqlAux.SQL.Add(' Where ID_USERBANK = :ID_USERBANK AND ID_USER = :ID_USER');
          sqlAux.Params.ParamByName('ID_USER').AsInteger      := Dados.varID_USER;
          sqlAux.Params.ParamByName('ID_BANK').AsInteger :=  Integer(cboBanco.Items.Objects[Idx]);
          sqlAux.Params.ParamByName('SALDO_INICIAL').AsFloat := edtSaldoInicial.Value;
          sqlAux.Params.ParamByName('PATH').AsString :=  edtPathSalvar.text;
          sqlAux.Params.ParamByName('APELIDO').AsString :=  edtApelido.text;
          sqlAux.Params.ParamByName('DATA_SALDO_INICIAL').AsSQLTimeStamp  := DateTimeToSQLTimeStamp(dtStartDate.Date);
          sqlAux.Params.ParamByName('ID_USERBANK').AsInteger  := varIDUserBank;

          Try
            sqlAux.ExecSQL;
          except
            on E : Exception do
              Mens_MensErro(E.ClassName+' error raised, with message : '+E.Message);
          end;


          sqlAux.Close;
          sqlAux.SQL.Clear;
          sqlAux.SQL.Add(' Update TBTransacao ' );
          sqlAux.SQL.Add(' Set Valor = :Valor');
          sqlAux.SQL.Add(' ,DataTransacao = :DataTransacao');
          sqlAux.SQL.Add(' Where ID_User = :ID_User AND ID_BANKING = :ID_BANKING AND ID_USERBANK = :ID_USERBANK AND MODO = :MODO');
          sqlAux.Params.ParamByName('ID_USER').AsInteger      := Dados.varID_USER;
          sqlAux.Params.ParamByName('ID_BANKING').AsInteger   := Dados.varID_Bank;
          sqlAux.Params.ParamByName('ID_USERBANK').AsInteger  := varIDUserBank;
          sqlAux.Params.ParamByName('MODO').AsString          := 'S';   // I - Importado - M - Manual - S - Saldo Inicial
          sqlAux.Params.ParamByName('DataTransacao').AsSQLTimeStamp  := DateTimeToSQLTimeStamp(dtStartDate.Date);
          sqlAux.Params.ParamByName('Valor').AsFloat := edtSaldoInicial.Value;

          Try
            sqlAux.ExecSQL;
          except
            on E : Exception do
              Mens_MensErro(E.ClassName+' error raised, with message : '+E.Message);
          end;


          if not System.IOUtils.TDirectory.Exists( edtPathSalvar.Text + '\BACKUP\'  ) then
          begin
              System.IOUtils.TDirectory.CreateDirectory( edtPathSalvar.Text + '\BACKUP\'  );
              Application.MessageBox( PWideChar( 'Backup folder created in ' + edtPathSalvar.Text + ' To Bank Files imported'),  'Account', MB_ICONINFORMATION);;
          end;

      end;
      varUpdate := True;

      Application.MessageBox( PWideChar( 'Information Bank Account was Saved'),  'Account', MB_ICONINFORMATION);;

      cboBanco.ItemIndex := -1;
      Idx := -1;
      edtSaldoInicial.Clear;
      edtPathSalvar.Clear;


  end;

  sqlUsuarioBanco.Close;
  sqlUsuarioBanco.Params.ParamByName('ID_USER').AsInteger := Dados.varID_USER;
  sqlUsuarioBanco.Open;


end;

procedure TfrmAccount.cxGrid1DBTableView1CellDblClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
    varIDUserBank := -1;
    if not sqlUsuarioBanco.IsEmpty  then
    begin
      edtApelido.Text    := sqlUsuarioBanco.FieldByName('APELIDO').AsString;
      edtPathSalvar.Text := sqlUsuarioBanco.FieldByName('PATH').AsString;
      cboBanco.ItemIndex := sqlUsuarioBanco.FieldByName('ID_BANK').AsInteger;
      varIDUserBank      := sqlUsuarioBanco.FieldByName('ID_USERBANK').AsInteger;
      varUpdate := True;
    end;
end;

procedure TfrmAccount.edtPathSalvarClick(Sender: TObject);
var
  FDir : String;
begin
  inherited;
  if Win32MajorVersion >= 6 then
    with TFileOpenDialog.Create(nil) do
    try
      Title := 'Selecionar Diret?rio';
      Options := [fdoPickFolders, fdoPathMustExist, fdoForceFileSystem]; // YMMV
      OkButtonLabel := 'Selecionar';
      DefaultFolder := FDir;
      FileName := FDir;
      if Execute then
      begin
        edtPathSalvar.Text := FileName;

      end;
    finally
      Free;
    end
  else
    if SelectDirectory('Selecionar Diret?rio', ExtractFileDrive(FDir), FDir,
             [sdNewUI, sdNewFolder]) then
      edtPathSalvar.Text := FDir;

end;

procedure TfrmAccount.FormActivate(Sender: TObject);
begin
  Page.ActivePage := TabUsuario;
  dtStartDate.Properties.EditFormat := FormatSettings.ShortDateFormat;
  varUpdate := False;

  sqlUsuario.Close;
  sqlUsuario.SQL.Clear;
  sqlUsuario.SQL.Add('Select * From TbUser Where ID_User = :ID_User');
  sqlUsuario.Params.ParamByName('ID_User').AsInteger := Dados.varID_USER;
  sqlUsuario.Open;

  edtFullname.Text := sqlUsuario.FieldByName('FULLNAME').AsString;
  edtEmail.Text    := sqlUsuario.FieldByName('EMAIL').AsString;
  edtPwd.Text      := sqlUsuario.FieldByName('PWD').AsString;
  edtphone.Text    := sqlUsuario.FieldByName('PHONE_NUMBER').AsString;

  sqlUsuarioBanco.Close;
  sqlUsuarioBanco.Params.ParamByName('ID_USER').AsInteger := Dados.varID_USER;
  sqlUsuarioBanco.Open;


  sqlBank.Close;
  sqlBank.sql.Clear;
  sqlBank.SQL.Add('Select * from TBBANKING order by ID_Banking');
  sqlBank.Open;
  sqlBank.First;
  cboBanco.Items.Clear;
  cboBanco.Items.AddObject('',TObject(-1));

  while not sqlBank.Eof do
  begin
      cboBanco.Items.AddObject(sqlBank.FieldByName('NAME').AsString, TObject(sqlBank.FieldByName('ID_BANKING').AsInteger ));
      sqlBank.Next;
  end;
  cboBanco.SetFocus;
end;


procedure TfrmAccount.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  frmAccount := nil;
  Action := caFree;
end;

procedure TfrmAccount.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
var
  buttonSelected: integer;
begin
  if Dados.CheckBank  = 0 then
  begin
    buttonSelected := MessageDlg('You must select at least one bank to continue.' , mtCustom, [mbYes, mbNo], 0);
    if buttonSelected = mrYES then
    begin
      CanClose:=false;
    end
    else
    begin
      CanClose:=false;
    end;
  end;

end;

end.
