object CountryResource1: TCountryResource1
  OldCreateOrder = False
  Height = 260
  Width = 354
  object EmployeeConnection: TFDConnection
    Params.Strings = (
      'ConnectionDef=EMPLOYEE')
    LoginPrompt = False
    Left = 221
    Top = 36
  end
  object CountryTable: TFDQuery
    Connection = EmployeeConnection
    SQL.Strings = (
      'SELECT * FROM COUNTRY')
    Left = 221
    Top = 84
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Console'
    Left = 224
    Top = 160
  end
end
