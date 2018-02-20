object ServerMethods1: TServerMethods1
  OldCreateOrder = False
  Height = 236
  Width = 309
  object EmployeeConnection: TFDConnection
    Params.Strings = (
      'ConnectionDef=EMPLOYEE')
    LoginPrompt = False
    Left = 174
    Top = 44
  end
  object CountryTable: TFDQuery
    Connection = EmployeeConnection
    SQL.Strings = (
      'SELECT * FROM COUNTRY')
    Left = 174
    Top = 108
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Console'
    Left = 176
    Top = 168
  end
end
