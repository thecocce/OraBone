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
    Color = clWindow
    Padding.Left = 2
    Padding.Right = 2
    Padding.Bottom = 2
    ParentBackground = False
    TabOrder = 0
    object StatsTimeLabel: TLabel
      Left = 2
      Top = 0
      Width = 72
      Height = 17
      Align = alLeft
      Caption = 'StatsTimeLabel'
      ExplicitHeight = 13
    end
    object StatsRowsLabel: TLabel
      Left = 242
      Top = 0
      Width = 76
      Height = 17
      Align = alRight
      Caption = 'StatsRowsLabel'
      ExplicitHeight = 13
    end
  end
  object GridPanel: TPanel
    Left = 0
    Top = 0
    Width = 320
    Height = 221
    Align = alClient
    BevelOuter = bvNone
    Color = clWindow
    Padding.Right = 2
    Padding.Bottom = 2
    ParentBackground = False
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
      EditActions = [geaCutEh, geaCopyEh, geaPasteEh, geaDeleteEh, geaSelectAllEh]
      FooterParams.Color = clWindow
      IndicatorOptions = [gioShowRowIndicatorEh, gioShowRowselCheckboxesEh]
      IndicatorTitle.ShowDropDownSign = True
      IndicatorTitle.TitleButton = True
      IndicatorTitle.UseGlobalMenu = False
      Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
      OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghMultiSortMarking, dghRowHighlight, dghDialogFind, dghColumnResize, dghColumnMove, dghExtendVertLines]
      EditButtonsShowOptions = [sebShowOnlyForCurCellEh, sebShowOnlyForCurRowEh, sebShowOnlyWhenGridActiveEh, sebShowOnlyWhenDataEditingEh]
      TabOrder = 0
      OnAdvDrawDataCell = GridAdvDrawDataCell
      object RowDetailData: TRowDetailPanelControlEh
      end
    end
  end
  object GridDataSource: TOraDataSource
    Left = 128
    Top = 78
  end
end
