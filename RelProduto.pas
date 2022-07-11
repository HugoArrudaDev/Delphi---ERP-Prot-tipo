unit RelProduto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Datasnap.DBClient,
  Datasnap.Provider, ppParameter, ppDesignLayer, ppBands, ppCtrls,
  Vcl.Imaging.pngimage, ppVar, ppPrnabl, ppClass, ppCache, ppProd, ppReport,
  ppDB, ppComm, DataModule, ppRelatv, ppDBPipe, ppDBBDE, Vcl.StdCtrls, Vcl.Buttons;

type
  TRelProdutoF = class(TForm)
    C: TBitBtn;
    BitBtn2: TBitBtn;
    RelProdutosBDEPipeline: TppBDEPipeline;
    RelProdutosppReport: TppReport;
    ppTitleBand1: TppTitleBand;
    ppLabel1: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppImage1: TppImage;
    ppHeaderBand1: TppHeaderBand;
    ppLabel3: TppLabel;
    ppLabel2: TppLabel;
    ppLabel4: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppFooterBand1: TppFooterBand;
    ppDesignLayers1: TppDesignLayers;
    ppDesignLayer1: TppDesignLayer;
    ppParameterList1: TppParameterList;
    dspRelProduto: TDataSetProvider;
    cdsRelProduto: TClientDataSet;
    dsRelProduto: TDataSource;
    cdsRelProdutoprodutoid: TIntegerField;
    cdsRelProdutocategoriaprodutoid: TIntegerField;
    cdsRelProdutods_produto: TWideStringField;
    cdsRelProdutoobs_produto: TWideStringField;
    cdsRelProdutovl_venda_produto: TFMTBCDField;
    cdsRelProdutodt_cadastro_produto: TSQLTimeStampField;
    cdsRelProdutostatus_produto: TWideStringField;
    ppLabel5: TppLabel;
    ppDBText4: TppDBText;
    ppLabel6: TppLabel;
    ppDBText5: TppDBText;
    procedure CClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RelProdutoF: TRelProdutoF;

implementation

{$R *.dfm}

procedure TRelProdutoF.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TRelProdutoF.CClick(Sender: TObject);
begin
  RelProdutosppReport.Print;
end;

procedure TRelProdutoF.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action := cafree;
end;

end.
