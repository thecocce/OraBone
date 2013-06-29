object ObjectFrameFrame: TObjectFrameFrame
  Left = 0
  Top = 0
  Width = 451
  Height = 304
  Align = alClient
  TabOrder = 0
  Visible = False
  ExplicitWidth = 320
  ExplicitHeight = 240
  object Panel: TPanel
    Left = 0
    Top = 0
    Width = 451
    Height = 304
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitWidth = 320
    ExplicitHeight = 240
    object ButtonPanelAlignLabel: TLabel
      Left = 8
      Top = 8
      Width = 87
      Height = 13
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Button Panel Align'
    end
    object ButtonPanelAlignComboBox: TBCComboBox
      Left = 8
      Top = 26
      Width = 64
      Height = 21
      TabOrder = 0
      Text = 'Bottom'
      Items.Strings = (
        'Bottom'
        'Top')
      EditColor = clInfoBk
      DeniedKeyStrokes = True
      ReadOnly = False
      DropDownFixedWidth = 0
    end
  end
end
