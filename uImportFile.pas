unit uImportFile;

interface

uses
  uFunctions,
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
  Vcl.StdCtrls, Vcl.ExtCtrls, cxTextEdit, cxMaskEdit, cxButtonEdit,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.DBCtrls,
  Vcl.ComCtrls, Vcl.Menus, dxCore, cxDateUtils, cxDropDownEdit, cxCalendar,
  cxButtons, Datasnap.Provider, Datasnap.DBClient, Data.SqlTimSt, Vcl.Grids,
  Vcl.DBGrids ;

type
  TfrmImportFile = class(TForm)
    Panel1: TPanel;
    lblSelectFile: TLabel;
    EdtCaminho: TcxButtonEdit;
    OpenDialog: TOpenDialog;
    sqlAux: TFDQuery;
    sqlAux2: TFDQuery;
    sqlConsulta: TFDQuery;
    sqlBank: TFDQuery;
    dsBank: TDataSource;
    lblBank: TLabel;
    MainMenu1: TMainMenu;
    lblStart: TLabel;
    lblEnd: TLabel;
    lblTotalLines: TLabel;
    edtTotalLines: TEdit;
    dtFileStartDate: TcxDateEdit;
    dtFileEndDate: TcxDateEdit;
    Label1: TLabel;
    lblImpLastDate: TLabel;
    btnImportar: TcxButton;
    butCancel: TcxButton;
    chkEmail: TCheckBox;
    cboBank: TComboBox;
    DataSource1: TDataSource;
    procedure EdtCaminhoClick(Sender: TObject);

    procedure FormCreate(Sender: TObject);
    procedure btnImportarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure chkEmailClick(Sender: TObject);
    procedure cboBankChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure butCancelClick(Sender: TObject);
  private
    dtImportLastDate, dtTransactionDate : TDateTime;
    Texto,Linha, Saida : TStringList;
    varNome, varTipo, varDataTransacao, varFavorecido, varCategoria, varSubCategoria, varTempCategoria, varCentrodeCusto :string;
    varValor : String;
    Idx: Integer;
    varCaminhoBackup : String;
    procedure ContaSynovus;
    procedure ApagaRegistro;
    procedure CadastraCategoria;
    function ValidaCategoria : String;
    procedure LimpaVariavel;
    procedure ContaDiscovery;
    procedure LeituraDoArquivo;
    procedure ContaNubankCard;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmImportFile: TfrmImportFile;
  bCancelaVinculaCategoria : Boolean;

implementation

{$R *.dfm}

uses uFrmVincularCentroCusto, uDados, MensFun, uFrmEmail;

procedure TfrmImportFile.EdtCaminhoClick(Sender: TObject);
begin
   if OpenDialog.Execute then
   begin
     EdtCaminho.Text := OpenDialog.FileName;
     LeituraDoArquivo;
   end;
end;


procedure  TfrmImportFile.LeituraDoArquivo;
var
  varFile : TStringList;
  varDataInicial, varDataFinal : String;
begin
   varFile := TStringList.Create;
   Try
      varFile.LoadFromFile(EdtCaminho.text);

      //date,category,title,amount
      //2020-12-11,eletrônicos,Americanas Marketplace 5/6,48.9

      varFile.Text          := stringreplace(varFile.Text, ',', ';', [rfReplaceAll, rfIgnoreCase]);
      edtTotalLines.Text    := IntToStr(varFile.Count);

      varDataInicial        :=  FormatDateTime(FormatSettings.ShortDateFormat,
                                ParseDateFromDB(Str_Pal(varFile.Strings[varFile.Count - 1],1,';'),Dados.varID_Bank));

      idx := cboBank.ItemIndex;
      if Idx <> -1 then
      begin
         if  Integer(cboBank.Items.Objects[Idx]) = 4 then
            varDataInicial         := Copy(varDataInicial,6,2) + '/' + Copy(varDataInicial,9,2) + '/' +  Copy(varDataInicial,1,4);

      end;
      dtFileStartDate.Date  :=  StrToDate( FormatDateTime(FormatSettings.ShortDateFormat, StrToDate(varDataInicial)) ); //StrToDate(varDataInicial);

      varDataFinal          := FormatDateTime(FormatSettings.ShortDateFormat, ParseDateFromDB(Str_Pal(varFile.Strings[2],1,';'),Dados.varID_Bank));

      if Idx <> -1 then
      begin
         if  Integer(cboBank.Items.Objects[Idx]) = 4 then
          varDataFinal         :=  Copy(varDataFinal,6,2) + '/' + Copy(varDataFinal,9,2) + '/' +  Copy(varDataFinal,1,4);

      end;
      dtFileEndDate.Date   :=  StrToDate( FormatDateTime(FormatSettings.ShortDateFormat, StrToDate(varDataFinal)) );

   Finally
     FreeAndNil(varFile);
   End;

end;

procedure TfrmImportFile.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  frmImportFile := nil;
  Action := caFree;
end;

procedure TfrmImportFile.FormCreate(Sender: TObject);
begin

  Dados.ConectarNoBanco;

  Caption                := Dados.RetornaMensagem('MEN_IMPORTFILE');
  lblSelectFile.Caption  := Dados.RetornaMensagem('MEN_SELECTFILE');
  lblBank.Caption        := Dados.RetornaMensagem('MEN_SELECTBANK');
  btnImportar.Caption    := Dados.RetornaMensagem('MEN_IMPORTFILE');

  dtFileStartDate.Properties.EditFormat := FormatSettings.ShortDateFormat;
  dtFileEndDate.Properties.EditFormat := FormatSettings.ShortDateFormat;
  lblStart.Caption := lblStart.Caption + ' (' + FormatSettings.ShortDateFormat + ')';
  lblEnd.Caption := lblEnd.Caption + ' (' + FormatSettings.ShortDateFormat + ')';



  sqlBank.Close;
  sqlBank.sql.Clear;
  sqlBank.SQL.Add('Select UB.ID_USERBANK, B.NAME, B.ID_BANKING, UB.APELIDO from TBBANKING B ');
  sqlBank.SQL.Add(' Inner join TBUSERBANK UB on UB.ID_BANK = B.ID_BANKING ');
  sqlBank.SQL.Add(' where UB.ID_USER = :ID_USER ' );
  sqlBank.SQL.Add(' order by UB.ID_BANK');
  sqlBank.Params.ParamByName('ID_USER').AsInteger := Dados.varID_USER;
  sqlBank.Open;
  sqlBank.First;
  cboBank.Items.Clear;
  while not sqlBank.Eof do
  begin
      cboBank.Items.AddObject(sqlBank.FieldByName('NAME').AsString + '-' + sqlBank.FieldByName('APELIDO').AsString , TObject(sqlBank.FieldByName('ID_USERBANK').AsInteger  ));
      sqlBank.Next;
  end;

  idx := -1;


end;

procedure TfrmImportFile.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if Key=VK_RETURN then
    frmImportFile.Perform(WM_NEXTDLGCTL, 0, 0);
end;

procedure  TfrmImportFile.LimpaVariavel;
begin
  varNome := '';;
  varTipo := '';
  varDataTransacao := '';
  varFavorecido := '';
  varCategoria := '';
  varSubCategoria := '';
  varTempCategoria := '';
  varCentrodeCusto := '';
  varValor := '0';
end;


procedure TfrmImportFile.ApagaRegistro;
begin
  Dados.ConectarNoBanco;

  sqlAux.Close;
  sqlAux.sql.Clear;
  sqlAux.SQL.Add('Delete From TBTransacao Where ID_USER = :ID_USER AND ALTERADO = ''NAO'' ');
  sqlAux.Params.ParamByName('ID_USER').AsInteger := Dados.varID_USER;
  Try
    sqlAux.ExecSQL;
  except
    on E : Exception do
      Mens_MensErro(E.ClassName+' error raised, with message : '+E.Message);
  end;

end;


function TfrmImportFile.ValidaCategoria : String;
var
 varIDCentrodeCusto, varIdLanguage : Integer;
 varSQL : String;
 idx : Integer;
begin
   sqlAux.Close;
   sqlAux.SQL.Clear;
   sqlAux.SQL.Add('SELECT * FROM TBLANGUAGE WHERE ID_LANGUAGE = 1 ORDER BY ID_LANGUAGE');
   sqlAux.Open;
   sqlAux.First;
   varIdLanguage := sqlAux.FieldByName('ID_LANGUAGE').AsInteger;

   varSQL := '';
   varIDCentrodeCusto := 0;
  if ((varSubCategoria <> '') and (varFavorecido <> 'Maplebear Inc')) then
  begin
    if UpperCase(varSubCategoria) = 'FUEL' Then
       varSQL := 'Select * from CentrodeCusto where CentrodeCusto =  ''FUEL'' and ID_USER = :ID_USER and ID_LANGUAGE = :ID_LANGUAGE'
    else   if UpperCase(varSubCategoria) = 'GROCERIES' Then
       varSQL := 'Select * from CentrodeCusto where CentrodeCusto = ''GROCERIES'' and ID_USER = :ID_USER and ID_LANGUAGE = :ID_LANGUAGE'
    else  if UpperCase(varSubCategoria) = 'DINING OUT' Then
       varSQL := 'Select * from CentrodeCusto where CentrodeCusto = ''MEAL'' and ID_USER = :ID_USER and ID_LANGUAGE = :ID_LANGUAGE';
  end
  else
  if ((varFavorecido = 'Maplebear Inc') and (varCategoria = 'Food') and (varSubCategoria = 'Groceries')) then
      varSQL := 'Select * from CentrodeCusto where CentrodeCusto = ''INCOME'' and ID_USER = :ID_USER and ID_LANGUAGE = :ID_LANGUAGE';

  if  UpperCase(varFavorecido) = 'PAGAMENTO RECEBIDO' then
      varSQL := 'Select * from CentrodeCusto where CentrodeCusto = ''CREDIT CARD'' and ID_USER = :ID_USER and ID_LANGUAGE = :ID_LANGUAGE';


  if varSQL <> '' Then
  begin
       sqlAux.Close;
       sqlAux.SQL.Clear;
       sqlAux.SQL.Add(Trim(varSQL));
       sqlAux.Params.ParamByName('ID_USER').AsInteger     := Dados.varID_USER;
       sqlAux.Params.ParamByName('ID_LANGUAGE').AsInteger := varIdLanguage;

       sqlAux.Open;
       if not sqlAux.IsEmpty then
       begin
          varCentrodeCusto   := sqlAux.FieldByName('CentroDeCusto').Value;
          varIDCentrodeCusto := sqlAux.FieldByName('ID_CentroDeCusto').Value;
          result := varCentrodeCusto;
       end;
  end
  else
  begin

      sqlAux.Close;
      sqlAux.SQL.Clear;
      sqlAux.SQL.Add('SELECT C.CATEGORIA,  C.ID_CENTRODECUSTO, CC.CENTRODECUSTO FROM TBCATEGORIA C  ');
      sqlAux.SQL.Add(' LEFT OUTER JOIN CENTRODECUSTO CC ON CC.ID_CENTRODECUSTO =  C.ID_CENTRODECUSTO ');
      sqlAux.SQL.Add(' Where C.Favorecido = :Favorecido and  C.Categoria = :Categoria and C.ID_LANGUAGE = :ID_LANGUAGE ');
      sqlAux.Params.ParamByName('Favorecido').AsString := varFavorecido;
      sqlAux.Params.ParamByName('ID_LANGUAGE').AsInteger := 1;  // Somente Ingles


      if varSubCategoria <> '' then
        sqlAux.Params.ParamByName('Categoria').AsString := varCategoria + '_' + varSubCategoria
      else sqlAux.Params.ParamByName('Categoria').AsString := varCategoria;

      sqlAux.Open;

      if (sqlAux.FieldByName('ID_CENTRODECUSTO').AsString = '')  then
      begin
       Try
         Application.CreateForm(TfrmVincularCentroCusto, frmVincularCentroCusto);
         frmVincularCentroCusto.butDelete.Visible := False;
         frmVincularCentroCusto.lblFavorecido.Caption := varFavorecido;
         if varSubCategoria <> '' then
           frmVincularCentroCusto.lblCategoria.Caption := varCategoria + '_' + varSubCategoria
         else  frmVincularCentroCusto.lblCategoria.Caption := varCategoria ;
         frmVincularCentroCusto.lblValor.Caption := varValor; // FloatToStr(varValor);
         frmVincularCentroCusto.lblDataCompra.Caption := varDataTransacao;
         frmVincularCentroCusto.bAlterar := False;
         frmVincularCentroCusto.ShowModal;

         if frmVincularCentroCusto.ModalResult = mrOk  then
         begin
            idx := frmVincularCentroCusto.cboCC.ItemIndex;
            varCentrodeCusto   := frmVincularCentroCusto.cboCC.Text;
            varIDCentrodeCusto := Integer(frmVincularCentroCusto.cboCC.Items.Objects[Idx]);
         end
         else
         begin
            bCancelaVinculaCategoria := True;
         end;
       Finally
          FreeAndNil(frmVincularCentroCusto);
       End;

      end
      else
        varCentrodeCusto := sqlAux.FieldByName('CENTRODECUSTO').AsString ;
  end;

  if varIDCentrodeCusto > 0  then
  begin
      sqlAux2.Close;
      sqlAux2.SQL.Clear;
      sqlAux2.SQL.Add('Update TBCategoria ');
      sqlAux2.SQL.Add('Set  ID_CENTRODECUSTO = :ID_CENTRODECUSTO ');
      sqlAux2.SQL.Add(' Where Favorecido = :Favorecido and Categoria = :Categoria and ID_Language = :ID_Language');

      sqlAux2.Params.ParamByName('ID_CENTRODECUSTO').AsInteger := varIDCentrodeCusto;
      sqlAux2.Params.ParamByName('Favorecido').AsString        := varFavorecido;
      if varSubCategoria <> '' then
        sqlAux2.Params.ParamByName('Categoria').AsString := varCategoria + '_' + varSubCategoria
      else sqlAux2.Params.ParamByName('Categoria').AsString := varCategoria;
        sqlAux2.Params.ParamByName('ID_Language').AsInteger := 1; // Somente em Ingles Dados.varID_Language;

      Try
        sqlAux2.ExecSQL;
      except
        on E : Exception do
          Mens_MensErro(E.ClassName+' error raised, with message : '+E.Message);
      end;
  end;


  result := varCentrodeCusto;

  sqlAux.Close;
  sqlAux2.Close;

end;



procedure  TfrmImportFile.ContaSynovus;
var
  i:integer;
  varValorTemp : String;
  varSelectedIDUserBank : String;
begin
 // ApagaRegistro;

  Texto.Text := stringreplace(Texto.Text, ',', ';', [rfReplaceAll, rfIgnoreCase]);

  Linha := TStringList.Create;
  Saida := TStringList.Create;
  Try
    Saida.Clear;
    Dados.varTotalLinha := Texto.Count;
    bCancelaVinculaCategoria := False;
    for i:=1 to Texto.Count - 1 do
    begin
     Dados.varLinha := I;
     Linha.Delimiter:=';';
     Linha.DelimitedText:=Texto[i];

     LimpaVariavel;
     varValorTemp := '';
     varDataTransacao      :=   FormatDateTime(FormatSettings.ShortDateFormat, ParseDateFromDB(Str_Pal(Texto[i],1, ';'),Dados.varID_Bank));

     dtTransactionDate     := StrToDate(varDataTransacao);

     if dtTransactionDate < dtImportLastDate-1 Then
        Continue;

//     varDataTransacao      :=  Copy(varDataTransacao,7,4) + '/' + Copy(varDataTransacao,1,2) + '/' + Copy(varDataTransacao,4,2);

     varFavorecido         :=  Str_Pal(Texto[i],3, ';');

     varTempCategoria      :=  Trim(Str_Pal(Texto[i],4, ';'));

     varSubCategoria       :=  Trim(Str_Pal(varTempCategoria,2, ':'));

     varCategoria          :=  Trim(Str_Pal(varTempCategoria,1, ':'));

     varValorTemp          :=   Str_Pal(Texto[i],6, ';');
     if varValorTemp <> '' then
     begin
       varValor              :=  FloatToStrWithDecimalPoint(StrToFloat(varValorTemp), Dados.varRegiao);
     end;

     if varValor <> '0' then
        varTipo := 'INCOME'
     else
     begin
       varValorTemp          :=   Str_Pal(Texto[i],7, ';');

      if varValorTemp <> '' then
      begin
        varValor              :=  FloatToStrWithDecimalPoint(StrToFloat(varValorTemp), Dados.varRegiao);
      end;


      if varValor <> '0' then
        varTipo := 'EXPENSE';

     end;

     CadastraCategoria;

     ValidaCategoria;

     if bCancelaVinculaCategoria = True Then
       Break;

     // inserir somente registros que não foram modificados anteriormente pelo usuario.
     sqlConsulta.Close;
     sqlConsulta.SQL.Clear;
     sqlConsulta.SQL.Add('Select ID_USER ');
     sqlConsulta.SQL.Add(' FROM TBTRANSACAO ' );
     sqlConsulta.SQL.Add(' Where ID_USER = :ID_USER ');
     sqlConsulta.SQL.Add(' and ID_BANKING = :ID_BANKING ');
     sqlConsulta.SQL.Add(' and TIPO =  :TIPO ');
     sqlConsulta.SQL.Add(' and DATATRANSACAO = :DATATRANSACAO ');
     sqlConsulta.SQL.Add(' AND FAVORECIDO = :FAVORECIDO ');
     sqlConsulta.SQL.Add(' AND CATEGORIA = :CATEGORIA ');
     sqlConsulta.SQL.Add(' AND SUBCATEGORIA = :SUBCATEGORIA');
     sqlConsulta.SQL.Add(' AND ID_USERBANK = :ID_USERBANK ');
     sqlConsulta.SQL.Add(' AND MODO = :MODO ');
     sqlConsulta.SQL.Add(' AND VALOR = :VALOR ');
     sqlConsulta.SQL.Add(' AND ALTERADO = ''SIM'' ');


     sqlConsulta.Params.ParamByName('ID_USER').AsInteger      :=  Dados.varID_USER;
     sqlConsulta.Params.ParamByName('ID_USERBANK').AsInteger  :=  Integer(cboBank.Items.Objects[Idx]);
     sqlConsulta.Params.ParamByName('ID_BANKING').AsInteger   :=  Dados.varID_Bank;
     sqlConsulta.Params.ParamByName('Tipo').AsString          :=  varTipo;
     sqlConsulta.Params.ParamByName('DataTransacao').AsSQLTimeStamp  := DateTimeToSQLTimeStamp(dtTransactionDate);
     sqlConsulta.Params.ParamByName('Favorecido').AsString    :=  Trim(varFavorecido);
     sqlConsulta.Params.ParamByName('Categoria').AsString     :=  Trim(varCategoria);
     sqlConsulta.Params.ParamByName('SubCategoria').AsString  :=  Trim(varSubCategoria);
     sqlConsulta.Params.ParamByName('MODO').AsString  :=  'I';

     sqlConsulta.Params.ParamByName('Valor').AsString          :=  varValor;
     sqlConsulta.Open;
     if sqlConsulta.IsEmpty then
     begin

         sqlAux.Close;
         sqlAux.SQL.Clear;
         sqlAux.SQL.Add('Insert Into TBTransacao (ID_USER, ID_BANKING, Tipo, DataTransacao, Favorecido, Categoria, SubCategoria, Valor, CentroDeCusto,ID_USERBANK, MODO) Values ( ');
         sqlAux.SQL.Add(':ID_USER, :ID_BANKING, :Tipo, :DataTransacao, :Favorecido, :Categoria, :SubCategoria, :Valor, :CentroDeCusto, :ID_USERBANK, :MODO) ');
         sqlAux.Params.ParamByName('ID_USER').AsInteger :=  Dados.varID_USER;
         sqlAux.Params.ParamByName('ID_BANKING').AsInteger := Dados.varID_Bank;
         sqlAux.Params.ParamByName('Tipo').AsString :=  varTipo;
         sqlAux.Params.ParamByName('DataTransacao').AsSQLTimeStamp  := DateTimeToSQLTimeStamp(dtTransactionDate);
         sqlAux.Params.ParamByName('Favorecido').AsString := Trim(varFavorecido);
         sqlAux.Params.ParamByName('Categoria').AsString :=  Trim(varCategoria);
         sqlAux.Params.ParamByName('SubCategoria').AsString :=  Trim(varSubCategoria);
         sqlAux.Params.ParamByName('Valor').AsString :=  varValor;
         sqlAux.Params.ParamByName('CentroDeCusto').AsString := varCentrodeCusto;
         sqlAux.Params.ParamByName('ID_USERBANK').AsInteger := Integer(cboBank.Items.Objects[Idx]);
         sqlAux.Params.ParamByName('MODO').AsString := 'I';


         Try
            sqlAux.ExecSQL;
         except
            on E : Exception do
              Mens_MensErro(E.ClassName+' error raised, with message : '+E.Message);
         end;
     end;

    end;
  Finally
    FreeAndNil(Texto);
    FreeAndNil(Linha);
    FreeAndNil(Saida);
  End;

end;


procedure TfrmImportFile.btnImportarClick(Sender: TObject);
begin
  Idx := cboBank.ItemIndex;
  if Idx = -1 then
  begin
      Mens_MensInf( Dados.RetornaMensagem('MEN_SELECTBANK') );
      cboBank.SetFocus;
     Exit;
  end;

  if EdtCaminho.text = '' then begin
    Mens_MensInf( Dados.RetornaMensagem('MEN_SELECTFILE') );
    EdtCaminho.SetFocus;
    Exit;
  end;

  Texto := TStringList.Create;

  try
    Texto.LoadFromFile(EdtCaminho.text);
  except
        on E : Exception do
        begin
           Mens_MensErro(E.ClassName+' error raised, with message : '+E.Message);
           FreeAndNil(Texto);
          Exit;
        end;
  end;


  if Dados.varID_Bank  = 1 then
     ContaSynovus
  else if Dados.varID_Bank  = 2 then
     ContaDiscovery
  else if Dados.varID_Bank  = 4 then
     ContaNubankCard;

  try
     DeleteFile(PWideChar(varCaminhoBackup + '\' +ExtractFileName(EdtCaminho.text)));
     CopyFile( PWideChar(OpenDialog.InitialDir + '\' + ExtractFileName(EdtCaminho.text)), PWideChar(varCaminhoBackup + '\' +ExtractFileName(EdtCaminho.text)), True );
     DeleteFile(PWideChar(OpenDialog.InitialDir + '\' +ExtractFileName(EdtCaminho.text)));

  except
     raise Exception.Create('Erro ao mover o arquivo para pasta ' + varCaminhoBackup );
  end;

  if bCancelaVinculaCategoria = False then
    Mens_MensInf('Os Dados Foram inseridos no banco com sucesso.')
  else
    Mens_MensInf('Processo Cancelado pelo Usuário.')

end;



procedure TfrmImportFile.butCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmImportFile.ContaNubankCard;
var
  i:integer;
  varValorTemp : String;
  varPalavra : String;
begin

  Texto.Text := stringreplace(Texto.Text, ',', ';', [rfReplaceAll, rfIgnoreCase]);

  Linha := TStringList.Create;
  Saida := TStringList.Create;

  // date,category,title,amount
  // 2020-12-11,eletrônicos,Americanas Marketplace 5/6,48.9


  Try
    Saida.Clear;
    Dados.varTotalLinha := Texto.Count;
    bCancelaVinculaCategoria := False;

    for i:=1 to Texto.Count - 1 do
    begin
     Dados.varLinha := I;
     Linha.Delimiter:=';';
     Linha.DelimitedText:=Texto[i];

     LimpaVariavel;
     varValorTemp := '';

     varDataTransacao      := Str_Pal(Texto[i],1, ';');
  //   varDataTransacao      := ParseDateFromDB(varDataTransacao, Dados.varID_Bank); // Copy(varDataTransacao,6,2) + '/' + Copy(varDataTransacao,9,2) + '/' +  Copy(varDataTransacao,1,4);
     dtTransactionDate     := ParseDateFromDB(varDataTransacao, Dados.varID_Bank); //StrToDate(varDataTransacao);

     if dtTransactionDate < dtImportLastDate-1 Then
        Continue;

     varPalavra      :=   Trim(Str_Pal(Texto[i],2, ';'));

     varCategoria          :=  UTF8ToWideString(varPalavra);

     varFavorecido         :=  Str_Pal(Texto[i],3, ';');
     varValorTemp          :=  Str_Pal(Texto[i],4, ';');

     if varValorTemp <> '' then
     begin
       varValor              :=  FloatToStrWithDecimalPoint(StrToFloat(varValorTemp) * -1, Dados.varRegiao );
     end;

     if StrToFloat(varValor) >= 0 then
        varTipo := 'INCOME'
     else
        varTipo := 'EXPENSE';


     CadastraCategoria;

     ValidaCategoria;

      if bCancelaVinculaCategoria = True Then
       Break;

     // inserir somente registros que não foram modificados anteriormente pelo usuario.
     sqlConsulta.Close;
     sqlConsulta.SQL.Clear;
     sqlConsulta.SQL.Add('Select ID_USER ');
     sqlConsulta.SQL.Add(' FROM TBTRANSACAO ' );
     sqlConsulta.SQL.Add(' Where ID_USER = :ID_USER ');
     sqlConsulta.SQL.Add(' and ID_BANKING = :ID_BANKING ');
     sqlConsulta.SQL.Add(' and TIPO =  :TIPO ');
     sqlConsulta.SQL.Add(' and DATATRANSACAO = :DATATRANSACAO ');
     sqlConsulta.SQL.Add(' AND FAVORECIDO = :FAVORECIDO ');
     sqlConsulta.SQL.Add(' AND CATEGORIA = :CATEGORIA ');
     sqlConsulta.SQL.Add(' AND SUBCATEGORIA = :SUBCATEGORIA');
     sqlConsulta.SQL.Add(' AND ID_USERBANK = :ID_USERBANK ');
     sqlConsulta.SQL.Add(' AND MODO = :MODO ');
     sqlConsulta.SQL.Add(' AND VALOR = :VALOR ');
     sqlConsulta.SQL.Add(' AND ALTERADO = ''SIM'' ');


     sqlConsulta.Params.ParamByName('ID_USER').AsInteger      :=  Dados.varID_USER;
     sqlConsulta.Params.ParamByName('ID_USERBANK').AsInteger  :=  Integer(cboBank.Items.Objects[Idx]);
     sqlConsulta.Params.ParamByName('ID_BANKING').AsInteger   :=  Dados.varID_Bank;
     sqlConsulta.Params.ParamByName('Tipo').AsString          :=  varTipo;
     sqlConsulta.Params.ParamByName('DataTransacao').AsDate   :=  dtTransactionDate; //varDataTransacao;
     sqlConsulta.Params.ParamByName('Favorecido').AsString    :=  Trim(varFavorecido);
     sqlConsulta.Params.ParamByName('Categoria').AsString     :=  Trim(varCategoria);
     sqlConsulta.Params.ParamByName('SubCategoria').AsString  :=  Trim(varSubCategoria);
     sqlConsulta.Params.ParamByName('Valor').AsString         :=  varValor;
     sqlConsulta.Params.ParamByName('MODO').AsString          :=  'I';

     sqlConsulta.Open;
     if sqlConsulta.IsEmpty then
     begin

         sqlAux.Close;
         sqlAux.SQL.Clear;
         sqlAux.SQL.Add('Insert Into TBTransacao (ID_USER, ID_BANKING, Tipo, DataTransacao, Favorecido, Categoria, SubCategoria, Valor, CentroDeCusto,ID_USERBANK, MODO) Values ( ');
         sqlAux.SQL.Add(':ID_USER, :ID_BANKING, :Tipo, :DataTransacao, :Favorecido, :Categoria, :SubCategoria, :Valor, :CentroDeCusto,:ID_USERBANK, :MODO) ');
         sqlAux.Params.ParamByName('ID_USER').AsInteger      := Dados.varID_USER;
         sqlAux.Params.ParamByName('ID_BANKING').AsInteger   := Dados.varID_Bank;
         sqlAux.Params.ParamByName('Tipo').AsString          := varTipo;
         sqlAux.Params.ParamByName('DataTransacao').AsString := varDataTransacao;
         sqlAux.Params.ParamByName('Favorecido').AsString    := Trim(varFavorecido);
         sqlAux.Params.ParamByName('Categoria').AsString     := Trim(varCategoria);
         sqlAux.Params.ParamByName('SubCategoria').AsString  := Trim(varSubCategoria);
         sqlAux.Params.ParamByName('Valor').AsString         := varValor;
         sqlAux.Params.ParamByName('CentroDeCusto').AsString := varCentrodeCusto;
         sqlAux.Params.ParamByName('ID_USERBANK').AsInteger  := Integer(cboBank.Items.Objects[Idx]);
         sqlAux.Params.ParamByName('MODO').AsString          := 'I';

         Try
            sqlAux.ExecSQL;
         except
            on E : Exception do
              Mens_MensErro(E.ClassName+' error raised, with message : '+E.Message);
         end;
     end;

    end;
  Finally
    FreeAndNil(Texto);
    FreeAndNil(Linha);
    FreeAndNil(Saida);
  End;

end;

procedure TfrmImportFile.CadastraCategoria;
begin
   sqlAux.Close;
   sqlAux.SQL.Clear;
   sqlAux.SQL.Add('SELECT * FROM TBLANGUAGE WHERE ID_LANGUAGE = 1 ORDER BY ID_LANGUAGE');

   sqlAux.Open;
   sqlAux.First;
   while not sqlAux.Eof do
   begin
      sqlAux2.Close;
      sqlAux2.SQL.Clear;
      sqlAux2.SQL.Add('Insert Into TBCATEGORIA ( Favorecido, Categoria, ID_Language )');
      sqlAux2.SQL.Add(' Values ( :Favorecido, :Categoria, :ID_Language )');

      sqlAux2.Params.ParamByName('Favorecido').AsString := varFavorecido;
      if varSubCategoria <> '' then
        sqlAux2.Params.ParamByName('Categoria').AsString := varCategoria + '_' + varSubCategoria
      else sqlAux2.Params.ParamByName('Categoria').AsString := varCategoria;

      sqlAux2.Params.ParamByName('ID_Language').AsInteger := sqlAux.FieldByName('ID_LANGUAGE').AsInteger;

      Try
         sqlAux2.ExecSQL;
      except

      end;

      sqlAux.Next;

   end;
end;

procedure TfrmImportFile.cboBankChange(Sender: TObject);
var
 i : Integer;
begin
  Idx := cboBank.ItemIndex;

  Dados.ConectarNoBanco;
  Dados.varID_Bank  := 0;

  if idx <> -1 then
  begin
      Dados.varID_Bank := Dados.BuscaID_Bank(Integer(cboBank.Items.Objects[Idx]));

      For i := 0 to Length(Dados.varCaminhoExtratoBanco) -1 do
      begin
         if Dados.varID_Bank = StrToInt(Str_Pal(Dados.varCaminhoExtratoBanco[i],1,';')) then
         begin
           OpenDialog.InitialDir := Str_Pal(Dados.varCaminhoExtratoBanco[i],2,';');
           varCaminhoBackup      := Str_Pal(Dados.varCaminhoBackup[i],2,';');
           Break;
         end;
      end;


      sqlAux.Close;
      sqlAux.SQL.Clear;
      if Dados.varBanco = '1' then
        sqlAux.SQL.Add('Select Max(DataTransacao) as  DataTransacao From TBTRANSACAO where FORECAST = 0 AND MODO = ''I'' and id_user = :id_user ')
      else if Dados.varBanco = '2' then
        sqlAux.SQL.Add('Select cast(DataTransacao as varchar) as DataTransacao From TBTRANSACAO WHERE FORECAST = 0 AND MODO = ''I''  AND ID_USER = :ID_USER ');

      sqlAux.SQL.Add(' AND ID_BANKING = :ID_BANKING  AND ID_USERBANK = :ID_USERBANK');

      sqlAux.Params.ParamByName('ID_USER').AsInteger    := Dados.varID_USER;
      sqlAux.Params.ParamByName('ID_BANKING').AsInteger := Dados.varID_Bank;
      sqlAux.Params.ParamByName('ID_USERBANK').AsInteger :=Integer(cboBank.Items.Objects[Idx]);


      if Dados.varBanco = '2' then
         sqlAux.SQL.Add(' order by cast(DataTransacao as varchar) desc LIMIT 1;');

      //sqlAux.SQL.SaveToFile('c:\BIBanco\UltimoImport.sql');

      sqlAux.Open;

      if not sqlAux.IsEmpty then
      begin
        lblImpLastDate.Caption := sqlAux.FieldByName('DataTransacao').AsString;
        dtImportLastDate       := VarToDateTime(sqlAux.FieldByName('DataTransacao').AsString);
      end
      else lblImpLastDate.Caption := 'Data not found';

      sqlAux.Close;

  end;
end;

procedure TfrmImportFile.chkEmailClick(Sender: TObject);
var
   Idx: Integer;
begin
  Idx := cboBank.ItemIndex;
  if Idx <> -1 then
  begin
      Mens_MensInf( Dados.RetornaMensagem('MEN_SELECTBANK') );
      cboBank.SetFocus;
     Exit;
  end;

  Try
   Application.CreateForm( TfrmEmail, frmEmail);
    frmEmail.ShowModal;
  Finally
    FreeAndNil(frmEmail);
  End;
end;

procedure  TfrmImportFile.ContaDiscovery;
var
  i:integer;
  varValorTemp : String;
begin
  //ApagaRegistro;

  idx := cboBank.ItemIndex;

  Texto.Text := stringreplace(Texto.Text, ',', ';', [rfReplaceAll, rfIgnoreCase]);

  Linha := TStringList.Create;
  Saida := TStringList.Create;
  Try
    Saida.Clear;
    for i:=1 to Texto.Count - 1 do
    begin
     Linha.Delimiter:=';';
     Linha.DelimitedText:=Texto[i];
     LimpaVariavel;
     varValorTemp := '';
     varDataTransacao      := Str_Pal(Texto[i],1, ';');
     varDataTransacao      := Copy(varDataTransacao,7,4) + '/' + Copy(varDataTransacao,1,2) + '/' + Copy(varDataTransacao,4,2);
     varFavorecido         := Str_Pal(Texto[i],3, ';');


    {
     if varValorTemp <> '' then
     begin
       varValor              :=  FloatToStrWithDecimalPoint(StrToFloat(varValorTemp));
     end;
     }

      varValorTemp          := Str_Pal(Texto[i],4, ';') + '.' + Str_Pal(Texto[i],5, ';');
     //varValorTemp          := stringreplace(varValorTemp, ';', '.', [rfReplaceAll, rfIgnoreCase]);

     varValor              :=  FloatToStrWithDecimalPoint(StrToFloat(varValorTemp), Dados.varRegiao);//StrToFloat(varValorTemp);

     varCategoria      :=   Str_Pal(Texto[i],6, ';');
     if Pos('Credits', varCategoria ) > 0 then
     begin
        varTipo := 'INCOME';
        //varValor := Abs(varValor);
     end
     else
     begin
        varTipo := 'EXPENSE';
     end;


     sqlAux.Close;
     sqlAux.SQL.Clear;
     sqlAux.SQL.Add('Insert Into TBTransacao (ID_USER, ID_BANKING, Tipo, DataTransacao, Favorecido, Categoria, SubCategoria, Valor) Values ( ');
     sqlAux.SQL.Add(':ID_USER, :ID_BANKING, :Tipo, :DataTransacao, :Favorecido, :Categoria, :SubCategoria, :Valor) ');
     sqlAux.Params.ParamByName('ID_USER').AsInteger      :=  Dados.varID_USER;
     sqlAux.Params.ParamByName('ID_BANKING').AsInteger    :=  Integer(cboBank.Items.Objects[Idx]) ;
     sqlAux.Params.ParamByName('Tipo').AsString          :=  varTipo;
     sqlAux.Params.ParamByName('DataTransacao').AsString :=  varDataTransacao;
     sqlAux.Params.ParamByName('Favorecido').AsString    :=  Trim(stringreplace(varFavorecido, '"', '', [rfReplaceAll, rfIgnoreCase]));
     sqlAux.Params.ParamByName('Categoria').AsString     :=  Trim(stringreplace(varCategoria, '"', '', [rfReplaceAll, rfIgnoreCase]));
     sqlAux.Params.ParamByName('SubCategoria').AsString  :=  Trim(varSubCategoria);
     sqlAux.Params.ParamByName('Valor').AsString :=  varValor;

     Try
        sqlAux.ExecSQL;
     except
        on E : Exception do
          Mens_MensErro(E.ClassName+' error raised, with message : '+E.Message);
     end;

    end;
  Finally
    FreeAndNil(Texto);
    FreeAndNil(Linha);
    FreeAndNil(Saida);
  End;


end;


end.
