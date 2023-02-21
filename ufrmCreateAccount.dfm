object frmCreateAccount: TfrmCreateAccount
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Create Account'
  ClientHeight = 316
  ClientWidth = 580
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 580
    Height = 81
    Align = alTop
    Caption = 'Create Account'
    Color = clHighlight
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clHighlightText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    TabOrder = 0
  end
  object Panel2: TPanel
    Left = 0
    Top = 81
    Width = 580
    Height = 235
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    object Label1: TLabel
      Left = 24
      Top = 24
      Width = 71
      Height = 19
      Caption = 'Full Name'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 24
      Top = 57
      Width = 45
      Height = 19
      Caption = 'E-mail'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 24
      Top = 90
      Width = 67
      Height = 19
      Caption = 'Password'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel
      Left = 24
      Top = 130
      Width = 106
      Height = 19
      Caption = 'Phone Number'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label5: TLabel
      Left = 24
      Top = 170
      Width = 68
      Height = 19
      Caption = 'Language'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object edtFullName: TEdit
      Left = 160
      Top = 23
      Width = 385
      Height = 21
      CharCase = ecUpperCase
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      Text = 'JOAO'
    end
    object edtEmail: TEdit
      Left = 160
      Top = 55
      Width = 385
      Height = 21
      CharCase = ecUpperCase
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      Text = 'JOAO@UOL.COM'
    end
    object edtPassword: TEdit
      Left = 160
      Top = 87
      Width = 145
      Height = 21
      CharCase = ecUpperCase
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      PasswordChar = '*'
      TabOrder = 2
      Text = '123'
    end
    object butOk: TcxButton
      Left = 359
      Top = 112
      Width = 186
      Height = 89
      Caption = '&Save'
      LookAndFeel.SkinName = 'Office2007Blue'
      OptionsImage.Glyph.Data = {
        76060000424D7606000000000000360400002800000018000000180000000100
        08000000000040020000C30E0000C30E00000001000000000000636363006B6B
        6B006B737300737373007B7B730073737B007B7B7B00527384005A738400637B
        8400848484005A738C0094848C008C8C8C00A58C8C008C949400949494009C94
        9400AD949400C6AD94005A7B9C005A849C008C949C009C9C9C00B59C9C00BD9C
        9C00A5A59C00DEBD9C00528CA5007B8CA5008C94A5008C9CA500A5A5A500BDA5
        A500BDADA500CEBDA5006B94AD00A5ADAD00ADADAD00B5ADAD003984B5004A9C
        B5006BA5B500B5B5B5005294BD006B94BD004A9CBD008CA5BD006BADBD00A5AD
        BD00BDBDBD00CEC6BD005294C6004A9CC600639CC600739CC6005AA5C6006BA5
        C600CEC6C6001884CE002184CE003184CE00298CCE004AA5CE0063ADCE006BAD
        CE00CECECE001884D6004A94D600429CD60042A5D600D6D6D600319CDE00399C
        DE00429CDE008CBDDE00A5C6DE0073CEDE00D6D6DE00D6DEDE00DEDEDE003194
        E700429CE70039A5E70042A5E70042ADE70052ADE7006BBDE7007BC6E7006BCE
        E70094CEE700A5CEE700ADCEE700E7E7E7003194EF0042A5EF004AADEF0052B5
        EF0052BDEF005ABDEF0063C6EF006BC6EF0063CEEF007BCEEF006BD6EF0094EF
        EF00EFEFEF003194F700319CF70039A5F7004AADF7004AB5F70052BDF70063BD
        F70063C6F7006BC6F7008CC6F70094C6F70073CEF7009CCEF70073D6F700CEDE
        F700ADEFF700DEEFF700F7F7F700FF00FF00319CFF00399CFF0039A5FF0042A5
        FF0042ADFF004AADFF0052ADFF004AB5FF0052B5FF0052BDFF005AC6FF0063CE
        FF006BCEFF0073D6FF007BD6FF0084D6FF009CD6FF0094DEFF007BE7FF00A5E7
        FF00BDE7FF0084EFFF00ADEFFF00C6EFFF008CF7FF0094F7FF00CEF7FF00E7F7
        FF00C6FFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF007D7D7D7D7D7D
        7D7D3A2B06067D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D063A5D067D7D
        7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D3A3A2B0A7D7D7D7D7D7D3244447D
        7D7D7D7D7D7D7D7D7D7D06422B0A7D7D7D7D7D57415929447D7D7D7D7D7D7D7D
        7D7D3A472B0A7D7D7D7D7D4C5B8C68447D7D7D7D7D7D7D7D7D7D063A260A7D7D
        7D7D5739676E59447D7D7D7D7D7D7D7D7D7D3A32260D7D7D7D7D4C5A71702E7D
        7D7D7D7D7D7D7D7D7D7D062B260A7D7D7D5738575464447D7D7D7D7D7D7D7D7D
        7D262010200A7D7D7D4C5871543F7D7D7D7D7D7D7D7D7D7D7D2B260D20027D7D
        4C35564962447D7D7D7D7D7D7D7D17060320262456490725578A6C48467D7D7D
        7D7D7D7D7D172B47472631638987642878833C55447D7D7D7D7D7D7D1747263A
        6A5D4B8B868693938A5F3C4A7D7D7D7D7D7D7D7D1750202B507B738B80879396
        8A3E482C7D7D7D7D7D7D7D7D17502020063790887F544D978A815E087D7D7D7D
        7D7D7D7D175D2010257690816C1409308F83814A087D7D7D7D7D7D7D175D2617
        2D94917F6B15180C1C7783882C7D7D7D7D7D7D7D177C472B2F74999284862A12
        053C816F447D7D7D7D7D7D7D1A26476A5D4E7592988D930F0E3D8145447D7D7D
        7D7D7D7D1A13062B2632475B8E9A7A100E5281367D7D7D7D7D7D7D7D1A1B0017
        7D7D26201E391F191D815E447D7D7D7D7D7D7D7D7D1A23040001030303112116
        6988447D7D7D7D7D7D7D7D7D7D7D1A223347473327112B7977447D7D7D7D7D7D
        7D7D7D7D7D7D7D7D1A1A1A1A177D7D7D7D7D7D7D7D7D7D7D7D7D}
      TabOrder = 5
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      OnClick = butOkClick
    end
    object cboLanguage: TComboBox
      Left = 160
      Top = 172
      Width = 145
      Height = 22
      Style = csOwnerDrawFixed
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      Items.Strings = (
        'English'
        'Espanol'
        'Portugues')
    end
    object EdtPhone: TMaskEdit
      Left = 160
      Top = 130
      Width = 145
      Height = 21
      EditMask = '!\(999\)000-0000;1;_'
      MaxLength = 13
      TabOrder = 3
      Text = '(   )   -    '
    end
  end
  object sqlSalvar: TFDQuery
    Connection = Dados.FDConnection
    Left = 160
    Top = 41
  end
  object sqlAux: TFDQuery
    Connection = Dados.FDConnection
    Left = 88
    Top = 41
  end
end
