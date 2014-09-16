object SynonymBrowserFrame: TSynonymBrowserFrame
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
  object SynonymPageControl: TBCPageControl
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
    OnChange = SynonymPageControlChange
    ActivePageCaption = 'Info'
    TabDragDrop = False
    HoldShiftToDragDrop = False
    ShowCloseButton = False
    object InfoTabSheet: TTabSheet
      Caption = 'Info'
      ImageIndex = 6
      object SynonymPanel: TPanel
        Left = 0
        Top = 0
        Width = 443
        Height = 254
        Align = alClient
        BevelOuter = bvNone
        Padding.Right = 2
        Padding.Bottom = 1
        TabOrder = 0
        object SynonymDBGrid: TBCDBGrid
          Left = 0
          Top = 0
          Width = 441
          Height = 253
          Align = alClient
          AllowedSelections = [gstRecordBookmarks, gstAll]
          Ctl3D = True
          DataSource = SynonymDataSource
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
  object SynonymQuery: TOraQuery
    SQL.Strings = (
      
        'SELECT s.owner "Synonym Owner", s.synonym_name "Synonym Name", s' +
        '.table_owner "Object Owner", s.table_name "Object Name",'
      '       o.object_type "Object Type", s.db_link "DB Link"'
      '  FROM all_synonyms s, all_objects o'
      ' WHERE s.synonym_name = :p_object_name'
      '   AND o.object_name = s.table_name'
      '   AND s.table_owner = :p_owner'
      '   AND o.owner = :p_owner')
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
      end
      item
        DataType = ftUnknown
        Name = 'p_owner'
        Value = nil
      end>
  end
  object SynonymDataSource: TOraDataSource
    DataSet = SynonymQuery
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
