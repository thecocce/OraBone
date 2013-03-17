object OutputGridFrame: TOutputGridFrame
  Left = 0
  Top = 0
  Width = 320
  Height = 240
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
    ExplicitTop = 158
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
      ExplicitLeft = 287
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
    Padding.Right = 2
    Padding.Bottom = 2
    ParentColor = True
    TabOrder = 1
    ExplicitLeft = -131
    ExplicitTop = -64
    ExplicitWidth = 451
    ExplicitHeight = 304
    object Grid: TBCDBGrid
      Left = 0
      Top = 0
      Width = 318
      Height = 219
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
