unit OrcamentoItemAdd;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls,
  Vcl.Buttons, CadOrcamentoOficial, DataModule, Data.DB, Datasnap.Provider,
  Datasnap.DBClient;

type
  TOrcamentoItemAddF = class(TForm)
    edtIdProd: TDBEdit;
    BitBtn1: TBitBtn;
    edtDescProd: TDBEdit;
    edtQuant: TEdit;
    edtValorUnt: TDBEdit;
    btnInserir: TBitBtn;
    btnCancelar: TBitBtn;
    edtValorTotal: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    cdsProduto: TClientDataSet;
    dspProduto: TDataSetProvider;
    dsProduto: TDataSource;
    cdsProdutoprodutoid: TIntegerField;
    cdsProdutocategoriaprodutoid: TIntegerField;
    cdsProdutods_produto: TWideStringField;
    cdsProdutoobs_produto: TWideStringField;
    cdsProdutovl_venda_produto: TFMTBCDField;
    cdsProdutodt_cadastro_produto: TSQLTimeStampField;
    cdsProdutostatus_produto: TWideStringField;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtQuantExit(Sender: TObject);
    procedure btnInserirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  OrcamentoItemAddF: TOrcamentoItemAddF;

implementation

uses PesquisaProdutoAdd;

{$R *.dfm}

procedure TOrcamentoItemAddF.BitBtn1Click(Sender: TObject);
begin
  if not (cdsProduto.State in [dsEdit]) then
  cdsProduto.Edit;
  PesquisaProdutoAddF := TPesquisaProdutoAddF.Create(Self);
  PesquisaProdutoAddF.ShowModal;

end;

procedure TOrcamentoItemAddF.btnInserirClick(Sender: TObject);
begin

  CadOrcamentoFF.cdsMestreItemorcamentoid.AsInteger := CadOrcamentoFF.cdsMestreOrcorcamentoid.AsInteger;
  CadOrcamentoFF.cdsMestreItemprodutoid.AsInteger := StrToInt(edtIdProd.Text);
  CadOrcamentoFF.cdsMestreItemdesc_prod.AsString :=  edtDescProd.Text;
  CadOrcamentoFF.cdsMestreItemqt_produto.AsFloat := StrToFloat(edtQuant.Text);
  CadOrcamentoFF.cdsMestreItemvl_unitario.AsFloat := StrToFloat(edtValorUnt.Text);
  CadOrcamentoFF.cdsMestreItemvl_total.AsFloat := StrToFloat(edtValorTotal.Text);
  CadOrcamentoFF.cdsMestreItemorcamentoitemid.AsString :=
    CadOrcamentoFF.GetProximoCodigo('ORCAMENTOITEMID','ORCAMENTO_ITEM');
  CadOrcamentoFF.cdsMestreItem.Post;
  CadOrcamentoFF.SomaItens;

  Close;

end;

procedure TOrcamentoItemAddF.edtQuantExit(Sender: TObject);
var
soma : real;
begin

    soma:=StrToFloat(edtQuant.Text)*StrToFloat(edtValorUnt.Text);
    edtValorTotal.Text := FloatToStr(soma);

end;

procedure TOrcamentoItemAddF.FormShow(Sender: TObject);
begin
  cdsProduto.Open;
end;

end.
