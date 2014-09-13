object OutputPlanGridFrame: TOutputPlanGridFrame
  Left = 0
  Top = 0
  Width = 320
  Height = 240
  Color = clWindow
  ParentBackground = False
  ParentColor = False
  TabOrder = 0
  object GridPanel: TPanel
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
    object Grid: TBCDBGrid
      Left = 0
      Top = 0
      Width = 318
      Height = 238
      Align = alClient
      AllowedSelections = [gstRecordBookmarks, gstAll]
      DataSource = GridDataSource
      DrawGraphicData = True
      DrawMemoText = True
      DynProps = <>
      FooterParams.Color = clWindow
      IndicatorOptions = [gioShowRowIndicatorEh, gioShowRowselCheckboxesEh]
      Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
      OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghMultiSortMarking, dghRowHighlight, dghDialogFind, dghColumnResize, dghColumnMove, dghHotTrack, dghExtendVertLines]
      ReadOnly = True
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
