object ObjectSearhForm: TObjectSearhForm
  Left = 0
  Top = 0
  Caption = 'Object Search'
  ClientHeight = 434
  ClientWidth = 611
  Color = clWindow
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  Visible = True
  OnClose = FormClose
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object ButtonPanel: TPanel
    Left = 0
    Top = 0
    Width = 611
    Height = 26
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object SearchForLabel: TLabel
      Left = 8
      Top = 7
      Width = 50
      Height = 13
      Caption = 'Search for'
    end
    object SearchForEdit: TBCEdit
      Left = 68
      Top = 4
      Width = 221
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnKeyPress = SearchForEditKeyPress
      EnterToTab = False
      OnlyNumbers = False
      NumbersWithDots = False
      NumbersWithSpots = False
      ErrorColor = 14803198
      NumbersAllowNegative = False
    end
    object CaseSensitiveCheckBox: TBCCheckBox
      Left = 367
      Top = 7
      Width = 91
      Height = 15
      Caption = 'Case sensitive'
      TabOrder = 2
      AutoSize = True
      ReadOnly = False
    end
    object SearchBitBtn: TJvBitBtn
      Left = 291
      Top = 3
      Width = 66
      Height = 23
      Action = SearchAction
      Caption = '&Search'
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FF3A6EA03B6C9BFF00FFFF00FFC7C6C3BBB7AFB2ACA0AFA99DAEA99CAEA89CAE
        A89CAEA89CAFA99DB2ACA0BBB7AF316EA729B2FF44C8FF3A82CAC1BEB9B4ADA2
        C2BBB0D0C7BEDFD5CDE6DCD4E0D5CFA8A29E6C6C6E67676B67676A6D6A698174
        6B3BC6FF57DBFF3980C9B1AB9FC7C0B6CFC7BED5CCC3DBD2C9E2D8D0A7A09D76
        7372E8C992FFEEA7FFF5B1E8D5A377716CA090853280CFFF00FFB1AB9FC9C0B8
        CDC5BCD4CBC2DAD1C8E1D7CF777778E9C48AFFE7A6FFE7A6FFEFB3FFF9BBE9D6
        A2807875FF00FFFF00FFB0AB9EC8BFB7CBC3BAD2C9C0D8CFC5DFD5CD76787BFF
        E3A0FFEFCAFFE7B3FFE9ABFFEFB2FFF4AF787677FF00FFFF00FFB0AA9EC9C2B9
        E2DDD4F5EFE9FFFBF4FEFAF37C7C7FFFDF99FFF7E4FFEDC8FFE7B2FFE6A5FFEC
        A57C7B7EFF00FFFF00FFC1BDB6F9F4EED7D0C8C6BEB6BEB5ABC2B9AF848385EB
        C080FFF5DCFFF7E4FFEFCAFFE6A5EBCC95848385FF00FFFF00FFBBB7AFA3998F
        B6AEA4C8BFB6D8CFC7E3D9D1CFC6C28E8B88ECC081FFDE98FFE19DECC78D8E8A
        89AEAAA5FF00FFFF00FFB1AB9FCAC1B9CEC7BED5CCC3DAD1C8E1D7CFE8DCD6D1
        C8C38F8D8F8B8B8E8B8B8E8E8D8FBAB5AEB1AB9FFF00FFFF00FFB1AB9EC8BFB7
        CBC3BAD2C8BFD8CEC5DFD5CDE9DED8E9DDD6E0D6CFDACFC7D3CBC2CEC6BDC9C2
        B8B0AB9EFF00FFFF00FFB0AA9DC7C0B8E1DBD2F3EDE6FDF9F2FCF8F1FBF7F0FB
        F7F0FCF8F1FDF8F2F4EEE6E2DBD3CAC3B9AFAA9DFF00FFFF00FFAEA89CFBF5EF
        EEE7DEE3DCD3DDD5CCDDD5CBDDD4CBDDD4CBDDD4CBDDD5CBE3DCD3EEE7DEFBF6
        EFAEA89CFF00FFFF00FFAFA99DE1D8CEE1D8CEDFD6CCDFD6CBDFD5CBDFD5CBDF
        D5CBDFD5CBDFD6CBDFD6CCE1D8CEE1D8CEAFA99DFF00FFFF00FFDCDAD4B6B0A4
        D2CABFE2D9D0EFE7DDEEE6DCEEE6DCEEE6DCEEE6DCEFE7DDE2D9D0D2CABFB6B0
        A4DCDAD4FF00FFFF00FFFF00FFFF00FFCBC7BFB2ACA1AEA89CAEA89CAEA89CAE
        A89CAEA89CAEA89CB2ACA1CBC7BFFF00FFFF00FFFF00FFFF00FF}
      TabOrder = 1
    end
  end
  object StatusBar: TStatusBar
    Left = 0
    Top = 415
    Width = 611
    Height = 19
    Panels = <
      item
        Width = 400
      end
      item
        Width = 100
      end>
    SimplePanel = True
  end
  object TreePanel: TPanel
    Left = 0
    Top = 26
    Width = 611
    Height = 389
    Align = alClient
    BevelOuter = bvNone
    Padding.Left = 4
    Padding.Top = 2
    Padding.Right = 4
    Padding.Bottom = 4
    TabOrder = 2
    object VirtualDrawTree: TVirtualDrawTree
      Left = 4
      Top = 2
      Width = 603
      Height = 383
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
      OnInitChildren = VirtualDrawTreeInitChildren
      OnInitNode = VirtualDrawTreeInitNode
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
          Width = 294
          WideText = 'Search Result'
        end>
    end
  end
  object ObjectSearchQuery: TOraQuery
    FetchAll = True
    AfterOpen = ObjectSearchQueryAfterOpen
    Left = 180
    Top = 120
  end
  object ActionList: TActionList
    Images = ImagesDataModule.ImageList
    Left = 344
    Top = 131
    object SearchAction: TAction
      Caption = '&Search'
      Hint = 'Execute Search'
      ImageIndex = 51
      OnExecute = SearchActionExecute
    end
  end
  object ColumnsQuery: TOraQuery
    FetchRows = 500
    AfterOpen = ObjectSearchQueryAfterOpen
    Left = 178
    Top = 188
  end
end
