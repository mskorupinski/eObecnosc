object DBEngineModule: TDBEngineModule
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 298
  Width = 491
  object FDTransaction: TFDTransaction
    Connection = conn
    Left = 320
    Top = 176
  end
  object conn: TFDConnection
    Params.Strings = (
      'ResultMode=Use'
      'DriverID=MySQL')
    UpdateOptions.AssignedValues = [uvUpdateMode, uvRefreshMode, uvAutoCommitUpdates]
    UpdateOptions.AutoCommitUpdates = True
    Transaction = FDTransaction
    UpdateTransaction = FDTransaction
    Left = 400
    Top = 168
  end
  object driver: TFDPhysMySQLDriverLink
    Left = 336
    Top = 88
  end
end
