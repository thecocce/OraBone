object RecycleBinBrowserFrame: TRecycleBinBrowserFrame
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
  object RecycleBinPageControl: TBCPageControl
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
    OnChange = RecycleBinPageControlChange
    ActivePageCaption = 'Info'
    TabDragDrop = False
    HoldShiftToDragDrop = False
    ShowCloseButton = False
    object InfoTabSheet: TTabSheet
      Caption = 'Info'
      ImageIndex = 6
      object RecycleBinPanel: TPanel
        Left = 0
        Top = 0
        Width = 443
        Height = 254
        Align = alClient
        BevelOuter = bvNone
        Padding.Right = 2
        Padding.Bottom = 1
        TabOrder = 0
        object RecycleBinDBGrid: TBCDBGrid
          Left = 0
          Top = 0
          Width = 441
          Height = 253
          Align = alClient
          AllowedSelections = [gstRecordBookmarks, gstAll]
          Ctl3D = True
          DataSource = RecycleBinDataSource
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
  object RecycleBinQuery: TOraQuery
    SQL.Strings = (
      'SELECT original_name "Original Name", '
      '       object_name "Object Name", '
      '       operation "Operation", '
      '       type "Object Type", '
      '       ts_name "Tablespace", '
      '       createtime "Create Time", '
      '       droptime "Drop Time", '
      '       can_undrop "Undroppable",'
      '       can_purge "Purgeable"'
      '  FROM user_recyclebin'
      ' WHERE original_name = :p_object_name')
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
  object RecycleBinDataSource: TOraDataSource
    DataSet = RecycleBinQuery
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
    object RefreshAction: TAction
      Caption = 'RefreshAction'
      ImageIndex = 161
      OnExecute = RefreshActionExecute
    end
  end
  object PageControlPopupActionBar: TPopupActionBar
    Images = ImagesDataModule.ImageList
    Left = 92
    Top = 80
    object CustomizePageControl1: TMenuItem
      Action = CustomizeAction
    end
  end
end
