object TableBrowserFrame: TTableBrowserFrame
  Left = 0
  Top = 0
  Width = 451
  Height = 304
  Align = alClient
  Ctl3D = False
  ParentCtl3D = False
  TabOrder = 0
  ExplicitWidth = 844
  ExplicitHeight = 536
  object TablePageControl: TBCPageControl
    Left = 0
    Top = 0
    Width = 451
    Height = 304
    ActivePage = DataTabSheet
    Align = alClient
    DoubleBuffered = False
    ParentDoubleBuffered = False
    PopupMenu = PageControlPopupMenu
    TabOrder = 0
    OnChange = TablePageControlChange
    TabDragDrop = False
    HoldShiftToDragDrop = False
    ExplicitWidth = 844
    ExplicitHeight = 536
    object ColumnsTabSheet: TTabSheet
      Caption = 'Columns'
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object ColumnsPanel: TPanel
        Left = 0
        Top = 0
        Width = 836
        Height = 486
        Align = alClient
        BevelOuter = bvNone
        Padding.Right = 2
        Padding.Bottom = 2
        TabOrder = 0
        object ColumnsDBGrid: TBCDBGrid
          Left = 0
          Top = 0
          Width = 834
          Height = 484
          Align = alClient
          AllowedSelections = [gstRecordBookmarks, gstAll]
          Ctl3D = True
          DataGrouping.GroupLevels = <>
          DataSource = ColumnsDataSource
          DrawGraphicData = True
          DrawMemoText = True
          Flat = False
          FooterColor = clWindow
          FooterFont.Charset = DEFAULT_CHARSET
          FooterFont.Color = clWindowText
          FooterFont.Height = -11
          FooterFont.Name = 'Tahoma'
          FooterFont.Style = []
          IndicatorOptions = []
          Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
          OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghRowHighlight, dghDialogFind, dghColumnResize, dghColumnMove]
          ParentCtl3D = False
          STFilter.InstantApply = False
          STFilter.Location = stflInTitleFilterEh
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
      object ColumnsButtonPanel: TPanel
        Left = 0
        Top = 486
        Width = 836
        Height = 22
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 1
        object Bevel3: TBevel
          AlignWithMargins = True
          Left = 52
          Top = 2
          Width = 4
          Height = 18
          Margins.Left = 6
          Margins.Top = 2
          Margins.Bottom = 2
          Align = alLeft
          Shape = bsLeftLine
          ExplicitLeft = 82
        end
        object JvToolBar5: TBCToolBar
          Left = 0
          Top = 0
          Width = 46
          Height = 22
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          Align = alLeft
          Caption = 'SourceToolBar'
          Images = ImageList
          TabOrder = 0
          Transparent = True
          object ToolButton25: TToolButton
            Left = 0
            Top = 0
            Action = AlterTableAction
          end
          object ToolButton26: TToolButton
            Left = 23
            Top = 0
            Action = AnalyzeTableAction
          end
        end
        object BCToolBar1: TBCToolBar
          Left = 59
          Top = 0
          Width = 23
          Height = 22
          Align = alLeft
          Images = ImageList
          TabOrder = 1
          object ToolButton2: TToolButton
            Left = 0
            Top = 0
            Action = RefreshAction
          end
        end
      end
    end
    object SourceTabSheet: TTabSheet
      Caption = 'Source'
      ImageIndex = 10
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object SourcePanel: TPanel
        Left = 0
        Top = 0
        Width = 836
        Height = 486
        Align = alClient
        BevelOuter = bvNone
        Padding.Right = 2
        Padding.Bottom = 1
        TabOrder = 0
        object SourceSynEdit: TSynEdit
          Left = 0
          Top = 0
          Width = 834
          Height = 485
          Align = alClient
          Ctl3D = True
          ParentCtl3D = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = []
          TabOrder = 0
          Gutter.AutoSize = True
          Gutter.Font.Charset = DEFAULT_CHARSET
          Gutter.Font.Color = clWindowText
          Gutter.Font.Height = -11
          Gutter.Font.Name = 'Courier New'
          Gutter.Font.Style = []
          Gutter.ShowLineNumbers = True
          Gutter.Gradient = True
          Highlighter = SynSQLSyn
          Options = [eoAutoIndent, eoDragDropEditing, eoEnhanceEndKey, eoGroupUndo, eoShowScrollHint, eoSmartTabDelete, eoSmartTabs, eoTabsToSpaces, eoTrimTrailingSpaces]
          ReadOnly = True
          WantTabs = True
        end
      end
      object SourceButtonPanel: TPanel
        Left = 0
        Top = 486
        Width = 836
        Height = 22
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 1
        object Bevel4: TBevel
          AlignWithMargins = True
          Left = 75
          Top = 2
          Width = 4
          Height = 18
          Margins.Left = 6
          Margins.Top = 2
          Margins.Bottom = 2
          Align = alLeft
          Shape = bsLeftLine
          ExplicitLeft = 82
        end
        object Bevel5: TBevel
          AlignWithMargins = True
          Left = 111
          Top = 2
          Width = 4
          Height = 18
          Margins.Left = 6
          Margins.Top = 2
          Margins.Bottom = 2
          Align = alLeft
          Shape = bsLeftLine
          ExplicitLeft = 142
          ExplicitTop = 4
        end
        object SourceToolBar: TBCToolBar
          Left = 0
          Top = 0
          Width = 69
          Height = 22
          Align = alLeft
          Caption = 'SourceToolBar'
          Images = ImageList
          TabOrder = 0
          object SQLEditorToolButton: TToolButton
            Left = 0
            Top = 0
            Action = SQLEditorAction
          end
          object ToolButton11: TToolButton
            Left = 23
            Top = 0
            Action = CopyToClipboardAction
          end
          object ToolButton12: TToolButton
            Left = 46
            Top = 0
            Action = SaveToFileAction
          end
        end
        object BCToolBar2: TBCToolBar
          Left = 118
          Top = 0
          Width = 23
          Height = 22
          Align = alLeft
          Caption = 'SourceToolBar'
          Images = ImageList
          TabOrder = 1
          object ToolButton3: TToolButton
            Left = 0
            Top = 0
            Action = RefreshAction
          end
        end
        object BCToolBar10: TBCToolBar
          Left = 82
          Top = 0
          Width = 23
          Height = 22
          Align = alLeft
          Caption = 'BCToolBar10'
          Images = ImageList
          TabOrder = 2
          object ToolButton28: TToolButton
            Left = 0
            Top = 0
            Action = SourceOptionsAction
          end
        end
      end
    end
    object DataTabSheet: TTabSheet
      Caption = 'Data'
      ImageIndex = 1
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object DataPanel: TPanel
        Left = 0
        Top = 0
        Width = 836
        Height = 486
        Align = alClient
        BevelOuter = bvNone
        Padding.Right = 2
        Padding.Bottom = 1
        TabOrder = 0
        object DataDBGrid: TBCDBGrid
          Left = 0
          Top = 0
          Width = 834
          Height = 485
          Align = alClient
          AllowedSelections = [gstRecordBookmarks, gstAll]
          Ctl3D = True
          DataGrouping.GroupLevels = <>
          DataSource = DataDataSource
          DrawGraphicData = True
          DrawMemoText = True
          EditActions = [geaCutEh, geaCopyEh, geaPasteEh, geaDeleteEh, geaSelectAllEh]
          Flat = False
          FooterColor = clWindow
          FooterFont.Charset = DEFAULT_CHARSET
          FooterFont.Color = clWindowText
          FooterFont.Height = -11
          FooterFont.Name = 'Tahoma'
          FooterFont.Style = []
          IndicatorTitle.UseGlobalMenu = False
          IndicatorOptions = [gioShowRowselCheckboxesEh]
          Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
          OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghMultiSortMarking, dghRowHighlight, dghDialogFind, dghColumnResize, dghColumnMove, dghHotTrack]
          ParentCtl3D = False
          PopupMenu = DataPopupMenu
          EditButtonsShowOptions = [sebShowOnlyForCurCellEh, sebShowOnlyForCurRowEh, sebShowOnlyWhenGridActiveEh, sebShowOnlyWhenDataEditingEh]
          STFilter.InstantApply = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          OnDblClick = DataDBGridDblClick
          OnDrawDataCell = DataDBGridDrawDataCell
          OnMouseDown = DataDBGridMouseDown
          OnSelectionChanged = DataDBGridSelectionChanged
          OnTitleClick = DataDBGridTitleClick
          object RowDetailData: TRowDetailPanelControlEh
          end
        end
      end
      object DataButtonPanel: TPanel
        Left = 0
        Top = 486
        Width = 836
        Height = 22
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 1
        object Bevel1: TBevel
          AlignWithMargins = True
          Left = 82
          Top = 2
          Width = 4
          Height = 18
          Margins.Left = 6
          Margins.Top = 2
          Margins.Bottom = 2
          Align = alLeft
          Shape = bsLeftLine
        end
        object Bevel2: TBevel
          AlignWithMargins = True
          Left = 141
          Top = 2
          Width = 4
          Height = 18
          Margins.Left = 6
          Margins.Top = 2
          Margins.Bottom = 2
          Align = alLeft
          Shape = bsLeftLine
        end
        object DataToolBar: TBCToolBar
          Left = 0
          Top = 0
          Width = 76
          Height = 22
          Align = alLeft
          DoubleBuffered = False
          Images = ImageList
          GradientDrawingOptions = []
          ParentDoubleBuffered = False
          TabOrder = 0
          Transparent = True
          object ToolButton7: TToolButton
            Left = 0
            Top = 0
            Action = SortAction
            DropdownMenu = SortDropDownMenu
            Style = tbsDropDown
          end
          object ToolButton1: TToolButton
            Left = 38
            Top = 0
            Action = FilterAction
            DropdownMenu = FilterDropDownMenu
            Style = tbsDropDown
          end
        end
        object DataDBNavigator: TDBNavigator
          Left = 668
          Top = 0
          Width = 168
          Height = 22
          DataSource = DataDataSource
          VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete]
          Align = alRight
          Flat = True
          Kind = dbnHorizontal
          ConfirmDelete = False
          TabOrder = 1
          BeforeAction = DataDBNavigatorBeforeAction
        end
        object CommitRollbackToolBar: TBCToolBar
          Left = 89
          Top = 0
          Width = 46
          Height = 22
          Align = alLeft
          Images = ImageList
          TabOrder = 2
          object ToolButton43: TToolButton
            Left = 0
            Top = 0
            Action = CommitAction
          end
          object ToolButton45: TToolButton
            Left = 23
            Top = 0
            Action = RollbackAction
          end
        end
        object RefreshToolbar: TBCToolBar
          Left = 148
          Top = 0
          Width = 23
          Height = 22
          Align = alLeft
          Images = ImageList
          TabOrder = 3
          object ToolButton46: TToolButton
            Left = 0
            Top = 0
            Action = RefreshAction
          end
        end
      end
    end
    object ConstraintsTabSheet: TTabSheet
      Caption = 'Constraints'
      ImageIndex = 2
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object ConstraintSplitter: TSplitter
        Left = 0
        Top = 315
        Width = 836
        Height = 2
        Cursor = crVSplit
        Align = alBottom
        ExplicitTop = 243
        ExplicitWidth = 796
      end
      object ConstraintsClientPanel: TPanel
        Left = 0
        Top = 0
        Width = 836
        Height = 315
        Align = alClient
        BevelOuter = bvNone
        Padding.Right = 2
        TabOrder = 0
        object ConstraintsDBGrid: TBCDBGrid
          Left = 0
          Top = 0
          Width = 834
          Height = 291
          Align = alClient
          AllowedSelections = [gstRecordBookmarks, gstAll]
          Ctl3D = True
          DataGrouping.GroupLevels = <>
          DataSource = ConstraintsDataSource
          DrawMemoText = True
          Flat = False
          FooterColor = clWindow
          FooterFont.Charset = DEFAULT_CHARSET
          FooterFont.Color = clWindowText
          FooterFont.Height = -11
          FooterFont.Name = 'Tahoma'
          FooterFont.Style = []
          IndicatorOptions = [gioShowRowselCheckboxesEh]
          Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
          OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghDialogFind, dghColumnResize, dghColumnMove]
          ParentCtl3D = False
          ReadOnly = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          OnSelectionChanged = ConstraintsDBGridSelectionChanged
          object RowDetailData: TRowDetailPanelControlEh
          end
        end
        object ConstraintButtonPanel: TPanel
          Left = 0
          Top = 291
          Width = 834
          Height = 24
          Align = alBottom
          BevelOuter = bvNone
          Padding.Top = 2
          TabOrder = 1
          object Bevel6: TBevel
            AlignWithMargins = True
            Left = 52
            Top = 4
            Width = 4
            Height = 18
            Margins.Left = 6
            Margins.Top = 2
            Margins.Bottom = 2
            Align = alLeft
            Shape = bsLeftLine
            ExplicitLeft = 82
            ExplicitTop = 2
          end
          object Bevel7: TBevel
            AlignWithMargins = True
            Left = 111
            Top = 4
            Width = 4
            Height = 18
            Margins.Left = 6
            Margins.Top = 2
            Margins.Bottom = 2
            Align = alLeft
            Shape = bsLeftLine
            ExplicitLeft = 127
            ExplicitTop = 5
          end
          object ConstraintToolBar: TBCToolBar
            Left = 0
            Top = 2
            Width = 46
            Height = 22
            Align = alLeft
            Caption = 'SourceToolBar'
            Images = ImageList
            TabOrder = 0
            object ToolButton13: TToolButton
              Left = 0
              Top = 0
              Action = CreateConstraintAction
            end
            object ToolButton14: TToolButton
              Left = 23
              Top = 0
              Action = DropConstraintAction
            end
          end
          object BCToolBar3: TBCToolBar
            Left = 59
            Top = 2
            Width = 46
            Height = 22
            Align = alLeft
            Caption = 'BCToolBar3'
            Images = ImageList
            TabOrder = 1
            object ToolButton4: TToolButton
              Left = 0
              Top = 0
              Action = EnableConstraintAction
            end
            object ToolButton5: TToolButton
              Left = 23
              Top = 0
              Action = DisableConstraintAction
            end
          end
          object BCToolBar4: TBCToolBar
            Left = 118
            Top = 2
            Width = 23
            Height = 22
            Align = alLeft
            Images = ImageList
            TabOrder = 2
            object ToolButton6: TToolButton
              Left = 0
              Top = 0
              Action = RefreshAction
            end
          end
        end
      end
      object ConstraintBottomPanel: TPanel
        Left = 0
        Top = 317
        Width = 836
        Height = 191
        Align = alBottom
        BevelOuter = bvNone
        Padding.Right = 2
        Padding.Bottom = 1
        TabOrder = 1
        object ConstraintColumnsDBGrid: TBCDBGrid
          Left = 0
          Top = 0
          Width = 834
          Height = 190
          Align = alClient
          AllowedSelections = [gstRecordBookmarks, gstAll]
          Ctl3D = True
          DataGrouping.GroupLevels = <>
          DataSource = ConstraintColumnsDataSource
          DrawMemoText = True
          Flat = False
          FooterColor = clWindow
          FooterFont.Charset = DEFAULT_CHARSET
          FooterFont.Color = clWindowText
          FooterFont.Height = -11
          FooterFont.Name = 'Tahoma'
          FooterFont.Style = []
          IndicatorOptions = []
          Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghDialogFind, dghColumnResize, dghColumnMove]
          ParentCtl3D = False
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
    end
    object TriggersTabSheet: TTabSheet
      Caption = 'Triggers'
      ImageIndex = 3
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object TriggersSplitter: TSplitter
        Left = 0
        Top = 165
        Width = 836
        Height = 2
        Cursor = crVSplit
        Align = alTop
        ExplicitWidth = 796
      end
      object TriggersTopPanel: TPanel
        Left = 0
        Top = 0
        Width = 836
        Height = 165
        Align = alTop
        BevelOuter = bvNone
        Padding.Right = 2
        TabOrder = 0
        object TriggersDBGrid: TBCDBGrid
          Left = 0
          Top = 0
          Width = 834
          Height = 141
          Align = alClient
          AllowedSelections = [gstRecordBookmarks, gstAll]
          Ctl3D = True
          DataGrouping.GroupLevels = <>
          DataSource = TriggersDataSource
          DrawMemoText = True
          Flat = False
          FooterColor = clWindow
          FooterFont.Charset = DEFAULT_CHARSET
          FooterFont.Color = clWindowText
          FooterFont.Height = -11
          FooterFont.Name = 'Tahoma'
          FooterFont.Style = []
          IndicatorOptions = [gioShowRowselCheckboxesEh]
          Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
          OptionsEh = [dghFixed3D, dghHighlightFocus, dghDialogFind, dghColumnResize, dghColumnMove]
          ParentCtl3D = False
          ReadOnly = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          OnSelectionChanged = TriggersDBGridSelectionChanged
          object RowDetailData: TRowDetailPanelControlEh
          end
        end
        object TriggersButtonPanel: TPanel
          Left = 0
          Top = 141
          Width = 834
          Height = 24
          Align = alBottom
          BevelOuter = bvNone
          Padding.Top = 2
          TabOrder = 1
          object Bevel8: TBevel
            AlignWithMargins = True
            Left = 52
            Top = 4
            Width = 4
            Height = 18
            Margins.Left = 6
            Margins.Top = 2
            Margins.Bottom = 2
            Align = alLeft
            Shape = bsLeftLine
            ExplicitLeft = 127
            ExplicitTop = 5
          end
          object Bevel9: TBevel
            AlignWithMargins = True
            Left = 111
            Top = 4
            Width = 4
            Height = 18
            Margins.Left = 6
            Margins.Top = 2
            Margins.Bottom = 2
            Align = alLeft
            Shape = bsLeftLine
            ExplicitLeft = 127
            ExplicitTop = 5
          end
          object TriggersToolBar: TBCToolBar
            Left = 0
            Top = 2
            Width = 46
            Height = 22
            Align = alLeft
            Caption = 'SourceToolBar'
            Images = ImageList
            TabOrder = 0
            object ToolButton16: TToolButton
              Left = 0
              Top = 0
              Action = CreateTriggerAction
            end
            object ToolButton17: TToolButton
              Left = 23
              Top = 0
              Action = DropTriggerAction
            end
          end
          object BCToolBar5: TBCToolBar
            Left = 59
            Top = 2
            Width = 46
            Height = 22
            Align = alLeft
            Caption = 'BCToolBar5'
            Images = ImageList
            TabOrder = 1
            object ToolButton10: TToolButton
              Left = 0
              Top = 0
              Action = EnableTriggerAction
            end
            object ToolButton15: TToolButton
              Left = 23
              Top = 0
              Action = DisableTriggerAction
            end
          end
          object BCToolBar6: TBCToolBar
            Left = 118
            Top = 2
            Width = 23
            Height = 22
            Align = alLeft
            Images = ImageList
            TabOrder = 2
            object ToolButton8: TToolButton
              Left = 0
              Top = 0
              Action = RefreshAction
            end
          end
        end
      end
      object TriggersBottomPanel: TPanel
        Left = 0
        Top = 167
        Width = 836
        Height = 341
        Align = alClient
        BevelOuter = bvNone
        Padding.Right = 2
        Padding.Bottom = 1
        TabOrder = 1
        object TriggerSynEdit: TSynEdit
          Left = 0
          Top = 0
          Width = 834
          Height = 340
          Align = alClient
          Ctl3D = True
          ParentCtl3D = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = []
          TabOrder = 0
          Gutter.AutoSize = True
          Gutter.Font.Charset = DEFAULT_CHARSET
          Gutter.Font.Color = clWindowText
          Gutter.Font.Height = -11
          Gutter.Font.Name = 'Courier New'
          Gutter.Font.Style = []
          Gutter.ShowLineNumbers = True
          Gutter.Gradient = True
          Highlighter = SynSQLSyn
          Options = [eoAutoIndent, eoDragDropEditing, eoEnhanceEndKey, eoGroupUndo, eoShowScrollHint, eoSmartTabDelete, eoSmartTabs, eoTabsToSpaces, eoTrimTrailingSpaces]
          ReadOnly = True
          WantTabs = True
        end
      end
    end
    object IndexesTabSheet: TTabSheet
      Caption = 'Indexes'
      ImageIndex = 4
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object IndexesPanel: TPanel
        Left = 0
        Top = 0
        Width = 836
        Height = 486
        Align = alClient
        BevelOuter = bvNone
        Padding.Right = 2
        Padding.Bottom = 1
        TabOrder = 0
        object IndexesDBGrid: TBCDBGrid
          Left = 0
          Top = 0
          Width = 834
          Height = 485
          Align = alClient
          AllowedSelections = [gstRecordBookmarks, gstAll]
          Ctl3D = True
          DataGrouping.GroupLevels = <>
          DataSource = IndexesDataSource
          DrawMemoText = True
          Flat = False
          FooterColor = clWindow
          FooterFont.Charset = DEFAULT_CHARSET
          FooterFont.Color = clWindowText
          FooterFont.Height = -11
          FooterFont.Name = 'Tahoma'
          FooterFont.Style = []
          IndicatorOptions = [gioShowRowselCheckboxesEh]
          Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
          OptionsEh = [dghFixed3D, dghHighlightFocus, dghDialogFind, dghColumnResize, dghColumnMove]
          ParentCtl3D = False
          ReadOnly = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          OnSelectionChanged = IndexesDBGridSelectionChanged
          object RowDetailData: TRowDetailPanelControlEh
          end
        end
      end
      object IndexesButtonPanel: TPanel
        Left = 0
        Top = 486
        Width = 836
        Height = 22
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 1
        object Bevel10: TBevel
          AlignWithMargins = True
          Left = 52
          Top = 2
          Width = 4
          Height = 18
          Margins.Left = 6
          Margins.Top = 2
          Margins.Bottom = 2
          Align = alLeft
          Shape = bsLeftLine
          ExplicitLeft = 127
          ExplicitTop = 5
        end
        object JvToolBar2: TBCToolBar
          Left = 0
          Top = 0
          Width = 46
          Height = 22
          Align = alLeft
          Caption = 'SourceToolBar'
          Images = ImageList
          TabOrder = 0
          object ToolButton19: TToolButton
            Left = 0
            Top = 0
            Action = CreateIndexAction
          end
          object ToolButton20: TToolButton
            Left = 23
            Top = 0
            Action = DropIndexAction
          end
        end
        object BCToolBar7: TBCToolBar
          Left = 59
          Top = 0
          Width = 23
          Height = 22
          Align = alLeft
          Images = ImageList
          TabOrder = 1
          object ToolButton9: TToolButton
            Left = 0
            Top = 0
            Action = RefreshAction
          end
        end
      end
    end
    object GrantsTabSheet: TTabSheet
      Caption = 'Grants'
      ImageIndex = 7
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object GrantsPanel: TPanel
        Left = 0
        Top = 0
        Width = 836
        Height = 486
        Align = alClient
        BevelOuter = bvNone
        Padding.Right = 2
        Padding.Bottom = 1
        TabOrder = 0
        object GrantsDBGrid: TBCDBGrid
          Left = 0
          Top = 0
          Width = 834
          Height = 485
          Align = alClient
          AllowedSelections = [gstRecordBookmarks, gstAll]
          Ctl3D = True
          DataGrouping.GroupLevels = <>
          DataSource = GrantsDataSource
          DrawMemoText = True
          Flat = False
          FooterColor = clWindow
          FooterFont.Charset = DEFAULT_CHARSET
          FooterFont.Color = clWindowText
          FooterFont.Height = -11
          FooterFont.Name = 'Tahoma'
          FooterFont.Style = []
          IndicatorOptions = [gioShowRowselCheckboxesEh]
          Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
          OptionsEh = [dghFixed3D, dghHighlightFocus, dghDialogFind, dghColumnResize, dghColumnMove]
          ParentCtl3D = False
          ReadOnly = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          OnSelectionChanged = GrantsDBGridSelectionChanged
          object RowDetailData: TRowDetailPanelControlEh
          end
        end
      end
      object GrantsButtonPanel: TPanel
        Left = 0
        Top = 486
        Width = 836
        Height = 22
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 1
        object Bevel11: TBevel
          AlignWithMargins = True
          Left = 52
          Top = 2
          Width = 4
          Height = 18
          Margins.Left = 6
          Margins.Top = 2
          Margins.Bottom = 2
          Align = alLeft
          Shape = bsLeftLine
          ExplicitLeft = 127
          ExplicitTop = 5
        end
        object JvToolBar3: TBCToolBar
          Left = 0
          Top = 0
          Width = 46
          Height = 22
          Align = alLeft
          Caption = 'SourceToolBar'
          Images = ImageList
          TabOrder = 0
          object ToolButton21: TToolButton
            Left = 0
            Top = 0
            Action = GrantPrivilegesAction
          end
          object ToolButton22: TToolButton
            Left = 23
            Top = 0
            Action = RevokePrivilegesAction
          end
        end
        object BCToolBar8: TBCToolBar
          Left = 59
          Top = 0
          Width = 23
          Height = 22
          Align = alLeft
          Images = ImageList
          TabOrder = 1
          object ToolButton18: TToolButton
            Left = 0
            Top = 0
            Action = RefreshAction
          end
        end
      end
    end
    object SynonymsTabSheet: TTabSheet
      Caption = 'Synonyms'
      ImageIndex = 9
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object SynonymsPanel: TPanel
        Left = 0
        Top = 0
        Width = 836
        Height = 486
        Align = alClient
        BevelOuter = bvNone
        Padding.Right = 2
        Padding.Bottom = 1
        TabOrder = 0
        object SynonymsDBGrid: TBCDBGrid
          Left = 0
          Top = 0
          Width = 834
          Height = 485
          Align = alClient
          AllowedSelections = [gstRecordBookmarks, gstAll]
          Ctl3D = True
          DataGrouping.GroupLevels = <>
          DataSource = SynonymsDataSource
          DrawMemoText = True
          Flat = False
          FooterColor = clWindow
          FooterFont.Charset = DEFAULT_CHARSET
          FooterFont.Color = clWindowText
          FooterFont.Height = -11
          FooterFont.Name = 'Tahoma'
          FooterFont.Style = []
          IndicatorOptions = [gioShowRowselCheckboxesEh]
          Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
          OptionsEh = [dghFixed3D, dghHighlightFocus, dghDialogFind, dghColumnResize, dghColumnMove]
          ParentCtl3D = False
          ReadOnly = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          OnSelectionChanged = SynonymsDBGridSelectionChanged
          object RowDetailData: TRowDetailPanelControlEh
          end
        end
      end
      object SynonymsButtonPanel: TPanel
        Left = 0
        Top = 486
        Width = 836
        Height = 22
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 1
        object Bevel12: TBevel
          AlignWithMargins = True
          Left = 52
          Top = 2
          Width = 4
          Height = 18
          Margins.Left = 6
          Margins.Top = 2
          Margins.Bottom = 2
          Align = alLeft
          Shape = bsLeftLine
          ExplicitLeft = 127
          ExplicitTop = 5
        end
        object JvToolBar4: TBCToolBar
          Left = 0
          Top = 0
          Width = 46
          Height = 22
          Align = alLeft
          Caption = 'SourceToolBar'
          Images = ImageList
          TabOrder = 0
          object ToolButton23: TToolButton
            Left = 0
            Top = 0
            Action = CreateSynonymAction
          end
          object ToolButton24: TToolButton
            Left = 23
            Top = 0
            Action = DropSynonymAction
          end
        end
        object BCToolBar9: TBCToolBar
          Left = 59
          Top = 0
          Width = 23
          Height = 22
          Align = alLeft
          Images = ImageList
          TabOrder = 1
          object ToolButton27: TToolButton
            Left = 0
            Top = 0
            Action = RefreshAction
          end
        end
      end
    end
    object ReferencedByTabSheet: TTabSheet
      Caption = 'Referenced By'
      ImageIndex = 5
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object ReferencedByPanel: TPanel
        Left = 0
        Top = 0
        Width = 836
        Height = 486
        Align = alClient
        BevelOuter = bvNone
        Padding.Right = 2
        Padding.Bottom = 1
        TabOrder = 0
        object ReferencedByDBGrid: TBCDBGrid
          Left = 0
          Top = 0
          Width = 834
          Height = 485
          Align = alClient
          AllowedSelections = [gstRecordBookmarks, gstAll]
          Ctl3D = True
          DataGrouping.GroupLevels = <>
          DataSource = ReferencedByDataSource
          DrawMemoText = True
          Flat = False
          FooterColor = clWindow
          FooterFont.Charset = DEFAULT_CHARSET
          FooterFont.Color = clWindowText
          FooterFont.Height = -11
          FooterFont.Name = 'Tahoma'
          FooterFont.Style = []
          IndicatorOptions = []
          Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghDialogFind, dghColumnResize, dghColumnMove]
          ParentCtl3D = False
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
      object ReferencedByButtonPanel: TPanel
        Left = 0
        Top = 486
        Width = 836
        Height = 22
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 1
        object ReferencedByToolBar: TBCToolBar
          Left = 0
          Top = 0
          Width = 23
          Height = 22
          Align = alLeft
          Caption = 'SourceToolBar'
          Images = ImageList
          TabOrder = 0
          object ToolButton44: TToolButton
            Left = 0
            Top = 0
            Action = RefreshAction
          end
        end
      end
    end
    object ReferencesTabSheet: TTabSheet
      Caption = 'References'
      ImageIndex = 8
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object ReferencesPanel: TPanel
        Left = 0
        Top = 0
        Width = 836
        Height = 486
        Align = alClient
        BevelOuter = bvNone
        Padding.Right = 2
        Padding.Bottom = 1
        TabOrder = 0
        object ReferencesDBGrid: TBCDBGrid
          Left = 0
          Top = 0
          Width = 834
          Height = 485
          Align = alClient
          AllowedSelections = [gstRecordBookmarks, gstAll]
          Ctl3D = True
          DataGrouping.GroupLevels = <>
          DataSource = ReferencesDataSource
          DrawMemoText = True
          Flat = False
          FooterColor = clWindow
          FooterFont.Charset = DEFAULT_CHARSET
          FooterFont.Color = clWindowText
          FooterFont.Height = -11
          FooterFont.Name = 'Tahoma'
          FooterFont.Style = []
          IndicatorOptions = []
          Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghDialogFind, dghColumnResize, dghColumnMove]
          ParentCtl3D = False
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
      object ReferencesButtonPanel: TPanel
        Left = 0
        Top = 486
        Width = 836
        Height = 22
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 1
        object ReferencesToolBar: TBCToolBar
          Left = 0
          Top = 0
          Width = 23
          Height = 22
          Align = alLeft
          Caption = 'SourceToolBar'
          Images = ImageList
          TabOrder = 0
          object ToolButton41: TToolButton
            Left = 0
            Top = 0
            Action = RefreshAction
          end
        end
      end
    end
    object DependenciesTabSheet: TTabSheet
      Caption = 'Dependencies'
      ImageIndex = 6
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object DependenciesPanel: TPanel
        Left = 0
        Top = 0
        Width = 836
        Height = 486
        Align = alClient
        BevelOuter = bvNone
        Padding.Right = 2
        Padding.Bottom = 1
        TabOrder = 0
        object DependenciesDBGrid: TBCDBGrid
          Left = 0
          Top = 0
          Width = 834
          Height = 485
          Align = alClient
          AllowedSelections = [gstRecordBookmarks, gstAll]
          Ctl3D = True
          DataGrouping.GroupLevels = <>
          DataSource = DependenciesDataSource
          DrawMemoText = True
          Flat = False
          FooterColor = clWindow
          FooterFont.Charset = DEFAULT_CHARSET
          FooterFont.Color = clWindowText
          FooterFont.Height = -11
          FooterFont.Name = 'Tahoma'
          FooterFont.Style = []
          IndicatorOptions = []
          Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghDialogFind, dghColumnResize, dghColumnMove]
          ParentCtl3D = False
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
      object DependenciesButtonPanel: TPanel
        Left = 0
        Top = 486
        Width = 836
        Height = 22
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 1
        object DependenciesToolBar: TBCToolBar
          Left = 0
          Top = 0
          Width = 23
          Height = 22
          Align = alLeft
          Caption = 'SourceToolBar'
          Images = ImageList
          TabOrder = 0
          object ToolButton42: TToolButton
            Left = 0
            Top = 0
            Action = RefreshAction
          end
        end
      end
    end
  end
  object ColumnsQuery: TOraQuery
    SQL.Strings = (
      
        'SELECT   s.column_id "ID", RPAD (s.column_name, 30) "Column Name' +
        '",'
      '         RPAD (   s.data_type'
      '               || DECODE (s.data_type,'
      
        '                          '#39'VARCHAR2'#39', '#39'('#39' || TO_CHAR (s.data_len' +
        'gth) || '#39')'#39','
      
        '                          '#39'RAW'#39', '#39'('#39' || TO_CHAR (s.data_length) ' +
        '|| '#39')'#39', '
      
        '                          '#39'CHAR'#39', '#39'('#39' || TO_CHAR (s.data_length)' +
        ' || '#39')'#39','
      
        '                          '#39'NCHAR'#39', '#39'('#39' || TO_CHAR (s.data_length' +
        ') || '#39')'#39', '
      
        '                          '#39'NVARCHAR2'#39', '#39'('#39' || TO_CHAR (s.data_le' +
        'ngth) || '#39')'#39', '
      '                          '#39'NUMBER'#39', DECODE (s.data_precision,'
      '                                            '#39#39', '#39#39','
      
        '                                            '#39'('#39' || TO_CHAR (s.da' +
        'ta_precision) || DECODE(s.data_scale, '#39'0'#39', '#39#39', '#39', '#39' || TO_CHAR (' +
        's.data_scale)) || '#39')'#39
      '                                           )'
      '                         ),'
      '               14'
      '              ) "Data Type",'
      
        '         RPAD(co.pk, 1) "Pk", DECODE (s.nullable, '#39'Y'#39', '#39'Null'#39', '#39 +
        'Not null'#39') "Nullable", s.data_default "Default",'
      '         c.comments "Comments"'
      '    FROM all_col_comments c,'
      '         all_tab_columns s,'
      '         (SELECT b.position pk, b.column_name'
      '            FROM all_constraints a, all_cons_columns b'
      '           WHERE a.table_name = :p_table_name'
      '             AND a.constraint_name = b.constraint_name'
      '             AND a.constraint_type = '#39'P'#39
      '             AND a.owner = :p_owner'
      '             AND b.owner = :p_owner) co'
      '   WHERE c.table_name = s.table_name'
      '     AND c.column_name = s.column_name'
      '     AND s.table_name = :p_table_name'
      '     AND co.column_name(+) = c.column_name'
      '     AND s.owner = :p_owner'
      '     AND c.owner = :p_owner'
      'ORDER BY s.column_id')
    FetchAll = True
    ReadOnly = True
    AutoCommit = False
    Left = 44
    Top = 68
    ParamData = <
      item
        DataType = ftString
        Name = 'p_table_name'
        Value = 'INV_LASKU'
      end
      item
        DataType = ftUnknown
        Name = 'p_owner'
      end>
  end
  object ColumnsDataSource: TOraDataSource
    DataSet = ColumnsQuery
    Left = 46
    Top = 120
  end
  object DataDataSource: TOraDataSource
    Left = 42
    Top = 200
  end
  object SQLStringHolder: TJvMultiStringHolder
    MultipleStrings = <
      item
        Name = 'IndexesDescendSQL'
        Strings.Strings = (
          'SELECT   dic.index_name "Index Name",'
          '         di.uniqueness "Uniqueness",'
          '         INITCAP(di.status) "Status",'
          '         dic.descend "Order",        '
          '         dic.column_position "Position", '
          '         dic.column_name "Column Name", '
          '         di.logging "Logging", '
          '         di.degree "Degree"'
          '    FROM all_indexes di, all_ind_columns dic'
          '   WHERE dic.table_name = di.table_name'
          '     AND dic.index_name = di.index_name'
          '     AND dic.table_name = :p_table_name'
          '     AND di.owner = :p_owner'
          '     AND dic.index_owner = :p_owner'
          'ORDER BY dic.index_name, dic.column_position')
      end
      item
        Name = 'IndexesSQL'
        Strings.Strings = (
          'SELECT   dic.index_name "Index Name",'
          '         di.uniqueness "Uniqueness",'
          '         INITCAP(di.status) "Status",'
          '         dic.column_position "Position", '
          '         dic.column_name "Column Name", '
          '         di.logging "Logging", '
          '         di.degree "Degree"'
          '    FROM all_indexes di, all_ind_columns dic'
          '   WHERE dic.table_name = di.table_name'
          '     AND dic.index_name = di.index_name'
          '     AND dic.table_name = :p_table_name'
          '     AND di.owner = :p_owner'
          '     AND dic.index_owner = :p_owner'
          'ORDER BY dic.index_name, dic.column_position')
      end
      item
        Name = 'TriggersSQL'
        Strings.Strings = (
          'SELECT   description, trigger_body'
          '    FROM all_triggers'
          '   WHERE table_name = :p_table_name'
          '     AND owner = :p_owner')
      end
      item
        Name = 'ReferencedBy1SQL'
        Strings.Strings = (
          'SELECT t.table_name, t.constraint_name, tc.column_name '
          '  FROM all_constraints  t, all_cons_columns tc '
          'WHERE t.table_name = :p_table_name'
          '     AND t.constraint_type in ('#39'P'#39', '#39'U'#39') '
          '     AND tc.constraint_name = t.constraint_name'
          '     AND t.owner = :p_owner'
          '    AND tc.owner = t.owner'
          'ORDER BY t.constraint_name, tc.position')
      end
      item
        Name = 'ReferencedBy2SQL'
        Strings.Strings = (
          'SELECT t.table_name, t.constraint_name, tc.column_name'
          '  FROM all_constraints t, all_cons_columns tc'
          ' WHERE t.constraint_type = '#39'R'#39
          '   AND tc.constraint_name = t.constraint_name'
          '   AND t.owner = :p_owner'
          '   AND tc.owner = t.owner'
          '   AND t.r_constraint_name = :p_constraint_name '
          'ORDER BY t.table_name DESC, tc.position')
      end
      item
        Name = 'References1SQL'
        Strings.Strings = (
          
            'SELECT t.table_name, t.constraint_name, t.r_constraint_name, tc.' +
            'column_name '
          '  FROM all_constraints  t, all_cons_columns tc '
          'WHERE t.table_name = :p_table_name'
          '     AND t.constraint_type= '#39'R'#39
          '     AND tc.constraint_name = t.constraint_name'
          '     AND t.owner = :p_owner'
          '    AND tc.owner = t.owner'
          'ORDER BY t.constraint_name, tc.position')
      end
      item
        Name = 'References2SQL'
        Strings.Strings = (
          'SELECT t.table_name, t.constraint_name, tc.column_name'
          '  FROM all_constraints t, all_cons_columns tc'
          ' WHERE tc.constraint_name = t.constraint_name'
          '   AND t.owner = :p_owner'
          '   AND tc.owner = t.owner'
          '   AND t.constraint_name = :p_constraint_name '
          'ORDER BY t.table_name DESC, tc.position')
      end
      item
        Name = 'DescendTestSQL'
        Strings.Strings = (
          'SELECT descend FROM all_ind_columns')
      end>
    Left = 536
    Top = 306
  end
  object ImageList: TBCImageList
    Left = 22
    Top = 36
    Bitmap = {
      494C01011D0000046C0410001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000008000000001002000000000000080
      0000000000000000000000000000000000000000000000000000000000008E5D
      59008E5D59008E5D59008E5D59008E5D59008E5D59008E5D59008E5D59008E5D
      59008E5D59008E5D59008E5D59008E5D59000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000009665
      5C00FCF7EE00FCF4E900FAF2E300FAEEDC00F8EBD500F7E7CF00F6E3C700F6E0
      C100F4DDBA00F2D9B200F2D5AC0080504B000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000A36F
      6200FCFBF600FEF8F000FCF4EB00FBF2E500FAEFDE00F8EDD800F8E7D000F7E6
      CA00F6E1C400F4DEBD00F2DAB60080504B000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000B17D
      6700FFFEFB00FEFBF700D5AC9700811E0000D4AA8F00FAF0E100FAEEDA00811E
      0000F6E6CC00F4E3C700F4E0C00080504B000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C189
      6B00FFFFFF00FEFEFC00811E0000FEFAF400811E0000FBF4E900FBF2E300811E
      0000F8EBD700F7E7CF00F6E3C90080504B000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000D197
      7000FFFFFF00FFFFFF00811E0000FEFCFA00811E0000FEF8F000811E0000811E
      0000FAF0E000F8EBD900F7E9D30080504B000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000DEA4
      7600FFFFFF00FFFFFF00D7B09E00811E0000D7AF9C00FEFBF700FCF8F300811E
      0000FBF3E900FAF0E100F8EDDC0080504B000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000E7AB
      7900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00093D8300FFFCFA00FEFA
      F400FCF7F000FBF4EA00FBF2E50080504B000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000093D
      8300093D8300CF8E6800CF8E6800CF8E6800CF8E6800093D8300CF8E6800CF8E
      6800CF8E6800CF8E6800CF8E680080504B000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000093D83000A56
      BF00093D83000000000000000000000000000A4DAA00093D8300000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000093D83000B64E000409C
      FF00093D8300093D8300093D8300093D83000A51B400093D8300000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000093D83000C73FF004AA3FF002B8E
      FF001079FF000B6AEE000A5CCE000B5DD000093D830000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000093D83000F78FF003696FF00167F
      FF000B6CF3000A5AC9000A4DAA00093D83000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000093D83000B5DD0000C70
      FE00093D8300093D8300093D8300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000093D83000A45
      9600093D83000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000093D
      8300093D83000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000893615007D3213007D3213007D32
      13007D3213007D3213007D3213007D3213007D3213007D3213007D3213007D32
      13007D3213007D3213007D321300893615000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000CA680000CA68
      0000CA680000CA680000CA680000CA680000CA680000CA680000CA680000CA68
      0000CA680000CA6800000000000000000000692A1100FEF3E700FFEFE0006E6C
      6A00FBE7CF00FBE7CF006E6C6A00FEDDBA00FEDDBA006E6C6A00FCD3A700FBCE
      9C006E6C6A00FCCB9700FCCB97007D3213000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CA680000FFF4E700FFE7
      CF00FFE5C900FFE2C200FFE0BD00FFDDB600FFDAB100FFD7AD00FFD5A900FFD4
      A5000527FF00FFD9B100CA6800000000000065281000EFE7DD006E6C6A006E6C
      6A006E6C6A006E6C6A006E6C6A006E6C6A006E6C6A006E6C6A006E6C6A006E6C
      6A006E6C6A006E6C6A006E6C6A00762F12000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CA680000FFEEDE003F3F
      3F003F3F3F00FEDDBA003F3F3F003F3F3F003F3F3F003F3F3F00FFD0A0000527
      FF000527FF000527FF00CA68000000000000652810006E6C6A006E6C6A003C5A
      F7000B8A09006CB75C00FEE9D200FBE7CF00FEE2C400FEDDBA00FDDAB400FCD7
      AD00FCD3A700E9CC9500FBCE9C00762F12000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CA680000FFF2E5003F3F
      3F00FFE3C600FEE0C000FEDDBA00FEDAB400FED8AF00FED5A900FFD3A400FED0
      A0000527FF00FFD4A600CA6800000000000065281000FEF3E7006E6C6A002243
      FB00326E9F000B8A090073BA6000FBE7CF00FEE2C400FEE2C400FDDAB400FDDA
      B40047A030000B8A0900168E0E0050420C000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CA680000FFF6EB00FEEA
      D100FEE6CB00D1987400983D1600A0472000C1784E0090310C00E3AB7E00FED3
      A500FED0A100FFD7AA00CA6800000000000065280F006E6C6A006E6C6A00C6CC
      F2000F31FC00FEF3E7002E9E2800FEE9D200FBE7CF00FEE2C400FEDDBA0081B6
      5D000B8A0900FCD3A700FCD3A7005F3A0F000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CA680000FFFAF2003F3F
      3F00FFE9D100A0492300DAA68300FFE1C000C1795000A0471F00FED8B000FED5
      AA003F3F3F00FFD8AD00CA6800000000000065280F00FFF6EE006E6C6A00FEF9
      F2004D69F7001652A600148F1400EEE5D300BFBBDA00D5C9CF00BCCC90000A89
      070083AC72000525FB00485BDC00762F12000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CA680000FFFCF8003F3F
      3F00FEEDD900D39C7A0091330E00C17D5600C17B5300A0472000FEDCB500FED9
      AF003F3F3F00FFDAB400CA68000000000000652810006E6C6A006E6C6A00FEF9
      F200FEF9F2002849FA0004653900056E2A000F31FC000C2DFA000C84110047A0
      30001635F300546ACB001635F3005E2D2D000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CA680000FFFFFE003F3F
      3F00FFEFE000EDCCB400E5BA9E00DAA98800C17D5600A0482100FFDEBB00FEDC
      B5003F3F3F00FFDDBA00CA6800000000000065280F00FFFCFA006E6C6A00FFFC
      FA00FEF9F200FFF6EE00E1DDEA00148F1400FEEED900FEE9D20001760F000A3B
      C100405ADE00FDDAB4009191C200642D24000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CA680000FFFFFF003F3F
      3F00FFF3E500E5BFA600A04B2600DCAB8C00B8704A00B0633B00FFE2C200FEDE
      BB003F3F3F00FFE0C000CA68000000000000692A11006E6C6A006E6C6A00FFFC
      FA00FEF9F200FEF9F200FFF6EE00DCE5C5001D9519000B8A090041955300465E
      E900EED5C100FDDAB400FDDAB4007D3213000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CA680000FFFFFF00FFF8
      F000FFF4EB00FFF2E500DAB09300C1815E00CA8E6B00FEE7CE00FFE5C700FEE1
      C200FFDEBB00FFE3C500CA680000000000009E512300CB934600C68C4100C68C
      4100C68C4100C68C4100C68C4100C68C4100C68C4100C68C4100CD995100CB93
      4600CD995100C1914E00BB955C00A15222000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CA680000FFFFFF003F3F
      3F00FFF7F000FFF4EB00FEF3E600FEF0E000FFEEDA00FFEAD500FEE7CE00FEE5
      C7003F3F3F00FFE6CB00CA6800000000000099411500CE641400CE641400CE64
      1400CE641400CE641400CE641400CE641400CE641400D1681800F3A96600E070
      1100F3A966009F6339003553C700A6420C000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CA680000FFFFFF003F3F
      3F003F3F3F00FFF8F0003F3F3F003F3F3F003F3F3F003F3F3F00FEEBD4003F3F
      3F003F3F3F00FFEAD300CA680000000000000000000093401A0093401A009340
      1A0093401A0093401A0093401A0093401A0093401A0093401A0099441C00953E
      150099441C008C3C1A00843D2400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CA680000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFEFB00FFFBF400FFF7EF00FFF4
      E700FFF0E100FFF7EE00CA680000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000CA680000CA68
      0000CA680000CA680000CA680000CA680000CA680000CA680000CA680000CA68
      0000CA680000CA68000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000005669500056695000566
      9500000000000000000000000000000000000000000000008200000082000000
      0000000000000000820000008200000000000000000000000000000000000000
      00000000000000000000000000000000000000000000035A0500035A0500035A
      0500035A05000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000008200000082000000
      0000000000000000820000008200000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000005E9800005E9800005E980000000000066896008AC5D900CAFEFF007ADC
      F2000B6D9A00000000000000000000000000000082003A5BFB00021299000000
      8200000082000119BC000017B500000E70000000000000000000000000000000
      00000000000000000000000000000000000000000000035A0500089511000690
      0E00035A05000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000082003A5BFB00021299000000
      8200000082000119BC000017B500000E70000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000005E
      980036D0FC0003B0EE000089C600005E98000566950042ADD00089C0D5009EFA
      FF0052C7E700056695000000000000000000000082002D4ACF002446EF000110
      8B000316A9000423EE0000139600000082000000000000000000000000000000
      00000000000000000000000000000000000000000000035A05000C9D19000A99
      1500035A05000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000082002D4ACF002446EF000110
      8B000316A9000423EE000013960000008200893615007D3213007B3113007B31
      13007B3113007B3113007B3113006D2C11004D1F0C004C1F0C00005E980026A3
      D1000FA5DD0001B7F70000A6E600005E9800000000000566950035ACD10087BF
      D30080F4FF001B91BD0000000000000000000000000000008200324DC900274C
      F3000522D8000011870000008200000000000000000000000000000000000000
      00000000000000000000035A0500035A0500035A0500035A050011A624000DA0
      1C00035A0500035A0500035A0500035A05000000000000000000000000000000
      00000000000000000000000000000000000000000000040F6200324DC900274C
      F3000522D800001187000000820000000000692A1100FEF0E200FEEBD700FEE6
      CB0000650000FEDCB700EECAA500A78C6F009D826600005E980028A3D10016A7
      DD000262990036D0FC000086C200005E980000000000000000000566950028AB
      D4008AC5D90005669500000000000000000000000000000082003550CB005179
      FF00244AF80001108B0000008200000000000000000000000000000000000000
      00000000000000000000035A050025C7470025C747001BB735001BB7350013AB
      270011A624000DA01C000A991500035A05000000000000000000000000000000
      00000000000000000000000000000000000000000000040F62003550CB005179
      FF00244AF80001108B00000082000000000065281000FEF6EE00FEF0E500FEED
      D90000650000FEE2C500EECFAF009D876D00005E980029A3D10016A7DD000262
      990036D0FC001FADE000005E9800000000000000000000000000000000000566
      95001AA7D40087BFD300056695000373A500000082003451D3004269FF002B41
      BB00354CC6002446EF0000139600000082000000000000000000000000000000
      00000000000000000000035A05002CD3550027CB4B0025C747001CBA38001BB7
      350017B02E0013AB270011A62400035A05000000000000000000000000000000
      000000000000000000000000000000000000000082003451D3004269FF002B41
      BB00354CC6002446EF0000139600000082006628100000650000006500000065
      00000065000000650000005F0000003F0000005E980016A7DD000262990036D0
      FC0018AADD00005E9800762F1200000000000000000000000000000000000000
      0000056695000EA5D50084C2D80033DDFF00000082005E81FF003451D3000000
      820000008200324DC9002446EF00000082000000000000000000000000000000
      00000000000000000000035A0500035A0500035A0500035A050027CB4B0025C7
      4700035A0500035A0500035A0500035A05000000000000000000000000000000
      000000000000000000000000000000000000000082005E81FF003451D3000000
      820000008200324DC9002446EF000000820066281000FEFEFE00FEFBF800FEF8
      F20000650000E2D5C700AAA59A0063868E00005E98000CB8F30036D0FC0010A4
      DA00005E9800FED3A500762F1200000000000000000000000000000000000000
      000000000000056695000EA5D50018B0E0000ACFFF00000082000000820025D7
      FF002CD8FF000000820000008200000000000000000000000000000000000000
      00000000000000000000000000000000000000000000035A05002CD3550029CF
      5200035A05000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000008200000082000000
      00000000000000008200000082000000000065280F00FEFEFE00FEFEFE00FEFC
      FB0000650000B5AFA700085A8E000F7BB10002A6E3000054880002629900005E
      9800FED4A900FED3A500762F1200000000000000000000000000000000000000
      000000000000000000000566950025D7FF0030D1FE0038D3FE0041D5FE0049D9
      FF0051DAFE005FE1FF006EEBFF00056695000000000000000000000000000000
      00000000000000000000000000000000000000000000035A050034DE650030D9
      5E00035A05000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000065280F00FEFEFE00FEFEFE00FEFE
      FE0000650000C5C4C0000964970007ADE90000629C00005F1E00FEE2C400FEDE
      BA00FED9B100FED5AB00762F1200000000000000000000000000000000000000
      000000000000000000000566950051E3FF0051DAFE005CDDFF0068E0FF0068E0
      FF008BEDFF0080DCF40099F2FF00056695000000000000000000000000000000
      00000000000000000000000000000000000000000000035A0500035A0500035A
      0500035A05000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000006628100000650000006500000065
      0000005E00001F551C00242323000B679C0007648A0000670500006500000065
      00000065000000650000762F1200000000000000000000000000000000000000
      00000000000000000000056695007BEBFF0080E6FF008BEDFF0095EAFF00AFF7
      FF00CAEDF2001A759E00C7F9FE00056695000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000065280F004BFE82001EBC3400007F
      0000184F180024232300E3E2E200FEFCFA00FEF8F20000650000FEEFE000FEEA
      D400FEE5CA00FEE0BF00752E1100000000000000000000000000000000000000
      0000000000000000000005669500AAEFFF00AAEFFF00B2EFFF00CAFEFF00D5F2
      F40013709C0005669500D4FFFF00056695000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000006B2D12004BFE82004BFE82001DB8
      33005B5857009F9E9E00DCDCDC00DCDCDC00DCDCDC0000650000DCD9D800DCD7
      D100DCD4CA00DCCFC1007B341600000000000000000000000000000000000000
      0000000000000000000005669500E9FCFF00BFF4FF00C0F6FF0099D0E000106C
      98000566950005669500CAFEFF00056695000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000009941150099461100984410009844
      100098441000984410009844100098441000984411009A471300994611009A47
      13009745130095461600762F1200000000000000000000000000000000000000
      000000000000000000000000000005669500E9FCFF00D4FFFF008CD4EA0089D3
      E700A3E3F400B8EFF700C7F9FE00056695000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000099411500E97F1E00E97F1E00E97F
      1E00E97F1E00E97F1E00E97F1E00E97F1E00E97F1E00E97F1E00E97F1E00E97F
      1E00E97F1E00E97F1E00A6420C00000000000000000000000000000000000000
      0000000000000000000000000000000000000566950005669500056695000566
      9500056695000566950005669500000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000BC580C00BD580C00BD58
      0C00BD580C00BD580C00BD580C00BD580C00BD590C00BF5A0D00BD580B00BF5A
      0D00BB570C00B8570F0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000008200000082000000
      0000000000000000820000008200000000000000000000000000000000000000
      00000000000000000000000000000000000000000000035A0500035A0500035A
      0500035A05000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000008200000082000000
      0000000000000000820000008200000000000000000005669500056695000566
      95000000000000000000000000000000000000000000035A0500035A0500035A
      0500035A05000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000082003A5BFB00021299000000
      8200000082000119BC000017B500000E70000000000000000000000000000000
      00000000000000000000000000000000000000000000035A0500089511000690
      0E00035A05000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000082003A5BFB00021299000000
      8200000082000119BC000017B500000E7000066896008AC5D900CAFEFF007ADC
      F2000B6D9A0000000000000000000000000000000000035A0500089511000690
      0E00035A05000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000082002D4ACF002446EF000110
      8B000316A9000423EE000013960000008200893615007D3213007B3113007B31
      13007B3113007B3113007B3113007B3113007B311300035A05000C9D19000A99
      1500035A05007E3313008A37150000000000893615007D3213007B3113007B31
      13007B3113007B3113007B3113007B311300000082002D4ACF002446EF000110
      8B000316A9000423EE0000139600000082000566950042ADD00089C0D5009EFA
      FF0052C7E70005669500000000000000000000000000035A05000C9D19000A99
      1500035A05000000000000000000000000000000000000000000000000000000
      0000000000005C205C00030303000303030001010100040F6200324DC900274C
      F3000522D800001187000000820000000000692A1100FEF0E200FEEBD700FEE6
      CB00FEE1C100FEDCB700035A0500035A0500035A0500035A050011A624000DA0
      1C00035A0500035A0500035A0500035A0500692A1100FEF0E200FEEBD700FEE6
      CB00FEE1C100FEDCB700FED8B000FED4A900FED3A500040F6200324DC900274C
      F3000522D800001187000000820000000000000000000566950035ACD10087BF
      D30080F4FF001B91BD00035A0500035A0500035A0500035A050011A624000DA0
      1C00035A0500035A0500035A0500035A05000000000000000000000000000000
      000029133B00480C480013131300141414000A0A0A00040F62003550CB005179
      FF00244AF80001108B00000082000000000065281000FEF6EE00FEF0E500FEED
      D900FEE7CF00FEE2C500035A050025C7470025C747001BB735001BB7350013AB
      270011A624000DA01C000A991500035A050065281000FEF6EE00FEF0E500FEED
      D900FEE7CF00FEE2C500FEDDBA00FED9B100FED5AB00040F62003550CB005179
      FF00244AF80001108B00000082000000000000000000000000000566950028AB
      D4008AC5D90005669500035A050025C7470025C747001BB735001BB7350013AB
      270011A624000DA01C000A991500035A05000000000000000000000000002D53
      5D004A0E4A00511551001C1C1C001A1A1A00000082003451D3004269FF002B41
      BB00354CC6002446EF00001396000000820066281000FEFBF700000082000000
      820000008200FEE9D100035A05002CD3550027CB4B0025C747001CBA38001BB7
      350017B02E0013AB270011A62400035A050066281000FEFBF700000082000000
      820000008200FEE9D1009635110096351100000082003451D3004269FF002B41
      BB00354CC6002446EF0000139600000082000000000000000000000000000566
      95001AA7D40087BFD300035A05002CD3550027CB4B0025C747001CBA38001BB7
      350017B02E0013AB270011A62400035A05000000000000000000000000003329
      490050145000323232003838380028282800000082005E81FF003451D3000000
      820000008200324DC9002446EF000000820066281000FEFEFE00FEFBF800FEF8
      F200FEF3EA00FEEFE000035A0500035A0500035A0500035A050027CB4B0025C7
      4700035A0500035A0500035A0500035A050066281000FEFEFE00FEFBF800FEF8
      F200FEF3EA00FEEFE000FEEAD400FEE5CA00000082005E81FF003451D3000000
      820000008200324DC9002446EF00000082000000000000000000000000000000
      0000056695000EA5D500035A0500035A0500035A0500035A050027CB4B0025C7
      4700035A0500035A0500035A0500035A05000000000000000000000000003A19
      46002A2A2A005E5E5E006F6F6F003F3F3F001F1F1F0000008200000082000101
      01000000000000008200000082000000000065280F00FEFEFE00FEFEFE00FEFC
      FB00FEFAF400FEF4EB00FEF0E100FEEBD800FEE6CB00035A05002CD3550029CF
      5200035A0500035A0500035A0500035A050065280F00FEFEFE00FEFEFE00FEFC
      FB00FEFAF400FEF4EB00FEF0E100FEEBD800FEE6CB000000820000008200035A
      05001FB537000000820000008200035A05000000000000000000000000000000
      000000000000056695000EA5D50018B0E0000ACFFF00035A05002CD3550029CF
      5200035A050037E1FF0005669500000000000000000000000000000000003031
      4900652965006B6B6B007A7A7A0050505000333333002D2D2D00161616000202
      02000000000000000000000000000000000065280F00FEFEFE00000082000000
      820000008200FEFBF700963511009635110096351100035A050034DE650030D9
      5E00035A05001FB5370011A32100035A050065280F00FEFEFE00000082000000
      820000008200FEFBF70096351100963511009635110096351100035A05003AD4
      63002FC750001FB5370011A32100035A05000000000000000000000000000000
      000000000000000000000566950025D7FF0030D1FE00035A050034DE650030D9
      5E00035A05005FE1FF006EEBFF0005669500000000000000000000000000795E
      87005D225E00884C88006E6E6E00585858004E4E4E004A4A4A004E124E005C20
      5C000000000000000000000000000000000066281000FEFEFE00FEFEFE00FEFE
      FE00FEFEFE00FEFEFE00FEFBF700FEF7F000FEF3E600035A0500035A0500035A
      0500035A0500035A0500035A0500035A050066281000FEFEFE00FEFEFE00FEFE
      FE00FEFEFE00FEFEFE00FEFBF700FEF7F000FEF3E600FEEEDD00BCC69C00035A
      05003AD46300035A0500035A0500035A05000000000000000000000000000000
      000000000000000000000566950051E3FF0051DAFE00035A0500035A0500035A
      0500035A050080DCF40099F2FF00056695000000000000000000000000000000
      0000103343006E37700092569200985C9800783C78005C205C00470B47000000
      00000000000000000000000000000000000065280F00FEFEFE00FEFEFE00FEFE
      FE00FEFEFE00FEFEFE00FEFEFE00FEFCFA00FEF8F200FEF4E900FEEFE000BCC7
      9E00035A0500035A0500752E11000000000065280F00FEFEFE00FEFEFE00FEFE
      FE00FEFEFE00FEFEFE00FEFEFE00FEFCFA00FEF8F200FEF4E900FEEFE000BCC7
      9E00035A0500035A0500752E1100000000000000000000000000000000000000
      00000000000000000000056695007BEBFF0080E6FF008BEDFF0095EAFF00AFF7
      FF00CAEDF2001A759E00C7F9FE00056695000000000000000000000000000000
      00000000000056215A005216520043074300410541005C205C00000000000000
      0000000000000000000000000000000000006B2D1200DCDCDC00DCDCDC00DCDC
      DC00DCDCDC00DCDCDC00DCDCDC00DCDCDC00DCDCDC00DCDCDC00DCD9D800DCD7
      D100A3B69600035A05007B341600000000006B2D1200DCDCDC00DCDCDC00DCDC
      DC00DCDCDC00DCDCDC00DCDCDC00DCDCDC00DCDCDC00DCDCDC00DCD9D800DCD7
      D100A3B69600035A05007B341600000000000000000000000000000000000000
      0000000000000000000005669500AAEFFF00AAEFFF00B2EFFF00CAFEFF00D5F2
      F40013709C0005669500D4FFFF000566950000000000041EFF000525D5000000
      0000000000003D3E5A0054185400000000000000000000000000000000000000
      0000000000000000000000000000000000009941150099461100984410009844
      100098441000984410009844100098441000984411009A471300994611009A47
      13009745130095461600762F1200000000009941150099461100984410009844
      100098441000984410009844100098441000984411009A471300994611009A47
      13009745130095461600762F1200000000000000000000000000000000000000
      0000000000000000000005669500E9FCFF00BFF4FF00C0F6FF0099D0E000106C
      98000566950005669500CAFEFF00056695000000000000000000041EFF003A14
      7500261C3D002F0E3C0000000000000000000000000000000000000000000000
      00000000000000000000000000000000000099411500E97F1E00E97F1E00E97F
      1E00E97F1E00E97F1E00E97F1E00E97F1E00E97F1E00E97F1E00E97F1E00E97F
      1E00E97F1E00E97F1E00A6420C000000000099411500E97F1E00E97F1E00E97F
      1E00E97F1E00E97F1E00E97F1E00E97F1E00E97F1E00E97F1E00E97F1E00E97F
      1E00E97F1E00E97F1E00A6420C00000000000000000000000000000000000000
      000000000000000000000000000005669500E9FCFF00D4FFFF008CD4EA0089D3
      E700A3E3F400B8EFF700C7F9FE00056695000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000BC580C00BD580C00BD58
      0C00BD580C00BD580C00BD580C00BD580C00BD590C00BF5A0D00BD580B00BF5A
      0D00BB570C00B8570F00000000000000000000000000BC580C00BD580C00BD58
      0C00BD580C00BD580C00BD580C00BD580C00BD590C00BF5A0D00BD580B00BF5A
      0D00BB570C00B8570F0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000566950005669500056695000566
      9500056695000566950005669500000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000035A0500035A0500035A
      0500035A05000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000008200000082000000
      0000000000000000820000008200000000000000000000000000000000000000
      00000000000000000000000000000000000000000000035A0500035A0500035A
      0500035A050000000000000000000000000000000000000000007F2B28007F2B
      2800A1828300A1828300A1828300A1828300A1828300A1828300A18283007A1C
      1C007F2B28000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000035A0500089511000690
      0E00035A05000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000082003A5BFB00021299000000
      8200000082000119BC000017B500000E70000000000000000000000000000000
      00000000000000000000000000000000000000000000035A0500089511000690
      0E00035A0500000000000000000000000000000000007F2B2800CA4D4D00B645
      4500DDD4D5007916170079161700DCE0E000D7DADE00CED5D700BDBABD007610
      0F009A2D2D007F2B280000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000035A05000C9D19000A99
      1500035A05000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000082002D4ACF002446EF000110
      8B000316A9000423EE0000139600000082000000000000000000000000000000
      00000000000000000000000000000000000000000000035A05000C9D19000A99
      1500035A0500000000000000000000000000000000007F2B2800C24A4B00B144
      4400E2D9D9007916170079161700D9D8DA00D9DEE100D3D9DC00C1BDC1007611
      1100982D2D007F2B280000000000000000000000000000000000000000000000
      00000000000000000000035A0500035A0500035A0500035A050011A624000DA0
      1C00035A0500035A0500035A0500035A05000000000000000000000000000000
      00000000000000000000000000000000000000000000040F6200324DC900274C
      F3000522D8000011870000008200000000000000000000000000000000000000
      0000000000005C205C00035A0500035A0500035A0500035A050011A624000DA0
      1C00035A0500035A0500035A0500035A0500000000007F2B2800C24A4A00B042
      4200E6DCDC007916170079161700D5D3D500D8DEE100D7DDE000C6C2C500700F
      0F00962C2C007F2B28000000000000000000000000000000000000000000811E
      0000811E0000811E0000035A050025C7470025C747001BB735001BB7350013AB
      270011A624000DA01C000A991500035A0500000000000000000000000000811E
      0000811E0000811E0000811E0000811E0000811E0000040F62003550CB005179
      FF00244AF80001108B0000008200000000000000000000000000000000000000
      000029133B00480C4800035A050025C7470025C747001BB735001BB7350013AB
      270011A624000DA01C000A991500035A0500000000007F2B2800C24A4A00B041
      4100EADEDE00E7DDDD00DDD4D500D7D3D500D5D7D900D7D8DA00CAC2C5007E17
      17009E3131007F2B28000000000000000000000000000000000000000000811E
      0000FEFEFE00FEFEFE00035A05002CD3550027CB4B0025C747001CBA38001BB7
      350017B02E0013AB270011A62400035A0500000000000000000000000000811E
      0000FEFEFE00FEFEFE00FEFEFE00758EFC00000082003451D3004269FF002B41
      BB00354CC6002446EF0000139600000082000000000000000000000000002D53
      5D004A0E4A0051155100035A05002CD3550027CB4B0025C747001CBA38001BB7
      350017B02E0013AB270011A62400035A0500000000007F2B2800BF474800B845
      4500BA4C4C00BD575700BB575600B64E4E00B4494900BD525100BB4B4C00B542
      4200BF4A4A007F2B28000000000000000000000000000000000000000000811E
      0000FEFEFE00FEFEFE00035A0500035A0500035A0500035A050027CB4B0025C7
      4700035A0500035A0500035A0500035A0500000000000000000000000000811E
      0000FEFEFE00FEFEFE006480FB00011FFA00000082005E81FF003451D3000000
      820000008200324DC9002446EF00000082000000000000000000000000003329
      49005014500032323200035A0500035A0500035A0500035A050027CB4B0025C7
      4700035A0500035A0500035A0500035A0500000000007F2B2800A33B3900B160
      5D00C6868400CB918F00CC919000CC908F00CB898800C9898800CB939100CC96
      9600BD4B4C007F2B28000000000000000000000000000000000000000000811E
      0000CAD4FE00284BFB00011FFA00284BFB000120FA00035A05002CD3550029CF
      5200035A0500000000000000000000000000000000000000000000000000811E
      0000CAD4FE00284BFB00011FFA00284BFB000120FA0000008200000082000000
      0000000000000000820000008200000000000000000000000000000000003A19
      46002A2A2A005E5E5E006F6F6F003F3F3F001F1F1F00035A05002CD3550029CF
      5200035A0500000000000000000000000000000000007F2B2800BD4B4C00F7F7
      F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7
      F700BD4B4C007F2B28000000000000000000000000000000000000000000811E
      00003D5DFB00092AFA00AABAFC00EAEEFE00092AFA00035A050034DE650030D9
      5E00035A0500000000000000000000000000000000000000000000000000811E
      00003D5DFB00092AFA00AABAFC00EAEEFE00092AFA003859FB00811E00000000
      0000000000000000000000000000000000000000000000000000000000003031
      4900652965006B6B6B007A7A7A005050500033333300035A050034DE650030D9
      5E00035A0500000000000000000000000000000000007F2B2800BD4B4C00F7F7
      F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7
      F700BD4B4C007F2B28000000000000000000000000000000000000000000811E
      0000DCE3FE00CAD4FE00FEFEFE00FEFEFE008097FC00035A0500035A0500035A
      0500035A0500000000000000000000000000000000000000000000000000811E
      0000DCE3FE00CAD4FE00FEFEFE00FEFEFE008097FC00011FFA00491F3F000000
      000000000000000000000000000000000000000000000000000000000000795E
      87005D225E00884C88006E6E6E00585858004E4E4E00035A0500035A0500035A
      0500035A0500000000000000000000000000000000007F2B2800BD4B4C00F7F7
      F700BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00F7F7
      F700BD4B4C007F2B28000000000000000000000000000000000000000000811E
      0000FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE003D5DFB00011FFA000000
      000000000000000000000000000000000000000000000000000000000000811E
      0000FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE003D5DFB00011FFA000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000103343006E37700092569200985C9800783C78005C205C00470B47000000
      000000000000000000000000000000000000000000007F2B2800BD4B4C00F7F7
      F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7
      F700BD4B4C007F2B28000000000000000000000000000000000000000000811E
      0000811E0000811E0000811E0000811E0000811E0000761E0700111FB800011F
      FA0000000000000000000000000000000000000000000000000000000000811E
      0000811E0000811E0000811E0000811E0000811E0000761E0700111FB800011F
      FA00000000000000000000000000000000000000000000000000000000000000
      00000000000056215A005216520043074300410541005C205C00000000000000
      000000000000000000000000000000000000000000007F2B2800BD4B4C00F7F7
      F700BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00F7F7
      F700BD4B4C007F2B280000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000011F
      FA00011FFA000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000011F
      FA00011FFA0000000000000000000000000000000000041EFF000525D5000000
      0000000000003D3E5A0054185400000000000000000000000000000000000000
      000000000000000000000000000000000000000000007F2B2800BD4B4C00F7F7
      F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7
      F700BD4B4C007F2B280000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000011FFA000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000011FFA000000000000000000000000000000000000000000041EFF003A14
      7500261C3D002F0E3C0000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007F2B2800F7F7
      F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7
      F7007F2B28000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000006F6F6F00FFFF
      FF00FBFBFB00FBFBFB00FBFBFB00B9B9B9005353530000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008E5D59008E5D59008E5D59008E5D59008E5D59008E5D59008E5D
      59008E5D59008E5D590073424100000000000000000000000000000000005353
      5300FFFFFF00EAEAEA00EAEAEA00EAEAEA00B9B9B90053535300535353005353
      5300535353000000000000000000000000000000000000000000000000000000
      0000E0EEE0008FC091003B8D3F00257A2900257729003B853F008FB99100E0EB
      E000000000000000000000000000000000000000000000000000000000000000
      0000E5E8F7009EA9E100546BC7003F59C0003A53BF004C67C20097A7DC00E1E6
      F500000000000000000000000000000000000000000000000000000000000000
      00000000000092625A00FEDDBC00FFD9B400FFD5AC00FFD1A500FFCE9D00FECA
      9700FFC79000FFC48B0073424100000000000000000000000000000000000000
      000053535300FFFFFF00EAEAEA0053535300EAEAEA00B9B9B900B9B9B900B9B9
      B900B9B9B900535353000000000000000000000000000000000000000000B5D9
      B700318F350042A0520087CA9A009BD3AB009BD2AB0083C796003D974C00307C
      3400B5D0B600000000000000000000000000000000000000000000000000C3C9
      ED005566CC003C52CC00757AE8008F92EE008F92EE007178E400334DC100405C
      BE00B9C4E7000000000000000000000000000000000000000000000000000000
      00000000000098665D00FFE3C700DD903D00DD903D00DD903D00DD903D00DD90
      3D00DD903D00FFC7920073424100000000000000000000000000000000000000
      00000000000053535300FFFFFF00DADADA00DADADA00DADADA00DADADA00FFFF
      FF00FFFFFF00DADADA0053535300000000000000000000000000B5DBBA00258F
      2A006DBE8300A8DBB50087CC980066BC7D0064BA7C0086CB9800A5D9B40066B7
      7D0024722700B5D1B60000000000000000000000000000000000C5C9EF005160
      CD005C65E000A1A6F5007E86EF005B63E900595DE7007D84EE009EA0F400515D
      D7003452BA00B9C4E70000000000000000000000000000000000000000000000
      000000000000A06C5F00FEE9D300FFE5CA00FFE1C100FFDCBA00FED8B100FED3
      A900FFD0A100FFCC9A0073424100000000000000000000000000000000000000
      000000000000000000006F6F6F00FFFFFF00DADADA00DADADA00B9B9B9005353
      530053535300FFFFFF00535353000000000000000000E1F2E40033A1440072C2
      8700A8DBB20060BC77005CBA730059B8700059B56F0058B56F005BB77400A5D9
      B30069B87F00317F3500E1ECE1000000000000000000E8EAF9006571D400616B
      E300A1ACF500545FEC00505CEA004D59E9004E59E6004C56E6005056E6009EA2
      F4005460D600405CBF00E2E7F500000000008E5D59008E5D59008E5D59008E5D
      59008E5D5900A7746300FEEEDD00DD903D00DD903D00DD903D00DD903D00DD90
      3D00DD903D00FED1A40073424100000000000000000000000000000000000000
      000000000000000000006F6F6F00FFFFFF00DADADA00B9B9B900535353000000
      0000C9C9C9005353530053535300000000000000000090D29F004CB06400AADD
      B40064C179005FBE710075C58500D4ECD9008ACD990056B66C0058B56E005CB7
      7400A6DAB400419B4E008EBC90000000000000000000ACB0EA004B56DB00A2AB
      F6005664F0005266EE004D59E9004D59E9004D59E9004D59E9004C58E600525A
      E6009FA3F5003450C40096A6DC000000000092625A00FEDDBC00FFD9B400FFD5
      AC00FFD1A500B17D6700FEF3E600FEEFDE00FEEAD800FFE7CF00FEE2C700FEDE
      BD00FFD9B600FED5AD00734241000000000000000000E3E3E3005F5F5F00E3E3
      E30000000000000000006F6F6F00FFFFFF00DADADA0053535300000000000000
      000000000000000000005353530000000000000000003FB55D0091D29F008DD4
      9A0064C3740079C98700F2FAF400FFFFFF00FDFEFD0086CB960057B76D005BB9
      720085CC970087C79A003B8B3F0000000000000000007378DD00818CEE007E91
      F7005D73F3004D59E9004D59E9004D59E9004D59E9004D59E9004D59E9004F5B
      E9007B83F000757BE2004C64C4000000000098665D00FFE3C700DD903D00DD90
      3D00DD903D00BB836900FFF7EF00DD903D00DD903D00DD903D00DD903D00DD90
      3D00DD903D00FEDAB8007342410000000000E3E3E3005F5F5F005F5F5F005F5F
      5F00E3E3E300000000006F6F6F00FFFFFF00DADADA0053535300000000000000
      0000000000000000000000000000000000000000000027B04900A6DCAF0070CA
      7F0073CA8000F0F9F100FFFFFF00EBF7ED00FFFFFF00FBFDFC0088CD96005BB9
      710067BE7D00A0D7AF00237F260000000000000000006569DB00A1ABF7007086
      F8006882F600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF004D59
      E9005C66EA00969CF1003956BE0000000000A06C5F00FEE9D300FFE5CA00FFE1
      C100FFDCBA00C48B6C00FEFAF700FEF7F000FEF4EA00FEF2E300FEEDDC00FEE9
      D400FEE5CB00FEE1C20073424100000000005F5F5F005F5F5F00000000005F5F
      5F005F5F5F00E3E3E300000000006F6F6F00FFFFFF00DADADA0053535300B9B9
      B90000000000000000000000000000000000000000002EB75100A7DDB10072CC
      800066C77300B0E1B700D2EED60063C17000B8E3BF00FFFFFF00FBFDFC008CD0
      990069C17E00A1D7AE00238426000000000000000000696EDC00AFB9F9007F93
      FA007085F000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF004D59
      E9005E6AEE00969DF1003D55C00000000000A7746300FEEEDD00DD903D00DD90
      3D00DD903D00CC937000FEFEFC00FEFBF800FEF8F300FEF6ED00FEF2E600E5D5
      D000C6B1AF00A793950073424100000000000000000000000000000000000000
      00005F5F5F005F5F5F00E3E3E300000000006F6F6F006F6F6F006F6F6F005353
      530000000000000000000000000000000000000000004BC56C0095D7A10091D7
      9B0069C9760064C66F0061C46E0061C36F0061C26F00B9E4C000FFFFFF00E3F4
      E6008BD199008BCE9D003C993F0000000000000000007C7FE300A5AFF5009DAB
      FA00778CF000545FEC00545FEC00545FEC00545FEC00545FEC00545FEC006377
      F200818EF400787FE900566BC90000000000B17D6700FEF3E600FEEFDE00FEEA
      D800FFE7CF00D59C7400FEFEFE00FEFEFE00FEFBFA00FEFAF400FEF6EE00A067
      5B00A0675B00A0675B009D6559000000000000000000E3E3E3005F5F5F00E3E3
      E300FFFFFF005F5F5F005F5F5F00E3E3E3000000000000000000000000000000
      000000000000000000000000000000000000000000009BDFAD0057BF7000AFE1
      B7006DCC7A0068C8720065C7700063C56E0062C46E0063C47100B6E3BE006FC7
      7E00ACDFB50048A95E008FC894000000000000000000B5B5F0007D83EA00CDD4
      FC008B9DFA007E93F700758AEE006C84F6006C84F6006C84F6006C84F6006379
      F300A4AFF8003E4FD000A0ABE10000000000BB836900FFF7EF00DD903D00DD90
      3D00DD903D00DCA17500FEFEFE00FEFEFE00FEFEFE00FEFCFB00FEFAF600A067
      5B00E5A15400DC832A000000000000000000E3E3E3005F5F5F005F5F5F005F5F
      5F00E3E3E300FFFFFF005F5F5F00000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E5F7E90049C566007FCE
      9000AEE1B5006DCC7A006ACA760068C8720068C8740068C875006BC97900ACDF
      B40076C4890033A14200E1F1E3000000000000000000EBEBFB007978E300A3A7
      F300D4DBFD00879AFA007F91F0007A8EF1007F94F8007E92F900768CF800A8B6
      F800636EE3005868CD00E6E8F70000000000C48B6C00FEFAF700FEF7F000FEF4
      EA00FEF2E300E1A57700D1926D00D1926D00D1926D00D1926D00D1926D00A067
      5B00EB9E43000000000000000000000000005F5F5F005F5F5F00000000005F5F
      5F005F5F5F00E3E3E300F0F0F000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000BFECCB003DC3
      5C007FCE9000AFE1B70092D89D0077CE830077CE830092D89D00AEE1B50078C8
      8B0027A13B00B5DFBE0000000000000000000000000000000000CFCFF600706F
      E100AAADF200D8DCFD00AEBAFA0091A3FA008B9DFA009CA9FB00BAC7FC00707B
      E9005462CE00C3C9EE000000000000000000CC937000FEFEFC00FEFBF800FEF8
      F300FEF6ED00FEF2E600E5D5D000C6B1AF00A793950073424100000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00005F5F5F005F5F5F00E3E3E300000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C0ED
      CB004AC8690059C2740096D7A300A5DCAE00A5DCAE0095D6A10050B96A0035B3
      5500B6E3C100000000000000000000000000000000000000000000000000CFCF
      F6007979E2008E93ED00BEC3F800CCD3F900C4CBF900AAB4F4006670E200646E
      D600C6CAEF00000000000000000000000000D59C7400FEFEFE00FEFEFE00FEFB
      FA00FEFAF400FEF6EE00A0675B00A0675B00A0675B009D655900000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000005F5F5F005F5F5F00E3E3E3000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000E5F8E9009FE3B00055CB72003BC05C0037BE5A0049C36A0097DCAA00E1F5
      E700000000000000000000000000000000000000000000000000000000000000
      0000EBEBFB00B6B6F0007D7FE2006A6BDE00686BDC007479DE00AFB3EB00E8E9
      F90000000000000000000000000000000000DCA17500FEFEFE00FEFEFE00FEFE
      FE00FEFCFB00FEFAF600A0675B00E5A15400DC832A0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000005F5F5F00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E1A57700D1926D00D1926D00D192
      6D00D1926D00D1926D00A0675B00EB9E43000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000001B7D000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000056695000566
      9500056695000566950005669500056695000000000000000000001B7D00001B
      7D00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000274A90030C9E90012CB
      FE0020CEFE0054DEFF0074E0F80030B0DA000268A30000000000001B7D00362C
      FF00001B7D000000000000000000000000000000000000000000000000000070
      0000000000000000000000000000007000000070000000700000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000274A90073FAFE003FE3FE0012CB
      FE0020CEFE0054DEFF0074E0F800001B7D00001B7D00001B7D00001B7D002F27
      FF00362CFF00001B7D0000000000000000000000000000000000000000000070
      0000047503000000000000700000000000000000000000000000007000000000
      00000000000000000000000000000000000000000000000000000303C4000303
      C4000303C4000303C4000303C4000303C4000303C40000000000000000000000
      0000000000000000000000000000000000000000000000000000096910000969
      1000096910000969100009691000096910000969100000000000000000000000
      0000000000000000000000000000000000000274A90073FAFE003FE3FE0012CB
      FE0020CEFE0054DEFF0074E0F800001B7D000016E6000016E600040FFF002420
      FF00362CFF00362CFF00001B7D00000000000000000000000000000000000070
      0000007000000070000000000000000000000000000000000000000000000070
      00000000000000000000000000000000000000000000000000000303C4000303
      C4000303C4000303C4000303C4000303C4000303C40000000000000000000000
      0000000000000000000000000000000000000000000000000000096910000969
      1000096910000969100009691000096910000969100000000000000000000000
      0000000000000000000000000000000000000274A90073FAFE003FE3FE0012CB
      FE0020CEFE0054DEFF0074E0F800001B7D000016E6000018DF00000FF9001718
      FF00362CFF00362CFF00362CFF00001B7D000000000000000000000000000070
      0000007000000070000000700000000000000000000000000000000000000070
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000274A90078FBFE0068F6FF0055F6
      FE005FFEFF0078FBFE0089FBFE00001B7D000016E600001ADA000014EF000E14
      FF002D27FF00362CFF00001B7D00000000000000000000000000000000000070
      0000007000000070000000700000007000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000303C4000303
      C4000303C4000303C4000303C4000303C4000303C4000303C4000303C4000000
      0000000000000000000000000000000000000000000000000000096910000969
      1000096910000969100009691000096910000969100009691000096910000000
      0000000000000000000000000000000000000274A900A7E9F3001CAAD3000791
      C5000787BB00108BBC001F91BF00001B7D00001B7D00001B7D00001B7D00030C
      FF002420FF00001B7D0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000303C4000303
      C4000303C4000303C4000303C4000303C4000303C4000303C4000303C4000000
      0000000000000000000000000000000000000000000000000000096910000969
      1000096910000969100009691000096910000969100009691000096910000000
      0000000000000000000000000000000000000274A90031B5D3003FE3FE0012CB
      FE0020CEFE0054DEFF0074E0F80030B0DA000268A30003689A00001B7D00000F
      F900001B7D000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000007000000070000000700000007000000070
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000274A90073FAFE003FE3FE0012CB
      FE0020CEFE0054DEFF0074E0F80030B0DA000386C10005669500001B7D00001B
      7D00000000000000000000000000000000000000000000000000000000000070
      0000000000000000000000000000000000000070000000700000007000000070
      00000000000000000000000000000000000000000000000000000303C4000303
      C4000303C4000303C4000303C4000303C4000303C4000303C4000303C4000303
      C4000303C4000000000000000000000000000000000000000000096910000969
      1000096910000969100009691000096910000969100009691000096910000969
      1000096910000000000000000000000000000274A90073FAFE003FE3FE0012CB
      FE0020CEFE0054DEFF0074E0F80030B0DA000386C10005669500001B7D000000
      0000000000000000000000000000000000000000000000000000000000000070
      0000000000000000000000000000000000000000000000700000007000000070
      00000000000000000000000000000000000000000000000000000303C4000303
      C4000303C4000303C4000303C4000303C4000303C4000303C4000303C4000303
      C4000303C4000000000000000000000000000000000000000000096910000969
      1000096910000969100009691000096910000969100009691000096910000969
      1000096910000000000000000000000000000274A90073FAFE003FE3FE0012CB
      FE0020CEFE0054DEFF0074E0F80030B0DA000386C10005669500000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000007000000000000000000000000000000070000000000000047503000070
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000274A90078FBFE0068F6FF0055F6
      FE005FFEFF0078FBFE0089FBFE0048CFF200058BC70005669500000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000070000000700000007000000000000000000000000000000070
      00000000000000000000000000000000000000000000000000000303C4000303
      C4000303C4000303C4000303C4000303C4000303C4000303C4000303C4000303
      C4000303C4000303C4000303C400000000000000000000000000096910000969
      1000096910000969100009691000096910000969100009691000096910000969
      1000096910000969100009691000000000000274A900FBFFFF00F0FFFF00C6FF
      FF00A0FFFF0098FFFF0098FFFF0092FFFF0055F6FE0005669500000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000303C4000303
      C4000303C4000303C4000303C4000303C4000303C4000303C4000303C4000303
      C4000303C4000303C4000303C400000000000000000000000000096910000969
      1000096910000969100009691000096910000969100009691000096910000969
      100009691000096910000969100000000000000000000479AF00EDFAFC00DCFF
      FF00B7FFFF0098FFFF0092FFFF0083FAFB00086B9A0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000274A9000274
      A9000274A9000274A9000274A9000274A9000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000081000000810000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000004B0000004B000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000056695000566
      9500056695000566950005669500000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000008750D000000000000000000000000000000000000000000000000000000
      00000000000000000000000081003568FF000303C40000008100000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000025E050045F6800000810000004B0000000000000000
      000000000000000000000000000000000000A4676900A4676900A4676900A467
      6900A4676900A4676900A4676900A4676900A46769000274A90046D3E9001CD9
      FF002EDAFF007AEDFF0023A4D300056695000000000000000000056695000566
      9500056695000566950005669500056695000000000000000000000000000875
      0D0008750D000000000000000000000000000000000000000000000000000000
      00000000000000000000000081003568FF000303C40000008100000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000025E050045F6800000810000004B0000000000000000
      000000000000000000000000000000000000B7918700FCEACE00F3DABC00F2D5
      B100F0D0A700EECB9E00EDC79300EDC28B00E9BD81000274A90064F5FE0012CE
      FE0021CFFF0069E1FB001DA4D60005669500000000000274A90030C9E90012CB
      FE0020CEFE0054DEFF0074E0F80030B0DA000268A3000000000008750D004FDC
      7B0008750D000000000000000000000000000000000000000000000000000000
      00000000000000000000000081003568FF000303C40000008100000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000025E050045F6800000810000004B0000000000000000
      000000000000000000000000000000000000B7938A00FEEFDA00F6E0C600F2DA
      BC00F2D5B200EFD0A900EECB9E00EDC79600EBC28C000274A900A3F7FC009EEA
      FB00BFEFFC00C9F2FB007FCFEA00056695000274A90073FAFE003FE3FE0012CB
      FE0020CEFE0054DEFF0074E0F80030B0DA000386C10008750D004FDC7B004CDA
      770008750D0008750D0008750D0008750D000000000000000000000000000000
      00000000000000000000000081003568FF000303C40000008100000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000025E050045F6800000810000004B0000000000000000
      000000000000000000000000000000000000BA978F00FFF4E500F7E5CF00F4E0
      C500F3DABB00F2D5B100F0D0A600EECB9E00EDC795000274A90062BDD7001B97
      C2001184B4002D96BD00499FC500056695000274A90073FAFE003FE3FE0012CB
      FE0020CEFE0054DEFF0074E0F80030B0DA0008750D004FDC7B004FDC7B0048D7
      710038CB590027BF410027BF410008750D000000000000000000000000000000
      00000000000000000000000081000528FF00001EF60000008100000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000025E050025BD500014A62800004B0000000000000000
      000000000000000000000000000000000000C09E9500FFFBF000F8EADC00F6E3
      CF00F4E0C600F2D9BC00F2D5B100F0D0A900EDCB9E000274A9003BC2DA001ACA
      F3002DD5FE006ADCF3001B97C200056695000274A90073FAFE003FE3FE0012CB
      FE0020CEFE0054DEFF0074E0F80008750D004FDC7B004FDC7B004FDC7B0043D3
      690032C7510023BC3B0027BF410008750D000000000000000000000000000000
      00000000000000008100315EFF000A30FF000121FE00001EE900000081000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000025E05002BD15E0019B842000DA1230004910B00004B00000000
      000000000000000000000000000000000000C6A49A00FFFFFC00FAF0E600F8EA
      DA00F7E5CF00F4E0C500F2DABA00F2D5B100F0D0A7000274A90064F5FE0012CE
      FE0021CFFF006EE0FB001DA4D600056695000274A90078FBFE0068F6FF0055F6
      FE005FFEFF0078FBFE0089FBFE0048CFF20008750D004FDC7B004CDA76003ECF
      61002CC3480020BA370027BF410008750D000000000000000000000000000000
      000000008100315EFF00315EFF001138FF000528FF00001EF600011EDC000000
      8100000000000000000000000000000000000000000000000000000000000000
      0000025E05003AE76F0026CB580018B23C000C9E1D00038A060000810000004B
      000000000000000000000000000000000000CBA99E00FFFFFF00FEF7F200FAEF
      E600F8EAD900F7E3CF00F6E0C500F2DABB00F2D4B1000373A60081FCFF0052FA
      FF0067FFFF0095FCFF0036C4EF00056695000274A900A7E9F3001CAAD3000791
      C5000787BB00108BBC001F91BF001479AD0079C0DC0008750D0048D7710037CB
      590008750D0008750D0008750D0008750D000000000000000000000000000000
      8100315EFF00315EFF00315EFF000F2CDE00011EDC000116DC000014CC00011D
      CF0000008100000000000000000000000000000000000000000000000000025E
      05004DFF880039E9720026CB580016B53A000C9E1D00038A060000810000038A
      0600004B0000000000000000000000000000CFAC9F00FFFFFF00FFFEFC00FCF6
      F000FAEFE600F7EADA00F6E3CF00F4E0C500F3D9BB000274A900C2EBF400FEFE
      FE00CEFFFF00BDFFFF0088F8FB00056695000274A90031B5D3003FE3FE0012CB
      FE0020CEFE0054DEFF0074E0F80030B0DA000268A30003689A0008750D0032C7
      510008750D000000000000000000000000000000000000000000000081000005
      8E0000058E00010C9900010C9900000CAD00010DBC000717BF001122BF00080F
      9F00080F9F000000810000000000000000000000000000000000025E050036DA
      67002CC655001BA138000F8E2700077F12000473040000690000006900000069
      000004730400004B00000000000000000000D4B0A100FFFFFF00FFFFFF00FFFE
      FC00FEF7F000FAEFE500F8EAD900F7E5CE00F6DEC400F3D9B8000274A9000274
      A9000274A9000274A9000274A900000000000274A90073FAFE003FE3FE0012CB
      FE0020CEFE0054DEFF0074E0F80030B0DA000386C10005669500000000000875
      0D0008750D0000000000000000000000000000000000000081000218AB001D16
      70001D167000021DB1002F2FB50039C4E70000B5E900057298001138FF002B57
      FF00315EFF002547E600000081000000000000000000025E0500046606001566
      000014680100017608002A9A3A003ACCCB0000C4CE0005817F002096350021A7
      370019962D00067A0E00004B000000000000D9B5A100FFFFFF00FFFFFF00FFFF
      FF00FFFEFC00FCF7F000FAEFE500F8E9D900F8E7D100FBEACE00DECEB400B6AA
      9300A46769000000000000000000000000000274A90073FAFE003FE3FE0012CB
      FE0020CEFE0054DEFF0074E0F80030B0DA000386C10005669500000000000000
      000008750D00000000000000000000000000000081000405960087623600E9AC
      1C00E5A40D00865E300004059600545DCF0035F6FE0000E0F8000D8CA500080A
      9300080F9F0033708C00080A930000008100025E0500025E050074890400EB9F
      2200E79611007D8F0A000AAA270055D4810036EBFF0000D8FF000D9AA40040D7
      76002CD8510078C79E0012811E00004B0000DDB7A400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFEFC00FCF6EF00FCF3E600EDD8C900B68A7B00A17B6F009C76
      6700A46769000000000000000000000000000274A90073FAFE003FE3FE0012CB
      FE0020CEFE0054DEFF0074E0F80030B0DA000386C10005669500000000000000
      0000000000000000000000000000000000000000000000058E00B88F5500F3E5
      9E00E7CB6200D08F09000000810000008100464CB10038F8FB00014881000405
      96000330530003CA000006351F000000000000000000025E0500D7A56000F3E3
      9E00E7CC6200D08A0A000052020000520200468C4D0038EDFF00005F4F000044
      000043704400F75FF4003C13390000000000E2BCA500FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFEFB00FFFEF700DAC1BA00AD735B00E19E5500E68F
      3100B56D4D000000000000000000000000000274A90078FBFE0068F6FF0055F6
      FE005FFEFF0078FBFE0089FBFE0048CFF200058BC70005669500000000000000
      0000000000000000000000000000000000000000000000000000B88F5500FFFF
      EE00F0DD8F00D193100000000000000000000000000000000000000000000000
      000003CA000000F8000008A90000117000000000000000000000D7B48C00FFFF
      EE00F0DD8F00D192120000000000000000000000000000000000000000000000
      0000FA95FA00FF03FF00AB00AB0079017900E6BFA700FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00DCC7C500B8826500F8B55C00BF7A
      5C00000000000000000000000000000000000274A900FBFFFF00F0FFFF00C6FF
      FF00A0FFFF0098FFFF0098FFFF0092FFFF0055F6FE0005669500000000000000
      000000000000000000000000000000000000000000000000000000000000B88F
      5500B88F55000000000000000000000000000000000000000000000000000000
      000005BC050002E301000C86000000000000000000000000000000000000C2A0
      7200C49541000000000000000000000000000000000000000000000000000000
      0000FA95FA00FA2FFA008B008B0000000000E4BCA400FBF4F000FBF4EF00FAF3
      EF00FAF3EF00F8F2EF00F7F2EF00F7F2EF00D8C2C000B77F6200C1836C000000
      000000000000000000000000000000000000000000000479AF00EDFAFC00DCFF
      FF00B7FFFF0098FFFF0092FFFF0083FAFB00086B9A0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000006B6060000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FA95FA000000000000000000E8C4AD00EBCBB700EBCBB700EACB
      B700EACAB600EACAB600EACAB600EACAB600E3C2B100A56B5F00000000000000
      00000000000000000000000000000000000000000000000000000274A9000274
      A9000274A9000274A9000274A9000274A9000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000800000000100010000000000000400000000000000000000
      000000000000000000000000FFFFFF00E000000000000000E000000000000000
      E000000000000000E000000000000000E000000000000000E000000000000000
      E000000000000000E000000000000000E000000000000000C73F000000000000
      803F000000000000007F00000000000000FF00000000000081FF000000000000
      C7FF000000000000E7FF000000000000FFFFFFFFFFFFFFFF0000FFFFFFFFC003
      0000FFFFFFFF80010000FE3FFFFF80010000FE3FFFFF80010000FE3FFFFF8001
      0000F007E00780010000F007E00780010000F007E00780010000FE3FFFFF8001
      0000FE3FFFFF80010000FE3FFFFF80010000FFFFFFFF80018001FFFFFFFF8001
      FFFFFFFFFFFFC003FFFFFFFFFFFFFFFF8F99FF87FF99FFF10700FF87FF00FFE0
      0300FF87FF0000008381FC00FF810000C381FC00FF810001E000C400C7000001
      F000B400B4000001F801C785C7890001FC00F405F46D0001FC00CF83CFE30001
      FC00FFEFFFEF0001FC00FFCFFFCF0001FC00FFFFFFFF0001FE00FFFFFFFF0001
      FF01FFFFFFFF8003FFFFFFFFFFFFFFFFFF99FF87FF998F87FF00FF87FF000787
      FF00000100000387F801000000018000F00100000001C000E00000000000E000
      E00000000000F000E00900000000F801E00F00000000FC00E00F00000000FC00
      F01F00010001FC00F83F00010001FC0099FF00010001FC00C3FF00010001FE00
      FFFF80038003FF01FFFFFFFFFFFFFFFFFFFFFF87FF99FF87C007FF87FF00FF87
      8003FF87FF00FF878003FC00FF81F8008003E000E001F0008003E000E000E000
      8003E000E000E0008003E007E019E0078003E007E01FE0078003E007E01FE007
      8003E01FE01FF01F8003E00FE00FF83F8003FFE7FFE799FF8003FFF7FFF7C3FF
      C007FFFFFFFFFFFFFFFFFFFFFFFFFFFFC07FFFFFFFFFF801E007F00FF00FF801
      F003E007E007F801F801C003C003F801FC01800180010001FC11800180010001
      8C3D800180010001043F800180010001220F800180010001F10F800180010001
      80FF80018001000301FF80018001000721FFC003C003003FF1FFE007E007003F
      F8FFF00FF00F007FFDFFFFFFFFFF00FFFFDFFFFFFFFFFFFFC0CFFFFFFFFFFFFF
      8047EE3FFFFFFFFF0003E5DFC07FC07F0001E3EFC07FC07F0000E1EFFFFFFFFF
      0001E0FFC01FC01F0003FFFFC01FC01F0007FE0FFFFFFFFF000FEF0FC007C007
      001FEF8FC007C007003FF74FFFFFFFFF003FF8EFC001C001003FFFFFC001C001
      807FFFFFFFFFFFFFC0FFFFFFFFFFFFFFFE7FFE7FFFC1FFF7FC3FFC3F0000C0E7
      FC3FFC3F00008047FC3FFC3F00000000FC3FFC3F00000000FC3FFC3F00000000
      F81FF81F00000000F00FF00F00000000E007E00700000007C003C00300010027
      8001800100070037000000000007003F800180010007003FC3F0C3F0000F003F
      E7F1E7F1001F807FFFFBFFFB003FC0FF00000000000000000000000000000000
      000000000000}
  end
  object ActionList: TActionList
    Images = ImageList
    Left = 282
    Top = 362
    object FilterAction: TAction
      Hint = 'Filter the table data'
      ImageIndex = 0
      OnExecute = FilterActionExecute
    end
    object SortAction: TAction
      Caption = 'SortAction'
      Hint = 'Sort the table data'
      ImageIndex = 6
      OnExecute = SortActionExecute
    end
    object CommitAction: TAction
      Caption = 'Commit'
      Enabled = False
      Hint = 'Commit'
      ImageIndex = 3
      OnExecute = CommitActionExecute
    end
    object RollbackAction: TAction
      Caption = 'Rollback'
      Enabled = False
      Hint = 'Rollback'
      ImageIndex = 4
      OnExecute = RollbackActionExecute
    end
    object SQLEditorAction: TAction
      Hint = 'Load in Editor'
      ImageIndex = 2
      OnExecute = SQLEditorActionExecute
    end
    object RefreshAction: TAction
      Caption = 'Refresh'
      Hint = 'Refresh'
      ImageIndex = 5
      OnExecute = RefreshActionExecute
    end
    object RemoveCurrentFilterAction: TAction
      Caption = '&Remove current filter'
      OnExecute = RemoveCurrentFilterActionExecute
    end
    object RemoveCurrentSortAction: TAction
      Caption = '&Remove current sort'
      OnExecute = RemoveCurrentSortActionExecute
    end
    object NoFilterAction: TAction
      Caption = '&No filter'
      Checked = True
      GroupIndex = 1
      OnExecute = NoFilterActionExecute
    end
    object NoSortAction: TAction
      Caption = '&No sort'
      OnExecute = NoSortActionExecute
    end
    object InsertRowAction: TAction
      Caption = 'Insert Row'
      Hint = 'Insert row'
      ImageIndex = 25
      OnExecute = InsertRowActionExecute
    end
    object DeleteRowAction: TAction
      Caption = 'Delete Row(s)'
      Enabled = False
      Hint = 'Delete row(s)'
      ImageIndex = 26
      OnExecute = DeleteRowActionExecute
    end
    object CustomizeAction: TAction
      Caption = '&Customize Page Control...'
      Hint = 'Customize page control'
      ImageIndex = 8
      OnExecute = CustomizeActionExecute
    end
    object CustomizeTableColumnsAction: TAction
      Caption = '&Customize Table Columns...'
      Hint = 'Customize table columns'
      ImageIndex = 8
      OnExecute = CustomizeTableColumnsActionExecute
    end
    object DuplicateRowAction: TAction
      Caption = 'Duplicate Row(s)'
      Enabled = False
      Hint = 
        'Duplicate row(s). Note! It'#39's not always possible to duplicate mu' +
        'ltiple rows due to constraints.'
      OnExecute = DuplicateRowActionExecute
    end
    object EnableConstraintAction: TAction
      Caption = 'EnableConstraintAction'
      Enabled = False
      Hint = 'Enable constraint'
      ImageIndex = 9
      OnExecute = EnableConstraintActionExecute
    end
    object DisableConstraintAction: TAction
      Caption = 'DisableConstraintAction'
      Enabled = False
      Hint = 'Disable constraint'
      ImageIndex = 10
      OnExecute = DisableConstraintActionExecute
    end
    object CreateConstraintAction: TAction
      Caption = 'CreateConstraintAction'
      Hint = 'Create constraint'
      ImageIndex = 13
      OnExecute = CreateConstraintActionExecute
    end
    object DropConstraintAction: TAction
      Caption = 'DropConstraintAction'
      Enabled = False
      Hint = 'Drop constraint'
      ImageIndex = 14
      OnExecute = DropConstraintActionExecute
    end
    object EnableTriggerAction: TAction
      Caption = 'EnableTriggerAction'
      Enabled = False
      Hint = 'Enable trigger'
      ImageIndex = 9
      OnExecute = EnableTriggerActionExecute
    end
    object DisableTriggerAction: TAction
      Caption = 'DisableTriggerAction'
      Enabled = False
      Hint = 'Disable trigger'
      ImageIndex = 10
      OnExecute = DisableTriggerActionExecute
    end
    object SetSourceClickAction: TAction
      Category = 'OnClick'
      Caption = 'SetSourceClickAction'
      OnExecute = SetSourceClickActionExecute
    end
    object CreateTriggerAction: TAction
      Caption = 'CreateTriggerAction'
      Hint = 'Create trigger'
      ImageIndex = 15
      OnExecute = CreateTriggerActionExecute
    end
    object DropTriggerAction: TAction
      Caption = 'DropTriggerAction'
      Enabled = False
      Hint = 'Drop trigger'
      ImageIndex = 16
      OnExecute = DropTriggerActionExecute
    end
    object CopyToClipboardAction: TAction
      Caption = 'CopyToClipboardAction'
      Hint = 'Copy to clipboard'
      ImageIndex = 11
      OnExecute = CopyToClipboardActionExecute
    end
    object SaveToFileAction: TAction
      Caption = 'SaveToFileAction'
      Hint = 'Save to a file'
      ImageIndex = 12
      OnExecute = SaveToFileActionExecute
    end
    object CreateIndexAction: TAction
      Caption = 'CreateIndexAction'
      Hint = 'Create index'
      ImageIndex = 17
      OnExecute = CreateIndexActionExecute
    end
    object DropIndexAction: TAction
      Caption = 'DropIndexAction'
      Enabled = False
      Hint = 'Drop index'
      ImageIndex = 18
      OnExecute = DropIndexActionExecute
    end
    object GrantPrivilegesAction: TAction
      Hint = 'Grant privileges'
      ImageIndex = 19
      OnExecute = GrantPrivilegesActionExecute
    end
    object RevokePrivilegesAction: TAction
      Enabled = False
      Hint = 'Revoke privileges'
      ImageIndex = 20
      OnExecute = RevokePrivilegesActionExecute
    end
    object CreateSynonymAction: TAction
      Caption = 'CreateSynonymAction'
      Hint = 'Create synonym'
      ImageIndex = 21
      OnExecute = CreateSynonymActionExecute
    end
    object DropSynonymAction: TAction
      Caption = 'DropSynonymAction'
      Enabled = False
      Hint = 'Drop synonym'
      ImageIndex = 22
      OnExecute = DropSynonymActionExecute
    end
    object AlterTableAction: TAction
      Hint = 'Alter or recreate table'
      ImageIndex = 23
      OnExecute = AlterTableActionExecute
    end
    object AnalyzeTableAction: TAction
      Caption = 'AnalyzeTableAction'
      ImageIndex = 24
      OnExecute = AnalyzeTableActionExecute
    end
    object SelectAllAction: TAction
      Caption = '&Select All'
      Hint = 'Select all'
      ImageIndex = 27
      ShortCut = 16449
      OnExecute = SelectAllActionExecute
    end
    object ExportTableDataAction: TAction
      Caption = '&Export Table Data...'
      Hint = 'Export table data'
      ImageIndex = 28
      OnExecute = ExportTableDataActionExecute
    end
    object SourceOptionsAction: TAction
      Caption = 'SourceOptionsAction'
      Hint = 'Source options'
      ImageIndex = 8
      OnExecute = SourceOptionsActionExecute
    end
  end
  object ConstraintsQuery: TOraQuery
    SQL.Strings = (
      'SELECT constraint_name "Constraint Name",'
      
        '       DECODE(constraint_type, '#39'P'#39', '#39'Primary Key'#39', '#39'R'#39', '#39'Referen' +
        'tial Integrity'#39', '#39'C'#39', '#39'Check'#39', '#39'U'#39', '#39'Unique Key'#39') "Type",'
      
        '       INITCAP(status) "Status", search_condition "Search Condit' +
        'ion", constraint_type, r_constraint_name'
      '  FROM all_constraints '
      ' WHERE table_name = :p_table_name'
      '   AND owner = :p_owner'
      'ORDER BY 1')
    FetchAll = True
    ReadOnly = True
    AutoCommit = False
    AfterOpen = ConstraintsQueryAfterOpen
    AfterScroll = ConstraintsQueryAfterScroll
    AfterRefresh = ConstraintsQueryAfterOpen
    Left = 268
    Top = 68
    ParamData = <
      item
        DataType = ftString
        Name = 'p_table_name'
        Value = 'INV_LASKU'
      end
      item
        DataType = ftUnknown
        Name = 'p_owner'
      end>
  end
  object ConstraintsDataSource: TOraDataSource
    DataSet = ConstraintsQuery
    Left = 264
    Top = 112
  end
  object TriggersQuery: TOraQuery
    SQL.Strings = (
      
        'SELECT   trigger_name "Trigger Name", trigger_type "Type", trigg' +
        'ering_event "Triggering Event", INITCAP(status) "Status", descri' +
        'ption, trigger_body'
      '    FROM all_triggers'
      '   WHERE table_name = :p_table_name'
      '     AND owner = :p_owner'
      'ORDER BY 1')
    FetchAll = True
    ReadOnly = True
    AutoCommit = False
    AfterOpen = TriggersQueryAfterOpen
    AfterScroll = TriggersQueryAfterScroll
    AfterRefresh = TriggersQueryAfterOpen
    Left = 370
    Top = 50
    ParamData = <
      item
        DataType = ftString
        Name = 'p_table_name'
        Value = 'INV_LASKU'
      end
      item
        DataType = ftUnknown
        Name = 'p_owner'
      end>
  end
  object TriggersDataSource: TOraDataSource
    DataSet = TriggersQuery
    Left = 370
    Top = 102
  end
  object GrantsDataSource: TOraDataSource
    DataSet = GrantsQuery
    Left = 472
    Top = 238
  end
  object GrantsQuery: TOraQuery
    SQL.Strings = (
      
        'SELECT   grantee "Granted To", privilege "Privilege", grantable ' +
        '"Grantable", grantor "Grantor" '
      '    FROM all_tab_privs'
      '   WHERE table_name = :p_table_name'
      '     AND :p_owner = :p_owner'
      'ORDER BY 1, 2')
    FetchAll = True
    ReadOnly = True
    AutoCommit = False
    AfterOpen = GrantsQueryAfterOpen
    AfterRefresh = GrantsQueryAfterOpen
    Left = 472
    Top = 180
    ParamData = <
      item
        DataType = ftString
        Name = 'p_table_name'
        Value = 'INV_LASKU'
      end
      item
        DataType = ftUnknown
        Name = 'p_owner'
      end>
  end
  object IndexesDataSource: TOraDataSource
    DataSet = IndexesQuery
    Left = 464
    Top = 118
  end
  object IndexesQuery: TOraQuery
    FetchAll = True
    ReadOnly = True
    AutoCommit = False
    AfterOpen = IndexesQueryAfterOpen
    AfterRefresh = IndexesQueryAfterOpen
    Left = 468
    Top = 70
  end
  object ReferencesDataSource: TOraDataSource
    DataSet = ReferencesQuery
    Left = 700
    Top = 254
  end
  object ReferencesQuery: TOraQuery
    LocalUpdate = True
    SQL.Strings = (
      
        'SELECT LPAD('#39' '#39', 30) "Ref. Table", LPAD('#39' '#39', 300) "Ref. Columns"' +
        ', LPAD('#39' '#39', 30) "Ref. Constraint", LPAD('#39' '#39', 30) "Table", LPAD('#39 +
        ' '#39', 300) "Columns", LPAD('#39' '#39', 30) "Foreign Key"'
      '  FROM DUAL'
      ' WHERE :P_TABLE_NAME = :P_TABLE_NAME'
      '   AND :P_OWNER = :P_OWNER')
    AutoCommit = False
    AfterOpen = ReferencesQueryAfterOpen
    Left = 700
    Top = 200
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'P_TABLE_NAME'
      end
      item
        DataType = ftUnknown
        Name = 'P_OWNER'
      end>
  end
  object DependenciesDataSource: TOraDataSource
    DataSet = DependenciesQuery
    Left = 578
    Top = 92
  end
  object DependenciesQuery: TOraQuery
    SQL.Strings = (
      
        'SELECT   d.name "Name", d.type "Type", INITCAP(o.status) "Status' +
        '"'
      '    FROM all_dependencies d, all_objects o'
      '   WHERE d.referenced_name = :p_table_name'
      '     AND d.owner = :p_owner '
      '     AND o.object_name = d.name     '
      'ORDER BY 1')
    FetchAll = True
    ReadOnly = True
    AutoCommit = False
    Left = 578
    Top = 38
    ParamData = <
      item
        DataType = ftString
        Name = 'p_table_name'
        Value = 'INV_LASKU'
      end
      item
        DataType = ftUnknown
        Name = 'p_owner'
      end>
  end
  object ReferencedByQuery: TOraQuery
    LocalUpdate = True
    SQL.Strings = (
      
        'SELECT LPAD('#39' '#39', 30) "Table", LPAD('#39' '#39', 300) "Columns", LPAD('#39' '#39 +
        ', 30) "Foreign Key", LPAD('#39' '#39', 30) "Ref. Table", LPAD('#39' '#39', 300) ' +
        '"Ref. Columns", LPAD('#39' '#39', 30) "Ref. Constraint"'
      '  FROM DUAL'
      ' WHERE :P_TABLE_NAME = :P_TABLE_NAME'
      '   AND :P_OWNER = :P_OWNER')
    AutoCommit = False
    AfterOpen = ReferencedByQueryAfterOpen
    Left = 576
    Top = 166
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'P_TABLE_NAME'
      end
      item
        DataType = ftUnknown
        Name = 'P_OWNER'
      end>
  end
  object ReferencedByDataSource: TOraDataSource
    DataSet = ReferencedByQuery
    Left = 576
    Top = 220
  end
  object SynonymsQuery: TOraQuery
    SQL.Strings = (
      
        'SELECT owner "Synonym Owner", synonym_name "Synonym Name", table' +
        '_owner "Object Owner", table_name "Object Name"'
      '  FROM all_synonyms '
      ' WHERE table_name = :p_table_name '
      '   AND table_owner = :p_owner')
    FetchAll = True
    ReadOnly = True
    AutoCommit = False
    AfterOpen = SynonymsQueryAfterOpen
    AfterRefresh = SynonymsQueryAfterOpen
    Left = 368
    Top = 158
    ParamData = <
      item
        DataType = ftString
        Name = 'p_table_name'
        Value = 'INV_LASKU'
      end
      item
        DataType = ftUnknown
        Name = 'p_owner'
      end>
  end
  object SynonymsDataSource: TOraDataSource
    DataSet = SynonymsQuery
    Left = 370
    Top = 218
  end
  object SynSQLSyn: TSynSQLSyn
    CommentAttri.Foreground = clGreen
    ConditionalCommentAttri.Foreground = clGreen
    DataTypeAttri.Foreground = clRed
    DataTypeAttri.Style = []
    DefaultPackageAttri.Style = [fsBold, fsItalic]
    DelimitedIdentifierAttri.Foreground = clBlue
    ExceptionAttri.Foreground = clRed
    ExceptionAttri.Style = []
    FunctionAttri.Foreground = clBlue
    FunctionAttri.Style = []
    KeyAttri.Foreground = clBlue
    KeyAttri.Style = []
    PLSQLAttri.Foreground = clBlue
    PLSQLAttri.Style = []
    SQLPlusAttri.Foreground = clBlue
    SQLPlusAttri.Style = []
    StringAttri.Foreground = clPurple
    TableNameAttri.Foreground = clOlive
    VariableAttri.Foreground = clNavy
    SQLDialect = sqlOracle
    Left = 282
    Top = 306
  end
  object SourceQuery: TOraQuery
    SQL.Strings = (
      'SELECT comments'
      '  FROM all_tab_comments'
      ' WHERE table_name = :p_table_name'
      '   AND owner = :p_owner')
    FetchAll = True
    ReadOnly = True
    AutoCommit = False
    AfterOpen = SourceQueryAfterOpen
    Left = 120
    Top = 98
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'p_table_name'
      end
      item
        DataType = ftUnknown
        Name = 'p_owner'
      end>
  end
  object SourceDataSource: TOraDataSource
    DataSet = SourceQuery
    Left = 122
    Top = 212
  end
  object FilterDropDownMenu: TPopupMenu
    Left = 56
    Top = 306
    object est1: TMenuItem
      Action = RemoveCurrentFilterAction
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object NoFilterMenuItem: TMenuItem
      Action = NoFilterAction
      Caption = '<no filter>'
      GroupIndex = 1
      RadioItem = True
    end
  end
  object DataPopupMenu: TBCPopupMenu
    Images = ImageList
    Left = 180
    Top = 306
    object CustomizeTableColumns1: TMenuItem
      Action = CustomizeTableColumnsAction
      SubMenuImages = ImageList
    end
    object N6: TMenuItem
      Caption = '-'
    end
    object InsertRowMenuItem: TMenuItem
      Action = InsertRowAction
    end
    object DublicateRow1: TMenuItem
      Action = DuplicateRowAction
    end
    object DeleteRowMenuItem: TMenuItem
      Action = DeleteRowAction
    end
    object N4: TMenuItem
      Caption = '-'
    end
    object SelectAllMenuItem: TMenuItem
      Action = SelectAllAction
    end
    object N5: TMenuItem
      Caption = '-'
    end
    object CommitMenuItem: TMenuItem
      Action = CommitAction
    end
    object RollbackMenuItem: TMenuItem
      Action = RollbackAction
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object RefreshMenuItem: TMenuItem
      Action = RefreshAction
    end
    object N3: TMenuItem
      Caption = '-'
    end
    object ExportMenuItem: TMenuItem
      Action = ExportTableDataAction
    end
  end
  object SortDropDownMenu: TPopupMenu
    Left = 178
    Top = 358
    object MenuItem1: TMenuItem
      Action = RemoveCurrentSortAction
    end
    object MenuItem2: TMenuItem
      Caption = '-'
    end
    object NoSortMenuItem: TMenuItem
      Action = NoSortAction
      Caption = '<no sort>'
      Checked = True
      GroupIndex = 1
      RadioItem = True
    end
  end
  object PageControlPopupMenu: TBCPopupMenu
    Images = ImageList
    Left = 54
    Top = 358
    object CustomizePageControl1: TMenuItem
      Action = CustomizeAction
    end
  end
  object ConstraintColumnsQuery: TOraQuery
    SQL.Strings = (
      'SELECT a.position "Position",'
      '       a.table_name || '#39'.'#39' || a.column_name "Constraint Column",'
      '       b.table_name || '#39'.'#39' || b.column_name "Ref. Column",'
      '       b.table_name ref_table_name,'
      '       b.column_name ref_column_name'
      '  FROM all_cons_columns a, all_cons_columns b'
      ' WHERE a.constraint_name = :p_constraint_name'
      '   AND a.owner = :p_owner'
      '   AND b.constraint_name (+) = :p_r_constraint_name'
      '   AND b.owner (+) = :p_owner'
      '   AND b.position (+) = a.position'
      'ORDER BY 1')
    FetchAll = True
    ReadOnly = True
    AutoCommit = False
    Left = 264
    Top = 176
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'p_constraint_name'
      end
      item
        DataType = ftUnknown
        Name = 'p_owner'
      end
      item
        DataType = ftUnknown
        Name = 'p_r_constraint_name'
      end>
  end
  object ConstraintColumnsDataSource: TOraDataSource
    DataSet = ConstraintColumnsQuery
    Left = 264
    Top = 240
  end
end
