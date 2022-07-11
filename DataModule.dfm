object DataModule1: TDataModule1
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 550
  Width = 770
  object SQLConnection1: TSQLConnection
    ConnectionName = 'Devart PostgreSQL'
    DriverName = 'DevartPostgreSQL'
    LoginPrompt = False
    Params.Strings = (
      'BlobSize=-1'
      'HostName=localhost'
      'DataBase=postgres'
      'SchemaName=public'
      'DriverName=DevartPostgreSQL'
      'User_Name=postgres'
      'Password=sntjnr1982'
      'FetchAll=True'
      'UseQuoteChar=False'
      'EnableBCD=True'
      'UuidWithBraces=True'
      'UnknownAsString=False'
      'IPVersion=IPv4'
      'UseUnicode=True'
      'Charset=')
    Connected = True
    Left = 72
    Top = 176
  end
  object qryCliente: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT * FROM CLIENTE')
    SQLConnection = SQLConnection1
    Left = 152
    Top = 176
    object qryClienteclienteid: TIntegerField
      FieldName = 'clienteid'
    end
    object qryClientetipo_cliente: TWideStringField
      FieldName = 'tipo_cliente'
      EditMask = 'F;1;_'
      Size = 1
    end
    object qryClientecpf_cnpj_cliente: TWideStringField
      FieldName = 'cpf_cnpj_cliente'
      Size = 18
    end
    object qryClientenome_cliente: TWideStringField
      FieldName = 'nome_cliente'
      Size = 100
    end
  end
  object qryProduto: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT * FROM PRODUTO')
    SQLConnection = SQLConnection1
    Left = 152
    Top = 240
    object qryProdutoprodutoid: TIntegerField
      FieldName = 'produtoid'
    end
    object qryProdutocategoriaprodutoid: TIntegerField
      FieldName = 'categoriaprodutoid'
    end
    object qryProdutods_produto: TWideStringField
      FieldName = 'ds_produto'
      Size = 50
    end
    object qryProdutoobs_produto: TWideStringField
      FieldName = 'obs_produto'
      Size = 300
    end
    object qryProdutovl_venda_produto: TFMTBCDField
      FieldName = 'vl_venda_produto'
      Precision = 15
      Size = 2
    end
    object qryProdutodt_cadastro_produto: TSQLTimeStampField
      FieldName = 'dt_cadastro_produto'
    end
    object qryProdutostatus_produto: TWideStringField
      FieldName = 'status_produto'
      Size = 10
    end
  end
  object qryOrcamento: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT '
      '  O.ORCAMENTOID,'
      '  O.DT_ORCAMENTO,'
      '  O.DT_VALIDADE_ORCAMENTO,'
      '  O.VL_TOTAL_ORCAMENTO,'
      '  C.CLIENTEID,'
      '  O.NOME_CLIENTE'
      'FROM ORCAMENTO O '
      'INNER JOIN CLIENTE C ON O.CLIENTEID = C.CLIENTEID'
      'ORDER BY O.ORCAMENTOID')
    SQLConnection = SQLConnection1
    Left = 152
    Top = 296
    object qryOrcamentoorcamentoid: TIntegerField
      FieldName = 'orcamentoid'
    end
    object qryOrcamentoclienteid: TIntegerField
      FieldName = 'clienteid'
    end
    object qryOrcamentodt_orcamento: TSQLTimeStampField
      FieldName = 'dt_orcamento'
    end
    object qryOrcamentodt_validade_orcamento: TSQLTimeStampField
      FieldName = 'dt_validade_orcamento'
    end
    object qryOrcamentovl_total_orcamento: TFMTBCDField
      FieldName = 'vl_total_orcamento'
      Precision = 15
      Size = 2
    end
    object qryOrcamentonome_cliente: TWideStringField
      FieldName = 'nome_cliente'
      Size = 100
    end
  end
  object qryCatProd: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT * FROM CATEGORIA_PRODUTO')
    SQLConnection = SQLConnection1
    Left = 152
    Top = 360
    object qryCatProdcategoriaprodutoid: TIntegerField
      FieldName = 'categoriaprodutoid'
    end
    object qryCatProdds_categoria_produto: TWideStringField
      FieldName = 'ds_categoria_produto'
      Size = 50
    end
  end
  object qryOrcItem: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT '
      ' *'
      'FROM ORCAMENTO_ITEM'
      'WHERE ORCAMENTO_ITEM.ORCAMENTOID = -1')
    SQLConnection = SQLConnection1
    Left = 152
    Top = 424
    object qryOrcItemorcamentoitemid: TIntegerField
      FieldName = 'orcamentoitemid'
    end
    object qryOrcItemorcamentoid: TIntegerField
      FieldName = 'orcamentoid'
    end
    object qryOrcItemprodutoid: TIntegerField
      FieldName = 'produtoid'
    end
    object qryOrcItemqt_produto: TFMTBCDField
      FieldName = 'qt_produto'
      Precision = 15
      Size = 2
    end
    object qryOrcItemvl_unitario: TFMTBCDField
      FieldName = 'vl_unitario'
      Precision = 15
      Size = 2
    end
    object qryOrcItemvl_total: TFMTBCDField
      FieldName = 'vl_total'
      Precision = 15
      Size = 2
    end
    object qryOrcItemdesc_prod: TWideStringField
      FieldName = 'desc_prod'
      Size = 50
    end
  end
  object qryGenerica: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection1
    Left = 264
    Top = 64
  end
  object dspGenerica: TDataSetProvider
    DataSet = qryGenerica
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 360
    Top = 64
  end
  object cdsGenerica: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspGenerica'
    Left = 440
    Top = 64
  end
  object dspSequence: TDataSetProvider
    DataSet = qryGenerica
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 608
    Top = 88
  end
  object qryOrcItemSegunda: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT * FROM ORCAMENTO_ITEM')
    SQLConnection = SQLConnection1
    Left = 368
    Top = 248
    object qryOrcItemSegundaorcamentoitemid: TIntegerField
      FieldName = 'orcamentoitemid'
    end
    object qryOrcItemSegundaorcamentoid: TIntegerField
      FieldName = 'orcamentoid'
    end
    object qryOrcItemSegundaprodutoid: TIntegerField
      FieldName = 'produtoid'
    end
    object qryOrcItemSegundaqt_produto: TFMTBCDField
      FieldName = 'qt_produto'
      Precision = 15
      Size = 2
    end
    object qryOrcItemSegundavl_unitario: TFMTBCDField
      FieldName = 'vl_unitario'
      Precision = 15
      Size = 2
    end
    object qryOrcItemSegundavl_total: TFMTBCDField
      FieldName = 'vl_total'
      Precision = 15
      Size = 2
    end
    object qryOrcItemSegundadesc_prod: TWideStringField
      FieldName = 'desc_prod'
      Size = 50
    end
  end
  object qryLogin: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT * FROM USUARIOS')
    SQLConnection = SQLConnection1
    Left = 296
    Top = 176
    object qryLoginid: TIntegerField
      FieldName = 'id'
    end
    object qryLoginusuario: TWideStringField
      FieldName = 'usuario'
      Size = 30
    end
    object qryLoginnome_completo: TWideStringField
      FieldName = 'nome_completo'
      Size = 60
    end
    object qryLoginsenha: TWideStringField
      FieldName = 'senha'
      Size = 50
    end
  end
end
