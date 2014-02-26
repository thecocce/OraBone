object BlobDialog: TBlobDialog
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Load/Save Blob'
  ClientHeight = 63
  ClientWidth = 330
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
    Width = 330
    Height = 26
    Align = alClient
    BevelOuter = bvNone
    Padding.Left = 6
    Padding.Top = 6
    Padding.Right = 6
    Padding.Bottom = 6
    TabOrder = 0
    object DataSizeLabel: TLabel
      Left = 8
      Top = 10
      Width = 84
      Height = 13
      Caption = 'Data Size: %d KB'
    end
  end
  object BottomPanel: TPanel
    Left = 0
    Top = 26
    Width = 330
    Height = 37
    Align = alBottom
    BevelOuter = bvNone
    Padding.Left = 6
    Padding.Top = 6
    Padding.Right = 6
    Padding.Bottom = 6
    TabOrder = 1
    object LoadButton: TButton
      Left = 6
      Top = 6
      Width = 75
      Height = 25
      Align = alLeft
      Caption = 'Load'
      ModalResult = 6
      TabOrder = 0
    end
    object ClearButton: TButton
      Left = 87
      Top = 6
      Width = 75
      Height = 25
      Align = alLeft
      Caption = 'Clear'
      ModalResult = 3
      TabOrder = 1
    end
    object SaveButton: TButton
      Left = 168
      Top = 6
      Width = 75
      Height = 25
      Align = alRight
      Caption = 'Save'
      ModalResult = 7
      TabOrder = 2
    end
    object CancelButton: TButton
      Left = 249
      Top = 6
      Width = 75
      Height = 25
      Align = alRight
      Caption = 'Cancel'
      Default = True
      ModalResult = 2
      TabOrder = 3
    end
    object Separator1Panel: TPanel
      Left = 243
      Top = 6
      Width = 6
      Height = 25
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 4
    end
    object Panel1: TPanel
      Left = 81
      Top = 6
      Width = 6
      Height = 25
      Align = alLeft
      BevelOuter = bvNone
      TabOrder = 5
    end
  end
end
