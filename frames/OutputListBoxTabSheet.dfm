object OutputListBoxFrame: TOutputListBoxFrame
  Left = 0
  Top = 0
  Width = 320
  Height = 240
  Color = clWindow
  ParentBackground = False
  ParentColor = False
  TabOrder = 0
  object Panel: TPanel
    Left = 0
    Top = 0
    Width = 320
    Height = 240
    Align = alClient
    BevelOuter = bvNone
    Color = clWindow
    Padding.Right = 2
    Padding.Bottom = 2
    ParentBackground = False
    TabOrder = 0
    object ListBox: TListBox
      Left = 0
      Top = 0
      Width = 318
      Height = 238
      Align = alClient
      ItemHeight = 13
      MultiSelect = True
      TabOrder = 0
    end
  end
end
