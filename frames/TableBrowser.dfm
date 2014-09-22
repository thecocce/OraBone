object TableBrowserFrame: TTableBrowserFrame
  Left = 0
  Top = 0
  Width = 826
  Height = 465
  Align = alClient
  Color = clWindow
  Ctl3D = False
  ParentBackground = False
  ParentColor = False
  ParentCtl3D = False
  TabOrder = 0
  object TablePageControl: TBCPageControl
    Left = 0
    Top = 0
    Width = 826
    Height = 465
    ActivePage = ReferencedByTabSheet
    Align = alClient
    DoubleBuffered = False
    ParentDoubleBuffered = False
    PopupMenu = PageControlPopupActionBar
    TabOrder = 0
    OnChange = TablePageControlChange
    ParentColor = False
    ActivePageCaption = 'Referenced By'
    TabDragDrop = False
    HoldShiftToDragDrop = False
    ShowCloseButton = False
    object ColumnsTabSheet: TTabSheet
      Caption = 'Columns'
      object ColumnsPanel: TPanel
        Left = 0
        Top = 0
        Width = 818
        Height = 415
        Align = alClient
        BevelOuter = bvNone
        Padding.Right = 2
        Padding.Bottom = 2
        TabOrder = 0
        object ColumnsDBGrid: TBCDBGrid
          Left = 0
          Top = 0
          Width = 816
          Height = 413
          Align = alClient
          AllowedSelections = [gstRecordBookmarks, gstAll]
          Ctl3D = True
          DataSource = ColumnsDataSource
          DrawGraphicData = True
          DrawMemoText = True
          DynProps = <>
          FooterParams.Color = clWindow
          IndicatorOptions = [gioShowRowIndicatorEh]
          IndicatorTitle.ShowDropDownSign = True
          IndicatorTitle.TitleButton = True
          IndicatorTitle.UseGlobalMenu = False
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
          OptionsEh = [dghFixed3D, dghClearSelection, dghRowHighlight, dghDialogFind, dghColumnResize, dghColumnMove, dghHotTrack, dghExtendVertLines]
          ParentCtl3D = False
          STFilter.InstantApply = False
          STFilter.Location = stflInTitleFilterEh
          TabOrder = 0
          object RowDetailData: TRowDetailPanelControlEh
          end
        end
      end
      object ColumnsButtonPanel: TPanel
        Left = 0
        Top = 415
        Width = 818
        Height = 22
        Align = alBottom
        BevelOuter = bvNone
        Color = clWindow
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
        end
        object CreationAndModificationTimestampLabel: TLabel
          AlignWithMargins = True
          Left = 812
          Top = 3
          Width = 3
          Height = 19
          Align = alRight
          ExplicitLeft = 437
          ExplicitHeight = 13
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
      object SourcePanel: TPanel
        Left = 0
        Top = 0
        Width = 818
        Height = 415
        Align = alClient
        BevelOuter = bvNone
        Padding.Right = 2
        Padding.Bottom = 1
        TabOrder = 0
        object SourceSynEdit: TSynEdit
          Left = 0
          Top = 0
          Width = 816
          Height = 414
          ActiveLine.Background = clYellow
          ActiveLine.Foreground = clNavy
          ActiveLine.Visible = True
          Align = alClient
          Background.Visible = False
          Background.RepeatMode = brmNone
          CodeFolding.CaseSensitive = False
          CodeFolding.FolderBarLinesColor = 12434877
          Ctl3D = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = []
          FontSmoothing = fsmNone
          Gutter.ShowLineModified = False
          Gutter.LineModifiedColor = clYellow
          Gutter.LineNormalColor = clLime
          Gutter.Intens = False
          Gutter.AutoSize = True
          Gutter.Font.Charset = DEFAULT_CHARSET
          Gutter.Font.Color = clWindowText
          Gutter.Font.Height = -11
          Gutter.Font.Name = 'Courier New'
          Gutter.Font.Style = []
          Gutter.BookmarkPanelColor = clNone
          Gutter.RightOffset = 2
          Gutter.RightOffsetColor = clNone
          Gutter.ShowLineNumbers = True
          Gutter.ShowBookmarks = False
          Gutter.ShowBookmarkPanel = False
          Gutter.Width = 34
          Highlighter = SynSQLSyn
          LineDivider.Visible = False
          LineDivider.Color = clRed
          LineDivider.Style = psSolid
          LineSpacing = 0
          LineSpacingRule = lsSpecified
          Options = [eoAutoIndent, eoDragDropEditing, eoEnhanceEndKey, eoGroupUndo, eoShowScrollHint, eoSmartTabDelete, eoSmartTabs, eoTabsToSpaces, eoTrimTrailingSpaces]
          ParentCtl3D = False
          ReadOnly = True
          RightEdge.MouseMove = False
          RightEdge.Visible = True
          RightEdge.Position = 80
          RightEdge.Color = clSilver
          RightEdge.Style = psSolid
          TabOrder = 0
          WantTabs = True
          WordWrap.Enabled = False
          WordWrap.Position = 80
          WordWrap.Style = wwsClientWidth
        end
      end
      object SourceButtonPanel: TPanel
        Left = 0
        Top = 415
        Width = 818
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
      object DataPanel: TPanel
        Left = 0
        Top = 0
        Width = 818
        Height = 415
        Align = alClient
        BevelOuter = bvNone
        Padding.Right = 2
        Padding.Bottom = 1
        TabOrder = 0
        object DataDBGrid: TBCDBGrid
          Left = 0
          Top = 0
          Width = 816
          Height = 414
          Align = alClient
          AllowedSelections = [gstRecordBookmarks, gstAll]
          Ctl3D = True
          DataSource = DataDataSource
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
          OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghRowHighlight, dghDialogFind, dghColumnResize, dghColumnMove, dghExtendVertLines]
          ParentCtl3D = False
          PopupMenu = DataPopupActionBar
          SearchPanel.Enabled = True
          SearchPanel.FilterOnTyping = True
          EditButtonsShowOptions = [sebShowOnlyForCurCellEh, sebShowOnlyForCurRowEh, sebShowOnlyWhenGridActiveEh, sebShowOnlyWhenDataEditingEh]
          STFilter.InstantApply = True
          TabOrder = 0
          OnAdvDrawDataCell = DataDBGridAdvDrawDataCell
          OnDblClick = DataDBGridDblClick
          OnMouseDown = DataDBGridMouseDown
          OnSelectionChanged = DataDBGridSelectionChanged
          OnTitleClick = DataDBGridTitleClick
          object RowDetailData: TRowDetailPanelControlEh
          end
        end
      end
      object DataButtonPanel: TPanel
        Left = 0
        Top = 415
        Width = 818
        Height = 22
        Align = alBottom
        BevelOuter = bvNone
        Color = clWindow
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
            DropdownMenu = SortDropDownPopupActionBar
            Style = tbsDropDown
          end
          object ToolButton1: TToolButton
            Left = 38
            Top = 0
            Action = FilterAction
            DropdownMenu = FilterDropDownPopupActionBar
            Style = tbsDropDown
          end
        end
        object DataDBNavigator: TDBNavigator
          Left = 650
          Top = 0
          Width = 168
          Height = 22
          DataSource = DataDataSource
          VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete]
          Align = alRight
          Flat = True
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
      object ConstraintSplitter: TSplitter
        Left = 0
        Top = 244
        Width = 818
        Height = 2
        Cursor = crVSplit
        Align = alBottom
        ExplicitTop = 81
        ExplicitWidth = 443
      end
      object ConstraintsClientPanel: TPanel
        Left = 0
        Top = 0
        Width = 818
        Height = 244
        Align = alClient
        BevelOuter = bvNone
        Padding.Right = 2
        TabOrder = 0
        object ConstraintsDBGrid: TBCDBGrid
          Left = 0
          Top = 0
          Width = 816
          Height = 220
          Align = alClient
          AllowedSelections = [gstRecordBookmarks, gstAll]
          Ctl3D = True
          DataSource = ConstraintsDataSource
          DrawMemoText = True
          DynProps = <>
          FooterParams.Color = clWindow
          IndicatorOptions = [gioShowRowIndicatorEh, gioShowRowselCheckboxesEh]
          IndicatorTitle.ShowDropDownSign = True
          IndicatorTitle.TitleButton = True
          IndicatorTitle.UseGlobalMenu = False
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
          ParentCtl3D = False
          ReadOnly = True
          TabOrder = 0
          OnSelectionChanged = ConstraintsDBGridSelectionChanged
          object RowDetailData: TRowDetailPanelControlEh
          end
        end
        object ConstraintButtonPanel: TPanel
          Left = 0
          Top = 220
          Width = 816
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
        Top = 246
        Width = 818
        Height = 191
        Align = alBottom
        BevelOuter = bvNone
        Padding.Right = 2
        Padding.Bottom = 1
        TabOrder = 1
        object ConstraintColumnsDBGrid: TBCDBGrid
          Left = 0
          Top = 0
          Width = 816
          Height = 190
          Align = alClient
          AllowedSelections = [gstRecordBookmarks, gstAll]
          Ctl3D = True
          DataSource = ConstraintColumnsDataSource
          DrawMemoText = True
          DynProps = <>
          FooterParams.Color = clWindow
          GridLineParams.VertEmptySpaceStyle = dessNonEh
          IndicatorOptions = [gioShowRowIndicatorEh]
          IndicatorTitle.ShowDropDownSign = True
          IndicatorTitle.TitleButton = True
          IndicatorTitle.UseGlobalMenu = False
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
          OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghDialogFind, dghColumnResize, dghColumnMove]
          ParentCtl3D = False
          ReadOnly = True
          TabOrder = 0
          object RowDetailData: TRowDetailPanelControlEh
          end
        end
      end
    end
    object TriggersTabSheet: TTabSheet
      Caption = 'Triggers'
      ImageIndex = 3
      object TriggersSplitter: TSplitter
        Left = 0
        Top = 165
        Width = 818
        Height = 2
        Cursor = crVSplit
        Align = alTop
        ExplicitWidth = 443
      end
      object TriggersTopPanel: TPanel
        Left = 0
        Top = 0
        Width = 818
        Height = 165
        Align = alTop
        BevelOuter = bvNone
        Padding.Right = 2
        TabOrder = 0
        object TriggersDBGrid: TBCDBGrid
          Left = 0
          Top = 0
          Width = 816
          Height = 141
          Align = alClient
          AllowedSelections = [gstRecordBookmarks, gstAll]
          Ctl3D = True
          DataSource = TriggersDataSource
          DrawMemoText = True
          DynProps = <>
          FooterParams.Color = clWindow
          IndicatorOptions = [gioShowRowIndicatorEh, gioShowRowselCheckboxesEh]
          IndicatorTitle.ShowDropDownSign = True
          IndicatorTitle.TitleButton = True
          IndicatorTitle.UseGlobalMenu = False
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
          OptionsEh = [dghFixed3D, dghHighlightFocus, dghDialogFind, dghColumnResize, dghColumnMove, dghExtendVertLines]
          ParentCtl3D = False
          ReadOnly = True
          TabOrder = 0
          OnSelectionChanged = TriggersDBGridSelectionChanged
          object RowDetailData: TRowDetailPanelControlEh
          end
        end
        object TriggersButtonPanel: TPanel
          Left = 0
          Top = 141
          Width = 816
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
        Width = 818
        Height = 270
        Align = alClient
        BevelOuter = bvNone
        Padding.Right = 2
        Padding.Bottom = 1
        TabOrder = 1
        object TriggerSynEdit: TSynEdit
          Left = 0
          Top = 0
          Width = 816
          Height = 269
          ActiveLine.Background = clYellow
          ActiveLine.Foreground = clNavy
          ActiveLine.Visible = True
          Align = alClient
          Background.Visible = False
          Background.RepeatMode = brmNone
          CodeFolding.CaseSensitive = False
          CodeFolding.FolderBarLinesColor = 12434877
          Ctl3D = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = []
          FontSmoothing = fsmNone
          Gutter.ShowLineModified = False
          Gutter.LineModifiedColor = clYellow
          Gutter.LineNormalColor = clLime
          Gutter.Intens = False
          Gutter.AutoSize = True
          Gutter.Font.Charset = DEFAULT_CHARSET
          Gutter.Font.Color = clWindowText
          Gutter.Font.Height = -11
          Gutter.Font.Name = 'Courier New'
          Gutter.Font.Style = []
          Gutter.BookmarkPanelColor = clNone
          Gutter.RightOffset = 2
          Gutter.RightOffsetColor = clNone
          Gutter.ShowLineNumbers = True
          Gutter.ShowBookmarks = False
          Gutter.ShowBookmarkPanel = False
          Gutter.Width = 34
          Highlighter = SynSQLSyn
          LineDivider.Visible = False
          LineDivider.Color = clRed
          LineDivider.Style = psSolid
          LineSpacing = 0
          LineSpacingRule = lsSpecified
          Options = [eoAutoIndent, eoDragDropEditing, eoEnhanceEndKey, eoGroupUndo, eoShowScrollHint, eoSmartTabDelete, eoSmartTabs, eoTabsToSpaces, eoTrimTrailingSpaces]
          ParentCtl3D = False
          ReadOnly = True
          RightEdge.MouseMove = False
          RightEdge.Visible = True
          RightEdge.Position = 80
          RightEdge.Color = clSilver
          RightEdge.Style = psSolid
          TabOrder = 0
          WantTabs = True
          WordWrap.Enabled = False
          WordWrap.Position = 80
          WordWrap.Style = wwsClientWidth
        end
      end
    end
    object IndexesTabSheet: TTabSheet
      Caption = 'Indexes'
      ImageIndex = 4
      object IndexesPanel: TPanel
        Left = 0
        Top = 0
        Width = 818
        Height = 415
        Align = alClient
        BevelOuter = bvNone
        Padding.Right = 2
        Padding.Bottom = 1
        TabOrder = 0
        object IndexesDBGrid: TBCDBGrid
          Left = 0
          Top = 0
          Width = 816
          Height = 414
          Align = alClient
          AllowedSelections = [gstRecordBookmarks, gstAll]
          Ctl3D = True
          DataSource = IndexesDataSource
          DrawMemoText = True
          DynProps = <>
          FooterParams.Color = clWindow
          IndicatorOptions = [gioShowRowIndicatorEh, gioShowRowselCheckboxesEh]
          IndicatorTitle.ShowDropDownSign = True
          IndicatorTitle.TitleButton = True
          IndicatorTitle.UseGlobalMenu = False
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
          OptionsEh = [dghFixed3D, dghHighlightFocus, dghDialogFind, dghColumnResize, dghColumnMove, dghExtendVertLines]
          ParentCtl3D = False
          ReadOnly = True
          TabOrder = 0
          OnSelectionChanged = IndexesDBGridSelectionChanged
          object RowDetailData: TRowDetailPanelControlEh
          end
        end
      end
      object IndexesButtonPanel: TPanel
        Left = 0
        Top = 415
        Width = 818
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
      object GrantsPanel: TPanel
        Left = 0
        Top = 0
        Width = 818
        Height = 415
        Align = alClient
        BevelOuter = bvNone
        Padding.Right = 2
        Padding.Bottom = 1
        TabOrder = 0
        object GrantsDBGrid: TBCDBGrid
          Left = 0
          Top = 0
          Width = 816
          Height = 414
          Align = alClient
          AllowedSelections = [gstRecordBookmarks, gstAll]
          Ctl3D = True
          DataSource = GrantsDataSource
          DrawMemoText = True
          DynProps = <>
          FooterParams.Color = clWindow
          IndicatorOptions = [gioShowRowIndicatorEh, gioShowRowselCheckboxesEh]
          IndicatorTitle.ShowDropDownSign = True
          IndicatorTitle.TitleButton = True
          IndicatorTitle.UseGlobalMenu = False
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
          OptionsEh = [dghFixed3D, dghHighlightFocus, dghDialogFind, dghColumnResize, dghColumnMove, dghExtendVertLines]
          ParentCtl3D = False
          ReadOnly = True
          TabOrder = 0
          OnSelectionChanged = GrantsDBGridSelectionChanged
          object RowDetailData: TRowDetailPanelControlEh
          end
        end
      end
      object GrantsButtonPanel: TPanel
        Left = 0
        Top = 415
        Width = 818
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
      object SynonymsPanel: TPanel
        Left = 0
        Top = 0
        Width = 818
        Height = 415
        Align = alClient
        BevelOuter = bvNone
        Padding.Right = 2
        Padding.Bottom = 1
        TabOrder = 0
        object SynonymsDBGrid: TBCDBGrid
          Left = 0
          Top = 0
          Width = 816
          Height = 414
          Align = alClient
          AllowedSelections = [gstRecordBookmarks, gstAll]
          Ctl3D = True
          DataSource = SynonymsDataSource
          DrawMemoText = True
          DynProps = <>
          FooterParams.Color = clWindow
          IndicatorOptions = [gioShowRowIndicatorEh, gioShowRowselCheckboxesEh]
          IndicatorTitle.ShowDropDownSign = True
          IndicatorTitle.TitleButton = True
          IndicatorTitle.UseGlobalMenu = False
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
          OptionsEh = [dghFixed3D, dghHighlightFocus, dghDialogFind, dghColumnResize, dghColumnMove, dghExtendVertLines]
          ParentCtl3D = False
          ReadOnly = True
          TabOrder = 0
          OnSelectionChanged = SynonymsDBGridSelectionChanged
          object RowDetailData: TRowDetailPanelControlEh
          end
        end
      end
      object SynonymsButtonPanel: TPanel
        Left = 0
        Top = 415
        Width = 818
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
      object ReferencedByPanel: TPanel
        Left = 0
        Top = 0
        Width = 818
        Height = 415
        Align = alClient
        BevelOuter = bvNone
        Padding.Right = 2
        Padding.Bottom = 1
        TabOrder = 0
        object ReferencedByDBGrid: TBCDBGrid
          Left = 0
          Top = 0
          Width = 816
          Height = 414
          Align = alClient
          AllowedSelections = [gstRecordBookmarks, gstAll]
          Ctl3D = True
          DataSource = ReferencedByDataSource
          DrawMemoText = True
          DynProps = <>
          FooterParams.Color = clWindow
          IndicatorOptions = [gioShowRowIndicatorEh]
          IndicatorTitle.ShowDropDownSign = True
          IndicatorTitle.TitleButton = True
          IndicatorTitle.UseGlobalMenu = False
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
          ParentCtl3D = False
          ReadOnly = True
          TabOrder = 0
          object RowDetailData: TRowDetailPanelControlEh
          end
        end
      end
      object ReferencedByButtonPanel: TPanel
        Left = 0
        Top = 415
        Width = 818
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
      object ReferencesPanel: TPanel
        Left = 0
        Top = 0
        Width = 818
        Height = 415
        Align = alClient
        BevelOuter = bvNone
        Padding.Right = 2
        Padding.Bottom = 1
        TabOrder = 0
        object ReferencesDBGrid: TBCDBGrid
          Left = 0
          Top = 0
          Width = 816
          Height = 414
          Align = alClient
          AllowedSelections = [gstRecordBookmarks, gstAll]
          Ctl3D = True
          DataSource = ReferencesDataSource
          DrawMemoText = True
          DynProps = <>
          FooterParams.Color = clWindow
          IndicatorOptions = [gioShowRowIndicatorEh]
          IndicatorTitle.ShowDropDownSign = True
          IndicatorTitle.TitleButton = True
          IndicatorTitle.UseGlobalMenu = False
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
          ParentCtl3D = False
          ReadOnly = True
          TabOrder = 0
          object RowDetailData: TRowDetailPanelControlEh
          end
        end
      end
      object ReferencesButtonPanel: TPanel
        Left = 0
        Top = 415
        Width = 818
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
      object DependenciesPanel: TPanel
        Left = 0
        Top = 0
        Width = 818
        Height = 415
        Align = alClient
        BevelOuter = bvNone
        Padding.Right = 2
        Padding.Bottom = 1
        TabOrder = 0
        object DependenciesDBGrid: TBCDBGrid
          Left = 0
          Top = 0
          Width = 816
          Height = 414
          Align = alClient
          AllowedSelections = [gstRecordBookmarks, gstAll]
          Ctl3D = True
          DataSource = DependenciesDataSource
          DrawMemoText = True
          DynProps = <>
          FooterParams.Color = clWindow
          IndicatorOptions = [gioShowRowIndicatorEh]
          IndicatorTitle.ShowDropDownSign = True
          IndicatorTitle.TitleButton = True
          IndicatorTitle.UseGlobalMenu = False
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
          ParentCtl3D = False
          ReadOnly = True
          TabOrder = 0
          object RowDetailData: TRowDetailPanelControlEh
          end
        end
      end
      object DependenciesButtonPanel: TPanel
        Left = 0
        Top = 415
        Width = 818
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
    Options.DeferredLobRead = True
    Options.CacheLobs = False
    Options.RawAsString = True
    Options.RequiredFields = False
    Options.StrictUpdate = False
    Left = 100
    Top = 98
    ParamData = <
      item
        DataType = ftWideString
        Name = 'p_table_name'
        Value = nil
      end
      item
        DataType = ftWideString
        Name = 'p_owner'
        Value = nil
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
    Left = 130
    Top = 38
    Bitmap = {
      494C01011E002100040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000008000000001002000000000000080
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
      00000000000000000000000000000000000000000000C3963A00B47B0800B47B
      0800B47B0800B47B0800B47B0800B47B0800B47B0800B47B0800B47B0800B47B
      0800B47B0800B47B0800B47B0800C3963A000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BB882500B67E0E00B47B0900B47A
      0700B47A0800B47B0800B47A0800B47A0800B47B0800B47A0800B47B0900B67E
      0F00BB88250000000000000000000000000010975D00007D3400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00BB8825000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B67E0E00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00B67F1000000000000000000000000000007F370045D6A90000834100FFFF
      FF00FFFFFF00FFFFFF00FDC7AF00FFFFFF00FFFFFF00FDC7AF00FFFFFF00FFFF
      FF00FDC7AF00FFFFFF00FFFFFF00B67E0E000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B47B0900FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00D7BFA400FFFFFF00FFFFFF00D7BFA500FFFFFF00FFFFFF00D3AF
      6900B47B090000000000000000000000000000813B0000DAA2005CD7B5000088
      4900FFFFFF00FFFFFF00449A6400007E3600007E3700007F3800007E3700007E
      3700007E36003E965F00FFFFFF00B47B09000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B47B0800FFFFFF00D5BB9C00D6BC
      9C00D8BEA000D9C1A300D8BFA100D8BFA100DBC3A800DCC6AF00DDC9B600B073
      0000FFFFFF00B3790600000000000000000000813B0000CFA00000CE9D006DDA
      BF00008B4C00FFFFFF000080390026E2B50000D59E0000D59E0000D59E0000D5
      9E0026E2B500007E3600FFFFFF00B57B08000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B47B0800FFFFFF00FFFEF700FFFF
      F700FFFFFB00D7BC9D00FFFFFC00FFFFFD00DAC1A700AF720000AF720000CFA8
      5A00FFFFFF00FFFFFF00B27904000000000000813B0000C8A00000C69E0080DE
      CA00008A4B00FDC7AF000080390078E3D8005BD9C9005DD9C9005DD9C9005BD9
      C90078E3D800007E3600FFFFFF00B67C09000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B47B0800FFFFFF00FFFCEE00FFFD
      EF00FFFFF300D7BB9800FFFFF400FFFFF500D8BD9C00FFFFF600FFFFF400FFFC
      EE00FFF8E800FFFAEC00FFFFFF00B67E0E0000823C0000C1A10093E0D2000087
      4700FFFFFF00FFFFFF0043986000007F3700007F370000803900007F3700007F
      3700007F38003D945A00FFFFFF00B87C0A000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B47B0800FFFFFF00D4B48E00D5B6
      9100D7B99400D8BB9700D7B99500D7B99500D8BB9900FFFFFF00FFFFFF00FFFF
      FF00FFF4DD00FFF6E100FFFFFF00B67E0E0000813A0095E0D40000833F00FFFF
      FF00FFFFFF00FFFFFF00FDC7AF00FFFFFF00FFFFFF00DAC5AB00FFFFFF00FFFF
      FF00DAC5AB00FFFFFF00FFFFFF00B87C0A000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B47B0800FFFFFF00FFF8E100FFF9
      E300FFFCE700D7B89000FFFCE800FFFDE900D9BC9600AD700000AE700000CEA3
      4E00FFF7DF00FFFFFF00B27804000000000011985A00007F3700FFFFFF00FCC2
      A200FCC2A200FCC2A200AF560000B05A0300B15B0500B25D0700B15B0500B25D
      0800B15B0500AF560000FFFFFF00B67C09000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B47B0800FFFFFF00FFF5D900FFF6
      DC00FFF9E000D7B58C00FFF9E100FFFAE100D9B89000FFFFEC00FFFFF100B073
      0000FFFFFF00B3790600000000000000000000000000B77C0A00FFFFFF00FFFF
      F200FFFFF200FFFFF200B15B0600EACFAD00EACEAC00CDA37100EACDAB00EACE
      AB00CDA37200B25C0600FFFFFF00B57B09000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B57B0900FFFFFF00DDB17D00E0B4
      7F00E0B68300DEB78700DFB68400DFB68400DEB88700E0B78600E0B88900D7B1
      6C00B57B080000000000000000000000000000000000B77C0A00FFFFFF00FFFF
      E700FFFFE700FFFFE700B15B0600EACFAD00EACEAC00CDA37200EACEAB00EACE
      AB00CDA37200B25C0600FFFFFF00B47B09000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B57C0900FFFFFF0044C3FF0049C5
      FF0047C6FF00E3B57E0046C7FF0046C7FF00E3B57E0046C6FF0045C6FF00FFFF
      FF00B67D0B0000000000000000000000000000000000B77C0A00FFFFFF00DDB4
      8000DEB68100E7B88600AF570000B05B0600B15C0800B25E0900B15C0800B35E
      0A00B25C0800AF570000FFFFFF00B57B09000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B67E0E00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00B67E0F0000000000000000000000000000000000B67C0900FFFFFF0048C4
      FF004CC6FF0048C7FF00E3B57E0046C7FF0046C7FF00E3B57E0046C7FF0046C7
      FF00E1B47E0040C4FF00FFFFFF00B57C09000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CFAA6000B67E0E00B67C0900B67B
      0700B67B0800B57B0800B67B0800B67B0800B57B0800B67B0800B67C0900B67E
      0E00CFAA600000000000000000000000000000000000B67E0E00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00B67E0E000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C4973C00B67E0E00B67C
      0900B67B0700B67B0800B57B0800B67B0800B67B0800B57B0800B67B0800B67B
      0800B57B0800B67C0900B67E0E00C3963A000000000000000000000000000000
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
      000000000000000000000000000000000000B4B4B400A6A6A600A4A4A400A4A4
      A400A4A4A400A4A4A400A4A4A400A4A4A400A4A4A400A4A4A400A4A4A400A4A4
      A400A4A4A400A6A6A600ACACAC00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007D7D7D000000
      0000848484000000000084848400000000007C7D7D00000000007C7D7D000000
      00007C7C7D00000000008686860000000000A6A6A600FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00A6A6A6000000000000000000BA892700B87F0F00B87C
      0B00B77C0A00B57B0900B47B0800B47A0800B47A0800B47B0800B47A0800B47A
      0800B47B0800B47B0900B67E0E00BB882500BC8F3300B67E0E00B47B0900B47A
      0700B47A0800B47B0800B47A0800B47A0800B47B0800B47B0800B57B0800B67C
      0800B67D0900B77F0E00BB882500000000008A8A8A00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000A5A4A500FFFFFF00FFFFFF00FFFF
      FF00EBE2E600FFFFFF00FFFEFE00E2E1DE00FFFFFF00FFFFFF00E8E7DF00FFFF
      FE00FDFDFD00FFFFFF00A4A4A4000000000000000000B87F0F00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00B67E0E00B67E0E00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00B87F0E000000000000000000FFFFFF00E5E4E300E5E4
      E300E6E5E400E7E6E400E6E5E400E6E5E300E6E5E300E6E4E300E6E5E300E6E4
      E300E5E4E300E5E4E300FFFFFF008B8B8B00A6A5A600FFFFFF0048AD8000007B
      30003EA27500FFFFFF00FFFDFD00E6E5DD006D78D4000D1FBB00616CC800FFFF
      FC00FCFBFA00FFFFFF00A4A4A4000000000010975D00007D3400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00DABEA500FFFFFF00FFFFFF00D9BDA400FFFFFF00FFFF
      FF00D9BDA300FFFFFF00FFFFFF00B47B0900B47B0900FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00D8BFA200FFFFFF00FFFFFF00D8BFA200FFFFFF00FFFFFF005D5F
      B300091EBF00FFFFFF00BD820800000000008A8A8A00FFFFFF00E1E0DF00E2E1
      E000E3E2E100E3E2E100E3E2E100E3E2E100E3E2E100E3E2E100E3E2E100E3E2
      E100E2E1E000E1E0DF00FFFFFF0000000000A7A6A600FFFFFF00007C3100CBFF
      E800007F3400EDE0E400E0DDDA00EBE9DB001425BE00C0D3FF001324BE00E9E7
      D900DADAD600FFFFFE00A4A4A40000000000007F370045D6A90000834100FFFF
      FF00FFFFFF00FFFFFF00E8C3A800FFFFFF00FFFFFF00EFC3AA00FFFFFF00FFFF
      FF00ECC2A800FFFFFF00FFFFFF00B57B0800B57B0800FFFFFF00FFFFFC00FFFF
      FB00FFFFFE00E9CC9D00FFFFFF00FFFFFF00E7CA9E00FFFFFF00FFFFFF001225
      BD00818EF5001329C900CC8C00000000000000000000FFFFFF00DEDCDB00E0DD
      DD00E0DEDD00BFBEBD007D7D7D007D7D7D007D7D7D00979797007D7D7D00E0DE
      DD00E0DDDD00DEDCDB00FFFFFF008A8A8A00A7A6A600FFFFFF0048AD7E00007F
      340000743100FFFFFF00FFFFFB00EEEADA00000CB1001828BF00000CB100FFFF
      F800FCFBF500FEFEFD00A5A5A5000000000000813B0000DAA2005CD7B5000088
      4900FCC2A200FDC7AF00449A6400007E3600007E3700007F3800007E3700007E
      3700007E36003E965F00FFFFFF00B67C0900B67C0800FFFFFF005E5FAF001124
      BB001628BC00172ABD001729BC001628BC001327BF006364B200F4D39B00182B
      BE00546AFF008D9BF5001C32CB00000000008A8A8A00FFFFFF00DAD9D700DBDB
      D800DCDBD9008A8A8900A3A3A200DCDBD900C9C8C7007D7D7D0083838300DCDB
      D900DBDBD800DAD9D700FFFFFF0000000000A6A6A600FFFFFD00FFFEFA00FFFF
      FF00F2E2E40000602400FFFFFF000000B400FFFFF600FFFFF500ECE8D7000000
      B000FFFFF300FFFFFA00A6A6A5000000000000813B0000CFA00000CE9D006DDA
      BF00008B4C00FFFFFF000080390026E2B50000D59E0000D59E0000D59E0000D5
      9E0026E2B500007E3600FFFFFF00B87C0A00B77D0800FFFFFF001124BE007386
      FF005066FC005167FC005167FC005066FC007487FF001428BF00FFFFF5001B2D
      BE004961F900465FF80098A3F4002839C40000000000FFFFFF00D6D4D200D7D6
      D400D8D7D5008F8F8F008F8F8F00BAB9B800D8D7D500AEADAC0083838300D8D7
      D500D7D6D400D6D4D200FFFFFF008A8A8A00A7A6A500FFFFFB000000B000EBE5
      D500EDE5D900F4E7DF0000662500EEE2DE00DFDAD600D7D5D100DAD9D200E3DF
      D3000000AF00FFFFFB00A7A6A5000000000000813B0000C8A00000C69E0080DE
      CA00008A4B00FFFFFF000080390078E3D8005BD9C9005DD9C9005DD9C9005BD9
      C90078E3D800007E3600FFFFFF00B87C0A00B77D0800FFFFFF001024BF0094A4
      FA007C8FF5007D90F5007D8FF5007C8FF50095A4FB001428C000FFFFEE001B2D
      BE003C56F3003853F100A1AEF5002839C4008A8A8B00FFFFFF00D1D0CE00D3D2
      D000D4D3D100C8C8C6008E8E8E007D7D7D007D7D7D007D7D7D0083838300D4D3
      D100D3D2D000D1D0CE00FFFFFF0000000000A6A6A500FFFDF800FFFDED00000D
      B2001A2AC100000DB700FFFFFA0000612500FFF5F800F5F0F100D4D1D000F9F4
      F000FDF6F100FFFDFC00A7A6A6000000000000823C0000C1A10093E0D2000087
      4700FCC2A200FCC2A20043986000007F3700007F370000803900007F3700007F
      3700007F38003D945A00FFFFFF00B67C0900B67C0800FFFFFF005E5DAB001024
      BE001427BF001528C0001528BF001427BF001126C2006362AF00F4CE8E00192C
      C1002A48F000A9B5F8001B30CB000000000000000000FFFFFF00CECCCB00D0CE
      CD00D1CFCE00C0BFBE00AAA9A800D1CFCE00D1CFCE00A4A3A30083828200D1CF
      CE00D0CECD00CECCCB00FFFFFF008B8B8B00A5A6A500FBF9F700F8F6E7001526
      BF00C1D4FF001627C100FFFAEE00E1D5D600005F2600FFF3F700E2D3D700FFF3
      F600005C2100FFFCFE00A7A6A6000000000000813A0095E0D40000833F00FFFF
      F200FFFFF200FFFFF200E6BC9600FFFFED00FFFFED00ECBC9600FFFFED00FFFF
      ED00E9BB9500FFFDE800FFFFFF00B57B0900B57B0800FFFFFF00FFFFDD00FFFF
      DE00FFFFE100E7C48B00FFFFE200FFFFE200E5C38C00FFFFE300FFFFE2001226
      C200A7B3F7001228C900CB8C0000000000008B8B8B00FFFFFF00CAC7C600CCCA
      C900CDCBCA00A8A7A6007D7D7D00A8A7A600A8A7A600888787008D8D8C00CDCB
      CA00CCCAC900CAC7C600FFFFFF0000000000A5A6A600F9F9F600D0CFC5005A65
      C2001224C0005B66C300D4D2C800D4CFCD00E2D3D70000643000008439000063
      2F00DED0D300FEFBFB00A6A6A6000000000011985A00007F3700FFFFFF00FFFF
      E700FFFFE700FFFFE700DCB78D00FFFAE000FFFAE000DBB68C00FFFAE000FFFA
      E000DAB68B00FFF8DC00FFFFFF00B47B0900B47B0800FFFFFF00FFF6D700FFF8
      D900FFFBDD00DAB88A00FFFCDE00FFFCDE00D9B78A00FFFCDE00FFFFDC005F5F
      AE000B21C400FFFFFF00BD8208000000000000000000FFFFFF00C5C4C200C8C7
      C500C9C8C600C9C8C600A6A5A40087878700828282008C8C8C00BFBEBC00C9C8
      C600C8C7C500C5C4C200FFFFFF008B8B8B00A5A6A600F7F6F500E4E3DE00EBEA
      E000D1D0C300ECEAE100E6E5E000C9C7C500F6E9EC0000823700CEFFEB000081
      3600F4E7EA00FBF7F700A6A6A6000000000000000000B77C0A00FFFFFF00DDB4
      8000DEB68100E7B88600DFB78600DFB68300DFB68300DEB78600DFB68300DFB6
      8300DDB68400DBB37F00FFFFFF00B57B0900B57B0900FFFFFF00DDB17C00E0B4
      7E00E0B68200DEB78600DFB68300DFB68300DEB78600E0B68300E3B98200E8BE
      8300E8BD7F00FFFFFF00B67D0900000000008B8B8B00FFFFFF00C1BFBD00C4C2
      C000C5C3C100C5C3C100C5C3C100C5C3C100C5C3C100C5C3C100C5C3C100C5C3
      C100C4C2C000C1BFBD00FFFFFF0000000000A6A6A600F6F6F500DCDBD900DEDD
      DA00C2C1BF00DEDDDB00DDDCDB00C3C0C000EAE0E2003EA37600007F33003EA3
      7600E8DEE100F8F7F600A6A6A6000000000000000000B67C0900FFFFFF0048C4
      FF004CC6FF0048C7FF00E3B57E0046C7FF0046C7FF00E3B57E0046C7FF0046C7
      FF00E1B47E0040C4FF00FFFFFF00B57C0900B57C0900FFFFFF0044C3FF0049C5
      FF0047C6FF00E3B57E0046C7FF0046C7FF00E3B57E0046C7FF0047C7FF00E3B6
      7E0042C6FF00FFFFFF00B67C09000000000000000000FFFFFF00B9B7B500BBB9
      B700BCBAB800BDBAB800BCBAB800BCBAB800BCBAB800BCBAB800BCBAB800BCBA
      B800BBB9B700B9B7B500FFFFFF008B8B8B00A7A7A700F9F8F700F6F5F400F6F5
      F400F6F5F400F6F5F400F6F5F400F7F5F500FBF7F700FFF9FB00FFFAFE00FFF9
      FB00FBF6F600FAF8F700A7A7A7000000000000000000B67E0E00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00B67E0E00B67E0E00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00B67E0E00000000008B8B8B00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000BDBDBD00A7A7A700A6A6A600A6A6
      A600A6A6A600A6A6A600A6A6A600A6A6A600A6A6A600A7A6A700A8A6A700A7A6
      A700A6A6A600A7A7A700AFAFAF000000000000000000C4973C00B67E0E00B67C
      0900B67B0700B67B0800B57B0800B67B0800B67B0800B57B0800B67B0800B67B
      0800B57B0800B67C0900B67E0E00C3963A00C9A04D00B67E0E00B67C0900B67B
      0700B67B0800B57B0800B67B0800B67B0800B57B0800B67B0800B67B0800B57B
      0800B67C0900B67E0E00C3963A000000000000000000000000007D7D7D000000
      0000848484000000000084848400000000007D7D7D00000000007D7D7D000000
      00007D7D7D000000000086868600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000009E
      5E00009D5D00009E5E0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000384D
      CC00384DCB00384DCC0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000002F76B6002E73B4002F73B3003073
      B4003077B6000000000000000000000000000000000000000000384DCC00384D
      CB00384DCC00000000000000000000000000B9B9B9009A9A9A00989898009898
      980098989800989898009898980098989800989898009898980000A66A0000BA
      860077DFC40000BA860000A66A0000000000B9B9B9009A9A9A00989898009898
      98009898980098989800989898009898980098989800989898003852D700385D
      F900375DFA00385DF9003852D700000000000000000000000000000000000000
      000000000000000000004F6B8700496686004F91DB0000000000000000000000
      0000000000000000000000000000000000002F75B5004FC8FC004DC3F8004DC4
      F8003887C5003378B6000000000000000000000000003852D700385DF900375D
      FA00385DF9003852D70000000000000000009A9A9A00FAF9F900F5F4F300F4F3
      F200F4F3F200F4F3F200F4F3F200F4F3F200F4F3F200009E5E0000C08C0000BB
      8200FFFFFF0000BB820000C08C00009E5E009A9A9A00FAF9F900F5F4F300F4F3
      F200F4F3F200F4F3F200F4F3F200F4F3F200F4F3F200344BCC004165FB003C60
      FA003A5DF8003C60FA004165FB00344BCC00BB882500B67E0E00B47B0900B47A
      0700B67B0600BF7D00005382A8007FA7B7008ED5FF002C68A500CD850000BD7F
      0800B67C0900B67E0E00BB882500000000004482BD003B92CE004DC1F6004CBF
      F4004DC3F8003176B50000000000000000003447CD004165FB003C60FA003A5D
      F8003C60FA004165FB00344BCC000000000099999900F3F1F100EBE9E900EBE8
      E900EBE9E900EBE9E900EBE9E900EBE9E900EBE9E900009C5C0077E5CC00FFFF
      FF00FFFFFF00FFFFFF0077E5CC00009C5C0099999900F3F1F100EBE9E900EBE8
      E900EBE9E900EBE9E900EBE9E900EBE9E900EBE9E9003148CA00A9BAFF00FFFF
      FF00FFFFFF00FFFFFF00A9BAFF003148CA00B67E0E00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0037A9F30088E4FF007FD3FF00109AFF002964A000FFFF
      FF00FFFFFF00FFFFFF00B67E0E0000000000000000004886BD003E92CC0053C6
      F80053C5F8002F72B0003377B4003580B6003142CC00A9B9FF00FFFFFF00FFFF
      FF00FFFFFF00A9BAFF003148CA000000000098999900EFEEEE00E8E6E600ECEA
      EA00EEECED00EFEDED00EFEDED00EFEDED00EFEDED00009D5D0000CC980000C8
      8F00FFFFFF0000C88F0000CC9800009D5D0098999900EFEEEE00E8E6E600ECEA
      EA00EEECED00EFEDED00EFEDED00EFEDED00EFEDED00334ACB005D79FF005776
      FE005473FD005776FE005D79FF00334ACB00B47B0900FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00DBBFA300FFFFFF001C6EC3003DC4FF002AAAFF001399FF00255D
      9300FFFFFF00FFFFFF00B57C09000000000000000000000000004986BE004294
      CD005ECCFC005CCBFA005ECEFC003178B100303FCA005C76FE005775FE005473
      FD005776FE005D79FF003349CC000000000099999900EEEDED00E7E6E5006764
      62006E6A68006E6B69006E6B69006E6B69006E6B69006E6B690000AE720000D4
      9E0077EDD40000D49E0000AE72000000000099999900EEEDED00E7E6E5006764
      62006E6A68006E6B69006E6B69006E6B69006E6B69006E6B6900465EDD007089
      FF00738CFF007089FF00465EDD0000000000B47A0800FFFFFF00FFFFFD00FFFF
      FD00FFFFFF00D9BFA100FFFFFF00FFFFFF002373C60043C7FF002AAAFF000F97
      FF001E5C9600FFFFFF00B97F0A00000000000000000000000000000000004A87
      BD004597CF0067D2FC0065CFFA0067D5FB004982DE004355DA006E85FF007389
      FF006F87FF00465BDE00000000000000000099999900EDECEB00E2E1E0005D5B
      580063605E0063615F0063615F0063615F0063615F0063615F0063605E00009C
      5D00009B5B00009C5D00999999000000000099999900EDECEB00E2E1E0005D5B
      580063605E0063615F0063615F0063615F0063615F0063615F0063605E00344A
      CB00334ACA00344ACB009999990000000000B47B0800FFFFFF00D4B99900D5BA
      9A00D6BC9E00D8BFA100D8BE9E00DEC09D00EEC79D002373C6003FC5FF0020A9
      FF007EACD50074717300C0840600000000000000000000000000000000000000
      00004D88BF004999CF0072D5FD005FC7F80048B7F4004279DC002D3AC6002D3C
      C600303EC800385EC300000000000000000099999900ECEBEB00D9D7D600FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00D9D7D600ECEBEB00999999000000000099999900ECEBEB00D9D7D600FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00D9D7D600ECEBEB009999990000000000B47B0800FFFFFF00FFFDF200FFFE
      F300FFFFF700D7BB9A00FFFFF800FFFFF800DEBE9900FFFFF5001B70C700ACD9
      F00091878000BEBEBB00737B7600000000000000000000000000000000000000
      0000000000003376B4006DD1FE0058BEF60075D7FC007ADDFD007AE0FE0078E0
      FF005DCBFC003F93CB000000000000000000999A9A00EBEAE900D6D3D200DBD9
      D800DEDCDB00DEDCDB00DEDCDB00DEDCDB00DEDCDB00DEDCDB00DEDCDB00DBD9
      D800D6D3D200EBEAE900999A9A0000000000999A9A00EBEAE900D6D3D200DBD9
      D800DEDCDB00DEDCDB00DEDCDB00DEDCDB00DEDCDB00DEDCDB00DEDCDB00DBD9
      D800D6D3D200EBEAE900999A9A0000000000B47B0800FFFFFF00FFFBEB00FFFC
      EC00FFFFF000D7BA9600FFFFF100FFFFF100D8BB9600FFFFF100FFFFF200807C
      7900E9E7E400888B8300B979B7009769CC000000000000000000000000000000
      0000000000003578B50062CAFE0081DCFE007FDBFD0080DDFF0082E0FF0083E0
      FF0085E2FF005AC0F6003C80B90000000000999A9A00EDEBEB00D6D4D1004745
      43004E4C4A004F4D4B004F4D4B004F4D4B004F4D4B004F4D4B004E4C4A004745
      4300D6D4D100EDEBEB00999A9A0000000000999A9A00EDEBEB00D6D4D1004745
      43004E4C4A004F4D4B004F4D4B004F4D4B004F4D4B004F4D4B004E4C4A004745
      4300D6D4D100EDEBEB00999A9A0000000000B47B0800FFFFFF00D4B38C00D5B5
      8F00D7B89200D8BA9500D7B89300D7B89300D8BA9500D8B99300DBBA9400E1C0
      97007A7E7B00DFAFE000CA95C800AE7CD0000000000000000000000000000000
      0000000000003B7FBA006FD5FF007CDAFD007CDAFD0070CAF1004C97CB004C98
      CC0073CEF40071D9FF003C7EB80000000000999A9A00EEEDEC00D0CDCC003D3A
      380043413E00444240004442400044424000444240004442400043413E003D3A
      3800D0CDCC00EEEDEC00999A9A0000000000999A9A00EEEDEC00D0CDCC003D3A
      380043413E00444240004442400044424000444240004442400043413E003D3A
      3800D0CDCC00EEEDEC00999A9A0000000000B47B0800FFFFFF00FFF7DF00FFF8
      E100FFFBE500D6B78F00FFFBE600FFFBE600D6B78F00FFFBE600FFFCE600D9BA
      9000FFFFE500B87ED700BB86DF00000000000000000000000000000000000000
      0000000000003A80BC0074DBFF0077D8FC0078DAFE004A96CB00000000000000
      00004D99CE0077E0FF003D7FBA0000000000999A9A00EEECEC00C6C2C200FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00C6C2C200EEECEC00999A9A0000000000999A9A00EEECEC00C6C2C200FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00C6C2C200EEECEC00999A9A0000000000B47B0800FFFFFF00FFF5D700FFF6
      D900FFF9DE00D7B58B00FFF9DF00FFF9DF00D7B58B00FFF9DF00FFF9DF00D8B6
      8A00FFFBDC00FFFFFF00B67E0000000000000000000000000000000000000000
      000000000000387BB8006FD3F80073D9FC0073DAFD004A97CC00000000000000
      00004D9BCF0073D7FB003F82BB0000000000999A9A00F0EFEE00BEBCBA00BFBD
      BB00BFBDBB00BFBDBA00BFBDBA00BFBDBA00BFBDBA00BFBDBA00BFBDBB00BFBD
      BB00BEBCBA00F0EFEE00999A9A0000000000999A9A00F0EFEE00BEBCBA00BFBD
      BB00BFBDBB00BFBDBA00BFBDBA00BFBDBA00BFBDBA00BFBDBA00BFBDBB00BFBD
      BB00BEBCBA00F0EFEE00999A9A0000000000B57B0900FFFFFF00DDB17C00E0B4
      7E00E0B68200DEB78600DFB68300DFB68300DEB78600DFB68300DFB68300DDB6
      8400DBB38000FFFFFF00B57C0700000000000000000000000000000000000000
      000000000000000000004B99CE0071DBFF006FD8FD0066C8F0004B99CD004D9A
      CF0069CEF5004F9ED1000000000000000000999A9A00F1F2F000B9B7B500BBB8
      B600BBB9B700BBB9B700BBB9B700BBB9B700BBB9B700BBB9B700BBB9B700BBB8
      B600B9B7B500F1F2F000999A9A0000000000999A9A00F1F2F000B9B7B500BBB8
      B600BBB9B700BBB9B700BBB9B700BBB9B700BBB9B700BBB9B700BBB9B700BBB8
      B600B9B7B500F1F2F000999A9A0000000000B57C0900FFFFFF0044C3FF0049C5
      FF0047C6FF00E3B57E0046C7FF0046C7FF00E3B57E0046C7FF0046C7FF00E1B4
      7E0040C4FF00FFFFFF00B57C0900000000000000000000000000000000000000
      000000000000000000004F8CC1004A99CE0067CEF6006EDBFF006FDDFF0069D3
      F9004E9ED100528FC20000000000000000009B9B9B00F9F7F600E0DEDD00E0DF
      DE00E1E0DF00E1E0DF00E1E0DF00E1E0DF00E1E0DF00E1E0DF00E1E0DF00E0DF
      DE00E0DEDD00F9F7F6009B9B9B00000000009B9B9B00F9F7F600E0DEDD00E0DF
      DE00E1E0DF00E1E0DF00E1E0DF00E1E0DF00E1E0DF00E1E0DF00E1E0DF00E0DF
      DE00E0DEDD00F9F7F6009B9B9B0000000000B67E0E00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00B67E0E00000000000000000000000000000000000000
      0000000000000000000000000000000000003E80BA003F80BA003F81BA003F82
      BB0000000000000000000000000000000000C9C9C9009B9B9B009A9A9A009A9B
      9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B009A9B
      9B009A9A9A009B9B9B00C9C9C90000000000C9C9C9009B9B9B009A9A9A009A9B
      9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B009B9B9B009A9B
      9B009A9A9A009B9B9B00C9C9C90000000000BD8C2700B67E0E00B67C0900B67B
      0700B67B0800B57B0800B67B0800B67B0800B57B0800B67B0800B67B0800B57B
      0800B67C0900B67E0E00BD8C2700000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000001C2D
      AD002131AD002233AD000000000000000000BC8F3300B67E0E00B47B0900B47A
      0700B47A0800B47B0800B47A0800B47A0800B47B0800B47A0800B47A0800009E
      5E00009D5D00009E5E00BB88250000000000BC8F3300B67E0E00B47B0900B47A
      0700B47A0800B47B0800B47A0800B47A0800B47B0800B47A0800B47A08001C2D
      AD002131AD002233AD00BB882500000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000005DA9CE004AA9D40051B3DA0050B0D800000000001B31BF00365D
      FA003961FE003960FA00283EC10000000000B67E0E00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000A66A0000BA
      860077DFC40000BA860000A66A0000000000B67E0E00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF001B31BF00365D
      FA003961FE003960FA00283EC100000000002F76B6002E73B4002F73B3003073
      B4003077B6000000000000000000000000000000000000000000009E5E00009D
      5D00009E5E000000000000000000000000000000000000000000000000000000
      00004CADD7006BD7F5007CEAFF0080EDFF0085F1FF000317A5003D61FB003C60
      FB003A5EF9003D61FB004366FD001E30AD00B47B0900FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00D6BDA200FFFFFF00FFFFFF00D6BDA200009E5E0000C08C0000BB
      8200FFFFFF0000BB820000C08C00009E5E00B47B0900FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00D6BDA200FFFFFF00FFFFFF00D6BDA2000317A5003D61FB003C60
      FB003A5EF9003D61FB004366FD001E30AD002F75B5004FC8FC004DC3F8004DC4
      F8003887C5003478B70000000000000000000000000000A6690000BA860077DF
      C40000BA860000A66A0000000000000000000000000000000000000000004BAC
      D7006EDFFE0061D0F4004EC0EA0041B4E0004EC6F0000417A400A7B9FF00FFFF
      FF00FFFFFF00FFFFFF00ACBDFF001B2DAC00B47A0800FFFFFF00FFFFFD00FFFF
      FD00FFFFFF00D7BEA000FFFFFF00FFFFFF00D7BEA000009C5C0077E5CC00FFFF
      FF00FFFFFF00FFFFFF0077E5CC00009C5C00B47A0800FFFFFF00FFFFFD00FFFF
      FD00FFFFFF00D7BEA000FFFFFF00FFFFFF00D7BEA0000417A400A7B9FF00FFFF
      FF00FFFFFF00FFFFFF00ACBDFF001B2DAC004482BD003B92CE004DC1F6004CBF
      F4004DC3F8003176B500000000000000000000A0570000C18B0000BB8200FFFF
      FF0000BB820000C08C00009E5E0000000000000000000000000048A9D30067DB
      FC0053C1EA0050BDE70056C4EB0037A1CF003DACDA000115A4005876FE005876
      FF005473FE005877FF005F7CFF001D2EAD00B47B0800FFFFFF00D4B99900D5BA
      9A00D6BC9E00D8BFA100D7BD9E00D7BD9E00D8BFA100009D5D0000CC980000C8
      8F00FFFFFF0000C88F0000CC9800009D5D00B47B0800FFFFFF00D4B99900D5BA
      9A00D6BC9E00D8BFA100D7BD9E00D7BD9E00D8BFA1000115A4005876FE005876
      FF005473FE005877FF005F7CFF001D2EAD00000000004886BD003E92CC0053C6
      F80053C5F8003072B1003476B6003B77C100009F520076E6CA00FFFFFF00FFFF
      FF00FFFFFF0077E5CC00009C5C00000000000000000045A3CE005DCFF50057C5
      EE0045ABDC0079E1FA007FE5FE005AD1F90058C8ED0066D0F000263BC3006B84
      FF00748CFF00718AFF00384DC80000000000B47B0800FFFFFF00FFFDF200FFFE
      F300FFFFF700D7BB9A00FFFFF800FFFFF800D7BB9A00FFFFF80000AE720000D4
      9E0077EDD40000D49E0000AE720000000000B47B0800FFFFFF00FFFDF200FFFE
      F300FFFFF700D7BB9A00FFFFF800FFFFF800D7BB9A00FFFFF800263BC3006B84
      FF00748CFF00718AFF00384DC8000000000000000000000000004986BE004294
      CD005ECCFC005CCBFA005ECDFE003670BA00009D4E0000CC940000C88E00FFFF
      FF0000C88F0000CC9700009D5C0000000000000000004FB9E2005ACEF70046A8
      D80046AADB0072D8F50093ECFF005ACBF3006EDFFD0061CCEE0056BBDE000518
      A6000F21AA00192BAD000000000000000000B47B0800FFFFFF00FFFBEB00FFFC
      EC00FFFFF000D7BA9600FFFFF100FFFFF100D7BA9600FFFFF100FFFFF100009C
      5D00009B5B00009C5D00B47B080000000000B47B0800FFFFFF00FFFBEB00FFFC
      EC00FFFFF000D7BA9600FFFFF100FFFFF100D7BA9600FFFFF100FFFFF1000518
      A6000F21AA00192BAD00B47B0800000000000000000000000000000000004A87
      BD004597CF0067D2FC0066CEFB006BD0FF002AB29D0000AC660000D2990075EC
      D10000D49B0000B06D00000000000000000046A4CF0056CEF70041A1D10048A8
      D90048ABDA004BB2E10062CEF10062D3F5006CDCFC006AD8F60053B6DA0047A7
      D00000000000000000000000000000000000B47B0800FFFFFF00D4B38C00D5B5
      8F00D7B89200D8BA9500D7B89300D7B89300D8BA9500D7B89300D7B89300D8B9
      9400D6B68F00FFFFFF00B47B080000000000B47B0800FFFFFF00D4B38C00D5B5
      8F00D7B89200D8BA9500D7B89300D7B89300D8BA9500D7B89300D7B89300D8B9
      9400D6B68F00FFFFFF00B47B0800000000000000000000000000000000000000
      00004D88BF004999CF0072D5FD0061C5FA004EB0FD0024AA9B00009649000096
      4B00009A4C0016928000000000000000000046A3CE0055D3FD002D7DB100388E
      C100368FC300308DC00051C3E90063D7FB0069DAFB0070DDFA0059BFE40057BB
      DF0000000000000000000000000000000000B47B0800FFFFFF00FFF7DF00FFF8
      E100FFFBE500D6B78F00FFFBE600FFFBE600D6B78F00FFFBE600FFFBE600D5B7
      8E00FFFAE300FFFFFF00B47B080000000000B47B0800FFFFFF00FFF7DF00FFF8
      E100FFFBE500D6B78F00FFFBE600FFFBE600D6B78F00FFFBE600FFFBE600D5B7
      8E00FFFAE300FFFFFF00B47B0800000000000000000000000000000000000000
      0000000000003376B4006DD1FE0059BDF70077D5FE007DD8FF0080D9FF007ED7
      FF0063C3FF00428DD100000000000000000047A4CE0052CFFC002976AB00297C
      B100389FCF0054CAF2007DDCFA0074D9FA0062D7F9006CDDFC0066D2F20062CC
      ED004BACD500000000000000000000000000B47B0800FFFFFF00FFF5D700FFF6
      D900FFF9DE00D7B58B00FFF9DF00FFF9DF00D7B58B00FFF9DF00FFF9DF00D7B5
      8A00FFF8DB00FFFFFF00B47B080000000000B47B0800FFFFFF00FFF5D700FFF6
      D900FFF9DE00D7B58B00FFF9DF00FFF9DF00D7B58B00FFF9DF00FFF9DF00D7B5
      8A00FFF8DB00FFFFFF00B47B0800000000000000000000000000000000000000
      0000000000003578B50062CAFE0081DCFE007FDBFE0081DCFF0082DEFF0084DF
      FF0085E1FF005BBFF7003C80BA0000000000000000004CBDE90050CEFA0071D9
      FC0083DDFC00AFEAFD00A0E4FA0086DBF8005CD2F80061D7F90069DAFA0061CB
      EE0059BFE400000000000000000000000000B57B0900FFFFFF00DDB17C00E0B4
      7E00E0B68200DEB78600DFB68300DFB68300DEB78600DFB68300DFB68300DDB6
      8400DBB37F00FFFFFF00B57B090000000000B57B0900FFFFFF00DDB17C00E0B4
      7E00E0B68200DEB78600DFB68300DFB68300DEB78600DFB68300DFB68300DDB6
      8400DBB37F00FFFFFF00B57B0900000000000000000000000000000000000000
      0000000000003B7FBA006FD5FF007CDAFD007CDAFD0070CAF1004C97CB004C98
      CC0073CEF40071D9FF003C7EB8000000000000000000000000004BBEEB0055CC
      F900D0F4FF00D2F4FF009DE1FA0081D8F800A1E3FB007EDBF90061D7FA0066D6
      F80060CBED0041A0CC000000000000000000B57C0900FFFFFF0044C3FF0049C5
      FF0047C6FF00E3B57E002839C4002839C400E3B57E0046C7FF0046C7FF00E1B4
      7E0040C4FF00FFFFFF00B57C090000000000B57C0900FFFFFF0044C3FF0049C5
      FF0047C6FF00E3B57E002839C4002839C400E3B57E0046C7FF0046C7FF00E1B4
      7E0040C4FF00FFFFFF00B57C0900000000000000000000000000000000000000
      0000000000003A80BC0074DBFF0077D8FC0078DAFE004A96CB00000000000000
      00004D99CE0077E0FF003D7FBA00000000000000000000000000000000000000
      00000000000053B0D80053B7DF00ACE0F500C7F0FE00ACE7FC007EDCFA0063D9
      FB0064D5F7003E9BC7000000000000000000B67E0E00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF001C32CB0098A3F400A1AEF5001B30CB00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00B67E0E0000000000B67E0E00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF001C32CB0098A3F400A1AEF5001B30CB00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00B67E0E00000000000000000000000000000000000000
      000000000000387BB8006FD3F80073D9FC0073DAFD004A97CC00000000000000
      00004D9BCF0073D7FB003F82BB00000000000000000000000000000000000000
      0000000000000000000000000000000000003EAAD70077D3F500A8E9FD0085E1
      FE005ABDE20046A7D3005FB5DE0000000000C9A04D00B67E0E00B67C0900B67B
      07001329C9008D9BF500465FF8003853F100A9B5F8001228C900B67B0800B57B
      0800B67C0900B67E0E00C3963A0000000000C9A04D00B67E0E00B67C0900B67B
      07001329C9008D9BF500465FF8003853F100A9B5F8001228C900B67B0800B57B
      0800B67C0900B67E0E00C3963A00000000000000000000000000000000000000
      000000000000000000004B99CE0071DBFF006FD8FD0066C8F0004B99CD004D9A
      CF0069CEF5004F9ED10000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000004BAED80056AD
      D50046A8D2006FE0FB005EB4DD0000000000000000000000000000000000091E
      BF00818EF500546AFF004961F9003C56F3002A48F000A7B3F7000B21C4000000
      000000000000000000000000000000000000000000000000000000000000091E
      BF00818EF500546AFF004961F9003C56F3002A48F000A7B3F7000B21C4000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000004F8CC1004A99CE0067CEF6006EDBFF006FDDFF0069D3
      F9004E9ED100528FC20000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00005FB5DE005EB4DD0000000000000000000000000000000000000000005D5F
      B3001225BD00182BBE001B2DBE001B2DBE00192CC1001226C2005F5FAE000000
      0000000000000000000000000000000000000000000000000000000000005D5F
      B3001225BD00182BBE001B2DBE001B2DBE00192CC1001226C2005F5FAE000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000003E80BA003F80BA003F81BA003F82
      BB00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000009E
      5E00009D5D00009E5E0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000001C2D
      AD002131AD002233AD0000000000000000000000000000000000000000000000
      0000000000005DA9CE004AA9D40051B3DA0053B0DC000000000000000000009E
      5D00009D5D00009E5E0000000000000000000000000000000000000000000000
      000000000000AC731400AD751900AC731600AC721400AB721400AA711300AA70
      1300AA701300AA711300AC741900B07A23000000000000000000000000000000
      0000000000000000000000000000A1613D00000000000000000000A66A0000BA
      860077DFC40000BA860000A66A00000000000000000000000000000000000000
      0000000000000000000000000000A1613D0000000000000000001B31BF00365D
      FA003961FE003960FA00283EC100000000000000000000000000000000000000
      00004CADD7006BD7F5007CEAFF0080EEFF008AF3FF0030B79E0000A4620000BA
      850077DFC40000BA860000A66A0000000000C3AB7A00B7821600B37A0600D7D0
      D400D8D1D300A96D0B00F7EFE300FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00AC7419000000000000000000000000000000
      000000000000A1613D00A1613D00A1613D00A1613D00009E5E0000C08C0000BB
      8200FFFFFF0000BB820000C08C00009E5E000000000000000000000000000000
      000000000000A1613D00A1613D00A1613D00A1613D000317A5003D61FB003C60
      FB003A5EF9003D61FB004366FD001E30AD000000000000000000000000004BAC
      D7006EDFFE0061D0F4004EC0EA0042B5E20057C9FB0000994C0000BF880000BB
      8200FFFFFF0000BB820000C08C00009E5E00B7821800F6CC8A00F0C17200F9F7
      FC00FFFFFF00A6690500F5EBDA00979A9F005354560095969700FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00AA7114000000000000000000000000000000
      00000000000000000000A1613D00A1613D00A1613D00009C5C0077E5CC00FFFF
      FF00FFFFFF00FFFFFF0077E5CC00009C5C000000000000000000000000000000
      00000000000000000000A1613D00A1613D00A1613D000417A400A7B9FF00FFFF
      FF00FFFFFF00FFFFFF00ACBDFF001B2DAC00000000000000000048A9D30067DB
      FC0053C1EA0050BDE70056C4EB0039A2D10046AFE70000994D0075E5C900FFFF
      FF00FFFFFF00FFFFFF0077E5CC00009C5C00B6811600F3CA8600EBB66000F8F5
      F800FFFFFF00A5680300F5EAD900FFFFFF0057575700FFFFFF00FBFBFA00F6F6
      F500F5F5F400F5F7F700FFFFFF00AA7113000000000000000000000000000000
      0000000000000000000000000000A1613D0000000000009D5D0000CC980000C8
      8F00FFFFFF0000C88F0000CC9800009D5D000000000000000000000000000000
      0000000000000000000000000000A1613D00000000000115A4005876FE005876
      FF005473FE005877FF005F7CFF001D2EAD000000000045A3CE005DCFF50057C5
      EE0045ABDC0079E1FA007FE5FE005BD1FB0061CBF80000984B0000CB930000C7
      8E00FFFFFF0000C88F0000CC9800009D5D00B6811600F1CA8900E8B15500F9F8
      FD00FAF8FB00A6690500F6ECDB008C8E9200545556008B8B8C00E3E2E300DFDE
      DE00DEDEDE00DDDEE000FFFFFF00AA7114000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000AE720000D4
      9E0077EDD40000D49E0000AE7200000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000263BC3006B84
      FF00748CFF00718AFF00384DC80000000000000000004FB9E2005ACEF70046A8
      D80046AADB0072D8F50093ECFF005BCBF40074E1FF0027B1990000AB660000D2
      9A0076EDD30000D39E0000AE720000000000B6811500F3CB8F00E6AD4D00FDFF
      FF00EEE7E500A76B0900F6EFE300FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00AC74190000000000A1613D00000000000000
      000000000000A1613D00A1613D00A1613D00A1613D00A1613D0000000000009C
      5D00009B5B00009C5D00000000000000000000000000A1613D00000000000000
      000000000000A1613D00A1613D00A1613D00A1613D00A1613D00000000000518
      A6000F21AA00192BAD00000000000000000046A4CF0056CEF70041A1D10048A8
      D90048ABDA004BB2E10062CEF10063D3F5006EDDFF0072DAFF0021A691000099
      4D00009A5100009C58000000000000000000B6811500F3D09500E4AA4600E8CB
      A500FFFFFF00A66D1000A76F1300A76D1000A66D0E00A66C0E00A56C0E00A56B
      0E00A66C0E00A96F1200AC741900B07A230000000000A1613D00A1613D000000
      000000000000A1613D00000000000000000000000000A1613D00000000000000
      0000A1613D00A1613D00000000000000000000000000A1613D00A1613D000000
      000000000000A1613D00000000000000000000000000A1613D00000000000000
      0000A1613D00A1613D00000000000000000046A3CE0055D3FD002D7DB100388E
      C100368FC300308DC00051C3E90063D7FB006ADAFC0072DDFD005DC0EA005EBB
      EA0000000000000000000000000000000000B6811500F3D39C00E3A53E00E2A2
      3700E4A13200E6A43700E7A53A00E7A63A00E7A63A00E7A63C00E7A84000E8AA
      4300F6D69E00B88212000000000000000000A1613D00A1613D00A1613D00A161
      3D0000000000A1613D00000000000000000000000000A1613D0000000000A161
      3D00A1613D00A1613D00A1613D0000000000A1613D00A1613D00A1613D00A161
      3D0000000000A1613D00000000000000000000000000A1613D0000000000A161
      3D00A1613D00A1613D00A1613D000000000047A4CE0052CFFC002976AB00297C
      B100389FCF0054CAF2007DDCFA0074D9FA0062D7F9006DDDFC0067D3F30063CC
      EF004FACDA00000000000000000000000000B6811400F4D5A400E09E3100F4E0
      B700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F4E1B800E19F
      3200F5D6A400B6811400000000000000000000000000A1613D00A1613D000000
      000000000000A1613D00000000000000000000000000A1613D00000000000000
      0000A1613D00A1613D00000000000000000000000000A1613D00A1613D000000
      000000000000A1613D00000000000000000000000000A1613D00000000000000
      0000A1613D00A1613D000000000000000000000000004CBDE90050CEFA0071D9
      FC0083DDFC00AFEAFD00A0E4FA0086DBF8005CD2F80061D7F90069DAFA0061CB
      EE0059BFE400000000000000000000000000B6801400F5DAAE00DF982200FCFF
      FF00797C8000A1A3A500FEFBF200797A7C00A3A4A600A0A3A700FBFEFF00DF97
      2200F5DAAE00B6801400000000000000000000000000A1613D00000000000000
      000000000000A1613D00A1613D00A1613D00A1613D00A1613D00000000000000
      000000000000A1613D00000000000000000000000000A1613D00000000000000
      000000000000A1613D00A1613D00A1613D00A1613D00A1613D00000000000000
      000000000000A1613D00000000000000000000000000000000004BBEEB0055CC
      F900D0F4FF00D2F4FF009DE1FA0081D8F800A1E3FB007EDBF90061D7FA0066D6
      F80060CBED0041A0CC000000000000000000B6801300F7DFB900DD921500FCFC
      FC00FDF8EC00FFF8EA00FDF6E800FCF6E800FBF4E700F9F4E800FAFAFA00DC91
      1500F7DFB900B680130000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000063B2D60053B0D80053B7DF00ACE0F500C7F0FE00ACE7FC007EDCFA0063D9
      FB0064D5F7003E9BC7000000000000000000B67F1200FAE5C500DA8C0900FEFE
      FF00787879007A797900A2A1A1009F9E9E00F5EBE0009B9B9D00FCFCFF00DA8C
      0900FAE5C500B67F120000000000000000000000000000000000000000000000
      0000000000000000000000000000A1613D000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000A1613D000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000003EAAD70077D3F500A8E9FD0085E1
      FE005ABDE20046A7D3005FB5DE0000000000B67F1200FBECD200D8840000FFFF
      FF00F1E5DA00F2E6DA00F2E6DA00F0E4D800EEE2D700EEE2D800FEFFFF00D883
      0000FBECD200B67F120000000000000000000000000000000000000000000000
      00000000000000000000A1613D00A1613D00A1613D0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000A1613D00A1613D00A1613D0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000063B2D6004BAED80056AD
      D50046A8D2006FE0FB005EB4DD0000000000B7811400FFECCD00FCE6C300FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FCE6
      C300FFECCD00B781140000000000000000000000000000000000000000000000
      000000000000A1613D00A1613D00A1613D00A1613D00A1613D00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000A1613D00A1613D00A1613D00A1613D00A1613D00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00005FB5DE005EB4DD000000000000000000DEC69500B7811400B57E0F00B57C
      0B00B57C0900B57C0900B57C0900B57C0900B57C0900B57C0900B57C0B00B57E
      0F00B7811400DEC6950000000000000000000000000000000000000000000000
      0000000000000000000000000000A1613D000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000A1613D000000000000000000000000000000
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
      0000000000000000000000000000C18C2600C4912B0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000E0EEE0008FC091003B8D3F00257A2900257729003B853F008FB99100E0EB
      E000000000000000000000000000000000000000000000000000000000000000
      0000E5E8F7009EA9E100546BC7003F59C0003A53BF004C67C20097A7DC00E1E6
      F500000000000000000000000000000000000000000000000000000000000000
      00000000000000000000B5B5B300B0B0AE00AEAEAC00ADADAB00ADADAB00ADAD
      AB00ADADAB00AEAEAB00AFAFAD00B5B5B3000000000000000000000000000000
      00000000000000000000C0891E00E7A84200EAB05400D9A44800000000000000
      000000000000000000000000000000000000000000000000000000000000B5D9
      B700318F350042A0520087CA9A009BD3AB009BD2AB0083C796003D974C00307C
      3400B5D0B600000000000000000000000000000000000000000000000000C3C9
      ED005566CC003C52CC00757AE8008F92EE008F92EE007178E400334DC100405C
      BE00B9C4E7000000000000000000000000000000000000000000000000000000
      00000000000000000000B0B0AE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00B0B0AD00BA892600B67E0E00B57C0900B57B
      0900B57B0900B47C0A00BF820F00FFF2D300E2A23900E8AF5100D9A34400B680
      1200B8811200BD8A270000000000000000000000000000000000B5DBBA00258F
      2A006DBE8300A8DBB50087CC980066BC7D0064BA7C0086CB9800A5D9B40066B7
      7D0024722700B5D1B60000000000000000000000000000000000C5C9EF005160
      CD005C65E000A1A6F5007E86EF005B63E900595DE7007D84EE009EA0F400515D
      D7003452BA00B9C4E70000000000000000000000000000000000000000000000
      00000000000000000000B0B0AD00F6F6F500ECECEB00FBFAFA00FDFDFD00FCFC
      FC00FBFBFC00FCFCFC00FFFFFF00AEAEAB00B67E0E00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00CFAD6800CA850900FFF0CE00E1A13500E9AC4800D5B4
      7100FFFFFF00BD810A00000000000000000000000000E1F2E40033A1440072C2
      8700A8DBB20060BC77005CBA730059B8700059B56F0058B56F005BB77400A5D9
      B30069B87F00317F3500E1ECE1000000000000000000E8EAF9006571D400616B
      E300A1ACF500545FEC00505CEA004D59E9004E59E6004C56E6005056E6009EA2
      F4005460D600405CBF00E2E7F50000000000B4B4B200AFAFAD00AEAEAB00ADAD
      AB00ADADAB00ADADAB00ACACAA00A9A9A700A8A8A600B8B7B600FBFAFA00F8F6
      F600F7F6F600F7F6F600FFFFFF00ADADAB00B57B0900FFFFFF00E5D5CB00E5D6
      CA00E5D5C900F9FCFF00FBFFFF00CBA86200CA830500FFEDC500DBB16C00B5B8
      C1006A6A6E006F6F750087898D00000000000000000090D29F004CB06400AADD
      B40064C179005FBE710075C58500D4ECD9008ACD990056B66C0058B56E005CB7
      7400A6DAB400419B4E008EBC90000000000000000000ACB0EA004B56DB00A2AB
      F6005664F0005266EE004D59E9004D59E9004D59E9004D59E9004C58E600525A
      E6009FA3F5003450C40096A6DC0000000000B0B0AD00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00A8A8A500F9F8F800F5F4
      F400F4F3F300F4F3F300FFFFFF00ADADAB00B47B0800FFFFFF00E3D1C200E4D2
      C300E4D1C000F1F3F400F2F4F600F4F9FF00C9A35900E0C28900D9DBE300CECD
      D000D3D4D400EEEEEF00ECEAED007C7B7A00000000003FB55D0091D29F008DD4
      9A0064C3740079C98700F2FAF400FFFFFF00FDFEFD0086CB960057B76D005BB9
      720085CC970087C79A003B8B3F0000000000000000007378DD00818CEE007E91
      F7005D73F3004D59E9004D59E9004D59E9004D59E9004D59E9004D59E9004F5B
      E9007B83F000757BE2004C64C40000000000AEAEAB00FFFFFF00FCFCFC00FBFB
      FC00FBFBFC00FBFBFC00FBFBFC00FCFCFC00FFFFFF00A7A7A500F5F5F400F1F1
      F000EFEFEE00EFEFEE00FFFFFF00ADADAB00B47B0900FFFFFF00E0CCBB00E1CE
      BC00E1CCB900ECEDEE00EBEBEB00ECECEE00EEF0F400F2F3F700A7A6A700DBD9
      DA00D1CFCF00767474007C7B7C00817F7F000000000027B04900A6DCAF0070CA
      7F0073CA8000F0F9F100FFFFFF00EBF7ED00FFFFFF00FBFDFC0088CD96005BB9
      710067BE7D00A0D7AF00237F260000000000000000006569DB00A1ABF7007086
      F8006882F600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF004D59
      E9005C66EA00969CF1003956BE0000000000ADADAB00FFFFFF00F7F6F600F7F6
      F600F7F6F600F7F6F600F7F6F600F7F6F600FFFFFF00A7A7A500F1F1F100EDED
      EC00EBEBEA00EBEBEA00FFFFFF00ADADAB00B57B0900FFFFFF00DDC6B300DEC9
      B500DEC7B200E6E7E800E5E4E400E5E4E400E7E6E600EDECEB0079777500D9D7
      D600C5C2C2007B7B7D000000000000000000000000002EB75100A7DDB10072CC
      800066C77300B0E1B700D2EED60063C17000B8E3BF00FFFFFF00FBFDFC008CD0
      990069C17E00A1D7AE00238426000000000000000000696EDC00AFB9F9007F93
      FA007085F000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF004D59
      E9005E6AEE00969DF1003D55C00000000000ADADAB00FFFFFF00F4F3F300F4F3
      F300F4F3F300F4F3F300F4F3F300F4F3F300FFFFFF00A8A8A500EDECEC00F4F3
      F300FFFFFF00FFFFFF00FFFFFF00AEAEAB00B57B0900FFFFFF00DAC1AA00DCC4
      AD00DCC3AA00DFE0E100DEDEDD00DEDDDC00DFDEDD00E5E4E30076737000E3E1
      E200B3B1AF008A8787008281830087858500000000004BC56C0095D7A10091D7
      9B0069C9760064C66F0061C46E0061C36F0061C26F00B9E4C000FFFFFF00E3F4
      E6008BD199008BCE9D003C993F0000000000000000007C7FE300A5AFF5009DAB
      FA00778CF000545FEC00545FEC00545FEC00545FEC00545FEC00545FEC006377
      F200818EF400787FE900566BC90000000000ADADAB00FFFFFF00F0F0EF00F0F0
      EF00F0F0EF00F0F0EF00EFEFEE00EFEFEE00FFFFFF00A8A8A500E9E8E700FFFF
      FF00CACAC900A4A4A200FFFFFF00AFAFAD00B57B0900FFFFFF00D4B89E00D5BA
      A000D6B99E00D5D6D800D5D5D500D5D4D400D6D5D500D9D9D900A3A2A000BDBB
      BB00F4F4F400E5E5E600C4C4C50089878500000000009BDFAD0057BF7000AFE1
      B7006DCC7A0068C8720065C7700063C56E0062C46E0063C47100B6E3BE006FC7
      7E00ACDFB50048A95E008FC894000000000000000000B5B5F0007D83EA00CDD4
      FC008B9DFA007E93F700758AEE006C84F6006C84F6006C84F6006C84F6006379
      F300A4AFF8003E4FD000A0ABE10000000000ADADAB00FFFFFF00ECECEB00EDED
      EC00EDEDEC00ECECEB00EBEBEA00EBEBEA00FFFFFF00A8A8A500E4E4E300FFFF
      FF00A4A4A200FFFFFF00E9E9E900CACAC800B57C0A00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00A8A9
      AF007D7D820082838900A0A1A6000000000000000000E5F7E90049C566007FCE
      9000AEE1B5006DCC7A006ACA760068C8720068C8740068C875006BC97900ACDF
      B40076C4890033A14200E1F1E3000000000000000000EBEBFB007978E300A3A7
      F300D4DBFD00879AFA007F91F0007A8EF1007F94F8007E92F900768CF800A8B6
      F800636EE3005868CD00E6E8F70000000000ADADAB00FFFFFF00E9E8E800EAE8
      E900E9E8E800F3F2F200FFFFFF00FFFFFF00FFFFFF00A9A9A600FFFFFF00FFFF
      FF00FFFFFF00E9E9E900CBCBC90000000000B57E0F00F7E0BE00E7B87000E8BE
      7A00E8BE7A00E8BD7900E8BD7800E8BD7800E7BD7700E8BD7700EABF7900ECBC
      7300FFE6C000BB80080000000000000000000000000000000000BFECCB003DC3
      5C007FCE9000AFE1B70092D89D0077CE830077CE830092D89D00AEE1B50078C8
      8B0027A13B00B5DFBE0000000000000000000000000000000000CFCFF600706F
      E100AAADF200D8DCFD00AEBAFA0091A3FA008B9DFA009CA9FB00BAC7FC00707B
      E9005462CE00C3C9EE000000000000000000AEAEAB00FFFFFF00E5E4E300E6E5
      E400E5E4E300FFFFFF00CACAC900A4A4A200FFFFFF00ADADAA00AFAFAD00AEAE
      AC00AFAFAD00CACAC8000000000000000000B6801300F2D8AE00CD840800D08A
      1300D28E1A00D4922200D5952900D8992F00D99B3600DB9F3E00DEA34500E0A6
      4A00F2D8AC00B78112000000000000000000000000000000000000000000C0ED
      CB004AC8690059C2740096D7A300A5DCAE00A5DCAE0095D6A10050B96A0035B3
      5500B6E3C100000000000000000000000000000000000000000000000000CFCF
      F6007979E2008E93ED00BEC3F800CCD3F900C4CBF900AAB4F4006670E200646E
      D600C6CAEF00000000000000000000000000AEAEAC00FFFFFF00E0E0DF00E0E0
      DF00E0E0DF00FFFFFF00A4A4A200FFFFFF00E9E9E900CCCCCB00000000000000
      000000000000000000000000000000000000B8821700EED09C00ECCE9900ECCF
      9A00ECCF9A00ECCE9A00ECCE9900ECCE9800EBCD9800EBCD9700EBCD9700EBCD
      9600EECF9A00B882170000000000000000000000000000000000000000000000
      0000E5F8E9009FE3B00055CB72003BC05C0037BE5A0049C36A0097DCAA00E1F5
      E700000000000000000000000000000000000000000000000000000000000000
      0000EBEBFB00B6B6F0007D7FE2006A6BDE00686BDC007479DE00AFB3EB00E8E9
      F90000000000000000000000000000000000AFAFAD00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00E9E9E900CBCBC90000000000000000000000
      000000000000000000000000000000000000BE8D2A00B8821700B7811600B781
      1600B7811600B7811600B7811600B7811500B7811500B6811500B6811500B781
      1500B8821700BF8E2D0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B8B8B600B0B0AD00AEAEAC00AEAE
      AB00ADADAB00AEAEAB00AFAFAD00BDBDBB000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000002B3ABE002B3A
      BE00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000009E
      5E00009D5D00009E5E0000000000000000000000000000000000000000000000
      000000000000000000005A6C7C004A6784005291D90000000000000000000000
      00000000000000000000000000000000000000000000C7C6C300BBB7AF00B2AC
      A000AFA99D00AEA99C00AEA89C00AEA89C00AEA89C00AFA99D002B3ABE005F73
      FE002B3ABE000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000749E770049854B004A844A004A84
      4A004B844B004B854D00749D760000000000000000005E92620000A66A0000BA
      860077DFC40000BA860000A66A0000000000749E770049854B004A844A004A84
      4A004B844B004B854D0060859F0082A7B60090D6FF00376A9B0049854C004A85
      4C00548C5800000000000000000000000000C1BEB900B4ADA200C2BBB000D0C7
      BE00DFD5CD00E6DCD4003140C0002B3ABE002B3ABE002B3ABE002B3ABE005A6E
      F9005A6EF9002B3ABE0000000000000000000000000000000000000000000000
      000000000000008C4C003EA07300000000000000000000000000000000000000
      00000000000000000000000000000000000048844B009EE8C90050C8920052C8
      930053C8940055CC99004A854C000000000000000000009E5E0000C08C0000BB
      8200FFFFFF0000BB820000C08C00009E5E0048844B009EE8C90050C8920052C8
      930053C8940055CC99004DB2F2008FE8FF0081D5FF00159BFF003D6D9B0053CC
      98004A854C00000000000000000000000000B1AB9F00C7C0B600CFC7BE00D5CC
      C300DBD2C900E2D8D0002B3ABE003E56F3005267F7005267F7005267F7005267
      F7005267F7005267F7002B3ABE00000000000000000000000000000000000000
      00000088470018C8910000874600000000000000000000000000000000000000
      00000000000000000000000000000000000047844A00BBEADD00B8E6D800B9E6
      D800BAE7D900BDEBDE0048854B000000000000000000009C5C0077E5CC00FFFF
      FF00FFFFFF00FFFFFF0077E5CC00009C5C0047844A00BBEADD00B8E6D800B9E6
      D800BAE7D900BDEBDE0048854B00307AC90044C8FF002CABFF001B9EFF003C6D
      9B0048854B00000000000000000000000000B1AB9F00C9C0B800CDC5BC00D4CB
      C200DAD1C800E1D7CF002B3ABE008696F8003E56F3003E56F3003E56F3003E56
      F3003E56F3003E56F3008696F8002B3ABE000000000000000000000000000088
      46003CCE9E0000DCA20000BC7F00009B5C00009D5F0000884700008948002497
      61000000000000000000000000000000000082AD860047844A00458247004582
      47004582470047844A00568F5A000000000000000000009D5D0000CC980000C8
      8F00FFFFFF0000C88F0000CC9800009D5D0082AD860047844A00458247004582
      47004582470047844A00568F5A0000000000307DCC0046C9FF002DACFF00179D
      FF00316BA200000000000000000000000000B0AB9E00C8BFB700CBC3BA00D2C9
      C000D8CFC500DFD5CD002B3ABE00A1ACF4008696F8008696F8008696F800A1AC
      F400334DF0008696F8002B3ABE00000000000000000000000000008C4A0061D8
      B50000D49E0000D29C0000D5A1005ADEC7005ADEC7005ADEC7005ADEC70000C2
      8C00009050000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000AE720000D4
      9E0077EDD40000D49E0000AE7200000000000000000000000000000000000000
      000000000000000000000000000000000000000000002877C90041C8FF0022AB
      FF0083B1D8007E797400A0856A0000000000B0AA9E00C9C2B900E2DDD400F5EF
      E900FFFBF400FEFAF3003140C0002B3ABE002B3ABE002B3ABE002B3ABE00A1AC
      F4008696F8002B3ABE0000000000000000000000000000000000000000000087
      440086EBDB0000C69F0000B1800000874500008D4D00009B6000009A5F0000B2
      800000B6890044A2770000000000000000000000000000000000729E77004885
      4B004A844A004B854D00749E77000000000000000000729E770048854B004A84
      4A00009B5B00009C5D0000000000000000000000000000000000729E77004885
      4B004A844A004B854D00749E77000000000000000000729E77002278CF00B0DD
      F40092888000C0BFBA00767C720000000000C1BDB600F9F4EE00D7D0C800C6BE
      B600BEB5AB00C2B9AF00C7BCB400C8BEB500C3B9B100BFB6AC002B3ABE00A1AC
      F4002B3ABE00C1BDB60000000000000000000000000000000000000000000000
      000000874200A3EEED0000884500000000000000000000000000000000003CA6
      750000A17100009153000000000000000000000000000000000046854B009EE8
      C90051C9930055CC98004A854C00000000000000000046854B009EE8C90051C9
      930055CC98004A854C000000000000000000000000000000000046854B009EE8
      C90051C9930055CC98004A854C00000000000000000046854B009EE8C9008884
      8000EAE8E500888B8200BA79B7009869CB00BBB7AF00A3998F00B6AEA400C8BF
      B600D8CFC700E3D9D100EADED800ECE1DA00E4DAD300DAD1C9003140C0002B3A
      BE00A49C9200BBB7AF0000000000000000000000000000000000008E4E000000
      000000000000008B480058B48900000000000000000046A27800008B4A000000
      000000000000008E4E000000000000000000000000000000000047844A00BBEA
      DD00B9E7D900BDEBDE0048854B00000000000000000047844A00BBEADD00B9E7
      D900BDEBDE0048854B000000000000000000000000000000000047844A00BBEA
      DD00B9E7D900BDEBDE0048854B00000000000000000047844A00BBEADD00B9E7
      D9007C7F7A00DFAFDF00CB96C700AE7DCF00B1AB9F00CAC1B900CEC7BE00D5CC
      C300DAD1C800E1D7CF00E8DCD600EADFD800E2D8D100DCD2CA00D6CEC500D1C9
      C000CBC4BA00B1AB9F00000000000000000000000000000000000093530000AE
      7000309A6800000000000000000000000000000000000088470018E8B4000086
      450000000000000000000000000000000000000000000000000083AE87004784
      4A004582480047844A0059915D00000000000000000083AE870047844A004582
      480047844A0059915D000000000000000000000000000000000083AE87004784
      4A004582480047844A0059915D00000000000000000083AE870047844A004582
      480047844A00BC81D700BF88DB0000000000B1AB9E00C8BFB700CBC3BA00D2C8
      BF00D8CEC500DFD5CD00E9DED800E9DDD600E0D6CF00DACFC700D3CBC200CEC6
      BD00C9C2B800B0AB9E000000000000000000000000000000000055B2880000C3
      870000BB7E00009D5F00009F6000008847000087450000BC800000DBA0003CE9
      BD00008745000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B0AA9D00C7C0B800E1DBD200F3ED
      E600FDF9F200FCF8F100FBF7F000FBF7F000FCF8F100FDF8F200F4EEE600E2DB
      D300CAC3B900AFAA9D000000000000000000000000000000000000000000008F
      500000C48C0000DBA9005ADEC7005ADEC7005ADEC70000D4A10000D19C0000D3
      9E0061DBB700008C4A0000000000000000000000000000000000000000005E92
      620049854C004A854C00548C58000000000000000000749E770049854B004A84
      4A004A844A004B844B004B854D00749D76000000000000000000000000005E92
      620049854C004A854C00548C58000000000000000000749E770049854B004A84
      4A004A844A004B844B004B854D00749D7600AEA89C00FBF5EF00EEE7DE00E3DC
      D300DDD5CC00DDD5CB00DDD4CB00DDD4CB00DDD4CB00DDD5CB00E3DCD300EEE7
      DE00FBF6EF00AEA89C0000000000000000000000000000000000000000000000
      00002D9F6A00008A490000894800008948000087450000B1800000C7A00086DC
      C500008744000000000000000000000000000000000000000000000000004784
      4B009EE9CA0053CC98004A854C00000000000000000048844B009EE8C90050C8
      920052C8930053C8940055CC99004A854C000000000000000000000000004784
      4B009EE9CA0053CC98004A854C00000000000000000048844B009EE8C90050C8
      920052C8930053C8940055CC99004A854C00AFA99D00E1D8CE00E1D8CE00DFD6
      CC00DFD6CB00DFD5CB00DFD5CB00DFD5CB00DFD5CB00DFD6CB00DFD6CC00E1D8
      CE00E1D8CE00AFA99D0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000894600A3E4DA000087
      4400000000000000000000000000000000000000000000000000000000004584
      4A00BCEBDE00BDEBDF0048854B00000000000000000047844A00BBEADD00B8E6
      D800B9E6D800BAE7D900BDEBDE0048854B000000000000000000000000004584
      4A00BCEBDE00BDEBDF0048854B00000000000000000047844A00BBEADD00B8E6
      D800B9E6D800BAE7D900BDEBDE0048854B00DCDAD400B6B0A400D2CABF00E2D9
      D000EFE7DD00EEE6DC00EEE6DC00EEE6DC00EEE6DC00EFE7DD00E2D9D000D2CA
      BF00B6B0A400DCDAD40000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000004EB08300008C49000000
      00000000000000000000000000000000000000000000000000000000000083AF
      890047844A0047844A0077A57A00000000000000000082AD860047844A004582
      4700458247004582470047844A00568F5A0000000000000000000000000083AF
      890047844A0047844A0077A57A00000000000000000082AD860047844A004582
      4700458247004582470047844A00568F5A000000000000000000CBC7BF00B2AC
      A100AEA89C00AEA89C00AEA89C00AEA89C00AEA89C00AEA89C00B2ACA100CBC7
      BF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000009E
      5E00009D5D00009E5E0000000000000000000000000000000000000000000000
      000000000000000000004F6B8700496686004F91DB0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000834200008A
      4A00000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BB8B4F00BB87470000A66A0000BA
      860077DFC40000BA860000A66A00000000000000000000000000000000000000
      000000000000000000005382A8007FA7B7008ED5FF002C68A500000000000000
      000000000000000000000000000000000000BABAB900AFAFAD00AEAEAB00ADAD
      AB00ADADAB00ADAEAB00AFAFAE00B2B3B000B2AEA600B0AB9F00AFA99C00AEA8
      9C00AEA99C00B0AA9E00BAB6AE000000000000000000C7C6C300BBB7AF00B2AC
      A000AFA99D00AEA99C00AEA89C0097928800AEA89C000083420000E4A6000088
      47009F9E9C000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CC9A5400009E5E0000C08C0000BB
      8200FFFFFF0000BB820000C08C00009E5E000000000000000000000000000000
      0000000000000000000037A9F30088E4FF007FD3FF00109AFF002964A0000000
      000000000000000000000000000000000000B0B0AD00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00C5BFB500B7B1A400D3C9C100E4DAD200EFE4
      DD00E8DDD600D5CDC400B9B4A700B7B2A700C1BEB900B4ADA200C2BBB000D0C7
      BE00DFD5CD00E6DCD400CDC3BE00EFE4DD000083420000D8A00000D9A1000083
      42000087460000884700008A48000D8454000000000000000000000000000000
      0000000000000000000000000000E9C59000DAAB6200009C5C0077E5CC00FFFF
      FF00FFFFFF00FFFFFF0077E5CC00009C5C000000000000000000000000000000
      00000000000000000000000000001C6EC3003DC4FF002AAAFF001399FF00255D
      930000000000000000000000000000000000AEAEAB00FFFFFF00FDFDFD00FCFC
      FD00FCFCFD00FDFDFE00FFFFFF00A9A29400C8C1B700D4CCC300E1D6CE00EBE1
      D900E4DAD200D7D0C700CDC6BC00B1AB9F00B1AB9F00C7C0B600CFC7BE00D5CC
      C300DBD2C900E2D8D000E9DDD7000083420000D39F0000D09C0000D09C0000D5
      9F0000D7A00000D7A00043E8C200008947000000000000000000000000000000
      00000000000000000000B57F3D00FFF1D000D8A85D00009D5D0000CC980000C8
      8F00FFFFFF0000C88F0000CC9800009D5D000000000000000000000000000000
      00000000000000000000B57F3D00FFF1D0002373C60043C7FF002AAAFF000F97
      FF001E5C9600000000000000000000000000ADADAB00FFFFFF00FAF8F800F9F8
      F800F9F8F800FAF9FA00FFFFFF00A9A29500C7C0B600D3CBC200DFD5CD00EAE0
      D800E3D8D000D6CEC500CCC5BB00B0AA9E00B1AB9F00C9C0B800CDC5BC00D4CB
      C200DAD1C800E1D7CF00008A470063E6CD0000CA9A0000C8980000C7970000C8
      990000C8990000C899006FE8D000008845000000000000000000000000000000
      00000000000000000000B37C3A00FFFFFA00D5A55A00B580400000AE720000D4
      9E0077EDD40000D49E0000AE7200000000000000000000000000000000000000
      00000000000000000000B37C3A00FFFFFA00D5A55A002373C6003FC5FF0020A9
      FF007EACD500747173000000000000000000ADADAB00FFFFFF00F6F6F600F6F6
      F600F6F6F600F7F7F800FCFDFF00A9A29500C6BFB400D1C8C000DED3CB00E8DE
      D600E1D6CE00D4CCC300CAC3B900B0AA9E00B0AB9E00C8BFB700CBC3BA00D2C9
      C000D8CFC500DFD5CD00E9DFD8000083420060E0C70000C3970094E8D8004DE6
      D10051E8D4004FE9D50099F0E400008946000000000000000000000000000000
      00000000000000000000DEAE6900F9D39400EBC17E00D9AB6A0000000000009C
      5D00009B5B00009C5D0000000000000000000000000000000000000000000000
      00000000000000000000DEAE6900F9D39400EBC17E00D9AB6A001B70C700ACD9
      F00091878000BEBEBB00737B760000000000ADADAB00FFFFFF00F4F4F300F4F4
      F300F4F4F300F5F5F500FAFBFB00A8A19400E3DDD600F8F4EE00FDF9F200F9F5
      ED00FDF8F200F9F4EE00E6DFD800AEA99C00B0AA9E00C9C2B900E2DDD400F5EF
      E900FFFBF400FEFAF300FDF9F200FDF9F200008342005ADAC40082E4D6000082
      3B00008642000087440000894600108457000000000000000000000000000000
      000000000000EDC18200F9D29300F4CD8D00EEC68300EAC18000DFB576000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000EDC18200F9D29300F4CD8D00EEC68300EAC18000DFB57600807C
      7900E9E7E400888B8300B979B7009769CC00ADADAB00FFFFFF00F2F1F000F2F1
      F000F2F1F000F3F2F100F7F7F700A7A09300EDE5DC00DCD3C800D8CFC500D8CF
      C500D8CFC500DDD3C900EFE7DE00AEA99C00C1BDB600F9F4EE00D7D0C800C6BE
      B600BEB5AB00C2B9AF00C7BCB400C8BEB500C3B9B100008342007AE4D8000088
      4400F9F5ED00C1BDB60000000000000000000000000000000000000000000000
      0000EEC78F00F8D6A000F6CF8F00EFC98600E9C07D00E3B87300E6C28900DCB5
      7D00000000000000000000000000000000000000000000000000000000000000
      0000EEC78F00F8D6A000F6CF8F00EFC98600E9C07D00E3B87300E6C28900DCB5
      7D007A7E7B00DFAFE000CA95C800AE7CD000ADADAB00FFFFFF00EFEFEE00EFEF
      EE00EFEFEE00EFF0EF00F3F4F300BAB5AB00C8C0B400E7DFD500ECE4DA00ECE4
      DA00EDE5DB00E9E1D700CCC5BA00BDB8AE00BBB7AF00A3998F00B6AEA400C8BF
      B600D8CFC700E3D9D100EADED800ECE1DA00E4DAD300DAD1C90000834200008C
      4900A49C9200BBB7AF000000000000000000000000000000000000000000EFCF
      9F00FBDBAE00F5CC8900F2CB8A00ECC28000E6BB7600DFB36B00D9AA6300E4C4
      9400DBB78600000000000000000000000000000000000000000000000000EFCF
      9F00FBDBAE00F5CC8900F2CB8A00ECC28000E6BB7600DFB36B00D9AA6300E4C4
      9400DBB78600B87ED700BB86DF0000000000ADADAB00FFFFFF00ECEBEA00EDEC
      EB00EDECEB00EDECEB00EFEEED00ECEBEB00C7C3BB00ACA59800A7A09300A8A2
      9400ACA59800AEA89C00D1CDC60000000000B1AB9F00CAC1B900CEC7BE00D5CC
      C300DAD1C800E1D7CF00E8DCD600EADFD800E2D8D100DCD2CA00D6CEC500D1C9
      C000CBC4BA00B1AB9F0000000000000000000000000000000000F1D6AF00FDE8
      C600F6CC8900F3CA8700EDC37E00E7BC7600E1B56C00DCAD6300D7A55A00D2A0
      5500E6CCA600DDBF950000000000000000000000000000000000F1D6AF00FDE8
      C600F6CC8900F3CA8700EDC37E00E7BC7600E1B56C00DCAD6300D7A55A00D2A0
      5500E6CCA600DDBF95000000000000000000ADADAB00FFFFFF00E9E9E800EAEA
      E900EAEAE900EAEAE900E9EAE900F5F5F400FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00AFB0B000000000000000000000000000B1AB9E00C8BFB700CBC3BA00D2C8
      BF00D8CEC500DFD5CD00E9DED800E9DDD600E0D6CF00DACFC700D3CBC200CEC6
      BD00C9C2B800B0AB9E00000000000000000000000000FFEDCC00FFF2DD00FADA
      A700FDE8C700FFF3E000FDF3E300F7E7CC00F5E4CA00F6EAD700F3E2CB00E8CE
      A500D9B37B00EFDEC600E4CDA9000000000000000000FFEDCC00FFF2DD00FADA
      A700FDE8C700FFF3E000FDF3E300F7E7CC00F5E4CA00F6EAD700F3E2CB00E8CE
      A500D9B37B00EFDEC600E4CDA90000000000ADAEAB00FFFFFF00E7E5E400E8E7
      E600E8E7E600E8E7E600E7E5E400FFFFFF00CCCCCB00A7A7A500A6A6A400FFFF
      FF00AFAFAE00000000000000000000000000B0AA9D00C7C0B800E1DBD200F3ED
      E600FDF9F200FCF8F100FBF7F000FBF7F000FCF8F100FDF8F200F4EEE600E2DB
      D300CAC3B900AFAA9D000000000000000000B57E3A00FFFEF200F5E3C600E8CE
      A400DEBB8500D3A55E00D19B4900D7A24F00DBA65400D29A4500D3A65F00D6AF
      7300D7B47D00DDC09600EEDEC600B7803D00B57E3A00FFFEF200F5E3C600E8CE
      A400DEBB8500D3A55E00D19B4900D7A24F00DBA65400D29A4500D3A65F00D6AF
      7300D7B47D00DDC09600EEDEC600B7803D00AEAEAB00FFFFFF00E3E3E200E4E4
      E300E4E5E400E4E4E300E3E3E200FFFFFF00A7A7A400EBEBEA00FFFFFF00E9E9
      E900CACAC800000000000000000000000000AEA89C00FBF5EF00EEE7DE00E3DC
      D300DDD5CC00DDD5CB00DDD4CB00DDD4CB00DDD4CB00DDD5CB00E3DCD300EEE7
      DE00FBF6EF00AEA89C000000000000000000B57E3A00FFFFFF00A0620000AF72
      1200B9802300C58C3200CF974200D8A45100DDA85600D39C4800C9913900BF87
      2B00B57A1C00A96B0700F7EDE000B7813E00B57E3A00FFFFFF00A0620000AF72
      1200B9802300C58C3200CF974200D8A45100DDA85600D39C4800C9913900BF87
      2B00B57A1C00A96B0700F7EDE000B7813E00AEAEAC00FFFFFF00E0DFDE00E1DF
      DE00E1E0DF00E1DFDE00E0DFDE00FFFFFF00A5A5A300FFFFFF00E8E8E800CBCB
      C90000000000000000000000000000000000AFA99D00E1D8CE00E1D8CE00DFD6
      CC00DFD6CB00DFD5CB00DFD5CB00DFD5CB00DFD5CB00DFD6CB00DFD6CC00E1D8
      CE00E1D8CE00AFA99D000000000000000000B67F3C00FFF6DC00E8C28400F0D2
      A200F5E0C000F6E2C200F6E3C100F5E0C000F4DFBC00F0DAB700ECD5B200E9D2
      AD00DBBA8600CEA36000E0C39900B8824100B67F3C00FFF6DC00E8C28400F0D2
      A200F5E0C000F6E2C200F6E3C100F5E0C000F4DFBC00F0DAB700ECD5B200E9D2
      AD00DBBA8600CEA36000E0C39900B8824100AFAFAD00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E9E9E900CACAC9000000
      000000000000000000000000000000000000DCDAD400B6B0A400D2CABF00E2D9
      D000EFE7DD00EEE6DC00EEE6DC00EEE6DC00EEE6DC00EFE7DD00E2D9D000D2CA
      BF00B6B0A400DCDAD40000000000000000000000000000000000D5AB7400CA9B
      5A00C6945200C6935100C4914D00C6975E00C2904F00C08B4800BF8B4700BE89
      4600C18E4D00CA9F670000000000000000000000000000000000D5AB7400CA9B
      5A00C6945200C6935100C4914D00C6975E00C2904F00C08B4800BF8B4700BE89
      4600C18E4D00CA9F67000000000000000000B8B8B600B0B0AD00AEAEAC00AEAE
      AB00AEAEAB00AEAEAB00ADAEAB00AEAEAB00AFAFAD00B7B7B500000000000000
      0000000000000000000000000000000000000000000000000000CBC7BF00B2AC
      A100AEA89C00AEA89C00AEA89C00AEA89C00AEA89C00AEA89C00B2ACA100CBC7
      BF0000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000800000000100010000000000000400000000000000000000
      000000000000000000000000FFFFFF00FFFFFFFF00000000FFFF800000000000
      0007000000000000000700000000000000070000000000000003000000000000
      0001000000000000000000000000000000000000000000000001000000000000
      0003800000000000000780000000000000078000000000000007800000000000
      0007800000000000FFFF800000000000FFFFFFFFFFFFFFFF0001FFFFFFFFD555
      0001800000010001000180000001800000010000000100010001000000018000
      0001000000010001000100000000800000010000000000010001000000018000
      0001000000010001000100000001800000018000000100010001800000018000
      0001800000010001000180000001D555FFFFFFE3FFE3FFFF07C700010001FC7F
      038300000000000103010000000000018001000000000001C001000100010001
      E003000100010001F003000100010001F803000100010000F801000100010000
      F801000100010001F831000100010001F831000100010001FC03000100010001
      FC03000100010001FF0F000100010001FFE300010001FFFFF8410001000107C7
      F000000000000383E000000000000301C000000000008001800100010001C001
      800300010001E003000F00010001F003000F00010001F803000700010001F801
      800700010001F801C00300010001F831F80300010001F831FF0100010001FC03
      FFC1E01FE01FFC03FFF3E01FE01FFF0FFFFFFFE3FFE3F863F800FEC1FEC1F001
      0000F800F800E0000000FC00FC00C0000000FE80FE8080000000FFC1FFC18001
      0000B823B823000300009BB39BB3000F00030BA10BA1000700039BB39BB38007
      0003B83BB83BC0030003FFFFFFFFF0030003FEFFFEFFFF010003FC7FFC7FFF81
      0003F83FF83FFFF30003FEFFFEFFFFFFFFFFFFFFFFFFFFFFFE7FF00FF00FFC00
      FC3FE007E007FC000003C003C003FC0000038001800100000001800180010000
      0000800180010000000080018001000000038001800100000000800180010000
      000080018001000000018001800100010003C003C00300030003E007E007003F
      0003F00FF00F007F0003FFFFFFFF00FFFFCFFFFFFFE3FC7F8007FFFF01810007
      0003F9FF018000070001F1FF018000070000E00F018001070001C007FFC1FF81
      0003E003C183C1810003F1E3C183C1800003D99BC183C1800003C78FC183C181
      0003C007FFFFFFFF0003E003E180E1800003F007E180E1800003FF8FE180E180
      0003FF9FE180E180C00FFFFFFFFFFFFFFFE3FC7FFFFFFFCFFF01FC3F00018007
      FF00FC1F00000000FE00FE0F00000000FC00FC0700000000FC01FC0300000000
      FC23FC0100000000F81FF80000000003F00FF00000000003E007E00100010003
      C003C003000700038001800100070003000000000007000300000000000F0003
      00000000001F0003C003C003003FC00F00000000000000000000000000000000
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
      ImageIndex = 29
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
        Value = nil
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
        Value = nil
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
      'SELECT grantee "Granted To",'
      '       '#39'Granted Through Role'#39' AS "Grant Type",'
      '       role "Privilege/Role",'
      '       grantable "Grantable", '#39#39' "Grantor"'
      'FROM   role_tab_privs rtp,'
      '       dba_role_privs drp'
      'WHERE  rtp.role = drp.granted_role'
      '       AND table_name = :p_table_name'
      'UNION'
      'SELECT grantee,'
      '       '#39'Direct Grant'#39' AS "Grant Type",'
      '       privilege  AS  "Privilege/Role",'
      '       grantable "Grantable", grantor "Grantor"'
      'FROM   dba_tab_privs'
      'WHERE  table_name = :p_table_name'
      '       AND :p_owner = :p_owner'
      'ORDER BY 1, 2, 3')
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
        Value = nil
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
        Value = nil
      end
      item
        DataType = ftUnknown
        Name = 'P_OWNER'
        Value = nil
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
        Value = nil
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
        Value = nil
      end
      item
        DataType = ftUnknown
        Name = 'P_OWNER'
        Value = nil
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
        Value = nil
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
        Value = nil
      end
      item
        DataType = ftUnknown
        Name = 'p_owner'
        Value = nil
      end>
  end
  object SourceDataSource: TOraDataSource
    DataSet = SourceQuery
    Left = 122
    Top = 212
  end
  object FilterDropDownPopupActionBar: TPopupActionBar
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
  object DataPopupActionBar: TPopupActionBar
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
  object SortDropDownPopupActionBar: TPopupActionBar
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
  object PageControlPopupActionBar: TPopupActionBar
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
        Value = nil
      end
      item
        DataType = ftUnknown
        Name = 'p_owner'
        Value = nil
      end
      item
        DataType = ftUnknown
        Name = 'p_r_constraint_name'
        Value = nil
      end>
  end
  object ConstraintColumnsDataSource: TOraDataSource
    DataSet = ConstraintColumnsQuery
    Left = 264
    Top = 240
  end
end
