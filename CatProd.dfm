inherited CatProdF: TCatProdF
  Caption = 'CatProdF'
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl: TPageControl
    inherited pgPesquisa: TTabSheet
      inherited Panel1: TPanel
        inherited Label1: TLabel
          Width = 65
          Caption = 'Categoria ID:'
          ExplicitWidth = 65
        end
        inherited edtPesquisa: TEdit
          Left = 88
          ExplicitLeft = 88
        end
        inherited btnPesquisa: TBitBtn
          OnClick = btnPesquisaClick
        end
        inherited BitBtn1: TBitBtn
          OnClick = BitBtn1Click
        end
      end
      inherited DBGrid1: TDBGrid
        DataSource = dsCatProd
      end
      inherited Panel3: TPanel
        inherited btnNovo: TBitBtn
          OnClick = btnNovoClick
        end
      end
    end
    inherited pgCadastro: TTabSheet
      object Label2: TLabel [0]
        Left = 201
        Top = 139
        Width = 65
        Height = 13
        Anchors = [akLeft, akRight]
        Caption = 'Categoria ID:'
      end
      object Label3: TLabel [1]
        Left = 201
        Top = 195
        Width = 50
        Height = 13
        Anchors = [akLeft, akRight]
        Caption = 'Descri'#231#227'o:'
      end
      inherited Panel2: TPanel
        inherited btnEditar: TBitBtn
          OnClick = btnEditarClick
        end
        inherited btnGravar: TBitBtn
          OnClick = btnGravarClick
        end
        inherited btnExcluir: TBitBtn
          OnClick = btnExcluirClick
        end
      end
      object DBEdit1: TDBEdit
        Left = 272
        Top = 136
        Width = 121
        Height = 21
        Anchors = [akLeft, akRight]
        DataField = 'categoriaprodutoid'
        DataSource = dsCatProd
        ReadOnly = True
        TabOrder = 1
      end
      object DBEdit2: TDBEdit
        Left = 272
        Top = 192
        Width = 121
        Height = 21
        Anchors = [akLeft, akRight]
        DataField = 'ds_categoria_produto'
        DataSource = dsCatProd
        TabOrder = 2
      end
    end
  end
  object dsCatProd: TDataSource
    AutoEdit = False
    DataSet = cdsCatProd
    Left = 548
    Top = 32
  end
  object dspCatProd: TDataSetProvider
    DataSet = DataModule1.qryCatProd
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 496
    Top = 30
  end
  object cdsCatProd: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCatProd'
    OnNewRecord = cdsCatProdNewRecord
    Left = 542
    Top = 94
    object cdsCatProdcategoriaprodutoid: TIntegerField
      FieldName = 'categoriaprodutoid'
    end
    object cdsCatProdds_categoria_produto: TWideStringField
      FieldName = 'ds_categoria_produto'
      Size = 50
    end
  end
end
