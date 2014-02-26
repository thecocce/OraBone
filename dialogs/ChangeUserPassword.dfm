object ChangeUserPasswordDialog: TChangeUserPasswordDialog
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Change Password'
  ClientHeight = 75
  ClientWidth = 288
  Color = clWindow
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object TopPanel: TPanel
    Left = 0
    Top = 0
    Width = 288
    Height = 39
    Align = alTop
    BevelOuter = bvNone
    Padding.Left = 6
    Padding.Top = 8
    Padding.Right = 6
    Padding.Bottom = 8
    TabOrder = 0
    object PasswordLabel: TLabel
      Left = 10
      Top = 12
      Width = 70
      Height = 13
      Caption = 'New Password'
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
      Left = 116
      Top = 8
      Width = 166
      Height = 23
      Hint = 'Password'
      Align = alRight
      TabOrder = 0
      EnterToTab = False
      OnlyNumbers = False
      NumbersWithDots = False
      NumbersWithSpots = False
      ErrorColor = 14803198
      NumbersAllowNegative = False
    end
  end
  object BottomPanel: TPanel
    Left = 0
    Top = 38
    Width = 288
    Height = 37
    Align = alBottom
    BevelOuter = bvNone
    Padding.Left = 6
    Padding.Top = 6
    Padding.Right = 6
    Padding.Bottom = 6
    TabOrder = 1
    object ExportButton: TButton
      Left = 126
      Top = 6
      Width = 75
      Height = 25
      Align = alRight
      Caption = 'OK'
      Default = True
      ModalResult = 1
      TabOrder = 0
    end
    object CancelButton: TButton
      Left = 207
      Top = 6
      Width = 75
      Height = 25
      Align = alRight
      Caption = 'Cancel'
      ModalResult = 2
      TabOrder = 1
    end
    object Separator1Panel: TPanel
      Left = 201
      Top = 6
      Width = 6
      Height = 25
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 2
    end
  end
end
