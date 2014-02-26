object OutputDataGridFrame: TOutputDataGridFrame
  Left = 0
  Top = 0
  Width = 320
  Height = 240
  Color = clWindow
  ParentBackground = False
  ParentColor = False
  TabOrder = 0
  object StatisticsPanel: TPanel
    Left = 0
    Top = 221
    Width = 320
    Height = 19
    Align = alBottom
    BevelOuter = bvNone
    Padding.Left = 2
    Padding.Right = 2
    Padding.Bottom = 2
    ParentColor = True
    TabOrder = 0
    object StatsTimeLabel: TLabel
      Left = 2
      Top = 0
      Width = 72
      Height = 17
      Align = alLeft
      Caption = 'StatsTimeLabel'
    end
    object StatsRowsLabel: TLabel
      Left = 242
      Top = 0
      Width = 76
      Height = 17
      Align = alRight
      Caption = 'StatsRowsLabel'
    end
  end
  object GridPanel: TPanel
    Left = 0
    Top = 0
    Width = 320
    Height = 221
    Align = alClient
    BevelOuter = bvNone
    Padding.Right = 2
    Padding.Bottom = 2
    ParentColor = True
    TabOrder = 1
    object Grid: TBCDBGrid
      Left = 0
      Top = 0
      Width = 318
      Height = 219
      Align = alClient
      AllowedSelections = [gstRecordBookmarks, gstAll]
      DataSource = GridDataSource
      DrawGraphicData = True
      DrawMemoText = True
      DynProps = <>
      FooterParams.Color = clWindow
      GridLineParams.VertEmptySpaceStyle = dessNonEh
      IndicatorOptions = [gioShowRowselCheckboxesEh]
      Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
      OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghMultiSortMarking, dghRowHighlight, dghDialogFind, dghColumnResize, dghColumnMove, dghHotTrack]
      TabOrder = 0
      object RowDetailData: TRowDetailPanelControlEh
      end
    end
  end
  object GridDataSource: TOraDataSource
    Left = 128
    Top = 78
  end
end
