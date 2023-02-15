unit uFrmEmail;

interface

uses
  Vcl.FileCtrl,
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
  System.IOUtils,
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
  Vcl.Menus, Vcl.StdCtrls, cxButtons, cxButtonEdit, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, Vcl.ComCtrls;

type
  TfrmEmail = class(TForm)
    cbxProvedor: TcxComboBox;
    Label1: TLabel;
    edtEmail: TEdit;
    edtPassword: TEdit;
    edtOutPut: TcxButtonEdit;
    btnImportar: TcxButton;
    butCancel: TcxButton;
    SaveDialog: TSaveDialog;
    StatusBar1: TStatusBar;
    procedure edtOutPutClick(Sender: TObject);
    procedure btnImportarClick(Sender: TObject);
  private
    { Private declarations }

    // Pastas utilizadas para Leitura de XML (NFE e CTE)

    varProvider, varConta, varPassword, varPorta, varPastaServidorTemp : String;
    PastaINBOX               : String;
    PastaLIDO                : String;
    PastaOthers              : String;
    PastaPDF                 : String;

    PastaSERVIDORNFE_ENTRADA : String;
    PastaSERVIDORCTE_ENTRADA : String;
    PastaXML                 : String;
    PastaXML_LIDO            : String;
    PastaSERVIDORNFE_LIDO    : String;
    PastaSERVIDORCTE_LIDO    : String;
    PastaLOG                 : String;
    PastaERROR               : String; // Armazena xml com erro
    procedure EmailLogin;
  protected

  public
    { Public declarations }
  end;

var
  frmEmail: TfrmEmail;

implementation

{$R *.dfm}

uses uFunctions, MensFun, uDados;





procedure TfrmEmail.btnImportarClick(Sender: TObject);
begin


  if cbxProvedor.ItemIndex = 0 then
  begin
    varProvider  := 'imap.gmail.com';
    varPorta     := '993';
  end
  else if ((cbxProvedor.ItemIndex = 1) or (cbxProvedor.ItemIndex = 2)) Then
  begin
    varProvider  := 'outlook.office365.com';
    varPorta     := '993';
  end;

  if edtEmail.Text = '' then
  begin
    Mens_MensInf( Dados.RetornaMensagem('MEN_INFEMAILACC'));
    edtEmail.SetFocus;
  end;

  if edtPassword.Text = '' then
  begin
    Mens_MensInf( Dados.RetornaMensagem('MEN_INFEMAILPWD'));
    edtPassword.SetFocus;
  end;

  if edtOutPut.Text = '' then
  begin
    Mens_MensInf( Dados.RetornaMensagem('MEN_INFSAVEEMAIL'));
    edtOutPut.SetFocus;
  end;

  if NOT IsValidEmailRegEx(edtEmail.Text) then
  begin
    Mens_MensInf( Dados.RetornaMensagem('MEN_INVALIDEMAIL'));
    edtEmail.SetFocus;
  end;


   varConta     := edtEmail.Text;
   varPassword  := edtPassword.Text;
   varPastaServidorTemp := edtOutPut.Text;

   EmailLogin;
end;

procedure TfrmEmail.edtOutPutClick(Sender: TObject);
var
  FDir : String;
begin
  inherited;
  if Win32MajorVersion >= 6 then
    with TFileOpenDialog.Create(nil) do
    try
      Title := 'Selecionar Diretório';
      Options := [fdoPickFolders, fdoPathMustExist, fdoForceFileSystem]; // YMMV
      OkButtonLabel := 'Selecionar';
      DefaultFolder := FDir;
      FileName := FDir;
      if Execute then
      begin
        edtOutPut.Text := FileName;

      end;
    finally
      Free;
    end
  else
    if SelectDirectory('Selecionar Diretório', ExtractFileDrive(FDir), FDir,
             [sdNewUI, sdNewFolder]) then
      edtOutPut.Text := FDir;

end;

procedure TfrmEmail.EmailLogin;
var
  varSSL       : TIdSSLIOHandlerSocketOpenSSL;
  varIdIMAP41  : TIdIMAP4;
  varMsgXml    : TIdMessage;
  varSMTP      : TStringList;
  varFolderSistema : String;
  SearchInfo: array of TIdIMAP4SearchRec;
  TheFlags    : TIdMessageFlagsSet;
  varSearch   : array of TIdIMAP4SearchRec;
  TheUID      : string;
  i,j, nCount, x : integer;
  varXML, varTmp,  varToday, varDataEmail : string;

  bMoverNFE, bMoverCTE : Boolean;
  bOthers, bPDF        : Boolean;

  NivelNo1, Nivelno2   : String;
begin

  varFolderSistema := ExtractFilePath(Application.ExeName);
  varSMTP          := TStringList.Create;
  varSSL           := TIdSSLIOHandlerSocketOpenSSL.Create(Nil);
  varIdIMAP41      := TIdIMAP4.Create(Nil);
  varMsgXml        := TIdMessage.Create(Nil);
  Try

      if TFile.Exists( varFolderSistema + 'EntradaXML.ini' ) then
      begin

        varSMTP.LoadFromFile(varFolderSistema  + 'EntradaXML.ini');
        varIdIMAP41.Host         := varProvider;
        varIdIMAP41.Username     := varConta;
        varIdIMAP41.Password     := varPassword;
        varIdIMAP41.Port         := StrToInt(varPorta);

        PastaSERVIDORNFE_ENTRADA := varSMTP.Values['PastaSERVIDORNFE_ENTRADA'];
        PastaSERVIDORCTE_ENTRADA := varSMTP.Values['PastaSERVIDORCTE_ENTRADA'];
        PastaSERVIDORNFE_LIDO    := varSMTP.Values['PastaSERVIDORNFE_LIDO'];
        PastaSERVIDORCTE_LIDO    := varSMTP.Values['PastaSERVIDORCTE_LIDO'];
        PastaLOG                 := varSMTP.Values['PastaLOG'];

        PastaSERVIDORNFE_ENTRADA := IncludeTrailingPathDelimiter( PastaSERVIDORNFE_ENTRADA );
        PastaSERVIDORCTE_ENTRADA := IncludeTrailingPathDelimiter( PastaSERVIDORCTE_ENTRADA );
        PastaSERVIDORNFE_LIDO    := IncludeTrailingPathDelimiter( PastaSERVIDORNFE_LIDO );
        PastaSERVIDORCTE_LIDO    := IncludeTrailingPathDelimiter( PastaSERVIDORCTE_LIDO );
        PastaLOG                 := IncludeTrailingPathDelimiter( PastaLOG );
        varPastaServidorTemp     := IncludeTrailingPathDelimiter( varPastaServidorTemp );

        PastaOthers              := varSMTP.Values['PastaOTHERS'];
        PastaPDF                 := varSMTP.Values['PastaPDF'];

      end
      else
      begin
         Writeln( varFolderSistema + 'EntradaXML.ini' + 'Arquivo de Configuração de Conta de E-mail não encontrado.' );
         Exit;
      end;

      varSSL.Host              := varIdIMAP41.Host;
      varSSL.Port              := varIdIMAP41.Port;
      varSSL.Destination       := varSSL.Host + ':' + IntToStr(varSSL.Port);
      varSSL.MaxLineLength     := MaxInt;
      varSSL.SSLOptions.Method := sslvTLSv1;
      varIdIMAP41.IOHandler    := varSSL;
      varIdIMAP41.UseTLS       := utUseImplicitTLS;

      Try
        StatusBar1.Panels[0].Text := 'Inicio: Conectando no Email.';
        varIdIMAP41.Connect ();
        StatusBar1.Panels[0].Text := 'Conectado com Sucesso';


        for x := 0 to 1 do
        begin
            if x = 0 then
               PastaINBOX               := varSMTP.Values['PastaINBOXNFE']
            else
               PastaINBOX               := varSMTP.Values['PastaSPAM'];

            if varIdIMAP41.SelectMailBox(PastaINBOX) = False then begin
                StatusBar1.Panels[0].Text :=  'Erro ao selecionar Pasta '+PastaINBOX;
                Exit;
            end;
            nCount := varIdIMAP41.MailBox.TotalMsgs;

//            SetLength(SearchInfo, 1);
//            SearchInfo[0].SearchKey := skUnseen;
//            varIdIMAP41.SearchMailBox(SearchInfo);


                if nCount = 0 then
                begin
                    StatusBar1.Panels[0].Text := 'Não há mensagens na pasta '+PastaINBOX;
                end
                else
                begin


                   for i := 0 To nCount -1 do
                   begin
                        varIdIMAP41.GetUID(i+1, TheUID);
                        varIdIMAP41.Retrieve(i+1,varMsgXml);
                        varIdIMAP41.UIDRetrieveFlags(TheUID, TheFlags);



                        StatusBar1.Panels[0].Text := 'Count: ' + IntToStr(i);
                        if Frac(i / 1000) = 0 then
                           Application.ProcessMessages;

                        if ((varMsgXml.Subject <> '') and (UpperCase(varMsgXml.Subject) = 'EXTRATO DA SUA CONTA DO NUBANK'))then
                        begin

                          PastaLIDO := '';
                          bMoverNFE := False;
                          bMoverCTE := False;
                          bOthers   := True;
                          bPDF      := False;
                          varTmp    := '';
                          varXML    := '';

                          for j := 0 to pred(varMsgXml.MessageParts.Count) do
                          begin
                            if (varMsgXml.MessageParts.Items[j] is TIdAttachment) then
                            begin

                               varXML := TIdAttachment(varMsgXml.MessageParts.Items[j]).FileName;
                               varTmp := varPastaServidorTemp  + varXML;


                                if lowercase(ExtractFileExt(varTmp)) = '.csv' then
                                   TIdAttachment(varMsgXml.MessageParts.Items[j]).SaveToFile(varTmp);
                            end;
                          end;

                          Try
                             if varIdIMAP41.UIDDeleteMsg(TheUID) = True then
                             begin
                                if varIdIMAP41.ExpungeMailBox = False then
                                   StatusBar1.Panels[0].Text := 'Sucesso em marcar a Mensagem como Deletada mas ela não foi eliminada';
                             end
                             else
                             begin
                                   StatusBar1.Panels[0].Text := 'Falha em Apagar Mensagem. Esta Past é Somente Leitura?';
                             end;

                             StatusBar1.Panels[0].Text := ' XML-Outro Lido: ' +  PWideChar(  PChar(varTmp) );
                          except
                             on E: Exception do
                             begin
                                 doSaveLog(PastaLOG, '[ERRO] Tentando Salvar Arquivo Anexo: ' +  PWideChar(  PChar(varTmp) ));
                             end;

                          end;




                        end;
                        varMsgXml.Clear;
                   end;
                end;

        end;

        varIdIMAP41.Disconnect;

      except
      on E: Exception do
         begin

            StatusBar1.Panels[0].Text := 'Não foi possivel Conectar no Servidor de Email: ' +  E.Message ;
            Exit;

          end;
      End;

  Finally
     FreeAndNil(varSMTP);
     FreeAndNil(varSSL);
     FreeAndNil(varIdIMAP41);
     FreeAndNil(varMsgXml);
  End;


end;

end.
