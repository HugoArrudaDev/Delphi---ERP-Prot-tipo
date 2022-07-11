unit PesquisaProdutoAdd;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Data.DB, Vcl.Grids, Vcl.DBGrids, Datasnap.DBClient, DataModule, OrcamentoItemAdd, Datasnap.Provider;

type
  TPesquisaProdutoAddF = class(TForm)
    StaticText1: TStaticText;
    Edit1: TEdit;
    BitBtn1: TBitBtn;
    btnVoltar: TBitBtn;
    Panel1: TPanel;
    Edit2: TEdit;
    BitBtn2: TBitBtn;
    StaticText2: TStaticText;
    BitBtn3: TBitBtn;
    DBGrid1: TDBGrid;
    cdsProduto: TClientDataSet;
    dsProduto: TDataSource;
    dspProduto: TDataSetProvider;
    cdsProdutoprodutoid: TIntegerField;
    cdsProdutocategoriaprodutoid: TIntegerField;
    cdsProdutods_produto: TWideStringField;
    cdsProdutoobs_produto: TWideStringField;
    cdsProdutovl_venda_produto: TFMTBCDField;
    cdsProdutodt_cadastro_produto: TSQLTimeStampField;
    cdsProdutostatus_produto: TWideStringField;
    procedure BitBtn2Click(Sender: TObject);
    procedure PesquisarProduto (const pcriando : boolean);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PesquisaProdutoAddF: TPesquisaProdutoAddF;

implementation

{$R *.dfm}

procedure TPesquisaProdutoAddF.BitBtn2Click(Sender: TObject);
begin
  PesquisarProduto(False);
end;

procedure TPesquisaProdutoAddF.BitBtn3Click(Sender: TObject);
begin
  Close;
end;

procedure TPesquisaProdutoAddF.DBGrid1DblClick(Sender: TObject);
begin
  OrcamentoItemAddF.cdsProdutoprodutoid.AsInteger  := cdsProdutoprodutoid.AsInteger;
  OrcamentoItemAddF.cdsProdutods_produto.AsString := cdsProdutods_produto.AsString;
  OrcamentoItemAddF.cdsProdutovl_venda_produto.AsFloat := cdsProdutovl_venda_produto.AsFloat;
  Close;
end;

procedure TPesquisaProdutoAddF.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := cafree;
end;

procedure TPesquisaProdutoAddF.FormShow(Sender: TObject);
begin
  cdsProduto.Open;
end;

procedure TPesquisaProdutoAddF.PesquisarProduto (const pcriando : boolean);
var
  AuxWhere : String;
begin
  //Esta procedure irá executar a pesquisa da Categoria
  if pCriando then
    AuxWhere := '1 = 2'
  else if edit1.Text = '' then
    AuxWhere := '1 = 1'
  else
    AuxWhere := 'PRODUTOID = '+edit1.Text;

  cdsProduto.Close;
  cdsProduto.CommandText :=
              'SELECT '+
              'PRODUTOID, '+
              'CATEGORIAPRODUTOID , '+
              'DS_PRODUTO, '+
              'OBS_PRODUTO, '+
              'VL_VENDA_PRODUTO, '+
              'DT_CADASTRO_PRODUTO, '+
              'STATUS_PRODUTO '+
              'FROM PRODUTO ' +
              'WHERE '+AuxWhere+' '+
              'ORDER BY PRODUTOID';
  cdsProduto.Open;
end;

end.
