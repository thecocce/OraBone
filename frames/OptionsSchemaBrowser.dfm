inherited OptionsSchemaBrowserFrame: TOptionsSchemaBrowserFrame
  Width = 133
  Height = 110
  AutoSize = True
  ParentFont = False
  Visible = False
  object Panel: TPanel
    AlignWithMargins = True
    Left = 4
    Top = 0
    Width = 129
    Height = 110
    Margins.Left = 4
    Margins.Top = 0
    Margins.Right = 0
    Margins.Bottom = 0
    AutoSize = True
    BevelOuter = bvNone
    Color = clWindow
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    TabOrder = 0
    object ButtonPanelAlignLabel: TLabel
      Left = 2
      Top = 68
      Width = 103
      Height = 16
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Button Panel Align'
    end
    object IndentLabel: TLabel
      Left = 2
      Top = 25
      Width = 36
      Height = 16
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Indent'
    end
    object ButtonPanelAlignComboBox: TBCComboBox
      Left = 0
      Top = 86
      Width = 64
      Height = 24
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
      Left = 0
      Top = 0
      Width = 129
      Height = 18
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = ' Show Tree Lines'
      TabOrder = 1
      AutoSize = True
      ReadOnly = False
    end
    object IndentEdit: TBCEdit
      Left = 0
      Top = 42
      Width = 64
      Height = 24
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
