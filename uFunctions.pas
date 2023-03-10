unit uFunctions;

interface

uses
  Vcl.Dialogs,
  Forms,
  System.IOUtils,
  Windows,
  StrUtils ,
  System.SysUtils,
  System.RegularExpressions,
  idGlobal,
  IdIOHandler,
  IdIOHandlerSocket,
  IdIOHandlerStack,
  IdSSL,
  IdSSLOpenSSL,
  IdIMAP4,
  IdMessage,
  IdBaseComponent,
  IdComponent,
  IdTCPConnection,
  IdTCPClient,
  IdExplicitTLSClientServerBase,
  IdMessageClient,
  IdSMTPBase,
  IdSMTP,
  IdAttachment,
  IdText,
  IdAttachmentFile,
  SQLTimST,
  XML.XMLIntf,
  Xml.XMLDoc,
  System.Classes,
  Soap.SOAPHTTPClient;



  function Str_Pal(cOrig: string; nPos: Word; cSep: ShortString): string;
  function ComputerName : String;
  function WUserName: String;
  function FileVersion: String;
  function StrTran(sOrigem: string; sLoc: string; sSub: string): string;
  function IsMatch(const Input, Pattern: string): boolean;
  function IsValidEmailRegEx(const EmailAddress: string): boolean;
  function EnviarEmail(varEmail, varMensagem : String) : Boolean;

  function FloatToStrWithDecimalPoint(const Value: Extended; varRegiaoLocal : String ): String;
  function TrocaCaracterEspecial(aTexto : string; aLimExt : boolean) : string;
  function FixEncodingIssues(str : string) : String;
  function ArrumaCaracter(varPalavra : String) : String;
  procedure doSaveLog(lPath,  Msg: String);
  function ParseDateFromDB(const DateStr: String; Id_Bank : Integer): TDateTime;
  function ZeroLeft(vZero: string; vQtd: integer): string;

implementation

function Str_Pal(cOrig: string; nPos: Word; cSep: ShortString): string;
var
  nCount: Word;
  nAtPos: Word;
begin
  nCount := 1;
  cOrig := StringReplace(cOrig,'"','',[rfReplaceAll, rfIgnoreCase]);
  while TRUE do
  begin
    if (nPos = nCount) then
      Result := cOrig
    else
      Result := '';
    nAtPos := Pos(cSep, cOrig);
    if not (nAtPos > 0) then EXIT;
    Result := Copy(cOrig, 1, nAtPos - 1);
    if nCount = nPos then EXIT;
    cOrig := Copy(cOrig, nAtPos + 1, Length(cOrig));
    Inc(nCount);
  end;
end;



function ComputerName : String;
var
  buffer: array[0..255] of char;
  size: dword;

begin

  size := 256;
  if GetComputerName(buffer, size) then
    Result := buffer
  else
    Result := ''

end;

function WUserName: String;
var
  nSize: DWord;

begin

  nSize := 1024;
  SetLength(Result, nSize);
  if GetUserName(PChar(Result), nSize) then
    SetLength(Result, nSize-1)
  else
    RaiseLastOSError;

  if Result.Equals('rafae') then
    Result := 'petrelra';
//    Result := 'gocaloal';

end;

function FileVersion: String;
var
  VerInfoSize: Cardinal;
  VerValueSize: Cardinal;
  Dummy: Cardinal;
  PVerInfo: Pointer;
  PVerValue: PVSFixedFileInfo;
  FileName: TFileName;

begin

  FileName := Application.ExeName;

  Result := '';
  VerInfoSize := GetFileVersionInfoSize(PChar(FileName), Dummy);
  GetMem(PVerInfo, VerInfoSize);
  try
    if GetFileVersionInfo(PChar(FileName), 0, VerInfoSize, PVerInfo) then
      if VerQueryValue(PVerInfo, '\', Pointer(PVerValue), VerValueSize) then
        with PVerValue^ do
          Result := Format('v%d.%d.%d build %d', [
            HiWord(dwFileVersionMS), //Major
            LoWord(dwFileVersionMS), //Minor
            HiWord(dwFileVersionLS), //Release
            LoWord(dwFileVersionLS)]); //Build
  finally
    FreeMem(PVerInfo, VerInfoSize);
  end;

end;

function StrTran(sOrigem: string; sLoc: string; sSub: string): string;
var
  Aux: string;
  Calc: integer;
  Posicao: integer;
begin
//Localiza um conjunto de strings e subtitui por outro
  Aux := sOrigem;
  Calc := 0;
  Posicao := Pos(sLoc, Aux);
  while Posicao > 0 do
  begin

    Delete(Aux, Posicao, Length(sLoc));
    Posicao := Posicao + Calc;
    sOrigem := Copy(sOrigem, 1, Posicao - 1) + sSub +
      Copy(sOrigem, Posicao + Length(sLoc), Length(sOrigem));
    Calc := Calc + Length(sSub);
    Posicao := Pos(sLoc, Aux);
  end;
  Result := sOrigem;
end;




function IsMatch(const Input, Pattern: string): boolean;
begin
 Result := TRegEx.IsMatch(Input, Pattern);
end;

function IsValidEmailRegEx(const EmailAddress: string): boolean;
const
  EMAIL_REGEX = '^((?>[a-zA-Z\d!#$%&''*+\-/=?^_`{|}~]+\x20*|"((?=[\x01-\x7f])'
             +'[^"\\]|\\[\x01-\x7f])*"\x20*)*(?<angle><))?((?!\.)'
             +'(?>\.?[a-zA-Z\d!#$%&''*+\-/=?^_`{|}~]+)+|"((?=[\x01-\x7f])'
             +'[^"\\]|\\[\x01-\x7f])*")@(((?!-)[a-zA-Z\d\-]+(?<!-)\.)+[a-zA-Z]'
             +'{2,}|\[(((?(?<!\[)\.)(25[0-5]|2[0-4]\d|[01]?\d?\d))'
             +'{4}|[a-zA-Z\d\-]*[a-zA-Z\d]:((?=[\x01-\x7f])[^\\\[\]]|\\'
             +'[\x01-\x7f])+)\])(?(angle)>)$';
begin
  Result := IsMatch(EmailAddress, EMAIL_REGEX);
end;





function EnviarEmail(varEmail, varMensagem : String) : Boolean;
var
  SSLHandler   : TIdSSLIOHandlerSocketOpenSSL;
  emMessage    : TIdMessage;
  emSMTP       : TIdSMTP;
  bEnvio       : Boolean;
  Attachment   : TIdAttachment;
  I            : Integer;
begin
  emSMTP     := TIdSMTP.Create;
  emMessage := TIdMessage.Create;
  SSLHandler := TIdSSLIOHandlerSocketOpenSSL.Create(nil);
  Try

   SSLHandler.MaxLineAction          := maException;
   SSLHandler.SSLOptions.Method      := sslvTLSv1;
   SSLHandler.SSLOptions.Mode        := sslmUnassigned;
   SSLHandler.SSLOptions.VerifyMode  := [];
   SSLHandler.SSLOptions.VerifyDepth := 0;

   emSMTP.IOHandler := SSLHandler;
   emSMTP.Host      := 'smtp.gmail.com';
   emSMTP.Port      := 465;
   emSMTP.Username  := 'mlj.developer.br@gmail.com';
   emSMTP.Password  := '10102020!';
   emSMTP.UseTLS    := utUseImplicitTLS;


   emSMTP.Connect;
   Try

      if emSMTP.Connected then
      begin
         with emMessage do
         begin
           Clear;
           Body.Clear;
           Recipients.Clear;
           Subject                := '[BALANCE] - NEW USER:';
           From.Address           := 'mlj.developer.br@gmail.com';
           From.Name              := 'BALANCE';
           Recipients.Add.Address := varEmail;
           {
           FDQueryEmail.Close;
           FDQueryEmail.Filtered := False;
           FDQueryEmail.Filter   := 'TSOP_ATIVO = ''S''';
           FDQueryEmail.Filtered := True;
           FDQueryEmail.Open;

           while not FDQueryEmail.Eof do
           begin
             BccList.Add.Address := FDQueryEmail.FieldByName('TSOP_EMAIL').AsString;
             FDQueryEmail.Next;
           end;
            }
           ContentType            := 'multipart/alternative';
           ContentDisposition     := 'inline';
           Encoding               := meMIME;
         end;

         with TIdText.Create(emMessage.MessageParts) do
         begin
            Body.Text       := 'This message contains HTML and images.';
            ContentTransfer := '7bit';
            ContentType     := 'text/plain';
         end;

         with TIdText.Create(emMessage.MessageParts) do
         begin
            ContentType     := 'multipart/related';
            Body.Clear;
         end;

         with TIdText.Create(emMessage.MessageParts) do
         begin
           Body.Clear;
           Body.Text       := varMensagem;
           ContentTransfer := '7bit';
           ContentType     := 'text/html';
           ParentPart      := 1;
         end;
       {
        for I := 0 to varAnexos.Count-1 do
        begin

           Attachment := TIdAttachmentFile.Create(emMessage.MessageParts, varAnexos[I]);

        end;
        }

      end;

      bEnvio := False;
      try
         emSMTP.Send(emMessage);
         bEnvio := True;
      except
         bEnvio := False;
      end;

    Finally
     emSMTP.Disconnect;

    End;
  Finally
     FreeAndNil(emMessage);
     FreeAndNil(emSMTP);
     FreeAndNil(SSLHandler);
  End;

end;

function FloatToStrWithDecimalPoint(const Value: Extended; varRegiaoLocal : String): String;
var
  myFormatSettings: TFormatSettings;
  Format : String;
begin
  GetLocaleFormatSettings(GetThreadLocale, myFormatSettings);
  if varRegiaoLocal = '1' then
  begin
    Format:= '0.##';
    myFormatSettings.DecimalSeparator := '.';
  end
  else if varRegiaoLocal = '2' then
  begin
    Format:= '0.##';
    myFormatSettings.DecimalSeparator := '.';
  end;

  Result := FormatFloat(Format, Value, myFormatSettings);
end;


function TrocaCaracterEspecial(aTexto : string; aLimExt : boolean) : string;
const
  //Lista de caracteres especiais
  xCarEsp: array[1..38] of String = ('?', '?', '?', '?', '?','?', '?', '?', '?', '?',
                                     '?', '?','?', '?','?', '?','?', '?',
                                     '?', '?', '?','?', '?','?', '?', '?', '?', '?',
                                     '?', '?', '?','?','?', '?','?','?','?','?');
  //Lista de caracteres para troca
  xCarTro: array[1..38] of String = ('a', 'a', 'a', 'a', 'a','A', 'A', 'A', 'A', 'A',
                                     'e', 'e','E', 'E','i', 'i','I', 'I',
                                     'o', 'o', 'o','o', 'o','O', 'O', 'O', 'O', 'O',
                                     'u', 'u', 'u','u','u', 'u','c','C','n', 'N');
  //Lista de Caracteres Extras
  xCarExt: array[1..48] of string = ('<','>','!','@','#','$','%','?','&','*',
                                     '(',')','_','+','=','{','}','[',']','?',
                                     ';',':',',','|','*','"','~','^','?','`',
                                     '?','?','?','?','?','?','?','?','?','?',
                                     '?','?','?','?','?','?','?','?');
var
  xTexto : string;
  i : Integer;
begin
   xTexto := aTexto;
   for i:=1 to 38 do
     xTexto := StringReplace(xTexto, xCarEsp[i], xCarTro[i], [rfreplaceall]);
   //De acordo com o par?metro aLimExt, elimina caracteres extras.
   if (aLimExt) then
     for i:=1 to 48 do
       xTexto := StringReplace(xTexto, xCarExt[i], '', [rfreplaceall]);
   Result := xTexto;
end;


function ArrumaCaracter(varPalavra : String) : String;
var
 i : Integer;
 varSaida : String;
begin
   for i  := 0 to Length( varPalavra ) do
    varSaida :=   StringReplace(varPalavra, varPalavra[i], FixEncodingIssues (varPalavra[i]), [rfreplaceall]) ;

   result := varSaida;
end;


function FixEncodingIssues(str : string) : String;
var
  fixedStr : String;
begin

Case AnsiIndexStr(str, ['??', '?\x81','??' , '??', '??', '??', '??', '??', '??', '??', '??', '??', '?\x8D',
                        '??', '?\x8F' , '?\x9' ,  '??', '??', '??', '??' , '??' , '??', '??', '??' , '??' ,
                        '??', '??', '??', '??', '?\x9D','?\xA0','??','??','??', '??','??' ,  '??' , '??' ,
                        '??' ,  '??',  '??' ,  '??' ,'??',  '??' , '??', '?\xAD', '??' , '??' ,'??',  '??',
                        '??' ,'??',  '??' , '??',  '??', '??' , '??' , '??',   '??' ]) of
        0 : result := '?';
        1 : result := '?';
        2 : result := '?';
        3 : result := '?';
        5 : result := '?';
        6 : result := '?';
        7 : result := '?';
        8 : result := '?';
        9 : result := '?';
       10 : result := '?';
       11 : result := '?';
       12 : result := '?';
       13 : result := '?';
       14 : result := '?';
       15 : result := '?';
       16 : result := '?';
       17 : result := '?';
       18 : result := '?';
       19 : result := '?';
       20 : result := '?';
       21 : result := '?';
       22 : result := '?';
       23 : result := '?';
       24 : result := '?';
       25 : result := '?';
       26 : result := '?';
       27 : result := '?';
       28 : result := '?';
       29 : result := '?';
       30 : result := '?';
       31 : result := '?';
       32 : result := '?';
       33 : result := '?';
       34 : result := '?';
       35 : result := '?';
       36 : result := '?';
       37 : result := '?';
       38 : result := '?';
       39 : result := '?';
       40 : result := '?';
       41 : result := '?';
       42 : result := '?';
       43 : result :='?';
       44 : result :='?';
       45 : result :='?';
       46 : result :='?';
       47 : result :='?';
       48 : result :='?';
       49 : result :='?';
       50 : result :='?';
       51 : result :='?';
       52 : result :='?';
       53 : result :='?';
       54 : result :='?';
       55 : result :='?';
       56 : result :='?';
       57 : result :='?';
       58 : result :='?';
   end;
end;

procedure doSaveLog(lPath,  Msg: String);
Var
 loLista : TStringList;
 varDataHora : String;
 varArquivo  : String;
 varArqLogSetonMagento : String;
begin
 varDataHora           := FormatDateTime('ddmmyyyy',Now);
 varArquivo            := '\log_' +  varDataHora  + '.log';
 varArqLogSetonMagento := lPath + varArquivo;
 try
   loLista := TStringList.Create;
   try
   if FileExists(lPath + varArquivo) Then
     loLista.LoadFromFile(lPath + varArquivo);

     loLista.Add(timetostr(now) + ';' + Msg);
   except
    on e: exception do
      loLista.add(timetostr(now) + ': Erro ' + E.Message);
   end;
 Finally
    loLista.SaveToFile(lPath + varArquivo);
    loLista.Free;
 end;

end;

function ParseDateFromDB(const DateStr: String; Id_Bank : Integer): TDateTime;
var
  FormatSettings: TFormatSettings;
  Ano, Mes,Dia : Word;
  varDataLimpa : String;
begin
  varDataLimpa := StringReplace(DateStr,'"','',[rfReplaceAll, rfIgnoreCase]);

  if Id_Bank = 1 then
  begin
    Mes := StrToInt(Str_Pal(varDataLimpa,1,'/'));
    Dia := StrToInt(Str_Pal(varDataLimpa,2,'/'));
    Ano := StrToInt(Str_Pal(varDataLimpa,3,'/'));
  end
  else if id_Bank = 4 then
       begin
         Try
           Mes := StrToInt(Str_Pal(varDataLimpa,2,'-'));
           Dia := StrToInt(Str_Pal(varDataLimpa,3,'-'));
           Ano := StrToInt(Str_Pal(varDataLimpa,1,'-'));
         Except
           Mes := StrToInt(Str_Pal(varDataLimpa,2,'/'));
           Dia := StrToInt(Str_Pal(varDataLimpa,1,'/'));
           Ano := StrToInt(Str_Pal(varDataLimpa,3,'/'));
         End;
       end;

  Result := EncodeDate(Ano, Mes, Dia);
 {
  FormatSettings.DateSeparator := '/';
  FormatSettings.ShortDateFormat := 'MM/dd/yyyy';
  FormatSettings.LongDateFormat := 'MM/dd/yyyy';
  }
//  Result := StrToDate(DateStr, FormatSettings);
end;

function ZeroLeft(vZero: string; vQtd: integer): string;
var
  i, vTam: integer;
  vAux: string;
begin

  vAux := vZero;
  vTam := length( vZero );
  vZero :=  '';
  for i := 1 to vQtd - vTam do
    vZero := '0' + vZero;

  vAux := vZero + vAux;

  result := vAux;

end;

end.
