inherited OptionsConnectionTabsFrame: TOptionsConnectionTabsFrame
  Width = 184
  Height = 138
  Visible = False
  ExplicitWidth = 184
  ExplicitHeight = 138
  object Panel: TPanel
    AlignWithMargins = True
    Left = 4
    Top = 0
    Width = 143
    Height = 137
    Margins.Left = 4
    Margins.Top = 0
    Margins.Right = 0
    Margins.Bottom = 0
    AutoSize = True
    BevelOuter = bvNone
    Color = clWindow
    ParentBackground = False
    TabOrder = 0
    object CloseTabByDblClickCheckBox: TBCCheckBox
      Left = 0
      Top = 0
      Width = 143
      Height = 17
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Close Tab by Double Click'
      TabOrder = 0
      LinkedControls = <>
    end
    object CloseTabByMiddleClickCheckBox: TBCCheckBox
      Left = 0
      Top = 20
      Width = 141
      Height = 17
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Close Tab by Middle-Click'
      TabOrder = 1
      LinkedControls = <>
    end
    object DoubleBufferedCheckBox: TBCCheckBox
      Left = 0
      Top = 40
      Width = 99
      Height = 17
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Double Buffered'
      Checked = True
      State = cbChecked
      TabOrder = 2
      LinkedControls = <>
    end
    object MultilineCheckBox: TBCCheckBox
      Left = 0
      Top = 60
      Width = 59
      Height = 17
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Multiline'
      TabOrder = 3
      LinkedControls = <>
    end
    object ShowCloseButtonCheckBox: TBCCheckBox
      Left = 0
      Top = 80
      Width = 111
      Height = 17
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Show Close Button'
      TabOrder = 4
      LinkedControls = <>
    end
    object ShowImageCheckBox: TBCCheckBox
      Left = 0
      Top = 100
      Width = 80
      Height = 17
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Show Image'
      TabOrder = 5
      LinkedControls = <>
    end
    object RightClickSelectCheckBox: TBCCheckBox
      Left = 0
      Top = 120
      Width = 102
      Height = 17
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Right Click Select'
      Checked = True
      State = cbChecked
      TabOrder = 6
      LinkedControls = <>
    end
  end
end
