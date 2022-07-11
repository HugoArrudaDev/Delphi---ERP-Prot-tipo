unit RelClientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Datasnap.DBClient,
  Datasnap.Provider, Vcl.StdCtrls, Vcl.Buttons, ppProd, ppClass, ppReport,
  ppComm, ppRelatv, ppDB, ppDBPipe, DataModule, ppDBBDE, Vcl.Imaging.pngimage,
  ppCtrls, ppVar, ppPrnabl, ppBands, ppCache, ppDesignLayer, ppParameter;

type
  TRelClientesF = class(TForm)
    RelClientesBDEPipeline: TppBDEPipeline;
    RelClientesppReport: TppReport;
    BitBtn1: TBitBtn;
    dspRelClientes: TDataSetProvider;
    cdsRelClientes: TClientDataSet;
    dsRelClientes: TDataSource;
    cdsRelClientesclienteid: TIntegerField;
    cdsRelClientestipo_cliente: TWideStringField;
    cdsRelClientescpf_cnpj_cliente: TWideStringField;
    cdsRelClientesnome_cliente: TWideStringField;
    BitBtn2: TBitBtn;
    ppParameterList1: TppParameterList;
    ppDesignLayers1: TppDesignLayers;
    ppDesignLayer1: TppDesignLayer;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppTitleBand1: TppTitleBand;
    ppLabel1: TppLabel;
    ppLabel3: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppLabel2: TppLabel;
    ppLabel4: TppLabel;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppImage1: TppImage;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RelClientesF: TRelClientesF;

implementation

{$R *.dfm}

procedure TRelClientesF.BitBtn1Click(Sender: TObject);
begin
  RelClientesppReport.Print;
end;

procedure TRelClientesF.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

end.
