object ObjectFrameFrame: TObjectFrameFrame
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
      Left = 11
      Top = 72
      Width = 87
      Height = 13
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Button Panel Align'
    end
    object ButtonPanelAlignComboBox: TBCComboBox
      Left = 9
      Top = 90
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
      Left = 9
      Top = 6
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
      Left = 9
      Top = 26
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
      Left = 9
      Top = 46
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
