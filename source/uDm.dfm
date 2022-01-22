object dm: Tdm
  OldCreateOrder = False
  Height = 216
  Width = 381
  object mtCliente: TFDMemTable
    AfterInsert = mtClienteAfterInsert
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 152
    Top = 64
    object mtClientenome: TStringField
      FieldName = 'nome'
      Size = 150
    end
    object mtClientecpf: TStringField
      FieldName = 'cpf'
      EditMask = '999.999.999-99;0;_'
      Size = 30
    end
    object mtClienterg: TStringField
      FieldName = 'rg'
      Size = 30
    end
    object mtClientetelefone: TStringField
      FieldName = 'telefone'
      EditMask = '(99)99999-9999;0;_'
      Size = 16
    end
    object mtClienteemail: TStringField
      FieldName = 'email'
      Size = 150
    end
    object mtClientecep: TStringField
      FieldName = 'cep'
      EditMask = '00000\-999;0;_'
    end
    object mtClientelogradouro: TStringField
      FieldName = 'logradouro'
      Size = 150
    end
    object mtClientenumero: TStringField
      FieldName = 'numero'
      Size = 10
    end
    object mtClientecomplemento: TStringField
      FieldName = 'complemento'
      Size = 100
    end
    object mtClientebairro: TStringField
      FieldName = 'bairro'
      Size = 150
    end
    object mtClientecidade: TStringField
      FieldName = 'cidade'
      Size = 100
    end
    object mtClienteestado: TStringField
      FieldName = 'estado'
      Size = 2
    end
    object mtClientepais: TStringField
      FieldName = 'pais'
      Size = 100
    end
    object mtClienteid_cliente: TUnsignedAutoIncField
      FieldName = 'id_cliente'
    end
  end
  object FDStanStorageXMLLink1: TFDStanStorageXMLLink
    Left = 168
    Top = 120
  end
end
