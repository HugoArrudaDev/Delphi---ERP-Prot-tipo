unit PesquisaMestre;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Data.DB, Vcl.Grids, DataModule, Vcl.DBGrids, Datasnap.Provider,
  Datasnap.DBClient;

type
  TPesquisaMestreF = class(TForm)
    Panel1: TPanel;
    Edit1: TEdit;
    BitBtn1: TBitBtn;
    DBGrid1: TDBGrid;
    cdsCliente: TClientDataSet;
    cdsClienteclienteid: TIntegerField;
    cdsClientetipo_cliente: TWideStringField;
    cdsClientecpf_cnpj_cliente: TWideStringField;
    cdsClientenome_cliente: TWideStringField;
    dsCliente: TDataSource;
    dspCliente: TDataSetProvider;
    StaticText1: TStaticText;
    btnVoltar: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure PesquisarCliente(const pcriando : boolean);
    procedure FormShow(Sender: TObject);
    procedure btnVoltarClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PesquisaMestreF: TPesquisaMestreF;


implementation

uses CadOrcamentoOficial;

{$R *.dfm}

procedure TPesquisaMestreF.BitBtn1Click(Sender: TObject);
begin
  PesquisarCliente(False);
end;
procedure TPesquisaMestreF.btnVoltarClick(Sender: TObject);
begin
  Close;
end;

procedure TPesquisaMestreF.DBGrid1DblClick(Sender: TObject);
begin
 CadOrcamentoFF.cdsMestreOrcclienteid.AsInteger := cdsClienteclienteid.AsInteger;
 CadOrcamentoFF.cdsMestreOrcnome_cliente.AsString := cdsClientenome_cliente.AsString;
 Close;
end;

procedure TPesquisaMestreF.FormShow(Sender: TObject);
begin
  cdsCliente.Open;
end;

procedure TPesquisaMestreF.PesquisarCliente(const pcriando : boolean);
var
  AuxWhere : String;
begin
  //Esta procedure irá executar a pesquisa da Categoria
  if pCriando then
    AuxWhere := '1 = 2'
  else if PesquisaMestreF.edit1.Text = '' then
    AuxWhere := '1 = 1'
  else
    AuxWhere := 'CLIENTEID = '+PesquisaMestreF.edit1.Text;

  cdsCliente.Close;
  cdsCliente.CommandText :=
              'SELECT ' +
              'CLIENTEID, ' +
              'TIPO_CLIENTE, ' +
              'CPF_CNPJ_CLIENTE, ' +
              'NOME_CLIENTE ' +
              'FROM CLIENTE ' +
              'WHERE '+AuxWhere+' '+
              'ORDER BY CLIENTEID';
  cdsCliente.Open;
end;

end.
