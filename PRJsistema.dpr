program PRJsistema;

uses
  Vcl.Forms,
  CadModelo in 'CadModelo.pas' {Form1},
  MenuPrincipal in 'MenuPrincipal.pas' {MenuPrincipalF},
  DataModule in 'DataModule.pas' {DataModule1: TDataModule},
  Cliente in 'Cliente.pas' {CadClienteF},
  Produto in 'Produto.pas' {CadProdutoF},
  CatProd in 'CatProd.pas' {CatProdF},
  Sobre in 'Sobre.pas' {SobreF},
  MestreItemOrc in 'MestreItemOrc.pas' {MestreItemOrcF},
  CadOrcamentoOficial in 'CadOrcamentoOficial.pas' {CadOrcamentoFF},
  PesquisaMestre in 'PesquisaMestre.pas' {PesquisaMestreF},
  RelClientes in 'RelClientes.pas' {RelClientesF},
  OrcamentoItemAdd in 'OrcamentoItemAdd.pas' {OrcamentoItemAddF},
  PesquisaProdutoAdd in 'PesquisaProdutoAdd.pas' {PesquisaProdutoAddF},
  RelOrcamento in 'RelOrcamento.pas' {RelOrcamentoF},
  RelProduto in 'RelProduto.pas' {RelProdutoF},
  Login in 'Login.pas' {LoginF};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TDataModule1, DataModule1);
  Application.CreateForm(TLoginF, LoginF);
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMenuPrincipalF, MenuPrincipalF);
  Application.Run;
end.
