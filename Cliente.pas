unit Cliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, CadModelo, Data.DB, Data.FMTBcd,
  Data.SqlExpr, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.ExtCtrls, DataModule, Vcl.ComCtrls,
  Vcl.Buttons, Vcl.Mask, Vcl.DBCtrls, Datasnap.DBClient, Datasnap.Provider;

type
  TCadClienteF = class(TForm1)
    dsCliente: TDataSource;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    cdsCliente: TClientDataSet;
    cdsClienteclienteid: TIntegerField;
    cdsClientetipo_cliente: TWideStringField;
    cdsClientecpf_cnpj_cliente: TWideStringField;
    cdsClientenome_cliente: TWideStringField;
    dspCliente: TDataSetProvider;
    procedure PesquisarCliente(const pcriando : boolean);
    procedure FormShow(Sender: TObject);
    procedure btnPesquisaClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn2Click(Sender: TObject);
    procedure cdsClienteNewRecord(DataSet: TDataSet);
  private
    { Private declarations }
  public

  function getSequence(const pCLIENTE_CLIENTEID_SEQ: String): String;
    { Public declarations }
  end;

var
  CadClienteF: TCadClienteF;

implementation

function TCadClienteF.getSequence(const pCLIENTE_CLIENTEID_SEQ: String): String;
var
  cdsGenerica : TCadClienteF;
begin
  Result := '';
  cdsGenerica := TCadClienteF.Create(nil);
  try
    DataModule1.cdsGenerica.SetProvider(DataModule1.dspSequence);
    DataModule1.cdsGenerica.Close;
    DataModule1.cdsGenerica.CommandText :=
      'SELECT NEXTVAL(' + QuotedStr(pCLIENTE_CLIENTEID_SEQ) + ') AS CODIGO';
    DataModule1.cdsGenerica.Open;
    Result := DataModule1.cdsGenerica.FieldByName('CODIGO').AsString;
  finally
    cdsGenerica.Close;
    FreeAndNil(cdsGenerica);
  end;
end;


{$R *.dfm}

procedure TCadClienteF.BitBtn1Click(Sender: TObject);
begin
  inherited;
  if MessageDlg('Deseja Mesmo Excluir?',mtConfirmation, [mbYes,mbNo],0) = mrYes then
  begin
  cdsCliente.Delete;
  cdsCliente.ApplyUpdates(0);
  end
  else
    messageDLG('Você Preferiu Não Excluir',mtError,[mbOK],0);
end;

procedure TCadClienteF.BitBtn2Click(Sender: TObject);
begin

  if MessageDlg('Sair do sistema?',mtConfirmation, [mbYes,mbNo],0) = mrYes then
  Close;
end;

procedure TCadClienteF.btnEditarClick(Sender: TObject);
begin
  inherited;
  cdsCliente.Edit;
end;

procedure TCadClienteF.btnExcluirClick(Sender: TObject);
begin
  inherited;
  if MessageDlg('Deseja Mesmo Excluir?',mtConfirmation, [mbYes,mbNo],0) = mrYes then
  begin
  cdsCliente.Delete;
  cdsCliente.ApplyUpdates(0);

  PageControl.ActivePage := pgPesquisa;
  end
    else
    messageDLG('Você Preferiu Não Excluir',mtError,[mbOK],0);
end;

procedure TCadClienteF.btnGravarClick(Sender: TObject);
begin
  inherited;
  cdsCliente.Post;
  cdsCliente.ApplyUpdates(0);
  PageControl.ActivePage := pgPesquisa;
end;

procedure TCadClienteF.btnNovoClick(Sender: TObject);
begin
  inherited;
  PageControl.ActivePage := pgCadastro;
  cdsCliente.Insert;
end;

procedure TCadClienteF.btnPesquisaClick(Sender: TObject);
begin
  inherited;
  PesquisarCliente(False);
end;

procedure TCadClienteF.cdsClienteNewRecord(DataSet: TDataSet);
begin
  inherited;
  cdsClienteclienteid.AsInteger := StrToInt(getSequence('cliente_clienteid_seq'));
end;

procedure TCadClienteF.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := cafree;
end;

procedure TCadClienteF.FormShow(Sender: TObject);
begin
  inherited;
  cdsCliente.Open;
  PageControl.Activepage := pgPesquisa;
end;

procedure TCadClienteF.PesquisarCliente(const pcriando : boolean);
var
  AuxWhere : String;
begin
  //Esta procedure irá executar a pesquisa da Categoria
  if pCriando then
    AuxWhere := '1 = 2'
  else if CadClienteF.edtPesquisa.Text = '' then
    AuxWhere := '1 = 1'
  else
    AuxWhere := 'CLIENTEID = '+CadClienteF.edtPesquisa.Text;

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
