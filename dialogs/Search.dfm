object SearchDialog: TSearchDialog
  Left = 132
  Top = 168
  BorderStyle = bsDialog
  Caption = 'Search'
  ClientHeight = 135
  ClientWidth = 474
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnCloseQuery = FormCloseQuery
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object SearchForLabel: TLabel
    Left = 10
    Top = 15
    Width = 54
    Height = 13
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Caption = 'Search for:'
  end
  object SearchForComboBox: TComboBox
    Left = 94
    Top = 10
    Width = 280
    Height = 21
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    TabOrder = 0
    OnChange = SearchForComboBoxChange
  end
  object OptionsGroupBox: TGroupBox
    Left = 10
    Top = 43
    Width = 178
    Height = 80
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Caption = 'Options '
    TabOrder = 1
    object CaseSensitiveCheckBox: TCheckBox
      Left = 10
      Top = 20
      Width = 148
      Height = 21
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Case sensitivity'
      TabOrder = 0
    end
    object WholeWordsCheckBox: TCheckBox
      Left = 10
      Top = 48
      Width = 148
      Height = 21
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Whole words only'
      TabOrder = 1
    end
  end
  object DirectionRadioGroup: TRadioGroup
    Left = 196
    Top = 43
    Width = 178
    Height = 80
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Caption = 'Direction '
    ItemIndex = 0
    Items.Strings = (
      'Forward'
      'Backward')
    TabOrder = 2
  end
  object OkButton: TButton
    Left = 386
    Top = 10
    Width = 75
    Height = 25
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Caption = 'OK'
    Default = True
    Enabled = False
    ModalResult = 1
    TabOrder = 3
  end
  object CancelButton: TButton
    Left = 386
    Top = 43
    Width = 75
    Height = 25
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 4
  end
end
