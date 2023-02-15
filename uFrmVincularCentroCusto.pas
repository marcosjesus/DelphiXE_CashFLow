unit uFrmVincularCentroCusto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, cxGraphics,
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
  dxSkinXmas2008Blue, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, Data.DB,
  FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.Comp.DataSet, Vcl.DBCtrls, Vcl.Menus, cxButtons;

type
  TfrmVincularCentroCusto = class(TForm)
    lblFavorecido: TLabel;
    Panel1: TPanel;
    lblCategoria: TLabel;
    lblValor: TLabel;
    lblDataCompra: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    sqlCentroCusto: TFDQuery;
    dsCentroCusto: TDataSource;
    sqlAux: TFDQuery;
    lblFile: TLabel;
    cxButton1: TcxButton;
    butCancel: TcxButton;
    butDelete: TcxButton;
    cboCC: TComboBox;
    procedure FormCreate(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure butDeleteClick(Sender: TObject);
  private
    { Private declarations }
     idx : Integer;
  public
    { Public declarations }
        bAlterar : Boolean;
        ID_Transacao : Integer;
  end;

var
  frmVincularCentroCusto: TfrmVincularCentroCusto;

implementation

{$R *.dfm}

uses uDados, MensFun;

procedure TfrmVincularCentroCusto.butDeleteClick(Sender: TObject);
begin


   if messagedlg(pchar('Você deseja realmente excluir a Transação ID: '+ IntToStr(ID_Transacao)  +' ?') ,mtConfirmation,[mbyes,mbno],0) = mrYes then
   begin
     Dados.ConectarNoBanco;
     sqlAux.Close;
     sqlAux.SQL.Clear;
     sqlAux.SQL.Add('Delete from TbTransacao where id = :id');
     sqlAux.Params.ParamByName('id').AsInteger := ID_Transacao;

     Try
        sqlAux.ExecSQL;
     Except
        on E: Exception do
          begin
             Application.MessageBox( pChar('Erro ao Excluir a Transação - ' +  E.Message) , 'TRANSAÇÂO', MB_ICONERROR );
          end;
     End;
   end;

   butCancel.Click;

end;

procedure TfrmVincularCentroCusto.cxButton1Click(Sender: TObject);
begin
   idx := cboCC.ItemIndex;
  if idx = -1 then
  begin
    Mens_MensInf(Dados.RetornaMensagem('MEN_MENS_SELCC') );
    cboCC.SetFocus;
    exit;
  end;
end;

procedure TfrmVincularCentroCusto.FormCreate(Sender: TObject);
begin
 Dados.ConectarNoBanco;

 sqlCentroCusto.Close;
 sqlCentroCusto.SQL.Clear;
 sqlCentroCusto.SQL.Add('Select * from CentrodeCusto Where ID_LANGUAGE = :ID_LANGUAGE  and ID_USER = :ID_USER Order by CENTRODECUSTO, GRUPO ');
 sqlCentroCusto.Params.ParamByName('ID_LANGUAGE').AsInteger := 1; //Dados.varID_Language;
 sqlCentroCusto.Params.ParamByName('ID_USER').AsInteger     := Dados.varID_USER;
 sqlCentroCusto.Open;
 lblFile.Caption := IntToStr(Dados.varLinha) + '/' + IntToStr(Dados.varTotalLinha);
 sqlCentroCusto.First;
 cboCC.Items.Clear;
 while not sqlCentroCusto.Eof do
 begin
     cboCC.Items.AddObject(sqlCentroCusto.FieldByName('CentrodeCusto').AsString, TObject(sqlCentroCusto.FieldByName('ID_CentrodeCusto').AsInteger));
     sqlCentroCusto.Next;
 end;


end;

end.
