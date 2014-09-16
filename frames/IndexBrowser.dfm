object IndexBrowserFrame: TIndexBrowserFrame
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
  object IndexPageControl: TBCPageControl
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
    OnChange = IndexPageControlChange
    ActivePageCaption = 'Info'
    TabDragDrop = False
    HoldShiftToDragDrop = False
    ShowCloseButton = False
    object InfoTabSheet: TTabSheet
      Caption = 'Info'
      ImageIndex = 6
      object IndexPanel: TPanel
        Left = 0
        Top = 0
        Width = 443
        Height = 254
        Align = alClient
        BevelOuter = bvNone
        Padding.Right = 2
        Padding.Bottom = 1
        TabOrder = 0
        object IndexesDBGrid: TBCDBGrid
          Left = 0
          Top = 0
          Width = 441
          Height = 253
          Align = alClient
          AllowedSelections = [gstRecordBookmarks, gstAll]
          Ctl3D = True
          DataSource = IndexDataSource
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
  end
  object IndexQuery: TOraQuery
    FetchAll = True
    ReadOnly = True
    AutoCommit = False
    Left = 208
    Top = 52
  end
  object IndexDataSource: TOraDataSource
    DataSet = IndexQuery
    Left = 208
    Top = 120
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
          '     AND dic.index_name = :p_object_name'
          '     AND di.owner = :p_owner'
          '     AND dic.index_owner = :p_owner'
          'ORDER BY dic.index_name, dic.column_position'
          '')
      end
      item
        Name = 'IndexesSQL'
        Strings.Strings = (
          'SELECT   dic.index_name "Index Name",'
          '         di.uniqueness "Uniqueness",'
          '         INITCAP(di.status) "Status",  '
          '         dic.column_position "Position", '
          '         dic.column_name "Column Name", '
          '         di.logging "Logging", '
          '         di.degree "Degree"'
          '    FROM all_indexes di, all_ind_columns dic'
          '   WHERE dic.table_name = di.table_name'
          '     AND dic.index_name = di.index_name'
          '     AND dic.index_name = :p_object_name'
          '     AND di.owner = :p_owner'
          '     AND dic.index_owner = :p_owner'
          'ORDER BY dic.index_name, dic.column_position')
      end
      item
        Name = 'DescendTestSQL'
        Strings.Strings = (
          'SELECT descend FROM all_ind_columns')
      end>
    Left = 92
    Top = 124
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
    object RefreshAction: TAction
      Caption = 'RefreshAction'
      Hint = 'Refresh'
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
end
