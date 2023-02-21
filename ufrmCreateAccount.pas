unit ufrmCreateAccount;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, cxGraphics,
  cxLookAndFeels, cxLookAndFeelPainters, Vcl.Menus, dxSkinsCore, dxSkinBlack,
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
  dxSkinValentine, dxSkinVS2010, dxSkinWhiteprint, dxSkinXmas2008Blue, cxButtons,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.Mask;

type
  TfrmCreateAccount = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    edtFullName: TEdit;
    edtEmail: TEdit;
    edtPassword: TEdit;
    butOk: TcxButton;
    cboLanguage: TComboBox;
    Label5: TLabel;
    sqlSalvar: TFDQuery;
    EdtPhone: TMaskEdit;
    sqlAux: TFDQuery;
    procedure butOkClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCreateAccount: TfrmCreateAccount;

implementation

{$R *.dfm}

uses uDados, uFunctions, MensFun;

procedure TfrmCreateAccount.butOkClick(Sender: TObject);
var
  varMsg: TStringList;
  varIdUser, varIdUserOLD,  varIdLanguage : Integer;
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

  if edtPassword.Text = '' then
  begin
     Mens_MensInf('Type your Password.') ;
     edtPassword.SetFocus ;
     Exit ;
  end;

  if EdtPhone.Text = '(999)999-9999' then
  begin
     Mens_MensInf('Type your Phone Number.') ;
     EdtPhone.SetFocus ;
     Exit ;
  end;



  if cboLanguage.ItemIndex = -1 then
  begin
     Mens_MensInf('Select your favorite Language.') ;
     cboLanguage.SetFocus ;
     Exit ;
  end;

  sqlSalvar.Close;
  sqlSalvar.SQL.Clear;
  sqlSalvar.SQL.Add('insert into TBUSER  ( FULLNAME, EMAIL, PWD, PHONE_NUMBER, ID_LANGUAGE ) ');
  sqlSalvar.SQL.Add('values ( :FullName, :Email, :Pwd, :PHONE_NUMBER,  :Id_Language)');
  sqlSalvar.Params.ParamByName('FullName').AsString     :=  edtFullName.Text;
  sqlSalvar.Params.ParamByName('Email').AsString        :=  Uppercase(Trim(edtEmail.Text));
  sqlSalvar.Params.ParamByName('Pwd').AsString          :=  UpperCase(Trim(edtPassword.Text));
  sqlSalvar.Params.ParamByName('PHONE_NUMBER').AsString :=  EdtPhone.Text;
  sqlSalvar.Params.ParamByName('Id_Language').AsInteger :=  cboLanguage.ItemIndex + 1;
  Try
      sqlSalvar.ExecSQL;
      Mens_MensInf( 'USER CREATED' );

  except
      on E : Exception do
      begin
        if Pos('is not unique', E.Message) <> 0 then
           Mens_MensErro('E-mail already exists')
        else
          Mens_MensErro(E.ClassName+' error raised, with message : '+E.Message);
          exit;
      end;
  end;

  Try
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

      varIdUser := sqlAux.FieldByName('ID_USER').AsInteger;

      sqlAux.Close;
      sqlAux.SQL.Clear;

      // retorna o usuario padrao do sistema
      if Dados.varBanco = '1' then
        sqlAux.SQL.Add('Select top 1 ID_USER From TBUSER Where ID_LANGUAGE  = :ID_LANGUAGE ')

      else if Dados.varBanco = '2' then
        sqlAux.SQL.Add('Select ID_USER From TBUSER Where ID_LANGUAGE  = :ID_LANGUAGE LIMIT 1');

      sqlAux.Params.ParamByName('ID_LANGUAGE').AsInteger := cboLanguage.ItemIndex + 1;
      sqlAux.Open;

      varIdUserOLD  := sqlAux.FieldByName('ID_USER').AsInteger;
      sqlAux.Close;
      sqlAux.SQL.Clear;
      sqlAux.SQL.Add('Select Count(1) as QTDE From CentrodeCusto Where ID_USER = :ID_USER');
      sqlAux.Params.ParamByName('ID_USER').AsInteger := varIdUser;
      sqlAux.Open;
      if sqlAux.FieldByName('QTDE').AsInteger = 0 then
      begin

          sqlAux.Close;
          sqlAux.SQL.Clear;
          sqlAux.SQL.Add(' Insert into CentrodeCusto (CentroDeCusto, Categoria, ID_USER, ID_LANGUAGE, GRUPO, TIPO) ');
          sqlAux.SQL.Add(' Select CentroDeCusto, Categoria, ' + IntToStr(varIdUser) + ', ID_LANGUAGE, GRUPO, TIPO from CentrodeCusto where ID_USER = :ID_USER ');
          sqlAux.Params.ParamByName('ID_USER').AsInteger :=  varIdUserOLD;
          Try
            sqlAux.ExecSQL;
            Mens_MensInf( 'PARAMETERE´S USER CREATED' );
          except
            on E : Exception do
              Mens_MensErro(E.ClassName+' error raised, with message : '+E.Message);
          end;

      end;

  Finally
       FreeAndNil(sqlAux);
  End;

  varMsg    := TStringList.Create;
  Try


      varMsg.Add('<HTML>');

      varMsg.Add('<HEAD>');
      varMsg.Add('<meta http-equiv="content-type" content="text/html"; charset=ISO-8859-1">');

      //varMsg.Add('<script src="https://kit.fontawesome.com/976b91e952.js" crossorigin="anonymous"></script> ');

      varMsg.Add('<style>');
      varMsg.Add('.p_link{font-family:Verdana}');
      varMsg.Add('</style>');

      varMsg.Add('</HEAD>');

      varMsg.Add('<BODY style="font-family:Arial;font-size:11px;">');
      varMsg.Add('<p><b>BALANCE - NEW USER</b></p>');
      varMsg.Add('<BR>');
      varMsg.Add('<p><i>FULLNAME: ' + edtFullName.Text + '</i></p>');
      varMsg.Add('<p><i>E-MAIL: ' + edtEmail.Text + '</i></p>');
      varMsg.Add('<p><i>PHONE NUMBER: ' + EdtPhone.Text + '</i></p>');
      varMsg.Add('<p><i>LANGUAGE: ' + cboLanguage.Text + '</i></p>');

      varMsg.Add('<BR>');
      varMsg.Add('<BR>');
      varMsg.Add('<BR>');
      varMsg.Add('<BR>');
      varMsg.Add('<p><i>LIBERAR ACESSO PARA O CLIENTE ACIMA.</i></p>');
      varMsg.Add('<BR>');

      varMsg.Add('<p>Obrigado</p>');
      varMsg.Add('<BR>');
      varMsg.Add('<p>Assistente Virtual</p>');
      varMsg.Add('<p>Customer Service Balance</p>');
      varMsg.Add('<p>(706) 315-3746</p>');

      varMsg.Add('</BODY>');
      varMsg.Add('</HTML>');

     // EnviarEmail('mlj.developer.br@gmail.com', varMsg.Text);

  Finally
    FreeAndNil(varMsg);
  End;

end;

procedure TfrmCreateAccount.FormActivate(Sender: TObject);
begin
  edtFullName.SetFocus;
end;

end.
