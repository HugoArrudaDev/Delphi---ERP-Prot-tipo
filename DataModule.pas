unit DataModule;

interface

uses
  System.SysUtils, System.Classes, Data.FMTBcd, Data.DB, Data.SqlExpr,
  DbxDevartPostgreSQL, Datasnap.DBClient, Datasnap.Provider;

type
  TDataModule1 = class(TDataModule)
    SQLConnection1: TSQLConnection;
    qryCliente: TSQLQuery;
    qryProduto: TSQLQuery;
    qryClienteclienteid: TIntegerField;
    qryClientetipo_cliente: TWideStringField;
    qryClientecpf_cnpj_cliente: TWideStringField;
    qryClientenome_cliente: TWideStringField;
    qryProdutoprodutoid: TIntegerField;
    qryProdutocategoriaprodutoid: TIntegerField;
    qryProdutods_produto: TWideStringField;
    qryProdutoobs_produto: TWideStringField;
    qryProdutovl_venda_produto: TFMTBCDField;
    qryProdutodt_cadastro_produto: TSQLTimeStampField;
    qryProdutostatus_produto: TWideStringField;
    qryOrcamento: TSQLQuery;
    qryCatProd: TSQLQuery;
    qryCatProdcategoriaprodutoid: TIntegerField;
    qryCatProdds_categoria_produto: TWideStringField;
    qryOrcamentoorcamentoid: TIntegerField;
    qryOrcamentoclienteid: TIntegerField;
    qryOrcamentodt_orcamento: TSQLTimeStampField;
    qryOrcamentodt_validade_orcamento: TSQLTimeStampField;
    qryOrcamentovl_total_orcamento: TFMTBCDField;
    qryOrcItem: TSQLQuery;
    qryOrcItemorcamentoitemid: TIntegerField;
    qryOrcItemorcamentoid: TIntegerField;
    qryOrcItemprodutoid: TIntegerField;
    qryOrcItemqt_produto: TFMTBCDField;
    qryOrcItemvl_unitario: TFMTBCDField;
    qryOrcItemvl_total: TFMTBCDField;
    qryGenerica: TSQLQuery;
    dspGenerica: TDataSetProvider;
    cdsGenerica: TClientDataSet;
    dspSequence: TDataSetProvider;
    qryOrcItemdesc_prod: TWideStringField;
    qryOrcamentonome_cliente: TWideStringField;
    qryOrcItemSegunda: TSQLQuery;
    qryOrcItemSegundaorcamentoitemid: TIntegerField;
    qryOrcItemSegundaorcamentoid: TIntegerField;
    qryOrcItemSegundaprodutoid: TIntegerField;
    qryOrcItemSegundaqt_produto: TFMTBCDField;
    qryOrcItemSegundavl_unitario: TFMTBCDField;
    qryOrcItemSegundavl_total: TFMTBCDField;
    qryOrcItemSegundadesc_prod: TWideStringField;
    qryLogin: TSQLQuery;
    qryLoginid: TIntegerField;
    qryLoginusuario: TWideStringField;
    qryLoginnome_completo: TWideStringField;
    qryLoginsenha: TWideStringField;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModule1: TDataModule1;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TDataModule1.DataModuleCreate(Sender: TObject);
begin
  SQLConnection1.ConnectionName:= 'Devart PostgreSQL';
  SQLConnection1.DriverName    := 'DevartPostgreSQL';
  SQLConnection1.LibraryName   := 'dbexppgsql40.dll';
  SQLConnection1.GetDriverFunc := 'getSQLDriverPostgreSQL';

  SQLConnection1.Params.Values['HostName']   := 'localhost';
  SQLConnection1.Params.Values['DataBase']   := 'postgres';
  SQLConnection1.Params.Values['SchemaName'] := 'public';
  SQLConnection1.Params.Values['DriverName'] := 'DevartPostgreSQL';
  SQLConnection1.Params.Values['User_Name']  := 'postgres';
  SQLConnection1.Params.Values['Password']   := 'sntjnr1982';

  SQLConnection1.Connected := True;
  end;

end.
