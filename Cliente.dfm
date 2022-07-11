inherited CadClienteF: TCadClienteF
  Caption = 'CadClienteF'
  ClientHeight = 296
  OnShow = FormShow
  ExplicitHeight = 335
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl: TPageControl
    Height = 296
    ExplicitHeight = 296
    inherited pgPesquisa: TTabSheet
      ExplicitHeight = 268
      inherited Panel1: TPanel
        inherited btnPesquisa: TBitBtn
          OnClick = btnPesquisaClick
        end
        inherited BitBtn1: TBitBtn
          OnClick = BitBtn1Click
        end
      end
      inherited DBGrid1: TDBGrid
        Height = 148
        DataSource = dsCliente
      end
      inherited Panel3: TPanel
        Top = 213
        ExplicitTop = 213
        inherited btnNovo: TBitBtn
          OnClick = btnNovoClick
        end
      end
    end
    inherited pgCadastro: TTabSheet
      ExplicitHeight = 268
      object Label2: TLabel [0]
        Left = 32
        Top = 115
        Width = 51
        Height = 13
        Anchors = [akLeft]
        Caption = 'Cliente ID:'
      end
      object Label3: TLabel [1]
        Left = 32
        Top = 179
        Width = 75
        Height = 13
        Anchors = [akLeft]
        Caption = 'Tipo de Cliente:'
      end
      object Label4: TLabel [2]
        Left = 320
        Top = 115
        Width = 52
        Height = 13
        Anchors = [akRight]
        Caption = 'CPF/CNPJ:'
      end
      object Label5: TLabel [3]
        Left = 320
        Top = 179
        Width = 31
        Height = 13
        Anchors = [akRight]
        Caption = 'Nome:'
      end
      inherited Panel2: TPanel
        inherited btnEditar: TBitBtn
          Left = 112
          OnClick = btnEditarClick
          ExplicitLeft = 112
        end
        inherited btnGravar: TBitBtn
          Left = 240
          OnClick = btnGravarClick
          ExplicitLeft = 240
        end
        inherited btnExcluir: TBitBtn
          Left = 384
          OnClick = btnExcluirClick
          ExplicitLeft = 384
        end
      end
      object DBEdit1: TDBEdit
        Left = 112
        Top = 112
        Width = 121
        Height = 21
        Anchors = [akLeft]
        DataField = 'clienteid'
        DataSource = dsCliente
        ReadOnly = True
        TabOrder = 1
      end
      object DBEdit2: TDBEdit
        Left = 112
        Top = 176
        Width = 121
        Height = 21
        Anchors = [akLeft]
        DataField = 'tipo_cliente'
        DataSource = dsCliente
        TabOrder = 2
      end
      object DBEdit3: TDBEdit
        Left = 384
        Top = 112
        Width = 121
        Height = 21
        Anchors = [akRight]
        DataField = 'cpf_cnpj_cliente'
        DataSource = dsCliente
        TabOrder = 3
      end
      object DBEdit4: TDBEdit
        Left = 384
        Top = 176
        Width = 121
        Height = 21
        Anchors = [akRight]
        DataField = 'nome_cliente'
        DataSource = dsCliente
        TabOrder = 4
      end
    end
  end
  object dsCliente: TDataSource
    AutoEdit = False
    DataSet = cdsCliente
    Left = 548
    Top = 40
  end
  object cdsCliente: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCliente'
    OnNewRecord = cdsClienteNewRecord
    Left = 494
    Top = 40
    object cdsClienteclienteid: TIntegerField
      FieldName = 'clienteid'
    end
    object cdsClientetipo_cliente: TWideStringField
      FieldName = 'tipo_cliente'
      Size = 1
    end
    object cdsClientecpf_cnpj_cliente: TWideStringField
      FieldName = 'cpf_cnpj_cliente'
      Size = 18
    end
    object cdsClientenome_cliente: TWideStringField
      FieldName = 'nome_cliente'
      Size = 100
    end
  end
  object dspCliente: TDataSetProvider
    DataSet = DataModule1.qryCliente
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 552
    Top = 96
  end
end
