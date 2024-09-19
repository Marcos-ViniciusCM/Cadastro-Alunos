object frmCRUD: TfrmCRUD
  Left = 0
  Top = 0
  Caption = 'Cadastro de Alunos'
  ClientHeight = 471
  ClientWidth = 552
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  TextHeight = 15
  object lbMatricula: TLabel
    Left = 104
    Top = 115
    Width = 50
    Height = 15
    Caption = 'Matricula'
  end
  object lbNome: TLabel
    Left = 104
    Top = 152
    Width = 33
    Height = 15
    Caption = 'Nome'
  end
  object lbCurso: TLabel
    Left = 104
    Top = 181
    Width = 31
    Height = 15
    Caption = 'Curso'
  end
  object edtMatricula: TEdit
    Left = 176
    Top = 112
    Width = 57
    Height = 23
    MaxLength = 5
    TabOrder = 0
  end
  object edtNome: TEdit
    Left = 176
    Top = 145
    Width = 257
    Height = 23
    MaxLength = 40
    TabOrder = 1
  end
  object edtCurso: TEdit
    Left = 176
    Top = 178
    Width = 201
    Height = 23
    MaxLength = 30
    TabOrder = 2
  end
  object btEditar: TButton
    Left = 272
    Top = 16
    Width = 75
    Height = 25
    Caption = 'Editar'
    TabOrder = 3
    OnClick = btEditarClick
  end
  object btAdicionar: TButton
    Left = 176
    Top = 16
    Width = 75
    Height = 25
    Caption = 'Adiciona'
    TabOrder = 4
    OnClick = btAdicionarClick
  end
  object btCancelar: TButton
    Left = 272
    Top = 240
    Width = 75
    Height = 25
    Caption = 'Cancelar'
    TabOrder = 5
    OnClick = btCancelarClick
  end
  object btSalvar: TButton
    Left = 176
    Top = 240
    Width = 75
    Height = 25
    Caption = 'Salvar'
    TabOrder = 6
    OnClick = btSalvarClick
  end
  object btExcluir: TButton
    Left = 368
    Top = 16
    Width = 75
    Height = 25
    Caption = 'Excluir'
    TabOrder = 7
    OnClick = btExcluirClick
  end
  object btAnterior: TButton
    Left = 32
    Top = 16
    Width = 25
    Height = 25
    Caption = '<-'
    TabOrder = 8
    OnClick = btAnteriorClick
  end
  object btProximo: TButton
    Left = 80
    Top = 16
    Width = 25
    Height = 25
    Caption = '->'
    TabOrder = 9
    OnClick = btProximoClick
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 351
    Width = 552
    Height = 120
    Align = alBottom
    DataSource = dsAluno
    TabOrder = 10
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
  end
  object Conect: TSQLConnection
    ConnectionName = 'MySQLConnection'
    DriverName = 'MySQL'
    LoginPrompt = False
    Params.Strings = (
      'DriverName=MySQL'
      'HostName=localhost'
      'Database=escola'
      'User_Name=root'
      'Password=Marcos@123'
      'ServerCharSet='
      'BlobSize=-1'
      'ErrorResourceFile='
      'LocaleCode=0000'
      'Compressed=False'
      'Encrypted=False'
      'ConnectTimeout=60')
    Connected = True
    Left = 40
    Top = 400
  end
  object qrAluno: TSQLQuery
    Active = True
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select * from aluno')
    SQLConnection = Conect
    Left = 112
    Top = 416
  end
  object dsAluno: TDataSource
    DataSet = cdsAluno
    Left = 184
    Top = 416
  end
  object cdsAluno: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    ProviderName = 'dspAluno'
    Left = 328
    Top = 400
    object cdsAlunomatricula: TStringField
      DisplayWidth = 10
      FieldName = 'matricula'
      Size = 5
    end
    object cdsAlunonome: TStringField
      DisplayWidth = 40
      FieldName = 'nome'
      Size = 40
    end
    object cdsAlunocurso: TStringField
      DisplayWidth = 30
      FieldName = 'curso'
      Size = 30
    end
  end
  object dspAluno: TDataSetProvider
    DataSet = qrAluno
    Left = 248
    Top = 400
  end
  object qrCrud: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = Conect
    Left = 408
    Top = 392
  end
end
