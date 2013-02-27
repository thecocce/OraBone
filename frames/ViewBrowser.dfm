object ViewBrowserFrame: TViewBrowserFrame
  Left = 0
  Top = 0
  Width = 451
  Height = 304
  Align = alClient
  Ctl3D = False
  ParentCtl3D = False
  TabOrder = 0
  object ViewPageControl: TBCPageControl
    Left = 0
    Top = 0
    Width = 451
    Height = 304
    ActivePage = ColumnsTabSheet
    Align = alClient
    DoubleBuffered = False
    ParentDoubleBuffered = False
    PopupMenu = PageControlPopupMenu
    TabOrder = 0
    OnChange = ViewPageControlChange
    TabDragDrop = False
    HoldShiftToDragDrop = False
    object ColumnsTabSheet: TTabSheet
      Caption = 'Columns'
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object ColumnsPanel: TPanel
        Left = 0
        Top = 0
        Width = 443
        Height = 254
        Align = alClient
        BevelOuter = bvNone
        Padding.Right = 2
        Padding.Bottom = 1
        TabOrder = 0
        object ColumnsDBGrid: TBCDBGrid
          Left = 0
          Top = 0
          Width = 441
          Height = 253
          Align = alClient
          AllowedSelections = [gstRecordBookmarks, gstAll]
          Ctl3D = True
          DataGrouping.GroupLevels = <>
          DataSource = ColumnsDataSource
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
          OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghMultiSortMarking, dghDialogFind, dghColumnResize, dghColumnMove]
          ParentCtl3D = False
          ReadOnly = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          OnTitleClick = ColumnsDBGridTitleClick
          object RowDetailData: TRowDetailPanelControlEh
          end
        end
      end
      object ColumnsButtonPanel: TPanel
        Left = 0
        Top = 254
        Width = 443
        Height = 22
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 1
        object Bevel3: TBevel
          AlignWithMargins = True
          Left = 29
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
          Width = 23
          Height = 22
          Align = alLeft
          Caption = 'SourceToolBar'
          Images = ImageList
          TabOrder = 0
          object ToolButton25: TToolButton
            Left = 0
            Top = 0
            Action = AlterViewAction
          end
        end
        object BCToolBar1: TBCToolBar
          Left = 36
          Top = 0
          Width = 23
          Height = 22
          Align = alLeft
          Images = ImageList
          TabOrder = 1
          object ToolButton14: TToolButton
            Left = 0
            Top = 0
            Action = RefreshAction
          end
        end
      end
    end
    object SourceTabSheet: TTabSheet
      Caption = 'Source'
      ImageIndex = 6
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object SourcePanel: TPanel
        Left = 0
        Top = 0
        Width = 443
        Height = 254
        Align = alClient
        BevelOuter = bvNone
        Padding.Right = 2
        Padding.Bottom = 1
        TabOrder = 0
        object SourceSynEdit: TSynEdit
          Left = 0
          Top = 0
          Width = 441
          Height = 253
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
        Top = 254
        Width = 443
        Height = 22
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 1
        object Bevel1: TBevel
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
          object ToolButton5: TToolButton
            Left = 23
            Top = 0
            Action = CopyToClipboardAction
          end
          object ToolButton6: TToolButton
            Left = 46
            Top = 0
            Action = SaveToFileAction
          end
        end
        object BCToolBar2: TBCToolBar
          Left = 82
          Top = 0
          Width = 23
          Height = 22
          Align = alLeft
          Images = ImageList
          TabOrder = 1
          object ToolButton12: TToolButton
            Left = 0
            Top = 0
            Action = RefreshAction
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
        Width = 443
        Height = 254
        Align = alClient
        BevelOuter = bvNone
        Padding.Right = 2
        Padding.Bottom = 1
        TabOrder = 0
        object DataDBGrid: TBCDBGrid
          Left = 0
          Top = 0
          Width = 441
          Height = 253
          Align = alClient
          AllowedSelections = [gstRecordBookmarks, gstAll]
          Ctl3D = False
          DataGrouping.GroupLevels = <>
          DataSource = DataDataSource
          Flat = False
          FooterColor = clWindow
          FooterFont.Charset = DEFAULT_CHARSET
          FooterFont.Color = clWindowText
          FooterFont.Height = -11
          FooterFont.Name = 'Tahoma'
          FooterFont.Style = []
          IndicatorOptions = [gioShowRowselCheckboxesEh]
          Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
          OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghMultiSortMarking, dghRowHighlight, dghDialogFind, dghColumnResize, dghColumnMove, dghHotTrack]
          ParentCtl3D = False
          EditButtonsShowOptions = [sebShowOnlyForCurCellEh, sebShowOnlyForCurRowEh, sebShowOnlyWhenGridActiveEh, sebShowOnlyWhenDataEditingEh]
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          OnDrawDataCell = DataDBGridDrawDataCell
          OnMouseDown = DataDBGridMouseDown
          object RowDetailData: TRowDetailPanelControlEh
          end
        end
      end
      object DataButtonPanel: TPanel
        Left = 0
        Top = 254
        Width = 443
        Height = 22
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 1
        object Bevel2: TBevel
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
        object DataDBNavigator: TDBNavigator
          Left = 331
          Top = 0
          Width = 112
          Height = 22
          DataSource = DataDataSource
          VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
          Align = alRight
          Flat = True
          Kind = dbnHorizontal
          TabOrder = 0
        end
        object JvToolBar1: TBCToolBar
          Left = 0
          Top = 0
          Width = 76
          Height = 22
          Align = alLeft
          Caption = 'SourceToolBar'
          Images = ImageList
          TabOrder = 1
          object ToolButton4: TToolButton
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
        object BCToolBar3: TBCToolBar
          Left = 89
          Top = 0
          Width = 23
          Height = 22
          Align = alLeft
          Images = ImageList
          TabOrder = 2
          object ToolButton2: TToolButton
            Left = 0
            Top = 0
            Action = RefreshAction
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
        Width = 443
        Height = 2
        Cursor = crVSplit
        Align = alTop
      end
      object TriggersTopPanel: TPanel
        Left = 0
        Top = 0
        Width = 443
        Height = 165
        Align = alTop
        BevelOuter = bvNone
        Padding.Right = 2
        TabOrder = 0
        object TriggersDBGrid: TBCDBGrid
          Left = 0
          Top = 0
          Width = 441
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
          Width = 441
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
          object Bevel4: TBevel
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
            ExplicitTop = 1
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
            object ToolButton7: TToolButton
              Left = 0
              Top = 0
              Action = CreateTriggerAction
            end
            object ToolButton10: TToolButton
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
            object ToolButton3: TToolButton
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
          object BCToolBar4: TBCToolBar
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
        Width = 443
        Height = 109
        Align = alClient
        BevelOuter = bvNone
        Padding.Right = 2
        Padding.Bottom = 1
        TabOrder = 1
        object TriggerSynEdit: TSynEdit
          Left = 0
          Top = 0
          Width = 441
          Height = 108
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
        Width = 443
        Height = 254
        Align = alClient
        BevelOuter = bvNone
        Padding.Right = 2
        Padding.Bottom = 1
        TabOrder = 0
        object GrantsDBGrid: TBCDBGrid
          Left = 0
          Top = 0
          Width = 441
          Height = 253
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
        Top = 254
        Width = 443
        Height = 22
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 1
        object Bevel5: TBevel
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
          ExplicitTop = 1
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
        object BCToolBar6: TBCToolBar
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
        Width = 443
        Height = 254
        Align = alClient
        BevelOuter = bvNone
        Padding.Right = 2
        Padding.Bottom = 1
        TabOrder = 0
        object SynonymsDBGrid: TBCDBGrid
          Left = 0
          Top = 0
          Width = 441
          Height = 253
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
        Top = 254
        Width = 443
        Height = 22
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 1
        object Bevel6: TBevel
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
          ExplicitTop = 1
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
        object BCToolBar7: TBCToolBar
          Left = 59
          Top = 0
          Width = 23
          Height = 22
          Align = alLeft
          Images = ImageList
          TabOrder = 1
          object ToolButton11: TToolButton
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
        Width = 443
        Height = 254
        Align = alClient
        BevelOuter = bvNone
        Padding.Right = 2
        Padding.Bottom = 1
        TabOrder = 0
        object DependenciesDBGrid: TBCDBGrid
          Left = 0
          Top = 0
          Width = 441
          Height = 253
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
        Top = 254
        Width = 443
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
          Images = ImageList
          TabOrder = 0
          object ToolButton29: TToolButton
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
      'SELECT   s.column_id "ID", s.column_name "Column Name",'
      '         RPAD (   s.data_type'
      '               || DECODE (s.data_type,'
      
        '                          '#39'VARCHAR2'#39', '#39'('#39' || TO_CHAR (s.data_len' +
        'gth) || '#39')'#39','
      
        '                          '#39'RAW'#39', '#39'('#39' || TO_CHAR (s.data_length) ' +
        '|| '#39')'#39','
      
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
      
        '         DECODE (s.nullable, '#39'Y'#39', '#39'Null'#39', '#39'Not null'#39') "Nullable"' +
        ','
      '         c.comments "Comments"'
      '    FROM all_col_comments c,'
      '         all_tab_columns s'
      '   WHERE c.table_name = s.table_name'
      '     AND c.column_name = s.column_name'
      '     AND s.table_name = :p_view_name'
      '     AND c.owner = :p_owner'
      '     AND s.owner = :p_owner'
      'ORDER BY s.column_id')
    FetchAll = True
    ReadOnly = True
    AutoCommit = False
    Left = 32
    Top = 128
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'p_view_name'
      end
      item
        DataType = ftUnknown
        Name = 'p_owner'
      end>
  end
  object ColumnsDataSource: TOraDataSource
    DataSet = ColumnsQuery
    Left = 32
    Top = 196
  end
  object DataDataSource: TOraDataSource
    Left = 128
    Top = 200
  end
  object SQLStringHolder: TJvMultiStringHolder
    MultipleStrings = <>
    Left = 52
    Top = 368
  end
  object ImageList: TBCImageList
    Left = 206
    Top = 180
    Bitmap = {
      494C010114000002000210001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000006000000001002000000000000060
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
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000008200000082000000
      0000000000000000820000008200000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000005E9800005E9800005E9800000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008E5D
      59008E5D59008E5D59008E5D59008E5D59008E5D59008E5D59008E5D59008E5D
      59008E5D59008E5D59008E5D59008E5D59000000000000000000000000000000
      000000000000000000000000000000000000000082003A5BFB00021299000000
      8200000082000119BC000017B500000E7000A46769008E5D59008E5D59008E5D
      59008E5D59008E5D59008E5D59008E5D59008E5D5900885955006D474400005E
      980036D0FC0003B0EE000089C600005E98000000000000000000CA680000CA68
      0000CA680000CA680000CA680000CA680000CA680000CA680000CA680000CA68
      0000CA680000CA68000000000000000000000000000000000000000000009665
      5C00FCF7EE00FCF4E900FAF2E300FAEEDC00F8EBD500F7E7CF00F6E3C700F6E0
      C100F4DDBA00F2D9B200F2D5AC0080504B000000000000000000000000000000
      000000000000000000000000000000000000000082002D4ACF002446EF000110
      8B000316A9000423EE000013960000008200A4676900F3DCB900F2D8B100F0D4
      AA00EFD1A500EECE9E00EECE9E00EBC58E00E1BD8800B5976D00005E980026A3
      D1000FA5DD0001B7F70000A6E600005E980000000000CA680000FFF4E700FFE7
      CF00FFE5C900FFE2C200FFE0BD00FFDDB600FFDAB100FFD7AD00FFD5A900FFD4
      A5000527FF00FFD9B100CA68000000000000000000000000000000000000A36F
      6200FCFBF600FEF8F000FCF4EB00FBF2E500FAEFDE00F8EDD800F8E7D000F7E6
      CA00F6E1C400F4DEBD00F2DAB60080504B000000000000000000000000000000
      00000000000000000000000000000000000000000000040F6200324DC900274C
      F3000522D800001187000000820000000000A0675B00F4E0C100F3DCB900F2D8
      B100F0D4AA00F0D4AA00EECE9E00E4C59700B6997000005E980028A3D10016A7
      DD000262990036D0FC000086C200005E980000000000CA680000FFEEDE003F3F
      3F003F3F3F00FEDDBA003F3F3F003F3F3F003F3F3F003F3F3F00FFD0A0000527
      FF000527FF000527FF00CA68000000000000000000000000000000000000B17D
      6700FFFEFB00FEFBF700D5AC9700811E0000D4AA8F00FAF0E100FAEEDA00811E
      0000F6E6CC00F4E3C700F4E0C00080504B000000000000000000000000000000
      00000000000000000000000000000000000000000000040F62003550CB005179
      FF00244AF80001108B000000820000000000A0675B00F6E6CA00F4E0C100004B
      0000004B0000004B0000F0D4AA0000410000005E980029A3D10016A7DD000262
      990036D0FC001FADE000005E98000000000000000000CA680000FFF2E5003F3F
      3F00FFE3C600FEE0C000FEDDBA00FEDAB400FED8AF00FED5A900FFD3A400FED0
      A0000527FF00FFD4A600CA68000000000000000000000000000000000000C189
      6B00FFFFFF00FEFEFC00811E0000FEFAF400811E0000FBF4E900FBF2E300811E
      0000F8EBD700F7E7CF00F6E3C90080504B000000000000000000000000000000
      000000000000000000000000000000000000000082003451D3004269FF002B41
      BB00354CC6002446EF000013960000008200A7756B00F8EBD600F8EBD6000A7A
      18001DCE4A00004B0000F2D8B10008641400005E980016A7DD000262990036D0
      FC0018AADD00005E9800000000000000000000000000CA680000FFF6EB00FEEA
      D100FEE6CB00D1987400983D1600A0472000C1784E0090310C00E3AB7E00FED3
      A500FED0A100FFD7AA00CA68000000000000000000000000000000000000D197
      7000FFFFFF00FFFFFF00811E0000FEFCFA00811E0000FEF8F000811E0000811E
      0000FAF0E000F8EBD900F7E9D30080504B000000000000000000000000000000
      000000000000000000000000000000000000000082005E81FF003451D3000000
      820000008200324DC9002446EF0000008200A7756B00F9EEDD00F8EBD6000A7A
      18000A7A18000A751700D2BEA00007521000005E98000CB8F30036D0FC0010A4
      DA00005E980000000000000000000000000000000000CA680000FFFAF2003F3F
      3F00FFE9D100A0492300DAA68300FFE1C000C1795000A0471F00FED8B000FED5
      AA003F3F3F00FFD8AD00CA68000000000000000000000000000000000000DEA4
      7600FFFFFF00FFFFFF00D7B09E00811E0000D7AF9C00FEFBF700FCF8F300811E
      0000FBF3E900FAF0E100F8EDDC0080504B000000000000000000000000000000
      0000000000000000000000000000000000000000000000008200000082000000
      000000000000000082000000820000000000BC826800FAF2E500FAF2E500F8EB
      D60000650000D4C6AE00085A8E000F7BB10002A6E3000054880002629900005E
      9800623D3A0000000000000000000000000000000000CA680000FFFCF8003F3F
      3F00FEEDD900D39C7A0091330E00C17D5600C17B5300A0472000FEDCB500FED9
      AF003F3F3F00FFDAB400CA68000000000000000000000000000000000000E7AB
      7900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00093D8300FFFCFA00FEFA
      F400FCF7F000FBF4EA00FBF2E50080504B000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BC826800FCF7EE00FAF2E500FAF2
      E50000650000005200000964970007ADE90000629C00A3927700C3AA8700CEB4
      8E007A4D480000000000000000000000000000000000CA680000FFFFFE003F3F
      3F00FFEFE000EDCCB400E5BA9E00DAA98800C17D5600A0482100FFDEBB00FEDC
      B5003F3F3F00FFDDBA00CA68000000000000000000000000000000000000093D
      8300093D8300CF8E6800CF8E6800CF8E6800CF8E6800093D8300CF8E6800CF8E
      6800CF8E6800CF8E6800CF8E680080504B000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D1926D00FDFAF500FDFAF500FCF7
      EE00EFE8DB00BFB7AA00242323000B679C0007648A00D3C1A700F2D8B100F2D8
      B10080504B0000000000000000000000000000000000CA680000FFFFFF003F3F
      3F00FFF3E500E5BFA600A04B2600DCAB8C00B8704A00B0633B00FFE2C200FEDE
      BB003F3F3F00FFE0C000CA680000000000000000000000000000093D83000A56
      BF00093D83000000000000000000000000000A4DAA00093D8300000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D1926D00FEFEFE00FDFAF500FCF7
      F000E5E1D900242323000208820003047600D6CBB900EBDCC100F6E6CA00F3DC
      B90080504B0000000000000000000000000000000000CA680000FFFFFF00FFF8
      F000FFF4EB00FFF2E500DAB09300C1815E00CA8E6B00FEE7CE00FFE5C700FEE1
      C200FFDEBB00FFE3C500CA6800000000000000000000093D83000B64E000409C
      FF00093D8300093D8300093D8300093D83000A51B400093D8300000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000DA9D7500FEFEFE00FEFEFE00FEFE
      FE00F2EFEA000423E8001549F400020BA900F9EEDD00F9EEDD00F6E6CA00F6E6
      CA0080504B0000000000000000000000000000000000CA680000FFFFFF003F3F
      3F00FFF7F000FFF4EB00FEF3E600FEF0E000FFEEDA00FFEAD500FEE7CE00FEE5
      C7003F3F3F00FFE6CB00CA68000000000000093D83000C73FF004AA3FF002B8E
      FF001079FF000B6AEE000A5CCE000B5DD000093D830000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000DA9D7500FEFEFE00FEFEFE00FEFE
      FE00FEFEFE001323BA000427FF0003099D00FAF2E500F9EEDD00F9EEDD00F7E9
      D30080504B0000000000000000000000000000000000CA680000FFFFFF003F3F
      3F003F3F3F00FFF8F0003F3F3F003F3F3F003F3F3F003F3F3F00FEEBD4003F3F
      3F003F3F3F00FFEAD300CA68000000000000093D83000F78FF003696FF00167F
      FF000B6CF3000A5AC9000A4DAA00093D83000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E7AB7900FEFEFE00FEFEFE00FEFE
      FE00FEFEFE00FEFEFE00FDFAF500FDFAF500FCF7EE00FCF7EE00F9EEDD00F9EE
      DD0080504B0000000000000000000000000000000000CA680000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFEFB00FFFBF400FFF7EF00FFF4
      E700FFF0E100FFF7EE00CA6800000000000000000000093D83000B5DD0000C70
      FE00093D8300093D8300093D8300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E7AB7900FEFEFE00FEFEFE00FEFE
      FE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FDFAF500FCF7EE00FCF7EE00FAF2
      E50080504B000000000000000000000000000000000000000000CA680000CA68
      0000CA680000CA680000CA680000CA680000CA680000CA680000CA680000CA68
      0000CA680000CA68000000000000000000000000000000000000093D83000A45
      9600093D83000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E7AB7900CF8E6800CF8E6800CF8E
      6800CF8E6800CF8E6800CF8E6800CF8E6800CF8E6800CF8E6800CF8E6800CF8E
      680080504B000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000093D
      8300093D83000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000008200000082000000
      0000000000000000820000008200000000000000000005669500056695000566
      95000000000000000000000000000000000000000000035A0500035A0500035A
      0500035A05000000000000000000000000000000000005669500056695000566
      9500000000000000000000000000000000000000000000008200000082000000
      0000000000000000820000008200000000000000000000000000000000000000
      00000000000000000000000000000000000000000000035A0500035A0500035A
      0500035A05000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000082003A5BFB00021299000000
      8200000082000119BC000017B500000E7000066896008AC5D900CAFEFF007ADC
      F2000B6D9A0000000000000000000000000000000000035A0500089511000690
      0E00035A0500000000000000000000000000066896008AC5D900CAFEFF007ADC
      F2000B6D9A00000000000000000000000000000082003A5BFB00021299000000
      8200000082000119BC000017B500000E70000000000000000000000000000000
      00000000000000000000000000000000000000000000035A0500089511000690
      0E00035A05000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000082002D4ACF002446EF000110
      8B000316A9000423EE0000139600000082000566950042ADD00089C0D5009EFA
      FF0052C7E70005669500000000000000000000000000035A05000C9D19000A99
      1500035A05000000000000000000000000000566950042ADD00089C0D5009EFA
      FF0052C7E700056695000000000000000000000082002D4ACF002446EF000110
      8B000316A9000423EE0000139600000082000000000000000000000000000000
      00000000000000000000000000000000000000000000035A05000C9D19000A99
      1500035A05000000000000000000000000000000000000000000000000000000
      0000000000005C205C00030303000303030001010100040F6200324DC900274C
      F3000522D800001187000000820000000000000000000566950035ACD10087BF
      D30080F4FF001B91BD00035A0500035A0500035A0500035A050011A624000DA0
      1C00035A0500035A0500035A0500035A0500000000000566950035ACD10087BF
      D30080F4FF001B91BD0000000000000000000000000000008200324DC900274C
      F3000522D8000011870000008200000000000000000000000000000000000000
      00000000000000000000035A0500035A0500035A0500035A050011A624000DA0
      1C00035A0500035A0500035A0500035A05000000000000000000000000000000
      000029133B00480C480013131300141414000A0A0A00040F62003550CB005179
      FF00244AF80001108B00000082000000000000000000000000000566950028AB
      D4008AC5D90005669500035A050025C7470025C747001BB735001BB7350013AB
      270011A624000DA01C000A991500035A050000000000000000000566950028AB
      D4008AC5D90005669500000000000000000000000000000082003550CB005179
      FF00244AF80001108B0000008200000000000000000000000000000000000000
      00000000000000000000035A050025C7470025C747001BB735001BB7350013AB
      270011A624000DA01C000A991500035A05000000000000000000000000002D53
      5D004A0E4A00511551001C1C1C001A1A1A00000082003451D3004269FF002B41
      BB00354CC6002446EF0000139600000082000000000000000000000000000566
      95001AA7D40087BFD300035A05002CD3550027CB4B0025C747001CBA38001BB7
      350017B02E0013AB270011A62400035A05000000000000000000000000000566
      95001AA7D40087BFD300056695000373A500000082003451D3004269FF002B41
      BB00354CC6002446EF0000139600000082000000000000000000000000000000
      00000000000000000000035A05002CD3550027CB4B0025C747001CBA38001BB7
      350017B02E0013AB270011A62400035A05000000000000000000000000003329
      490050145000323232003838380028282800000082005E81FF003451D3000000
      820000008200324DC9002446EF00000082000000000000000000000000000000
      0000056695000EA5D500035A0500035A0500035A0500035A050027CB4B0025C7
      4700035A0500035A0500035A0500035A05000000000000000000000000000000
      0000056695000EA5D50084C2D80033DDFF00000082005E81FF003451D3000000
      820000008200324DC9002446EF00000082000000000000000000000000000000
      00000000000000000000035A0500035A0500035A0500035A050027CB4B0025C7
      4700035A0500035A0500035A0500035A05000000000000000000000000003A19
      46002A2A2A005E5E5E006F6F6F003F3F3F001F1F1F0000008200000082000101
      0100000000000000820000008200000000000000000000000000000000000000
      000000000000056695000EA5D50018B0E0000ACFFF00035A05002CD3550029CF
      5200035A050037E1FF0005669500000000000000000000000000000000000000
      000000000000056695000EA5D50018B0E0000ACFFF00000082000000820025D7
      FF002CD8FF000000820000008200000000000000000000000000000000000000
      00000000000000000000000000000000000000000000035A05002CD3550029CF
      5200035A05000000000000000000000000000000000000000000000000003031
      4900652965006B6B6B007A7A7A0050505000333333002D2D2D00161616000202
      0200000000000000000000000000000000000000000000000000000000000000
      000000000000000000000566950025D7FF0030D1FE00035A050034DE650030D9
      5E00035A05005FE1FF006EEBFF00056695000000000000000000000000000000
      000000000000000000000566950025D7FF0030D1FE0038D3FE0041D5FE0049D9
      FF0051DAFE005FE1FF006EEBFF00056695000000000000000000000000000000
      00000000000000000000000000000000000000000000035A050034DE650030D9
      5E00035A0500000000000000000000000000000000000000000000000000795E
      87005D225E00884C88006E6E6E00585858004E4E4E004A4A4A004E124E005C20
      5C00000000000000000000000000000000000000000000000000000000000000
      000000000000000000000566950051E3FF0051DAFE00035A0500035A0500035A
      0500035A050080DCF40099F2FF00056695000000000000000000000000000000
      000000000000000000000566950051E3FF0051DAFE005CDDFF0068E0FF0068E0
      FF008BEDFF0080DCF40099F2FF00056695000000000000000000000000000000
      00000000000000000000000000000000000000000000035A0500035A0500035A
      0500035A05000000000000000000000000000000000000000000000000000000
      0000103343006E37700092569200985C9800783C78005C205C00470B47000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000056695007BEBFF0080E6FF008BEDFF0095EAFF00AFF7
      FF00CAEDF2001A759E00C7F9FE00056695000000000000000000000000000000
      00000000000000000000056695007BEBFF0080E6FF008BEDFF0095EAFF00AFF7
      FF00CAEDF2001A759E00C7F9FE00056695000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000056215A005216520043074300410541005C205C00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000005669500AAEFFF00AAEFFF00B2EFFF00CAFEFF00D5F2
      F40013709C0005669500D4FFFF00056695000000000000000000000000000000
      0000000000000000000005669500AAEFFF00AAEFFF00B2EFFF00CAFEFF00D5F2
      F40013709C0005669500D4FFFF00056695000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000041EFF000525D5000000
      0000000000003D3E5A0054185400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000005669500E9FCFF00BFF4FF00C0F6FF0099D0E000106C
      98000566950005669500CAFEFF00056695000000000000000000000000000000
      0000000000000000000005669500E9FCFF00BFF4FF00C0F6FF0099D0E000106C
      98000566950005669500CAFEFF00056695000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000041EFF003A14
      7500261C3D002F0E3C0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000005669500E9FCFF00D4FFFF008CD4EA0089D3
      E700A3E3F400B8EFF700C7F9FE00056695000000000000000000000000000000
      000000000000000000000000000005669500E9FCFF00D4FFFF008CD4EA0089D3
      E700A3E3F400B8EFF700C7F9FE00056695000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000566950005669500056695000566
      9500056695000566950005669500000000000000000000000000000000000000
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
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008E5D59008E5D59008E5D59008E5D59008E5D59008E5D59008E5D
      59008E5D59008E5D590073424100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000035A0500035A0500035A
      0500035A05000000000000000000000000000000000000000000000000000000
      0000E5E8F7009EA9E100546BC7003F59C0003A53BF004C67C20097A7DC00E1E6
      F500000000000000000000000000000000000000000000000000000000000000
      00000000000092625A00FEDDBC00FFD9B400FFD5AC00FFD1A500FFCE9D00FECA
      9700FFC79000FFC48B00734241000000000000000000000000007F2B28007F2B
      2800A1828300A1828300A1828300A1828300A1828300A1828300A18283007A1C
      1C007F2B28000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000035A0500089511000690
      0E00035A0500000000000000000000000000000000000000000000000000C3C9
      ED005566CC003C52CC00757AE8008F92EE008F92EE007178E400334DC100405C
      BE00B9C4E7000000000000000000000000000000000000000000000000000000
      00000000000098665D00FFE3C700DD903D00DD903D00DD903D00DD903D00DD90
      3D00DD903D00FFC792007342410000000000000000007F2B2800CA4D4D00B645
      4500DDD4D5007916170079161700DCE0E000D7DADE00CED5D700BDBABD007610
      0F009A2D2D007F2B280000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000035A05000C9D19000A99
      1500035A05000000000000000000000000000000000000000000C5C9EF005160
      CD005C65E000A1A6F5007E86EF005B63E900595DE7007D84EE009EA0F400515D
      D7003452BA00B9C4E70000000000000000000000000000000000000000000000
      000000000000A06C5F00FEE9D300FFE5CA00FFE1C100FFDCBA00FED8B100FED3
      A900FFD0A100FFCC9A007342410000000000000000007F2B2800C24A4B00B144
      4400E2D9D9007916170079161700D9D8DA00D9DEE100D3D9DC00C1BDC1007611
      1100982D2D007F2B280000000000000000000000000000000000000000000000
      0000000000005C205C00035A0500035A0500035A0500035A050011A624000DA0
      1C00035A0500035A0500035A0500035A050000000000E8EAF9006571D400616B
      E300A1ACF500545FEC00505CEA004D59E9004E59E6004C56E6005056E6009EA2
      F4005460D600405CBF00E2E7F500000000008E5D59008E5D59008E5D59008E5D
      59008E5D5900A7746300FEEEDD00DD903D00DD903D00DD903D00DD903D00DD90
      3D00DD903D00FED1A4007342410000000000000000007F2B2800C24A4A00B042
      4200E6DCDC007916170079161700D5D3D500D8DEE100D7DDE000C6C2C500700F
      0F00962C2C007F2B280000000000000000000000000000000000000000000000
      000029133B00480C4800035A050025C7470025C747001BB735001BB7350013AB
      270011A624000DA01C000A991500035A050000000000ACB0EA004B56DB00A2AB
      F6005664F0005266EE004D59E9004D59E9004D59E9004D59E9004C58E600525A
      E6009FA3F5003450C40096A6DC000000000092625A00FEDDBC00FFD9B400FFD5
      AC00FFD1A500B17D6700FEF3E600FEEFDE00FEEAD800FFE7CF00FEE2C700FEDE
      BD00FFD9B600FED5AD007342410000000000000000007F2B2800C24A4A00B041
      4100EADEDE00E7DDDD00DDD4D500D7D3D500D5D7D900D7D8DA00CAC2C5007E17
      17009E3131007F2B280000000000000000000000000000000000000000002D53
      5D004A0E4A0051155100035A05002CD3550027CB4B0025C747001CBA38001BB7
      350017B02E0013AB270011A62400035A0500000000007378DD00818CEE007E91
      F7005D73F3004D59E9004D59E9004D59E9004D59E9004D59E9004D59E9004F5B
      E9007B83F000757BE2004C64C4000000000098665D00FFE3C700DD903D00DD90
      3D00DD903D00BB836900FFF7EF00DD903D00DD903D00DD903D00DD903D00DD90
      3D00DD903D00FEDAB8007342410000000000000000007F2B2800BF474800B845
      4500BA4C4C00BD575700BB575600B64E4E00B4494900BD525100BB4B4C00B542
      4200BF4A4A007F2B280000000000000000000000000000000000000000003329
      49005014500032323200035A0500035A0500035A0500035A050027CB4B0025C7
      4700035A0500035A0500035A0500035A0500000000006569DB00A1ABF7007086
      F8006882F600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF004D59
      E9005C66EA00969CF1003956BE0000000000A06C5F00FEE9D300FFE5CA00FFE1
      C100FFDCBA00C48B6C00FEFAF700FEF7F000FEF4EA00FEF2E300FEEDDC00FEE9
      D400FEE5CB00FEE1C2007342410000000000000000007F2B2800A33B3900B160
      5D00C6868400CB918F00CC919000CC908F00CB898800C9898800CB939100CC96
      9600BD4B4C007F2B280000000000000000000000000000000000000000003A19
      46002A2A2A005E5E5E006F6F6F003F3F3F001F1F1F00035A05002CD3550029CF
      5200035A050000000000000000000000000000000000696EDC00AFB9F9007F93
      FA007085F000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF004D59
      E9005E6AEE00969DF1003D55C00000000000A7746300FEEEDD00DD903D00DD90
      3D00DD903D00CC937000FEFEFC00FEFBF800FEF8F300FEF6ED00FEF2E600E5D5
      D000C6B1AF00A79395007342410000000000000000007F2B2800BD4B4C00F7F7
      F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7
      F700BD4B4C007F2B280000000000000000000000000000000000000000003031
      4900652965006B6B6B007A7A7A005050500033333300035A050034DE650030D9
      5E00035A0500000000000000000000000000000000007C7FE300A5AFF5009DAB
      FA00778CF000545FEC00545FEC00545FEC00545FEC00545FEC00545FEC006377
      F200818EF400787FE900566BC90000000000B17D6700FEF3E600FEEFDE00FEEA
      D800FFE7CF00D59C7400FEFEFE00FEFEFE00FEFBFA00FEFAF400FEF6EE00A067
      5B00A0675B00A0675B009D65590000000000000000007F2B2800BD4B4C00F7F7
      F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7
      F700BD4B4C007F2B28000000000000000000000000000000000000000000795E
      87005D225E00884C88006E6E6E00585858004E4E4E00035A0500035A0500035A
      0500035A050000000000000000000000000000000000B5B5F0007D83EA00CDD4
      FC008B9DFA007E93F700758AEE006C84F6006C84F6006C84F6006C84F6006379
      F300A4AFF8003E4FD000A0ABE10000000000BB836900FFF7EF00DD903D00DD90
      3D00DD903D00DCA17500FEFEFE00FEFEFE00FEFEFE00FEFCFB00FEFAF600A067
      5B00E5A15400DC832A000000000000000000000000007F2B2800BD4B4C00F7F7
      F700BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00F7F7
      F700BD4B4C007F2B280000000000000000000000000000000000000000000000
      0000103343006E37700092569200985C9800783C78005C205C00470B47000000
      00000000000000000000000000000000000000000000EBEBFB007978E300A3A7
      F300D4DBFD00879AFA007F91F0007A8EF1007F94F8007E92F900768CF800A8B6
      F800636EE3005868CD00E6E8F70000000000C48B6C00FEFAF700FEF7F000FEF4
      EA00FEF2E300E1A57700D1926D00D1926D00D1926D00D1926D00D1926D00A067
      5B00EB9E4300000000000000000000000000000000007F2B2800BD4B4C00F7F7
      F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7
      F700BD4B4C007F2B280000000000000000000000000000000000000000000000
      00000000000056215A005216520043074300410541005C205C00000000000000
      0000000000000000000000000000000000000000000000000000CFCFF600706F
      E100AAADF200D8DCFD00AEBAFA0091A3FA008B9DFA009CA9FB00BAC7FC00707B
      E9005462CE00C3C9EE000000000000000000CC937000FEFEFC00FEFBF800FEF8
      F300FEF6ED00FEF2E600E5D5D000C6B1AF00A793950073424100000000000000
      000000000000000000000000000000000000000000007F2B2800BD4B4C00F7F7
      F700BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00F7F7
      F700BD4B4C007F2B2800000000000000000000000000041EFF000525D5000000
      0000000000003D3E5A0054185400000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000CFCF
      F6007979E2008E93ED00BEC3F800CCD3F900C4CBF900AAB4F4006670E200646E
      D600C6CAEF00000000000000000000000000D59C7400FEFEFE00FEFEFE00FEFB
      FA00FEFAF400FEF6EE00A0675B00A0675B00A0675B009D655900000000000000
      000000000000000000000000000000000000000000007F2B2800BD4B4C00F7F7
      F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7
      F700BD4B4C007F2B280000000000000000000000000000000000041EFF003A14
      7500261C3D002F0E3C0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000EBEBFB00B6B6F0007D7FE2006A6BDE00686BDC007479DE00AFB3EB00E8E9
      F90000000000000000000000000000000000DCA17500FEFEFE00FEFEFE00FEFE
      FE00FEFCFB00FEFAF600A0675B00E5A15400DC832A0000000000000000000000
      00000000000000000000000000000000000000000000000000007F2B2800F7F7
      F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7
      F7007F2B28000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E1A57700D1926D00D1926D00D192
      6D00D1926D00D1926D00A0675B00EB9E43000000000000000000000000000000
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
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000005353
      5300FFFFFF00EAEAEA00EAEAEA00EAEAEA00B9B9B90053535300535353005353
      5300535353000000000000000000000000000000000000000000000000000000
      0000E0EEE0008FC091003B8D3F00257A2900257729003B853F008FB99100E0EB
      E000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000053535300FFFFFF00EAEAEA0053535300EAEAEA00B9B9B900B9B9B900B9B9
      B900B9B9B900535353000000000000000000000000000000000000000000B5D9
      B700318F350042A0520087CA9A009BD3AB009BD2AB0083C796003D974C00307C
      3400B5D0B60000000000000000000000000000000000000000000303C4000303
      C4000303C4000303C4000303C4000303C4000303C40000000000000000000000
      0000000000000000000000000000000000000000000000000000096910000969
      1000096910000969100009691000096910000969100000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000053535300FFFFFF00DADADA00DADADA00DADADA00DADADA00FFFF
      FF00FFFFFF00DADADA0053535300000000000000000000000000B5DBBA00258F
      2A006DBE8300A8DBB50087CC980066BC7D0064BA7C0086CB9800A5D9B40066B7
      7D0024722700B5D1B600000000000000000000000000000000000303C4000303
      C4000303C4000303C4000303C4000303C4000303C40000000000000000000000
      0000000000000000000000000000000000000000000000000000096910000969
      1000096910000969100009691000096910000969100000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000006F6F6F00FFFFFF00DADADA00DADADA00B9B9B9005353
      530053535300FFFFFF00535353000000000000000000E1F2E40033A1440072C2
      8700A8DBB20060BC77005CBA730059B8700059B56F0058B56F005BB77400A5D9
      B30069B87F00317F3500E1ECE100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000006F6F6F00FFFFFF00DADADA00B9B9B900535353000000
      0000C9C9C9005353530053535300000000000000000090D29F004CB06400AADD
      B40064C179005FBE710075C58500D4ECD9008ACD990056B66C0058B56E005CB7
      7400A6DAB400419B4E008EBC90000000000000000000000000000303C4000303
      C4000303C4000303C4000303C4000303C4000303C4000303C4000303C4000000
      0000000000000000000000000000000000000000000000000000096910000969
      1000096910000969100009691000096910000969100009691000096910000000
      00000000000000000000000000000000000000000000E3E3E3005F5F5F00E3E3
      E30000000000000000006F6F6F00FFFFFF00DADADA0053535300000000000000
      000000000000000000005353530000000000000000003FB55D0091D29F008DD4
      9A0064C3740079C98700F2FAF400FFFFFF00FDFEFD0086CB960057B76D005BB9
      720085CC970087C79A003B8B3F000000000000000000000000000303C4000303
      C4000303C4000303C4000303C4000303C4000303C4000303C4000303C4000000
      0000000000000000000000000000000000000000000000000000096910000969
      1000096910000969100009691000096910000969100009691000096910000000
      000000000000000000000000000000000000E3E3E3005F5F5F005F5F5F005F5F
      5F00E3E3E300000000006F6F6F00FFFFFF00DADADA0053535300000000000000
      0000000000000000000000000000000000000000000027B04900A6DCAF0070CA
      7F0073CA8000F0F9F100FFFFFF00EBF7ED00FFFFFF00FBFDFC0088CD96005BB9
      710067BE7D00A0D7AF00237F2600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000005F5F5F005F5F5F00000000005F5F
      5F005F5F5F00E3E3E300000000006F6F6F00FFFFFF00DADADA0053535300B9B9
      B90000000000000000000000000000000000000000002EB75100A7DDB10072CC
      800066C77300B0E1B700D2EED60063C17000B8E3BF00FFFFFF00FBFDFC008CD0
      990069C17E00A1D7AE00238426000000000000000000000000000303C4000303
      C4000303C4000303C4000303C4000303C4000303C4000303C4000303C4000303
      C4000303C4000000000000000000000000000000000000000000096910000969
      1000096910000969100009691000096910000969100009691000096910000969
      1000096910000000000000000000000000000000000000000000000000000000
      00005F5F5F005F5F5F00E3E3E300000000006F6F6F006F6F6F006F6F6F005353
      530000000000000000000000000000000000000000004BC56C0095D7A10091D7
      9B0069C9760064C66F0061C46E0061C36F0061C26F00B9E4C000FFFFFF00E3F4
      E6008BD199008BCE9D003C993F000000000000000000000000000303C4000303
      C4000303C4000303C4000303C4000303C4000303C4000303C4000303C4000303
      C4000303C4000000000000000000000000000000000000000000096910000969
      1000096910000969100009691000096910000969100009691000096910000969
      10000969100000000000000000000000000000000000E3E3E3005F5F5F00E3E3
      E300FFFFFF005F5F5F005F5F5F00E3E3E3000000000000000000000000000000
      000000000000000000000000000000000000000000009BDFAD0057BF7000AFE1
      B7006DCC7A0068C8720065C7700063C56E0062C46E0063C47100B6E3BE006FC7
      7E00ACDFB50048A95E008FC89400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E3E3E3005F5F5F005F5F5F005F5F
      5F00E3E3E300FFFFFF005F5F5F00000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E5F7E90049C566007FCE
      9000AEE1B5006DCC7A006ACA760068C8720068C8740068C875006BC97900ACDF
      B40076C4890033A14200E1F1E3000000000000000000000000000303C4000303
      C4000303C4000303C4000303C4000303C4000303C4000303C4000303C4000303
      C4000303C4000303C4000303C400000000000000000000000000096910000969
      1000096910000969100009691000096910000969100009691000096910000969
      1000096910000969100009691000000000005F5F5F005F5F5F00000000005F5F
      5F005F5F5F00E3E3E300F0F0F000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000BFECCB003DC3
      5C007FCE9000AFE1B70092D89D0077CE830077CE830092D89D00AEE1B50078C8
      8B0027A13B00B5DFBE00000000000000000000000000000000000303C4000303
      C4000303C4000303C4000303C4000303C4000303C4000303C4000303C4000303
      C4000303C4000303C4000303C400000000000000000000000000096910000969
      1000096910000969100009691000096910000969100009691000096910000969
      1000096910000969100009691000000000000000000000000000000000000000
      00005F5F5F005F5F5F00E3E3E300000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C0ED
      CB004AC8690059C2740096D7A300A5DCAE00A5DCAE0095D6A10050B96A0035B3
      5500B6E3C1000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000005F5F5F005F5F5F00E3E3E3000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000E5F8E9009FE3B00055CB72003BC05C0037BE5A0049C36A0097DCAA00E1F5
      E700000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000005F5F5F00000000000000000000000000000000000000
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
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000081003568FF000303C40000008100000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000025E050045F6800000810000004B0000000000000000
      000000000000000000000000000000000000A4676900A4676900A4676900A467
      6900A4676900A4676900A4676900A4676900A46769000274A90046D3E9001CD9
      FF002EDAFF007AEDFF0023A4D300056695000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000081003568FF000303C40000008100000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000025E050045F6800000810000004B0000000000000000
      000000000000000000000000000000000000B7918700FCEACE00F3DABC00F2D5
      B100F0D0A700EECB9E00EDC79300EDC28B00E9BD81000274A90064F5FE0012CE
      FE0021CFFF0069E1FB001DA4D600056695000000000000000000000000000070
      0000000000000000000000000000007000000070000000700000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000081003568FF000303C40000008100000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000025E050045F6800000810000004B0000000000000000
      000000000000000000000000000000000000B7938A00FEEFDA00F6E0C600F2DA
      BC00F2D5B200EFD0A900EECB9E00EDC79600EBC28C000274A900A3F7FC009EEA
      FB00BFEFFC00C9F2FB007FCFEA00056695000000000000000000000000000070
      0000047503000000000000700000000000000000000000000000007000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000081003568FF000303C40000008100000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000025E050045F6800000810000004B0000000000000000
      000000000000000000000000000000000000BA978F00FFF4E500F7E5CF00F4E0
      C500F3DABB00F2D5B100F0D0A600EECB9E00EDC795000274A90062BDD7001B97
      C2001184B4002D96BD00499FC500056695000000000000000000000000000070
      0000007000000070000000000000000000000000000000000000000000000070
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000081000528FF00001EF60000008100000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000025E050025BD500014A62800004B0000000000000000
      000000000000000000000000000000000000C09E9500FFFBF000F8EADC00F6E3
      CF00F4E0C600F2D9BC00F2D5B100F0D0A900EDCB9E000274A9003BC2DA001ACA
      F3002DD5FE006ADCF3001B97C200056695000000000000000000000000000070
      0000007000000070000000700000000000000000000000000000000000000070
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000008100315EFF000A30FF000121FE00001EE900000081000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000025E05002BD15E0019B842000DA1230004910B00004B00000000
      000000000000000000000000000000000000C6A49A00FFFFFC00FAF0E600F8EA
      DA00F7E5CF00F4E0C500F2DABA00F2D5B100F0D0A7000274A90064F5FE0012CE
      FE0021CFFF006EE0FB001DA4D600056695000000000000000000000000000070
      0000007000000070000000700000007000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000008100315EFF00315EFF001138FF000528FF00001EF600011EDC000000
      8100000000000000000000000000000000000000000000000000000000000000
      0000025E05003AE76F0026CB580018B23C000C9E1D00038A060000810000004B
      000000000000000000000000000000000000CBA99E00FFFFFF00FEF7F200FAEF
      E600F8EAD900F7E3CF00F6E0C500F2DABB00F2D4B1000373A60081FCFF0052FA
      FF0067FFFF0095FCFF0036C4EF00056695000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      8100315EFF00315EFF00315EFF000F2CDE00011EDC000116DC000014CC00011D
      CF0000008100000000000000000000000000000000000000000000000000025E
      05004DFF880039E9720026CB580016B53A000C9E1D00038A060000810000038A
      0600004B0000000000000000000000000000CFAC9F00FFFFFF00FFFEFC00FCF6
      F000FAEFE600F7EADA00F6E3CF00F4E0C500F3D9BB000274A900C2EBF400FEFE
      FE00CEFFFF00BDFFFF0088F8FB00056695000000000000000000000000000000
      0000000000000000000000000000007000000070000000700000007000000070
      0000000000000000000000000000000000000000000000000000000081000005
      8E0000058E00010C9900010C9900000CAD00010DBC000717BF001122BF00080F
      9F00080F9F000000810000000000000000000000000000000000025E050036DA
      67002CC655001BA138000F8E2700077F12000473040000690000006900000069
      000004730400004B00000000000000000000D4B0A100FFFFFF00FFFFFF00FFFE
      FC00FEF7F000FAEFE500F8EAD900F7E5CE00F6DEC400F3D9B8000274A9000274
      A9000274A9000274A9000274A900000000000000000000000000000000000070
      0000000000000000000000000000000000000070000000700000007000000070
      00000000000000000000000000000000000000000000000081000218AB001D16
      70001D167000021DB1002F2FB50039C4E70000B5E900057298001138FF002B57
      FF00315EFF002547E600000081000000000000000000025E0500046606001566
      000014680100017608002A9A3A003ACCCB0000C4CE0005817F002096350021A7
      370019962D00067A0E00004B000000000000D9B5A100FFFFFF00FFFFFF00FFFF
      FF00FFFEFC00FCF7F000FAEFE500F8E9D900F8E7D100FBEACE00DECEB400B6AA
      9300A46769000000000000000000000000000000000000000000000000000070
      0000000000000000000000000000000000000000000000700000007000000070
      000000000000000000000000000000000000000081000405960087623600E9AC
      1C00E5A40D00865E300004059600545DCF0035F6FE0000E0F8000D8CA500080A
      9300080F9F0033708C00080A930000008100025E0500025E050074890400EB9F
      2200E79611007D8F0A000AAA270055D4810036EBFF0000D8FF000D9AA40040D7
      76002CD8510078C79E0012811E00004B0000DDB7A400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFEFC00FCF6EF00FCF3E600EDD8C900B68A7B00A17B6F009C76
      6700A46769000000000000000000000000000000000000000000000000000000
      0000007000000000000000000000000000000070000000000000047503000070
      0000000000000000000000000000000000000000000000058E00B88F5500F3E5
      9E00E7CB6200D08F09000000810000008100464CB10038F8FB00014881000405
      96000330530003CA000006351F000000000000000000025E0500D7A56000F3E3
      9E00E7CC6200D08A0A000052020000520200468C4D0038EDFF00005F4F000044
      000043704400F75FF4003C13390000000000E2BCA500FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFEFB00FFFEF700DAC1BA00AD735B00E19E5500E68F
      3100B56D4D000000000000000000000000000000000000000000000000000000
      0000000000000070000000700000007000000000000000000000000000000070
      0000000000000000000000000000000000000000000000000000B88F5500FFFF
      EE00F0DD8F00D193100000000000000000000000000000000000000000000000
      000003CA000000F8000008A90000117000000000000000000000D7B48C00FFFF
      EE00F0DD8F00D192120000000000000000000000000000000000000000000000
      0000FA95FA00FF03FF00AB00AB0079017900E6BFA700FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00DCC7C500B8826500F8B55C00BF7A
      5C00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000B88F
      5500B88F55000000000000000000000000000000000000000000000000000000
      000005BC050002E301000C86000000000000000000000000000000000000C2A0
      7200C49541000000000000000000000000000000000000000000000000000000
      0000FA95FA00FA2FFA008B008B0000000000E4BCA400FBF4F000FBF4EF00FAF3
      EF00FAF3EF00F8F2EF00F7F2EF00F7F2EF00D8C2C000B77F6200C1836C000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000006B6060000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FA95FA000000000000000000E8C4AD00EBCBB700EBCBB700EACB
      B700EACAB600EACAB600EACAB600EACAB600E3C2B100A56B5F00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000600000000100010000000000000300000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF99FFF1FFFFE000FF000000C003E000
      FF0000008001E000FF8100008001E000FF8100018001E000C70000038001E000
      B40000078001E000C78900078001E000F46D00078001E000CFE300078001C73F
      FFEF00078001803FFFCF00078001007FFFFF0007800100FFFFFF0007800181FF
      FFFF0007C003C7FFFFFF0007FFFFE7FFFF998F878F99FF87FF0007870700FF87
      FF0003870300FF87F80180008381FC00F001C000C381FC00E000E000E000C400
      E000F000F000B400E009F801F801C785E00FFC00FC00F405E00FFC00FC00CF83
      F01FFC00FC00FFEFF83FFC00FC00FFCF99FFFC00FC00FFFFC3FFFE00FE00FFFF
      FFFFFF01FF01FFFFFFFFFFFFFFFFFFFFFFFFF801FFFFFF87F00FF801C007FF87
      E007F8018003FF87C003F8018003F800800100018003F000800100018003E000
      800100018003E000800100018003E007800100018003E007800100018003E007
      800100038003F01F800100078003F83FC003003F800399FFE007003F8003C3FF
      F00F007FC007FFFFFFFF00FFFFFFFFFFFFFFFFFFC07FFFFFFFFFFFFFE007F00F
      FFFFFFFFF003E007C07FC07FF801C003C07FC07FFC018001FFFFFFFFFC118001
      C01FC01F8C3D8001C01FC01F043F8001FFFFFFFF220F8001C007C007F10F8001
      C007C00780FF8001FFFFFFFF01FF8001C001C00121FFC003C001C001F1FFE007
      FFFFFFFFF8FFF00FFFFFFFFFFDFFFFFFFE7FFE7FFFC1FFFFFC3FFC3F0000FFFF
      FC3FFC3F0000EE3FFC3FFC3F0000E5DFFC3FFC3F0000E3EFFC3FFC3F0000E1EF
      F81FF81F0000E0FFF00FF00F0000FFFFE007E0070000FE0FC003C0030001EF0F
      800180010007EF8F000000000007F74F800180010007F8EFC3F0C3F0000FFFFF
      E7F1E7F1001FFFFFFFFBFFFB003FFFFF00000000000000000000000000000000
      000000000000}
  end
  object ActionList: TActionList
    Images = ImageList
    Left = 296
    Top = 204
    object FilterAction: TAction
      Hint = 'Filter the view data'
      ImageIndex = 0
      OnExecute = FilterActionExecute
    end
    object SortAction: TAction
      Caption = 'SortAction'
      Hint = 'Sort the view data'
      ImageIndex = 4
      OnExecute = SortActionExecute
    end
    object SQLEditorAction: TAction
      Hint = 'Load in Editor'
      ImageIndex = 2
      OnExecute = SQLEditorActionExecute
    end
    object RefreshAction: TAction
      Hint = 'Refresh'
      ImageIndex = 3
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
      GroupIndex = 1
      OnExecute = NoFilterActionExecute
    end
    object NoSortAction: TAction
      Caption = '&No sort'
      OnExecute = NoSortActionExecute
    end
    object CustomizeAction: TAction
      Caption = '&Customize Page Control...'
      Hint = 'Customize page control'
      ImageIndex = 6
      OnExecute = CustomizeActionExecute
    end
    object EnableTriggerAction: TAction
      Caption = 'EnableTriggerAction'
      Hint = 'Enable trigger'
      ImageIndex = 7
      OnExecute = EnableTriggerActionExecute
    end
    object DisableTriggerAction: TAction
      Caption = 'DisableTriggerAction'
      Hint = 'Disable trigger'
      ImageIndex = 8
      OnExecute = DisableTriggerActionExecute
    end
    object CopyToClipboardAction: TAction
      Caption = 'CopyToClipboardAction'
      Hint = 'Copy to clipboard'
      ImageIndex = 9
      OnExecute = CopyToClipboardActionExecute
    end
    object SaveToFileAction: TAction
      Caption = 'SaveToFileAction'
      Hint = 'Save to a file'
      ImageIndex = 10
      OnExecute = SaveToFileActionExecute
    end
    object CreateTriggerAction: TAction
      Caption = 'CreateTriggerAction'
      Hint = 'Create trigger'
      ImageIndex = 11
      OnExecute = CreateTriggerActionExecute
    end
    object DropTriggerAction: TAction
      Caption = 'DropTriggerAction'
      Enabled = False
      Hint = 'Drop trigger'
      ImageIndex = 12
      OnExecute = DropTriggerActionExecute
    end
    object GrantPrivilegesAction: TAction
      Caption = 'GrantPrivilegesAction'
      Hint = 'Grant privileges'
      ImageIndex = 13
      OnExecute = GrantPrivilegesActionExecute
    end
    object RevokePrivilegesAction: TAction
      Caption = 'RevokePrivilegesAction'
      Enabled = False
      Hint = 'Revoke privileges'
      ImageIndex = 14
      OnExecute = RevokePrivilegesActionExecute
    end
    object CreateSynonymAction: TAction
      Caption = 'CreateSynonymAction'
      Hint = 'Create synonym'
      ImageIndex = 15
      OnExecute = CreateSynonymActionExecute
    end
    object DropSynonymAction: TAction
      Caption = 'DropSynonymAction'
      Enabled = False
      Hint = 'Drop synonym'
      ImageIndex = 16
      OnExecute = DropSynonymActionExecute
    end
    object AlterViewAction: TAction
      Caption = 'AlterViewAction'
      Hint = 'Alter view'
      ImageIndex = 17
      OnExecute = AlterViewActionExecute
    end
    object SelectAllAction: TAction
      Caption = '&Select All'
      ImageIndex = 18
      ShortCut = 16449
      OnExecute = SelectAllActionExecute
    end
    object ExportTableDataAction: TAction
      Caption = '&Export Table Data...'
      Hint = 'Export table data'
      ImageIndex = 19
      OnExecute = ExportTableDataActionExecute
    end
  end
  object TriggersQuery: TOraQuery
    SQL.Strings = (
      
        'SELECT   trigger_name "Trigger Name", trigger_type "Type", INITC' +
        'AP(status) "Status", triggering_event "Triggering Event", descri' +
        'ption,'
      '         trigger_body'
      '    FROM all_triggers'
      '   WHERE table_name = :p_view_name'
      '     AND owner = :p_owner'
      'ORDER BY 1')
    FetchAll = True
    ReadOnly = True
    AutoCommit = False
    AfterOpen = TriggersQueryAfterOpen
    AfterScroll = TriggersQueryAfterOpen
    Left = 336
    Top = 64
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'p_view_name'
      end
      item
        DataType = ftUnknown
        Name = 'p_owner'
      end>
  end
  object TriggersDataSource: TOraDataSource
    DataSet = TriggersQuery
    Left = 336
    Top = 116
  end
  object GrantsDataSource: TOraDataSource
    DataSet = GrantsQuery
    Left = 472
    Top = 236
  end
  object GrantsQuery: TOraQuery
    SQL.Strings = (
      
        'SELECT   grantee "Granted To", privilege "Privilege", grantable ' +
        '"Grantable", grantor "Grantor" '
      '    FROM all_tab_privs'
      '   WHERE table_name = :p_view_name'
      '     AND :p_owner = :p_owner'
      'ORDER BY 1')
    FetchAll = True
    ReadOnly = True
    AutoCommit = False
    AfterOpen = GrantsQueryAfterOpen
    AfterRefresh = GrantsQueryAfterOpen
    Left = 472
    Top = 168
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'p_view_name'
      end
      item
        DataType = ftUnknown
        Name = 'p_owner'
      end>
  end
  object DependenciesDataSource: TOraDataSource
    DataSet = DependenciesQuery
    Left = 464
    Top = 100
  end
  object DependenciesQuery: TOraQuery
    SQL.Strings = (
      
        'SELECT DISTINCT d.name "Name", d.type "Type", INITCAP(o.status) ' +
        '"Status"'
      '    FROM all_dependencies d, all_objects o'
      '   WHERE d.referenced_name = :p_view_name'
      '     AND d.name = o.object_name'
      '     AND d.owner = :p_owner'
      'ORDER BY 1')
    FetchAll = True
    ReadOnly = True
    AutoCommit = False
    Left = 464
    Top = 52
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'p_view_name'
      end
      item
        DataType = ftUnknown
        Name = 'p_owner'
      end>
  end
  object FilterMultiStringHolder: TJvMultiStringHolder
    MultipleStrings = <>
    Left = 172
    Top = 364
  end
  object SynonymsQuery: TOraQuery
    SQL.Strings = (
      
        'SELECT owner "Synonym Owner", synonym_name "Synonym Name", table' +
        '_owner "Object Owner", table_name "Object Name"'
      '  FROM all_synonyms '
      ' WHERE table_name = :p_view_name'
      '   AND table_owner = :p_owner')
    FetchAll = True
    ReadOnly = True
    AutoCommit = False
    AfterOpen = SynonymsQueryAfterOpen
    AfterRefresh = SynonymsQueryAfterOpen
    Left = 360
    Top = 296
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'p_view_name'
      end
      item
        DataType = ftUnknown
        Name = 'p_owner'
      end>
  end
  object SynonymsDataSource: TOraDataSource
    DataSet = SynonymsQuery
    Left = 360
    Top = 348
  end
  object SourceQuery: TOraQuery
    SQL.Strings = (
      'SELECT text, '#39#39' type'
      '  FROM all_views'
      ' WHERE view_name = :p_view_name'
      '   AND owner = :p_owner'
      'UNION ALL'
      'SELECT query, '#39'M'#39
      '  FROM all_mviews'
      ' WHERE mview_name = :p_view_name'
      '   AND owner = :p_owner')
    FetchAll = True
    ReadOnly = True
    AutoCommit = False
    AfterScroll = SourceQueryAfterScroll
    Left = 208
    Top = 52
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'p_view_name'
      end
      item
        DataType = ftUnknown
        Name = 'p_owner'
      end>
  end
  object SourceDataSource: TOraDataSource
    DataSet = SourceQuery
    Left = 208
    Top = 120
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
    Left = 272
    Top = 248
  end
  object FilterDropDownMenu: TPopupMenu
    Left = 36
    Top = 64
    object est1: TMenuItem
      Action = RemoveCurrentFilterAction
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object NoFilterMenuItem: TMenuItem
      Action = NoFilterAction
      Caption = '<no filter>'
      Checked = True
      GroupIndex = 1
      RadioItem = True
    end
  end
  object DataPopupMenu: TBCPopupMenu
    Images = ImageList
    Left = 516
    Top = 340
    object SelectAllMenuItem: TMenuItem
      Action = SelectAllAction
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object RefreshMenuItem: TMenuItem
      Caption = '&Refresh'
      Hint = 'Refresh'
      ImageIndex = 3
      OnClick = RefreshDataActionExecute
    end
    object N3: TMenuItem
      Caption = '-'
    end
    object ExportMenuItem: TMenuItem
      Action = ExportTableDataAction
    end
  end
  object SortDropDownMenu: TPopupMenu
    Left = 116
    Top = 64
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
    Left = 372
    Top = 184
    object CustomizePageControl1: TMenuItem
      Action = CustomizeAction
    end
  end
end
