unit Orcamento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, CadModelo, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.ExtCtrls, DataModule, Vcl.ComCtrls, Vcl.Buttons,
  Vcl.Mask, Vcl.DBCtrls, Datasnap.Provider, Datasnap.DBClient;

type
  TCadOrcamentoF = class(TForm1)
    dsOrcamento: TDataSource;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    dspOrcamento: TDataSetProvider;
    cdsOrcamento: TClientDataSet;
    cdsOrcamentoorcamentoid: TIntegerField;
    cdsOrcamentoclienteid: TIntegerField;
    cdsOrcamentodt_orcamento: TSQLTimeStampField;
    cdsOrcamentodt_validade_orcamento: TSQLTimeStampField;
    cdsOrcamentovl_total_orcamento: TFMTBCDField;
    cdsOrcamentonome_cliente: TWideStringField;
    procedure PesquisarOrcamento (const pcriando : boolean);
    procedure FormShow(Sender: TObject);
    procedure btnPesquisaClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cdsOrcamentoNewRecord(DataSet: TDataSet);
  private
    { Private declarations }
  public
  function getSequence(const pORCAMENTO_ORCAMENTOID_SEQ: String): String;

    { Public declarations }
  end;

var
  CadOrcamentoF: TCadOrcamentoF;

implementation

function TCadOrcamentoF.getSequence(const pORCAMENTO_ORCAMENTOID_SEQ: String): String;
var
  cdsGenerica : TCadOrcamentoF;
begin
  Result := '';
  cdsGenerica := TCadOrcamentoF.Create(nil);
  try
    DataModule1.cdsGenerica.SetProvider(DataModule1.dspSequence);
    DataModule1.cdsGenerica.Close;
    DataModule1.cdsGenerica.CommandText :=
      'SELECT NEXTVAL(' + QuotedStr(pORCAMENTO_ORCAMENTOID_SEQ) + ') AS CODIGO';
    DataModule1.cdsGenerica.Open;
    Result := DataModule1.cdsGenerica.FieldByName('CODIGO').AsString;
  finally
    cdsGenerica.Close;
    FreeAndNil(cdsGenerica);
  end;
end;

{$R *.dfm}

procedure TCadOrcamentoF.BitBtn1Click(Sender: TObject);
begin
  inherited;
  if MessageDlg('Deseja Mesmo Excluir?',mtConfirmation, [mbYes,mbNo],0) = mrYes then
    begin
      cdsOrcamento.Delete;
      cdsOrcamento.ApplyUpdates(0);
    end
  else
    messageDLG('Você Preferiu Não Excluir',mtError,[mbOK],0);
end;

procedure TCadOrcamentoF.btnEditarClick(Sender: TObject);
begin
  inherited;
  cdsOrcamento.Edit;
end;

procedure TCadOrcamentoF.btnExcluirClick(Sender: TObject);
begin
  inherited;
  if MessageDlg('Deseja Mesmo Excluir?',mtConfirmation, [mbYes,mbNo],0) = mrYes then
    begin
      cdsOrcamento.Delete;
      cdsOrcamento.ApplyUpdates(0);

      PageControl.ActivePage := pgPesquisa;
    end
     else
     messageDLG('Você preferiu não excluir',mtError,[mbOK],0);
end;

procedure TCadOrcamentoF.btnGravarClick(Sender: TObject);
begin
  inherited;
  cdsOrcamento.Post;
  cdsOrcamento.ApplyUpdates(0);
  PageControl.ActivePage := pgPesquisa;
end;

procedure TCadOrcamentoF.btnNovoClick(Sender: TObject);
begin
  inherited;
  PageControl.ActivePage := pgCadastro;
  cdsOrcamento.Insert;
end;

procedure TCadOrcamentoF.btnPesquisaClick(Sender: TObject);
begin
  inherited;
  PesquisarOrcamento(False);
end;

procedure TCadOrcamentoF.cdsOrcamentoNewRecord(DataSet: TDataSet);
begin
  inherited;
  cdsOrcamentoorcamentoid.AsInteger := StrToInt(getSequence('ORCAMENTO_ORCAMENTOID_SEQ'));
end;

procedure TCadOrcamentoF.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := cafree;
end;

procedure TCadOrcamentoF.FormShow(Sender: TObject);
begin
  inherited;
  cdsOrcamento.Open;
  PageControl.Activepage := pgPesquisa;
end;

procedure TCadOrcamentoF.PesquisarOrcamento (const pcriando : boolean);
var
  AuxWhere : String;
begin
  //Esta procedure irá executar a pesquisa da Categoria
  if pCriando then
    AuxWhere := '1 = 2'
  else if CadOrcamentoF.edtPesquisa.Text = '' then
    AuxWhere := '1 = 1'
  else
    AuxWhere := 'ORCAMENTOID = '+CadOrcamentoF.edtPesquisa.Text;

  cdsOrcamento.Close;
  cdsOrcamento.CommandText :=
              'SELECT ' +
              'ORCAMENTOID, ' +
              'CLIENTEID, ' +
              'DT_ORCAMENTO, ' +
              'DT_VALIDADE_ORCAMENTO, ' +
              'VL_TOTAL_ORCAMENTO ' +
              'FROM ORCAMENTO ' +
              'WHERE '+AuxWhere+' '+
              'ORDER BY ORCAMENTOID';
  cdsOrcamento.Open;
end;

end.
