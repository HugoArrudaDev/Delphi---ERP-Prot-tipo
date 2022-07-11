inherited CadOrcamentoF: TCadOrcamentoF
  Caption = 'CadOrcamentoF'
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl: TPageControl
    ActivePage = pgCadastro
    inherited pgPesquisa: TTabSheet
      inherited Panel1: TPanel
        inherited Label1: TLabel
          Left = 11
          Width = 71
          Caption = 'Or'#231'amento ID:'
          ExplicitLeft = 11
          ExplicitWidth = 71
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
        DataSource = dsOrcamento
      end
      inherited Panel3: TPanel
        inherited btnNovo: TBitBtn
          OnClick = btnNovoClick
        end
      end
    end
    inherited pgCadastro: TTabSheet
      object Label2: TLabel [0]
        Left = 3
        Top = 115
        Width = 71
        Height = 13
        Anchors = [akLeft]
        Caption = 'Or'#231'amento ID:'
      end
      object Label3: TLabel [1]
        Left = 3
        Top = 187
        Width = 51
        Height = 13
        Anchors = [akLeft]
        Caption = 'Cliente ID:'
      end
      object Label4: TLabel [2]
        Left = 3
        Top = 259
        Width = 83
        Height = 13
        Anchors = [akLeft]
        Caption = 'Data de Emiss'#227'o:'
      end
      object Label5: TLabel [3]
        Left = 301
        Top = 115
        Width = 85
        Height = 13
        Anchors = [akRight]
        Caption = 'Data de Validade:'
      end
      object Label6: TLabel [4]
        Left = 309
        Top = 187
        Width = 28
        Height = 13
        Anchors = [akRight]
        Caption = 'Valor:'
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
        Left = 88
        Top = 112
        Width = 121
        Height = 21
        Anchors = [akLeft]
        DataField = 'orcamentoid'
        DataSource = dsOrcamento
        TabOrder = 1
      end
      object DBEdit2: TDBEdit
        Left = 88
        Top = 184
        Width = 121
        Height = 21
        Anchors = [akLeft]
        DataField = 'clienteid'
        DataSource = dsOrcamento
        TabOrder = 2
      end
      object DBEdit3: TDBEdit
        Left = 92
        Top = 256
        Width = 121
        Height = 21
        Anchors = [akLeft]
        DataField = 'dt_orcamento'
        DataSource = dsOrcamento
        TabOrder = 3
      end
      object DBEdit4: TDBEdit
        Left = 392
        Top = 112
        Width = 121
        Height = 21
        Anchors = [akRight]
        DataField = 'dt_validade_orcamento'
        DataSource = dsOrcamento
        TabOrder = 4
      end
      object DBEdit5: TDBEdit
        Left = 392
        Top = 184
        Width = 121
        Height = 21
        Anchors = [akRight]
        DataField = 'vl_total_orcamento'
        DataSource = dsOrcamento
        TabOrder = 5
      end
    end
  end
  object dsOrcamento: TDataSource
    AutoEdit = False
    DataSet = cdsOrcamento
    Left = 540
    Top = 40
  end
  object dspOrcamento: TDataSetProvider
    DataSet = DataModule1.qryOrcamento
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 544
    Top = 96
  end
  object cdsOrcamento: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspOrcamento'
    OnNewRecord = cdsOrcamentoNewRecord
    Left = 544
    Top = 168
    object cdsOrcamentoorcamentoid: TIntegerField
      FieldName = 'orcamentoid'
    end
    object cdsOrcamentoclienteid: TIntegerField
      FieldName = 'clienteid'
    end
    object cdsOrcamentodt_orcamento: TSQLTimeStampField
      FieldName = 'dt_orcamento'
    end
    object cdsOrcamentodt_validade_orcamento: TSQLTimeStampField
      FieldName = 'dt_validade_orcamento'
    end
    object cdsOrcamentovl_total_orcamento: TFMTBCDField
      FieldName = 'vl_total_orcamento'
      Precision = 15
      Size = 2
    end
    object cdsOrcamentonome_cliente: TWideStringField
      FieldName = 'nome_cliente'
      Size = 100
    end
  end
end
