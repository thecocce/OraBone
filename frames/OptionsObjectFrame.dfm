inherited OptionsObjectFrameFrame: TOptionsObjectFrameFrame
  Width = 312
  Height = 105
  Color = clWindow
  ParentBackground = False
  ParentColor = False
  Visible = False
  object Panel: TPanel
    Left = 0
    Top = 0
    Width = 312
    Height = 105
    BevelOuter = bvNone
    TabOrder = 0
    object ButtonPanelAlignLabel: TLabel
      Left = 6
      Top = 66
      Width = 87
      Height = 13
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Button Panel Align'
    end
    object ButtonPanelAlignComboBox: TBCComboBox
      Left = 4
      Top = 84
      Width = 64
      Height = 21
      TabOrder = 3
      Text = 'Bottom'
      Items.Strings = (
        'Bottom'
        'Top')
      DeniedKeyStrokes = True
      ReadOnly = False
      DropDownFixedWidth = 0
    end
    object ShowCreationAndModificationTimestampCheckBox: TBCCheckBox
      Left = 4
      Top = 0
      Width = 312
      Height = 21
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = ' Show Creation and Modification Timestamp'
      TabOrder = 0
      ReadOnly = False
    end
    object ShowDataSearchPanelCheckBox: TBCCheckBox
      Left = 4
      Top = 20
      Width = 312
      Height = 21
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = ' Show Data Search Panel'
      Checked = True
      State = cbChecked
      TabOrder = 1
      ReadOnly = False
    end
    object FilterOnTypingCheckBox: TBCCheckBox
      Left = 4
      Top = 40
      Width = 312
      Height = 21
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = ' Filter On Typing'
      Checked = True
      State = cbChecked
      TabOrder = 2
      ReadOnly = False
    end
  end
end
