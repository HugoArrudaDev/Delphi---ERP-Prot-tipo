unit MenuPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Cliente, CatProd, OrcamentoItem, Orcamento, Produto, Vcl.Menus,
  Vcl.Imaging.pngimage, RelProduto, RelOrcamento, Sobre, CadOrcamentoOficial, RelClientes, Vcl.ExtCtrls;

type
  TMenuPrincipalF = class(TForm)
    MainMenu1: TMainMenu;
    Cadastro1: TMenuItem;
    Vendas1: TMenuItem;
    Manutencao1: TMenuItem;
    Sobre1: TMenuItem;
    Orcamento1: TMenuItem;
    Cliente1: TMenuItem;
    Produto1: TMenuItem;
    Usurios1: TMenuItem;
    CategoriaProduto1: TMenuItem;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Relatrios1: TMenuItem;
    Clientes1: TMenuItem;
    Orcamento2: TMenuItem;
    Produto3: TMenuItem;
    procedure Cliente1Click(Sender: TObject);
    procedure Produto1Click(Sender: TObject);
    procedure CategoriaProduto1Click(Sender: TObject);
    procedure Orcamento1Click(Sender: TObject);
    procedure OrcamentoItemClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Sobre1Click(Sender: TObject);
    procedure Clientes1Click(Sender: TObject);
    procedure Orcamento2Click(Sender: TObject);
    procedure Produto3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MenuPrincipalF: TMenuPrincipalF;

implementation

{$R *.dfm}

procedure TMenuPrincipalF.CategoriaProduto1Click(Sender: TObject);
begin
  CatProdF := TCatProdF.Create(Self);
  CatProdF.Showmodal;
end;

procedure TMenuPrincipalF.Cliente1Click(Sender: TObject);
begin
  CadClienteF := TCadClienteF.Create(Self);
  CadClienteF.Showmodal;
end;

procedure TMenuPrincipalF.Clientes1Click(Sender: TObject);
begin
  RelClientesF := TRelClientesF.Create(Self);
  RelClientesF.ShowModal;
end;

procedure TMenuPrincipalF.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := cafree;
end;

procedure TMenuPrincipalF.Orcamento1Click(Sender: TObject);
begin
  CadOrcamentoFF := TCadOrcamentoFF.Create(Self);
  CadOrcamentoFF.Showmodal;
end;

procedure TMenuPrincipalF.Orcamento2Click(Sender: TObject);
begin
  RelOrcamentoF := TRelOrcamentoF.Create(Self);
  RelOrcamentoF.ShowModal;
end;

procedure TMenuPrincipalF.OrcamentoItemClick(Sender: TObject);
begin
  OrcamentoItemF := TOrcamentoItemF.Create(Self);
  OrcamentoItemF.Showmodal;
end;

procedure TMenuPrincipalF.Produto1Click(Sender: TObject);
begin
   CadProdutoF := TCadProdutoF.Create(Self);
   CadProdutoF.Showmodal;
end;

procedure TMenuPrincipalF.Produto3Click(Sender: TObject);
begin
  RelProdutoF := TRelProdutoF.Create(Self);
  RelProdutoF.ShowModal;
end;

procedure TMenuPrincipalF.Sobre1Click(Sender: TObject);
begin
  SobreF := TSobreF.Create(Self);
  SobreF.ShowModal;
end;

end.
