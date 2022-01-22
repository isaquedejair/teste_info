object FCadastroCliente: TFCadastroCliente
  Left = 201
  Top = 220
  Anchors = [akRight, akBottom]
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsDialog
  ClientHeight = 471
  ClientWidth = 844
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 406
    Width = 844
    Height = 65
    Align = alBottom
    TabOrder = 2
    DesignSize = (
      844
      65)
    object BtnNovo: TBitBtn
      Left = 12
      Top = 16
      Width = 85
      Height = 33
      Cursor = crHandPoint
      Action = ANovo
      Caption = '&Novo'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
    end
    object BtnAlterar: TBitBtn
      Left = 103
      Top = 16
      Width = 85
      Height = 33
      Cursor = crHandPoint
      Action = AAlterar
      Caption = '&Alterar'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
    end
    object BtnExcluir: TBitBtn
      Left = 194
      Top = 16
      Width = 85
      Height = 33
      Cursor = crHandPoint
      Action = AExcluir
      Caption = '&Excluir'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
    end
    object BtnSalvar: TBitBtn
      Left = 550
      Top = 16
      Width = 85
      Height = 33
      Cursor = crHandPoint
      Action = ASalvar
      Anchors = [akTop, akRight]
      Caption = '&Salvar'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 5
    end
    object BtnCancelar: TBitBtn
      Left = 641
      Top = 16
      Width = 85
      Height = 33
      Cursor = crHandPoint
      Action = ACancelar
      Anchors = [akTop, akRight]
      Caption = '&Cancelar'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 6
    end
    object BtnSair: TBitBtn
      Left = 732
      Top = 16
      Width = 85
      Height = 33
      Cursor = crHandPoint
      Action = aSair
      Anchors = [akTop, akRight]
      Caption = 'Sa&ir'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 7
    end
    object btnControles: TBitBtn
      Left = 301
      Top = 16
      Width = 100
      Height = 33
      Cursor = crHandPoint
      Action = aControles
      Anchors = [akTop, akRight]
      Caption = 'Controles'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
    end
    object btnRelatorios: TBitBtn
      Left = 418
      Top = 16
      Width = 95
      Height = 33
      Cursor = crHandPoint
      Action = ARelatorios
      Anchors = [akTop, akRight]
      Caption = 'Relat'#243'rios'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
    end
  end
  object PnTopo: TPanel
    Left = 0
    Top = 0
    Width = 844
    Height = 76
    Align = alTop
    BevelOuter = bvNone
    Color = 1096699
    ParentBackground = False
    TabOrder = 0
    DesignSize = (
      844
      76)
    object LbDescricaoFormulario: TLabel
      Left = 19
      Top = 19
      Width = 551
      Height = 29
      AutoSize = False
      Caption = 'Cadastro de Clientes'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -24
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lbCodigo: TLabel
      Left = 19
      Top = 54
      Width = 48
      Height = 18
      Caption = 'C'#243'digo:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lbNome: TLabel
      Left = 164
      Top = 54
      Width = 44
      Height = 18
      Caption = 'Nome:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object btnPrior: TSpeedButton
      Left = 700
      Top = 21
      Width = 32
      Height = 35
      Cursor = crHandPoint
      Action = APrior
      Anchors = [akTop, akRight]
      ParentShowHint = False
      ShowHint = True
    end
    object btnFirst: TSpeedButton
      Left = 664
      Top = 21
      Width = 32
      Height = 35
      Cursor = crHandPoint
      Action = AFirst
      Anchors = [akTop, akRight]
      ParentShowHint = False
      ShowHint = True
    end
    object btnNext: TSpeedButton
      Left = 736
      Top = 21
      Width = 32
      Height = 35
      Cursor = crHandPoint
      Action = ANext
      Anchors = [akTop, akRight]
      ParentShowHint = False
      ShowHint = True
    end
    object btnLast: TSpeedButton
      Left = 772
      Top = 21
      Width = 33
      Height = 35
      Cursor = crHandPoint
      Action = ALast
      Anchors = [akTop, akRight]
      ParentShowHint = False
      ShowHint = True
    end
  end
  object Dados: TPanel
    Left = 0
    Top = 76
    Width = 844
    Height = 330
    Align = alClient
    TabOrder = 1
    DesignSize = (
      844
      330)
    object Label1: TLabel
      Left = 48
      Top = 48
      Width = 32
      Height = 13
      Caption = 'Label1'
    end
    object PcPrincipal: TPageControl
      Left = 5
      Top = 5
      Width = 833
      Height = 320
      ActivePage = TsCadastro
      Anchors = [akLeft, akTop, akRight, akBottom]
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnChange = PcPrincipalChange
      object TsCadastro: TTabSheet
        Caption = 'Cadastro'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        object Label12: TLabel
          Left = 13
          Top = 14
          Width = 39
          Height = 16
          Caption = 'C'#243'digo'
          FocusControl = edid_cliente
        end
        object Label2: TLabel
          Left = 77
          Top = 14
          Width = 33
          Height = 16
          Caption = 'Nome'
          FocusControl = ednome
        end
        object Label4: TLabel
          Left = 166
          Top = 60
          Width = 36
          Height = 16
          Caption = 'E-mail'
          FocusControl = edemail
        end
        object Label3: TLabel
          Left = 13
          Top = 60
          Width = 50
          Height = 16
          Caption = 'Telefone'
          FocusControl = edtelefone
        end
        object lbRG: TLabel
          Left = 634
          Top = 14
          Width = 16
          Height = 16
          Caption = 'RG'
          FocusControl = edrg
        end
        object lb1: TLabel
          Left = 442
          Top = 12
          Width = 22
          Height = 16
          Caption = 'CPF'
          FocusControl = edcpf
        end
        object edid_cliente: TDBEdit
          Left = 13
          Top = 33
          Width = 58
          Height = 24
          TabStop = False
          Color = 8421631
          DataField = 'id_cliente'
          DataSource = dsDados
          ReadOnly = True
          TabOrder = 0
        end
        object ednome: TDBEdit
          Tag = 555
          Left = 77
          Top = 33
          Width = 359
          Height = 24
          DataField = 'nome'
          DataSource = dsDados
          TabOrder = 1
        end
        object edemail: TDBEdit
          Left = 166
          Top = 82
          Width = 270
          Height = 24
          DataField = 'email'
          DataSource = dsDados
          TabOrder = 5
          OnExit = edemailExit
        end
        object edtelefone: TDBEdit
          Tag = 555
          Left = 13
          Top = 82
          Width = 147
          Height = 24
          DataField = 'telefone'
          DataSource = dsDados
          TabOrder = 4
        end
        object edrg: TDBEdit
          Left = 634
          Top = 33
          Width = 174
          Height = 24
          DataField = 'rg'
          DataSource = dsDados
          TabOrder = 3
        end
        object GroupBox1: TGroupBox
          Left = 13
          Top = 109
          Width = 795
          Height = 124
          Caption = 'Endere'#231'o'
          TabOrder = 6
          object Label6: TLabel
            Left = 130
            Top = 18
            Width = 65
            Height = 16
            Caption = 'Logradouro'
            FocusControl = edlogradouro
          end
          object Label7: TLabel
            Left = 703
            Top = 18
            Width = 45
            Height = 16
            Caption = 'N'#250'mero'
            FocusControl = ednumero
          end
          object Label8: TLabel
            Left = 16
            Top = 67
            Width = 79
            Height = 16
            Caption = 'Complemento'
            FocusControl = edcomplemento
          end
          object Label9: TLabel
            Left = 449
            Top = 67
            Width = 39
            Height = 16
            Caption = 'Cidade'
            FocusControl = edcidade
          end
          object Label10: TLabel
            Left = 605
            Top = 67
            Width = 15
            Height = 16
            Caption = 'UF'
            FocusControl = edestado
          end
          object Label11: TLabel
            Left = 16
            Top = 18
            Width = 22
            Height = 16
            Caption = 'CEP'
            FocusControl = edcep
          end
          object Label13: TLabel
            Left = 192
            Top = 67
            Width = 34
            Height = 16
            Caption = 'Bairro'
            FocusControl = edbairro
          end
          object Label5: TLabel
            Left = 642
            Top = 67
            Width = 23
            Height = 16
            Caption = 'Pais'
            FocusControl = edpais
          end
          object edlogradouro: TDBEdit
            Left = 130
            Top = 37
            Width = 567
            Height = 24
            DataField = 'logradouro'
            DataSource = dsDados
            TabOrder = 1
          end
          object ednumero: TDBEdit
            Left = 703
            Top = 37
            Width = 82
            Height = 24
            DataField = 'numero'
            DataSource = dsDados
            TabOrder = 2
          end
          object edcomplemento: TDBEdit
            Left = 16
            Top = 89
            Width = 170
            Height = 24
            DataField = 'complemento'
            DataSource = dsDados
            TabOrder = 3
          end
          object edcidade: TDBEdit
            Left = 449
            Top = 89
            Width = 150
            Height = 24
            DataField = 'cidade'
            DataSource = dsDados
            TabOrder = 5
          end
          object edestado: TDBEdit
            Left = 605
            Top = 89
            Width = 30
            Height = 24
            DataField = 'estado'
            DataSource = dsDados
            TabOrder = 6
          end
          object edcep: TDBEdit
            Left = 16
            Top = 37
            Width = 108
            Height = 24
            DataField = 'cep'
            DataSource = dsDados
            TabOrder = 0
            OnExit = edcepExit
          end
          object edbairro: TDBEdit
            Left = 192
            Top = 89
            Width = 251
            Height = 24
            DataField = 'bairro'
            DataSource = dsDados
            TabOrder = 4
          end
          object edpais: TDBEdit
            Left = 641
            Top = 89
            Width = 144
            Height = 24
            DataField = 'pais'
            DataSource = dsDados
            TabOrder = 7
          end
        end
        object edcpf: TDBEdit
          Tag = 555
          Left = 442
          Top = 33
          Width = 186
          Height = 24
          DataField = 'cpf'
          DataSource = dsDados
          TabOrder = 2
          OnExit = edcpfExit
        end
      end
      object TsConsulta: TTabSheet
        Caption = 'Consulta'
        ImageIndex = 1
        DesignSize = (
          825
          287)
        object lblLb1: TLabel
          Left = 9
          Top = 9
          Width = 67
          Height = 19
          Caption = 'Pesquisa:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblLb2: TLabel
          Left = 583
          Top = 9
          Width = 42
          Height = 19
          Anchors = [akTop, akRight]
          Caption = 'Filtro:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object EdPesquisa: TEdit
          Left = 82
          Top = 6
          Width = 479
          Height = 27
          Anchors = [akLeft, akTop, akRight]
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          OnChange = Pesquisar
        end
        object CbFiltro: TComboBox
          Left = 631
          Top = 6
          Width = 184
          Height = 27
          Cursor = crHandPoint
          Style = csDropDownList
          Anchors = [akTop, akRight]
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          OnChange = CbFiltroChange
        end
        object Grid: TDBGrid
          Left = 9
          Top = 39
          Width = 806
          Height = 209
          Anchors = [akLeft, akTop, akRight, akBottom]
          DataSource = dsDados
          DrawingStyle = gdsGradient
          GradientEndColor = clSilver
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
          ParentFont = False
          ReadOnly = True
          TabOrder = 2
          TitleFont.Charset = ANSI_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -15
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          OnDblClick = GridDblClick
          Columns = <
            item
              Expanded = False
              FieldName = 'id_cliente'
              Title.Alignment = taCenter
              Title.Caption = 'C'#243'digo'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'nome'
              Title.Alignment = taCenter
              Title.Caption = 'Nome'
              Width = 200
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'cpf'
              Title.Alignment = taCenter
              Title.Caption = 'CPF'
              Width = 109
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'rg'
              Title.Alignment = taCenter
              Title.Caption = 'RG'
              Width = 111
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'telefone'
              Title.Alignment = taCenter
              Title.Caption = 'Telefone'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'logradouro'
              Title.Alignment = taCenter
              Title.Caption = 'Logradouro'
              Width = 200
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'numero'
              Title.Alignment = taCenter
              Title.Caption = 'N'#250'mero'
              Width = 67
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'bairro'
              Title.Alignment = taCenter
              Title.Caption = 'Bairro'
              Width = 200
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'cidade'
              Title.Alignment = taCenter
              Title.Caption = 'Cidade'
              Width = 200
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'estado'
              Title.Alignment = taCenter
              Title.Caption = 'Estado'
              Width = 59
              Visible = True
            end>
        end
        object PnRegistros: TPanel
          Left = 598
          Top = 254
          Width = 217
          Height = 28
          Anchors = [akRight, akBottom]
          BevelInner = bvLowered
          Caption = 'Registros: 0'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          ParentBackground = False
          ParentFont = False
          TabOrder = 3
        end
      end
    end
  end
  object dsDados: TDataSource
    AutoEdit = False
    DataSet = dm.mtCliente
    OnStateChange = dsDadosStateChange
    OnDataChange = dsDadosDataChange
    Left = 467
    Top = 6
  end
  object alActions: TActionList
    Images = FMenu.ilBotoes16
    Left = 538
    Top = 7
    object AAlterar: TAction
      Category = 'Botoes'
      Caption = '&Alterar'
      Hint = 'Alterar Registro'
      ImageIndex = 1
      ShortCut = 114
      OnExecute = AAlterarExecute
    end
    object AExcluir: TAction
      Category = 'Botoes'
      Caption = '&Excluir'
      Hint = 'Excluir Registro'
      ImageIndex = 3
      ShortCut = 115
      OnExecute = AExcluirExecute
    end
    object ACancelar: TAction
      Category = 'Botoes'
      Caption = '&Cancelar'
      Hint = 'Cancelar o Cadastro'
      ImageIndex = 4
      ShortCut = 123
      OnExecute = ACancelarExecute
    end
    object ASalvar: TAction
      Category = 'Botoes'
      Caption = '&Salvar'
      Hint = 'Salvar o Cadastro'
      ImageIndex = 2
      ShortCut = 122
      OnExecute = ASalvarExecute
    end
    object ANovo: TAction
      Category = 'Botoes'
      Caption = '&Novo'
      Hint = 'Novo Registro'
      ImageIndex = 0
      ShortCut = 113
      OnExecute = ANovoExecute
    end
    object aSair: TAction
      Category = 'Botoes'
      Caption = 'Sa&ir'
      Hint = 'Sair do Formul'#225'rio'
      ImageIndex = 5
      ShortCut = 27
      OnExecute = aSairExecute
    end
    object aControles: TAction
      Category = 'Botoes'
      Caption = 'Controles'
      Hint = 'Abre o Menu Controle'
      ImageIndex = 8
      OnExecute = aControlesExecute
    end
    object ARelatorios: TAction
      Category = 'Botoes'
      Caption = 'Relat'#243'rios'
      Hint = 'Abre o Menu Relat'#243'rios'
      ImageIndex = 6
      Visible = False
    end
    object AFirst: TAction
      Category = 'Botoes'
      Hint = 'Primeiro Registro'
      ImageIndex = 15
      OnExecute = AFirstExecute
    end
    object APrior: TAction
      Category = 'Botoes'
      Hint = 'Registro Anterior'
      ImageIndex = 10
      OnExecute = APriorExecute
    end
    object ANext: TAction
      Category = 'Botoes'
      Hint = 'Pr'#243'ximo Registro'
      ImageIndex = 11
      OnExecute = ANextExecute
    end
    object ALast: TAction
      Category = 'Botoes'
      Hint = #218'ltimo Registro'
      ImageIndex = 12
      OnExecute = ALastExecute
    end
    object aGerarXML: TAction
      Caption = 'Gerar XML'
      OnExecute = aGerarXMLExecute
    end
    object aEnviarEmail: TAction
      Caption = 'Enviar E-mail'
      OnExecute = aEnviarEmailExecute
    end
  end
  object pmControles: TPopupMenu
    Left = 600
    Top = 6
    object EnviarEmail1: TMenuItem
      Action = aEnviarEmail
    end
  end
  object TmFecharForm: TTimer
    Enabled = False
    Interval = 1
    OnTimer = TmFecharFormTimer
    Left = 816
  end
end
