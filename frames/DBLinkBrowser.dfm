object DBLinkBrowserFrame: TDBLinkBrowserFrame
  Left = 0
  Top = 0
  Width = 451
  Height = 304
  Align = alClient
  Color = clWindow
  Ctl3D = False
  ParentBackground = False
  ParentColor = False
  ParentCtl3D = False
  TabOrder = 0
  object DBLinkPageControl: TBCPageControl
    Left = 0
    Top = 0
    Width = 451
    Height = 304
    ActivePage = SourceTabSheet
    Align = alClient
    DoubleBuffered = False
    ParentDoubleBuffered = False
    PopupMenu = PageControlPopupActionBar
    TabOrder = 0
    OnChange = DBLinkPageControlChange
    ActivePageCaption = 'Source'
    TabDragDrop = False
    HoldShiftToDragDrop = False
    ShowCloseButton = False
    object InfoTabSheet: TTabSheet
      Caption = 'Info'
      ImageIndex = 4
      object DBLinkPanel: TPanel
        Left = 0
        Top = 0
        Width = 443
        Height = 254
        Align = alClient
        BevelOuter = bvNone
        Padding.Right = 2
        Padding.Bottom = 1
        TabOrder = 0
        object DBLinkDBGrid: TBCDBGrid
          Left = 0
          Top = 0
          Width = 441
          Height = 253
          Align = alClient
          AllowedSelections = [gstRecordBookmarks, gstAll]
          Ctl3D = True
          DataSource = DBLinkDataSource
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
      object InfoButtonPanel: TPanel
        Left = 0
        Top = 254
        Width = 443
        Height = 22
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 1
        object CreationAndModificationTimestampLabel: TLabel
          AlignWithMargins = True
          Left = 437
          Top = 3
          Width = 3
          Height = 19
          Align = alRight
          ExplicitHeight = 13
        end
        object InfoToolBar: TBCToolBar
          Left = 0
          Top = 0
          Width = 23
          Height = 22
          Align = alLeft
          Images = ImagesDataModule.ImageList
          TabOrder = 0
          object ToolButton41: TToolButton
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
        Top = 254
        Width = 443
        Height = 22
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 1
        object Bevel2: TBevel
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
        object SourceToolBar: TBCToolBar
          Left = 0
          Top = 0
          Width = 69
          Height = 22
          Align = alLeft
          Caption = 'SourceToolBar'
          Images = ImagesDataModule.ImageList
          TabOrder = 0
          object SQLEditorToolButton: TToolButton
            Left = 0
            Top = 0
            Action = SQLEditorAction
          end
          object CopyToolButton: TToolButton
            Left = 23
            Top = 0
            Action = CopyToClipboardAction
          end
          object SaveToolButton: TToolButton
            Left = 46
            Top = 0
            Action = SaveToFileAction
          end
        end
        object RefreshToolbar: TBCToolBar
          Left = 82
          Top = 0
          Width = 23
          Height = 22
          Align = alLeft
          Images = ImagesDataModule.ImageList
          TabOrder = 1
          object ToolButton46: TToolButton
            Left = 0
            Top = 0
            Action = RefreshAction
          end
        end
      end
    end
  end
  object ActionList: TActionList
    Images = ImagesDataModule.ImageList
    Left = 296
    Top = 204
    object SQLEditorAction: TAction
      Hint = 'Load in Editor'
      ImageIndex = 67
      OnExecute = SQLEditorActionExecute
    end
    object CustomizeAction: TAction
      Caption = '&Customize Page Control...'
      Hint = 'Customize page control'
      ImageIndex = 136
      OnExecute = CustomizeActionExecute
    end
    object CopyToClipboardAction: TAction
      Caption = 'CopyToClipboardAction'
      Hint = 'Copy to clipboard'
      ImageIndex = 40
      OnExecute = CopyToClipboardActionExecute
    end
    object SaveToFileAction: TAction
      Caption = 'SaveToFileAction'
      Hint = 'Save to a file'
      ImageIndex = 169
      OnExecute = SaveToFileActionExecute
    end
    object RefreshAction: TAction
      Hint = 'Refresh'
      ImageIndex = 161
      OnExecute = RefreshActionExecute
    end
  end
  object DBLinkQuery: TOraQuery
    SQL.Strings = (
      'SELECT db_link "Link Name", host "Host", username "User Name"'
      '  FROM all_db_links'
      ' WHERE db_link = :p_object_name'
      '   AND username = :p_owner')
    FetchAll = True
    ReadOnly = True
    AutoCommit = False
    AfterOpen = DBLinkQueryAfterOpen
    Left = 208
    Top = 52
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'p_object_name'
        Value = nil
      end
      item
        DataType = ftUnknown
        Name = 'p_owner'
        Value = nil
      end>
  end
  object DBLinkDataSource: TOraDataSource
    DataSet = DBLinkQuery
    Left = 208
    Top = 120
  end
  object SynSQLSyn: TSynSQLSyn
    CommentAttri.Foreground = clGreen
    ConditionalCommentAttri.Foreground = clGreen
    DataTypeAttri.Foreground = clRed
    DataTypeAttri.Style = []
    DefaultPackageAttri.Style = []
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
    Left = 202
    Top = 192
  end
  object PageControlPopupActionBar: TPopupActionBar
    Images = ImagesDataModule.ImageList
    Left = 324
    Top = 68
    object CustomizePageControl1: TMenuItem
      Action = CustomizeAction
    end
  end
end
