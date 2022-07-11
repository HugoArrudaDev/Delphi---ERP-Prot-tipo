inherited CadProdutoF: TCadProdutoF
  Caption = 'CadProdutoF'
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl: TPageControl
    inherited pgPesquisa: TTabSheet
      inherited Panel1: TPanel
        inherited Label1: TLabel
          Width = 56
          Caption = 'Produto ID:'
          ExplicitWidth = 56
        end
        inherited btnPesquisa: TBitBtn
          OnClick = btnPesquisaClick
        end
        inherited BitBtn1: TBitBtn
          OnClick = BitBtn1Click
        end
      end
      inherited DBGrid1: TDBGrid
        DataSource = dsProduto
      end
      inherited Panel3: TPanel
        inherited btnNovo: TBitBtn
          OnClick = btnNovoClick
        end
      end
    end
    inherited pgCadastro: TTabSheet
      object Label2: TLabel [0]
        Left = 48
        Top = 107
        Width = 56
        Height = 13
        Anchors = [akLeft]
        Caption = 'Produto ID:'
      end
      object Label3: TLabel [1]
        Left = 48
        Top = 155
        Width = 65
        Height = 13
        Anchors = [akLeft]
        Caption = 'Categoria ID:'
      end
      object Label4: TLabel [2]
        Left = 48
        Top = 203
        Width = 50
        Height = 13
        Anchors = [akLeft]
        Caption = 'Descri'#231#227'o:'
      end
      object Label5: TLabel [3]
        Left = 48
        Top = 251
        Width = 62
        Height = 13
        Anchors = [akLeft]
        Caption = 'Observa'#231#227'o:'
      end
      object label6: TLabel [4]
        Left = 305
        Top = 104
        Width = 76
        Height = 13
        Anchors = [akRight]
        Caption = 'Valor de Venda:'
      end
      object Label7: TLabel [5]
        Left = 305
        Top = 155
        Width = 89
        Height = 13
        Anchors = [akRight]
        Caption = 'Data do Cadastro:'
      end
      object Label8: TLabel [6]
        Left = 303
        Top = 203
        Width = 91
        Height = 13
        Anchors = [akRight]
        Caption = 'Status do Produto:'
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
        Left = 128
        Top = 104
        Width = 121
        Height = 21
        Anchors = [akLeft]
        DataField = 'produtoid'
        DataSource = dsProduto
        TabOrder = 1
      end
      object DBEdit2: TDBEdit
        Left = 128
        Top = 152
        Width = 121
        Height = 21
        Anchors = [akLeft]
        DataField = 'categoriaprodutoid'
        DataSource = dsProduto
        TabOrder = 2
      end
      object DBEdit3: TDBEdit
        Left = 128
        Top = 200
        Width = 121
        Height = 21
        Anchors = [akLeft]
        DataField = 'ds_produto'
        DataSource = dsProduto
        TabOrder = 3
      end
      object DBEdit4: TDBEdit
        Left = 128
        Top = 248
        Width = 121
        Height = 21
        Anchors = [akLeft]
        DataField = 'obs_produto'
        DataSource = dsProduto
        TabOrder = 4
      end
      object DBEdit5: TDBEdit
        Left = 400
        Top = 104
        Width = 121
        Height = 21
        Anchors = [akRight]
        DataField = 'vl_venda_produto'
        DataSource = dsProduto
        TabOrder = 5
      end
      object DBEdit6: TDBEdit
        Left = 400
        Top = 152
        Width = 121
        Height = 21
        Anchors = [akRight]
        DataField = 'dt_cadastro_produto'
        DataSource = dsProduto
        TabOrder = 6
      end
      object DBEdit7: TDBEdit
        Left = 400
        Top = 200
        Width = 121
        Height = 21
        Anchors = [akRight]
        DataField = 'status_produto'
        DataSource = dsProduto
        TabOrder = 7
      end
    end
  end
  object dsProduto: TDataSource
    AutoEdit = False
    DataSet = cdsProduto
    Left = 556
    Top = 32
  end
  object cdsProduto: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspProduto'
    OnNewRecord = cdsProdutoNewRecord
    Left = 502
    Top = 32
    object cdsProdutoprodutoid: TIntegerField
      FieldName = 'produtoid'
    end
    object cdsProdutocategoriaprodutoid: TIntegerField
      FieldName = 'categoriaprodutoid'
    end
    object cdsProdutods_produto: TWideStringField
      FieldName = 'ds_produto'
      Size = 50
    end
    object cdsProdutoobs_produto: TWideStringField
      FieldName = 'obs_produto'
      Size = 300
    end
    object cdsProdutovl_venda_produto: TFMTBCDField
      FieldName = 'vl_venda_produto'
      Precision = 15
      Size = 2
    end
    object cdsProdutodt_cadastro_produto: TSQLTimeStampField
      FieldName = 'dt_cadastro_produto'
    end
    object cdsProdutostatus_produto: TWideStringField
      FieldName = 'status_produto'
      Size = 10
    end
  end
  object dspProduto: TDataSetProvider
    DataSet = DataModule1.qryProduto
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 552
    Top = 96
  end
end
