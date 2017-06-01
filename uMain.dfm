object fmMain: TfmMain
  Left = 369
  Top = 221
  BorderStyle = bsDialog
  Caption = 'Teste '
  ClientHeight = 421
  ClientWidth = 894
  Color = clWindow
  Ctl3D = False
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poMainFormCenter
  OnActivate = FormActivate
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 15
  object pnl_MainTop: TPanel
    Left = 0
    Top = 0
    Width = 894
    Height = 37
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 0
    object dbnProdutos: TDBNavigator
      Left = 2
      Top = 2
      Width = 240
      Height = 33
      DataSource = dsProdutos
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      Align = alLeft
      TabOrder = 0
    end
    object btnFechar: TBitBtn
      Left = 773
      Top = 2
      Width = 119
      Height = 33
      Align = alRight
      Caption = 'Fechar'
      TabOrder = 1
      OnClick = btnFecharClick
    end
    object btnIncluir: TBitBtn
      Left = 416
      Top = 2
      Width = 119
      Height = 33
      Align = alRight
      Caption = 'Incluir'
      TabOrder = 2
    end
    object btnAlterar: TBitBtn
      Left = 535
      Top = 2
      Width = 119
      Height = 33
      Align = alRight
      Caption = 'Alterar'
      TabOrder = 3
    end
    object btnExcluir: TBitBtn
      Left = 654
      Top = 2
      Width = 119
      Height = 33
      Align = alRight
      Caption = 'Excluir'
      TabOrder = 4
    end
  end
  object pnlMain: TPanel
    Left = 0
    Top = 77
    Width = 894
    Height = 344
    Align = alClient
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 1
    object dbgProdutos: TDBGrid
      Left = 2
      Top = 2
      Width = 890
      Height = 340
      Align = alClient
      DataSource = dsProdutos
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'codigo'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'descricao'
          Width = 450
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'preco'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'saldo'
          Visible = True
        end>
    end
  end
  object pnlFiltroPesquisa: TPanel
    Left = 0
    Top = 37
    Width = 894
    Height = 40
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 2
    object Label1: TLabel
      Left = 7
      Top = 12
      Width = 98
      Height = 15
      Caption = 'Consulta Produtos'
    end
    object cbProdutos: TComboBox
      Left = 115
      Top = 9
      Width = 194
      Height = 23
      TabOrder = 0
      Text = '<selecione o campo>'
    end
    object edPesquisa: TEdit
      Left = 315
      Top = 9
      Width = 199
      Height = 21
      TabOrder = 1
    end
    object btnPesquisar: TBitBtn
      Left = 520
      Top = 8
      Width = 119
      Height = 25
      Caption = 'Pesquisar'
      TabOrder = 2
      OnClick = btnPesquisarClick
    end
    object btnLimparCriterios: TBitBtn
      Left = 645
      Top = 8
      Width = 119
      Height = 25
      Caption = 'Limpar Filtro'
      TabOrder = 3
      OnClick = btnLimparCriteriosClick
    end
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=Teste'
      'User_Name=sa'
      'Password=gap123'
      'Server=localhost'
      'DriverID=MSSQL')
    Connected = True
    Left = 16
    Top = 128
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 48
    Top = 128
  end
  object FDPhysMSSQLDriverLink1: TFDPhysMSSQLDriverLink
    Left = 80
    Top = 128
  end
  object fdqProdutos: TFDQuery
    Active = True
    Connection = FDConnection1
    SQL.Strings = (
      'Select idproduto, codigo, descricao, preco, saldo'
      'from produto')
    Left = 109
    Top = 127
    object fdqProdutosidproduto: TLargeintField
      DisplayLabel = 'ID'
      FieldName = 'idproduto'
      Required = True
    end
    object fdqProdutoscodigo: TStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'codigo'
      Required = True
    end
    object fdqProdutosdescricao: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'descricao'
      Size = 100
    end
    object fdqProdutospreco: TFloatField
      DisplayLabel = 'Pre'#231'o Venda'
      FieldName = 'preco'
      DisplayFormat = '###,##0.00'
    end
    object fdqProdutossaldo: TFloatField
      DisplayLabel = 'Saldo Dispon'#237'vel'
      FieldName = 'saldo'
      DisplayFormat = '###,##0.00'
    end
  end
  object dsProdutos: TDataSource
    DataSet = fdqProdutos
    Left = 138
    Top = 128
  end
end
