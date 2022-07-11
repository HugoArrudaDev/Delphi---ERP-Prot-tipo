unit RelOrcamento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, ppParameter,
  ppDesignLayer, ppBands, ppCtrls, Vcl.Imaging.pngimage, ppVar, ppPrnabl,
  ppClass, ppCache, ppProd, ppReport, ppDB, ppComm, ppRelatv, ppDBPipe, ppDBBDE,
  Data.DB, Datasnap.Provider, DataModule, Datasnap.DBClient;

type
  TRelOrcamentoF = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    cdsRelOrc: TClientDataSet;
    dspRelOrc: TDataSetProvider;
    dsRelOrc: TDataSource;
    RelOrcamentoBDEPipeline: TppBDEPipeline;
    RelOrcamentoppReport: TppReport;
    ppTitleBand1: TppTitleBand;
    ppLabel1: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppImage1: TppImage;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppDesignLayers1: TppDesignLayers;
    ppDesignLayer1: TppDesignLayer;
    ppParameterList1: TppParameterList;
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
    cdsRelOrcorcamentoid: TIntegerField;
    cdsRelOrcclienteid: TIntegerField;
    cdsRelOrcdt_orcamento: TSQLTimeStampField;
    cdsRelOrcdt_validade_orcamento: TSQLTimeStampField;
    cdsRelOrcvl_total_orcamento: TFMTBCDField;
    cdsRelOrcnome_cliente: TWideStringField;
    ppLine1: TppLine;
    ppLabel6: TppLabel;
    ppDBText6: TppDBText;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RelOrcamentoF: TRelOrcamentoF;

implementation

{$R *.dfm}

procedure TRelOrcamentoF.BitBtn1Click(Sender: TObject);
begin
  RelOrcamentoppReport.Print;
end;

procedure TRelOrcamentoF.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TRelOrcamentoF.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   action := cafree;
end;

procedure TRelOrcamentoF.FormShow(Sender: TObject);
begin
  cdsRelOrc.Open;
end;

end.
