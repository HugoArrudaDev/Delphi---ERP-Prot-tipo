unit CatProd;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, CadModelo, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.ExtCtrls, DataModule, Vcl.ComCtrls, Vcl.Buttons,
  Vcl.Mask, Vcl.DBCtrls, Datasnap.Provider, Datasnap.DBClient;

type
  TCatProdF = class(TForm1)
    dsCatProd: TDataSource;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    Label2: TLabel;
    Label3: TLabel;
    dspCatProd: TDataSetProvider;
    cdsCatProd: TClientDataSet;
    cdsCatProdcategoriaprodutoid: TIntegerField;
    cdsCatProdds_categoria_produto: TWideStringField;
    procedure PesquisarCategoria (const pcriando : boolean);
    procedure FormShow(Sender: TObject);
    procedure btnPesquisaClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn2Click(Sender: TObject);
    procedure cdsCatProdNewRecord(DataSet: TDataSet);
  private
    { Private declarations }
  public

  function getSequence(const pCATEGORIA_PRODUTO_CATEGORIAPRODUTOID_SEQ: String): String;
    { Public declarations }
  end;

var
  CatProdF: TCatProdF;

implementation

function TCatProdF.getSequence (const pCATEGORIA_PRODUTO_CATEGORIAPRODUTOID_SEQ: String): String;
var
  cdsGenerica : TCatProdF;
begin
  Result := '';
  cdsGenerica := TCatProdF.Create(nil);
  try
    DataModule1.cdsGenerica.SetProvider(DataModule1.dspSequence);
    DataModule1.cdsGenerica.Close;
    DataModule1.cdsGenerica.CommandText :=
      'SELECT NEXTVAL(' + QuotedStr(pCATEGORIA_PRODUTO_CATEGORIAPRODUTOID_SEQ) + ') AS CODIGO';
    DataModule1.cdsGenerica.Open;
    Result := DataModule1.cdsGenerica.FieldByName('CODIGO').AsString;
  finally
    cdsGenerica.Close;
    FreeAndNil(cdsGenerica);
  end;
end;

{$R *.dfm}

procedure TCatProdF.BitBtn1Click(Sender: TObject);
begin
  inherited;
  if MessageDlg('Deseja Mesmo Excluir?',mtConfirmation, [mbYes,mbNo],0) = mrYes then
  begin
  cdsCatProd.Delete;
  cdsCatProd.ApplyUpdates(0);
  end
    else
    messageDLG('Você Preferiu Não Excluir',mtError,[mbOK],0);
end;

procedure TCatProdF.BitBtn2Click(Sender: TObject);
begin
  inherited;
  if MessageDlg('Sair do sistema?',mtConfirmation, [mbYes,mbNo],0) = mrYes then
  Close;
end;

procedure TCatProdF.btnEditarClick(Sender: TObject);
begin
  inherited;
  cdsCatProd.Edit;
end;

procedure TCatProdF.btnExcluirClick(Sender: TObject);
begin
  inherited;
  if MessageDlg('Deseja Mesmo Excluir?',mtConfirmation, [mbYes,mbNo],0) = mrYes then
  begin
  cdsCatProd.Delete;
  cdsCatProd.ApplyUpdates(0);

  PageControl.ActivePage := pgPesquisa;
  end
    else
    messageDLG('Você Preferiu Não Excluir',mtError,[mbOK],0);
end;

procedure TCatProdF.btnGravarClick(Sender: TObject);
begin
  inherited;
  cdsCatProd.Post;
  cdsCatProd.ApplyUpdates(0);
  PageControl.ActivePage := pgPesquisa;
end;

procedure TCatProdF.btnNovoClick(Sender: TObject);
begin
  inherited;
  PageControl.ActivePage := pgCadastro;
  cdsCatProd.Insert;
end;

procedure TCatProdF.btnPesquisaClick(Sender: TObject);
begin
  inherited;
  PesquisarCategoria(False);
end;

procedure TCatProdF.cdsCatProdNewRecord(DataSet: TDataSet);
begin
  inherited;
  cdsCatProdcategoriaprodutoid.AsInteger := StrToInt(getSequence('CATEGORIA_PRODUTO_CATEGORIAPRODUTOID_SEQ'));
end;

procedure TCatProdF.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := cafree;
end;

procedure TCatProdF.FormShow(Sender: TObject);
begin
  inherited;
  cdsCatProd.Open;
  PageControl.Activepage := pgPesquisa;
end;

procedure TCatProdF.PesquisarCategoria (const pcriando : boolean);
var
  AuxWhere : String;
begin
  //Esta procedure irá executar a pesquisa da Categoria
  if pCriando then
    AuxWhere := '1 = 2'
  else if CatProdF.edtPesquisa.Text = '' then
    AuxWhere := '1 = 1'
  else
    AuxWhere := 'CATEGORIAPRODUTOID = '+CatProdF.edtPesquisa.Text;

  cdsCatProd.Close;
  cdsCatProd.CommandText :=
             'SELECT '+
             'CATEGORIAPRODUTOID, '+
             'DS_CATEGORIA_PRODUTO 	'+
             'FROM CATEGORIA_PRODUTO ' +
             'WHERE '+AuxWhere+' '+
             'ORDER BY CATEGORIAPRODUTOID';
  cdsCatProd.Open;
end;


end.
