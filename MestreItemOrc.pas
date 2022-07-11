unit MestreItemOrc;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Mask,
  Vcl.DBCtrls, Vcl.Buttons, Data.DB, Vcl.Grids, Vcl.DBGrids, Datasnap.DBClient,
  Datasnap.Provider, DataModule;

type
  TMestreItemOrcF = class(TForm)
    DBGrid1: TDBGrid;
    dspMestreOrc: TDataSetProvider;
    cdsMestreOrc: TClientDataSet;
    dsMestreOrc: TDataSource;
    cdsMestreOrcorcamentoid: TIntegerField;
    cdsMestreOrcclienteid: TIntegerField;
    cdsMestreOrcdt_orcamento: TSQLTimeStampField;
    cdsMestreOrcdt_validade_orcamento: TSQLTimeStampField;
    cdsMestreOrcvl_total_orcamento: TFMTBCDField;
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
    DBEdit5: TDBEdit;
    BitBtn1: TBitBtn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MestreItemOrcF: TMestreItemOrcF;

implementation

{$R *.dfm}

end.
