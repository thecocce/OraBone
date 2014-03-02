object OptionsForm: TOptionsForm
  Left = 580
  Top = 154
  Caption = 'Options'
  ClientHeight = 495
  ClientWidth = 512
  Color = clWindow
  DoubleBuffered = True
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Icon.Data = {
    0000010001001010000001002000280400001600000028000000100000002000
    0000010020000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000C18C26FFC491
    2BFF000000000000000000000000000000000000000000000000000000000000
    00000000000000000000000000000000000000000000C0891EFFE7A842FFEAB0
    54FFD9A448FF000000000000000000000000000000000000000000000000BA89
    26FFB67E0EFFB57C09FFB57B09FFB57B09FFB47C0AFFBF820FFFFFF2D3FFE2A2
    39FFE8AF51FFD9A344FFB68012FFB88112FFBD8A27FF0000000000000000B67E
    0EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFAD68FFCA8509FFFFF0
    CEFFE1A135FFE9AC48FFD5B471FFFFFFFFFFBD810AFF0000000000000000B57B
    09FFFFFFFFFFE5D5CBFFE5D6CAFFE5D5C9FFF9FCFFFFFBFFFFFFCBA862FFCA83
    05FFFFEDC5FFDBB16CFFB5B8C1FF6A6A6EFF6F6F75FF87898DFF00000000B47B
    08FFFFFFFFFFE3D1C2FFE4D2C3FFE4D1C0FFF1F3F4FFF2F4F6FFF4F9FFFFC9A3
    59FFE0C289FFD9DBE3FFCECDD0FFD3D4D4FFEEEEEFFFECEAEDFF7C7B7AFFB47B
    09FFFFFFFFFFE0CCBBFFE1CEBCFFE1CCB9FFECEDEEFFEBEBEBFFECECEEFFEEF0
    F4FFF2F3F7FFA7A6A7FFDBD9DAFFD1CFCFFF767474FF7C7B7CFF817F7FFFB57B
    09FFFFFFFFFFDDC6B3FFDEC9B5FFDEC7B2FFE6E7E8FFE5E4E4FFE5E4E4FFE7E6
    E6FFEDECEBFF797775FFD9D7D6FFC5C2C2FF7B7B7DFF0000000000000000B57B
    09FFFFFFFFFFDAC1AAFFDCC4ADFFDCC3AAFFDFE0E1FFDEDEDDFFDEDDDCFFDFDE
    DDFFE5E4E3FF767370FFE3E1E2FFB3B1AFFF8A8787FF828183FF878585FFB57B
    09FFFFFFFFFFD4B89EFFD5BAA0FFD6B99EFFD5D6D8FFD5D5D5FFD5D4D4FFD6D5
    D5FFD9D9D9FFA3A2A0FFBDBBBBFFF4F4F4FFE5E5E6FFC4C4C5FF898785FFB57C
    0AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
    FFFFFFFFFFFFFFFFFFFFA8A9AFFF7D7D82FF828389FFA0A1A6FF00000000B57E
    0FFFF7E0BEFFE7B870FFE8BE7AFFE8BE7AFFE8BD79FFE8BD78FFE8BD78FFE7BD
    77FFE8BD77FFEABF79FFECBC73FFFFE6C0FFBB8008FF0000000000000000B680
    13FFF2D8AEFFCD8408FFD08A13FFD28E1AFFD49222FFD59529FFD8992FFFD99B
    36FFDB9F3EFFDEA345FFE0A64AFFF2D8ACFFB78112FF0000000000000000B882
    17FFEED09CFFECCE99FFECCF9AFFECCF9AFFECCE9AFFECCE99FFECCE98FFEBCD
    98FFEBCD97FFEBCD97FFEBCD96FFEECF9AFFB88217FF0000000000000000BE8D
    2AFFB88217FFB78116FFB78116FFB78116FFB78116FFB78116FFB78115FFB781
    15FFB68115FFB68115FFB78115FFB88217FFBF8E2DFF0000000000000000}
  OldCreateOrder = True
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 458
    Width = 512
    Height = 37
    Align = alBottom
    BevelOuter = bvNone
    Padding.Left = 6
    Padding.Top = 6
    Padding.Right = 6
    Padding.Bottom = 6
    TabOrder = 0
    object OKButton: TButton
      Left = 350
      Top = 6
      Width = 75
      Height = 25
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Align = alRight
      Caption = '&OK'
      ModalResult = 1
      TabOrder = 0
    end
    object CancelButton: TButton
      Left = 431
      Top = 6
      Width = 75
      Height = 25
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Align = alRight
      Caption = 'Cancel'
      ModalResult = 2
      TabOrder = 1
    end
    object Separator1Panel: TPanel
      Left = 425
      Top = 6
      Width = 6
      Height = 25
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 2
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 512
    Height = 458
    Align = alClient
    BevelOuter = bvNone
    Padding.Left = 6
    Padding.Top = 6
    Padding.Right = 6
    TabOrder = 1
    object Splitter: TSplitter
      Left = 206
      Top = 6
      Height = 452
      Color = clBtnFace
      ParentColor = False
    end
    object OptionsVirtualDrawTree: TVirtualDrawTree
      Left = 6
      Top = 6
      Width = 200
      Height = 452
      Align = alLeft
      Header.AutoSizeIndex = 0
      Header.Font.Charset = DEFAULT_CHARSET
      Header.Font.Color = clWindowText
      Header.Font.Height = -11
      Header.Font.Name = 'Tahoma'
      Header.Font.Style = []
      Header.MainColumn = -1
      Images = ImagesDataModule.ImageList
      TabOrder = 0
      TreeOptions.AutoOptions = [toAutoDropExpand, toAutoScrollOnExpand]
      TreeOptions.MiscOptions = [toFullRepaintOnResize, toInitOnSave, toToggleOnDblClick, toWheelPanning]
      TreeOptions.PaintOptions = [toHideFocusRect, toShowButtons, toShowDropmark, toShowRoot, toThemeAware, toUseBlendedSelection]
      TreeOptions.SelectionOptions = [toFullRowSelect, toMiddleClickSelect]
      WantTabs = True
      OnClick = OptionsVirtualDrawTreeClick
      OnDrawNode = OptionsVirtualDrawTreeDrawNode
      OnFreeNode = OptionsVirtualDrawTreeFreeNode
      OnGetImageIndex = OptionsVirtualDrawTreeGetImageIndex
      OnGetNodeWidth = OptionsVirtualDrawTreeGetNodeWidth
      OnKeyUp = OptionsVirtualDrawTreeKeyUp
      Columns = <>
    end
    object OptionsPanel: TPanel
      Left = 209
      Top = 6
      Width = 297
      Height = 452
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object ScrollBox: TScrollBox
        Left = 0
        Top = 0
        Width = 297
        Height = 452
        Align = alClient
        BorderStyle = bsNone
        ParentBackground = True
        TabOrder = 0
      end
    end
  end
  object ActionList: TActionList
    Images = ImagesDataModule.ImageList
    Left = 104
    Top = 46
    object EditorAction: TAction
      Caption = 'Editor'
      ImageIndex = 68
    end
    object EditorFontAction: TAction
      Caption = 'Font'
      ImageIndex = 90
    end
    object EditorLeftMarginAction: TAction
      Caption = 'Left Margin'
      ImageIndex = 118
    end
    object EditorRightMarginAction: TAction
      Caption = 'Right Margin'
      ImageIndex = 165
    end
    object EditorTabsAction: TAction
      Caption = 'Tabs'
      ImageIndex = 192
    end
    object EditorSearchAction: TAction
      Caption = 'Search'
      ImageIndex = 81
    end
    object EditorCompletionProposalAction: TAction
      Caption = 'Completion Proposal'
      ImageIndex = 74
    end
    object EditorToolBarAction: TAction
      Caption = 'Tool Bar'
      ImageIndex = 212
    end
    object SchemaBrowserAction: TAction
      Caption = 'Schema Browser'
      ImageIndex = 214
    end
    object ObjectFrameAction: TAction
      Caption = 'Object Frame'
      ImageIndex = 3
    end
    object ConnectionAction: TAction
      Caption = 'Connection'
      ImageIndex = 44
    end
    object ConnectionTabsAction: TAction
      Caption = 'Tabs'
      ImageIndex = 192
    end
    object OutputAction: TAction
      Caption = 'Output'
      ImageIndex = 82
    end
    object DBMSOutputAction: TAction
      Caption = 'DBMS'
      ImageIndex = 56
    end
    object OutputTabsAction: TAction
      Caption = 'Tabs'
      ImageIndex = 192
    end
    object CompareAction: TAction
      Caption = 'Compare Files'
      ImageIndex = 31
    end
    object PrintAction: TAction
      Caption = 'Print'
      ImageIndex = 150
    end
    object MainMenuAction: TAction
      Caption = 'Main Menu'
      ImageIndex = 131
    end
    object StatusBarAction: TAction
      Caption = 'Status Bar'
      ImageIndex = 184
    end
    object DBSettingsAction: TAction
      Caption = 'DB Settings'
      ImageIndex = 52
    end
    object DateFormatAction: TAction
      Caption = 'Date Format'
      ImageIndex = 54
    end
    object TimeFormatAction: TAction
      Caption = 'Time Format'
      ImageIndex = 211
    end
    object SQLFormatterAction: TAction
      Caption = 'SQL Formatter'
      ImageIndex = 91
    end
    object SQLAlignmentsAction: TAction
      Caption = 'Alignments'
      ImageIndex = 253
    end
    object SQLCapitalizationAction: TAction
      Caption = 'Capitalization'
      ImageIndex = 257
    end
    object SQLIndentationAction: TAction
      Caption = 'Indentation'
      ImageIndex = 252
    end
    object SQLInsertAction: TAction
      Caption = 'Insert'
      ImageIndex = 206
    end
    object SQLSelectAction: TAction
      Caption = 'Select'
      ImageIndex = 256
    end
    object SQLUpdateAction: TAction
      Caption = 'Update'
      ImageIndex = 255
    end
    object SQLWhitespaceAction: TAction
      Caption = 'Whitespace'
      ImageIndex = 254
    end
  end
end
