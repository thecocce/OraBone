object OutputTreeViewFrame: TOutputTreeViewFrame
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
    Padding.Left = 1
    Padding.Top = 1
    Padding.Bottom = 2
    ParentBackground = False
    TabOrder = 0
    object VirtualDrawTree: TVirtualDrawTree
      Left = 1
      Top = 1
      Width = 319
      Height = 237
      Align = alClient
      Colors.GridLineColor = clScrollBar
      Ctl3D = True
      DragOperations = []
      Header.AutoSizeIndex = 0
      Header.Font.Charset = DEFAULT_CHARSET
      Header.Font.Color = clWindowText
      Header.Font.Height = -11
      Header.Font.Name = 'Tahoma'
      Header.Font.Style = []
      Header.MainColumn = -1
      Header.Options = []
      Indent = 16
      ParentCtl3D = False
      TabOrder = 0
      TreeOptions.AutoOptions = [toAutoDropExpand, toAutoScroll, toAutoScrollOnExpand, toAutoTristateTracking, toAutoDeleteMovedNodes, toAutoChangeScale]
      TreeOptions.MiscOptions = [toCheckSupport, toFullRepaintOnResize, toInitOnSave, toToggleOnDblClick, toWheelPanning]
      TreeOptions.PaintOptions = [toShowButtons, toShowRoot, toThemeAware, toUseBlendedSelection]
      OnInitNode = VirtualDrawTreeInitNode
      Columns = <>
    end
  end
end
