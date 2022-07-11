inherited OrcamentoItemF: TOrcamentoItemF
  Caption = 'OrcamentoItemF'
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl: TPageControl
    ActivePage = pgCadastro
    inherited pgPesquisa: TTabSheet
      inherited Panel1: TPanel
        inherited edtPesquisa: TEdit
          Left = 73
          ExplicitLeft = 73
        end
        inherited btnPesquisa: TBitBtn
          OnClick = btnPesquisaClick
        end
        inherited BitBtn1: TBitBtn
          OnClick = BitBtn1Click
        end
      end
      inherited DBGrid1: TDBGrid
        DataSource = dsOrcItem
      end
      inherited Panel3: TPanel
        inherited btnNovo: TBitBtn
          OnClick = btnNovoClick
        end
      end
    end
    inherited pgCadastro: TTabSheet
      object Label2: TLabel [0]
        Left = 18
        Top = 123
        Width = 96
        Height = 13
        Anchors = [akLeft]
        AutoSize = False
        Caption = 'Or'#231'amento Item ID:'
      end
      object Label3: TLabel [1]
        Left = 18
        Top = 203
        Width = 71
        Height = 13
        Anchors = [akLeft]
        AutoSize = False
        Caption = 'Or'#231'amento ID:'
      end
      object Label4: TLabel [2]
        Left = 18
        Top = 283
        Width = 56
        Height = 13
        Anchors = [akLeft]
        AutoSize = False
        Caption = 'Produto ID:'
      end
      object Label5: TLabel [3]
        Left = 326
        Top = 123
        Width = 60
        Height = 13
        Anchors = [akRight]
        AutoSize = False
        Caption = 'Quantidade:'
      end
      object Label6: TLabel [4]
        Left = 326
        Top = 203
        Width = 68
        Height = 13
        Anchors = [akRight]
        AutoSize = False
        Caption = 'Valor Unit'#225'rio:'
      end
      object Label7: TLabel [5]
        Left = 326
        Top = 283
        Width = 55
        Height = 13
        Anchors = [akRight]
        AutoSize = False
        Caption = 'Valor Total:'
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
        Left = 120
        Top = 120
        Width = 121
        Height = 21
        Anchors = [akLeft]
        AutoSize = False
        DataField = 'orcamentoitemid'
        DataSource = dsOrcItem
        TabOrder = 1
      end
      object DBEdit2: TDBEdit
        Left = 120
        Top = 200
        Width = 121
        Height = 21
        Anchors = [akLeft]
        AutoSize = False
        DataField = 'orcamentoid'
        DataSource = dsOrcItem
        TabOrder = 2
      end
      object DBEdit3: TDBEdit
        Left = 120
        Top = 280
        Width = 121
        Height = 21
        Anchors = [akLeft]
        AutoSize = False
        DataField = 'produtoid'
        DataSource = dsOrcItem
        TabOrder = 3
      end
      object DBEdit4: TDBEdit
        Left = 400
        Top = 120
        Width = 121
        Height = 21
        Anchors = [akRight]
        AutoSize = False
        DataField = 'qt_produto'
        DataSource = dsOrcItem
        TabOrder = 4
      end
      object DBEdit5: TDBEdit
        Left = 400
        Top = 200
        Width = 121
        Height = 21
        Anchors = [akRight]
        AutoSize = False
        DataField = 'vl_unitario'
        DataSource = dsOrcItem
        TabOrder = 5
      end
      object DBEdit6: TDBEdit
        Left = 400
        Top = 280
        Width = 121
        Height = 21
        Anchors = [akRight]
        AutoSize = False
        DataField = 'vl_total'
        DataSource = dsOrcItem
        TabOrder = 6
      end
    end
  end
  object dsOrcItem: TDataSource
    AutoEdit = False
    DataSet = cdsOrcItem
    Left = 484
    Top = 32
  end
  object dspOrcItem: TDataSetProvider
    DataSet = DataModule1.qryOrcItem
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 544
    Top = 30
  end
  object cdsOrcItem: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspOrcItem'
    OnNewRecord = cdsOrcItemNewRecord
    Left = 542
    Top = 94
    object cdsOrcItemorcamentoitemid: TIntegerField
      FieldName = 'orcamentoitemid'
    end
    object cdsOrcItemorcamentoid: TIntegerField
      FieldName = 'orcamentoid'
    end
    object cdsOrcItemprodutoid: TIntegerField
      FieldName = 'produtoid'
    end
    object cdsOrcItemqt_produto: TFMTBCDField
      FieldName = 'qt_produto'
      Precision = 15
      Size = 2
    end
    object cdsOrcItemvl_unitario: TFMTBCDField
      FieldName = 'vl_unitario'
      Precision = 15
      Size = 2
    end
    object cdsOrcItemvl_total: TFMTBCDField
      FieldName = 'vl_total'
      Precision = 15
      Size = 2
    end
  end
end
