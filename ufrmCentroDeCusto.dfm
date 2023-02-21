object frmCentroDeCusto: TfrmCentroDeCusto
  Left = 0
  Top = 0
  Caption = 'Cadastro  Centro de Custo'
  ClientHeight = 434
  ClientWidth = 750
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Visible = True
  WindowState = wsMaximized
  OnActivate = FormActivate
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object cxGridOperador: TcxGrid
    Left = 0
    Top = 0
    Width = 750
    Height = 434
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    RootLevelOptions.DetailTabsPosition = dtpTop
    object cxTableViewOperador: TcxGridDBTableView
      Navigator.Buttons.ConfirmDelete = True
      Navigator.Buttons.CustomButtons = <>
      Navigator.Buttons.First.Hint = 'Primeiro'
      Navigator.Buttons.PriorPage.Visible = False
      Navigator.Buttons.Prior.Hint = 'Anterior'
      Navigator.Buttons.Next.Hint = 'Pr'#243'ximo'
      Navigator.Buttons.NextPage.Visible = False
      Navigator.Buttons.Last.Hint = #218'ltimo'
      Navigator.Buttons.Insert.Hint = 'Inserir registro'
      Navigator.Buttons.Append.Visible = False
      Navigator.Buttons.Delete.Hint = 'Excluir'
      Navigator.Buttons.Edit.Hint = 'Alterar'
      Navigator.Buttons.Post.Hint = 'Salvar'
      Navigator.Buttons.Cancel.Hint = 'Cancelar'
      Navigator.Buttons.Refresh.Hint = 'Atualizar'
      Navigator.Buttons.SaveBookmark.Visible = False
      Navigator.Buttons.GotoBookmark.Visible = False
      Navigator.Buttons.Filter.Hint = 'Filtro'
      Navigator.InfoPanel.DisplayMask = '[RecordIndex] de [RecordCount]'
      Navigator.InfoPanel.Visible = True
      Navigator.Visible = True
      DataController.DataSource = dsCentroCusto
      DataController.Filter.Active = True
      DataController.KeyFieldNames = 'ID_CentrodeCusto'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      DateTimeHandling.IgnoreTimeForFiltering = True
      DateTimeHandling.MonthFormat = 'mmm'
      DateTimeHandling.YearFormat = 'yy'
      DateTimeHandling.DateFormat = 'dd/mm/yyyy'
      DateTimeHandling.HourFormat = 'hh:nn:ss'
      FilterRow.InfoText = 'Clique aqui para definir um filtro'
      FilterRow.Visible = True
      NewItemRow.InfoText = 'Clique aqui para adicionar um registro novo'
      NewItemRow.Visible = True
      OptionsCustomize.ColumnsQuickCustomization = True
      OptionsData.Appending = True
      OptionsSelection.InvertSelect = False
      OptionsSelection.MultiSelect = True
      OptionsSelection.CellMultiSelect = True
      OptionsView.NoDataToDisplayInfoText = '<Sem dados para exibi'#231#227'o>'
      OptionsView.Indicator = True
      object cxTableViewOperadorID_CentrodeCusto: TcxGridDBColumn
        Caption = 'ID'
        DataBinding.FieldName = 'ID_CentrodeCusto'
      end
      object cxTableViewOperadorCentroDeCusto: TcxGridDBColumn
        Caption = 'Centro de Custo'
        DataBinding.FieldName = 'CentroDeCusto'
        Width = 200
      end
      object cxTableViewOperadorCategoria: TcxGridDBColumn
        DataBinding.FieldName = 'Categoria'
        Width = 250
      end
      object cxTableViewOperadorTipo: TcxGridDBColumn
        Caption = 'Tipo'
        DataBinding.FieldName = 'TIPO'
        PropertiesClassName = 'TcxComboBoxProperties'
        Properties.Items.Strings = (
          'EXPENSE'
          'INCOME')
        Width = 108
      end
    end
    object cxGridLevelOperador: TcxGridLevel
      Caption = 'Cadastro Centro de Custo'
      GridView = cxTableViewOperador
    end
  end
  object sqlCentroCusto: TFDQuery
    BeforePost = sqlCentroCustoBeforePost
    Connection = Dados.FDConnection
    SQL.Strings = (
      'select * from CentrodeCusto'
      'Order by CENTRODECUSTO')
    Left = 184
    Top = 120
    object sqlCentroCustoID_CentrodeCusto: TFDAutoIncField
      FieldName = 'ID_CentrodeCusto'
      Origin = 'ID_CentrodeCusto'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object sqlCentroCustoCentroDeCusto: TStringField
      FieldName = 'CentroDeCusto'
      Origin = 'CentroDeCusto'
      Size = 100
    end
    object sqlCentroCustoID_USER: TIntegerField
      FieldName = 'ID_USER'
      Origin = 'ID_USER'
    end
    object sqlCentroCustoID_LANGUAGE: TIntegerField
      FieldName = 'ID_LANGUAGE'
      Origin = 'ID_LANGUAGE'
    end
    object sqlCentroCustoGRUPO: TIntegerField
      FieldName = 'GRUPO'
      Origin = 'GRUPO'
    end
    object sqlCentroCustoTIPO: TStringField
      FieldName = 'TIPO'
      Origin = 'TIPO'
    end
    object sqlCentroCustoCategoria: TStringField
      FieldName = 'Categoria'
      Origin = 'Categoria'
      Size = 100
    end
  end
  object dsCentroCusto: TDataSource
    DataSet = sqlCentroCusto
    Left = 184
    Top = 192
  end
end
