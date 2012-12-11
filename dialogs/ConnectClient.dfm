object ConnectClientDialog: TConnectClientDialog
  Left = 449
  Top = 115
  AutoSize = True
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Connect'
  ClientHeight = 153
  ClientWidth = 315
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = True
  Position = poOwnerFormCenter
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 315
    Height = 34
    Align = alTop
    BevelOuter = bvNone
    Padding.Left = 6
    Padding.Top = 10
    Padding.Right = 6
    Padding.Bottom = 3
    TabOrder = 0
    object UsernameLabel: TLabel
      Left = 10
      Top = 13
      Width = 52
      Height = 13
      Caption = 'User Name'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object UsernameEdit: TBCEdit
      Left = 89
      Top = 10
      Width = 220
      Height = 21
      Hint = 'Username'
      Flat = False
      ParentFlat = False
      Align = alRight
      CharCase = ecUpperCase
      TabOrder = 0
      OnlyNumbers = False
      NumbersWithDots = False
      NumbersWithSpots = False
      EditColor = clInfoBk
      NumbersAllowNegative = False
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 116
    Width = 315
    Height = 37
    Align = alBottom
    BevelOuter = bvNone
    Padding.Left = 6
    Padding.Top = 6
    Padding.Right = 6
    Padding.Bottom = 6
    TabOrder = 4
    object ConnectButton: TButton
      Left = 78
      Top = 6
      Width = 75
      Height = 25
      Action = ConnectAction
      Align = alRight
      Default = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
    object OKButton: TButton
      Left = 153
      Top = 6
      Width = 75
      Height = 25
      Align = alRight
      Caption = '&OK'
      Default = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ModalResult = 1
      ParentFont = False
      TabOrder = 1
    end
    object CancelButton: TButton
      Left = 234
      Top = 6
      Width = 75
      Height = 25
      Align = alRight
      Cancel = True
      Caption = 'Cancel'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ModalResult = 2
      ParentFont = False
      TabOrder = 2
    end
    object Separator1Panel: TPanel
      Left = 228
      Top = 6
      Width = 6
      Height = 25
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 3
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 34
    Width = 315
    Height = 27
    Align = alTop
    BevelOuter = bvNone
    Caption = 'Panel3'
    Padding.Left = 6
    Padding.Top = 3
    Padding.Right = 6
    Padding.Bottom = 3
    TabOrder = 1
    object PasswordLabel: TLabel
      Left = 10
      Top = 6
      Width = 46
      Height = 13
      Caption = 'Password'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object PasswordEdit: TBCEdit
      Left = 89
      Top = 3
      Width = 220
      Height = 21
      Hint = 'Password'
      Align = alRight
      ThemedPassword = True
      TabOrder = 0
      OnlyNumbers = False
      NumbersWithDots = False
      NumbersWithSpots = False
      EditColor = clInfoBk
      NumbersAllowNegative = False
    end
  end
  object Panel4: TPanel
    Left = 0
    Top = 61
    Width = 315
    Height = 27
    Align = alTop
    BevelOuter = bvNone
    Caption = 'Panel4'
    Padding.Left = 6
    Padding.Top = 3
    Padding.Right = 6
    Padding.Bottom = 3
    TabOrder = 2
    object DatabaserLabel: TLabel
      Left = 10
      Top = 6
      Width = 46
      Height = 13
      Caption = 'Database'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object DatabaseComboBox: TBCComboBox
      Left = 89
      Top = 3
      Width = 220
      Height = 21
      Align = alRight
      CharCase = ecUpperCase
      ReadOnly = False
      TabOrder = 0
      EditColor = clInfoBk
      DeniedKeyStrokes = False
      DropDownFixedWidth = 0
    end
  end
  object Panel5: TPanel
    Left = 0
    Top = 88
    Width = 315
    Height = 27
    Align = alTop
    BevelOuter = bvNone
    Caption = 'Panel5'
    Padding.Left = 6
    Padding.Top = 3
    Padding.Right = 6
    Padding.Bottom = 3
    TabOrder = 3
    object HomeLabel: TLabel
      Left = 10
      Top = 6
      Width = 27
      Height = 13
      Caption = 'Home'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object HomeComboBox: TBCComboBox
      Left = 89
      Top = 3
      Width = 220
      Height = 21
      Hint = 'Home'
      Align = alRight
      ReadOnly = False
      TabOrder = 0
      OnKeyPress = HomeComboBoxKeyPress
      EditColor = clInfoBk
      DeniedKeyStrokes = False
      DropDownFixedWidth = 0
    end
  end
  object ActionList: TActionList
    Left = 124
    Top = 16
    object ConnectAction: TAction
      Caption = '&Connect'
      OnExecute = ConnectActionExecute
    end
  end
end
