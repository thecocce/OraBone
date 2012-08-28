object SQLEditorFrame: TSQLEditorFrame
  Left = 0
  Top = 0
  Width = 451
  Height = 304
  Hint = ' '
  Align = alClient
  DoubleBuffered = False
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
    ExplicitLeft = -125
    ExplicitTop = 313
    ExplicitWidth = 779
  end
  object SearchPanel: TPanel
    Left = 0
    Top = 23
    Width = 451
    Height = 21
    Hint = ' '
    Align = alTop
    BevelOuter = bvNone
    FullRepaint = False
    TabOrder = 0
    Visible = False
    object SearchForLabel: TLabel
      Left = 21
      Top = 3
      Width = 50
      Height = 13
      Caption = 'Search for'
    end
    object SpeedButton1: TSpeedButton
      Left = 306
      Top = 0
      Width = 21
      Height = 21
      Action = SearchFindNextAction
      Flat = True
      Glyph.Data = {
        36080000424D3608000000000000360000002800000020000000100000000100
        20000000000000080000120B0000120B00000000000000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF0000660000FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF0065656500FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF000066000000660000FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF006565650065656500FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF0000660000006600004DD777002ABA430000660000FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF006565650065656500C4C4C400A4A4A40065656500FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF000066000058E0870058E087003CC95E0019AC2C0000660000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF0065656500CECECE00CECECE00B4B4B4009494940065656500FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00006600000066000058E087004DD7760000660000FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF006565650065656500CECECE00C4C4C40065656500FF00FF00FF00FF00FF00
        FF006E757C007F7A8800FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF000066000000660000FF00FF00FF00FF00FF00FF00FF00
        FF007575750081818100FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF006565650065656500FF00FF00FF00FF00FF00FF00FF00
        FF0059A3DC002D87D5009C899300FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF0000660000FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF009A9A9A008181810092929200FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF0065656500FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF004AB3FF002B84D100A18A9200FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00A4A4A4007E7E7E0095959500FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF0046B2FF002984D00091869000FF00FF00A8787500D5B6
        A700D0A59F00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00A2A2A2007C7C7C008B8B8B00FF00FF007B7B7B00ABAB
        AB00A4A4A400FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF006AC1FF008F8B9000CAB09A00FEFDDA00FEFD
        D900FFFFEF00B48D8900FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00B4B4B4008D8D8D009F9F9F00D9D9D900D8D8
        D800E4E4E4008B8B8B00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00A2ADC200EBC6A800FFF7CA00FFFFDE00FFFF
        E300FFFFF700FAF9E300C79C9600FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF009F9F9F00B6B6B600D1D1D100DBDBDB00DEDE
        DE00E8E8E800DBDBDB009B9B9B00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00C6978F00F4D7A800F9E0B300FFFFDD00FFFF
        EF00FFFFFE00FAF9E300C79C9600FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF0097979700BBBBBB00C3C3C300DBDBDB00E4E4
        E400EBEBEB00DBDBDB009B9B9B00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00E4C9B200F6D6A400F2C69100FEFBD300FFFF
        E500FFFFE700FFFFDE00C6AC9A00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00B8B8B800BABABA00AEAEAE00D5D5D500DFDF
        DF00E0E0E000DBDBDB009D9D9D00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00CAA09800F6E2BA00F7D7AA00F5D6A600FCF0
        C900FFFFD800F8F5D100C8A29800FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF009E9E9E00C5C5C500BDBDBD00BABABA00CFCF
        CF00D8D8D800D1D1D1009D9D9D00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00DCC4B400F8F6F200FBDDAC00F8D2
        9B00FBE8B900BE9D8F00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00B5B5B500E2E2E200C0C0C000B6B6
        B600C7C7C70093939300FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00CAAD9600DDBFA900DCB8
        A800CAAD9600FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF009D9D9D00B0B0B000AFAF
        AF009D9D9D00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
      NumGlyphs = 2
    end
    object SpeedButton2: TSpeedButton
      Left = 333
      Top = 0
      Width = 21
      Height = 21
      Action = SearchFindPreviousAction
      Flat = True
      Glyph.Data = {
        36080000424D3608000000000000360000002800000020000000100000000100
        20000000000000080000120B0000120B00000000000000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF0000660000FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF0065656500FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF000066000000660000FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF006565650065656500FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00006600004DD777002ABA43000066000000660000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF0065656500C4C4C400A4A4A4006565650065656500FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF000066000058E0870058E087003CC95E0019AC2C0000660000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF0065656500CECECE00CECECE00B4B4B4009494940065656500FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF000066000058E087004DD776000066000000660000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF0065656500CECECE00C4C4C4006565650065656500FF00FF00FF00
        FF006E757C007F7A8800FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF000066000000660000FF00FF00FF00FF00FF00FF00FF00
        FF007575750081818100FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF006565650065656500FF00FF00FF00FF00FF00FF00FF00
        FF0059A3DC002D87D5009C899300FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF0000660000FF00FF00FF00FF00FF00FF00FF00
        FF009A9A9A008181810092929200FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF0065656500FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF004AB3FF002B84D100A18A9200FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00A4A4A4007E7E7E0095959500FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF0046B2FF002984D00091869000FF00FF00A8787500D5B6
        A700D0A59F00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00A2A2A2007C7C7C008B8B8B00FF00FF007B7B7B00ABAB
        AB00A4A4A400FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF006AC1FF008F8B9000CAB09A00FEFDDA00FEFD
        D900FFFFEF00B48D8900FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00B4B4B4008D8D8D009F9F9F00D9D9D900D8D8
        D800E4E4E4008B8B8B00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00A2ADC200EBC6A800FFF7CA00FFFFDE00FFFF
        E300FFFFF700FAF9E300C79C9600FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF009F9F9F00B6B6B600D1D1D100DBDBDB00DEDE
        DE00E8E8E800DBDBDB009B9B9B00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00C6978F00F4D7A800F9E0B300FFFFDD00FFFF
        EF00FFFFFE00FAF9E300C79C9600FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF0097979700BBBBBB00C3C3C300DBDBDB00E4E4
        E400EBEBEB00DBDBDB009B9B9B00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00E4C9B200F6D6A400F2C69100FEFBD300FFFF
        E500FFFFE700FFFFDE00C6AC9A00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00B8B8B800BABABA00AEAEAE00D5D5D500DFDF
        DF00E0E0E000DBDBDB009D9D9D00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00CAA09800F6E2BA00F7D7AA00F5D6A600FCF0
        C900FFFFD800F8F5D100C8A29800FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF009E9E9E00C5C5C500BDBDBD00BABABA00CFCF
        CF00D8D8D800D1D1D1009D9D9D00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00DCC4B400F8F6F200FBDDAC00F8D2
        9B00FBE8B900BE9D8F00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00B5B5B500E2E2E200C0C0C000B6B6
        B600C7C7C70093939300FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00CAAD9600DDBFA900DCB8
        A800CAAD9600FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF009D9D9D00B0B0B000AFAF
        AF009D9D9D00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
      NumGlyphs = 2
    end
    object JvSpeedButton1: TJvSpeedButton
      Left = 0
      Top = 0
      Width = 15
      Height = 19
      Action = SearchCloseAction
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
      HotTrackFont.Charset = DEFAULT_CHARSET
      HotTrackFont.Color = clWindowText
      HotTrackFont.Height = -11
      HotTrackFont.Name = 'Tahoma'
      HotTrackFont.Style = []
      Margin = 2
      NumGlyphs = 2
    end
    object SpeedButton3: TSpeedButton
      Left = 279
      Top = 0
      Width = 21
      Height = 21
      Action = SearchClearAction
      Flat = True
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF007171710071717100FF00FF00FF00FF00FF00FF007171
        710071717100FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF0071717100DBDBDB00DBDBDB0071717100FF00FF0071717100DBDB
        DB00DBDBDB0071717100FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF0071717100DBDBDB00DBDBDB00DBDBDB0071717100DBDBDB00DBDB
        DB00DBDBDB0071717100FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF0071717100DBDBDB00DBDBDB00DBDBDB00DBDBDB00DBDB
        DB0078787800FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF0071717100DBDBDB00DBDBDB00DBDBDB007171
        7100FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF0071717100DBDBDB00DBDBDB00DBDBDB00DBDBDB00DBDB
        DB0071717100FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF0071717100DBDBDB00DBDBDB00DBDBDB0071717100DBDBDB00DBDB
        DB00DBDBDB0071717100FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF0071717100DBDBDB00DBDBDB0071717100FF00FF0071717100DBDB
        DB00DBDBDB0071717100FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF007171710071717100FF00FF00FF00FF00FF00FF007171
        710071717100FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
    end
    object CaseSensitiveCheckBox: TCheckBox
      Left = 364
      Top = 2
      Width = 101
      Height = 17
      Caption = ' Case sensitive'
      TabOrder = 0
    end
    object WholeWordsCheckBox: TCheckBox
      Left = 460
      Top = 2
      Width = 120
      Height = 17
      Caption = ' Whole words only'
      TabOrder = 1
    end
    object SearchForEdit: TBCEdit
      Left = 77
      Top = 0
      Width = 200
      Height = 21
      TabOrder = 2
      OnChange = SearchForEditChange
      OnlyNumbers = False
      NumbersWithDots = False
      NumbersWithSpots = False
      EditColor = clInfoBk
      NumbersAllowNegative = False
    end
  end
  object DocumentPanel: TPanel
    Left = 0
    Top = 44
    Width = 451
    Height = 34
    Align = alClient
    BevelOuter = bvNone
    UseDockManager = False
    Padding.Top = 2
    TabOrder = 1
    ExplicitWidth = 988
    ExplicitHeight = 185
    object PageControl: TBCPageControl
      Left = 0
      Top = 2
      Width = 988
      Height = 183
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
      TabDragDrop = True
      HoldShiftToDragDrop = False
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
    ExplicitTop = 232
    ExplicitWidth = 988
  end
  object ToolbarPanel: TPanel
    Left = 0
    Top = 0
    Width = 451
    Height = 23
    Align = alTop
    BevelOuter = bvNone
    DoubleBuffered = False
    ParentColor = True
    ParentDoubleBuffered = False
    PopupMenu = ToolbarPopupMenu
    TabOrder = 3
    ExplicitWidth = 988
    object ExecuteToolbarPanel: TPanel
      Left = 0
      Top = 0
      Width = 59
      Height = 23
      Align = alLeft
      BevelOuter = bvNone
      ParentColor = True
      TabOrder = 0
      object Toolbar1Bevel: TBevel
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
        ExplicitLeft = 65
        ExplicitTop = 4
        ExplicitHeight = 35
      end
      object ExecuteToolBar: TBCToolBar
        Left = 0
        Top = 0
        Width = 46
        Height = 23
        Align = alLeft
        Caption = 'ExecuteToolBar'
        DoubleBuffered = False
        ParentDoubleBuffered = False
        TabOrder = 0
        object ExecuteToolButton: TToolButton
          Left = 0
          Top = 0
        end
        object ExecuteScriptToolButton: TToolButton
          Left = 23
          Top = 0
        end
      end
    end
    object TransactionToolbarPanel: TPanel
      Left = 59
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
        ExplicitLeft = 127
        ExplicitTop = 25
        ExplicitHeight = 20
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
      Left = 120
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
        ExplicitLeft = 28
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
      Left = 157
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
        ExplicitLeft = 197
        ExplicitTop = 25
        ExplicitHeight = 20
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
      Left = 194
      Top = 0
      Width = 185
      Height = 23
      Align = alLeft
      BevelOuter = bvNone
      ParentColor = True
      TabOrder = 4
      object Bevel5: TBevel
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
        ExplicitLeft = 93
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
        ExplicitLeft = 386
        ExplicitTop = 27
        ExplicitHeight = 20
      end
      object StandardToolBar: TBCToolBar
        Left = 0
        Top = 0
        Width = 92
        Height = 23
        Align = alLeft
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
        object FileCloseToolButton: TToolButton
          Left = 46
          Top = 0
          Action = MainForm.FileCloseAction
        end
        object FileCloseAllToolButton: TToolButton
          Left = 69
          Top = 0
          Action = MainForm.FileCloseAllAction
        end
      end
      object SaveToolBar: TBCToolBar
        Left = 104
        Top = 0
        Width = 69
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
      end
    end
    object PrintToolbarPanel: TPanel
      Left = 379
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
        ExplicitLeft = 440
        ExplicitTop = 27
        ExplicitHeight = 20
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
      Left = 439
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
        ExplicitLeft = 498
        ExplicitTop = 31
        ExplicitHeight = 20
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
      Left = 499
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
        ExplicitLeft = 556
        ExplicitTop = 27
        ExplicitHeight = 20
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
      Left = 559
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
        ExplicitLeft = 23
        ExplicitTop = 4
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
      Left = 596
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
        ExplicitLeft = 645
        ExplicitTop = 25
        ExplicitHeight = 20
      end
      object UndoRedoToolBar: TBCToolBar
        Left = 0
        Top = 0
        Width = 46
        Height = 23
        Align = alLeft
        AutoSize = True
        Caption = 'BCToolBar2'
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
      Left = 656
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
        ExplicitLeft = 763
        ExplicitTop = 25
        ExplicitHeight = 20
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
      Left = 739
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
        ExplicitLeft = 94
        ExplicitTop = 4
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
      Left = 845
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
  object OpenDialog: TOpenDialog
    Options = [ofAllowMultiSelect, ofPathMustExist, ofFileMustExist, ofEnableSizing]
    Title = 'Open'
    Left = 20
    Top = 60
  end
  object SaveDialog: TSaveDialog
    DefaultExt = '.sql'
    Filter = 'SQL files (*.sql)|*.sql'
    Options = [ofOverwritePrompt, ofCreatePrompt, ofEnableSizing]
    Title = 'Save'
    Left = 20
    Top = 108
  end
  object PrintDialog: TPrintDialog
    Options = [poPageNums]
    Left = 86
    Top = 113
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
  object SearchActionList: TActionList
    Left = 166
    Top = 118
    object SearchCloseAction: TAction
      Hint = 'Close Search'
      OnExecute = SearchCloseActionExecute
    end
    object SearchFindNextAction: TAction
      Enabled = False
      Hint = 'Find the next matching text'
      ShortCut = 114
      OnExecute = SearchFindNextActionExecute
    end
    object SearchFindPreviousAction: TAction
      Enabled = False
      Hint = 'Find the previous matching text'
      ShortCut = 8306
      OnExecute = SearchFindPreviousActionExecute
    end
    object SearchClearAction: TAction
      OnExecute = SearchClearActionExecute
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
    KeyAttri.Style = []
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
  object EditorPopupMenu: TBCPopupMenu
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
      object ToggleBookmark0MenuItem: TMenuItem
        Caption = 'Bookmark &0'
        ImageIndex = 61
        ShortCut = 24624
        OnClick = ToggleBookmark0MenuItemClick
      end
      object ToggleBookmark1MenuItem: TMenuItem
        Tag = 1
        Caption = 'Bookmark &1'
        ImageIndex = 62
        ShortCut = 24625
        OnClick = ToggleBookmark0MenuItemClick
      end
      object ToggleBookmark2MenuItem: TMenuItem
        Tag = 2
        Caption = 'Bookmark &2'
        ImageIndex = 63
        ShortCut = 24626
        OnClick = ToggleBookmark0MenuItemClick
      end
      object ToggleBookmark3MenuItem: TMenuItem
        Tag = 3
        Caption = 'Bookmark &3'
        ImageIndex = 64
        ShortCut = 24627
        OnClick = ToggleBookmark0MenuItemClick
      end
      object ToggleBookmark4MenuItem: TMenuItem
        Tag = 4
        Caption = 'Bookmark &4'
        ImageIndex = 65
        ShortCut = 24628
        OnClick = ToggleBookmark0MenuItemClick
      end
      object ToggleBookmark5MenuItem: TMenuItem
        Tag = 5
        Caption = 'Bookmark &5'
        ImageIndex = 66
        ShortCut = 24629
        OnClick = ToggleBookmark0MenuItemClick
      end
      object ToggleBookmark6MenuItem: TMenuItem
        Tag = 6
        Caption = 'Bookmark &6'
        ImageIndex = 67
        ShortCut = 24630
        OnClick = ToggleBookmark0MenuItemClick
      end
      object ToggleBookmark7MenuItem: TMenuItem
        Tag = 7
        Caption = 'Bookmark &7'
        ImageIndex = 68
        ShortCut = 24631
        OnClick = ToggleBookmark0MenuItemClick
      end
      object ToggleBookmark8MenuItem: TMenuItem
        Tag = 8
        Caption = 'Bookmark &8'
        ImageIndex = 69
        ShortCut = 24632
        OnClick = ToggleBookmark0MenuItemClick
      end
      object ToggleBookmark9MenuItem: TMenuItem
        Tag = 9
        Caption = 'Bookmark &9'
        ImageIndex = 70
        ShortCut = 24633
        OnClick = ToggleBookmark0MenuItemClick
      end
    end
    object GotoBookmarksMenuItem: TMenuItem
      Caption = '&Goto Bookmarks'
      SubMenuImages = BookmarkImagesList
      object GotoBookmark0MenuItem: TMenuItem
        Caption = 'Bookmark &0'
        ImageIndex = 61
        ShortCut = 16432
        OnClick = GotoBookmark0MenuItemClick
      end
      object GotoBookmark1MenuItem: TMenuItem
        Tag = 1
        Caption = 'Bookmark &1'
        ImageIndex = 62
        ShortCut = 16433
        OnClick = GotoBookmark0MenuItemClick
      end
      object GotoBookmark2MenuItem: TMenuItem
        Tag = 2
        Caption = 'Bookmark &2'
        ImageIndex = 63
        ShortCut = 16434
        OnClick = GotoBookmark0MenuItemClick
      end
      object GotoBookmark3MenuItem: TMenuItem
        Tag = 3
        Caption = 'Bookmark &3'
        ImageIndex = 64
        ShortCut = 16435
        OnClick = GotoBookmark0MenuItemClick
      end
      object GotoBookmark4MenuItem: TMenuItem
        Tag = 4
        Caption = 'Bookmark &4'
        ImageIndex = 65
        ShortCut = 16436
        OnClick = GotoBookmark0MenuItemClick
      end
      object GotoBookmark5MenuItem: TMenuItem
        Tag = 5
        Caption = 'Bookmark &5'
        ImageIndex = 66
        ShortCut = 16437
        OnClick = GotoBookmark0MenuItemClick
      end
      object GotoBookmark6MenuItem: TMenuItem
        Tag = 6
        Caption = 'Bookmark &6'
        ImageIndex = 67
        ShortCut = 16438
        OnClick = GotoBookmark0MenuItemClick
      end
      object GotoBookmark7MenuItem: TMenuItem
        Tag = 7
        Caption = 'Bookmark &7'
        ImageIndex = 68
        ShortCut = 16439
        OnClick = GotoBookmark0MenuItemClick
      end
      object GotoBookmark8MenuItem: TMenuItem
        Tag = 8
        Caption = 'Bookmark &8'
        ImageIndex = 69
        ShortCut = 16440
        OnClick = GotoBookmark0MenuItemClick
      end
      object GotoBookmark9MenuItem: TMenuItem
        Tag = 9
        Caption = 'Bookmark &9'
        ImageIndex = 70
        ShortCut = 16441
        OnClick = GotoBookmark0MenuItemClick
      end
    end
    object ClearBookmarksMenuItem: TMenuItem
      Action = MainForm.ClearBookmarksAction
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
    DataTypeMap = <>
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
      end
      item
        DataType = ftUnknown
        Name = 'p_owner'
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
    DataTypeMap = <>
    Left = 166
    Top = 172
  end
  object ErrorsQuery: TOraQuery
    DataTypeMap = <>
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
      end>
  end
  object ImageList: TImageList
    ShareImages = True
    Left = 18
    Top = 162
    Bitmap = {
      494C010106003800C80310001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
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
      7100000000000000000000000000000000000000000000000000535A6200655F
      6E00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000071717100FFFFFF00FFFFFF00717171000000000071717100FFFFFF00FFFF
      FF007171710000000000000000000000000000000000000000003F8CD100196D
      C900846F7A000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000071717100FFFFFF00FFFFFF00FFFFFF0071717100FFFFFF00FFFFFF00FFFF
      FF0071717100000000000000000000000000000000000000000000000000319F
      FF00186AC4008A70790000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000071717100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF007878
      7800000000000000000000000000000000000000000000000000000000000000
      00002D9EFF00166AC200786C770000000000925D5A00C9A39100C28F88000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000071717100FFFFFF00FFFFFF00FFFFFF00717171000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000004FB0FF0076727700BB9C8200FEFCCF00FEFCCE00FFFFEA00A074
      6F00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000071717100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF007171
      7100000000000000000000000000000000000000000000000000000000000000
      0000000000008B98B100E5B69200FFF4BB00FFFFD400FFFFDA00FFFFF400F8F7
      DA00B7847E000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000071717100FFFFFF00FFFFFF00FFFFFF0071717100FFFFFF00FFFFFF00FFFF
      FF00717171000000000000000000000000000000000000000000000000000000
      000000000000B67F7600F0CB9200F7D79F00FFFFD300FFFFEA00FFFFFE00F8F7
      DA00B7847E000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000071717100FFFFFF00FFFFFF00717171000000000071717100FFFFFF00FFFF
      FF00717171000000000000000000000000000000000000000000000000000000
      000000000000DCBA9E00F3CA8E00EEB67800FEFAC600FFFFDD00FFFFE000FFFF
      D400B69782000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000007171710071717100000000000000000000000000717171007171
      7100000000000000000000000000000000000000000000000000000000000000
      000000000000BB898000F3D9A700F4CB9500F2CA9000FBEBBA00FFFFCC00F6F2
      C400B88B80000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000D1B4A000F6F3EE00FAD39700F6C58300FAE1A600AC86
      7600000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000BB987E00D3AD9300D1A59200BB987E000000
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
      0000000000000000000000000000A3666800A3666800A3666800A3666800A467
      6900A4676900A4676900A4676900A46769000000000000000000C2A6A400C2A6
      A400C2A6A400C2A6A400C2A6A400C2A6A400C2A6A400C2A6A400C2A6A400C2A6
      A400C2A6A400C2A6A40000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000009F646600F7E5C600F2D9B100EED1A100EECC
      9300F0C78700EFC58000F7D08300A46769000000000000000000C2A6A400FEFC
      FB00FEFCFB00FEFCFB00FEFCFB00FEFCFB00FEFCFB00FEFCFB00FEFCFB00FEFC
      FB00FEFCFB00C2A6A40000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000008E595B00D8CAB700D3C0A700D1B89A00DCBD
      9700E6C29200E7BF8400F0C68100A46769000000000000000000C2A6A400FEFC
      FB00FEFCFB00FEFCFB00FEFCFB00FEFCFB00FEFCFB00FEFCFB00FEFCFB00FEFC
      FB00FEFCFB00C2A6A40000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000076575100A19C93009E928400A0917F00C0A9
      8C00DABC9500E6C19000F0C98700A46769000000000000000000C2A6A400FEFA
      F500FEFCFB00FEFAF500FEFAF500FEFCFB00FEFAF500FEFAF500FEFCFB00FEFA
      F500FEFAF500C2A6A40000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000005CFF0056413B006B696800005CFF00736A5F009688
      7600C0A98C00DDBD9600EECC9300A46769000000000000000000C2A6A400FEFA
      F500FEFAF500FEFAF500FEFAF500FEFAF500FEFAF500FEFAF500FEFAF500FEFA
      F500FEFAF500C2A6A40000000000000000000000000000000000000000000000
      0000717171007171710000000000000000000000000071717100717171000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000717171007171710000000000000000000000000071717100717171000000
      000000000000000000000000000000000000A5686A00A6696A00A4686900A066
      67008F5B5B006D454500005CFF00005CFF00005CFF00005CFF005B5652007269
      5F00A0927F00D1B69800F2D3A300A36668000000000000000000C2A6A400FEF7
      F000FEF7F000FEF7F000FEF7F000FEF7F000FEF7F000FEF7F000FEF7F000FEF7
      F000FEF7F000C2A6A40000000000000000000000000000000000000000007171
      7100DBDBDB00DBDBDB00717171000000000071717100DBDBDB00DBDBDB007171
      7100000000000000000000000000000000000000000000000000000000007171
      7100FFFFFF00FFFFFF00717171000000000071717100FFFFFF00FFFFFF007171
      710000000000000000000000000000000000A4676900FCE6C100EECFA600E7C5
      9600005CFF00005CFF00005CFF00005CFF00005CFF00005CFF00005CFF00005C
      FF009F928400DAC9AD00EAD8B200A36668000000000000000000C2A6A400FEF7
      F000FEF7F000FEF7F000FEF7F000FEF3E900FEF7F000FEF7F000FEF3E900FEF7
      F000FEF7F000C2A6A40000000000000000000000000000000000000000007171
      7100DBDBDB00DBDBDB00DBDBDB0071717100DBDBDB00DBDBDB00DBDBDB007171
      7100000000000000000000000000000000000000000000000000000000007171
      7100FFFFFF00FFFFFF00FFFFFF0071717100FFFFFF00FFFFFF00FFFFFF007171
      710000000000000000000000000000000000A5686A00FEEED300F0D5B500EACB
      A300CEAD8300005CFF00005CFF005541330077777700005CFF00005CFF006B69
      6700A19990008C5B51009D665B00A36668000000000000000000C2A6A400FEF3
      E900FEF3E900FEF3E900FEF3E900FEF3E900FEF3E900FEF3E900FEF3E900FEF3
      E900FEF3E900C2A6A40000000000000000000000000000000000000000000000
      000071717100DBDBDB00DBDBDB00DBDBDB00DBDBDB00DBDBDB00787878000000
      0000000000000000000000000000000000000000000000000000000000000000
      000071717100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00787878000000
      000000000000000000000000000000000000A7756B00FFF7E300F3DDC400EAD1
      B100D0B59100005CFF00005CFF005441320060606000005CFF00005CFF007676
      7600A4A19F008C5B5100DA904400BD7247000000000000000000C2A6A400FFF0
      E200FFF0E200FEF3E900FFEEDE00FEF3E900FFEEDE00FEF3E900FFEEDE00FEF3
      E900FFEEDE00C2A6A40000000000000000000000000000000000000000000000
      00000000000071717100DBDBDB00DBDBDB00DBDBDB0071717100000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000071717100FFFFFF00FFFFFF00FFFFFF0071717100000000000000
      000000000000000000000000000000000000A7756B00FFFEF700F7E7D400EFD9
      C100005CFF00005CFF00005CFF00005CFF00005CFF00005CFF00005CFF00005C
      FF00C0BABA0095605600C5846000000000000000000000000000C2A6A400FEF3
      E900FFEEDE00FFF0E200FEF3E900FFEEDE00FFF0E200DDCFC200DDCFC200DDCF
      C200DDCFC200C2A6A40000000000000000000000000000000000000000000000
      000071717100DBDBDB00DBDBDB00DBDBDB00DBDBDB00DBDBDB00717171000000
      0000000000000000000000000000000000000000000000000000000000000000
      000071717100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00717171000000
      000000000000000000000000000000000000BC826800FFFFFF00FBEFE500F6E5
      D300EED9C000DDC4A600005CFF00005CFF00005CFF00005CFF00D1926D00D192
      6D00D1926D009D665B0000000000000000000000000000000000C2A6A400FFEE
      DE00FFEEDE00FFEEDE00FFEEDE00FFEEDE00FFEEDE00C3B4A800C3B4A800C3B4
      A800C3B4A800C2A6A40000000000000000000000000000000000000000007171
      7100DBDBDB00DBDBDB00DBDBDB0071717100DBDBDB00DBDBDB00DBDBDB007171
      7100000000000000000000000000000000000000000000000000000000007171
      7100FFFFFF00FFFFFF00FFFFFF0071717100FFFFFF00FFFFFF00FFFFFF007171
      710000000000000000000000000000000000BC826800FFFFFF00FFFBF700FAF0
      E500F6E5D100EFD9C000005CFF00CFB692008C585A00005CFF00000000000000
      0000000000000000000000000000000000000000000000000000C2A6A400FFEE
      DE00FFEAD700FFEEDE00FFEAD700FFEAD700FFEEDE00B0A29600B0A29600B0A2
      9600B0A29600C2A6A40000000000000000000000000000000000000000007171
      7100DBDBDB00DBDBDB00717171000000000071717100DBDBDB00DBDBDB007171
      7100000000000000000000000000000000000000000000000000000000007171
      7100FFFFFF00FFFFFF00717171000000000071717100FFFFFF00FFFFFF007171
      710000000000000000000000000000000000D1926D00FFFFFF00FFFFFF00FEFB
      F700FBEFE500F7E5D100A1695D00A0685C009E63650000000000000000000000
      0000000000000000000000000000000000000000000000000000C2A6A400FFEA
      D700FFEAD700FFEAD700FFEAD700FFEAD700C9B9AC00FEFAF500FEF7F000E6DA
      D900C2A6A4000000000000000000000000000000000000000000000000000000
      0000717171007171710000000000000000000000000071717100717171000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000717171007171710000000000000000000000000071717100717171000000
      000000000000000000000000000000000000DA9D7500FFFFFF00FFFFFF00FFFF
      FF00FFFEFC00E5D3CC00A56B5F00CF834300AF6A540000000000000000000000
      0000000000000000000000000000000000000000000000000000C2A6A400FFEA
      D700FFE6D000FFEAD700FFE6D000FFEAD700C5B5A900FEFAF500DDCFC200C2A6
      A400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E7AB7900FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00E1D5D900A56B5F00D48E5A000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C2A6A400FFE6
      D000FFE6D000FFE6D000FFE6D000FFE6D000C9B9AC00DDCFC200C2A6A4000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E7AB7900D1926D00D1926D00D192
      6D00D1926D00D1926D00A56B5F00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C2A6A400C2A6
      A400C2A6A400C2A6A400C2A6A400C2A6A400C2A6A400C2A6A400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000200000000100010000000000000100000000000000000000
      000000000000000000000000FFFFFF00FFFFFFFF00000000FFFFFFFF00000000
      FFFFFFFF00000000F9CFCFFF00000000F087C7FF00000000F007E3FF00000000
      F80FF11F00000000FC1FF80F00000000F80FF80700000000F007F80700000000
      F087F80700000000F9CFF80700000000FFFFFC0F00000000FFFFFE1F00000000
      FFFFFFFF00000000FFFFFFFF00000000FE00C003FFFFFFFFFE00C003FFFFFFFF
      FE00C003FFFFFFFFFE00C003FFFFFFFFFC00C003F39FF39F0000C003E10FE10F
      0000C003E00FE00F0000C003F01FF01F0000C003F83FF83F0001C003F01FF01F
      0003C003E00FE00F003FC003E10FE10F007FC007F39FF39F007FC00FFFFFFFFF
      00FFC01FFFFFFFFF01FFC03FFFFFFFFF00000000000000000000000000000000
      000000000000}
  end
  object BookmarkImagesList: TBCImageList
    ShareImages = True
    Left = 270
    Top = 230
    Bitmap = {
      494C01010A003800880310001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000003000000001002000000000000030
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000434141004341
      4100434141004341410043414100434141004341410043414100434141004341
      4100434141004341410000000000000000000000000000000000434141004341
      4100434141004341410043414100434141004341410043414100434141004341
      4100434141004341410000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000004D4A4A006D6767007367
      6700776666007D66640081646400866464008A6462008C6462008C6462008C64
      62008C6462008C6462004341410000000000000000004D4A4A006D6767007367
      6700776666007D66640081646400866464008A6462008C6462008C6462008C64
      62008C6462008C64620043414100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000004D4A4A00878484008981
      810090818100987F7F00A0807D00A77E7D00B07B7B00B77B7900BB7B7900BB7B
      7900BB7B79008C6462004341410000000000000000004D4A4A00878484008981
      810090818100987F7F00A0807D00A77E7D00B07B7B00B77B7900BB7B7900BB7B
      7900BB7B79008C64620043414100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000004D4A4A008C8C8C008886
      86008982820090818000FFFFFF00FFFFFF00FFFFFF00FFFFFF00D7B7B600BB7B
      7900BB7B79008C6462004341410000000000000000004D4A4A008C8C8C008886
      860089828200C2BABA00FFFFFF00FFFFFF00FFFFFF00D3B7B700B67B7A00BB7B
      7900BB7B79008C64620043414100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000004D4A4A009A9A9A009090
      900089888800F0EFEF00FFFFFF00C6BABA009E7E7E00F3EEEE00FFFFFF00CAA0
      9F00BB7B79008C6462004341410000000000000000004D4A4A009A9A9A009090
      900089888800888181008F81800097808000E6DEDE00FFFFFF00D2B7B700B57B
      7A00BB7B79008C64620043414100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000004D4A4A00ADADAD009D9D
      9D0092919100FFFFFF00FFFFFF008E81800096808000E6DFDF00FFFFFF00D2B7
      B600B47B7A008C6462004341410000000000000000004D4A4A00ADADAD009D9D
      9D009291910088888800878181008E81800096808000FFFFFF00F3EEEE00AC7B
      7A00B47B7A008C64620043414100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000004D4A4A00C1C0C000ABAA
      AA009C9C9C00D4D3D300FFFFFF00E1DFDF00FFFFFF00FFFFFF00FFFFFF00A37F
      7D00AB7E7D00876463004341410000000000000000004D4A4A00C1C0C000ABAA
      AA009C9C9C00B0AFAF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BDA3
      A200AB7E7D008764630043414100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000004D4A4A00CECECE00B7B6
      B600A5A5A500B6B6B600FFFFFF00FFFFFF00FFFFFF00FFFFFF00B1A4A400997F
      7F00A17F7D00826564004341410000000000000000004D4A4A00CECECE00B7B6
      B600A5A5A500F2F2F200FFFFFF00BEBEBE0087828200F0EFEF00FFFFFF00B6A3
      A300A17F7D008265640043414100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000004D4A4A00D7D5D500C0C0
      C000B1AFAF00E8E8E800FFFFFF00D4D4D40089898900EFEFEF00FFFFFF009281
      8100987F7F007B6664004341410000000000000000004D4A4A00D7D5D500C0C0
      C000B1AFAF00FFFFFF00FFFFFF009191910089898900EFEFEF00FFFFFF009281
      8100987F7F007B66640043414100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000004D4A4A00DCDADA00CAC9
      C900BDBDBD00ECEBEB00FFFFFF00C9C9C90095959500FFFFFF00FFFFFF00AAA4
      A40090818100766666004341410000000000000000004D4A4A00DCDADA00CAC9
      C900BDBDBD00ECEBEB00FFFFFF00C9C9C900B3B3B300FFFFFF00F0EFEF008981
      8100908181007666660043414100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000004D4A4A00E0E0E000D1D0
      D000C5C4C400BFBDBD00F5F5F500FFFFFF00FFFFFF00FFFFFF00C0C0C0008787
      870088818100706766004341410000000000000000004D4A4A00E0E0E000D1D0
      D000C5C4C400BFBDBD00F5F5F500FFFFFF00FFFFFF00FFFFFF008C8C8C008787
      8700888181007067660043414100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000004D4A4A00E1E1E100DEDE
      DE00D8D7D700D3D1D100CACACA00BFBFBF00B4B4B400A4A4A400979797008E8E
      8E00878787006B6767004341410000000000000000004D4A4A00E1E1E100DEDE
      DE00D8D7D700D3D1D100CACACA00BFBFBF00B4B4B400A4A4A400979797008E8E
      8E00878787006B67670043414100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000004D4A4A00D8D7D700E1E1
      E100E2E2E200E0E0E000DADADA00D0CFCF00C0BFBF00B0ADAD009F9F9F009695
      95008E8E8E006B6B6B004341410000000000000000004D4A4A00D8D7D700E1E1
      E100E2E2E200E0E0E000DADADA00D0CFCF00C0BFBF00B0ADAD009F9F9F009695
      95008E8E8E006B6B6B0043414100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000005B5A5A006A69
      69006C6B6B006C6B6B0068676700636262005B5A5A00535353004F4E4E004E4D
      4D004D4C4C004D4C4C00000000000000000000000000000000005B5A5A006A69
      69006C6B6B006C6B6B0068676700636262005B5A5A00535353004F4E4E004E4D
      4D004D4C4C004D4C4C0000000000000000000000000000000000000000000000
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
      0000000000000000000000000000000000000000000000000000434141004341
      4100434141004341410043414100434141004341410043414100434141004341
      4100434141004341410000000000000000000000000000000000434141004341
      4100434141004341410043414100434141004341410043414100434141004341
      4100434141004341410000000000000000000000000000000000434141004341
      4100434141004341410043414100434141004341410043414100434141004341
      4100434141004341410000000000000000000000000000000000434141004341
      4100434141004341410043414100434141004341410043414100434141004341
      410043414100434141000000000000000000000000004D4A4A006D6767007367
      6700776666007D66640081646400866464008A6462008C6462008C6462008C64
      62008C6462008C6462004341410000000000000000004D4A4A006D6767007367
      6700776666007D66640081646400866464008A6462008C6462008C6462008C64
      62008C6462008C6462004341410000000000000000004D4A4A006D6767007367
      6700776666007D66640081646400866464008A6462008C6462008C6462008C64
      62008C6462008C6462004341410000000000000000004D4A4A006D6767007367
      6700776666007D66640081646400866464008A6462008C6462008C6462008C64
      62008C6462008C6462004341410000000000000000004D4A4A00878484008981
      810090818100987F7F00A0807D00A77E7D00B07B7B00B77B7900BB7B7900BB7B
      7900BB7B79008C6462004341410000000000000000004D4A4A00878484008981
      810090818100987F7F00A0807D00A77E7D00B07B7B00B77B7900BB7B7900BB7B
      7900BB7B79008C6462004341410000000000000000004D4A4A00878484008981
      810090818100987F7F00A0807D00A77E7D00B07B7B00B77B7900BB7B7900BB7B
      7900BB7B79008C6462004341410000000000000000004D4A4A00878484008981
      810090818100987F7F00A0807D00A77E7D00B07B7B00B77B7900BB7B7900BB7B
      7900BB7B79008C6462004341410000000000000000004D4A4A008C8C8C008886
      86008982820090818000987F7F009F807E00E8DEDE00FFFFFF00D7B7B600BB7B
      7900BB7B79008C6462004341410000000000000000004D4A4A008C8C8C008886
      8600E1DFDF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00AF7B7B00B67B7A00BB7B
      7900BB7B79008C6462004341410000000000000000004D4A4A008C8C8C008886
      86008982820090818000D7CDCD00FFFFFF00FFFFFF00FFFFFF00CBA09F00BB7B
      7900BB7B79008C6462004341410000000000000000004D4A4A008C8C8C008886
      860089828200C2BABA00FFFFFF00FFFFFF00A67E7D00AF7B7B00B67B7A00BB7B
      7900BB7B79008C6462004341410000000000000000004D4A4A009A9A9A009090
      900089888800888181008F81800097808000E6DEDE00FFFFFF00D2B7B700B57B
      7A00BB7B79008C6462004341410000000000000000004D4A4A009A9A9A009090
      9000E1E1E100A9A4A4008F818000B4A4A400FFFFFF00F3EEEE00AD7B7B00B57B
      7A00BB7B79008C6462004341410000000000000000004D4A4A009A9A9A009090
      900089888800BEBABA00FFFFFF00D6CDCD009E7E7E00FFFFFF00FFFFFF00B57B
      7A00BB7B79008C6462004341410000000000000000004D4A4A009A9A9A009090
      90008988880088818100E3DFDF00FFFFFF00D9CDCD00A57E7D00AD7B7B00B57B
      7A00BB7B79008C6462004341410000000000000000004D4A4A00ADADAD009D9D
      9D0092919100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00DFCB
      CB00B47B7A008C6462004341410000000000000000004D4A4A00ADADAD009D9D
      9D009291910088888800878181008E818000F1EFEF00FFFFFF00BEA2A200AC7B
      7A00B47B7A008C6462004341410000000000000000004D4A4A00ADADAD009D9D
      9D0092919100E1E1E100FFFFFF00C1BABA0096808000E6DFDF00FFFFFF00D2B7
      B600B47B7A008C6462004341410000000000000000004D4A4A00ADADAD009D9D
      9D009291910088888800A9A4A400FFFFFF00FFFFFF009D7F7F00A47E7D00AC7B
      7A00B47B7A008C6462004341410000000000000000004D4A4A00C1C0C000ABAA
      AA009C9C9C00F1F1F100E1E1E10087818100E2DFDF00FFFFFF00C9B9B900A37F
      7D00AB7E7D00876463004341410000000000000000004D4A4A00C1C0C000ABAA
      AA009C9C9C00918F8F0087878700A9A4A400FFFFFF00FFFFFF009C7F7F00A37F
      7D00AB7E7D00876463004341410000000000000000004D4A4A00C1C0C000ABAA
      AA009C9C9C00F1F1F100FFFFFF00A9A4A4008C828100F1EFEF00FFFFFF00BDA3
      A200AB7E7D00876463004341410000000000000000004D4A4A00C1C0C000ABAA
      AA009C9C9C00918F8F0087878700E1DFDF00FFFFFF00D6CDCD009C7F7F00A37F
      7D00AB7E7D00876463004341410000000000000000004D4A4A00CECECE00B7B6
      B600A5A5A500B6B6B600FFFFFF00BEBEBE00E1DFDF00FFFFFF00C3BABA00997F
      7F00A17F7D00826564004341410000000000000000004D4A4A00CECECE00B7B6
      B600CECECE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0BABA0092818100997F
      7F00A17F7D00826564004341410000000000000000004D4A4A00CECECE00B7B6
      B600A5A5A500E5E5E500FFFFFF00FFFFFF00FFFFFF00FFFFFF00D4CECE00997F
      7F00A17F7D00826564004341410000000000000000004D4A4A00CECECE00B7B6
      B600A5A5A5009A99990090909000A9A9A900FFFFFF00FFFFFF0092818100997F
      7F00A17F7D00826564004341410000000000000000004D4A4A00D7D5D500C0C0
      C000B1AFAF00A3A3A300D7D7D700FFFFFF00E1E1E100FFFFFF00BEBABA009281
      8100987F7F007B6664004341410000000000000000004D4A4A00D7D5D500C0C0
      C000D4D3D300FFFFFF00E5E5E500919191008989890086838300898181009281
      8100987F7F007B6664004341410000000000000000004D4A4A00D7D5D500C0C0
      C000B1AFAF00DBDBDB00FFFFFF00D4D4D4008989890086838300898181009281
      8100987F7F007B6664004341410000000000000000004D4A4A00D7D5D500C0C0
      C000B1AFAF00A3A3A3009998980091919100E1E1E100FFFFFF00D1CECE009281
      8100987F7F007B6664004341410000000000000000004D4A4A00DCDADA00CAC9
      C900BDBDBD00B4B1B100A6A6A600E6E6E600FFFFFF00FFFFFF00BDBCBC008981
      810090818100766666004341410000000000000000004D4A4A00DCDADA00CAC9
      C900DBDBDB00FFFFFF00E8E8E8009D9C9C00959595008C8A8A00878484008981
      810090818100766666004341410000000000000000004D4A4A00DCDADA00CAC9
      C900BDBDBD00B4B1B100FFFFFF00FFFFFF00959595008C8A8A00878484008981
      810090818100766666004341410000000000000000004D4A4A00DCDADA00CAC9
      C900BDBDBD00B4B1B100A6A6A6009D9C9C00B3B3B300FFFFFF00FFFFFF008981
      810090818100766666004341410000000000000000004D4A4A00E0E0E000D1D0
      D000C5C4C400BFBDBD00B4B2B200ABAAAA00FFFFFF00FFFFFF00C0C0C0008787
      870088818100706766004341410000000000000000004D4A4A00E0E0E000D1D0
      D000DFDFDF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008C8C8C008787
      870088818100706766004341410000000000000000004D4A4A00E0E0E000D1D0
      D000C5C4C400BFBDBD00B4B2B200FFFFFF00FFFFFF00FFFFFF00E2E2E2008787
      870088818100706766004341410000000000000000004D4A4A00E0E0E000D1D0
      D000C5C4C400EFEEEE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00A9A9
      A90088818100706766004341410000000000000000004D4A4A00E1E1E100DEDE
      DE00D8D7D700D3D1D100CACACA00BFBFBF00B4B4B400A4A4A400979797008E8E
      8E00878787006B6767004341410000000000000000004D4A4A00E1E1E100DEDE
      DE00D8D7D700D3D1D100CACACA00BFBFBF00B4B4B400A4A4A400979797008E8E
      8E00878787006B6767004341410000000000000000004D4A4A00E1E1E100DEDE
      DE00D8D7D700D3D1D100CACACA00BFBFBF00B4B4B400A4A4A400979797008E8E
      8E00878787006B6767004341410000000000000000004D4A4A00E1E1E100DEDE
      DE00D8D7D700D3D1D100CACACA00BFBFBF00B4B4B400A4A4A400979797008E8E
      8E00878787006B6767004341410000000000000000004D4A4A00D8D7D700E1E1
      E100E2E2E200E0E0E000DADADA00D0CFCF00C0BFBF00B0ADAD009F9F9F009695
      95008E8E8E006B6B6B004341410000000000000000004D4A4A00D8D7D700E1E1
      E100E2E2E200E0E0E000DADADA00D0CFCF00C0BFBF00B0ADAD009F9F9F009695
      95008E8E8E006B6B6B004341410000000000000000004D4A4A00D8D7D700E1E1
      E100E2E2E200E0E0E000DADADA00D0CFCF00C0BFBF00B0ADAD009F9F9F009695
      95008E8E8E006B6B6B004341410000000000000000004D4A4A00D8D7D700E1E1
      E100E2E2E200E0E0E000DADADA00D0CFCF00C0BFBF00B0ADAD009F9F9F009695
      95008E8E8E006B6B6B00434141000000000000000000000000005B5A5A006A69
      69006C6B6B006C6B6B0068676700636262005B5A5A00535353004F4E4E004E4D
      4D004D4C4C004D4C4C00000000000000000000000000000000005B5A5A006A69
      69006C6B6B006C6B6B0068676700636262005B5A5A00535353004F4E4E004E4D
      4D004D4C4C004D4C4C00000000000000000000000000000000005B5A5A006A69
      69006C6B6B006C6B6B0068676700636262005B5A5A00535353004F4E4E004E4D
      4D004D4C4C004D4C4C00000000000000000000000000000000005B5A5A006A69
      69006C6B6B006C6B6B0068676700636262005B5A5A00535353004F4E4E004E4D
      4D004D4C4C004D4C4C0000000000000000000000000000000000000000000000
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
      0000000000000000000000000000000000000000000000000000434141004341
      4100434141004341410043414100434141004341410043414100434141004341
      4100434141004341410000000000000000000000000000000000434141004341
      4100434141004341410043414100434141004341410043414100434141004341
      4100434141004341410000000000000000000000000000000000434141004341
      4100434141004341410043414100434141004341410043414100434141004341
      4100434141004341410000000000000000000000000000000000434141004341
      4100434141004341410043414100434141004341410043414100434141004341
      410043414100434141000000000000000000000000004D4A4A006D6767007367
      6700776666007D66640081646400866464008A6462008C6462008C6462008C64
      62008C6462008C6462004341410000000000000000004D4A4A006D6767007367
      6700776666007D66640081646400866464008A6462008C6462008C6462008C64
      62008C6462008C6462004341410000000000000000004D4A4A006D6767007367
      6700776666007D66640081646400866464008A6462008C6462008C6462008C64
      62008C6462008C6462004341410000000000000000004D4A4A006D6767007367
      6700776666007D66640081646400866464008A6462008C6462008C6462008C64
      62008C6462008C6462004341410000000000000000004D4A4A00878484008981
      810090818100987F7F00A0807D00A77E7D00B07B7B00B77B7900BB7B7900BB7B
      7900BB7B79008C6462004341410000000000000000004D4A4A00878484008981
      810090818100987F7F00A0807D00A77E7D00B07B7B00B77B7900BB7B7900BB7B
      7900BB7B79008C6462004341410000000000000000004D4A4A00878484008981
      810090818100987F7F00A0807D00A77E7D00B07B7B00B77B7900BB7B7900BB7B
      7900BB7B79008C6462004341410000000000000000004D4A4A00878484008981
      810090818100987F7F00A0807D00A77E7D00B07B7B00B77B7900BB7B7900BB7B
      7900BB7B79008C6462004341410000000000000000004D4A4A008C8C8C008886
      86008982820090818000E5DFDF00FFFFFF00FFFFFF00FFFFFF00B67B7A00BB7B
      7900BB7B79008C6462004341410000000000000000004D4A4A008C8C8C008886
      860089828200C2BABA00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BB7B
      7900BB7B79008C6462004341410000000000000000004D4A4A008C8C8C008886
      860089828200D4CECD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E4CB
      CB00BB7B79008C6462004341410000000000000000004D4A4A008C8C8C008886
      860089828200F1EFEF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B67B7A00BB7B
      7900BB7B79008C6462004341410000000000000000004D4A4A009A9A9A009090
      900089888800D1CECE00FFFFFF00D6CDCD00B9A2A200FFFFFF00F4EEEE00B57B
      7A00BB7B79008C6462004341410000000000000000004D4A4A009A9A9A009090
      900089888800888181008F818000E5DFDF00FFFFFF00DCCDCC00AD7B7B00B57B
      7A00BB7B79008C6462004341410000000000000000004D4A4A009A9A9A009090
      900089888800D1CECE00FFFFFF00FFFFFF00D9CDCD00A57E7D00AD7B7B00B57B
      7A00BB7B79008C6462004341410000000000000000004D4A4A009A9A9A009090
      900089888800F0EFEF00AFA4A40097808000B9A2A200FFFFFF00FFFFFF00B57B
      7A00BB7B79008C6462004341410000000000000000004D4A4A00ADADAD009D9D
      9D0092919100F0F0F000FFFFFF00AEA4A40096808000F2EFEF00FFFFFF00C3A0
      9F00B47B7A008C6462004341410000000000000000004D4A4A00ADADAD009D9D
      9D00929191008888880087818100E2DFDF00FFFFFF00D9CDCD00A47E7D00AC7B
      7A00B47B7A008C6462004341410000000000000000004D4A4A00ADADAD009D9D
      9D009291910088888800E1DFDF00FFFFFF00FFFFFF00E6DFDF00A47E7D00AC7B
      7A00B47B7A008C6462004341410000000000000000004D4A4A00ADADAD009D9D
      9D009291910088888800878181008E81800096808000F2EFEF00FFFFFF00C3A0
      9F00B47B7A008C6462004341410000000000000000004D4A4A00C1C0C000ABAA
      AA009C9C9C00F1F1F100FFFFFF00A9A4A4008C828100F1EFEF00FFFFFF00BDA3
      A200AB7E7D00876463004341410000000000000000004D4A4A00C1C0C000ABAA
      AA009C9C9C00918F8F0087878700E1DFDF00FFFFFF00D6CDCD009C7F7F00A37F
      7D00AB7E7D00876463004341410000000000000000004D4A4A00C1C0C000ABAA
      AA009C9C9C00918F8F0087878700D0CECE00FFFFFF00FFFFFF00D8CDCD00A37F
      7D00AB7E7D00876463004341410000000000000000004D4A4A00C1C0C000ABAA
      AA009C9C9C00918F8F0087878700878181008C828100FFFFFF00FFFFFF00A37F
      7D00AB7E7D00876463004341410000000000000000004D4A4A00CECECE00B7B6
      B600A5A5A500F2F2F200FFFFFF00A9A9A90087828200F0EFEF00FFFFFF00B6A3
      A300A17F7D00826564004341410000000000000000004D4A4A00CECECE00B7B6
      B600A5A5A5009A99990090909000E1E1E100FFFFFF00D2CECE0092818100997F
      7F00A17F7D00826564004341410000000000000000004D4A4A00CECECE00B7B6
      B600A5A5A5009A9999009090900088888800D0CECE00FFFFFF00F1EFEF00997F
      7F00A17F7D00826564004341410000000000000000004D4A4A00CECECE00B7B6
      B600A5A5A5009A99990090909000FFFFFF00FFFFFF00E2DFDF0092818100997F
      7F00A17F7D00826564004341410000000000000000004D4A4A00D7D5D500C0C0
      C000B1AFAF00F3F3F300FFFFFF00B0B0B00089898900EFEFEF00FFFFFF00B1A4
      A400987F7F007B6664004341410000000000000000004D4A4A00D7D5D500C0C0
      C000B1AFAF00A3A3A30099989800E3E3E300FFFFFF00D0CFCF00898181009281
      8100987F7F007B6664004341410000000000000000004D4A4A00D7D5D500C0C0
      C000B1AFAF00A3A3A300999898009191910089898900FFFFFF00FFFFFF009281
      8100987F7F007B6664004341410000000000000000004D4A4A00D7D5D500C0C0
      C000B1AFAF00A3A3A3009998980091919100AAAAAA00FFFFFF00F0EFEF009281
      8100987F7F007B6664004341410000000000000000004D4A4A00DCDADA00CAC9
      C900BDBDBD00E2E1E100FFFFFF00D9D8D800B3B3B300FFFFFF00F0EFEF008981
      810090818100766666004341410000000000000000004D4A4A00DCDADA00CAC9
      C900BDBDBD00D6D4D400FFFFFF00FFFFFF00FFFFFF00D2D1D100878484008981
      810090818100766666004341410000000000000000004D4A4A00DCDADA00CAC9
      C900BDBDBD00D6D4D400CECECE009D9C9C00B3B3B300FFFFFF00F0EFEF008981
      810090818100766666004341410000000000000000004D4A4A00DCDADA00CAC9
      C900BDBDBD00E2E1E100CECECE009D9C9C00B3B3B300FFFFFF00FFFFFF008981
      810090818100766666004341410000000000000000004D4A4A00E0E0E000D1D0
      D000C5C4C400BFBDBD00ECEBEB00FFFFFF00FFFFFF00FFFFFF008C8C8C008787
      870088818100706766004341410000000000000000004D4A4A00E0E0E000D1D0
      D000C5C4C400BFBDBD00B4B2B200DEDEDE00FFFFFF00D6D6D6008C8C8C008787
      870088818100706766004341410000000000000000004D4A4A00E0E0E000D1D0
      D000C5C4C400DCDBDB00FFFFFF00FFFFFF00FFFFFF00FFFFFF00ACACAC008787
      870088818100706766004341410000000000000000004D4A4A00E0E0E000D1D0
      D000C5C4C400E6E5E500FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0C0008787
      870088818100706766004341410000000000000000004D4A4A00E1E1E100DEDE
      DE00D8D7D700D3D1D100CACACA00BFBFBF00B4B4B400A4A4A400979797008E8E
      8E00878787006B6767004341410000000000000000004D4A4A00E1E1E100DEDE
      DE00D8D7D700D3D1D100CACACA00BFBFBF00B4B4B400A4A4A400979797008E8E
      8E00878787006B6767004341410000000000000000004D4A4A00E1E1E100DEDE
      DE00D8D7D700D3D1D100CACACA00BFBFBF00B4B4B400A4A4A400979797008E8E
      8E00878787006B6767004341410000000000000000004D4A4A00E1E1E100DEDE
      DE00D8D7D700D3D1D100CACACA00BFBFBF00B4B4B400A4A4A400979797008E8E
      8E00878787006B6767004341410000000000000000004D4A4A00D8D7D700E1E1
      E100E2E2E200E0E0E000DADADA00D0CFCF00C0BFBF00B0ADAD009F9F9F009695
      95008E8E8E006B6B6B004341410000000000000000004D4A4A00D8D7D700E1E1
      E100E2E2E200E0E0E000DADADA00D0CFCF00C0BFBF00B0ADAD009F9F9F009695
      95008E8E8E006B6B6B004341410000000000000000004D4A4A00D8D7D700E1E1
      E100E2E2E200E0E0E000DADADA00D0CFCF00C0BFBF00B0ADAD009F9F9F009695
      95008E8E8E006B6B6B004341410000000000000000004D4A4A00D8D7D700E1E1
      E100E2E2E200E0E0E000DADADA00D0CFCF00C0BFBF00B0ADAD009F9F9F009695
      95008E8E8E006B6B6B00434141000000000000000000000000005B5A5A006A69
      69006C6B6B006C6B6B0068676700636262005B5A5A00535353004F4E4E004E4D
      4D004D4C4C004D4C4C00000000000000000000000000000000005B5A5A006A69
      69006C6B6B006C6B6B0068676700636262005B5A5A00535353004F4E4E004E4D
      4D004D4C4C004D4C4C00000000000000000000000000000000005B5A5A006A69
      69006C6B6B006C6B6B0068676700636262005B5A5A00535353004F4E4E004E4D
      4D004D4C4C004D4C4C00000000000000000000000000000000005B5A5A006A69
      69006C6B6B006C6B6B0068676700636262005B5A5A00535353004F4E4E004E4D
      4D004D4C4C004D4C4C0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000300000000100010000000000800100000000000000000000
      000000000000000000000000FFFFFF00FFFFFFFF00000000C003C00300000000
      8001800100000000800180010000000080018001000000008001800100000000
      8001800100000000800180010000000080018001000000008001800100000000
      8001800100000000800180010000000080018001000000008001800100000000
      C003C00300000000FFFFFFFF00000000FFFFFFFFFFFFFFFFC003C003C003C003
      8001800180018001800180018001800180018001800180018001800180018001
      8001800180018001800180018001800180018001800180018001800180018001
      8001800180018001800180018001800180018001800180018001800180018001
      C003C003C003C003FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC003C003C003C003
      8001800180018001800180018001800180018001800180018001800180018001
      8001800180018001800180018001800180018001800180018001800180018001
      8001800180018001800180018001800180018001800180018001800180018001
      C003C003C003C003FFFFFFFFFFFFFFFF00000000000000000000000000000000
      000000000000}
  end
  object ToolbarPopupMenu: TBCPopupMenu
    Left = 266
    Top = 118
    object NewOpen1: TMenuItem
      Action = PopupMenuExecuteAction
    end
    object Print1: TMenuItem
      Action = PopupMenuTransactionAction
    end
    object Directory1: TMenuItem
      Action = PopupMenuDBMSAction
    end
    object Indent1: TMenuItem
      Action = PopupMenuExplainPlanAction
    end
    object Sort1: TMenuItem
      Action = PopupMenuStandardAction
    end
    object Case1: TMenuItem
      Action = PopupMenuPrintAction
    end
    object UndoandRedo1: TMenuItem
      Action = PopupMenuIndentAction
    end
    object Search1: TMenuItem
      Action = PopupMenuSortAction
    end
    object Mode1: TMenuItem
      Action = PopupMenuCaseAction
    end
    object ools1: TMenuItem
      Action = PopupMenuCommandAction
    end
    object Macro1: TMenuItem
      Action = PopupMenuSearchAction
    end
    object Document1: TMenuItem
      Action = PopupMenuModeAction
    end
    object ools2: TMenuItem
      Action = PopupMenuToolsAction
    end
  end
  object ToolbarPopupMenuActionList: TActionList
    Left = 358
    Top = 62
    object PopupMenuExecuteAction: TAction
      Caption = 'Execute'
      Checked = True
      OnExecute = PopupMenuExecuteActionExecute
    end
    object PopupMenuTransactionAction: TAction
      Caption = 'Transaction'
      Checked = True
      OnExecute = PopupMenuTransactionActionExecute
    end
    object PopupMenuDBMSAction: TAction
      Caption = 'DBMS'
      Checked = True
      OnExecute = PopupMenuDBMSActionExecute
    end
    object PopupMenuExplainPlanAction: TAction
      Caption = 'Explain Plan'
      Checked = True
      OnExecute = PopupMenuExplainPlanActionExecute
    end
    object PopupMenuStandardAction: TAction
      Caption = 'Standard'
      Checked = True
      OnExecute = PopupMenuStandardActionExecute
    end
    object PopupMenuPrintAction: TAction
      Caption = 'Print'
      Checked = True
      OnExecute = PopupMenuPrintActionExecute
    end
    object PopupMenuIndentAction: TAction
      Caption = 'Indent'
      Checked = True
      OnExecute = PopupMenuIndentActionExecute
    end
    object PopupMenuSortAction: TAction
      Caption = 'Sort'
      Checked = True
      OnExecute = PopupMenuSortActionExecute
    end
    object PopupMenuCaseAction: TAction
      Caption = 'Case'
      Checked = True
      OnExecute = PopupMenuCaseActionExecute
    end
    object PopupMenuCommandAction: TAction
      Caption = 'Command'
      Checked = True
      OnExecute = PopupMenuCommandActionExecute
    end
    object PopupMenuSearchAction: TAction
      Caption = 'Search'
      Checked = True
      OnExecute = PopupMenuSearchActionExecute
    end
    object PopupMenuModeAction: TAction
      Caption = 'Mode'
      Checked = True
      OnExecute = PopupMenuModeActionExecute
    end
    object PopupMenuToolsAction: TAction
      Caption = 'Tools'
      Checked = True
      OnExecute = PopupMenuToolsActionExecute
    end
  end
end
