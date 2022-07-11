unit OrcamentoItem;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, CadModelo, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, DataModule, Vcl.ComCtrls,
  Vcl.Mask, Vcl.DBCtrls, Datasnap.Provider, Datasnap.DBClient;

type
  TOrcamentoItemF = class(TForm1)
    dsOrcItem: TDataSource;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    dspOrcItem: TDataSetProvider;
    cdsOrcItem: TClientDataSet;
    cdsOrcItemorcamentoitemid: TIntegerField;
    cdsOrcItemorcamentoid: TIntegerField;
    cdsOrcItemprodutoid: TIntegerField;
    cdsOrcItemqt_produto: TFMTBCDField;
    cdsOrcItemvl_unitario: TFMTBCDField;
    cdsOrcItemvl_total: TFMTBCDField;
    procedure PesquisarItem (const pcriando : boolean);
    procedure btnPesquisaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cdsOrcItemNewRecord(DataSet: TDataSet);
  private
    { Private declarations }
  public

  function getSequence(const pORCAMENTO_ITEM_ORCAMENTOITEMID_SEQ: String): String;

    { Public declarations }
  end;

var
  OrcamentoItemF: TOrcamentoItemF;

implementation

function TOrcamentoItemF.getSequence(const pORCAMENTO_ITEM_ORCAMENTOITEMID_SEQ: String): String;
var
  cdsGenerica : TOrcamentoItemF;
begin
  Result := '';
  cdsGenerica := TOrcamentoItemF.Create(nil);
  try
    DataModule1.cdsGenerica.SetProvider(DataModule1.dspSequence);
    DataModule1.cdsGenerica.Close;
    DataModule1.cdsGenerica.CommandText :=
      'SELECT NEXTVAL(' + QuotedStr(pORCAMENTO_ITEM_ORCAMENTOITEMID_SEQ) + ') AS CODIGO';
    DataModule1.cdsGenerica.Open;
    Result := DataModule1.cdsGenerica.FieldByName('CODIGO').AsString;
  finally
    cdsGenerica.Close;
    FreeAndNil(cdsGenerica);
  end;
end;

{$R *.dfm}

procedure TOrcamentoItemF.BitBtn1Click(Sender: TObject);
begin
  inherited;
    if MessageDlg('Deseja Mesmo Excluir?',mtConfirmation, [mbYes,mbNo],0) = mrYes then
    begin
    cdsOrcItem.Delete;
    cdsOrcItem.ApplyUpdates(0);
    end
      else
    messageDLG('Você Preferiu Não Excluir',mtError,[mbOK],0);

end;

procedure TOrcamentoItemF.btnEditarClick(Sender: TObject);
begin
  inherited;
  cdsOrcItem.Edit;
end;

procedure TOrcamentoItemF.btnExcluirClick(Sender: TObject);
begin
  inherited;
    if MessageDlg('Deseja Mesmo Excluir?',mtConfirmation, [mbYes,mbNo],0) = mrYes then
      begin
      cdsOrcItem.Delete;
      cdsOrcItem.ApplyUpdates(0);


      PageControl.ActivePage := pgPesquisa;
    end
      else
    messageDLG('Você Preferiu Não Excluir',mtError,[mbOK],0);
end;

procedure TOrcamentoItemF.btnGravarClick(Sender: TObject);
begin
  inherited;
  cdsOrcItem.Post;
  cdsOrcItem.ApplyUpdates(0);
  PageControl.ActivePage := pgPesquisa;

end;

procedure TOrcamentoItemF.btnNovoClick(Sender: TObject);
begin
  inherited;
  PageControl.ActivePage := pgCadastro;
  cdsOrcItem.Insert;
end;

procedure TOrcamentoItemF.btnPesquisaClick(Sender: TObject);
begin
  inherited;
  PesquisarItem(False);
end;

procedure TOrcamentoItemF.cdsOrcItemNewRecord(DataSet: TDataSet);
begin
  inherited;
  cdsOrcItemorcamentoitemid.AsInteger := StrToInt(getSequence('ORCAMENTO_ITEM_ORCAMENTOITEMID_SEQ'));
end;

procedure TOrcamentoItemF.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := cafree;
end;

procedure TOrcamentoItemF.FormShow(Sender: TObject);
begin
  inherited;
  cdsOrcItem.Open;
  PageControl.Activepage := pgPesquisa;
end;

procedure TOrcamentoItemF.PesquisarItem (const pcriando : boolean);
var
  AuxWhere : String;
begin
  //Esta procedure irá executar a pesquisa da Categoria
  if pCriando then
    AuxWhere := '1 = 2'
  else if OrcamentoItemF.edtPesquisa.Text = '' then
    AuxWhere := '1 = 1'
  else
    AuxWhere := 'ORCAMENTOITEMID = '+OrcamentoItemF.edtPesquisa.Text;

  cdsOrcItem.Close;
  cdsOrcItem.CommandText :=
             'SELECT '+
             'ORCAMENTOITEMID, '+
             'ORCAMENTOID, '+
             'PRODUTOID, '+
             'QT_PRODUTO, '+
             'VL_UNITARIO, '+
             'VL_TOTAL '+
             'FROM ORCAMENTO_ITEM '+
             'WHERE '+AuxWhere+' '+
             'ORDER BY ORCAMENTOITEMID ';


  cdsOrcItem.Open;
end;

end.
