object frmEmail: TfrmEmail
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'E-mail Reader'
  ClientHeight = 309
  ClientWidth = 492
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 40
    Top = 21
    Width = 71
    Height = 13
    Caption = 'E-mail provider'
  end
  object TLabel
    Left = 40
    Top = 71
    Width = 69
    Height = 13
    Caption = 'E-mail account'
  end
  object TLabel
    Left = 40
    Top = 119
    Width = 46
    Height = 13
    Caption = 'Password'
  end
  object TLabel
    Left = 40
    Top = 171
    Width = 56
    Height = 13
    Caption = 'Save File to'
  end
  object cbxProvedor: TcxComboBox
    Left = 40
    Top = 40
    Properties.Items.Strings = (
      'Gmail'
      'Outlook'
      'Hotmail'
      'Yahoo')
    TabOrder = 0
    Text = 'Gmail'
    Width = 185
  end
  object edtEmail: TEdit
    Left = 40
    Top = 90
    Width = 417
    Height = 21
    TabOrder = 1
    Text = 'marcos.luiz.jesus@hotmail.com'
  end
  object edtPassword: TEdit
    Left = 40
    Top = 138
    Width = 417
    Height = 21
    PasswordChar = '*'
    TabOrder = 2
    Text = '415410'
  end
  object edtOutPut: TcxButtonEdit
    Left = 40
    Top = 190
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    TabOrder = 3
    Text = 'c:\bibanco'
    OnClick = edtOutPutClick
    Width = 417
  end
  object btnImportar: TcxButton
    Left = 44
    Top = 247
    Width = 138
    Height = 42
    Caption = '&Login && Read'
    LookAndFeel.SkinName = 'Office2007Blue'
    OptionsImage.Glyph.Data = {
      36100000424D3610000000000000360000002800000020000000200000000100
      2000000000000010000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0001000000010000000200000004000000050000000600000007000000070000
      0006000000050000000400000002000000010000000100000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000001000000010000
      0003000000060000000B0000001000000015000000180000001A0000001A0000
      001800000016000000110000000C000000070000000400000001000000010000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000010000000100000003000000070000
      000E0000001707140E4D133324951D4E38D11D513BD9246448FF246448FF1E51
      3BD91C4E38D11233249607140F4F000000190000001000000008000000040000
      0001000000010000000000000000000000000000000000000000000000000000
      000000000000000000000000000100000001000000040000000B000000150C21
      176B1F563FE1257151FF278963FF299D72FF2AA176FF2BB07FFF2BAF80FF2AA2
      76FF2A9E72FF278964FF267151FF20573FE20C21186D000000180000000D0000
      0005000000010000000100000000000000000000000000000000000000000000
      0000000000000000000100000001000000050000000D040C09361C503ACF2678
      56FF2AA074FF2CB180FF2BB180FF2CB081FF2CB081FF2CB180FF2CB181FF2CB1
      80FF2CB080FF2CB081FF2CB180FF2AA074FF277957FF1D5039D1040C093A0000
      0010000000060000000100000001000000000000000000000000000000000000
      00000000000000000001000000050000000E09191255236248F029946BFF2CB1
      81FF2CB181FF2CB181FF2CB282FF2CB282FF2CB282FF2CB282FF2DB282FF2DB2
      82FF2CB182FF2CB281FF2CB181FF2CB181FF2CB181FF29956CFF246248F10919
      135A000000120000000600000001000000000000000000000000000000000000
      000000000000000000040000000C09191253256C4EFA2A9F74FF2CB181FF2DB1
      82FF2CB283FF2DB283FF2DB283FF2EB283FF2EB284FF2EB384FF2EB383FF2EB3
      84FF2EB384FF2EB283FF2EB383FF2EB383FF2DB282FF2DB182FF2A9F74FF256D
      4FFA091A12590000001000000005000000010000000000000000000000000000
      00000000000200000009050F0B38246549EE2EA47AFF2EB383FF2DB283FF2EB3
      83FF2EB384FF2EB385FF2EB484FF51C7A2FF60CFAEFF37B98DFF2EB485FF2FB5
      85FF2FB485FF2EB485FF2EB485FF2EB384FF2EB383FF2EB384FF2FB384FF2FA5
      7AFF23644AEF050F0B3E0000000C000000030000000100000000000000000000
      000100000005000000101D513BCB2E9770FF30B385FF2EB384FF2EB484FF2EB4
      85FF2FB586FF2FB586FF50C6A1FF32916EFF1E7652FF4AB995FF30B587FF31B6
      87FF30B686FF30B587FF30B587FF2FB586FF2EB486FF2EB485FF2EB485FF30B4
      86FF2E9871FF1D533CD000000016000000070000000100000000000000000000
      00020000000A0C231A652D7D5CFF34B689FF2EB384FF2EB485FF2FB586FF30B5
      86FF31B688FF4EC59FFF389774FF7CAE9AFFA2C4B6FF2F8C6AFF41BF95FF32B7
      89FF32B789FF31B688FF31B689FF31B688FF30B588FF30B686FF2FB486FF2EB4
      85FF34B68AFF2D7E5EFF0D241A6B0000000E0000000300000001000000010000
      00040000000F205B43DD32A67DFF30B587FF2FB586FF30B587FF31B688FF31B7
      88FF4BC49DFF3E9F7CFF6BA28BFFF9F5F1FFF5EFEAFF45896CFF4CB491FF35BB
      8DFF34B98BFF34B98AFF33B98AFF32B989FF32B789FF32B688FF31B688FF30B5
      87FF31B688FF33A77DFF215E44DF000000160000000700000001000000020000
      0007091B144E308061FF37B98BFF30B587FF30B688FF31B688FF33B78AFF48C4
      9BFF46A786FF5A967DFFF6F4F0FFF3E8DFFFF3E8DFFFC8D9D0FF247A58FF4FC5
      9EFF35BB8DFF35BB8DFF34BA8CFF34BA8BFF34BA8BFF33B98AFF32B989FF31B7
      88FF31B688FF37B98CFF308162FF0A1D15570000000B00000002000000020000
      0009153B2B923A9B78FF35B98BFF32B788FF32B989FF33B98BFF46C39AFF4CAF
      8EFF4A8A6FFFF4F4F1FFF4EAE2FFF4E9E0FFF3E8E0FFF7EDE7FF699D87FF409D
      7CFF3FC094FF37BC8FFF37BC8EFF36BB8EFF36BB8DFF35BA8DFF34BA8BFF34B9
      8BFF32B78AFF36BA8CFF3B9C79FF153C2C980000000E00000003000000020000
      000B1E553FC63DAC86FF35B88CFF33B78AFF33B98BFF45C398FF54B797FF4084
      67FFEAEFEAFFF5EBE3FFF2E6DEFFEDDFD6FFF4E9E1FFF4E9E0FFE3E8E1FF2570
      50FF56C19EFF39BE91FF39BE90FF38BD90FF37BC8FFF37BC8EFF35BB8DFF35BB
      8CFF33B98BFF35B98DFF3EAD87FF1E5640CA0000001100000004000000030000
      000C256A4EEC3EB88EFF34BA8CFF35B98CFF3FBF94FF57BD9DFF347B5CFFE5EC
      E8FFF6EDE6FFF1E6DDFFCAC3B6FF9DAA97FFEFE3DCFFF4EAE2FFF6EBE5FF9DBD
      AFFF318464FF4FC8A2FF3ABF94FF3ABF92FF39BE91FF38BD90FF37BD8FFF36BB
      8EFF35BB8CFF35BB8CFF3FB98FFF256D50ED0000001300000005000000030000
      000C287455FA43C096FF35BA8BFF36BB8DFF37B488FF1F704EFFC9D0C8FFF7ED
      E7FFF1E5DEFFBEBCB0FF2E7354FF246F4EFFB5B7A8FFF1E6DFFFF4EAE3FFF6F1
      ECFF548B72FF4EAD8DFF42C49AFF3CC195FF3BC094FF3BBF92FF39BE90FF39BD
      90FF37BC8EFF35BB8DFF44C197FF287657FA0000001300000005000000030000
      000B287656FA4CC49BFF35BC8DFF37BC8EFF37BC8EFF24805CFF608A72FFE4D5
      CCFFB2B5A7FF2C7757FF3CBD96FF3BBB93FF2B7151FFC8C3B6FFF4E9E2FFF5EB
      E4FFE1E8E2FF2D7355FF5FCAABFF40C59AFF3EC197FF3CC195FF3BC094FF3ABF
      92FF38BD90FF38BC8EFF4EC59DFF297859FA0000001200000005000000020000
      000A267052EC55C39FFF39BD91FF38BE90FF3ABE92FF3CC096FF257E5BFF4A7C
      61FF2B7F5EFF41CBA3FF45D3ACFF46D3ADFF39B28DFF3C7457FFDACFC5FFF5EB
      E4FFF7EDE8FFADC7BAFF2E8061FF5ED8B7FF43CDA4FF40C99FFF3DC399FF3CBF
      94FF3ABF92FF3BBF92FF56C5A0FF277256ED0000001100000004000000020000
      0008205D46C559BD9DFF3DC094FF3CC296FF43CDA6FF45D2ACFF44CEA8FF319D
      7AFF46D2ACFF48D5B0FF49D5B0FF49D5B0FF49D5B1FF34A481FF4C7B60FFE0D2
      CAFFF5ECE5FFF9F3EFFF699882FF459D7FFF57D6B3FF44CFA6FF43CDA4FF41C8
      A0FF3DC196FF3FC196FF5BBF9FFF205F47C80000000E00000003000000010000
      00061643328F58B194FF49CDA6FF47D2ACFF48D3AEFF49D5AFFF49D5B0FF4AD7
      B2FF4BD7B2FF4CD8B4FF4DD7B4FF4DD8B4FF4CD8B4FF4DD7B4FF329B78FF4B7B
      61FFDFD2C9FFF6EBE5FFEFF0ECFF468066FF58B699FF55D6B1FF45CFA7FF45CE
      A5FF43CAA3FF48C9A2FF58B295FF174433940000000B00000003000000010000
      00040B201848409E80FF63DEC0FF4BD4B1FF4CD7B2FF4DD7B3FF4ED7B4FF4FD8
      B4FF4FD9B7FF50DAB7FF50DAB7FF51DAB8FF51DAB7FF50DAB7FF51D9B7FF38A6
      84FF47795EFFDDD0C7FFF6ECE7FFF0F2EFFF478368FF61C1A5FF56D5B3FF47CF
      A8FF46CDA6FF62D8B8FF409C7DFF0B20184E0000000700000002000000000000
      0002000000072D7D62DA6CD4BBFF55D9B7FF51D8B5FF51D9B6FF53DAB8FF53DB
      BAFF54DCB9FF55DBBAFF55DCBBFF56DCBBFF55DCBAFF56DDBBFF56DDBAFF55DC
      BAFF40B090FF487A60FFD9CCC4FFF3E9E3FFEDF1EDFF4B876DFF67C7ACFF57D6
      B3FF4ED2ADFF6ECFB6FF29785DDC0000000E0000000400000001000000000000
      0001000000041231275B48A98CFF72E5CAFF56DBB9FF56DBBAFF58DCBCFF58DC
      BCFF59DDBDFF59DEBDFF5ADFBEFF5ADFBFFF5BDFBFFF5ADFBEFF5ADFBEFF59DE
      BDFF59DDBCFF47BB9AFF367559FFBAB9ADFFECDFD8FFDDDFDAFF237150FF45BA
      96FF70DFC3FF46A487FF10302561000000080000000200000000000000000000
      000000000002000000062B765EC66CCEB6FF6AE3C6FF5CDDBDFF5DDEBFFF5EDE
      C0FF5EDFC0FF5FE1C2FF60E1C2FF5FE1C2FF60E1C2FF5FE0C2FF5EE1C1FF5EE0
      C1FF5DDFBFFF5CDFBEFF55CFAFFF2E8464FF72937DFF8FA392FF2D8463FF63D8
      B9FF6DCBB1FF287259C80000000C000000040000000100000000000000000000
      00000000000100000003081410283B9679EC7EDFCBFF6FE4C9FF63E0C3FF63E0
      C3FF64E1C4FF65E2C4FF64E3C5FF64E3C5FF64E3C5FF65E3C5FF64E2C5FF63E2
      C4FF63E2C3FF61E0C1FF5FDFBFFF5EDEBDFF48B797FF2A8362FF61D2B5FF80DB
      C6FF379274ED07140F2D00000006000000020000000000000000000000000000
      00000000000000000001000000041028204644A689F982DFCBFF7EEAD3FF69E2
      C6FF69E3C7FF6AE4C7FF6AE4C8FF6AE5C9FF6AE4C8FF6AE4C8FF6AE4C8FF69E4
      C7FF68E3C6FF66E2C4FF64E0C2FF62DFC1FF61DDBEFF7AE5CDFF82DCC7FF40A2
      83FA0E271F4A0000000700000002000000000000000000000000000000000000
      000000000000000000000000000100000004102921453F9E81EE77D5BEFF93F1
      DFFF7BE9D1FF6FE5CAFF6FE6CBFF70E6CBFF70E6CBFF6FE7CCFF6EE6CBFF6DE6
      CAFF6CE4C8FF6BE3C6FF69E2C5FF75E5CBFF92EEDAFF75D2BAFF3B9B7CEE0F28
      204A000000070000000200000001000000000000000000000000000000000000
      000000000000000000000000000000000001000000030814102335856DC85ABF
      A3FF8BE4D2FF9DF4E5FF8DEFDCFF82EBD5FF7EEBD4FF75E8CFFF74E8CEFF7DEA
      D2FF7FEAD3FF8CEDDAFF9DF2E2FF8BE4D0FF58BEA1FF318469CA071410280000
      0006000000020000000100000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000100000002000000051738
      2E563D987CDA54BD9EFF75D4BCFF8EE6D3FF94EAD9FFA7F5E8FFA7F5E8FF95EA
      D9FF8DE6D3FF73D3BAFF52BB9CFF399679DA16392E5B00000007000000040000
      0002000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000001000000010000
      0003000000040D201A32255A4A82388D73C53B957ACE49B896FC49BA98FC3A95
      7ACF378D74C6235A4A840C201A34000000060000000400000002000000010000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0001000000010000000200000003000000040000000500000005000000050000
      0005000000040000000400000003000000020000000100000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000001000000010000000100000001000000010000
      0001000000010000000100000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000}
    TabOrder = 4
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    OnClick = btnImportarClick
  end
  object butCancel: TcxButton
    Left = 311
    Top = 247
    Width = 138
    Height = 42
    Caption = '&Close'
    LookAndFeel.SkinName = 'Office2007Blue'
    ModalResult = 8
    OptionsImage.Glyph.Data = {
      36100000424D3610000000000000360000002800000020000000200000000100
      2000000000000010000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0001000000010000000200000004000000050000000600000007000000070000
      0006000000050000000400000002000000010000000100000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000001000000010000
      0003000000060000000B0000001000000015000000180000001A0000001A0000
      001800000016000000110000000C000000070000000400000001000000010000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000010000000100000003000000070000
      000E0000001706031B4D0F084595180B69D11A0B6FD91E0E87FF1E0D87FF180A
      6ED9170968D10F06449606021B4F000000190000001000000008000000040000
      0001000000010000000000000000000000000000000000000000000000000000
      000000000000000000000000000100000001000000040000000B000000150B06
      2E6B1C0F76E11F148FFF1C199AFF1A1EA4FF1A1FA5FF1823ACFF1822ACFF191E
      A5FF1A1DA3FF1B1899FF1D118DFF1A0C75E20A052C6D000000180000000D0000
      0005000000010000000100000000000000000000000000000000000000000000
      0000000000000000000100000001000000050000000D040311361C0F6ECF2119
      96FF1D21A8FF1C27B2FF1E2AB4FF202DBAFF212DBAFF232FBDFF232FBCFF202D
      B9FF202CB9FF1E2AB6FF1B26B0FF1B1FA5FF1E1492FF180B6AD10402103A0000
      0010000000060000000100000001000000000000000000000000000000000000
      00000000000000000001000000050000000E0A062455241788F02022A5FF202B
      B5FF2231BBFF2432BDFF2533BDFF2533BDFF2533BEFF2533BEFF2433BEFF2532
      BEFF2432BEFF2433BDFF2532BDFF222EBAFF1E2AB3FF1E1EA1FF1D1181F10804
      225A000000120000000600000001000000000000000000000000000000000000
      000000000000000000040000000C0A072553281C93FA2329ADFF2532BCFF2735
      BFFF2735C1FF2836BFFF2836C1FF2836C0FF2836C2FF2836C0FF2836C0FF2836
      C0FF2736C0FF2736C0FF2736BFFF2635BFFF2635BEFF2230BAFF1F25A9FF2114
      8BFA080523590000001000000005000000010000000000000000000000000000
      0000000000020000000906041638281E8CEE262FB2FF2935C0FF2A38C1FF2B38
      C2FF2A39C3FF2B39C2FF2A3AC2FF2B3AC3FF2C3AC3FF2C3AC3FF2C3AC3FF2B3A
      C3FF2B39C3FF2B3AC3FF2939C2FF2A38C2FF2938C2FF2837C0FF2634BFFF2228
      AEFF211585EF0503143E0000000C000000030000000100000000000000000000
      00010000000500000010241B77CB2B2EAFFF2C3BC2FF2D3BC4FF2E3DC4FF2D3D
      C4FF3140C5FF4556CFFF4F5ED2FF4454CEFF303FC7FF2F3EC5FF2F3EC5FF303F
      C6FF4453CEFF4D5DD3FF4555CFFF303FC5FF2C3CC3FF2D3BC4FF2B3AC3FF2A38
      C1FF2526A8FF1D1270D000000016000000070000000100000000000000000000
      00020000000A110D3465312BA5FF3040C4FF2F3FC5FF2F40C6FF3041C6FF3344
      C7FF4B5ACFFF434ABBFF3D41B2FF444CBDFF4A5AD0FF3344C8FF3344C9FF495A
      D1FF4249BAFF393BACFF3E44B6FF4958CDFF3343C7FF2F3FC5FF2E3EC5FF2E3D
      C5FF2E3CC2FF29219AFF0D08306B0000000E0000000300000001000000010000
      00040000000F2C2489DD323BBBFF3344C8FF3243C8FF3244C8FF3444C9FF4B5A
      CFFF4046B6FF9597D4FFE8E8F6FF8081CBFF4147B8FF4D5ED3FF4D5FD3FF3E45
      B7FF7E80C9FFE7E8F5FF9293D0FF3A3EB0FF4959CEFF3244C7FF3142C7FF3041
      C7FF3243C7FF2C35B6FF24187EDF000000160000000700000001000000020000
      00070E0C294E3A36ACFF3A4AC9FF3546C9FF3646CAFF3648C9FF3748CBFF4349
      B9FF9597D4FFF9F4F1FFF5ECE6FFF9F5F4FF8182CBFF4046B7FF3F45B6FF7F81
      C9FFF9F5F3FFF4EBE5FFF9F4F1FF9192D0FF3C41B3FF3648C9FF3546CAFF3445
      C9FF3344C8FF3747C7FF2F29A1FF0B0827570000000B00000002000000020000
      00091F1A59924044BBFF3E4ECCFF384ACCFF394CCBFF3A4CCCFF3B4DCCFF3B3E
      AFFFE3DADCFFE7D9D1FFF4EAE4FFF4EBE4FFF9F5F4FF7F81C9FF7F80C8FFF9F5
      F4FFF4E9E2FFF4E9E2FFF3E8E1FFE9E2E5FF3233A6FF3A4CCCFF384BCBFF384A
      CAFF3748CAFF3A4CCBFF373AB2FF181252980000000E00000003000000020000
      000B2F2882C6444FC7FF3D50CEFF3C4ECDFF3C50CFFF3D50CFFF3D51CFFF3B43
      B8FF6E68AFFFD6C2BBFFE9DAD2FFF4EBE5FFF4EBE5FFF9F6F5FFF9F6F4FFF4EA
      E4FFF4EAE3FFF4EAE3FFE5D6D0FF6A64ADFF343BB1FF3E50CEFF3C4FCDFF3B4D
      CDFF3A4DCCFF3C4ECDFF3F48C0FF251D77CA0000001100000004000000030000
      000C3A36A2EC4958CEFF4052D0FF3F52D0FF4053D0FF4054D1FF4155D1FF4255
      D1FF3940B4FF6D66AEFFD7C2BCFFE9DBD3FFF6ECE6FFF6ECE5FFF4ECE5FFF4EB
      E5FFF6EBE5FFE7D8D1FF6A63ABFF3339AEFF4054CFFF4054D0FF3F52D0FF3E52
      CFFF3D50CFFF3E50CFFF4554CBFF2F2694ED0000001300000005000000030000
      000C423CAFFA5061D5FF4154D1FF4256D1FF4356D2FF4357D2FF4458D3FF4559
      D3FF465AD2FF3E43B5FF6D67AFFFE9DAD4FFF7EDE9FFF6EDE9FFF6EDE8FFF6ED
      E6FFF4EBE5FF706AB4FF393EB1FF4559D1FF4459D3FF4358D2FF4357D2FF4256
      D1FF4054D0FF3F53D0FF4C60D3FF362CA0FA0000001300000005000000030000
      000B4541B1FA5B6DDAFF4557D3FF4559D3FF465AD4FF465BD4FF475CD4FF4A5F
      D5FF687ADDFF464BB6FF7A79C1FFF5EFE9FFF7F0E9FFF6EFE9FFF6EFE9FFF6EF
      E9FFF4ECE7FF7977BFFF3F43B1FF6578DCFF4A5ED5FF475BD4FF465AD4FF4559
      D3FF4357D2FF4356D1FF576BD8FF3830A4FA0000001200000005000000020000
      000A433FABEC6576DAFF485ED5FF475CD5FF485DD5FF5468D9FF687BDDFF8496
      E5FF5255BAFF8080C7FFFAF8F7FFF7F0EBFFF7F1EBFFF7F0EBFFF7F0EAFFF7F0
      EAFFF7F0EAFFFAF7F7FF7A7AC3FF4549B2FF7789E0FF5D70DBFF5063D8FF485D
      D5FF465BD4FF475BD4FF6372D8FF38309DED0000001100000004000000020000
      000839378FC56F7DDAFF4E63D9FF5167D8FF7084E1FF7C8FE4FF7D90E4FF5A5F
      BFFF7D7CC5FFFAF8F7FFF8F2EFFFF8F1EDFFF8F2ECFFE9DDD8FFDECEC8FFEADE
      D8FFF7F0EBFFF7F0EBFFFAF8F7FF7775C0FF4D51B6FF6B7FDFFF687CDEFF5F73
      DBFF4E62D6FF4D62D7FF6A77D5FF302B84C80000000E00000003000000010000
      00062A28668F747DD6FF6F83E1FF8092E4FF8295E5FF8295E5FF8295E6FF3A3B
      A9FFE8E2E7FFEDE3DEFFF9F2EFFFF8F3EFFFE8DDD9FF6F68ADFF6D65A9FFD8C6
      BFFFEADFD8FFF8F2ECFFF7F1ECFFEDE9EEFF2F2D9EFF6F84E2FF6E81E0FF6B7F
      DFFF677BDEFF6376DDFF6C73CFFF23205F940000000B00000003000000010000
      0004151430486F72D1FF9FB0EDFF8699E6FF879AE7FF879AE7FF889BE8FF4E53
      B7FF8179B0FFDCCBC4FFEADFDCFFE7DBD7FF6F68ADFF494DB3FF484CB3FF6C64
      A9FFD8C7C0FFE7DCD7FFEBDFD9FF7E75B0FF4245B0FF7589E2FF7287E2FF7083
      E2FF6C80E0FF889BE8FF5F5FC4FF11102D4E0000000700000002000000000000
      0002000000075757AEDAA8B5EBFF90A3E9FF8D9FE9FF8EA0E9FF8EA0E9FF8696
      E4FF4649B0FF7E75ADFFC3B1B7FF6D66ABFF4A4FB4FF8799E6FF8698E6FF474C
      B1FF6B64A9FFC2B0B6FF796FAAFF3A3CA8FF7587DEFF7A8EE5FF778BE3FF7489
      E3FF768AE3FF99A5E5FF4643A0DC0000000E0000000400000001000000000000
      0001000000042324455B7E82D9FFB0C1F2FF92A5EAFF93A5EBFF93A5EBFF93A5
      EBFF8A9AE4FF4F54B6FF3534A2FF565CBBFF8D9FE8FF8FA2EBFF8EA1EAFF899C
      E7FF5157B9FF2E2C9CFF454AB0FF7C8EE1FF8295E7FF7F92E6FF7C90E5FF798D
      E5FF9EB0EDFF6C6ECBFF1C1B4061000000080000000200000000000000000000
      000000000002000000065455A2C6A8B2E9FFA8B9F0FF97AAECFF98AAECFF98AA
      ECFF98AAECFF97AAECFF97A9ECFF96A9ECFF95A8ECFF94A7ECFF93A6EBFF91A4
      EBFF8FA3EAFF8DA0EAFF8B9FEAFF899CE9FF859AE8FF8397E8FF8194E6FF93A5
      EBFF9CA5E3FF464497C80000000C000000040000000100000000000000000000
      000000000001000000030F0F1C286B6EC5ECBDCAF2FFACBEF1FF9DAFEDFF9DAF
      EEFF9DAFEDFF9DAFEDFF9BAEEDFF9AADEDFF9AACEDFF99ABEDFF97AAEDFF96A9
      ECFF94A7ECFF91A5EBFF8FA3EAFF8CA0EAFF8A9EEAFF879BE9FF99ACEDFFB2C0
      EEFF5C5CBBED0C0C1A2D00000006000000020000000000000000000000000000
      00000000000000000001000000041D1D3646787BD5F9BFCBF2FFBCCCF5FFA1B4
      EFFFA1B3EFFFA1B3EFFFA0B3EEFF9FB1EFFF9EB1EFFF9DAFEEFF9BAEEEFF9AAD
      EEFF98ABEDFF95A9ECFF93A6ECFF90A4EBFF8EA1EAFFACBEF2FFB6C3EFFF696B
      CBFA1818324A0000000700000002000000000000000000000000000000000000
      0000000000000000000000000001000000041D1E36457074CBEEB0BAEEFFD0E0
      F9FFB5C6F3FFA5B7F0FFA5B7F0FFA3B6F0FFA3B5EFFFA1B4EFFF9FB2EFFF9EB0
      EEFF9CAEEEFF99ACEDFF97ABEDFFA6B9F0FFC7D8F7FFA8B1E9FF6466C4EE1A1A
      334A000000070000000200000001000000000000000000000000000000000000
      000000000000000000000000000000000001000000030E0F1A235E60AAC89196
      E4FFC4D0F4FFD7E7FBFFC7D7F7FFB8C8F4FFB3C4F3FFA6B8F0FFA4B7F0FFAFC0
      F2FFB1C2F2FFC0D1F6FFD2E3FAFFBFCCF2FF888EDEFF5556A6CA0D0D19280000
      0006000000020000000100000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000100000002000000052728
      4656686CBCDA878CE1FFAAB2ECFFC4D1F4FFCAD6F6FFDDECFCFFDCECFCFFC8D5
      F5FFC1CEF3FFA5AEEAFF8085DEFF6163B7DA2526475B00000007000000040000
      0002000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000001000000010000
      000300000004161728323E3F6E825F61A9C56366B2CE797EDBFC787CDAFC6064
      B1CF5C5EA9C63A3D6D8415162734000000060000000400000002000000010000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0001000000010000000200000003000000040000000500000005000000050000
      0005000000040000000400000003000000020000000100000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000001000000010000000100000001000000010000
      0001000000010000000100000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000}
    TabOrder = 5
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 290
    Width = 492
    Height = 19
    Panels = <
      item
        Width = 400
      end>
  end
  object SaveDialog: TSaveDialog
    DefaultExt = '*.xls'
    Filter = 'Arquivos CSV|*.csv'
    Left = 262
    Top = 41
  end
end