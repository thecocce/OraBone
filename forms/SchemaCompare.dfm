object SchemaCompareForm: TSchemaCompareForm
  Left = 0
  Top = 0
  Caption = 'Compare Schemas'
  ClientHeight = 434
  ClientWidth = 672
  Color = clWindow
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnResize = FormResize
  DesignSize = (
    672
    434)
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl: TBCPageControl
    Left = 164
    Top = 56
    Width = 503
    Height = 353
    ActivePage = Schema1TabSheet
    Anchors = [akLeft, akTop, akRight, akBottom]
    DoubleBuffered = False
    Images = ImagesDataModule.ImageList
    ParentDoubleBuffered = False
    TabOrder = 0
    ActivePageCaption = '<select schema>'
    TabDragDrop = False
    HoldShiftToDragDrop = False
    ShowCloseButton = False
    object Schema1TabSheet: TTabSheet
      Caption = '<select schema>'
      ImageIndex = 44
      object Schema1Panel: TPanel
        Left = 0
        Top = 0
        Width = 495
        Height = 324
        Align = alClient
        BevelOuter = bvNone
        Padding.Left = 2
        Padding.Top = 1
        Padding.Right = 3
        Padding.Bottom = 2
        TabOrder = 0
        object Schema1VirtualDrawTree: TVirtualDrawTree
          Left = 2
          Top = 1
          Width = 490
          Height = 321
          Align = alClient
          Ctl3D = True
          DragOperations = []
          Header.AutoSizeIndex = 1
          Header.DefaultHeight = 20
          Header.Font.Charset = DEFAULT_CHARSET
          Header.Font.Color = clWindowText
          Header.Font.Height = -11
          Header.Font.Name = 'Tahoma'
          Header.Font.Style = []
          Header.Height = 20
          Header.Options = [hoAutoResize, hoColumnResize, hoShowSortGlyphs, hoVisible]
          Images = ImagesDataModule.ImageList
          IncrementalSearch = isAll
          Indent = 16
          ParentCtl3D = False
          TabOrder = 0
          TreeOptions.AutoOptions = [toAutoDropExpand, toAutoScroll, toAutoScrollOnExpand, toAutoTristateTracking, toAutoDeleteMovedNodes, toAutoChangeScale]
          TreeOptions.MiscOptions = [toFullRepaintOnResize, toInitOnSave, toToggleOnDblClick, toWheelPanning]
          TreeOptions.PaintOptions = [toHideFocusRect, toShowBackground, toShowButtons, toShowDropmark, toShowRoot, toThemeAware, toUseBlendedSelection]
          TreeOptions.SelectionOptions = [toFullRowSelect]
          OnDrawNode = VirtualDrawTreeDrawNode
          OnFreeNode = VirtualDrawTreeFreeNode
          OnGetImageIndex = VirtualDrawTreeGetImageIndex
          OnGetNodeWidth = VirtualDrawTreeGetNodeWidth
          Columns = <
            item
              Options = [coAllowClick, coEnabled, coParentBidiMode, coParentColor, coResizable, coShowDropMark, coVisible, coAllowFocus]
              Position = 0
              Width = 305
              WideText = 'Object'
            end
            item
              Options = [coAllowClick, coEnabled, coParentBidiMode, coParentColor, coResizable, coShowDropMark, coVisible, coAllowFocus]
              Position = 1
              Width = 181
              WideText = 'Difference'
            end>
        end
      end
    end
    object Schema2TabSheet: TTabSheet
      Caption = '<select schema>'
      ImageIndex = 44
      object Schema2Panel: TPanel
        Left = 0
        Top = 0
        Width = 495
        Height = 324
        Align = alClient
        BevelOuter = bvNone
        Padding.Left = 2
        Padding.Top = 1
        Padding.Right = 3
        Padding.Bottom = 2
        TabOrder = 0
        object Schema2VirtualDrawTree: TVirtualDrawTree
          Left = 2
          Top = 1
          Width = 490
          Height = 321
          Align = alClient
          BorderWidth = 1
          Ctl3D = True
          DragOperations = []
          Header.AutoSizeIndex = 1
          Header.DefaultHeight = 20
          Header.Font.Charset = DEFAULT_CHARSET
          Header.Font.Color = clWindowText
          Header.Font.Height = -11
          Header.Font.Name = 'Tahoma'
          Header.Font.Style = []
          Header.Height = 20
          Header.Options = [hoAutoResize, hoColumnResize, hoShowSortGlyphs, hoVisible]
          Images = ImagesDataModule.ImageList
          IncrementalSearch = isAll
          Indent = 16
          ParentCtl3D = False
          TabOrder = 0
          TreeOptions.AutoOptions = [toAutoDropExpand, toAutoScroll, toAutoScrollOnExpand, toAutoTristateTracking, toAutoDeleteMovedNodes, toAutoChangeScale]
          TreeOptions.MiscOptions = [toFullRepaintOnResize, toInitOnSave, toToggleOnDblClick, toWheelPanning]
          TreeOptions.PaintOptions = [toHideFocusRect, toShowBackground, toShowButtons, toShowDropmark, toShowRoot, toThemeAware, toUseBlendedSelection]
          TreeOptions.SelectionOptions = [toFullRowSelect]
          OnDrawNode = VirtualDrawTreeDrawNode
          OnFreeNode = VirtualDrawTreeFreeNode
          OnGetImageIndex = VirtualDrawTreeGetImageIndex
          OnGetNodeWidth = VirtualDrawTreeGetNodeWidth
          Columns = <
            item
              Options = [coAllowClick, coEnabled, coParentBidiMode, coParentColor, coResizable, coShowDropMark, coVisible, coAllowFocus]
              Position = 0
              Width = 305
              WideText = 'Object'
            end
            item
              Options = [coAllowClick, coEnabled, coParentBidiMode, coParentColor, coResizable, coShowDropMark, coVisible, coAllowFocus]
              Position = 1
              Width = 179
              WideText = 'Difference'
            end>
        end
      end
    end
  end
  object StatusBar: TJvStatusBar
    Left = 0
    Top = 415
    Width = 672
    Height = 19
    DoubleBuffered = False
    Panels = <
      item
        Width = 300
        Control = ProgressBar
      end>
    ParentDoubleBuffered = False
    object ProgressBar: TBCProgressBar
      Left = 0
      Top = 0
      Width = 672
      Height = 19
      Align = alClient
      Smooth = True
      Step = 1
      TabOrder = 0
      Visible = False
      ExplicitLeft = 3
      ExplicitTop = 3
    end
  end
  object SchemasGroupBox: TGroupBox
    Left = 6
    Top = 2
    Width = 661
    Height = 47
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Anchors = [akLeft, akTop, akRight]
    Caption = 'Schemas '
    TabOrder = 2
    DesignSize = (
      661
      47)
    object Schema1Label: TLabel
      Left = 325
      Top = 19
      Width = 11
      Height = 13
      Anchors = [akTop]
      Caption = 'vs'
    end
    object Schema1ComboBox: TBCComboBox
      AlignWithMargins = True
      Left = 8
      Top = 16
      Width = 304
      Height = 22
      Margins.Left = 6
      Margins.Top = 1
      Align = alLeft
      Style = csOwnerDrawFixed
      TabOrder = 0
      OnChange = Schema1ComboBoxChange
      OnDrawItem = Schema1ComboBoxDrawItem
      DeniedKeyStrokes = True
      ReadOnly = False
      DropDownFixedWidth = 0
    end
    object Schema2ComboBox: TBCComboBox
      AlignWithMargins = True
      Left = 349
      Top = 16
      Width = 304
      Height = 22
      Margins.Top = 1
      Margins.Right = 6
      Align = alRight
      Style = csOwnerDrawFixed
      TabOrder = 1
      OnChange = Schema2ComboBoxChange
      OnDrawItem = Schema2ComboBoxDrawItem
      DeniedKeyStrokes = True
      ReadOnly = False
      DropDownFixedWidth = 0
    end
  end
  object ComparedObjectsGroupBox: TGroupBox
    Left = 6
    Top = 50
    Width = 151
    Height = 359
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Anchors = [akLeft, akTop, akBottom]
    Caption = 'Compared Objects '
    TabOrder = 3
    object TablesCheckBox: TBCCheckBox
      Left = 12
      Top = 18
      Width = 52
      Height = 17
      Caption = 'Tables'
      Checked = True
      State = cbChecked
      TabOrder = 0
      LinkedControls = <>
    end
    object ViewsCheckBox: TBCCheckBox
      Left = 12
      Top = 42
      Width = 48
      Height = 17
      Caption = 'Views'
      Checked = True
      State = cbChecked
      TabOrder = 1
      LinkedControls = <>
    end
    object FunctionsCheckBox: TBCCheckBox
      Left = 12
      Top = 66
      Width = 67
      Height = 17
      Caption = 'Functions'
      Checked = True
      State = cbChecked
      TabOrder = 2
      LinkedControls = <>
    end
    object ProceduresCheckBox: TBCCheckBox
      Left = 12
      Top = 90
      Width = 75
      Height = 17
      Caption = 'Procedures'
      Checked = True
      State = cbChecked
      TabOrder = 3
      LinkedControls = <>
    end
    object PackagesCheckBox: TBCCheckBox
      Left = 12
      Top = 114
      Width = 66
      Height = 17
      Caption = 'Packages'
      Checked = True
      State = cbChecked
      TabOrder = 4
      LinkedControls = <>
    end
    object TriggersCheckBox: TBCCheckBox
      Left = 12
      Top = 137
      Width = 60
      Height = 17
      Caption = 'Triggers'
      Checked = True
      State = cbChecked
      TabOrder = 5
      LinkedControls = <>
    end
    object ConstraintsCheckBox: TBCCheckBox
      Left = 12
      Top = 161
      Width = 76
      Height = 17
      Caption = 'Constraints'
      Checked = True
      State = cbChecked
      TabOrder = 6
      LinkedControls = <>
    end
    object IndexesCheckBox: TBCCheckBox
      Left = 12
      Top = 185
      Width = 60
      Height = 17
      Caption = 'Indexes'
      Checked = True
      State = cbChecked
      TabOrder = 7
      LinkedControls = <>
    end
    object SequencesCheckBox: TBCCheckBox
      Left = 12
      Top = 209
      Width = 73
      Height = 17
      Caption = 'Sequences'
      Checked = True
      State = cbChecked
      TabOrder = 8
      LinkedControls = <>
    end
    object SynonymsCheckBox: TBCCheckBox
      Left = 12
      Top = 233
      Width = 70
      Height = 17
      Caption = 'Synonyms'
      Checked = True
      State = cbChecked
      TabOrder = 9
      LinkedControls = <>
    end
    object DBLinksCheckBox: TBCCheckBox
      Left = 12
      Top = 257
      Width = 60
      Height = 17
      Caption = 'DB Links'
      Checked = True
      State = cbChecked
      TabOrder = 10
      LinkedControls = <>
    end
    object TableCommentsCheckBox: TBCCheckBox
      Left = 12
      Top = 281
      Width = 100
      Height = 17
      Caption = 'Table Comments'
      Checked = True
      State = cbChecked
      TabOrder = 11
      LinkedControls = <>
    end
    object ColumnNamesCheckBox: TBCCheckBox
      Left = 12
      Top = 305
      Width = 91
      Height = 17
      Caption = 'Column Names'
      Checked = True
      State = cbChecked
      TabOrder = 12
      LinkedControls = <>
    end
    object ColumnCommentsCheckBox: TBCCheckBox
      Left = 12
      Top = 328
      Width = 109
      Height = 17
      Caption = 'Column Comments'
      Checked = True
      State = cbChecked
      TabOrder = 13
      LinkedControls = <>
    end
  end
  object Schema1Query: TOraQuery
    SQL.Strings = (
      
        'SELECT 0 id, LPAD('#39' '#39', 30) object_type, LPAD('#39' '#39', 61) object_nam' +
        'e, LPAD('#39' '#39', 30) column_name, LPAD('#39' '#39', 2000) compare_result,'
      '       0 level0_index, 1 level1_index'
      '  FROM dual'
      ' WHERE 1 = 0')
    FetchAll = True
    Left = 208
    Top = 120
  end
  object Schema2Query: TOraQuery
    SQL.Strings = (
      
        'SELECT 0 id, LPAD('#39' '#39', 30) object_type, LPAD('#39' '#39', 61) object_nam' +
        'e, LPAD('#39' '#39', 30) column_name, LPAD('#39' '#39', 2000) compare_result,'
      '       0 level0_index, 1 level1_index'
      '  FROM dual'
      ' WHERE 1 = 0')
    FetchAll = True
    Left = 402
    Top = 126
  end
end
