//www.mundodelphi.com.br

unit Login;

interface

uses
  Windows, Messages, SysUtils, System.Variants, Classes, Graphics, Controls, Forms, Dialogs, dxRibbonForm,
  StdCtrls, Buttons, Mask, rsEdit, ExtCtrls,
  dxSkinsCore, dxSkinsDefaultPainters, cxLookAndFeels, dxSkinsForm , cxControls,
  dxSkinscxPCPainter, cxPC, cxContainer, cxEdit, cxLabel, Menus,
  cxLookAndFeelPainters, cxButtons, cxGraphics, dxSkinBlack, dxSkinBlue,
  dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, FMTBcd, SqlExpr, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSharp, dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinValentine, dxSkinXmas2008Blue, dxSkinBlueprint,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinHighContrast,
  dxSkinMetropolis, dxSkinMetropolisDark, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinSevenClassic,
  dxSkinSharpPlus, dxSkinTheAsphaltWorld, dxSkinVS2010, dxSkinWhiteprint,
  dxBarBuiltInMenu, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, FireDAC.UI.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Phys, Data.DB;

type
  TFrmLogin = class(TdxRibbonForm)
    cxPage: TcxPageControl;
    cxLogin: TcxTabSheet;
    cxAltera: TcxTabSheet;
    EdiSenha: TMaskEdit;
    EdiSAtual: TMaskEdit;
    EdiSNova: TMaskEdit;
    EdiSConf: TMaskEdit;
    cxLabel2: TcxLabel;
    cxLabel1: TcxLabel;
    butOk: TcxButton;
    butCancel: TcxButton;
    btnOKSenha: TcxButton;
    cxButton2: TcxButton;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    cxLabel5: TcxLabel;
    cxLabel6: TcxLabel;
    EdiUsuario: TEdit;
    FDConnection: TFDConnection;
    sqlAux: TFDQuery;
    procedure ButOkClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnOkSenhaClick(Sender: TObject);
    procedure EdiSenhaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    GUsuarioAtivo : Integer;
    AlteraSenha : String;
  public
    { Public declarations }
  end;

var
  FrmLogin: TFrmLogin;

implementation

{$R *.DFM}


procedure TFrmLogin.ButOkClick(Sender: TObject);
begin
   If ( EdiUsuario.Text = '**********' ) Then
   Begin
       Mens_MensInf('Informe o usuário.') ;
       EdiUsuario.SetFocus ;
       Exit ;
   End ;
//   GSenha := Glob_Decript(GSenha);
   If ( EdiSenha.Text <> GSenha ) Then
   Begin
       Mens_MensInf('Senha do usuário inválida') ;
       EdiSenha.Text := '' ;
       EdiSenha.SetFocus ;
//       GSenha := Glob_Decript(GSenha);
       Exit ;
   End ;


  if ((EdiUsuario.Text <> '' ) and (EdiUsuario.Text <> '')) then
  begin
    sqlAux.Close;
    sqlAux.sql.Clear;
    sqlAux.sql.Add('Select * from TBUSER ');
    sqlAux.sql.Add(' Where Email = :Email and Pwd = :Pwd ');
    sqlAux.Params.ParamByName('Email').asString :=
   // GUsuarioAtivo := Tab.SeekGet('USUARIO','CodUsuario',[VarToStr(EdiUsuario.bs_KeyValue)],'ATIVO',False) ;

    if GUsuarioAtivo = '1' then
    begin
        Mens_MensInf('Usuário encontra-se inativo.');
        EdiUsuario.Text := '';
        EdiUsuario.bs_KeyValues.Clear;

        Exit;
    end;

    EdiSenha.SetFocus;
  end;


   ModalResult := mrOk ;
end;

procedure TFrmLogin.FormShow(Sender: TObject);
begin
   EdiUsuario.SetFocus;
end;

procedure TFrmLogin.FormDestroy(Sender: TObject);
begin
   Tab.Destroy ;
end;

procedure TFrmLogin.btnOkSenhaClick(Sender: TObject);
Var
SNova : Integer;
begin
     if EdiSAtual.Text <> GSenha then
       Begin
         Mens_MensInf('A Senha atual não coincide com a senha digitada anteriormente !');
         EdiSAtual.SetFocus;
         Exit;
       end;

     if ( Test_IsEmptyStr(EdiSNova.Text) )  then
       Begin
         Mens_MensInf('A Nova Senha Não Informada!');
         EdiSNova.SetFocus;
         Exit;
       end;

     if ( Test_IsEmptyStr(EdiSConf.Text) )  then
       Begin
         Mens_MensInf('A Confirmação de Senha Não Informado!');
         EdiSConf.SetFocus;
         Exit;
       end;

     if EdiSNova.Text <> EdiSConf.Text then
       Begin
         Mens_MensInf('A Nova senha não coincide com a Confirmação ! Favor digite novamente.');
         EdiSNova.Text := '';
         EdiSConf.Text := '';
         EdiSNova.SetFocus;
         Exit;
       end;


    qryAux.Close;
    qryAux.Sql.Clear;
    qryAux.Sql.Add('update Usuario set Senha = ''' + EdiSNova.Text + ''', Altera = ''0'' where CodUsuario = ''' + VarToStr(EdiUsuario.bs_KeyValue) + '''' );
    try
      qryAux.ExecSQL;
    except
      Mens_MensErro('Erro Alterando Senha!' );
      Exit;
    end;

   Mens_MensInf('Senha Alterada Com Sucesso!');


   EdiSenha.Text := GSenha;
   ButOkClick(Self);
end;


procedure TFrmLogin.EdiSenhaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 13 then
    ButOkClick(Self);
end;

end.

