unit Produto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, CadModelo, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.ExtCtrls, DataModule,Vcl.ComCtrls, Vcl.Buttons,
  Vcl.Mask, Vcl.DBCtrls, Datasnap.DBClient, Datasnap.Provider;

type
  TCadProdutoF = class(TForm1)
    dsProduto: TDataSource;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    cdsProduto: TClientDataSet;
    cdsProdutoprodutoid: TIntegerField;
    cdsProdutocategoriaprodutoid: TIntegerField;
    cdsProdutods_produto: TWideStringField;
    cdsProdutoobs_produto: TWideStringField;
    cdsProdutovl_venda_produto: TFMTBCDField;
    cdsProdutodt_cadastro_produto: TSQLTimeStampField;
    cdsProdutostatus_produto: TWideStringField;
    dspProduto: TDataSetProvider;
    procedure PesquisarProduto (const pcriando : boolean);
    procedure btnPesquisaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn2Click(Sender: TObject);
    procedure cdsProdutoNewRecord(DataSet: TDataSet);
  private
    { Private declarations }
  public

  function getSequence(const pPRODUTO_PRODUTOID_SEQ: String): String;

    { Public declarations }
  end;

var
  CadProdutoF: TCadProdutoF;

implementation

function TCadProdutoF.getSequence(const pPRODUTO_PRODUTOID_SEQ: String): String;
var
  cdsGenerica : TCadProdutoF;
begin
  Result := '';
  cdsGenerica := TCadProdutoF.Create(nil);
  try
    DataModule1.cdsGenerica.SetProvider(DataModule1.dspSequence);
    DataModule1.cdsGenerica.Close;
    DataModule1.cdsGenerica.CommandText :=
      'SELECT NEXTVAL(' + QuotedStr(pPRODUTO_PRODUTOID_SEQ) + ') AS CODIGO';
    DataModule1.cdsGenerica.Open;
    Result := DataModule1.cdsGenerica.FieldByName('CODIGO').AsString;
  finally
    cdsGenerica.Close;
    FreeAndNil(cdsGenerica);
  end;
end;

{$R *.dfm}

procedure TCadProdutoF.BitBtn1Click(Sender: TObject);
begin
  inherited;
  if MessageDlg('Deseja Mesmo Excluir?',mtConfirmation, [mbYes,mbNo],0) = mrYes then
  begin
  cdsProduto.Delete;
  cdsProduto.ApplyUpdates(0);
  end
    else
    messageDLG('Você Preferiu Não Excluir',mtError,[mbOK],0);
end;

procedure TCadProdutoF.BitBtn2Click(Sender: TObject);
begin
  inherited;
  if MessageDlg('Sair do sistema?',mtConfirmation, [mbYes,mbNo],0) = mrYes then
  Close;
end;

procedure TCadProdutoF.btnEditarClick(Sender: TObject);
begin
  inherited;
  cdsProduto.Edit;
end;

procedure TCadProdutoF.btnExcluirClick(Sender: TObject);
begin
  inherited;
  if MessageDlg('Deseja Mesmo Excluir?',mtConfirmation, [mbYes,mbNo],0) = mrYes then
  begin
  cdsProduto.Delete;
  cdsProduto.ApplyUpdates(0);

  PageControl.ActivePage := pgPesquisa;
  end
    else
    messageDLG('Você Preferiu Não Excluir',mtError,[mbOK],0);
end;

procedure TCadProdutoF.btnGravarClick(Sender: TObject);
begin
  inherited;
  cdsProduto.Post;
  cdsProduto.ApplyUpdates(0);
  PageControl.ActivePage := pgPesquisa;
end;

procedure TCadProdutoF.btnNovoClick(Sender: TObject);
begin
  inherited;
  PageControl.ActivePage := pgCadastro;
  cdsProduto.Insert;
end;

procedure TCadProdutoF.btnPesquisaClick(Sender: TObject);
begin
  inherited;
  PesquisarProduto(False);
end;

procedure TCadProdutoF.cdsProdutoNewRecord(DataSet: TDataSet);
begin
  inherited;
  cdsProdutoprodutoid.AsInteger := StrToInt(getSequence('PRODUTO_PRODUTOID_SEQ'));
end;

procedure TCadProdutoF.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := cafree;
end;

procedure TCadProdutoF.FormShow(Sender: TObject);
begin
  inherited;
  cdsProduto.Open;
  PageControl.Activepage := pgPesquisa;
end;

procedure TCadProdutoF.PesquisarProduto (const pcriando : boolean);
var
  AuxWhere : String;
begin
  //Esta procedure irá executar a pesquisa da Categoria
  if pCriando then
    AuxWhere := '1 = 2'
  else if CadProdutoF.edtPesquisa.Text = '' then
    AuxWhere := '1 = 1'
  else
    AuxWhere := 'PRODUTOID = '+CadProdutoF.edtPesquisa.Text;

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
