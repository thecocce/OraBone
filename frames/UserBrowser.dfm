object UserBrowserFrame: TUserBrowserFrame
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
  object UserPageControl: TBCPageControl
    Left = 0
    Top = 0
    Width = 451
    Height = 304
    ActivePage = InfoTabSheet
    Align = alClient
    DoubleBuffered = False
    ParentDoubleBuffered = False
    PopupMenu = PageControlPopupActionBar
    TabOrder = 0
    OnChange = UserPageControlChange
    ActivePageCaption = 'Info'
    TabDragDrop = False
    HoldShiftToDragDrop = False
    ShowCloseButton = False
    object InfoTabSheet: TTabSheet
      Caption = 'Info'
      ImageIndex = 6
      object UserPanel: TPanel
        Left = 0
        Top = 0
        Width = 443
        Height = 254
        Align = alClient
        BevelOuter = bvNone
        Padding.Right = 2
        Padding.Bottom = 1
        TabOrder = 0
        object UsersDBGrid: TBCDBGrid
          Left = 0
          Top = 0
          Width = 441
          Height = 253
          Align = alClient
          AllowedSelections = [gstRecordBookmarks, gstAll]
          Ctl3D = True
          DataSource = UserDataSource
          DrawMemoText = True
          DynProps = <>
          FooterParams.Color = clWindow
          IndicatorOptions = [gioShowRowIndicatorEh]
          IndicatorTitle.ShowDropDownSign = True
          IndicatorTitle.TitleButton = True
          IndicatorTitle.UseGlobalMenu = False
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
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
    object RolesTabSheet: TTabSheet
      Caption = 'Roles && Privileges'
      ImageIndex = 1
      object RolesPanel: TPanel
        Left = 0
        Top = 0
        Width = 443
        Height = 254
        Align = alClient
        BevelOuter = bvNone
        Padding.Right = 2
        Padding.Bottom = 1
        TabOrder = 0
        object VirtualDrawTree: TVirtualDrawTree
          Left = 0
          Top = 0
          Width = 441
          Height = 253
          Align = alClient
          Ctl3D = True
          DragOperations = []
          Header.AutoSizeIndex = 0
          Header.DefaultHeight = 20
          Header.Font.Charset = DEFAULT_CHARSET
          Header.Font.Color = clWindowText
          Header.Font.Height = -11
          Header.Font.Name = 'Tahoma'
          Header.Font.Style = []
          Header.Height = 20
          Header.Options = [hoColumnResize, hoShowSortGlyphs, hoVisible]
          Images = ImagesDataModule.ImageList
          ParentCtl3D = False
          TabOrder = 0
          TreeOptions.AutoOptions = [toAutoDropExpand, toAutoScroll, toAutoScrollOnExpand, toAutoTristateTracking, toAutoDeleteMovedNodes, toAutoChangeScale]
          TreeOptions.MiscOptions = [toFullRepaintOnResize, toInitOnSave, toToggleOnDblClick, toWheelPanning]
          TreeOptions.PaintOptions = [toHideFocusRect, toShowButtons, toShowDropmark, toShowRoot, toShowTreeLines, toThemeAware, toUseBlendedImages, toUseBlendedSelection, toFixedIndent]
          TreeOptions.SelectionOptions = [toFullRowSelect]
          OnDrawNode = VirtualDrawTreeDrawNode
          OnFreeNode = VirtualDrawTreeFreeNode
          OnGetImageIndex = VirtualDrawTreeGetImageIndex
          OnGetNodeWidth = VirtualDrawTreeGetNodeWidth
          OnInitChildren = VirtualDrawTreeInitChildren
          OnInitNode = VirtualDrawTreeInitNode
          Columns = <
            item
              Position = 0
              Width = 200
              WideText = 'Granted Role/Privilege'
            end
            item
              Alignment = taCenter
              Position = 1
              Width = 76
              WideText = 'Admin Option'
            end
            item
              Alignment = taCenter
              Position = 2
              Width = 76
              WideText = 'Default Role'
            end
            item
              Position = 3
              Width = 200
              WideText = 'Grantee'
            end
            item
              Position = 4
              Width = 80
              WideText = 'Grantor'
            end
            item
              Position = 5
              Width = 80
              WideText = 'Owner'
            end
            item
              Position = 6
              Width = 200
              WideText = 'Object Name'
            end>
        end
      end
      object RolesButtonPanel: TPanel
        Left = 0
        Top = 254
        Width = 443
        Height = 22
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 1
        object RolesToolBar: TBCToolBar
          Left = 0
          Top = 0
          Width = 23
          Height = 22
          Align = alNone
          Images = ImagesDataModule.ImageList
          TabOrder = 0
          object ToolButton3: TToolButton
            Left = 0
            Top = 0
            Action = RefreshAction
          end
        end
      end
    end
    object SourceTabSheet: TTabSheet
      Caption = 'Source'
      ImageIndex = 2
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
          object ToolButton1: TToolButton
            Left = 23
            Top = 0
            Action = CopyToClipboardAction
          end
          object ToolButton2: TToolButton
            Left = 46
            Top = 0
            Action = SaveToFileAction
          end
        end
      end
    end
  end
  object UserQuery: TOraQuery
    SQL.Strings = (
      'SELECT '#39'User id'#39' "Field", TO_CHAR(user_id) "Value"'
      '  FROM dba_users'
      ' WHERE username = :p_object_name'
      'UNION ALL'
      'SELECT '#39'Username'#39', TO_CHAR(username)'
      '  FROM dba_users'
      ' WHERE username = :p_object_name'
      'UNION ALL'
      'SELECT '#39'Account Status'#39', TO_CHAR(account_status)'
      '  FROM dba_users'
      ' WHERE username = :p_object_name'
      ' UNION ALL'
      'SELECT '#39'Lock Date'#39', TO_CHAR(lock_date)'
      '  FROM dba_users'
      ' WHERE username = :p_object_name'
      ' UNION ALL'
      'SELECT '#39'Expiry Date'#39', TO_CHAR(expiry_date)'
      '  FROM dba_users'
      ' WHERE username = :p_object_name'
      ' UNION ALL'
      'SELECT '#39'Default Tablespace'#39', TO_CHAR(default_tablespace)'
      '  FROM dba_users'
      ' WHERE username = :p_object_name'
      ' UNION ALL'
      'SELECT '#39'Temporary Tablespace'#39', TO_CHAR(temporary_tablespace)'
      '  FROM dba_users'
      ' WHERE username = :p_object_name'
      ' UNION ALL'
      'SELECT '#39'Created'#39', TO_CHAR(created)'
      '  FROM dba_users'
      ' WHERE username = :p_object_name'
      ' UNION ALL'
      'SELECT '#39'Profile'#39', TO_CHAR(profile)'
      '  FROM dba_users'
      ' WHERE username = :p_object_name')
    FetchAll = True
    ReadOnly = True
    AutoCommit = False
    Left = 208
    Top = 52
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'p_object_name'
        Value = nil
      end>
  end
  object UserDataSource: TOraDataSource
    DataSet = UserQuery
    Left = 208
    Top = 120
  end
  object ActionList: TActionList
    Images = ImagesDataModule.ImageList
    Left = 296
    Top = 204
    object CustomizeAction: TAction
      Caption = '&Customize Page Control...'
      Hint = 'Customize page control'
      ImageIndex = 136
      OnExecute = CustomizeActionExecute
    end
    object SQLEditorAction: TAction
      Caption = 'SQLEditorAction'
      Hint = 'Load in Editor'
      ImageIndex = 67
      OnExecute = SQLEditorActionExecute
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
      ImageIndex = 161
      OnExecute = RefreshActionExecute
    end
  end
  object PageControlPopupActionBar: TPopupActionBar
    Images = ImagesDataModule.ImageList
    Left = 324
    Top = 68
    object CustomizePageControl1: TMenuItem
      Action = CustomizeAction
    end
  end
  object RolesQuery: TOraQuery
    LocalUpdate = True
    SQL.Strings = (
      'SELECT grantee, granted_role, admin_option, default_role'
      '  FROM dba_role_privs'
      'START WITH grantee = :p_object_name'
      'CONNECT BY PRIOR granted_role = grantee')
    FetchAll = True
    AutoCommit = False
    AfterOpen = RolesQueryAfterOpen
    Left = 42
    Top = 100
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'p_object_name'
        Value = nil
      end>
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
    Left = 316
    Top = 144
  end
  object PrivilegesQuery: TOraQuery
    LocalUpdate = True
    SQL.Strings = (
      'SELECT grantee, privilege, grantor, owner, table_name'
      '  FROM dba_tab_privs'
      ' WHERE grantee IN (SELECT granted_role'
      '  FROM dba_role_privs'
      'START WITH grantee = :p_object_name'
      'CONNECT BY PRIOR granted_role = grantee)'
      'ORDER BY grantee, privilege, table_name')
    FetchAll = True
    AutoCommit = False
    Left = 44
    Top = 158
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'p_object_name'
        Value = nil
      end>
  end
end
