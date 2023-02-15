unit uDados;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Phys, FireDAC.VCLUI.Wait, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  Data.DB, FireDAC.Comp.Client, FireDAC.Phys.ODBCBase, FireDAC.Phys.MSSQL,
  FireDAC.Comp.UI, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Stan.ExprFuncs,
  FireDAC.Phys.SQLite, IniFiles,  Vcl.Forms, Vcl.Dialogs, uFunctions;

type
  TDados = class(TDataModule)
    FDManager: TFDManager;
    FDGUIxWaitCursor: TFDGUIxWaitCursor;
    FDPhysMSSQLDriverLink: TFDPhysMSSQLDriverLink;
    sqlMensagem: TFDQuery;
    FDSQLiteSecurity: TFDSQLiteSecurity;
    FDConnection: TFDConnection;
    FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink;
    SqlAux: TFDQuery;
    procedure DataModuleCreate(Sender: TObject);
  private
    Arq : TIniFile;

    { Private declarations }
  public
    { Public declarations }
    varRegiao    : String;
    varBanco     : String;
    varUsuario   : String;
    varID_USER, varID_Language, varID_Bank : Integer;
    varLinha, varTotalLinha : Integer;
    varLogado : Boolean;
    varCaminhoExtratoBanco, varCaminhoBackup : Array of String;
    function GetComando(ObjetoQuery: TFDQuery; bMostra: Boolean = false): String;
    function RetornaMensagem(varDescription: String): String;
    procedure ConectarNoBanco;
    function CheckBank : Integer;
    function BuscaID_Bank(ID_UserBank: Integer): Integer;
    procedure BuscaCaminhodoArquivo;
    function BuscaDados : Boolean;
    function Connection: TFDConnection;


  end;

var
  Dados: TDados;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}


Function TDados.GetComando(ObjetoQuery: TFDQuery; bMostra : Boolean) : String;
var
 i        : Integer;
 strQuery : String;
 sGetComando : String;
begin

  strQuery := UpperCase(ObjetoQuery.SQL.Text);

  For  i := 0 to ObjetoQuery.Params.Count - 1 do
    strQuery := StrTran(strQuery,':' + UpperCase(ObjetoQuery.Params[i].Name), QuotedStr(ObjetoQuery.Params[i].Value) );

   strQuery :=  StrTran(StrTran(strQuery, ''#$D#$A'', ' '), ''#$D#$A'', '');

  {
  sGetComando := ExisteRegistroComValor('PARAMETROS', 'VL_PARAM', 'NM_PARAM = ''GETCOMANDONATELA'' ');

  if (sGetComando = 'S') or (sGetComando = '') Then
     MostrarScriptnaTela := True;

  if not MostrarScriptnaTela Then
     LogWriter(GUsuario, strQuery, Tela)
  else
  }
  if bMostra  then
     ShowMessage(strQuery);

  result := strQuery;

end;



function TDados.CheckBank: Integer;
begin
   sqlAux.Close;
   sqlAux.SQL.Clear;
   SqlAux.SQL.Add('SELECT  COUNT(1) AS QUANTIDADE from TBUSERBANK WHERE ID_USER = :ID_USER');
   SqlAux.Params.ParamByName('ID_USER').AsInteger := varID_USER;
   SqlAux.Open;
   Result := SqlAux.FieldByName('QUANTIDADE').AsInteger
end;

procedure TDados.BuscaCaminhodoArquivo;
var
 I : Integer;
begin

  sqlAux.Close;
  sqlAux.SQL.Clear;
  sqlAux.SQL.Add('Select ID_BANK, PATH From TBUSERBANK Where ID_USER = :ID_USER');
  sqlAux.Params.ParamByName('ID_USER').AsInteger :=  varID_User;
  sqlAux.Open;
  if not sqlAux.IsEmpty  then
  begin
     sqlAux.First;
     SetLength(varCaminhoExtratoBanco, sqlAux.RecordCount);
     SetLength(varCaminhoBackup, sqlAux.RecordCount);
     i := 0;
     while not sqlAux.Eof do
     begin
        varCaminhoExtratoBanco[i] := SqlAux.FieldByName('ID_BANK').AsString + ';' + SqlAux.FieldByName('PATH').AsString + '\';
        varCaminhoBackup[i]       := SqlAux.FieldByName('ID_BANK').AsString + ';' + SqlAux.FieldByName('PATH').AsString + '\BACKUP\';
        inc(i);
        sqlAux.Next;
     end;

  end;
  sqlAux.Close;
end;

function TDados.BuscaDados: Boolean;
begin
  sqlAux.Close;
  sqlAux.SQL.Clear;
  sqlAux.SQL.Add('Select ID  From TBTRANSACAO  WHERE ID_USER = :ID_USER limit  1 ');
  sqlAux.Params.ParamByName('ID_USER').AsInteger :=  varID_USER;
  sqlAux.Open;
  Result := not sqlAux.IsEmpty;
end;

function TDados.BuscaID_Bank(ID_UserBank: Integer): Integer;
var
  varRetorno : Integer;
begin
  varRetorno := -1;

  sqlAux.Close;
  sqlAux.SQL.Clear;
  sqlAux.SQL.Add('Select ID_Bank From TBUSERBANK Where ID_USERBANK = :ID_USERBANK');
  sqlAux.Params.ParamByName('ID_USERBANK').AsInteger :=  ID_UserBank;
  sqlAux.Open;
  varRetorno := sqlAux.FieldByName('ID_Bank').AsInteger;

  Result := varRetorno;
end;



procedure TDados.ConectarNoBanco;
begin

  if varBanco = '1' then        //SQLServer
  begin


  if not FDConnection.Connected then
  begin

    FDConnection.Close;
    FDConnection.Params.Clear;
    FDConnection.Params.Add('SERVER=DESKTOP-99M8LEG');
    FDConnection.Params.Add('User_Name=bi_banco');
    FDConnection.Params.Add('Password=bi12345banco');
    FDConnection.Params.Add('ApplicationName=BI_BANCO');
    FDConnection.Params.Add('DATABASE=DBTESTE');
    FDConnection.Params.Add('MARS=yes');
    FDConnection.Params.Add('DriverID=MSSQL');
    FDConnection.Open;
  end;
  end
  else if varBanco = '2' then   // SQLite
  begin
     if not FDConnection.Connected  then
     begin

         FDConnection.Close;
         FDConnection.DriverName := 'SQLITE';
         FDConnection.Params.Values['Database'] := ExtractFilePath(Application.ExeName)+'dbcashflow.db';

         if FDSQLiteSecurity.CheckEncryption = '<unencrypted>' then
           FDConnection.Params.Values['Password'] := '';

         try
          FDConnection.Open;
         except

          on E: EDatabaseError do
            ShowMessage('Exception raised with message' + E.Message);

         end;
     end;

  end;


end;

procedure TDados.DataModuleCreate(Sender: TObject);
begin
   Arq := TIniFile.Create(ExtractFilePath(Application.ExeName)+'conexao.ini');
   varBanco := Arq.ReadString('BANCO','VENDOR', '');
   varRegiao := Arq.ReadString('REGIAO','FORMATDATE', '');
   Arq.Free;
   varLogado := False;
   ConectarNoBanco;
end;


function TDados.Connection: TFDConnection;
begin
  System.TMonitor.Enter(FDConnection);
  try
    Result := FDConnection;
  finally
    System.TMonitor.Exit(FDConnection);
  end;
end;


function TDados.RetornaMensagem(varDescription : String) : String;
begin
    if varID_Language = 0 then
     varID_Language := 1;

    //ConectarNoBanco;

    sqlMensagem.Close;
    sqlMensagem.SQL.Clear;
    sqlMensagem.SQL.Add('SELECT DESCRIPTION_MESSAGE FROM TBMESSAGE where ID_LANGUAGE = :ID_LANGUAGE and DESCRIPTION_TYPE = :DESCRIPTION_TYPE' );
    sqlMensagem.Params.ParamByName('ID_LANGUAGE').AsInteger      := varID_Language;
    sqlMensagem.Params.ParamByName('DESCRIPTION_TYPE').AsString :=  varDescription;
    sqlMensagem.Open;
    if not sqlMensagem.IsEmpty then
      Result := Trim(sqlMensagem.FieldByName('DESCRIPTION_MESSAGE').AsString)
    else Result := 'None';
end;






end.
