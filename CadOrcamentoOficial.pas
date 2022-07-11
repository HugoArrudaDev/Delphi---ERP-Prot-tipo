unit CadOrcamentoOficial;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Data.DB, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.Mask, Vcl.DBCtrls, Vcl.ExtCtrls, Datasnap.DBClient,
  Datasnap.Provider, Vcl.Grids, DataModule, OrcamentoItem, Orcamento, Cliente, PesquisaMestre, Vcl.DBGrids,
  ppComm, ppRelatv, ppDB, ppDBPipe, ppDBBDE, ppParameter, ppDesignLayer,
  ppBands, ppCtrls, Vcl.Imaging.pngimage, ppVar, ppPrnabl, ppClass, ppCache,
  ppProd, ppReport;

type
  TCadOrcamentoFF = class(TForm)
    PageControl1: TPageControl;
    pgPesquisa: TTabSheet;
    pgCadastro: TTabSheet;
    dspMestreOrc: TDataSetProvider;
    cdsMestreOrc: TClientDataSet;
    cdsMestreOrcorcamentoid: TIntegerField;
    cdsMestreOrcclienteid: TIntegerField;
    cdsMestreOrcdt_orcamento: TSQLTimeStampField;
    cdsMestreOrcdt_validade_orcamento: TSQLTimeStampField;
    cdsMestreOrcvl_total_orcamento: TFMTBCDField;
    dsMestreOrc: TDataSource;
    cdsMestreItem: TClientDataSet;
    dspMestreItem: TDataSetProvider;
    dsMestreItem: TDataSource;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Id: TLabel;
    Label5: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    btnAdicionar: TBitBtn;
    btnExcluir: TBitBtn;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    BitBtn1: TBitBtn;
    Label4: TLabel;
    edtPesquisa: TEdit;
    btnPesquisa: TBitBtn;
    BitBtn2: TBitBtn;
    Panel2: TPanel;
    Label6: TLabel;
    edtPesquisaOrc: TEdit;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    DBGrid2: TDBGrid;
    Panel3: TPanel;
    btnNovo: TBitBtn;
    BitBtn5: TBitBtn;
    cdsMestreItemorcamentoitemid: TIntegerField;
    cdsMestreItemorcamentoid: TIntegerField;
    cdsMestreItemprodutoid: TIntegerField;
    cdsMestreItemqt_produto: TFMTBCDField;
    cdsMestreItemvl_unitario: TFMTBCDField;
    cdsMestreItemvl_total: TFMTBCDField;
    Nome: TDBText;
    dsCliente: TDataSource;
    Panel4: TPanel;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    cdsMestreItemdesc_prod: TWideStringField;
    DBGrid1: TDBGrid;
    cdsMestreOrcnome_cliente: TWideStringField;
    C: TBitBtn;
    ItemBDEPipeline1: TppBDEPipeline;
    RelOrcamentoppReport: TppReport;
    ppTitleBand1: TppTitleBand;
    ppLabel1: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppImage1: TppImage;
    ppHeaderBand1: TppHeaderBand;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppShape1: TppShape;
    ppLabel5: TppLabel;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLine1: TppLine;
    ppDetailBand1: TppDetailBand;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppFooterBand1: TppFooterBand;
    ppDesignLayers1: TppDesignLayers;
    ppDesignLayer1: TppDesignLayer;
    ppParameterList1: TppParameterList;
    OrcamentoBDEPipeline1: TppBDEPipeline;
    procedure btnNovoClick(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure PesquisarOrcamento (const pcriando : boolean);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure DBGrid2DblClick(Sender: TObject);
    procedure btnAdicionarClick(Sender: TObject);
    procedure cdsMestreOrcNewRecord(DataSet: TDataSet);
    procedure SomaItens;
    procedure cdsMestreItemBeforeOpen(DataSet: TDataSet);
    procedure cdsMestreItemAfterDelete(DataSet: TDataSet);
    procedure CClick(Sender: TObject);
    procedure AbreOrcItens(orcamentoid : Integer);
    procedure PageControl1Change(Sender: TObject);
  private
    { Private declarations }
  public
  function GetProximoCodigo(const pNomeChave, pNomeTabela: String): String;

  function getSequence(const pORCAMENTO_ORCAMENTOID_SEQ: String): String;
    { Public declarations }
  end;

var
  CadOrcamentoFF: TCadOrcamentoFF;

  iditem : Integer;

implementation

Uses OrcamentoItemAdd;

function TCadOrcamentoFF.getSequence(const pORCAMENTO_ORCAMENTOID_SEQ: String): String;
var
  cdsGenerica : TCadOrcamentoFF;
begin
  Result := '';
  cdsGenerica := TCadOrcamentoFF.Create(nil);
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

function TCadOrcamentoFF.GetProximoCodigo(const pNomeChave, pNomeTabela: String): String;
var
  qryDinamico : TClientDataSet;
begin
  qryDinamico := TClientDataSet.Create(nil);
  try
    qryDinamico.SetProvider(DataModule1.dspGenerica);

    qryDinamico.CommandText :=
      'SELECT MAX('+pNomeChave+') + 1 PROXCODIGO '+
      'FROM ' + pNomeTabela;
    qryDinamico.Open;

    Result := qryDinamico.FieldByName('PROXCODIGO').AsString;
  finally
    qryDinamico.Close;
    FreeAndNil(qryDinamico);
  end;
end;

{$R *.dfm}

procedure TCadOrcamentoFF.BitBtn1Click(Sender: TObject);
begin
  if not (cdsMestreOrc.State in [dsEdit]) then
  cdsMestreOrc.Edit;
  PesquisaMestreF := TPesquisaMestreF.Create(Self);
  PesquisaMestreF.ShowModal;
end;

procedure TCadOrcamentoFF.BitBtn3Click(Sender: TObject);
begin
  PesquisarOrcamento(False);
end;

procedure TCadOrcamentoFF.BitBtn4Click(Sender: TObject);
begin
  if MessageDlg('Deseja Mesmo Excluir?',mtConfirmation, [mbYes,mbNo],0) = mrYes then
    begin
      cdsMestreOrc.Delete;
      cdsMestreOrc.ApplyUpdates(0);
    end
  else
    messageDLG('Você Preferiu Não Excluir',mtError,[mbOK],0);
end;

procedure TCadOrcamentoFF.BitBtn5Click(Sender: TObject);
begin
    if MessageDlg('Deseja Mesmo Sair?',mtConfirmation, [mbYes,mbNo],0) = mrYes then
    begin
      Close;
    end
  else
    messageDLG('Você Preferiu Ficar No Sistema!',mtError,[mbOK],0);
end;

procedure TCadOrcamentoFF.BitBtn6Click(Sender: TObject);
begin
 cdsMestreOrc.Post;
 cdsMestreOrc.ApplyUpdates(0);
 cdsMestreItem.ApplyUpdates(0);

 PageControl1.ActivePage := pgPesquisa;
end;

procedure TCadOrcamentoFF.BitBtn7Click(Sender: TObject);
begin
    if MessageDlg('Deseja Mesmo Sair?',mtConfirmation, [mbYes,mbNo],0) = mrYes then
    begin
      Close;
    end
  else
    messageDLG('Você Preferiu Ficar No Sistema!',mtError,[mbOK],0);
end;

procedure TCadOrcamentoFF.btnAdicionarClick(Sender: TObject);
begin
  cdsMestreItem.Open;
  cdsMestreItem.Insert;
  OrcamentoItemAddF := TOrcamentoItemAddF.Create(Self);
  OrcamentoItemAddF.ShowModal;

end;

procedure TCadOrcamentoFF.btnExcluirClick(Sender: TObject);
begin
  if MessageDlg('Deseja Mesmo Excluir?',mtConfirmation, [mbYes,mbNo],0) = mrYes then
    begin
      cdsMestreItem.Delete;
      SomaItens;
      cdsMestreItem.ApplyUpdates(0);
    end
  else
    messageDLG('Você Preferiu Não Excluir',mtError,[mbOK],0);

end;

procedure TCadOrcamentoFF.btnNovoClick(Sender: TObject);
begin
  cdsMestreOrc.Insert;
  cdsMestreItem.Close;
  PageControl1.ActivePage := pgCadastro;

end;

procedure TCadOrcamentoFF.CClick(Sender: TObject);
begin
  var
  dini, dfin : Tdate;
begin
//me contrata ae po ;-;
  cdsMestreItem.Close;
  cdsMestreItem.CommandText :=
    'SELECT ' +
      'ORCAMENTOITEMID, ' +
      'ORCAMENTOID, ' +
      'PRODUTOID, ' +
      'DESC_PROD, ' +
      'QT_PRODUTO, ' +
      'VL_UNITARIO, ' +
      'VL_TOTAL ' +
      'FROM ORCAMENTO_ITEM ' +
      'WHERE ORCAMENTOID = ' + cdsMestreOrcorcamentoid.AsString + ' ' +
      'ORDER BY ORCAMENTOID';
  cdsMestreItem.Open;
  RelOrcamentoppReport.print;

end;
end;

procedure TCadOrcamentoFF.cdsMestreItemAfterDelete(DataSet: TDataSet);
begin
  SomaItens;
end;

procedure TCadOrcamentoFF.cdsMestreItemBeforeOpen(DataSet: TDataSet);
begin
  cdsMestreItem.CommandText :=
    'SELECT * FROM ORCAMENTO_ITEM WHERE ORCAMENTOID = '+ cdsMestreOrcorcamentoid.AsString;
end;

procedure TCadOrcamentoFF.cdsMestreOrcNewRecord(DataSet: TDataSet);
begin
  cdsMestreOrcorcamentoid.AsInteger := StrToInt(getSequence('orcamento_orcamentoid_seq'));
  cdsMestreOrcdt_orcamento.AsDateTime := StrToDate(formatdatetime('dd/mm/yyyy',now));
  cdsMestreOrcdt_validade_orcamento.AsDateTime := StrToDate(formatdatetime('dd/mm/yyyy',now +15));
end;

procedure TCadOrcamentoFF.DBGrid2DblClick(Sender: TObject);
begin
  AbreOrcItens(cdsMestreOrcorcamentoid.AsInteger);
  //cdsMestreItem.Open;
  PageControl1.Activepage := pgCadastro;
end;

procedure TCadOrcamentoFF.FormShow(Sender: TObject);
begin
  cdsMestreOrc.Open;
  PageControl1.ActivePage := pgPesquisa;
end;

procedure TCadOrcamentoFF.PageControl1Change(Sender: TObject);
begin
  AbreOrcItens(cdsMestreOrcorcamentoid.AsInteger);
end;

procedure TCadOrcamentoFF.PesquisarOrcamento (const pcriando : boolean);
var
  AuxWhere : String;
begin
  //Esta procedure irá executar a pesquisa da Categoria
  if pCriando then
    AuxWhere := '1 = 2'
  else if CadOrcamentoFF.edtPesquisaOrc.Text = '' then
    AuxWhere := '1 = 1'
  else
    AuxWhere := 'ORCAMENTOID = '+CadOrcamentoFF.edtPesquisaOrc.Text;

  cdsMestreOrc.Close;
  cdsMestreOrc.CommandText :=
      'SELECT '+
      'O.ORCAMENTOID, '+
      'O.DT_ORCAMENTO, '+
      'O.DT_VALIDADE_ORCAMENTO, '+
      'O.VL_TOTAL_ORCAMENTO, '+
      'C.CLIENTEID, '+
      'O.NOME_CLIENTE '+
      'FROM ORCAMENTO O '+
      'INNER JOIN CLIENTE C ON O.CLIENTEID = C.CLIENTEID '+
      'WHERE '+AuxWhere+' '+
      'ORDER BY ORCAMENTOID';
        cdsMestreOrc.Open;
end;

procedure TCadOrcamentoFF.SomaItens;
begin
  //Vai pro Primeiro
  if not (cdsMestreOrc.State in [dsEdit, dsInsert]) then
    cdsMestreOrc.Edit;

  if not (cdsMestreItem.State in [dsEdit, dsInsert]) then
    cdsMestreItem.Edit;

  cdsMestreItem.First;
  cdsMestreOrcvl_total_orcamento.AsFloat := 0;
  while not cdsMestreItem.Eof do
  begin
    cdsMestreOrcvl_total_orcamento.AsFloat := cdsMestreOrcvl_total_orcamento.AsFloat + cdsMestreItemvl_total.AsFloat;
    cdsMestreItem.next;
  end;
end;

procedure TCadOrcamentoFF.AbreOrcItens(orcamentoid : Integer);
begin
  cdsMestreItem.Close;
  cdsMestreItem.CommandText :=
                  'SELECT '+
                  'ORCAMENTOITEMID, '+
                  'ORCAMENTOID, '+
                  'PRODUTOID, '+
                  'DESC_PROD, '+
                  'QT_PRODUTO, '+
                  'VL_UNITARIO, '+
                  'VL_TOTAL '+
                  'FROM ORCAMENTO_ITEM ' +
                  'WHERE ORCAMENTOID = '+ inttostr(orcamentoid) + ' ' +
                  'ORDER BY ORCAMENTOID';

   cdsMestreItem.Open;
end;


end.
