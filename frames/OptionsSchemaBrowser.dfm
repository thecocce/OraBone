inherited OptionsSchemaBrowserFrame: TOptionsSchemaBrowserFrame
  Width = 201
  Height = 107
  Color = clWindow
  ParentBackground = False
  ParentColor = False
  Visible = False
  object Panel: TPanel
    Left = 0
    Top = 0
    Width = 201
    Height = 107
    BevelOuter = bvNone
    TabOrder = 0
    object ButtonPanelAlignLabel: TLabel
      Left = 6
      Top = 68
      Width = 87
      Height = 13
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Button Panel Align'
    end
    object IndentLabel: TLabel
      Left = 6
      Top = 25
      Width = 32
      Height = 13
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Indent'
    end
    object ButtonPanelAlignComboBox: TBCComboBox
      Left = 4
      Top = 86
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
      Left = 4
      Top = 0
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
      Left = 4
      Top = 42
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
