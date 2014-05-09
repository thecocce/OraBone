object ObjectTreeFrame: TObjectTreeFrame
  Left = 0
  Top = 0
  Width = 287
  Height = 460
  Color = clWindow
  Ctl3D = True
  ParentBackground = False
  ParentColor = False
  ParentCtl3D = False
  TabOrder = 0
  object BottomPanel: TPanel
    Left = 0
    Top = 434
    Width = 287
    Height = 26
    Align = alBottom
    BevelOuter = bvNone
    Color = clWindow
    Padding.Bottom = 1
    ParentBackground = False
    TabOrder = 0
    object ComboPanel: TPanel
      Left = 0
      Top = 0
      Width = 287
      Height = 25
      Align = alClient
      AutoSize = True
      BevelOuter = bvNone
      Color = clWindow
      Padding.Top = 3
      Padding.Right = 1
      TabOrder = 0
      object SchemaComboBox: TBCComboBox
        Left = 0
        Top = 3
        Width = 260
        Height = 22
        Align = alClient
        Style = csOwnerDrawFixed
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnChange = SchemaComboBoxChange
        OnDrawItem = SchemaComboBoxDrawItem
        OnKeyDown = SchemaComboBoxKeyDown
        DeniedKeyStrokes = False
        ReadOnly = False
        DropDownFixedWidth = 0
      end
      object FilterToolBar: TBCToolBar
        AlignWithMargins = True
        Left = 263
        Top = 3
        Width = 23
        Height = 22
        Margins.Top = 0
        Margins.Right = 0
        Margins.Bottom = 0
        Align = alRight
        AutoSize = True
        Caption = 'FilterToolBar'
        Images = ImagesDataModule.ImageList
        TabOrder = 1
        object FilterToolButton: TToolButton
          Left = 0
          Top = 0
          Action = SchemaFilterAction
        end
      end
    end
  end
  object VirtualDrawTree: TVirtualDrawTree
    Left = 0
    Top = 0
    Width = 287
    Height = 434
    Align = alClient
    DragOperations = []
    EditDelay = 500
    Header.AutoSizeIndex = 0
    Header.Font.Charset = DEFAULT_CHARSET
    Header.Font.Color = clWindowText
    Header.Font.Height = -11
    Header.Font.Name = 'Tahoma'
    Header.Font.Style = []
    Header.MainColumn = -1
    Header.Options = []
    Images = ImagesDataModule.ImageList
    IncrementalSearch = isAll
    Indent = 16
    TabOrder = 1
    TreeOptions.AutoOptions = [toAutoDropExpand, toAutoScroll, toAutoScrollOnExpand, toAutoTristateTracking, toAutoDeleteMovedNodes, toAutoChangeScale]
    TreeOptions.MiscOptions = [toEditable, toFullRepaintOnResize, toInitOnSave, toToggleOnDblClick, toWheelPanning, toEditOnClick]
    TreeOptions.PaintOptions = [toShowBackground, toShowButtons, toShowDropmark, toShowRoot, toThemeAware, toUseBlendedSelection]
    OnCreateEditor = VirtualDrawTreeCreateEditor
    OnDrawNode = VirtualDrawTreeDrawNode
    OnFreeNode = VirtualDrawTreeFreeNode
    OnGetImageIndex = VirtualDrawTreeGetImageIndex
    OnGetNodeWidth = VirtualDrawTreeGetNodeWidth
    OnInitChildren = VirtualDrawTreeInitChildren
    OnInitNode = VirtualDrawTreeInitNode
    Columns = <>
  end
  object ObjectsQuery: TOraQuery
    FetchAll = True
    NonBlocking = True
    Left = 184
    Top = 228
  end
  object InvalidObjectsQuery: TOraQuery
    SQL.Strings = (
      
        'SELECT   object_type || '#39' '#39' || owner || '#39'.'#39' || object_name NAME,' +
        ' '#39'INVALID OBJECT'#39' TYPE, '#39'DISABLED'#39' status'
      '    FROM all_objects'
      '   WHERE status = '#39'INVALID'#39
      '     AND owner = :P_SCHEMA'
      'ORDER BY 1')
    FetchAll = True
    NonBlocking = True
    Left = 184
    Top = 296
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'P_SCHEMA'
        Value = nil
      end>
  end
  object RecycleBinQuery: TOraQuery
    SQL.Strings = (
      
        'SELECT   original_name NAME, '#39'RECYCLE BIN'#39' TYPE, '#39'ENABLED'#39' statu' +
        's'
      '    FROM user_recyclebin'
      'ORDER BY 1')
    FetchAll = True
    NonBlocking = True
    Left = 184
    Top = 352
  end
  object SchemasQuery: TOraQuery
    FetchAll = True
    NonBlocking = True
    Left = 48
    Top = 356
  end
  object ActionList: TActionList
    Images = ImagesDataModule.ImageList
    Left = 56
    Top = 188
    object SchemaFilterAction: TAction
      Caption = 'SchemaFilterAction'
      Hint = 'Filter schemas'
      ImageIndex = 80
      OnExecute = SchemaFilterActionExecute
    end
  end
  object UsersQuery: TOraQuery
    SQL.Strings = (
      'SELECT   username name, '#39'USER'#39' type, account_status status'
      '    FROM dba_users    '
      '   WHERE :P_SCHEMA = :P_SCHEMA'
      'ORDER BY 1')
    FetchAll = True
    NonBlocking = True
    Left = 236
    Top = 272
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'P_SCHEMA'
        Value = nil
      end>
  end
  object OraSession: TOraSession
    Options.UseUnicode = True
    AutoCommit = False
    OnConnectionLost = OraSessionConnectionLost
    Left = 56
    Top = 264
  end
end
