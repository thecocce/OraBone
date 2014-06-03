object SQLEditorFrame: TSQLEditorFrame
  Left = 0
  Top = 0
  Width = 451
  Height = 304
  Hint = ' '
  Align = alClient
  DoubleBuffered = False
  Color = clWindow
  ParentBackground = False
  ParentColor = False
  ParentDoubleBuffered = False
  TabOrder = 0
  object HorizontalSplitter: TJvSplitter
    Left = 0
    Top = 78
    Width = 451
    Height = 3
    Cursor = crVSplit
    Hint = ' '
    Align = alBottom
    ExplicitTop = 187
    ExplicitWidth = 651
  end
  object SearchPanel: TPanel
    Left = 0
    Top = 23
    Width = 451
    Height = 21
    Hint = ' '
    Align = alTop
    BevelOuter = bvNone
    Color = clWindow
    ParentBackground = False
    TabOrder = 0
    Visible = False
    object SearchPanel2: TPanel
      Left = 21
      Top = 0
      Width = 60
      Height = 21
      Align = alLeft
      AutoSize = True
      BevelOuter = bvNone
      Padding.Left = 4
      Padding.Top = 3
      Padding.Right = 6
      TabOrder = 0
      object SearchForLabel: TLabel
        Left = 4
        Top = 3
        Width = 50
        Height = 18
        Align = alLeft
        Caption = 'Search for'
        ExplicitHeight = 13
      end
    end
    object SearchPanel3: TPanel
      Left = 81
      Top = 0
      Width = 185
      Height = 21
      Align = alLeft
      BevelOuter = bvNone
      Caption = 'SearchPanel3'
      Padding.Left = 4
      TabOrder = 1
      object SearchForEdit: TBCButtonedEdit
        Left = 4
        Top = 0
        Width = 181
        Height = 21
        Align = alTop
        DoubleBuffered = True
        Images = ImageList16
        ParentDoubleBuffered = False
        RightButton.HotImageIndex = 3
        RightButton.ImageIndex = 2
        RightButton.PressedImageIndex = 4
        TabOrder = 0
        OnChange = SearchForEditChange
        OnRightButtonClick = SearchClearActionExecute
      end
    end
    object SearchPanel1: TPanel
      Left = 0
      Top = 0
      Width = 21
      Height = 21
      Align = alLeft
      AutoSize = True
      BevelOuter = bvNone
      Padding.Right = 2
      TabOrder = 2
      object JvSpeedButton1: TSpeedButton
        Left = 0
        Top = 0
        Width = 19
        Height = 21
        Action = SearchCloseAction
        Align = alLeft
        Flat = True
        Glyph.Data = {
          36060000424D3606000000000000360000002800000020000000100000000100
          18000000000000060000120B0000120B00000000000000000000FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FF717171717171FF00FFFF00FFFF00FF717171717171FF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF717171717171FF00FFFF
          00FFFF00FF717171717171FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FF717171DBDBDBDBDBDB717171FF00FF717171DBDBDBDBDBDB717171FF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF717171FFFFFFFFFFFF717171FF
          00FF717171FFFFFFFFFFFF717171FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FF717171DBDBDBDBDBDBDBDBDB717171DBDBDBDBDBDBDBDBDB717171FF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF717171FFFFFFFFFFFFFFFFFF71
          7171FFFFFFFFFFFFFFFFFF717171FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FF717171DBDBDBDBDBDBDBDBDBDBDBDBDBDBDB787878FF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF717171FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF787878FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FF717171DBDBDBDBDBDBDBDBDB717171FF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF717171FFFFFFFF
          FFFFFFFFFF717171FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FF717171DBDBDBDBDBDBDBDBDBDBDBDBDBDBDB717171FF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF717171FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF717171FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FF717171DBDBDBDBDBDBDBDBDB717171DBDBDBDBDBDBDBDBDB717171FF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF717171FFFFFFFFFFFFFFFFFF71
          7171FFFFFFFFFFFFFFFFFF717171FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FF717171DBDBDBDBDBDB717171FF00FF717171DBDBDBDBDBDB717171FF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF717171FFFFFFFFFFFF717171FF
          00FF717171FFFFFFFFFFFF717171FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FF717171717171FF00FFFF00FFFF00FF717171717171FF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF717171717171FF00FFFF
          00FFFF00FF717171717171FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
        Margin = 2
        NumGlyphs = 2
      end
    end
    object SearchPanel5: TPanel
      Left = 266
      Top = 0
      Width = 21
      Height = 21
      Align = alLeft
      AutoSize = True
      BevelOuter = bvNone
      TabOrder = 3
      object SpeedButton1: TSpeedButton
        Left = 0
        Top = 0
        Width = 21
        Height = 21
        Action = SearchFindNextAction
        Align = alLeft
        Flat = True
        Glyph.Data = {
          36060000424D3606000000000000360000002800000020000000100000000100
          18000000000000060000120B0000120B00000000000000000000FF00FF676363
          6B6767706E6CFF00FFFF00FFFF00FF6763636A6765706E6CFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FF6363636767676E6E6EFF00FFFF00FFFF00FF63
          63636666666E6E6EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF615E5D858482
          BDBCBAC3C3C1787573FF00FF5F5B5B858482BDBCBAC3C2C0777472FF00FFFF00
          FFFF00FFFF00FFFF00FF5D5D5D848484BDBDBDC2C2C2757575FF00FF5C5C5C84
          8484BCBCBCC2C2C2747474FF00FFFF00FFFF00FFFF00FFFF00FF5F5C5B81807E
          B7B6B4BEBDBB7572706E6C6A5C595880807EB7B6B4BEBDBB757371FF00FFFF00
          FFFF00FFFF00FFFF00FF5C5C5C808080B6B6B6BDBDBD7272726C6C6C5858587F
          7F7FB5B5B5BCBCBC737373FF00FFFF00FFFF00FFFF00FFFF00FF5F5C5BC3C2C1
          E1E0DFE5E5E473716EBBB9B8595655C1C1C0E1E0DFE6E5E4757371FF00FFFF00
          FFFF00FFFF00FFFF00FF5C5C5CC1C1C1DFDFDFE5E5E5717171B9B9B9555555C0
          C0C0E0E0E0E5E5E5737373FF00FFFF00FFFF00FFFF00FFFF00FF615E5D64605F
          6562616A6866FF00FFBAB8B7FF00FF605C5C63615E6C6A68797775FF00FFFF00
          FFFF00FFFF00FFFF00FF5E5E5E606060616161676767FF00FFB8B8B8FF00FF5D
          5D5D616161696969777777FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF615E5D
          9A9897CBC9C6767271BBBAB95C59589A9897CCCAC7787574FF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FF5E5E5E989898C8C8C8717171BABABA59595997
          9797CACACA757575FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          6864646D6B69FF00FF6F6D6BFF00FF6663626E6C6AFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FF6464646A6A6AFF00FF6C6C6CFF00FF63
          63636C6C6CFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          625F5DB9B9B7797775FF00FF615F5DBAB9B7797775FF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FF5F5F5FB8B8B8777777FF00FF5F5F5FB9
          B9B9777777FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          6462606E6C6A7A7876FF00FF62605E6D6B697A7876FF00FFFF00FF408135008C
          4AFF00FFFF00FFFF00FFFF00FFFF00FF6161616D6D6D787878FF00FF6060606A
          6A6A787878FF00FFFF00FF7171717B7B7BFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00853D4ED4
          A8008846FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FF767676C6C6C6787878FF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF34A27C00813400813800B87B11DC
          A962D3AE008744FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FF959595707070717171A7A7A7CCCCCCC7C7C7787878FF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0082335AE8C800CF9C00CD9B00CC
          9A12D3A772D7B9008A48FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FF727272DBDBDBBFBFBFBEBEBEBCBCBCC4C4C4CDCDCD7B7B7BFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0082346DE5D05BDEC560DDC400C4
          9900C59B83E5D2008A47FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FF727272DCDCDCD3D3D3D2D2D2B6B6B6B7B7B7DCDCDC7A7A7AFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF09915602995A07985B0DBB9500BE
          9B95E5D61B975CFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FF8282828A8A8A898989AEAEAEB1B1B1DEDEDE888888FF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0087409EE7
          E01E995EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FF767676E2E2E28B8B8BFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF1083391B9D
          64FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FF7474748E8E8EFF00FFFF00FFFF00FF}
        NumGlyphs = 2
      end
    end
    object SearchPanel6: TPanel
      Left = 287
      Top = 0
      Width = 23
      Height = 21
      Align = alLeft
      AutoSize = True
      BevelOuter = bvNone
      Padding.Left = 2
      TabOrder = 4
      object SpeedButton2: TSpeedButton
        Left = 2
        Top = 0
        Width = 21
        Height = 21
        Action = SearchFindPreviousAction
        Align = alLeft
        Flat = True
        Glyph.Data = {
          36060000424D3606000000000000360000002800000020000000100000000100
          18000000000000060000120B0000120B00000000000000000000FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FF706E6C6A6765676363FF00FFFF00FFFF00FF706E
          6C6B6767676363FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6E6E6E67
          6767636363FF00FFFF00FFFF00FF6D6D6D676767646464FF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FF777472C3C2C0BDBCBA8584825F5B5BFF00FF787573C3C3
          C1BDBCBA858482615E5DFF00FFFF00FFFF00FFFF00FFFF00FF747474C2C2C2BC
          BCBC8383835C5C5CFF00FF757575C3C3C3BCBCBC8484845F5F5FFF00FFFF00FF
          FF00FFFF00FFFF00FF757371BEBDBBB7B6B480807E5C59586E6C6A757270BEBD
          BBB7B6B481807E5F5C5BFF00FFFF00FFFF00FFFF00FFFF00FF737373BEBEBEB6
          B6B67F7F7F5959596B6B6B727272BCBCBCB5B5B58080805D5D5DFF00FFFF00FF
          FF00FFFF00FFFF00FF757371E6E5E4E1E0DFC1C1C0595655BBB9B873716EE5E5
          E4E1E0DFC3C2C15F5C5BFF00FFFF00FFFF00FFFF00FFFF00FF727272E5E5E5E0
          E0E0C1C1C1575757B9B9B96F6F6FE5E5E5E0E0E0C1C1C15C5C5CFF00FFFF00FF
          FF00FFFF00FFFF00FF7977756C6A6863615E605C5CFF00FFBAB8B7FF00FF6A68
          6665626164605F615E5DFF00FFFF00FFFF00FFFF00FFFF00FF77777769696960
          60605B5B5BFF00FFB8B8B8FF00FF6767676262626060605E5E5EFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FF787574CCCAC79A98975C5958BBBAB9767271CBC9
          C69A9897615E5DFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF757575CA
          CACA989898595959B9B9B9737373C8C8C89898985E5E5EFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FF6E6C6A666362FF00FF6F6D6BFF00FF6D6B
          69686464FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6C
          6C6C636363FF00FF6C6C6CFF00FF6A6A6A646464FF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FF797775BAB9B7615F5DFF00FF797775B9B9
          B7625F5DFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF77
          7777B8B8B85E5E5EFF00FF757575B9B9B95F5F5FFF00FFFF00FFFF00FFFF00FF
          FF00FF008C4A408135FF00FFFF00FF7A78766D6B6962605EFF00FF7A78766E6C
          6A646260FF00FFFF00FFFF00FFFF00FFFF00FF7D7D7D727272FF00FFFF00FF78
          78786A6A6A606060FF00FF7878786C6C6C626262FF00FFFF00FFFF00FFFF00FF
          0088464ED4A800853DFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FF797979C6C6C6767676FF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF008744
          62D3AE11DCA900B87B00813800813434A27CFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FF787878C7C7C7CCCCCCA7A7A771717172727297
          9797FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF008A4872D7B9
          12D3A700CC9A00CD9B00CF9C5AE8C8008233FF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FF797979CDCDCDC4C4C4BCBCBCBCBCBCBFBFBFDCDCDC72
          7272FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF008A4783E5D2
          00C59B00C49960DDC45BDEC56DE5D0008234FF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FF7B7B7BDDDDDDB7B7B7B5B5B5D3D3D3D3D3D3DBDBDB72
          7272FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF1B975C
          95E5D600BE9B0DBB9507985B02995A099156FF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FF888888DEDEDEB1B1B1AFAFAF89898989898983
          8383FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          1E995E9EE7E0008740FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FF8A8A8AE2E2E2767676FF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FF1B9D64108339FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF8E8E8E737373FF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
        NumGlyphs = 2
      end
    end
    object SearchPanel7: TPanel
      Left = 310
      Top = 0
      Width = 99
      Height = 21
      Align = alLeft
      AutoSize = True
      BevelOuter = bvNone
      Padding.Left = 8
      Padding.Top = 2
      TabOrder = 5
      object CaseSensitiveCheckBox: TBCCheckBox
        Left = 8
        Top = 2
        Width = 91
        Height = 19
        Align = alLeft
        Caption = 'Case Sensitive'
        Color = clWindow
        ParentColor = False
        TabOrder = 0
        LinkedControls = <>
      end
    end
    object Panel1: TPanel
      Left = 409
      Top = 0
      Width = 8
      Height = 21
      Align = alLeft
      BevelOuter = bvNone
      TabOrder = 6
    end
    object WholeWordsCheckBox: TBCCheckBox
      Left = 417
      Top = 0
      Width = 110
      Height = 21
      Align = alLeft
      Caption = 'Whole Words Only'
      Color = clWindow
      ParentColor = False
      TabOrder = 7
      LinkedControls = <>
    end
    object Panel2: TPanel
      Left = 527
      Top = 0
      Width = 8
      Height = 21
      Align = alLeft
      BevelOuter = bvNone
      TabOrder = 8
    end
    object RegularExpressionCheckBox: TBCCheckBox
      Left = 535
      Top = 0
      Width = 113
      Height = 21
      Align = alLeft
      Caption = 'Regular Expression'
      Color = clWindow
      ParentColor = False
      TabOrder = 9
      LinkedControls = <>
    end
    object AfterRegularExpressionPanel: TPanel
      Left = 648
      Top = 0
      Width = 8
      Height = 21
      Align = alLeft
      BevelOuter = bvNone
      TabOrder = 10
    end
    object WildCardCheckBox: TBCCheckBox
      Left = 656
      Top = 0
      Width = 67
      Height = 21
      Align = alLeft
      Caption = 'Wild Card'
      TabOrder = 11
      LinkedControls = <>
    end
  end
  object DocumentPanel: TPanel
    Left = 0
    Top = 44
    Width = 451
    Height = 9
    Align = alClient
    BevelOuter = bvNone
    Color = clWindow
    UseDockManager = False
    Padding.Top = 2
    ParentBackground = False
    TabOrder = 1
    object PageControl: TBCPageControl
      Left = 0
      Top = 2
      Width = 451
      Height = 7
      Hint = ' '
      Align = alClient
      DoubleBuffered = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentDoubleBuffered = False
      ParentFont = False
      TabOrder = 0
      OnChange = PageControlChange
      OnMouseDown = PageControlMouseDown
      TabDragDrop = True
      HoldShiftToDragDrop = False
      ShowCloseButton = False
      OnCloseButtonClick = PageControlCloseButtonClick
      OnDblClick = PageControlDblClick
    end
  end
  object OutputPanel: TPanel
    Left = 0
    Top = 81
    Width = 451
    Height = 223
    Hint = ' '
    Align = alBottom
    BevelOuter = bvNone
    ParentColor = True
    TabOrder = 2
    Visible = False
  end
  object ToolbarPanel: TPanel
    Left = 0
    Top = 0
    Width = 451
    Height = 23
    Align = alTop
    BevelOuter = bvNone
    Color = clWindow
    DoubleBuffered = False
    ParentBackground = False
    ParentDoubleBuffered = False
    TabOrder = 3
    object ExecuteToolbarPanel: TPanel
      Left = 0
      Top = 0
      Width = 83
      Height = 23
      Align = alLeft
      BevelOuter = bvNone
      ParentColor = True
      TabOrder = 0
      object Toolbar1Bevel: TBevel
        AlignWithMargins = True
        Left = 75
        Top = 2
        Width = 4
        Height = 19
        Margins.Left = 6
        Margins.Top = 2
        Margins.Bottom = 2
        Align = alLeft
        Shape = bsLeftLine
      end
      object ExecuteToolBar: TBCToolBar
        Left = 0
        Top = 0
        Width = 69
        Height = 23
        Align = alLeft
        Caption = 'ExecuteToolBar'
        DoubleBuffered = False
        Images = ImagesDataModule.ImageList
        ParentDoubleBuffered = False
        TabOrder = 0
        object ExecuteToolButton: TToolButton
          Left = 0
          Top = 0
        end
        object ExecuteCurrentToolButton: TToolButton
          Left = 23
          Top = 0
        end
        object ExecuteScriptToolButton: TToolButton
          Left = 46
          Top = 0
        end
      end
    end
    object TransactionToolbarPanel: TPanel
      Left = 83
      Top = 0
      Width = 61
      Height = 23
      Align = alLeft
      BevelOuter = bvNone
      ParentColor = True
      TabOrder = 1
      object Bevel1: TBevel
        AlignWithMargins = True
        Left = 52
        Top = 2
        Width = 4
        Height = 19
        Margins.Left = 6
        Margins.Top = 2
        Margins.Bottom = 2
        Align = alLeft
        Shape = bsLeftLine
      end
      object CommitRollbackToolBar: TBCToolBar
        Left = 0
        Top = 0
        Width = 46
        Height = 23
        Align = alLeft
        AutoSize = True
        Caption = 'CommitRollbackToolBar'
        DoubleBuffered = False
        ParentDoubleBuffered = False
        TabOrder = 0
        object CommitToolButton: TToolButton
          Left = 0
          Top = 0
        end
        object RollbackToolButton: TToolButton
          Left = 23
          Top = 0
        end
      end
    end
    object DBMSToolbarPanel: TPanel
      Left = 144
      Top = 0
      Width = 37
      Height = 23
      Align = alLeft
      BevelOuter = bvNone
      DoubleBuffered = False
      ParentColor = True
      ParentDoubleBuffered = False
      TabOrder = 2
      object Bevel3: TBevel
        AlignWithMargins = True
        Left = 29
        Top = 2
        Width = 3
        Height = 19
        Margins.Left = 6
        Margins.Top = 2
        Margins.Bottom = 2
        Align = alLeft
        Shape = bsLeftLine
      end
      object DBMSToolBar: TBCToolBar
        Left = 0
        Top = 0
        Width = 23
        Height = 23
        Align = alLeft
        AutoSize = True
        Caption = 'BCToolBar2'
        TabOrder = 0
        object DBMSOutputToolButton: TToolButton
          Left = 0
          Top = 0
          Style = tbsCheck
        end
      end
    end
    object ExplainPlanToolbarPanel: TPanel
      Left = 181
      Top = 0
      Width = 37
      Height = 23
      Align = alLeft
      BevelOuter = bvNone
      ParentColor = True
      TabOrder = 3
      object Bevel4: TBevel
        AlignWithMargins = True
        Left = 29
        Top = 2
        Width = 3
        Height = 19
        Margins.Left = 6
        Margins.Top = 2
        Margins.Bottom = 2
        Align = alLeft
        Shape = bsLeftLine
      end
      object PlanToolBar: TBCToolBar
        Left = 0
        Top = 0
        Width = 23
        Height = 23
        Align = alLeft
        TabOrder = 0
        object ExplainPlanToolButton: TToolButton
          Left = 0
          Top = 0
        end
      end
    end
    object StandardToolbarPanel: TPanel
      Left = 218
      Top = 0
      Width = 185
      Height = 23
      Align = alLeft
      BevelOuter = bvNone
      ParentColor = True
      TabOrder = 4
      object Bevel5: TBevel
        AlignWithMargins = True
        Left = 52
        Top = 2
        Width = 3
        Height = 19
        Margins.Left = 6
        Margins.Top = 2
        Margins.Bottom = 2
        Align = alLeft
        Shape = bsLeftLine
      end
      object Bevel6: TBevel
        AlignWithMargins = True
        Left = 179
        Top = 2
        Width = 3
        Height = 19
        Margins.Left = 6
        Margins.Top = 2
        Margins.Bottom = 2
        Align = alLeft
        Shape = bsLeftLine
      end
      object StandardToolBar: TBCToolBar
        Left = 0
        Top = 0
        Width = 46
        Height = 23
        Align = alLeft
        AutoSize = True
        Caption = 'StandardToolBar'
        DoubleBuffered = False
        ParentDoubleBuffered = False
        TabOrder = 0
        object FileNewToolButton: TToolButton
          Left = 0
          Top = 0
          Action = MainForm.FileNewAction
        end
        object FileOpenToolButton: TToolButton
          Left = 23
          Top = 0
          Action = MainForm.FileOpenAction
        end
      end
      object SaveToolBar: TBCToolBar
        Left = 58
        Top = 0
        Width = 115
        Height = 23
        Align = alLeft
        TabOrder = 1
        object FileSaveToolButton: TToolButton
          Left = 0
          Top = 0
          Action = MainForm.FileSaveAction
        end
        object FileSaveAsToolButton: TToolButton
          Left = 23
          Top = 0
          Action = MainForm.FileSaveAsAction
        end
        object FileSaveAllToolButton: TToolButton
          Left = 46
          Top = 0
          Action = MainForm.FileSaveAllAction
        end
        object FileCloseToolButton: TToolButton
          Left = 69
          Top = 0
          Action = MainForm.FileCloseAction
        end
        object FileCloseAllToolButton: TToolButton
          Left = 92
          Top = 0
          Action = MainForm.FileCloseAllAction
        end
      end
    end
    object PrintToolbarPanel: TPanel
      Left = 403
      Top = 0
      Width = 60
      Height = 23
      Align = alLeft
      BevelOuter = bvNone
      ParentColor = True
      TabOrder = 5
      object Bevel7: TBevel
        AlignWithMargins = True
        Left = 52
        Top = 2
        Width = 3
        Height = 19
        Margins.Left = 6
        Margins.Top = 2
        Margins.Bottom = 2
        Align = alLeft
        Shape = bsLeftLine
      end
      object PrintToolBar: TBCToolBar
        Left = 0
        Top = 0
        Width = 46
        Height = 23
        Align = alLeft
        Caption = 'PrintToolBar'
        TabOrder = 0
        object FilePrintToolButton: TToolButton
          Left = 0
          Top = 0
          Action = MainForm.FilePrintAction
        end
        object FilePrintPreviewToolButton: TToolButton
          Left = 23
          Top = 0
          Action = MainForm.FilePrintPreviewAction
        end
      end
    end
    object IndentToolbarPanel: TPanel
      Left = 463
      Top = 0
      Width = 60
      Height = 23
      Align = alLeft
      BevelOuter = bvNone
      ParentColor = True
      TabOrder = 6
      object Bevel8: TBevel
        AlignWithMargins = True
        Left = 52
        Top = 2
        Width = 3
        Height = 19
        Margins.Left = 6
        Margins.Top = 2
        Margins.Bottom = 2
        Align = alLeft
        Shape = bsLeftLine
      end
      object IncreaseToolBar: TBCToolBar
        Left = 0
        Top = 0
        Width = 46
        Height = 23
        Align = alLeft
        AutoSize = True
        Caption = 'BCToolBar2'
        TabOrder = 0
        object EditIncreaseIndentToolButton: TToolButton
          Left = 0
          Top = 0
          Action = MainForm.EditIncreaseIndentAction
        end
        object EditDecreaseIndentToolButton: TToolButton
          Left = 23
          Top = 0
          Action = MainForm.EditDecreaseIndentAction
        end
      end
    end
    object SortToolbarPanel: TPanel
      Left = 523
      Top = 0
      Width = 60
      Height = 23
      Align = alLeft
      BevelOuter = bvNone
      ParentColor = True
      TabOrder = 7
      object Bevel9: TBevel
        AlignWithMargins = True
        Left = 52
        Top = 2
        Width = 3
        Height = 19
        Margins.Left = 6
        Margins.Top = 2
        Margins.Bottom = 2
        Align = alLeft
        Shape = bsLeftLine
      end
      object SortToolBar: TBCToolBar
        Left = 0
        Top = 0
        Width = 46
        Height = 23
        Align = alLeft
        Caption = 'BCToolBar2'
        TabOrder = 0
        object EditSortAscToolButton: TToolButton
          Left = 0
          Top = 0
          Action = MainForm.EditSortAscAction
        end
        object EditSortDescToolButton: TToolButton
          Left = 23
          Top = 0
          Action = MainForm.EditSortDescAction
        end
      end
    end
    object CaseToolbarPanel: TPanel
      Left = 583
      Top = 0
      Width = 37
      Height = 23
      Align = alLeft
      BevelOuter = bvNone
      ParentColor = True
      TabOrder = 8
      object Bevel10: TBevel
        AlignWithMargins = True
        Left = 29
        Top = 2
        Width = 3
        Height = 19
        Margins.Left = 6
        Margins.Top = 2
        Margins.Bottom = 2
        Align = alLeft
        Shape = bsLeftLine
      end
      object CaseToolBar: TBCToolBar
        Left = 0
        Top = 0
        Width = 23
        Height = 23
        Align = alLeft
        Caption = 'BCToolBar2'
        TabOrder = 0
        object EditToggleCaseToolButton: TToolButton
          Left = 0
          Top = 0
          Action = MainForm.EditToggleCaseAction
        end
      end
    end
    object CommandToolbarPanel: TPanel
      Left = 620
      Top = 0
      Width = 60
      Height = 23
      Align = alLeft
      BevelOuter = bvNone
      DoubleBuffered = False
      ParentColor = True
      ParentDoubleBuffered = False
      TabOrder = 9
      object Bevel11: TBevel
        AlignWithMargins = True
        Left = 52
        Top = 2
        Width = 3
        Height = 19
        Margins.Left = 6
        Margins.Top = 2
        Margins.Bottom = 2
        Align = alLeft
        Shape = bsLeftLine
      end
      object CommandToolBar: TBCToolBar
        Left = 0
        Top = 0
        Width = 46
        Height = 23
        Align = alLeft
        AutoSize = True
        TabOrder = 0
        object EditUndoToolButton: TToolButton
          Left = 0
          Top = 0
          Action = MainForm.EditUndoAction
        end
        object EditRedoToolButton: TToolButton
          Left = 23
          Top = 0
          Action = MainForm.EditRedoAction
        end
      end
    end
    object SearchToolbarPanel: TPanel
      Left = 680
      Top = 0
      Width = 83
      Height = 23
      Align = alLeft
      BevelOuter = bvNone
      ParentColor = True
      TabOrder = 10
      object Bevel13: TBevel
        AlignWithMargins = True
        Left = 75
        Top = 2
        Width = 3
        Height = 19
        Margins.Left = 6
        Margins.Top = 2
        Margins.Bottom = 2
        Align = alLeft
        Shape = bsLeftLine
      end
      object SearchToolBar: TBCToolBar
        Left = 0
        Top = 0
        Width = 69
        Height = 23
        Align = alLeft
        Caption = 'BCToolBar2'
        TabOrder = 0
        object SearchToolButton: TToolButton
          Left = 0
          Top = 0
          Action = MainForm.SearchAction
        end
        object SearchReplaceToolButton: TToolButton
          Left = 23
          Top = 0
          Action = MainForm.SearchReplaceAction
        end
        object SearchFindInFilesToolButton: TToolButton
          Left = 46
          Top = 0
          Action = MainForm.SearchFindInFilesAction
        end
      end
    end
    object ModeToolbarPanel: TPanel
      Left = 763
      Top = 0
      Width = 106
      Height = 23
      Align = alLeft
      BevelOuter = bvNone
      ParentColor = True
      TabOrder = 11
      object Bevel14: TBevel
        AlignWithMargins = True
        Left = 98
        Top = 2
        Width = 3
        Height = 19
        Margins.Left = 6
        Margins.Top = 2
        Margins.Bottom = 2
        Align = alLeft
        Shape = bsLeftLine
      end
      object ViewToolBar: TBCToolBar
        Left = 0
        Top = 0
        Width = 92
        Height = 23
        Align = alLeft
        Caption = 'BCToolBar2'
        TabOrder = 0
        object ViewWordWrapToolButton: TToolButton
          Left = 0
          Top = 0
          Action = MainForm.ViewWordWrapAction
          Style = tbsCheck
        end
        object ViewLineNumbersToolButton: TToolButton
          Left = 23
          Top = 0
          Action = MainForm.ViewLineNumbersAction
          Style = tbsCheck
        end
        object ViewSpecialCharsToolButton: TToolButton
          Left = 46
          Top = 0
          Action = MainForm.ViewSpecialCharsAction
          Style = tbsCheck
        end
        object ViewSelectionModeToolButton: TToolButton
          Left = 69
          Top = 0
          Action = MainForm.ViewSelectionModeAction
          Style = tbsCheck
        end
      end
    end
    object ToolsToolBarPanel: TPanel
      Left = 869
      Top = 0
      Width = 23
      Height = 23
      Align = alLeft
      BevelOuter = bvNone
      ParentColor = True
      TabOrder = 12
      object CompareToolBar: TBCToolBar
        Left = 0
        Top = 0
        Width = 23
        Height = 23
        Align = alLeft
        Caption = 'BCToolBar2'
        TabOrder = 0
        object ToolsCompareFilesToolButton: TToolButton
          Left = 0
          Top = 0
          Action = MainForm.ToolsSelectForCompareAction
        end
      end
    end
  end
  object GotoLinePanel: TPanel
    Left = 0
    Top = 53
    Width = 451
    Height = 25
    Align = alBottom
    BevelOuter = bvNone
    Color = clWindow
    FullRepaint = False
    Padding.Top = 2
    ParentBackground = False
    TabOrder = 4
    Visible = False
    object GotoLineClosePanel: TPanel
      Left = 0
      Top = 2
      Width = 21
      Height = 23
      Align = alLeft
      AutoSize = True
      BevelOuter = bvNone
      Padding.Right = 2
      Padding.Bottom = 2
      TabOrder = 0
      object GotoLineCloseSpeedButton: TSpeedButton
        Left = 0
        Top = 0
        Width = 19
        Height = 21
        Action = GotoLineCloseAction
        Align = alLeft
        Flat = True
        Glyph.Data = {
          36060000424D3606000000000000360000002800000020000000100000000100
          18000000000000060000120B0000120B00000000000000000000FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FF717171717171FF00FFFF00FFFF00FF717171717171FF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF717171717171FF00FFFF
          00FFFF00FF717171717171FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FF717171DBDBDBDBDBDB717171FF00FF717171DBDBDBDBDBDB717171FF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF717171FFFFFFFFFFFF717171FF
          00FF717171FFFFFFFFFFFF717171FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FF717171DBDBDBDBDBDBDBDBDB717171DBDBDBDBDBDBDBDBDB717171FF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF717171FFFFFFFFFFFFFFFFFF71
          7171FFFFFFFFFFFFFFFFFF717171FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FF717171DBDBDBDBDBDBDBDBDBDBDBDBDBDBDB787878FF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF717171FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF787878FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FF717171DBDBDBDBDBDBDBDBDB717171FF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF717171FFFFFFFF
          FFFFFFFFFF717171FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FF717171DBDBDBDBDBDBDBDBDBDBDBDBDBDBDB717171FF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF717171FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFF717171FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FF717171DBDBDBDBDBDBDBDBDB717171DBDBDBDBDBDBDBDBDB717171FF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF717171FFFFFFFFFFFFFFFFFF71
          7171FFFFFFFFFFFFFFFFFF717171FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FF717171DBDBDBDBDBDB717171FF00FF717171DBDBDBDBDBDB717171FF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF717171FFFFFFFFFFFF717171FF
          00FF717171FFFFFFFFFFFF717171FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FF717171717171FF00FFFF00FFFF00FF717171717171FF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF717171717171FF00FFFF
          00FFFF00FF717171717171FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
        Margin = 2
        NumGlyphs = 2
      end
    end
    object GotoLineLabelPanel: TPanel
      Left = 21
      Top = 2
      Width = 58
      Height = 23
      Align = alLeft
      AutoSize = True
      BevelOuter = bvNone
      Padding.Left = 4
      Padding.Top = 3
      Padding.Right = 6
      TabOrder = 1
      object GotoLineLabel: TLabel
        Left = 4
        Top = 3
        Width = 48
        Height = 20
        Align = alLeft
        Caption = 'Go to Line'
        ExplicitHeight = 13
      end
    end
    object LineNumberPanel: TPanel
      Left = 79
      Top = 2
      Width = 100
      Height = 23
      Align = alLeft
      BevelOuter = bvNone
      Caption = 'SearchPanel3'
      Padding.Left = 4
      TabOrder = 2
      object GotoLineNumberEdit: TBCButtonedEdit
        Left = 4
        Top = 0
        Width = 96
        Height = 21
        Align = alTop
        Images = ImageList16
        RightButton.HotImageIndex = 3
        RightButton.ImageIndex = 2
        RightButton.PressedImageIndex = 4
        TabOrder = 0
        OnChange = GotoLineNumberEditChange
        OnKeyPress = GotoLineNumberEditKeyPress
        OnRightButtonClick = GotoLineClearActionExecute
      end
    end
    object GotoLineButtonPanel: TPanel
      Left = 179
      Top = 2
      Width = 23
      Height = 23
      Align = alLeft
      AutoSize = True
      BevelOuter = bvNone
      Padding.Left = 2
      Padding.Right = 2
      Padding.Bottom = 2
      TabOrder = 3
      object GotoLineGoSpeedButton: TSpeedButton
        Left = 2
        Top = 0
        Width = 19
        Height = 21
        Action = GotoLineAction
        Align = alLeft
        Flat = True
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA591808E70558D
          6E538D6E538D6E538D6E538D6E538D6E538D6E538E7156977C63FF00FFFF00FF
          FF00FFFF00FFFF00FF8C6C50FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFF8F7156B6B7B6B1B3B2B0B1B0B0B2B2B2B6B6886648FFFFFF84
          85867D7E7E9C9C9D7F80807F80809B9B9C78797AFFFFFF8D6E53B0B0AEFFFFFF
          FFFFFFFFFFFFFFFFFF846244FFFFFF868787626262FFFFFF646464646464FFFF
          FF5A5B5BFFFFFF8D6E53AEAEABFFFFFFFCFCFCFDFDFDFFFFFF836143FFFFFF64
          65667B7B7B9998987B7B7C7B7B7C979696747576FFFFFF8D6E52ADADABFFFFFF
          F8F7F7FAF9F9FFFFFF826142FFFFFFF2F4F7FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFF8D6E53ADADABFFFFFFF5F4F4F6F5F5FAFBFCB09D8A83624384
          634584624484624485634588674A8B6C4F8C6D528D6F54C0B0A2ADADABFFFFFF
          F2F1F1F2F1F1F4F4F4F7F8F9F6F7F9F7F8FAF6F7FAF6F7FAFFFFFFB3B7B8FF00
          FFFF00FFFF00FFFF00FFADADABFFFFFFEFEDEEEFEEEEEFEEEEEFEFEFEFEFEFEF
          EFEFEFEFEFF0EFF0FFFFFFAFB2B3FF00FFFF00FFAC6E31FF00FFADADABFFFFFF
          EBEAEAECEBEBECEBEBEBE9E9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFADB2B5FF00
          FFAC6E31AC6E31FF00FFADADABFFFFFFE8E7E7E9E8E8E9E8E8E7E6E6FFFFFFCB
          CBCAA6A6A4A5A5A2FFFFFFAEB4B8B97731BC7E3DAC6E31FF00FFAEAEABFFFFFF
          E4E3E3E5E4E4E5E4E4E4E3E3FFFFFFA6A6A4FBFBFAFFFFFFE9E9EBCCD1D3FF00
          FFCB8D46AC6E31FF00FFAEAEACFFFFFFE0DFDEE1DFDEE1DFDEE0DFDDFFFFFFA5
          A5A3FFFFFFE8E8E9CCCDCDFF00FFFF00FFFF00FFAC6E31FF00FFAFAFADFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE9EAEBBCBDBDFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFB8B8B6B0B0ADAEAEACAEAEABAEAEABADAEABAEAEABAF
          AFAEBCBEBEFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
        Margin = 2
      end
    end
  end
  object SynEditPrint: TSynEditPrint
    Copies = 1
    Header.ShadedColor = clNone
    Header.DefaultFont.Charset = DEFAULT_CHARSET
    Header.DefaultFont.Color = clBlack
    Header.DefaultFont.Height = -13
    Header.DefaultFont.Name = 'Arial'
    Header.DefaultFont.Style = []
    Footer.ShadedColor = clNone
    Footer.DefaultFont.Charset = DEFAULT_CHARSET
    Footer.DefaultFont.Color = clBlack
    Footer.DefaultFont.Height = -13
    Footer.DefaultFont.Name = 'Arial'
    Footer.DefaultFont.Style = []
    Margins.Left = 25.000000000000000000
    Margins.Right = 15.000000000000000000
    Margins.Top = 18.000000000000000000
    Margins.Bottom = 18.000000000000000000
    Margins.Header = 15.000000000000000000
    Margins.Footer = 15.000000000000000000
    Margins.LeftHFTextIndent = 2.000000000000000000
    Margins.RightHFTextIndent = 2.000000000000000000
    Margins.HFInternalMargin = 0.500000000000000000
    Margins.MirrorMargins = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Highlight = False
    Colors = True
    TabWidth = 8
    Color = clWhite
    Left = 84
    Top = 63
  end
  object SynEditSearch: TSynEditSearch
    Left = 154
    Top = 62
  end
  object ActionList: TActionList
    Left = 168
    Top = 94
    object SearchCloseAction: TAction
      Category = 'Search'
      Hint = 'Close Search'
      OnExecute = SearchCloseActionExecute
    end
    object SearchFindNextAction: TAction
      Category = 'Search'
      Enabled = False
      Hint = 'Find the next matching text'
      ShortCut = 114
      OnExecute = SearchFindNextActionExecute
    end
    object SearchFindPreviousAction: TAction
      Category = 'Search'
      Enabled = False
      Hint = 'Find the previous matching text'
      ShortCut = 8306
      OnExecute = SearchFindPreviousActionExecute
    end
    object GotoLineAction: TAction
      Category = 'GotoLine'
      Hint = 'Go to line'
      OnExecute = GotoLineActionExecute
    end
    object GotoLineCloseAction: TAction
      Category = 'GotoLine'
      Hint = 'Close'
      OnExecute = GotoLineCloseActionExecute
    end
    object SearchClearAction: TAction
      Category = 'Search'
      OnExecute = SearchClearActionExecute
    end
    object GotoLineClearAction: TAction
      Category = 'GotoLine'
      OnExecute = GotoLineClearActionExecute
    end
    object BoxDownAction: TAction
      Category = 'BoxSelection'
      Caption = 'BoxDownAction'
      ShortCut = 41000
      OnExecute = BoxDownActionExecute
    end
    object BoxLeftAction: TAction
      Category = 'BoxSelection'
      Caption = 'BoxLeftAction'
      ShortCut = 40997
      OnExecute = BoxLeftActionExecute
    end
    object BoxRightAction: TAction
      Category = 'BoxSelection'
      Caption = 'BoxRightAction'
      ShortCut = 40999
      OnExecute = BoxRightActionExecute
    end
    object BoxUpAction: TAction
      Category = 'BoxSelection'
      Caption = 'BoxUpAction'
      ShortCut = 40998
      OnExecute = BoxUpActionExecute
    end
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
    PLSQLAttri.Foreground = clBlue
    PLSQLAttri.Style = []
    SQLPlusAttri.Foreground = clBlue
    SQLPlusAttri.Style = []
    StringAttri.Foreground = clPurple
    TableNameAttri.Foreground = clOlive
    VariableAttri.Foreground = clNavy
    SQLDialect = sqlOracle
    Left = 246
    Top = 64
  end
  object OraScript: TOraScript
    OnError = OraScriptError
    DataSet = ScriptQuery
    Left = 86
    Top = 168
  end
  object EditorPopupActionBar: TPopupActionBar
    Left = 166
    Top = 230
    object CutMenuItem: TMenuItem
      Action = MainForm.EditCutAction
    end
    object CopyMenuItem: TMenuItem
      Action = MainForm.EditCopyAction
    end
    object PasteMenuItem: TMenuItem
      Action = MainForm.EditPasteAction
    end
    object SelectAllMenuItem: TMenuItem
      Action = MainForm.EditSelectAllAction
    end
    object Separator1MenuItem: TMenuItem
      Caption = '-'
    end
    object UndoMenuItem: TMenuItem
      Action = MainForm.EditUndoAction
    end
    object RedoMenuItem: TMenuItem
      Action = MainForm.EditRedoAction
    end
    object Separator2MenuItem: TMenuItem
      Caption = '-'
    end
    object ToggleBookmarkMenuItem: TMenuItem
      Action = MainForm.SearchToggleBookmarkAction
    end
    object ToggleBookmarksMenuItem: TMenuItem
      Caption = 'Toggle Boo&kmarks'
      SubMenuImages = BookmarkImagesList
      object ToggleBookmark1MenuItem: TMenuItem
        Tag = 1
        Caption = 'Bookmark &1'
        ImageIndex = 62
        ShortCut = 24625
      end
      object ToggleBookmark2MenuItem: TMenuItem
        Tag = 2
        Caption = 'Bookmark &2'
        ImageIndex = 63
        ShortCut = 24626
      end
      object ToggleBookmark3MenuItem: TMenuItem
        Tag = 3
        Caption = 'Bookmark &3'
        ImageIndex = 64
        ShortCut = 24627
      end
      object ToggleBookmark4MenuItem: TMenuItem
        Tag = 4
        Caption = 'Bookmark &4'
        ImageIndex = 65
        ShortCut = 24628
      end
      object ToggleBookmark5MenuItem: TMenuItem
        Tag = 5
        Caption = 'Bookmark &5'
        ImageIndex = 66
        ShortCut = 24629
      end
      object ToggleBookmark6MenuItem: TMenuItem
        Tag = 6
        Caption = 'Bookmark &6'
        ImageIndex = 67
        ShortCut = 24630
      end
      object ToggleBookmark7MenuItem: TMenuItem
        Tag = 7
        Caption = 'Bookmark &7'
        ImageIndex = 68
        ShortCut = 24631
      end
      object ToggleBookmark8MenuItem: TMenuItem
        Tag = 8
        Caption = 'Bookmark &8'
        ImageIndex = 69
        ShortCut = 24632
      end
      object ToggleBookmark9MenuItem: TMenuItem
        Tag = 9
        Caption = 'Bookmark &9'
        ImageIndex = 70
        ShortCut = 24633
      end
    end
    object GotoBookmarksMenuItem: TMenuItem
      Caption = '&Goto Bookmarks'
      SubMenuImages = BookmarkImagesList
      object GotoBookmark1MenuItem: TMenuItem
        Tag = 1
        Caption = 'Bookmark &1'
        ImageIndex = 62
        ShortCut = 16433
      end
      object GotoBookmark2MenuItem: TMenuItem
        Tag = 2
        Caption = 'Bookmark &2'
        ImageIndex = 63
        ShortCut = 16434
      end
      object GotoBookmark3MenuItem: TMenuItem
        Tag = 3
        Caption = 'Bookmark &3'
        ImageIndex = 64
        ShortCut = 16435
      end
      object GotoBookmark4MenuItem: TMenuItem
        Tag = 4
        Caption = 'Bookmark &4'
        ImageIndex = 65
        ShortCut = 16436
      end
      object GotoBookmark5MenuItem: TMenuItem
        Tag = 5
        Caption = 'Bookmark &5'
        ImageIndex = 66
        ShortCut = 16437
      end
      object GotoBookmark6MenuItem: TMenuItem
        Tag = 6
        Caption = 'Bookmark &6'
        ImageIndex = 67
        ShortCut = 16438
      end
      object GotoBookmark7MenuItem: TMenuItem
        Tag = 7
        Caption = 'Bookmark &7'
        ImageIndex = 68
        ShortCut = 16439
      end
      object GotoBookmark8MenuItem: TMenuItem
        Tag = 8
        Caption = 'Bookmark &8'
        ImageIndex = 69
        ShortCut = 16440
      end
      object GotoBookmark9MenuItem: TMenuItem
        Tag = 9
        Caption = 'Bookmark &9'
        ImageIndex = 70
        ShortCut = 16441
      end
    end
    object ClearBookmarksMenuItem: TMenuItem
      Action = MainForm.SearchClearBookmarksAction
    end
    object Separator3MenuItem: TMenuItem
      Caption = '-'
    end
    object IncreaseIndentMenuItem: TMenuItem
      Action = MainForm.EditIncreaseIndentAction
    end
    object DecreaseIndentMenuItem: TMenuItem
      Action = MainForm.EditDecreaseIndentAction
    end
    object Separator4MenuItem: TMenuItem
      Caption = '-'
    end
    object SortAscendingMenuItem: TMenuItem
      Action = MainForm.EditSortAscAction
    end
    object SortDescendingMenuItem: TMenuItem
      Action = MainForm.EditSortDescAction
    end
    object Separator5MenuItem: TMenuItem
      Caption = '-'
    end
    object ToggleCaseMenuItem: TMenuItem
      Action = MainForm.EditToggleCaseAction
    end
    object Separator6MenuItem: TMenuItem
      Caption = '-'
    end
    object InsertObjectMenuItem: TMenuItem
    end
    object Separator7MenuItem: TMenuItem
      Caption = '-'
    end
    object FormatSQLMenuItem: TMenuItem
    end
  end
  object ColumnsQuery: TOraQuery
    SQL.Strings = (
      
        'SELECT   LOWER(s.column_name) column_name, LOWER(s.column_name) ' +
        '|| '#39': '#39' || RPAD (   s.data_type'
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
      '              ) item'
      '    FROM all_tab_columns c, all_tab_columns s'
      '   WHERE  c.table_name = s.table_name'
      '     AND c.column_name = s.column_name'
      '     AND s.table_name = :p_object_name'
      '     AND c.owner = :p_owner'
      '     AND s.owner = :p_owner'
      'ORDER BY s.column_id')
    FetchAll = True
    ReadOnly = True
    AutoCommit = False
    Left = 84
    Top = 224
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
  object SQLStringHolder: TJvMultiStringHolder
    MultipleStrings = <
      item
        Name = 'ExplainPlanSQL'
        Strings.Strings = (
          'SELECT     SUBSTR (   LPAD ('#39'  '#39', LEVEL - 1)'
          '                   || operation'
          
            '                   || DECODE (options, '#39#39', '#39#39', '#39' ('#39' || options |' +
            '| '#39')'#39'),'
          '                   1,'
          '                   30'
          '                  ) "Operation",'
          '           object_name "Object"'
          '      FROM plan_table'
          'START WITH ID = 0'
          'CONNECT BY PRIOR ID = parent_id')
      end
      item
        Name = 'ColumnsSQL'
        Strings.Strings = (
          'SELECT   s.column_id, RPAD (s.column_name, 30) column_name,'
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
            'ta_precision) || '#39')'#39
          '                                           )'
          '                         ),'
          '               14'
          '              ) data_type,'
          
            '         RPAD(co.pk, 1) primary_key, DECODE (s.nullable, '#39'Y'#39', '#39'N' +
            'ull'#39', '#39'Not null'#39') nullable, s.data_default,'
          '         c.comments'
          '    FROM all_col_comments c,'
          '         all_tab_columns s,'
          '         (SELECT b.position pk, b.column_name'
          '            FROM all_constraints a, all_cons_columns b'
          '           WHERE a.owner = '#39'%s'#39
          '             AND a.table_name = '#39'%s'#39
          '             AND a.constraint_name = b.constraint_name'
          '             AND a.constraint_type = '#39'P'#39') co'
          '   WHERE c.table_name = s.table_name'
          '     AND c.column_name = s.column_name'
          '     AND s.owner = '#39'%s'#39
          '     AND s.table_name = '#39'%s'#39
          '     AND co.column_name(+) = c.column_name'
          'ORDER BY s.column_id')
      end>
    Left = 268
    Top = 174
  end
  object ScriptQuery: TOraQuery
    Left = 166
    Top = 172
  end
  object ErrorsQuery: TOraQuery
    SQL.Strings = (
      'SELECT line, position, text '
      '    FROM user_errors '
      '   WHERE name = :p_name'
      'ORDER BY sequence')
    FetchAll = True
    ReadOnly = True
    AutoCommit = False
    Left = 16
    Top = 216
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'p_name'
        Value = nil
      end>
  end
  object ImageList16: TImageList
    ShareImages = True
    Left = 378
    Top = 106
    Bitmap = {
      494C0101050009001C0010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000002000000001002000000000000020
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
      0000000000007171710071717100000000000000000000000000717171007171
      7100000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000071717100FFFFFF00FFFFFF00717171000000000071717100FFFFFF00FFFF
      FF00717171000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000071717100FFFFFF00FFFFFF00FFFFFF0071717100FFFFFF00FFFFFF00FFFF
      FF00717171000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000071717100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF007878
      7800000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000071717100FFFFFF00FFFFFF00FFFFFF00717171000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000071717100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF007171
      7100000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000071717100FFFFFF00FFFFFF00FFFFFF0071717100FFFFFF00FFFFFF00FFFF
      FF00717171000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000071717100FFFFFF00FFFFFF00717171000000000071717100FFFFFF00FFFF
      FF00717171000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000007171710071717100000000000000000000000000717171007171
      7100000000000000000000000000000000000000000000000000000000000000
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
      00000000000000000000000000000000000000000000AEAEAB00AEAEAB00AEAE
      AB00AEAEAB00AEAEAB00AEAEAB00AEAEAB00AEAEAB00AEAEAB00AEAEAB00AEAE
      AB00AEAEAB00AEAEAB0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BEBEBD00AFAFAD00ADADAB00ADAD
      AB00ADADAB00ADADAB00AFAFAD00B4B4B300B8B8B600AFAFAD00ADADAB00ADAD
      AB00ADADAB00ADADAB00AFAFAD00BFBFBE0000000000AEAEAB00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00AEAEAB0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000AFAFAD00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00AFAFAD00AFAFAD00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00AFAFAD0000000000AEAEAB00FFFFFF00FDFD
      FD00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFCFC00FDFD
      FD00FFFFFF00AEAEAB0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000AEAEAB00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00ACACAA00ACACAA00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00AEAEAB0000000000AEAEAB00FFFFFF00FAF9
      F900F9F8F800F9F8F800F9F8F800F9F8F800F9F8F800F9F8F800F9F8F800FAF9
      F900FFFFFF00AEAEAB0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000ADADAB00FFFFFF00FBFBFB00FAFA
      FA00FAFAFA00FBFBFB00FFFFFF00ACACAA00ACACAA00FFFFFF00FBFBFB00FAFA
      FA00FAFAFA00FBFBFB00FFFFFF00ADADAB0000000000AEAEAB00FFFFFF00F6F6
      F600F6F6F600F6F6F600F6F6F600F6F6F600F6F6F600F6F6F600F6F6F600F6F6
      F600FFFFFF00AEAEAB0000000000000000000000000000000000000000000000
      0000717171007171710000000000000000000000000071717100717171000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000717171007171710000000000000000000000000071717100717171000000
      000000000000000000000000000000000000ADADAB00FFFFFF00F8F7F700F8F7
      F700F8F7F700F8F7F700FFFFFF00ACACAA00ACACAA00FFFFFF00F8F7F700F8F7
      F700F8F7F700F8F7F700FFFFFF00ADADAB0000000000AEAEAB00FFFFFF00F4F4
      F300F4F4F300F4F4F300F4F4F300F4F4F300F4F4F300F4F4F300F4F4F300F4F4
      F300FFFFFF00AEAEAB0000000000000000000000000000000000000000007171
      7100DBDBDB00DBDBDB00717171000000000071717100DBDBDB00DBDBDB007171
      7100000000000000000000000000000000000000000000000000000000007171
      7100FFFFFF00FFFFFF00717171000000000071717100FFFFFF00FFFFFF007171
      710000000000000000000000000000000000ADADAB00FFFFFF00F5F4F400F5F4
      F400F5F4F400F5F4F400FFFFFF00ACACAA00ACACAA00FFFFFF00F5F4F400F5F4
      F400F5F4F400F5F4F400FFFFFF00ADADAB0000000000AEAEAB00FFFFFF00F2F1
      F000F2F1F000F2F1F000F2F1F000F2F1F000F2F1F000F2F1F000F2F1F000F2F1
      F000FFFFFF00AEAEAB0000000000000000000000000000000000000000007171
      7100DBDBDB00DBDBDB00DBDBDB0071717100DBDBDB00DBDBDB00DBDBDB007171
      7100000000000000000000000000000000000000000000000000000000007171
      7100FFFFFF00FFFFFF00FFFFFF0071717100FFFFFF00FFFFFF00FFFFFF007171
      710000000000000000000000000000000000ADADAB00FFFFFF00F2F0F100F2F1
      F100F2F1F100F2F1F100FFFFFF00ACACAA00ACACAA00FFFFFF00F2F1F100F2F1
      F100F2F1F100F2F0F100FFFFFF00ADADAB0000000000AEAEAB00FFFFFF00EFEF
      EE00EFEFEE00EFEFEE00EFEFEE00EFEFEE00EFEFEE00EFEFEE00EEEEED00EEEF
      EE00FFFFFF00AEAEAB0000000000000000000000000000000000000000000000
      000071717100DBDBDB00DBDBDB00DBDBDB00DBDBDB00DBDBDB00787878000000
      0000000000000000000000000000000000000000000000000000000000000000
      000071717100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00787878000000
      000000000000000000000000000000000000ADADAB00FFFFFF00EEECED00EEEC
      ED00EDECEC00EEECED00FFFFFF00ACACAA00ACACAA00FFFFFF00EEECED00EDEC
      EC00EEECED00EEECED00FFFFFF00ADADAB0000000000AEAEAB00FFFFFF00EDEB
      EA00EDECEB00EDECEB00EDECEB00EDECEB00ECEBEA00ECEBE900EBEAE900ECEA
      E900FFFFFF00AEAEAB0000000000000000000000000000000000000000000000
      00000000000071717100DBDBDB00DBDBDB00DBDBDB0071717100000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000071717100FFFFFF00FFFFFF00FFFFFF0071717100000000000000
      000000000000000000000000000000000000AEAEAB00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00F3F3F300FFFFFF00ACACAA00ACACAA00FFFFFF00F4F4F400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00AEAEAB0000000000AEAEAB00FFFFFF00E9E9
      E800EAEAE900EAEAE900EAEAE900E9E9E800F4F4F200FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00AEAEAB0000000000000000000000000000000000000000000000
      000071717100DBDBDB00DBDBDB00DBDBDB00DBDBDB00DBDBDB00717171000000
      0000000000000000000000000000000000000000000000000000000000000000
      000071717100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00717171000000
      000000000000000000000000000000000000AFAFAD00FFFFFF00A5A5A300A7A7
      A500CBCBCA00FFFFFF00FFFFFF00ACACAA00ACACAA00FFFFFF00FFFEFE00CBCB
      CA00A7A7A400A5A5A300FFFFFF00AFAFAD0000000000AEAEAB00FFFFFF00E7E6
      E500E8E7E600E8E7E600E8E7E600E6E5E400FFFFFF00CBCCCB00A5A5A300A5A5
      A300FFFFFF00AEAEAB0000000000000000000000000000000000000000007171
      7100DBDBDB00DBDBDB00DBDBDB0071717100DBDBDB00DBDBDB00DBDBDB007171
      7100000000000000000000000000000000000000000000000000000000007171
      7100FFFFFF00FFFFFF00FFFFFF0071717100FFFFFF00FFFFFF00FFFFFF007171
      710000000000000000000000000000000000CACAC900E9E9E900FFFFFF00E3E2
      E100A7A7A400FFFFFF00FFFFFF00ACACAA00ACACAA00FFFFFF00FFFFFE00A7A7
      A500EBEBEA00FFFFFF00E9E9E900CACAC80000000000AEAEAB00FFFFFF00E3E3
      E200E4E4E300E4E5E400E4E4E300E3E3E200FFFFFF00A5A5A300EBEBEA00FFFF
      FF00EAEAEA00AEAEAB0000000000000000000000000000000000000000007171
      7100DBDBDB00DBDBDB00717171000000000071717100DBDBDB00DBDBDB007171
      7100000000000000000000000000000000000000000000000000000000007171
      7100FFFFFF00FFFFFF00717171000000000071717100FFFFFF00FFFFFF007171
      71000000000000000000000000000000000000000000B7B7B500E8E8E800FFFF
      FF00A5A5A300FFFFFF00FFFFFF00ACACAA00ADADAA00FFFFFF00FDFDFE00A5A5
      A300FFFFFF00E8E8E800CBCBC9000000000000000000AEAEAB00FFFFFF00E0DF
      DD00E0DFDE00E0DFDE00E0DFDE00DFDEDC00FFFFFF00A5A5A300FFFFFF00E9E9
      E900AEAEAB000000000000000000000000000000000000000000000000000000
      0000717171007171710000000000000000000000000071717100717171000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000717171007171710000000000000000000000000071717100717171000000
      0000000000000000000000000000000000000000000000000000B8B8B500E9E9
      E900FFFFFF00FFFFFF00FFFFFF00AFAFAD00AFAFAD00FFFFFF00FFFFFF00FFFF
      FF00E9E9E900BDBDBC00000000000000000000000000AEAEAB00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EAEAEA00AEAE
      AB00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000B7B7
      B500AFAFAD00AEAEAC00AFAFAD00BCBCBA00C9C9C700AFAFAD00AEAEAC00AFAF
      AD00B7B7B50000000000000000000000000000000000B3B3B100AEAEAB00AEAE
      AB00AEAEAB00AEAEAB00AEAEAB00AEAEAB00AEAEAB00AEAEAB00AEAEAB000000
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
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000200000000100010000000000000100000000000000000000
      000000000000000000000000FFFFFF00FFFF000000000000FFFF000000000000
      FFFF000000000000F9CF000000000000F087000000000000F007000000000000
      F80F000000000000FC1F000000000000F80F000000000000F007000000000000
      F087000000000000F9CF000000000000FFFF000000000000FFFF000000000000
      FFFF000000000000FFFF000000000000FFFF8003FFFFFFFF00008003FFFFFFFF
      00008003FFFFFFFF00008003FFFFFFFF00008003F39FF39F00008003E10FE10F
      00008003E00FE00F00008003F01FF01F00008003F83FF83F00008003F01FF01F
      00008003E00FE00F00008003E10FE10F80018007F39FF39FC003800FFFFFFFFF
      E007801FFFFFFFFFFFFFFFFFFFFFFFFF00000000000000000000000000000000
      000000000000}
  end
  object BookmarkImagesList: TBCImageList
    ShareImages = True
    Left = 270
    Top = 230
    Bitmap = {
      494C01010A000D001C0010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000003000000001002000000000000030
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000BA8F6000B8895600B88A
      5700B8895500B5855000B4834C00B4834C00B4834C00B4834C00B4834C00B483
      4C00B4834C00B4834C00B5855000BA805D0000000000BA8F6000B8895600B88A
      5700B8895500B5855000B4834C00B4834C00B4834C00B4834C00B4834C00B483
      4C00B4834C00B4834C00B5855000BA805D000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000BA885100FFDFAA00BC8D
      5800B5844F00EAB46400E4A85300E4A85400E4A85400E4A85400E4A85400E4A8
      5400E4A85400E4A85300EAB46400B585500000000000BA885100FFDFAA00BC8D
      5800B5844F00EAB46400E4A85300E4A85400E4A85400E4A85400E4A85400E4A8
      5400E4A85400E4A85300EAB46400B58550000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000888E9700C3CAD40057616E00C697
      5E00B4824B00EAB76C00E3A85200E3A85400F8E8D100FFFFFF00FFFFFF00FDF9
      F400E9B97600E3A85200EBB86C00B4834C00888E9700C3CAD40057616E00C697
      5E00B4824B00EAB76C00E3A85200E3A85400F8E8D100FFFFFF00FFFFFF00F6E2
      C600E3A85400E3A85200EBB86C00B4834C000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000BC895100AA7A3F00CB9F
      6500B2814B00EDBC7400E3A75200F6E2C600FFFFFF00F8E8D100F0D1A400FFFF
      FF00FDF9F400E3A75200EDBC7500B4834C0000000000BC895100AA7A3F00CB9F
      6500B2814B00EDBC7400E3A75200F0D1A300FFFFFF00FFFFFF00F9EEDD00FFFF
      FF00F4DCBA00E3A75200EDBC7500B4834C000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000BA885000FFDFA400D0A5
      6800B2804A00EEC07D00E3A85200FDF9F400FFFFFF00E3A95500E3A95500FDF9
      F400FFFFFF00E3A85200EEC17E00B4834C0000000000BA885000FFDFA400D0A5
      6800B2804A00EEC07D00E3A85200E9B97600F6E2C600E9BA7700E3A95500FFFF
      FF00FFFFFF00E3A85200EEC17E00B4834C000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000888E9700C3CAD400555F6D00D9AE
      6F00B2804A00EFC78A00E4AA5600F6E3C700FFFFFF00F1D2A500E8B66D00FFFF
      FF00FDF9F400E4AA5600F0C88B00B4834C00888E9700C3CAD400555F6D00D9AE
      6F00B2804A00EFC78A00E4AA5600E4AB5700F1D2A500FDF9F400FAEEDD00FDF9
      F400FFFFFF00E4AA5600F0C88B00B4834C000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000BC885100A67B3A00DEB5
      7600B17F4900F1CD9700E3AC5700E3AC5700F9EEDD00FFFFFF00FFFFFF00FFFF
      FF00E7B76D00E3AC5700F2CD9700B4834C0000000000BC885100A67B3A00DEB5
      7600B17F4900F1CD9700E3AC5700F0D3A500FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00E3AC5700F2CD9700B4834C000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000BA875000FFE09F00E3BB
      7A00B17E4900F3D3A100E3AD5900F0D3A600FFFFFF00F9EFDE00F4DEBD00FFFF
      FF00F6E4C800E3AD5900F4D4A300B4834C0000000000BA875000FFE09F00E3BB
      7A00B17E4900F3D3A100E3AD5900FDFAF400FFFFFF00E7B86F00E3AD5900FFFF
      FF00FFFFFF00E3AD5900F4D4A300B4834C000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000888E9700C3CAD400545E6D00EBC4
      7F00B17E4900F4D9AD00E3B15E00F6E5C900FFFFFF00F0D5A900E3B15E00FFFF
      FF00FDFAF400E3B15E00F5DAAE00B4834C00888E9700C3CAD400545E6D00EBC4
      7F00B17E4900F4D9AD00E3B15E00FDFAF400FFFFFF00E7BB7300E3B15E00FFFF
      FF00FDFAF400E3B15E00F5DAAE00B4834C000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000BC895100A47C3600ECC5
      8100B07E4900F5DEB600E4B26100F1D6AB00FFFFFF00FFFFFF00FBF5EA00FFFF
      FF00F6E5CA00E4B26100F6DFB800B4824C0000000000BC895100A47C3600ECC5
      8100B07E4900F5DEB600E4B26100F1D6AB00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00F1D6AB00E4B26100F6DFB800B4824C000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000BA875000F9D18B00EBC4
      7F00B07D4800F8E3C000E5B56500E5B56500F1D8AD00FCF5EA00FDFAF500F5E1
      C100E5B56500E5B56500F8E5C200B4824C0000000000BA875000F9D18B00EBC4
      7F00B07D4800F8E3C000E5B56500E5B56500F1D8AD00FDFAF500FDFAF500F1D8
      AD00E5B56500E5B56500F8E5C200B4824C000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000888D9700C1C8D200525A6700EBC3
      7B00B07D4600F9EACB00E6BB6F00E4B96B00E4B86800E4B76800E4B86800E4B8
      6800E4B96B00E6BB6F00FAECCD00B4834C00888D9700C1C8D200525A6700EBC3
      7B00B07D4600F9EACB00E6BB6F00E4B96B00E4B86800E4B76800E4B86800E4B8
      6800E4B96B00E6BB6F00FAECCD00B4834C000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000BA864E00FFF2D400FEF1
      D400B27F4900FEF1D700FCEED300FBEDD200FBEDD200FBEDD200FBEDD200FBED
      D200FBEDD200FCEED300FFF2D800B5844F0000000000BA864E00FFF2D400FEF1
      D400B27F4900FEF1D700FCEED300FBEDD200FBEDD200FBEDD200FBEDD200FBED
      D200FBEDD200FCEED300FFF2D800B5844F000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C49C7100B7875200B686
      5200B7875200B5844E00B4824C00B4824B00B4824B00B4824B00B4824B00B482
      4B00B4824B00B4824C00B5844F00BC80600000000000C49C7100B7875200B686
      5200B7875200B5844E00B4824C00B4824B00B4824B00B4824B00B4824B00B482
      4B00B4824B00B4824C00B5844F00BC8060000000000000000000000000000000
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
      00000000000000000000000000000000000000000000BA8F6000B8895600B88A
      5700B8895500B5855000B4834C00B4834C00B4834C00B4834C00B4834C00B483
      4C00B4834C00B4834C00B5855000BA805D0000000000BA8F6000B8895600B88A
      5700B8895500B5855000B4834C00B4834C00B4834C00B4834C00B4834C00B483
      4C00B4834C00B4834C00B5855000BA805D0000000000BA8F6000B8895600B88A
      5700B8895500B5855000B4834C00B4834C00B4834C00B4834C00B4834C00B483
      4C00B4834C00B4834C00B5855000BA805D0000000000BA8F6000B8895600B88A
      5700B8895500B5855000B4834C00B4834C00B4834C00B4834C00B4834C00B483
      4C00B4834C00B4834C00B5855000BA805D0000000000BA885100FFDFAA00BC8D
      5800B5844F00EAB46400E4A85300E4A85400E4A85400E4A85400E4A85400E4A8
      5400E4A85400E4A85300EAB46400B585500000000000BA885100FFDFAA00BC8D
      5800B5844F00EAB46400E4A85300E4A85400E4A85400E4A85400E4A85400E4A8
      5400E4A85400E4A85300EAB46400B585500000000000BA885100FFDFAA00BC8D
      5800B5844F00EAB46400E4A85300E4A85400E4A85400E4A85400E4A85400E4A8
      5400E4A85400E4A85300EAB46400B585500000000000BA885100FFDFAA00BC8D
      5800B5844F00EAB46400E4A85300E4A85400E4A85400E4A85400E4A85400E4A8
      5400E4A85400E4A85300EAB46400B5855000888E9700C3CAD40057616E00C697
      5E00B4824B00EAB76C00E3A85200E3A85400E3A85400E3A85400F6E2C600FFFF
      FF00F0D1A400E3A85200EBB86C00B4834C00888E9700C3CAD40057616E00C697
      5E00B4824B00EAB76C00E3A85200E3A85400F8E8D100FFFFFF00FFFFFF00F9EE
      DD00E7B46B00E3A85200EBB86C00B4834C00888E9700C3CAD40057616E00C697
      5E00B4824B00EAB76C00E3A85200E3A85400F2D6AF00FFFFFF00FFFFFF00FDF9
      F400E7B46B00E3A85200EBB86C00B4834C00888E9700C3CAD40057616E00C697
      5E00B4824B00EAB76C00E3A85200E3A85400FDF9F400FFFFFF00E3A85400E3A8
      5400E3A85400E3A85200EBB86C00B4834C0000000000BC895100AA7A3F00CB9F
      6500B2814B00EDBC7400E3A75200F0D1A300F0D1A400F0D1A400F9EEDD00FFFF
      FF00F4DCBA00E7B36900EDBC7500B4834C0000000000BC895100AA7A3F00CB9F
      6500B2814B00EDBC7400E3A75200F4DCBA00FFFFFF00FDF9F400F8E8D100FFFF
      FF00F9EEDD00E3A75200EDBC7500B4834C0000000000BC895100AA7A3F00CB9F
      6500B2814B00EDBC7400E3A75200F0D1A300FFFFFF00FDF9F400F8E8D100FFFF
      FF00FDF9F400E3A75200EDBC7500B4834C0000000000BC895100AA7A3F00CB9F
      6500B2814B00EDBC7400E3A75200E3A85300F8E8D100FFFFFF00E9B97600E3A8
      5400E3A85300E3A75200EDBC7500B4834C0000000000BA885000FFDFA400D0A5
      6800B2804A00EEC07D00E3A85200FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00F0D1A300EEC17E00B4834C0000000000BA885000FFDFA400D0A5
      6800B2804A00EEC07D00E3A85200F4DCBB00FDF9F400E7B46C00E3A95500FFFF
      FF00FFFFFF00E3A85200EEC17E00B4834C0000000000BA885000FFDFA400D0A5
      6800B2804A00EEC07D00E3A85200F8E8D100FFFFFF00E7B46C00E3A95500FDF9
      F400FFFFFF00E3A85200EEC17E00B4834C0000000000BA885000FFDFA400D0A5
      6800B2804A00EEC07D00E3A85200E3A85400F2D7B000FFFFFF00F2D7B000E3A9
      5500E3A85400E3A85200EEC17E00B4834C00888E9700C3CAD400555F6D00D9AE
      6F00B2804A00EFC78A00E4AA5600FFFFFF00FFFFFF00F1D2A500FAEEDD00FFFF
      FF00F4DDBC00E8B56D00F0C88B00B4834C00888E9700C3CAD400555F6D00D9AE
      6F00B2804A00EFC78A00E4AA5600E9BC7900F4DDBC00E8B66D00E4AB5700FFFF
      FF00FFFFFF00E4AA5600F0C88B00B4834C00888E9700C3CAD400555F6D00D9AE
      6F00B2804A00EFC78A00E4AA5600FDF9F400FFFFFF00EDC78F00E8B66D00FFFF
      FF00FFFFFF00E4AA5600F0C88B00B4834C00888E9700C3CAD400555F6D00D9AE
      6F00B2804A00EFC78A00E4AA5600E4AB5700E8B66D00FFFFFF00FAEEDD00E4AB
      5700E4AB5700E4AA5600F0C88B00B4834C0000000000BC885100A67B3A00DEB5
      7600B17F4900F1CD9700E3AC5700ECC88F00FFFFFF00F0D3A500F6E3C700FFFF
      FF00F0D3A500E3AC5700F2CD9700B4834C0000000000BC885100A67B3A00DEB5
      7600B17F4900F1CD9700E3AC5700F0D3A500FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00F9EEDD00E3AC5700F2CD9700B4834C0000000000BC885100A67B3A00DEB5
      7600B17F4900F1CD9700E3AC5700FDF9F400FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00F2D8B100E3AC5700F2CD9700B4834C0000000000BC885100A67B3A00DEB5
      7600B17F4900F1CD9700E3AC5700E3AC5700E3AC5700F9EEDD00FFFFFF00E7B7
      6D00E3AC5700E3AC5700F2CD9700B4834C0000000000BA875000FFE09F00E3BB
      7A00B17E4900F3D3A100E3AD5900E3AD5900F6E4C800FFFFFF00F8E9D300FFFF
      FF00F0D3A600E3AD5900F4D4A300B4834C0000000000BA875000FFE09F00E3BB
      7A00B17E4900F3D3A100E3AD5900E9BD7A00FFFFFF00FFFFFF00FDFAF400F6E4
      C800E7B86F00E3AD5900F4D4A300B4834C0000000000BA875000FFE09F00E3BB
      7A00B17E4900F3D3A100E3AD5900FDFAF400FFFFFF00F0D3A600F6E4C800F0D3
      A600E3AD5900E3AD5900F4D4A300B4834C0000000000BA875000FFE09F00E3BB
      7A00B17E4900F3D3A100E3AD5900E3AD5900E3AD5900E7B86F00FFFFFF00F6E4
      C800E3AD5900E3AD5900F4D4A300B4834C00888E9700C3CAD400545E6D00EBC4
      7F00B17E4900F4D9AD00E3B15E00E3B15E00E3B15E00FFFFFF00FFFFFF00FFFF
      FF00F0D5A900E3B15E00F5DAAE00B4834C00888E9700C3CAD400545E6D00EBC4
      7F00B17E4900F4D9AD00E3B15E00E3B15E00FFFFFF00FFFFFF00E3B15E00E3B1
      5E00E3B15E00E3B15E00F5DAAE00B4834C00888E9700C3CAD400545E6D00EBC4
      7F00B17E4900F4D9AD00E3B15E00F4E0BF00FFFFFF00ECCB9400E7BB7300FDFA
      F400F4E0BF00E3B15E00F5DAAE00B4834C00888E9700C3CAD400545E6D00EBC4
      7F00B17E4900F4D9AD00E3B15E00E3B15E00E3B15E00E3B15E00F2DBB400FFFF
      FF00ECCB9400E3B15E00F5DAAE00B4834C0000000000BC895100A47C3600ECC5
      8100B07E4900F5DEB600E4B26100E4B26100E4B26100E9C18100FFFFFF00FFFF
      FF00F1D6AB00E4B26100F6DFB800B4824C0000000000BC895100A47C3600ECC5
      8100B07E4900F5DEB600E4B26100E4B26100FDFAF400FFFFFF00FFFFFF00FFFF
      FF00F6E5CA00E4B26100F6DFB800B4824C0000000000BC895100A47C3600ECC5
      8100B07E4900F5DEB600E4B26100E8BC7600FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00F2DBB500E4B26100F6DFB800B4824C0000000000BC895100A47C3600ECC5
      8100B07E4900F5DEB600E4B26100FDFAF400FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00E4B26100F6DFB800B4824C0000000000BA875000F9D18B00EBC4
      7F00B07D4800F8E3C000E5B56500E5B56500E5B56500E5B56500F3DCB700FDFA
      F500EECE9800E5B56500F8E5C200B4824C0000000000BA875000F9D18B00EBC4
      7F00B07D4800F8E3C000E5B56500E5B56500F3DCB700FDFAF500FDFAF500FDFA
      F500F3DCB700E5B56500F8E5C200B4824C0000000000BA875000F9D18B00EBC4
      7F00B07D4800F8E3C000E5B56500E5B56500EAC48400FAF0E000FDFAF500F6E6
      CC00E5B56500E5B56500F8E5C200B4824C0000000000BA875000F9D18B00EBC4
      7F00B07D4800F8E3C000E5B56500F8EBD600FDFAF500FDFAF500FDFAF500FDFA
      F500FDFAF500E5B56500F8E5C200B4824C00888D9700C1C8D200525A6700EBC3
      7B00B07D4600F9EACB00E6BB6F00E4B96B00E4B86800E4B76800E4B86800E4B8
      6800E4B96B00E6BB6F00FAECCD00B4834C00888D9700C1C8D200525A6700EBC3
      7B00B07D4600F9EACB00E6BB6F00E4B96B00E4B86800E4B76800E4B86800E4B8
      6800E4B96B00E6BB6F00FAECCD00B4834C00888D9700C1C8D200525A6700EBC3
      7B00B07D4600F9EACB00E6BB6F00E4B96B00E4B86800E4B76800E4B86800E4B8
      6800E4B96B00E6BB6F00FAECCD00B4834C00888D9700C1C8D200525A6700EBC3
      7B00B07D4600F9EACB00E6BB6F00E4B96B00E4B86800E4B76800E4B86800E4B8
      6800E4B96B00E6BB6F00FAECCD00B4834C0000000000BA864E00FFF2D400FEF1
      D400B27F4900FEF1D700FCEED300FBEDD200FBEDD200FBEDD200FBEDD200FBED
      D200FBEDD200FCEED300FFF2D800B5844F0000000000BA864E00FFF2D400FEF1
      D400B27F4900FEF1D700FCEED300FBEDD200FBEDD200FBEDD200FBEDD200FBED
      D200FBEDD200FCEED300FFF2D800B5844F0000000000BA864E00FFF2D400FEF1
      D400B27F4900FEF1D700FCEED300FBEDD200FBEDD200FBEDD200FBEDD200FBED
      D200FBEDD200FCEED300FFF2D800B5844F0000000000BA864E00FFF2D400FEF1
      D400B27F4900FEF1D700FCEED300FBEDD200FBEDD200FBEDD200FBEDD200FBED
      D200FBEDD200FCEED300FFF2D800B5844F0000000000C49C7100B7875200B686
      5200B7875200B5844E00B4824C00B4824B00B4824B00B4824B00B4824B00B482
      4B00B4824B00B4824C00B5844F00BC80600000000000C49C7100B7875200B686
      5200B7875200B5844E00B4824C00B4824B00B4824B00B4824B00B4824B00B482
      4B00B4824B00B4824C00B5844F00BC80600000000000C49C7100B7875200B686
      5200B7875200B5844E00B4824C00B4824B00B4824B00B4824B00B4824B00B482
      4B00B4824B00B4824C00B5844F00BC80600000000000C49C7100B7875200B686
      5200B7875200B5844E00B4824C00B4824B00B4824B00B4824B00B4824B00B482
      4B00B4824B00B4824C00B5844F00BC8060000000000000000000000000000000
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
      00000000000000000000000000000000000000000000BA8F6000B8895600B88A
      5700B8895500B5855000B4834C00B4834C00B4834C00B4834C00B4834C00B483
      4C00B4834C00B4834C00B5855000BA805D0000000000BA8F6000B8895600B88A
      5700B8895500B5855000B4834C00B4834C00B4834C00B4834C00B4834C00B483
      4C00B4834C00B4834C00B5855000BA805D0000000000BA8F6000B8895600B88A
      5700B8895500B5855000B4834C00B4834C00B4834C00B4834C00B4834C00B483
      4C00B4834C00B4834C00B5855000BA805D0000000000BA8F6000B8895600B88A
      5700B8895500B5855000B4834C00B4834C00B4834C00B4834C00B4834C00B483
      4C00B4834C00B4834C00B5855000BA805D0000000000BA885100FFDFAA00BC8D
      5800B5844F00EAB46400E4A85300E4A85400E4A85400E4A85400E4A85400E4A8
      5400E4A85400E4A85300EAB46400B585500000000000BA885100FFDFAA00BC8D
      5800B5844F00EAB46400E4A85300E4A85400E4A85400E4A85400E4A85400E4A8
      5400E4A85400E4A85300EAB46400B585500000000000BA885100FFDFAA00BC8D
      5800B5844F00EAB46400E4A85300E4A85400E4A85400E4A85400E4A85400E4A8
      5400E4A85400E4A85300EAB46400B585500000000000BA885100FFDFAA00BC8D
      5800B5844F00EAB46400E4A85300E4A85400E4A85400E4A85400E4A85400E4A8
      5400E4A85400E4A85300EAB46400B5855000888E9700C3CAD40057616E00C697
      5E00B4824B00EAB76C00E3A85200E3A85400F6E2C600FFFFFF00FFFFFF00F9EE
      DD00E7B46B00E3A85200EBB86C00B4834C00888E9700C3CAD40057616E00C697
      5E00B4824B00EAB76C00E3A85200E3A85400E3A85400E3A85400FFFFFF00FDF9
      F400E3A85400E3A85200EBB86C00B4834C00888E9700C3CAD40057616E00C697
      5E00B4824B00EAB76C00E3A85200FBF3E800FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00E3A85200EBB86C00B4834C00888E9700C3CAD40057616E00C697
      5E00B4824B00EAB76C00E3A85200E3A85400F8E8D100FFFFFF00FFFFFF00F9EE
      DD00E7B46B00E3A85200EBB86C00B4834C0000000000BC895100AA7A3F00CB9F
      6500B2814B00EDBC7400E3A75200F0D1A300FFFFFF00FFFFFF00FBF3E800FFFF
      FF00F6E2C600E3A75200EDBC7500B4834C0000000000BC895100AA7A3F00CB9F
      6500B2814B00EDBC7400E3A75200E3A85300E3A85400E3A85400FFFFFF00FDF9
      F400E3A85300E3A75200EDBC7500B4834C0000000000BC895100AA7A3F00CB9F
      6500B2814B00EDBC7400E3A75200F0D1A300FFFFFF00FFFFFF00FDF9F400FDF9
      F400FDF9F400E3A75200EDBC7500B4834C0000000000BC895100AA7A3F00CB9F
      6500B2814B00EDBC7400E3A75200F4DCBA00FFFFFF00FDF9F400F9EEDD00FFFF
      FF00F9EEDD00E3A75200EDBC7500B4834C0000000000BA885000FFDFA400D0A5
      6800B2804A00EEC07D00E3A85200F8E8D100FFFFFF00E9BA7700E3A95500FFFF
      FF00FFFFFF00E3A85200EEC17E00B4834C0000000000BA885000FFDFA400D0A5
      6800B2804A00EEC07D00E3A85200E3A85400E3A95500E3A95500FFFFFF00FDF9
      F400E3A85400E3A85200EEC17E00B4834C0000000000BA885000FFDFA400D0A5
      6800B2804A00EEC07D00E3A85200E3A85400F8E8D200FFFFFF00F2D7B000E3A9
      5500E3A85400E3A85200EEC17E00B4834C0000000000BA885000FFDFA400D0A5
      6800B2804A00EEC07D00E3A85200F4DCBB00FDF9F400E7B46C00E3A95500FFFF
      FF00FFFFFF00E3A85200EEC17E00B4834C00888E9700C3CAD400555F6D00D9AE
      6F00B2804A00EFC78A00E4AA5600FDF9F400FFFFFF00E4AB5700E4AB5700FDF9
      F400FFFFFF00E4AA5600F0C88B00B4834C00888E9700C3CAD400555F6D00D9AE
      6F00B2804A00EFC78A00E4AA5600E4AB5700E4AB5700E4AB5700FFFFFF00FDF9
      F400E4AB5700E4AA5600F0C88B00B4834C00888E9700C3CAD400555F6D00D9AE
      6F00B2804A00EFC78A00E4AA5600E4AB5700E4AB5700FAEEDD00FFFFFF00F2D8
      B100E4AB5700E4AA5600F0C88B00B4834C00888E9700C3CAD400555F6D00D9AE
      6F00B2804A00EFC78A00E4AA5600E4AB5700E4AB5700E4AB5700E4AB5700FFFF
      FF00FFFFFF00E4AA5600F0C88B00B4834C0000000000BC885100A67B3A00DEB5
      7600B17F4900F1CD9700E3AC5700FDF9F400FFFFFF00E3AC5700E3AC5700FDF9
      F400FFFFFF00E3AC5700F2CD9700B4834C0000000000BC885100A67B3A00DEB5
      7600B17F4900F1CD9700E3AC5700E3AC5700E3AC5700E3AC5700FFFFFF00FDF9
      F400E3AC5700E3AC5700F2CD9700B4834C0000000000BC885100A67B3A00DEB5
      7600B17F4900F1CD9700E3AC5700E3AC5700E3AC5700E3AC5700F9EEDD00FFFF
      FF00F0D3A500E3AC5700F2CD9700B4834C0000000000BC885100A67B3A00DEB5
      7600B17F4900F1CD9700E3AC5700E3AC5700E3AC5700F2D8B100FFFFFF00FFFF
      FF00ECC88F00E3AC5700F2CD9700B4834C0000000000BA875000FFE09F00E3BB
      7A00B17E4900F3D3A100E3AD5900FDFAF400FFFFFF00E3AD5900E3AD5900FDFA
      F400FFFFFF00E3AD5900F4D4A300B4834C0000000000BA875000FFE09F00E3BB
      7A00B17E4900F3D3A100E3AD5900F0D3A600FBF4E900ECC89000FFFFFF00FDFA
      F400E3AD5900E3AD5900F4D4A300B4834C0000000000BA875000FFE09F00E3BB
      7A00B17E4900F3D3A100E3AD5900E3AD5900E3AD5900E3AD5900E3AD5900FFFF
      FF00FFFFFF00E3AD5900F4D4A300B4834C0000000000BA875000FFE09F00E3BB
      7A00B17E4900F3D3A100E3AD5900E3AD5900E3AD5900ECC89000FFFFFF00FFFF
      FF00E9BD7A00E3AD5900F4D4A300B4834C00888E9700C3CAD400545E6D00EBC4
      7F00B17E4900F4D9AD00E3B15E00F6E5C900FFFFFF00F0D5A900E7BB7300FFFF
      FF00FDFAF400E3B15E00F5DAAE00B4834C00888E9700C3CAD400545E6D00EBC4
      7F00B17E4900F4D9AD00E3B15E00E9C17E00FFFFFF00FFFFFF00FFFFFF00FDFA
      F400E3B15E00E3B15E00F5DAAE00B4834C00888E9700C3CAD400545E6D00EBC4
      7F00B17E4900F4D9AD00E3B15E00F2DBB400FFFFFF00F0D5A900E3B15E00FFFF
      FF00FFFFFF00E3B15E00F5DAAE00B4834C00888E9700C3CAD400545E6D00EBC4
      7F00B17E4900F4D9AD00E3B15E00F0D5A900FBF5EA00F0D5A900F0D5A900FFFF
      FF00F6E5C900E3B15E00F5DAAE00B4834C0000000000BC895100A47C3600ECC5
      8100B07E4900F5DEB600E4B26100E9C18100FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00F2DBB500E4B26100F6DFB800B4824C0000000000BC895100A47C3600ECC5
      8100B07E4900F5DEB600E4B26100E4B26100E4B26100FAF0DF00FFFFFF00FDFA
      F400E4B26100E4B26100F6DFB800B4824C0000000000BC895100A47C3600ECC5
      8100B07E4900F5DEB600E4B26100E9C18100FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FDFAF400E4B26100F6DFB800B4824C0000000000BC895100A47C3600ECC5
      8100B07E4900F5DEB600E4B26100E9C18100FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00F1D6AB00E4B26100F6DFB800B4824C0000000000BA875000F9D18B00EBC4
      7F00B07D4800F8E3C000E5B56500E5B56500F1D8AD00FCF5EA00FDFAF500F3DC
      B700E5B56500E5B56500F8E5C200B4824C0000000000BA875000F9D18B00EBC4
      7F00B07D4800F8E3C000E5B56500E5B56500E5B56500E5B56500FAF0E000F8EB
      D600E5B56500E5B56500F8E5C200B4824C0000000000BA875000F9D18B00EBC4
      7F00B07D4800F8E3C000E5B56500E5B56500EECE9800FCF5EA00FDFAF500F8EB
      D600E8BF7A00E5B56500F8E5C200B4824C0000000000BA875000F9D18B00EBC4
      7F00B07D4800F8E3C000E5B56500E5B56500F1D8AD00FCF5EA00FDFAF500F1D8
      AD00E5B56500E5B56500F8E5C200B4824C00888D9700C1C8D200525A6700EBC3
      7B00B07D4600F9EACB00E6BB6F00E4B96B00E4B86800E4B76800E4B86800E4B8
      6800E4B96B00E6BB6F00FAECCD00B4834C00888D9700C1C8D200525A6700EBC3
      7B00B07D4600F9EACB00E6BB6F00E4B96B00E4B86800E4B76800E4B86800E4B8
      6800E4B96B00E6BB6F00FAECCD00B4834C00888D9700C1C8D200525A6700EBC3
      7B00B07D4600F9EACB00E6BB6F00E4B96B00E4B86800E4B76800E4B86800E4B8
      6800E4B96B00E6BB6F00FAECCD00B4834C00888D9700C1C8D200525A6700EBC3
      7B00B07D4600F9EACB00E6BB6F00E4B96B00E4B86800E4B76800E4B86800E4B8
      6800E4B96B00E6BB6F00FAECCD00B4834C0000000000BA864E00FFF2D400FEF1
      D400B27F4900FEF1D700FCEED300FBEDD200FBEDD200FBEDD200FBEDD200FBED
      D200FBEDD200FCEED300FFF2D800B5844F0000000000BA864E00FFF2D400FEF1
      D400B27F4900FEF1D700FCEED300FBEDD200FBEDD200FBEDD200FBEDD200FBED
      D200FBEDD200FCEED300FFF2D800B5844F0000000000BA864E00FFF2D400FEF1
      D400B27F4900FEF1D700FCEED300FBEDD200FBEDD200FBEDD200FBEDD200FBED
      D200FBEDD200FCEED300FFF2D800B5844F0000000000BA864E00FFF2D400FEF1
      D400B27F4900FEF1D700FCEED300FBEDD200FBEDD200FBEDD200FBEDD200FBED
      D200FBEDD200FCEED300FFF2D800B5844F0000000000C49C7100B7875200B686
      5200B7875200B5844E00B4824C00B4824B00B4824B00B4824B00B4824B00B482
      4B00B4824B00B4824C00B5844F00BC80600000000000C49C7100B7875200B686
      5200B7875200B5844E00B4824C00B4824B00B4824B00B4824B00B4824B00B482
      4B00B4824B00B4824C00B5844F00BC80600000000000C49C7100B7875200B686
      5200B7875200B5844E00B4824C00B4824B00B4824B00B4824B00B4824B00B482
      4B00B4824B00B4824C00B5844F00BC80600000000000C49C7100B7875200B686
      5200B7875200B5844E00B4824C00B4824B00B4824B00B4824B00B4824B00B482
      4B00B4824B00B4824C00B5844F00BC8060000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000300000000100010000000000800100000000000000000000
      000000000000000000000000FFFFFF00FFFFFFFF000000008000800000000000
      8000800000000000000000000000000080008000000000008000800000000000
      0000000000000000800080000000000080008000000000000000000000000000
      8000800000000000800080000000000000000000000000008000800000000000
      8000800000000000FFFFFFFF00000000FFFFFFFFFFFFFFFF8000800080008000
      8000800080008000000000000000000080008000800080008000800080008000
      0000000000000000800080008000800080008000800080000000000000000000
      8000800080008000800080008000800000000000000000008000800080008000
      8000800080008000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8000800080008000
      8000800080008000000000000000000080008000800080008000800080008000
      0000000000000000800080008000800080008000800080000000000000000000
      8000800080008000800080008000800000000000000000008000800080008000
      8000800080008000FFFFFFFFFFFFFFFF00000000000000000000000000000000
      000000000000}
  end
  object ImageList20: TBCImageList
    Height = 20
    Width = 20
    Left = 382
    Top = 156
    Bitmap = {
      494C0101020005001C0014001400FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000500000001400000001002000000000000019
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
      00000000000000000000B4B4B200AEAEAB00ADADAB00ADADAB00ADADAB00ADAD
      AB00ADADAB00ADADAB00ADADAB00ADADAB00ADADAB00ADADAB00ADADAB00ADAD
      AB00AFAFAD000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000AEAEAB00FFFFFF00FEFEFE00FEFEFE00FEFEFE00FEFE
      FE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FFFF
      FF00ADADAB000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000AFAFAD00ADADAB00ADAD
      AB00ADADAB00ADADAB00ADADAB00ADADAB00AFAFAD00B1B1AF00AFAFAF00AEAE
      AB00ADADAB00ADADAB00ADADAB00ADADAB00ADADAB00AEAEAB00B7B7B5000000
      00000000000000000000ADADAB00FFFFFF00FBFBFB00FBFBFB00FBFBFB00FBFB
      FB00FBFBFB00FBFBFB00FBFBFB00FBFBFB00FBFBFB00FBFBFB00FBFBFB00FFFF
      FF00ADADAB000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000AEAEAB00FFFFFF00FEFE
      FF00FEFEFF00FEFEFF00FEFEFF00FEFEFF00FFFFFF00ACACAA00ACACAA00FFFF
      FF00FEFEFF00FEFEFF00FEFEFF00FEFEFF00FEFEFF00FFFFFF00AEAEAB000000
      00000000000000000000ADADAB00FFFFFF00FAFAF900FAFAF900FAFAF900FAFA
      F900FAFAF900FAFAF900FAFAF900FAFAF900FAFAF900FAFAF900FAFAF900FFFF
      FF00ADADAB000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000AEAEAB00FFFFFF00FBFB
      FB00FBFBFB00FBFBFB00FBFBFB00FBFBFB00FFFFFF00ACACAA00ACACAA00FFFF
      FF00FBFBFB00FBFBFB00FBFBFB00FBFBFB00FBFBFB00FFFFFF00ADADAB000000
      00000000000000000000ADADAB00FFFFFF00F9F8F800F9F8F800F9F8F800F9F8
      F800F9F8F800F9F8F800F9F8F800F9F8F800F9F8F800F9F8F800F9F8F800FFFF
      FF00ADADAB000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000AEAEAB00FFFFFF00FAFA
      FA00FAFAFA00FAFAFA00FAFAFA00FAFAFA00FFFFFF00ACACAA00ACACAA00FFFF
      FF00FAFAFA00FAFAFA00FAFAFA00FAFAFA00FAFAFA00FFFFFF00ADADAB000000
      00000000000000000000ADADAB00FFFFFF00F6F6F600F6F6F600F6F6F600F6F6
      F600F6F6F600F6F6F600F6F6F600F6F6F600F6F6F600F6F6F600F6F6F600FFFF
      FF00ADADAB000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000AEAEAB00FFFFFF00F7F7
      F700F7F7F700F7F7F700F7F7F700F7F7F700FFFFFF00ACACAA00ACACAA00FFFF
      FF00F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700FFFFFF00ADADAB000000
      00000000000000000000ADADAB00FFFFFF00F4F4F300F4F4F300F4F4F300F4F4
      F300F4F4F300F4F4F300F4F4F300F4F4F300F4F4F300F4F4F300F4F4F300FFFF
      FF00ADADAB000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000AEAEAB00FFFFFF00F4F4
      F300F4F4F300F4F4F300F4F4F300F4F4F300FFFFFF00ACACAA00ACACAA00FFFF
      FF00F4F4F300F4F4F300F4F4F300F4F4F300F4F4F300FFFFFF00ADADAB000000
      00000000000000000000ADADAB00FFFFFF00F2F1F100F2F1F100F2F1F100F2F1
      F100F2F1F100F2F1F100F2F1F100F2F1F100F2F1F100F2F1F100F2F1F100FFFF
      FF00ADADAB000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000AEAEAB00FFFFFF00F1F1
      F000F1F1F000F1F1F000F1F1F000F1F1F000FFFFFF00ACACAA00ACACAA00FFFF
      FF00F1F1F000F1F1F000F1F1F000F1F1F000F1F1F000FFFFFF00ADADAB000000
      00000000000000000000ADADAB00FFFFFF00F1F0EF00F1F0EF00F1F0EF00F1F0
      EF00F1F0EF00F1F0EF00F1F0EF00F1F0EF00F1F0EF00F1F0EF00F1F0EF00FFFF
      FF00ADADAB000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000AEAEAB00FFFFFF00F0EF
      EF00F0EFEF00F0EFEF00F0EFEF00F0EFEF00FFFFFF00ACACAA00ACACAA00FFFF
      FF00F0EFEF00F0EFEF00F0EFEF00F0EFEF00F0EFEF00FFFFFF00ADADAB000000
      00000000000000000000ADADAB00FFFFFF00EFEFEE00EFEFEE00EFEFEE00EFEF
      EE00EFEFEE00EFEFEE00EFEFEE00EFEFEE00EFEFEE00EFEFEE00EFEFEE00FFFF
      FF00ADADAB000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000AEAEAB00FFFFFF00EEEE
      ED00EEEEED00EEEEED00EEEEED00EEEEED00FFFFFF00ACACAA00ACACAA00FFFF
      FF00EEEEED00EEEEED00EEEEED00EEEEED00EEEEED00FFFFFF00ADADAB000000
      00000000000000000000ADADAB00FFFFFF00EDECEC00EDECEC00EDECEC00EDEC
      EC00EDECEC00EDECEC00EDECEC00EDECEC00EDECEC00EDECEC00EDECEC00FFFF
      FF00ADADAB000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000AEAEAB00FFFFFF00ECEB
      EA00ECEBEA00ECEBEA00ECEBEA00ECEBEA00FFFFFF00ACACAA00ACACAA00FFFF
      FF00ECEBEA00ECEBEA00ECEBEA00ECEBEA00ECEBEA00FFFFFF00ADADAB000000
      00000000000000000000ADADAB00FFFFFF00EBEAE900EBEAE900EBEAE900EBEA
      E900EBEAE900EBEAE900EBEAE900EBEAE900EAE9E700EAE9E800EAE9E800FFFF
      FF00ADADAB000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000AEAEAB00FFFFFF00FFFF
      FF00F2F1F100E8E7E600E9E8E700E9E8E700FFFFFF00ACACAA00ACACAA00FFFF
      FF00E9E8E700E9E8E700E8E7E600F2F1F100FFFFFF00FFFFFF00AEAEAB000000
      00000000000000000000ADADAB00FFFFFF00E8E8E700E8E8E700E8E8E700E8E8
      E700E8E8E700E8E8E700E8E8E700E6E7E500CBCBCA00A7A7A500A7A7A500A7A7
      A400ADADAB000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C3C3C100AEAEAB00A7A7
      A500FFFFFF00E4E3E200E6E5E400E6E5E400FFFFFF00ACACAA00ACACAA00FFFF
      FF00E6E5E400E6E5E400E4E3E200FFFFFF00AEAEAB00AEAEAB00C3C3C1000000
      00000000000000000000AEAEAB00FFFFFF00E7E7E600E7E7E600E7E7E600E7E7
      E600E7E7E600E7E7E600E7E7E600E5E6E400A7A7A400FBFCFC00F6F5F500EFEE
      ED00C3C3C1000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C3C3C100A7A7
      A400FFFFFF00E2E1E000E3E2E100E3E2E100FFFFFF00ACACAA00ACACAA00FFFF
      FF00E3E2E100E3E2E100E2E1E000FFFFFF00AEAEAB00C3C3C100000000000000
      00000000000000000000AEAEAB00FFFFFF00E6E5E400E6E5E400E6E5E400E6E5
      E400E6E5E400E6E5E400E6E5E400E4E3E200A7A7A500F3F2F200EBEAE900C3C3
      C100000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C3C3
      C100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00ADADAB00ADADAB00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C3C3C10000000000000000000000
      00000000000000000000AEAEAB00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00A7A7A400FFFFFF00C3C3C1000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000AEAEAB00ADAEAB00AEAEAB00AEAEAB00B0B0AD00BABAB800C9C9C800AEAE
      AC00AEAEAB00AEAEAB00ADAEAB00AEAEAB000000000000000000000000000000
      00000000000000000000AFAFAD00AEAEAB00AEAEAB00AEAEAB00AEAEAB00AEAE
      AB00AEAEAB00AEAEAB00AEAEAB00AEAEAB00AEAEAB00C3C3C200000000000000
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
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000050000000140000000100010000000000F00000000000000000000000
      000000000000000000000000FFFFFF00FFFFFFFFFF00000000000000FFFFFC00
      0700000000000000FFFFFC00070000000000000080001C000700000000000000
      80001C00070000000000000080001C00070000000000000080001C0007000000
      0000000080001C00070000000000000080001C00070000000000000080001C00
      070000000000000080001C00070000000000000080001C000700000000000000
      80001C00070000000000000080001C00070000000000000080001C0007000000
      00000000C0003C000F00000000000000E0007C001F00000000000000F000FC00
      3F00000000000000FFFFFFFFFF00000000000000FFFFFFFFFF00000000000000
      00000000000000000000000000000000000000000000}
  end
  object ImageList24: TBCImageList
    Height = 24
    Width = 24
    Left = 380
    Top = 212
    Bitmap = {
      494C0101020005001C0018001800FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000600000001800000001002000000000000024
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
      000000000000000000000000000000000000000000000000000000000000B4B4
      B200AEAEAB00ADADAB00ADADAB00ADADAB00ADADAB00ADADAB00ADADAB00ADAD
      AB00ADADAB00ADADAB00ADADAB00ADADAB00ADADAB00ADADAB00ADADAB00AFAF
      AD00B4B4B2000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000B0B0
      AD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00B0B0AD000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000AEAE
      AB00FFFFFF00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFE
      FE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FFFF
      FF00AEAEAB000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000AFAFAD00AEAEAB00ADAD
      AB00ADADAB00ADADAB00ADADAB00ADADAB00ADADAB00ADADAB00AFAFAD00B1B1
      AF00AFAFAF00AEAEAB00ADADAB00ADADAB00ADADAB00ADADAB00ADADAB00ADAD
      AB00ADADAB00AEAEAB00B7B7B50000000000000000000000000000000000ADAD
      AB00FFFFFF00FBFBFB00FBFBFB00FBFBFB00FBFBFB00FBFBFB00FBFBFB00FBFB
      FB00FBFBFB00FBFBFB00FBFBFB00FBFBFB00FBFBFB00FBFBFB00FBFBFB00FFFF
      FF00ADADAB000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000AEAEAB00FFFFFF00FEFE
      FF00FEFEFF00FEFEFF00FEFEFF00FEFEFF00FEFEFF00FEFEFF00FFFFFF00ACAC
      AA00ACACAA00FFFFFF00FEFEFF00FEFEFF00FEFEFF00FEFEFF00FEFEFF00FEFE
      FF00FEFEFF00FFFFFF00AEAEAB0000000000000000000000000000000000ADAD
      AB00FFFFFF00FAFAF900FAFAF900FAFAF900FAFAF900FAFAF900FAFAF900FAFA
      F900FAFAF900FAFAF900FAFAF900FAFAF900FAFAF900FAFAF900FAFAF900FFFF
      FF00ADADAB000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000AEAEAB00FFFFFF00FBFB
      FB00FBFBFB00FBFBFB00FBFBFB00FBFBFB00FBFBFB00FBFBFB00FFFFFF00ACAC
      AA00ACACAA00FFFFFF00FBFBFB00FBFBFB00FBFBFB00FBFBFB00FBFBFB00FBFB
      FB00FBFBFB00FFFFFF00ADADAB0000000000000000000000000000000000ADAD
      AB00FFFFFF00F9F8F800F9F8F800F9F8F800F9F8F800F9F8F800F9F8F800F9F8
      F800F9F8F800F9F8F800F9F8F800F9F8F800F9F8F800F9F8F800F9F8F800FFFF
      FF00ADADAB000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000AEAEAB00FFFFFF00FAFA
      FA00FAFAFA00FAFAFA00FAFAFA00FAFAFA00FAFAFA00FAFAFA00FFFFFF00ACAC
      AA00ACACAA00FFFFFF00FAFAFA00FAFAFA00FAFAFA00FAFAFA00FAFAFA00FAFA
      FA00FAFAFA00FFFFFF00ADADAB0000000000000000000000000000000000ADAD
      AB00FFFFFF00F6F6F600F6F6F600F6F6F600F6F6F600F6F6F600F6F6F600F6F6
      F600F6F6F600F6F6F600F6F6F600F6F6F600F6F6F600F6F6F600F6F6F600FFFF
      FF00ADADAB000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000AEAEAB00FFFFFF00F7F7
      F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700FFFFFF00ACAC
      AA00ACACAA00FFFFFF00F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7
      F700F7F7F700FFFFFF00ADADAB0000000000000000000000000000000000ADAD
      AB00FFFFFF00F5F5F400F5F5F400F5F5F400F5F5F400F5F5F400F5F5F400F5F5
      F400F5F5F400F5F5F400F5F5F400F5F5F400F5F5F400F5F5F400F5F5F400FFFF
      FF00ADADAB000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000AEAEAB00FFFFFF00F6F5
      F500F6F5F500F6F5F500F6F5F500F6F5F500F6F5F500F6F5F500FFFFFF00ACAC
      AA00ACACAA00FFFFFF00F6F5F500F6F5F500F6F5F500F6F5F500F6F5F500F6F5
      F500F6F5F500FFFFFF00ADADAB0000000000000000000000000000000000ADAD
      AB00FFFFFF00F4F4F300F4F4F300F4F4F300F4F4F300F4F4F300F4F4F300F4F4
      F300F4F4F300F4F4F300F4F4F300F4F4F300F4F4F300F4F4F300F4F4F300FFFF
      FF00ADADAB000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000AEAEAB00FFFFFF00F4F4
      F300F4F4F300F4F4F300F4F4F300F4F4F300F4F4F300F4F4F300FFFFFF00ACAC
      AA00ACACAA00FFFFFF00F4F4F300F4F4F300F4F4F300F4F4F300F4F4F300F4F4
      F300F4F4F300FFFFFF00ADADAB0000000000000000000000000000000000ADAD
      AB00FFFFFF00F2F1F100F2F1F100F2F1F100F2F1F100F2F1F100F2F1F100F2F1
      F100F2F1F100F2F1F100F2F1F100F2F1F100F2F1F100F2F1F100F2F1F100FFFF
      FF00ADADAB000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000AEAEAB00FFFFFF00F1F1
      F000F1F1F000F1F1F000F1F1F000F1F1F000F1F1F000F1F1F000FFFFFF00ACAC
      AA00ACACAA00FFFFFF00F1F1F000F1F1F000F1F1F000F1F1F000F1F1F000F1F1
      F000F1F1F000FFFFFF00ADADAB0000000000000000000000000000000000ADAD
      AB00FFFFFF00F1F0EF00F1F0EF00F1F0EF00F1F0EF00F1F0EF00F1F0EF00F1F0
      EF00F1F0EF00F1F0EF00F1F0EF00F1F0EF00F1F0EF00F1F0EF00F1F0EF00FFFF
      FF00ADADAB000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000AEAEAB00FFFFFF00F0EF
      EF00F0EFEF00F0EFEF00F0EFEF00F0EFEF00F0EFEF00F0EFEF00FFFFFF00ACAC
      AA00ACACAA00FFFFFF00F0EFEF00F0EFEF00F0EFEF00F0EFEF00F0EFEF00F0EF
      EF00F0EFEF00FFFFFF00ADADAB0000000000000000000000000000000000ADAD
      AB00FFFFFF00EFEFEE00EFEFEE00EFEFEE00EFEFEE00EFEFEE00EFEFEE00EFEF
      EE00EFEFEE00EFEFEE00EFEFEE00EFEFEE00EFEFEE00EFEFEE00EFEFEE00FFFF
      FF00ADADAB000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000AEAEAB00FFFFFF00EEEE
      ED00EEEEED00EEEEED00EEEEED00EEEEED00EEEEED00EEEEED00FFFFFF00ACAC
      AA00ACACAA00FFFFFF00EEEEED00EEEEED00EEEEED00EEEEED00EEEEED00EEEE
      ED00EEEEED00FFFFFF00ADADAB0000000000000000000000000000000000ADAD
      AB00FFFFFF00EDECEC00EDECEC00EDECEC00EDECEC00EDECEC00EDECEC00EDEC
      EC00EDECEC00EDECEC00EDECEC00EDECEC00EDECEC00EDECEC00EDECEC00FFFF
      FF00ADADAB000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000AEAEAB00FFFFFF00EBEA
      E900ECEBEA00ECEBEA00ECEBEA00ECEBEA00ECEBEA00ECEBEA00FFFFFF00ACAC
      AA00ACACAA00FFFFFF00ECEBEA00ECEBEA00ECEBEA00ECEBEA00ECEBEA00ECEB
      EA00EBEAE900FFFFFF00ADADAB0000000000000000000000000000000000ADAD
      AB00FFFFFF00ECEBEB00ECEBEB00ECEBEB00ECEBEB00ECEBEB00ECEBEB00ECEB
      EB00ECEBEB00ECEBEB00ECEBEB00ECEBEB00ECEBEB00ECEBEB00EBEAEA00FFFF
      FF00ADADAB000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000AEAEAB00FFFFFF00E8E7
      E700E8E7E800E9E8E800EAE9E900EAE9E900EAE9E900EAE9E900FFFFFF00ACAC
      AA00ACACAA00FFFFFF00EAE9E900EAE9E900EAE9E900EAE9E900E9E8E800E9E7
      E800E8E7E700FFFFFF00ADADAB0000000000000000000000000000000000ADAD
      AB00FFFFFF00EBEAE900EBEAE900EBEAE900EBEAE900EBEAE900EBEAE900EBEA
      E900EBEAE900EBEAE900EAE9E800EAE9E700EAE9E800EAE9E800E9E8E700FFFF
      FF00ADADAB000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000AEAEAB00FFFFFF00FFFF
      FF00FFFFFF00F2F1F100E8E7E600E9E8E700E9E8E700E9E8E700FFFFFF00ACAC
      AA00ACACAA00FFFFFF00E9E8E700E9E8E700E9E8E700E8E7E600F2F1F100FFFF
      FF00FFFFFF00FFFFFF00AEAEAB0000000000000000000000000000000000ADAD
      AB00FFFFFF00E8E8E700E8E8E700E8E8E700E8E8E700E8E8E700E8E8E700E8E8
      E700E8E8E700E6E7E500FFFFFF00CBCBCA00A7A7A500A7A7A500A7A7A400FFFF
      FF00AFAFAD000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C3C3C100AEAEAB00AEAE
      AB00A7A7A500FFFFFF00E4E3E200E6E5E400E6E5E400E6E5E400FFFFFF00ACAC
      AA00ACACAA00FFFFFF00E6E5E400E6E5E400E6E5E400E4E3E200FFFFFF00AEAE
      AB00AEAEAB00AEAEAB00C3C3C10000000000000000000000000000000000AEAE
      AB00FFFFFF00E7E7E600E7E7E600E7E7E600E7E7E600E7E7E600E7E7E600E7E7
      E600E7E7E600E5E6E400FFFFFF00A7A7A400FBFCFC00F6F5F500EFEEED00E9E9
      E900C3C3C1000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C3C3C100FFFF
      FF00A7A7A400FFFFFF00E2E1E000E3E2E100E3E2E100E3E2E100FFFFFF00ACAC
      AA00ACACAA00FFFFFF00E3E2E100E3E2E100E3E2E100E2E1E000FFFFFF00AEAE
      AB00FFFFFF00C3C3C1000000000000000000000000000000000000000000AEAE
      AB00FFFFFF00E6E5E400E6E5E400E6E5E400E6E5E400E6E5E400E6E5E400E6E5
      E400E6E5E400E4E3E200FFFFFF00A7A7A500F3F2F200EBEAE900FFFFFF00C4C4
      C200000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C3C3
      C100A5A5A300FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00ADAD
      AB00ADADAB00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00AEAE
      AB00C3C3C100000000000000000000000000000000000000000000000000AEAE
      AB00FFFFFF00E3E2E100E4E3E200E4E3E200E4E3E200E4E3E200E4E3E200E4E3
      E200E4E3E200E2E1E000FFFFFF00A7A7A400FFFFFF00E6E6E600C3C3C1000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000AFAFAD00AEAEAB00ADAEAB00AEAEAB00AEAEAB00AEAEAB00B0B0AD00BABA
      B800C9C9C800AEAEAC00AEAEAB00AEAEAB00AEAEAB00ADAEAB00AEAEAB00B6B6
      B40000000000000000000000000000000000000000000000000000000000AEAE
      AC00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00A5A5A300E7E7E700C3C3C100000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000AFAF
      AD00AEAEAB00AEAEAB00AEAEAB00AEAEAB00AEAEAB00AEAEAB00AEAEAB00AEAE
      AB00AEAEAB00AEAEAB00AEAEAB00AEAEAB00C3C3C20000000000000000000000
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
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000060000000180000000100010000000000200100000000000000000000
      000000000000000000000000FFFFFF00FFFFFFFFFFFF000000000000FFFFFFE0
      0007000000000000FFFFFFE00007000000000000FFFFFFE00007000000000000
      800001E00007000000000000800001E00007000000000000800001E000070000
      00000000800001E00007000000000000800001E00007000000000000800001E0
      0007000000000000800001E00007000000000000800001E00007000000000000
      800001E00007000000000000800001E00007000000000000800001E000070000
      00000000800001E00007000000000000800001E00007000000000000800001E0
      0007000000000000C00003E0000F000000000000E00007E0001F000000000000
      F0000FE0003F000000000000FFFFFFE0007F000000000000FFFFFFFFFFFF0000
      00000000FFFFFFFFFFFF00000000000000000000000000000000000000000000
      000000000000}
  end
  object SynEditRegexSearch: TSynEditRegexSearch
    Left = 60
    Top = 100
  end
  object SynEditWildcardSearch: TSynEditWildcardSearch
    Left = 62
    Top = 304
  end
end
