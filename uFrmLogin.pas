unit uFrmLogin;

interface

uses
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
  dxSkinXmas2008Blue, Vcl.Menus, Vcl.StdCtrls, cxButtons, Vcl.Mask, cxLabel,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.UI.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Phys, Data.DB, FireDAC.Comp.Client,
  FireDAC.Comp.DataSet, Vcl.Buttons;

type
  TFrmLogin = class(TForm)
    Panel1: TPanel;
    cxLabel2: TcxLabel;
    cxLabel1: TcxLabel;
    EdiSenha: TMaskEdit;
    EdiUsuario: TEdit;
    butOk: TcxButton;
    butCancel: TcxButton;
    sqlAux: TFDQuery;
    btnCreateAccount: TcxButton;
    procedure butOkClick(Sender: TObject);
    procedure EdiSenhaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxButton1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure butCancelClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmLogin: TFrmLogin;

implementation

{$R *.dfm}

uses MensFun, ufrmCreateAccount, uFunctions, uDados;

procedure TFrmLogin.butCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmLogin.butOkClick(Sender: TObject);
var
  varComputerName : String;
  varModalResult : Integer;
begin
   Dados.ConectarNoBanco;

   If ( EdiUsuario.Text = '**********' )  OR ( EdiUsuario.Text = '')Then
   Begin
       Mens_MensInf('Type your e-mail.') ;
       EdiUsuario.SetFocus ;
       Exit ;
   End ;

   If ( EdiSenha.Text = '' ) Then
   Begin
       Mens_MensInf('Type your password ') ;
       EdiSenha.Text := '' ;
       EdiSenha.SetFocus ;
       Exit ;
   End ;

   varComputerName := '';
   Dados.varUsuario := '';
   Dados.varID_Language := 0;
  if ((EdiUsuario.Text <> '' ) and (EdiSenha.Text <> '')) then
  begin
    sqlAux.Close;
    sqlAux.sql.Clear;
    sqlAux.sql.Add('Select * from TBUSER ');
    sqlAux.sql.Add(' Where Email = :Email and Pwd = :Pwd ');
    sqlAux.Params.ParamByName('Email').asString := UpperCase(Trim(EdiUsuario.Text));
    sqlAux.Params.ParamByName('Pwd').asString := UpperCase(Trim(EdiSenha.Text));
    sqlAux.Open;

   // GUsuarioAtivo := Tab.SeekGet('USUARIO','CodUsuario',[VarToStr(EdiUsuario.bs_KeyValue)],'ATIVO',False) ;
    varModalResult := 1;
    if ((sqlAux.IsEmpty) or (sqlAux.FieldByName('ACTIVE').AsString = '0')) then
    begin
        Mens_MensInf('User not Found.');
        EdiUsuario.Text := '';
        EdiSenha.Text := '';
        EdiUsuario.SetFocus;
        Exit;
    end
    else
    begin
        varComputerName       := sqlAux.FieldByName('COMPUTERNAME').AsString;
        Dados.varUsuario      := sqlAux.FieldByName('FULLNAME').AsString;
        Dados.varID_USER      := sqlAux.FieldByName('ID_User').AsInteger;
        Dados.varID_Language  := sqlAux.FieldByName('ID_LANGUAGE').AsInteger;
        if varComputerName = '' then
        begin
           sqlAux.Close;
           sqlAux.sql.Clear;
           sqlAux.SQL.Add('Update TBUSER Set COMPUTERNAME = :COMPUTERNAME' );
           sqlAux.sql.Add(' Where Email = :Email and Pwd = :Pwd ');
           sqlAux.Params.ParamByName('Email').asString := EdiUsuario.Text;
           sqlAux.Params.ParamByName('Pwd').asString :=EdiSenha.Text;
           sqlAux.Params.ParamByName('COMPUTERNAME').asString := ComputerName;
           Try
              sqlAux.ExecSQL;
           except
              on E : Exception do
                Mens_MensInf(E.ClassName+' error raised, with message : '+E.Message);
           end;
        end
        else
        begin
          if varComputerName <> ComputerName then
          begin
             Mens_MensInf( Dados.RetornaMensagem('MEN_ACCESS_DENIED') );
             Close;
             varModalResult := 2;
          end;
        end;
    end;
  end;

  if varModalResult = 2 then
  begin
     Dados.varUsuario   := '';
     Dados.varID_Language := 0;
  end;

  ModalResult := varModalResult ;
  Dados.varLogado := True;
  Close;
end;

procedure TFrmLogin.cxButton1Click(Sender: TObject);
begin
  try
     Application.CreateForm(TfrmCreateAccount,  frmCreateAccount);
    frmCreateAccount.ShowModal;

  finally
      FreeAndNil(frmCreateAccount);
  end;

end;

procedure TFrmLogin.EdiSenhaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 13 then
    ButOkClick(Self);
end;

procedure TFrmLogin.FormActivate(Sender: TObject);
begin
  EdiUsuario.SetFocus;
end;

procedure TFrmLogin.FormClose(Sender: TObject; var Action: TCloseAction);
begin

  FrmLogin := nil;
  Action := caFree;
end;

end.
