object OptionsSchemaBrowserFrame: TOptionsSchemaBrowserFrame
  Left = 0
  Top = 0
  Width = 451
  Height = 302
  Align = alClient
  TabOrder = 0
  Visible = False
  object Panel: TPanel
    Left = 0
    Top = 0
    Width = 451
    Height = 302
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object ButtonPanelAlignLabel: TLabel
      Left = 8
      Top = 74
      Width = 87
      Height = 13
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Button Panel Align'
    end
    object IndentLabel: TLabel
      Left = 8
      Top = 31
      Width = 32
      Height = 13
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Indent'
    end
    object ButtonPanelAlignComboBox: TBCComboBox
      Left = 8
      Top = 92
      Width = 64
      Height = 21
      TabOrder = 0
      Text = 'Bottom'
      Items.Strings = (
        'Bottom'
        'Top')
      DeniedKeyStrokes = True
      ReadOnly = False
      DropDownFixedWidth = 0
    end
    object ShowTreeLinesCheckBox: TBCCheckBox
      Left = 8
      Top = 6
      Width = 201
      Height = 21
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = ' Show Tree Lines'
      TabOrder = 1
      ReadOnly = False
    end
    object IndentEdit: TBCEdit
      Left = 8
      Top = 48
      Width = 64
      Height = 21
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      TabOrder = 2
      Text = '20'
      EnterToTab = False
      OnlyNumbers = True
      NumbersWithDots = False
      NumbersWithSpots = False
      ErrorColor = 14803198
      NumbersAllowNegative = False
    end
  end
end
