object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Cadastro Cliente'
  ClientHeight = 368
  ClientWidth = 674
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object gpCliente: TGroupBox
    Left = 0
    Top = 0
    Width = 674
    Height = 368
    Align = alClient
    Caption = 'Cadastro'
    TabOrder = 0
    object labelStatus: TLabel
      Left = 304
      Top = 224
      Width = 52
      Height = 16
      Caption = 'Status: '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object labelStatusFinal: TLabel
      Left = 358
      Top = 224
      Width = 4
      Height = 16
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edtNome: TLabeledEdit
      Left = 16
      Top = 56
      Width = 121
      Height = 21
      EditLabel.Width = 27
      EditLabel.Height = 13
      EditLabel.Caption = 'Nome'
      TabOrder = 0
      OnExit = edtNomeExit
    end
    object edtIdade: TLabeledEdit
      Left = 16
      Top = 104
      Width = 121
      Height = 21
      EditLabel.Width = 28
      EditLabel.Height = 13
      EditLabel.Caption = 'Idade'
      TabOrder = 1
      OnExit = edtIdadeExit
    end
    object edtCPF: TLabeledEdit
      Left = 16
      Top = 152
      Width = 121
      Height = 21
      EditLabel.Width = 19
      EditLabel.Height = 13
      EditLabel.Caption = 'CPF'
      TabOrder = 2
      OnChange = edtCPFChange
      OnExit = edtCPFExit
    end
    object Button1: TButton
      Left = 16
      Top = 280
      Width = 177
      Height = 25
      Caption = 'Adicionar dados ao memo'
      TabOrder = 4
      OnClick = Button1Click
    end
    object memoDados: TMemo
      Left = 264
      Top = 36
      Width = 257
      Height = 149
      TabOrder = 6
    end
    object edtDataNascimento: TLabeledEdit
      Left = 16
      Top = 200
      Width = 121
      Height = 21
      EditLabel.Width = 96
      EditLabel.Height = 13
      EditLabel.Caption = 'Data de Nascimento'
      TabOrder = 3
      OnExit = edtDataNascimentoExit
    end
    object Button2: TButton
      Left = 16
      Top = 311
      Width = 137
      Height = 25
      Caption = 'Limpar Memo'
      TabOrder = 5
      OnClick = Button2Click
    end
  end
end
