object FrmLogin: TFrmLogin
  Left = 0
  Top = 0
  Caption = 'Login'
  ClientHeight = 157
  ClientWidth = 577
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
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 577
    Height = 157
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object cxLabel2: TcxLabel
      Left = 25
      Top = 37
      Caption = 'E-mail'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      Style.IsFontAssigned = True
      Transparent = True
    end
    object cxLabel1: TcxLabel
      Left = 25
      Top = 61
      Caption = 'Senha'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      Style.IsFontAssigned = True
      Transparent = True
    end
    object EdiSenha: TMaskEdit
      Tag = -1
      Left = 88
      Top = 59
      Width = 121
      Height = 21
      BorderStyle = bsNone
      CharCase = ecUpperCase
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 8
      ParentFont = False
      PasswordChar = '*'
      TabOrder = 2
      Text = ''
      OnKeyDown = EdiSenhaKeyDown
    end
    object EdiUsuario: TEdit
      Left = 88
      Top = 32
      Width = 465
      Height = 21
      BorderStyle = bsNone
      CharCase = ecUpperCase
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
    object butOk: TcxButton
      Left = 88
      Top = 86
      Width = 82
      Height = 39
      Caption = '&Ok'
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
      TabOrder = 4
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      OnClick = butOkClick
    end
    object butCancel: TcxButton
      Left = 224
      Top = 86
      Width = 97
      Height = 39
      Caption = '&Cancel'
      LookAndFeel.SkinName = 'Office2007Blue'
      ModalResult = 2
      OptionsImage.Glyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C0060000120B0000120B00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFDFB096EFD7CBFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFC1693AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFD1916FCC8661FF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFE6C3B0B95C2BE5C2B0FF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFBC5E
        2DC27147FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFC67B53C26131E4C1AFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFD3997BCA6635C37953FF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFDBAD95CF6837BC5F31FF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFDBAD
        95CC6A3AC7683BE3C0AFCE6C34CE6C34CE6C34CE6C34CE6C34CE6C34CE6C34CE
        6C34CE6C34CE6C34CE6C34CE6C34FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFDAAC95CB6D3FD07345D4A187CE6C34E67F44E57E43E57D42E57D
        42E47C41E47A40E3793FE2773EDB723BC96F3DF4E2D8FF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFDAAC95D17446D87D50C5815FCC6A33E88044
        E27E3CE27D3BE17C3AE07A39E07939E5793DDE743BCA703DF4E2D8FF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFD1977BD2784CDC8357C4
        805FCB6933E77D41DE7936DE7836DD7735DD7635E3783CDE743BCA6F3DF4E2D8
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFBF6F
        48DC8357DB845BC47F5EC96832E67B3FDD7634DC7533DC7432DE7435E3763CCB
        6833E4BBA4FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFECD6CABE653AE2885DD27C53C88A6CC86732E67D44DC7839DC7738DE76
        38DA7334E0753ADD733DC66C3DF3E2D8FF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFC6825FD47E54E28B60C7734AD6A994C66631E57D44
        DD7A3DE37B43E47B43DD783DDB773CE27841D56E3AC36A3BF3E1D8FF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFD4A087C26C41E18A60E18C64BA653DF0
        DFD7C56430E57A43E37942DD743FD6703BE27840DA753BD9743AE1763FD76E3A
        BF602EDCAE95FF00FFFF00FFFF00FFFF00FFFF00FFCF977ABD663BDE895FE08A
        60D78760BA6C47FF00FFC36330E37942DC733EC66C3DC56B3DDB723DE0763ED9
        7239D87139DF733DDD7340C96838BF693CCD8E6DDAAC95C78260B85E32CA744A
        DF895FDD8358E08E66BF6D45E0BEAFFF00FFC1622FDB723DC46B3DF3E1D8E6C3
        B0BF602EDA703CDF743DD87039D66F37DA713CE07A48DE7D4DD6794BD17649D8
        8055DF875CE0865AD97A4CE18C63CB7B56C17E5EFF00FFFF00FFBD5F2EC46A3D
        F3E1D8FF00FFFF00FFEED7CBC1683BCF6837E07541DD7440D66E39D46B36D770
        3CD97543DA7746D97646D6713FD97A4CDF8B63CE7F5ABE7654FF00FFFF00FFFF
        00FFBE6739F2E1D8FF00FFFF00FFFF00FFFF00FFFF00FFC98461C06132D47243
        DF7C4DDF7D4DDC7A49DA7847DA7949DD8053E08A61D78760BF6D45BC7350FF00
        FFFF00FFFF00FFFF00FFF2E1D8FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFEDD6CAC78260B85D30C3693DCF764BD0784ED07A50C7734ABA653DBA6C47
        E0BFAEFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFE7CABCD8AA94D7AA94D7AA94DB
        B4A1F0DFD7FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      TabOrder = 5
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      OnClick = butCancelClick
    end
    object btnCreateAccount: TcxButton
      Left = 440
      Top = 68
      Width = 113
      Height = 57
      Caption = 'Sign UP'
      OptionsImage.Glyph.Data = {
        36100000424D3610000000000000360000002800000020000000200000000100
        2000000000000010000000000000000000000000000000000000000000000000
        0000000000020000000400000006000000090000000C0000000F000000130000
        001600000017000000190000001A0000001C0000001E0000001F0000001F0000
        001F0000001E0000001D0000001D0000001C0000001B00000017000000140000
        00100000000C0000000900000006000000030000000100000000000000010000
        0003000000080000000F00000015040C09330B1D155A102C207D194131AA1E50
        3AC91F563FD61F553ED71E543DD7215941E326684CFF25674BFF25664AFF2465
        49FF1F573FE41D503AD81D503AD81D503AD81A4A36CC153C2BAF0E281D84091A
        1363040B083D0000001F000000160000000D0000000500000001000000020000
        00090815103E173D2E9427674EE62B795BFF2A8060FF2A8864FF29926BFF2899
        70FF279B71FF269A70FF26986EFF24996FFF23A074FF229E71FF209C6FFF209A
        6EFF209268FF1F8D64FF1F8C63FF1E8B62FF1D885FFF1F805BFF207654FF2170
        50FF23694BFF20583FE91234259D06120D490000000E00000004000000030000
        000E2F7B5EFF44A282FF2CAA7DFF2BAF81FF2CB081FF2CAE82FF2CAF81FF2CAD
        81FF2BAD80FF2AAB7EFF29A97DFF28A77BFF26A579FF25A377FF23A174FF239F
        72FF219D71FF209B6FFF1F9A6DFF1E996CFF1E976BFF1C966AFF1C9568FF1C94
        68FF1B9367FF1C8D63FF227F5BFF246448FF0000001800000006000000040000
        0010317F62FF5DC9A8FF2FB486FF30B486FF2FB488FF2FB488FF30B587FF30B4
        87FF30B387FF2EB285FF2DB184FF2CAE82FF2AAC80FF2AAA7DFF28A77AFF25A5
        78FF24A275FF22A073FF229F71FF209C6FFF209B6FFF1F9A6DFF1E996CFF1D97
        6BFF1D9669FF1C9569FF24986FFF215E44F40000001B00000007000000030000
        000E317F64F75DC9A9FF36B88DFF31B789FF32B88BFF37BD91FF3CC197FF3DC3
        9AFF3EC49CFF3CC39AFF39BF96FF37BC92FF32B68BFF2DB085FF2CAD81FF2AAA
        7FFF28A87CFF26A579FF25A376FF23A174FF229F72FF219E71FF209C6FFF209B
        6EFF1E9A6DFF1F9A6DFF269970FF215D44EC0000001900000006000000020000
        000A2B6D55D15AC1A0FF48C39CFF36BB8FFF43C69FFF48CCA5FF47CBA5FF47CB
        A6FF45CBA5FF44CBA3FF43C9A2FF41C8A1FF3FC59EFF3AC197FF32B68AFF2EB1
        84FF2CAE82FF2AAB7EFF27A97BFF26A679FF25A476FF24A274FF23A073FF219F
        71FF219E71FF229E72FF27936CFF1C4C38C60000001300000005000000010000
        000616372C704AA788FF69D4B5FF6AD7BAFF57D3B1FF4FD1ADFF4FD1ACFF4ED1
        ACFF4DD1ACFF4BD0ABFF4BCFAAFF52D2AEFF57D2B1FF5BD3B2FF59D1AFFF4AC4
        A0FF3EBB92FF2EB285FF2CAE81FF29AB7DFF27A87AFF26A578FF25A477FF24A3
        75FF27A476FF2CA77CFF2C8160FF0E241B6C0000000C00000003000000000000
        00030102010B275D4AAB5DAF96FF7CD3BDFF86E3CDFF75E0C4FF5FD9B9FF56D6
        B4FF54D6B3FF57D6B4FF5FD8B9FF55C1A3FF48A98AFF3B9274FF37896CFF3C95
        76FF42A585FF48BF9AFF35B68BFF2CB082FF2AAC7EFF28AA7BFF2BAA7DFF34B0
        85FF37A37EFF308464FF1A4432A9000000110000000600000001000000000000
        00010000000300000007172F27543D7C66CA5CAE96FF7BD1BBFF8BE7D1FF7EE4
        CBFF6DDFC2FF66DBBCFF53B498FF68ABAFFF76B0C9FF77B0DAFF629CCEFF4B88
        B0FF3A7D88FF328065FF4ABB97FF37B98EFF32B387FF3DB88EFF3DA681FF3285
        67FF225944CB0D221A5D0000000F000000060000000200000000000000000000
        00000000000100000002000000040000000712241E4238715DB65CAE94FF7ACF
        B8FF98EAD7FF6CBDACFF93C8DCFF96CCE9FF7AB0D7FF5F95C6FF548DC3FF4D89
        C0FF4682BEFF3B7AABFF307969FF5BC7A5FF44A987FF358869FF1F533FB50A1C
        154A0000000F0000000900000004000000010000000000000000000000000000
        00000000000000000000000000010000000200000004000000060F1D19353468
        57A55FAD96FD93C6D6FF9FD2EAFF79AACEFF4372A6FF356399FF306098FF3164
        9EFF3971ADFF3A78B7FF32729AFF39896FFB1E4E3DA308140F350000000C0000
        0007000000040000000200000001000000000000000000000000000000000000
        0000000000000000000000000000000000000000000100000001000000030000
        0007142423465B84A2FD76A6C1FF305C93FF143F85FF0C3883FF0B3883FF103C
        83FF1C4A88FF2C6294FF285379FC091717450000000B00000005000000030000
        0001000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000010000
        00030000000A1D2F35702C5487FF3567A6FF7EB4DAFF89CAEDFF61B1E2FF448F
        C8FF21579BFF173C71FF0B1B20650000000E0000000500000001000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000010000
        00030000000D05122356386DAAFF9EDFFBFF84D2F7FF4BACE9FF44A4E1FF47A1
        DDFF419CD6FF1B5095FF020B1A58000000130000000400000001000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000010000
        000500000013144078D084C2E7FFA2E5FFFF73D1FEFF5FC4FAFF48AAE7FF3696
        D8FF429CD8FF3B87C4FF062863CE0000001A0000000700000002000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000010000
        0008071423493B77B3FFA6E6FFFF9AE1FFFF6CCFFFFF6BCFFFFF62C4F8FF3C9B
        DCFF3996D7FF449ED8FF1A4C93FF010916470000000C00000002000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000020000
        000B143659946AA7D4FFBFEDFFFFB8EBFFFF90DDFFFF70D2FFFF70D1FFFF4BAA
        E5FF3997D8FF49A2DAFF3572B0FF04193E8F0000001100000004000000010000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000021424
        3A5F2B68A6FB93C8E7FFD3F4FFFFB9ECFFFFAEEAFFFF89DCFFFF75D4FFFF5FBE
        F1FF42A1DDFF4BA3DCFF498DC5FF0F387DFA0B182D6500000005000000010000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000000000000000000000000000000003365E
        93D73D7EB7FFBAE4F6FFD6F5FFFFB6ECFFFFB3EBFFFFA2E6FFFF79D8FFFF6ECB
        F8FF4DAAE2FF4EA7DFFF59A4D7FF21488BFF1D3D6FD900000005000000010000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000101061947
        89FD1E5796FFCDF0FCFFD7F6FFFFB7EDFFFFB7EDFFFFB1ECFFFF80D9FFFF7AD5
        FCFF57B3E7FF54AFE4FF65B3E2FF0F397DFF093474FE0001030C000000010000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000051630611446
        8DFF0E3F84FFD7F4FDFFDAF6FFFFBCEEFFFFBAEFFFFFBAEEFFFF85DFFFFF80DB
        FEFF63BDECFF5EB7E9FF75BEE7FF0A3679FF0F3F82FF02132C67000000010000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000000000000000000000000000000000000000000C2D5DAF1F57
        9FFF11428BFFA3C6DFFFDCF7FFFFC1F2FFFFBEF1FFFFBAEFFFFF8AE1FFFF88DE
        FEFF6DC7F1FF69C3EFFF8ACCEEFF09367AFF184C93FF052351B0000000010000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000154081E12764
        ACFF154B96FF5E88B7FFDEF8FFFFCBF4FFFF9CCAE4FF5388B8FF265A96FF2354
        8FFF326A9EFF407AABFF79A9CCFF0F3F85FD154996FF082E69D9000000010000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000000000000000000000000000000000000000001C4D94F93476
        BCFF205BA4FF1F5195FFD7F0FAFF6188B7FF13468EFF154A94FF164D98FF164B
        96FF12428BFF0E387CFF082866FF1B58ADFF174E9CFF0C387BF6000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000000000000000000000000024549DFC458B
        CBFF2F6FB2FF19539EFF3E6EAAFF2059A2FF3376BCFF397FC3FF3D82C5FF387B
        BFFF3272B8FF2461AAFF1F63B6FF1E61B4FF19539FFF0E3E85FF000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000224D8DDB4E95
        CEFF4993CEFF1D5DA7FF3476B7FF6BB0DEFF71B3E0FF6EB1DEFF64AADBFF569F
        D7FF539DD6FF539DD4FF3C85C9FF216ABBFF1A55A1FF104087FC000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000183259874987
        C4FF63AFDEFF2A79C1FF8AC9EAFF91CDECFF8ECCECFF8BCAEBFF87C7EAFF7FC3
        E8FF69B5E2FF68B5E2FF65B1E0FF2470BFFF1A56A0FF0E346DC3000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000050A121B3464
        A7F15EA0D4FF3D93D2FF94CDEDFFAFE1F5FFAADFF5FFA4DCF2FFA1DAF2FF97D6
        F1FF7BC9ECFF7EC9EDFF59A7DBFF2F7CC1FF21569BF60713243C000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000912
        1F2D25487CB4386AB4FD3E7DC2FF5E9ED4FF8EC5E7FF9FD2EEFFACE2F7FF8ACD
        EDFF6FB5E0FF4D95CFFF2E6EB5FF225398ED0812223600000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000013233748284971903A6AA1C94279B7E44985CBFF4178
        BAF0325F99CC274C7FB110213A54010204060000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000}
      TabOrder = 6
      OnClick = cxButton1Click
    end
  end
  object sqlAux: TFDQuery
    Connection = Dados.FDConnection
    Left = 516
    Top = 20
  end
end