unit ufrmCentroDeCusto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, dxSkinsCore, dxSkinBlack,
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
  dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit,
  cxNavigator, cxDBData, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGridLevel, cxClasses, cxGridCustomView, cxGrid,
  cxDropDownEdit;

type
  TfrmCentroDeCusto = class(TForm)
    cxGridOperador: TcxGrid;
    cxTableViewOperador: TcxGridDBTableView;
    cxGridLevelOperador: TcxGridLevel;
    cxTableViewOperadorID_CentrodeCusto: TcxGridDBColumn;
    cxTableViewOperadorCentroDeCusto: TcxGridDBColumn;
    sqlCentroCusto: TFDQuery;
    sqlCentroCustoID_CentrodeCusto: TFDAutoIncField;
    sqlCentroCustoCentroDeCusto: TStringField;
    sqlCentroCustoID_USER: TIntegerField;
    sqlCentroCustoID_LANGUAGE: TIntegerField;
    sqlCentroCustoGRUPO: TIntegerField;
    dsCentroCusto: TDataSource;
    sqlCentroCustoTIPO: TStringField;
    cxTableViewOperadorTipo: TcxGridDBColumn;
    procedure FormCreate(Sender: TObject);
    procedure sqlCentroCustoBeforePost(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCentroDeCusto: TfrmCentroDeCusto;

implementation

{$R *.dfm}

uses uDados;

procedure TfrmCentroDeCusto.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  frmCentroDeCusto := nil;
  Action := caFree;
end;

procedure TfrmCentroDeCusto.FormCreate(Sender: TObject);
begin
 Dados.ConectarNoBanco;

 sqlCentroCusto.Close;
 sqlCentroCusto.SQL.Clear;
 sqlCentroCusto.SQL.Add('Select * from CentrodeCusto Where ID_LANGUAGE = :ID_LANGUAGE and ID_USER = :ID_USER Order by CENTRODECUSTO, GRUPO ');
 sqlCentroCusto.Params.ParamByName('ID_LANGUAGE').AsInteger := 1; //Dados.varID_Language;
 sqlCentroCusto.Params.ParamByName('ID_USER').AsInteger := Dados.varID_USER;

 sqlCentroCusto.Open;
end;

procedure TfrmCentroDeCusto.sqlCentroCustoBeforePost(DataSet: TDataSet);
begin
   sqlCentroCusto.FieldByName('ID_USER').AsInteger := Dados.varID_USER;
   sqlCentroCusto.FieldByName('ID_LANGUAGE').AsInteger := 1;
   sqlCentroCusto.FieldByName('GRUPO').AsInteger := 2;

end;

end.
