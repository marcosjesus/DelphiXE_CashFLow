object frmCategoria: TfrmCategoria
  Left = 0
  Top = 0
  Caption = 'Tabela de Categoria'
  ClientHeight = 428
  ClientWidth = 648
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
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object cxGrid1: TcxGrid
    Left = 0
    Top = 0
    Width = 648
    Height = 428
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object cxGrid1DBTableView1: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.DataSource = dsCategoria
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      object cxGrid1DBTableView1FAVORECIDO: TcxGridDBColumn
        DataBinding.FieldName = 'FAVORECIDO'
        Width = 200
      end
      object cxGrid1DBTableView1CATEGORIA: TcxGridDBColumn
        DataBinding.FieldName = 'CATEGORIA'
        Width = 200
      end
      object cxGrid1DBTableView1CENTRODECUSTO: TcxGridDBColumn
        DataBinding.FieldName = 'CENTRODECUSTO'
        Width = 150
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBTableView1
    end
  end
  object sqlCategoria: TFDQuery
    Connection = Dados.FDConnection
    SQL.Strings = (
      'SELECT T.FAVORECIDO, T.CATEGORIA, C.CENTRODECUSTO'
      'FROM TBCATEGORIA T'
      
        'LEFT OUTER JOIN CENTRODECUSTO C ON C.ID_CENTRODECUSTO = T.ID_CEN' +
        'TRODECUSTO'
      'WHERE T.ID_LANGUAGE = 1'
      'ORDER BY T.FAVORECIDO, T.CATEGORIA, C.CENTRODECUSTO'
      '')
    Left = 280
    Top = 136
    object sqlCategoriaFAVORECIDO: TStringField
      FieldName = 'FAVORECIDO'
      Origin = 'FAVORECIDO'
      Size = 100
    end
    object sqlCategoriaCATEGORIA: TStringField
      FieldName = 'CATEGORIA'
      Origin = 'CATEGORIA'
      Size = 100
    end
    object sqlCategoriaCENTRODECUSTO: TStringField
      FieldName = 'CENTRODECUSTO'
      Origin = 'CENTRODECUSTO'
      Size = 100
    end
  end
  object dsCategoria: TDataSource
    DataSet = sqlCategoria
    Left = 488
    Top = 136
  end
end
