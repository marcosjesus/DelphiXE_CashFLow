object Dados: TDados
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 438
  Width = 538
  object FDManager: TFDManager
    FormatOptions.AssignedValues = [fvMapRules]
    FormatOptions.OwnMapRules = True
    FormatOptions.MapRules = <>
    Active = True
    Left = 448
    Top = 17
  end
  object FDGUIxWaitCursor: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 40
    Top = 18
  end
  object FDPhysMSSQLDriverLink: TFDPhysMSSQLDriverLink
    Left = 48
    Top = 193
  end
  object sqlMensagem: TFDQuery
    Connection = FDConnection
    Left = 48
    Top = 280
  end
  object FDSQLiteSecurity: TFDSQLiteSecurity
    DriverLink = FDPhysSQLiteDriverLink
    ToPassword = '1234'
    Left = 392
    Top = 256
  end
  object FDConnection: TFDConnection
    Params.Strings = (
      
        'Database=C:\Users\aluga.com\Documents\RAD Studio\Projects\CashFl' +
        'ow\Win32\Debug\dbcashflow.db'
      'DriverID=SQLite')
    LoginPrompt = False
    Left = 448
    Top = 112
  end
  object FDPhysSQLiteDriverLink: TFDPhysSQLiteDriverLink
    DriverID = 'SQLite'
    VendorLib = 
      'C:\Users\aluga.com\Documents\RAD Studio\Projects\CashFlow\sqlite' +
      '3.dll'
    Left = 328
    Top = 152
  end
  object SqlAux: TFDQuery
    Connection = FDConnection
    Left = 184
    Top = 168
  end
  object sqlAux2: TFDQuery
    Connection = FDConnection
    Left = 200
    Top = 288
  end
end
