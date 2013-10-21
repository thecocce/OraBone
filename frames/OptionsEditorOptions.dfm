object EditorOptionsFrame: TEditorOptionsFrame
  Left = 0
  Top = 0
  Width = 451
  Height = 302
  Align = alClient
  TabOrder = 0
  object Panel: TPanel
    Left = 0
    Top = 0
    Width = 451
    Height = 302
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object ExtraLinesLabel: TLabel
      Left = 11
      Top = 211
      Width = 53
      Height = 13
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Extra Lines'
    end
    object TabWidthLabel: TLabel
      Left = 9
      Top = 255
      Width = 49
      Height = 13
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Tab Width'
    end
    object ActiveLineColorBrightnessLabel: TLabel
      Left = 11
      Top = 299
      Width = 133
      Height = 13
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Active Line Color Brightness'
    end
    object InsertCaretLabel: TLabel
      Left = 11
      Top = 349
      Width = 59
      Height = 13
      Caption = 'Insert Caret'
    end
    object AutoIndentCheckBox: TBCCheckBox
      Left = 9
      Top = 6
      Width = 201
      Height = 21
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = ' Auto Indent'
      Checked = True
      State = cbChecked
      TabOrder = 0
      ReadOnly = False
    end
    object TrimTrailingSpacesCheckBox: TBCCheckBox
      Left = 9
      Top = 146
      Width = 201
      Height = 21
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = ' Trim Trailing Spaces'
      Checked = True
      State = cbChecked
      TabOrder = 7
      ReadOnly = False
    end
    object ScrollPastEofCheckBox: TBCCheckBox
      Left = 9
      Top = 46
      Width = 201
      Height = 21
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = ' Scroll Past End of File'
      TabOrder = 2
      ReadOnly = False
    end
    object ScrollPastEolCheckBox: TBCCheckBox
      Left = 9
      Top = 66
      Width = 198
      Height = 21
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = ' Scroll Past End of Line'
      Checked = True
      State = cbChecked
      TabOrder = 3
      ReadOnly = False
    end
    object ExtraLinesEdit: TBCEdit
      Left = 9
      Top = 226
      Width = 64
      Height = 21
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      TabOrder = 10
      Text = '0'
      EnterToTab = False
      OnlyNumbers = True
      NumbersWithDots = False
      NumbersWithSpots = False
      ErrorColor = 14803198
      NumbersAllowNegative = False
    end
    object TabWidthEdit: TBCEdit
      Left = 9
      Top = 270
      Width = 64
      Height = 21
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      TabOrder = 11
      Text = '8'
      EnterToTab = False
      OnlyNumbers = True
      NumbersWithDots = False
      NumbersWithSpots = False
      ErrorColor = 14803198
      NumbersAllowNegative = False
    end
    object BrightnessTrackBar: TTrackBar
      Left = 2
      Top = 314
      Width = 150
      Height = 27
      Min = 1
      Position = 2
      TabOrder = 12
    end
    object TabsToSpacesCheckBox: TBCCheckBox
      Left = 9
      Top = 126
      Width = 198
      Height = 21
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = ' Tabs to Spaces'
      Checked = True
      State = cbChecked
      TabOrder = 6
      ReadOnly = False
    end
    object AutoSaveCheckBox: TBCCheckBox
      Left = 9
      Top = 26
      Width = 201
      Height = 21
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = ' Auto Save'
      TabOrder = 1
      ReadOnly = False
    end
    object InsertCaretComboBox: TBCComboBox
      Left = 9
      Top = 365
      Width = 133
      Height = 21
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      DropDownCount = 9
      TabOrder = 13
      DeniedKeyStrokes = True
      ReadOnly = False
      DropDownFixedWidth = 0
    end
    object UndoAfterSaveCheckBox: TBCCheckBox
      Left = 9
      Top = 186
      Width = 201
      Height = 21
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = ' Undo After Save'
      TabOrder = 9
      ReadOnly = False
    end
    object SmartTabsCheckBox: TBCCheckBox
      Left = 9
      Top = 86
      Width = 201
      Height = 21
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = ' Smart Tabs'
      TabOrder = 4
      ReadOnly = False
    end
    object SmartTabDeleteCheckBox: TBCCheckBox
      Left = 9
      Top = 106
      Width = 201
      Height = 21
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = ' Smart Tab Delete'
      TabOrder = 5
      ReadOnly = False
    end
    object TripleClickRowSelectCheckBox: TBCCheckBox
      Left = 9
      Top = 166
      Width = 201
      Height = 21
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = ' Triple-Click Row Select'
      Checked = True
      State = cbChecked
      TabOrder = 8
      ReadOnly = False
    end
  end
end
