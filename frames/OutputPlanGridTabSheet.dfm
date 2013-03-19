object OutputPlanGridFrame: TOutputPlanGridFrame
  Left = 0
  Top = 0
  Width = 320
  Height = 240
  TabOrder = 0
  object GridPanel: TPanel
    Left = 0
    Top = 0
    Width = 320
    Height = 240
    Align = alClient
    BevelOuter = bvNone
    Padding.Right = 2
    Padding.Bottom = 2
    ParentColor = True
    TabOrder = 0
    ExplicitHeight = 221
    object Grid: TBCDBGrid
      Left = 0
      Top = 0
      Width = 318
      Height = 238
      Align = alClient
      AllowedSelections = [gstRecordBookmarks, gstAll]
      DataGrouping.GroupLevels = <>
      DataSource = GridDataSource
      DrawGraphicData = True
      DrawMemoText = True
      Flat = False
      FooterColor = clWindow
      FooterFont.Charset = DEFAULT_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -11
      FooterFont.Name = 'Tahoma'
      FooterFont.Style = []
      IndicatorOptions = [gioShowRowIndicatorEh, gioShowRowselCheckboxesEh]
      Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
      OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghMultiSortMarking, dghRowHighlight, dghDialogFind, dghColumnResize, dghColumnMove, dghHotTrack]
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      object RowDetailData: TRowDetailPanelControlEh
      end
    end
  end
  object GridDataSource: TOraDataSource
    Left = 128
    Top = 78
  end
end
