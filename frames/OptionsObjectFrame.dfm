inherited OptionsObjectFrameFrame: TOptionsObjectFrameFrame
  Width = 231
  Height = 105
  AutoSize = True
  Visible = False
  object Panel: TPanel
    AlignWithMargins = True
    Left = 4
    Top = 0
    Width = 227
    Height = 105
    Margins.Left = 4
    Margins.Top = 0
    Margins.Right = 0
    Margins.Bottom = 0
    AutoSize = True
    BevelOuter = bvNone
    Color = clWindow
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    TabOrder = 0
    object ButtonPanelAlignLabel: TLabel
      Left = 2
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
      Left = 0
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
      Left = 0
      Top = 0
      Width = 227
      Height = 15
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = ' Show Creation and Modification Timestamp'
      TabOrder = 0
      AutoSize = True
      ReadOnly = False
    end
    object ShowDataSearchPanelCheckBox: TBCCheckBox
      Left = 0
      Top = 20
      Width = 139
      Height = 15
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = ' Show Data Search Panel'
      Checked = True
      State = cbChecked
      TabOrder = 1
      AutoSize = True
      ReadOnly = False
    end
    object FilterOnTypingCheckBox: TBCCheckBox
      Left = 0
      Top = 40
      Width = 98
      Height = 15
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = ' Filter On Typing'
      Checked = True
      Color = clWindow
      ParentColor = False
      State = cbChecked
      TabOrder = 2
      AutoSize = True
      ReadOnly = False
    end
  end
end
