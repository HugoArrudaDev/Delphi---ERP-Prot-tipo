unit CadModelo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Menus, Vcl.StdCtrls,
  Vcl.ComCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids, Data.FMTBcd, DataModule, Data.SqlExpr,
  Vcl.Buttons;

type
  TForm1 = class(TForm)
    PageControl: TPageControl;
    pgPesquisa: TTabSheet;
    pgCadastro: TTabSheet;
    Panel1: TPanel;
    Label1: TLabel;
    edtPesquisa: TEdit;
    DBGrid1: TDBGrid;
    Panel2: TPanel;
    Panel3: TPanel;
    btnNovo: TBitBtn;
    btnPesquisa: TBitBtn;
    btnEditar: TBitBtn;
    btnGravar: TBitBtn;
    btnExcluir: TBitBtn;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.BitBtn2Click(Sender: TObject);
begin
    if MessageDlg('Deseja Mesmo Sair?',mtConfirmation, [mbYes,mbNo],0) = mrYes then
    begin
      Close;
    end
  else
    messageDLG('Você Preferiu Ficar No Sistema!',mtError,[mbOK],0);
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

end.   //SLA
