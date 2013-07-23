inherited CreateTriggerDialog: TCreateTriggerDialog
  Caption = 'Create Trigger'
  ClientHeight = 318
  ClientWidth = 357
  OnShow = FormShow
  ExplicitWidth = 373
  ExplicitHeight = 354
  PixelsPerInch = 96
  TextHeight = 13
  object TriggerNameLabel: TLabel [0]
    Left = 8
    Top = 12
    Width = 64
    Height = 13
    Caption = 'Trigger Name'
  end
  object TableLabel: TLabel [1]
    Left = 8
    Top = 36
    Width = 82
    Height = 13
    Caption = 'Table/View Name'
  end
  object TableNameEdit: TBCEdit [2]
    Left = 100
    Top = 33
    Width = 249
    Height = 21
    Hint = 'Table name'
    TabStop = False
    Anchors = [akLeft, akTop, akRight]
    CharCase = ecUpperCase
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 5
    Text = ''
    Visible = False
    OnChange = PageControlChange
    OnlyNumbers = False
    NumbersWithDots = False
    NumbersWithSpots = False
    EditColor = clInfoBk
    ErrorColor = 14803198
    NumbersAllowNegative = False
  end
  inherited PageControl: TBCPageControl
    Top = 60
    Width = 350
    Height = 204
    ActivePage = SettingsTabSheet
    ActivePageCaption = 'Settings'
    ExplicitTop = 60
    ExplicitWidth = 350
    ExplicitHeight = 210
    object SettingsTabSheet: TTabSheet [0]
      Caption = 'Settings'
      ImageIndex = 1
      ExplicitHeight = 175
      DesignSize = (
        342
        176)
      object WhenRadioGroup: TRadioGroup
        Left = 3
        Top = 0
        Width = 332
        Height = 45
        Anchors = [akLeft, akTop, akRight]
        Caption = ' When '
        Columns = 2
        DoubleBuffered = False
        ItemIndex = 0
        Items.Strings = (
          'Before'
          'After')
        ParentDoubleBuffered = False
        TabOrder = 0
      end
      object OnGroupBox: TGroupBox
        Left = 3
        Top = 47
        Width = 332
        Height = 45
        Anchors = [akLeft, akTop, akRight]
        Caption = ' On '
        TabOrder = 1
        DesignSize = (
          332
          45)
        object DeleteCheckBox: TCheckBox
          Left = 139
          Top = 20
          Width = 97
          Height = 17
          Anchors = [akTop]
          Caption = ' Delete'
          TabOrder = 0
        end
        object InsertCheckBox: TCheckBox
          Left = 11
          Top = 20
          Width = 49
          Height = 17
          Caption = ' Insert'
          TabOrder = 1
        end
        object UpdateCheckBox: TCheckBox
          Left = 269
          Top = 20
          Width = 56
          Height = 17
          Anchors = [akTop, akRight]
          Caption = ' Update'
          TabOrder = 2
        end
      end
      object ReferencingGroupBox: TGroupBox
        Left = 3
        Top = 94
        Width = 332
        Height = 77
        Anchors = [akLeft, akTop, akRight]
        Caption = ' Referencing '
        TabOrder = 2
        DesignSize = (
          332
          77)
        object NewAsLabel: TLabel
          Left = 10
          Top = 22
          Width = 36
          Height = 13
          Caption = 'New As'
        end
        object OldAsLabel: TLabel
          Left = 10
          Top = 49
          Width = 31
          Height = 13
          Caption = 'Old As'
        end
        object ReferenceNewEdit: TBCEdit
          Left = 88
          Top = 18
          Width = 234
          Height = 21
          Hint = 'Reference new as'
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
          Text = 'New'
          OnlyNumbers = False
          NumbersWithDots = False
          NumbersWithSpots = False
          EditColor = clInfoBk
          ErrorColor = 14803198
          NumbersAllowNegative = False
        end
        object ReferenceOldEdit: TBCEdit
          Left = 88
          Top = 45
          Width = 234
          Height = 21
          Hint = 'Reference old as'
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 1
          Text = 'Old'
          OnlyNumbers = False
          NumbersWithDots = False
          NumbersWithSpots = False
          EditColor = clInfoBk
          ErrorColor = 14803198
          NumbersAllowNegative = False
        end
      end
    end
    object WhenClauseTabSheet: TTabSheet [1]
      Caption = 'When Clause'
      ImageIndex = 2
      ExplicitHeight = 175
      object WhenClausePanel: TPanel
        Left = 0
        Top = 0
        Width = 342
        Height = 176
        Align = alClient
        BevelOuter = bvNone
        Padding.Right = 2
        Padding.Bottom = 1
        TabOrder = 0
        ExplicitHeight = 175
        object WhenClauseSynEdit: TSynEdit
          Left = 0
          Top = 0
          Width = 340
          Height = 175
          Align = alClient
          Ctl3D = True
          ParentCtl3D = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = []
          TabOrder = 0
          Gutter.AutoSize = True
          Gutter.Font.Charset = DEFAULT_CHARSET
          Gutter.Font.Color = clWindowText
          Gutter.Font.Height = -11
          Gutter.Font.Name = 'Courier New'
          Gutter.Font.Style = []
          Gutter.ShowLineNumbers = True
          Gutter.Gradient = True
          Highlighter = SynSQLSyn
          Options = [eoAutoIndent, eoDragDropEditing, eoEnhanceEndKey, eoGroupUndo, eoShowScrollHint, eoSmartTabDelete, eoSmartTabs, eoTabsToSpaces, eoTrimTrailingSpaces]
          WantTabs = True
          FontSmoothing = fsmNone
          ExplicitHeight = 174
        end
      end
    end
    object BodyTabSheet: TTabSheet [2]
      Caption = 'Body'
      ImageIndex = 3
      ExplicitHeight = 175
      object BodyPanel: TPanel
        Left = 0
        Top = 0
        Width = 342
        Height = 176
        Align = alClient
        BevelOuter = bvNone
        Padding.Right = 2
        Padding.Bottom = 1
        TabOrder = 0
        ExplicitHeight = 175
        object BodySynEdit: TSynEdit
          Left = 0
          Top = 0
          Width = 340
          Height = 175
          Align = alClient
          Ctl3D = True
          ParentCtl3D = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = []
          TabOrder = 0
          Gutter.AutoSize = True
          Gutter.Font.Charset = DEFAULT_CHARSET
          Gutter.Font.Color = clWindowText
          Gutter.Font.Height = -11
          Gutter.Font.Name = 'Courier New'
          Gutter.Font.Style = []
          Gutter.ShowLineNumbers = True
          Gutter.Gradient = True
          Highlighter = SynSQLSyn
          Options = [eoAutoIndent, eoDragDropEditing, eoEnhanceEndKey, eoGroupUndo, eoShowScrollHint, eoSmartTabDelete, eoSmartTabs, eoTabsToSpaces, eoTrimTrailingSpaces]
          WantTabs = True
          FontSmoothing = fsmNone
          ExplicitHeight = 174
        end
      end
    end
    inherited SourceTabSheet: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 342
      ExplicitHeight = 175
      inherited SourcePanel: TPanel
        Width = 342
        Height = 176
        ExplicitWidth = 342
        ExplicitHeight = 175
        inherited SourceSynEdit: TSynEdit
          Width = 340
          Height = 151
          ExplicitWidth = 340
          ExplicitHeight = 150
        end
        inherited SourceTopPanel: TPanel
          Width = 340
          ExplicitWidth = 340
          inherited TopPanel: TPanel
            Width = 342
            ExplicitWidth = 342
          end
        end
      end
    end
  end
  inherited OKButton: TButton
    Left = 193
    Top = 268
    ExplicitLeft = 193
    ExplicitTop = 274
  end
  inherited CancelButton: TButton
    Left = 274
    Top = 268
    ExplicitLeft = 274
    ExplicitTop = 274
  end
  object TriggerNameEdit: TBCEdit [6]
    Left = 100
    Top = 8
    Width = 249
    Height = 21
    Hint = 'Trigger name'
    Anchors = [akLeft, akTop, akRight]
    CharCase = ecUpperCase
    TabOrder = 3
    Text = ''
    OnChange = PageControlChange
    OnlyNumbers = False
    NumbersWithDots = False
    NumbersWithSpots = False
    EditColor = clInfoBk
    ErrorColor = 14803198
    NumbersAllowNegative = False
  end
  object TableNameComboBox: TBCComboBox [7]
    Left = 100
    Top = 33
    Width = 249
    Height = 21
    Hint = 'Table or view name'
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 4
    OnChange = PageControlChange
    EditColor = clInfoBk
    DeniedKeyStrokes = False
    ReadOnly = False
    DropDownFixedWidth = 0
  end
  inherited StatusBar1: TStatusBar
    Top = 299
    Width = 357
    ExplicitTop = 283
    ExplicitWidth = 357
  end
  inherited ImageList: TBCImageList
    Bitmap = {
      494C010103000E002C0210001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000056695000566
      9500056695000566950005669500000000000000000000000000000000000000
      0000000000008E5D59008E5D59008E5D59008E5D59008E5D59008E5D59008E5D
      59008E5D59008E5D590073424100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A4676900A4676900A4676900A467
      6900A4676900A4676900A4676900A4676900A46769000274A90046D3E9001CD9
      FF002EDAFF007AEDFF0023A4D300056695000000000000000000000000000000
      00000000000092625A00FEDDBC00FFD9B400FFD5AC00FFD1A500FFCE9D00FECA
      9700FFC79000FFC48B00734241000000000000000000000000007F2B28007F2B
      2800A1828300A1828300A1828300A1828300A1828300A1828300A18283007A1C
      1C007F2B28000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B7918700FCEACE00F3DABC00F2D5
      B100F0D0A700EECB9E00EDC79300EDC28B00E9BD81000274A90064F5FE0012CE
      FE0021CFFF0069E1FB001DA4D600056695000000000000000000000000000000
      00000000000098665D00FFE3C700DD903D00DD903D00DD903D00DD903D00DD90
      3D00DD903D00FFC792007342410000000000000000007F2B2800CA4D4D00B645
      4500DDD4D5007916170079161700DCE0E000D7DADE00CED5D700BDBABD007610
      0F009A2D2D007F2B280000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B7938A00FEEFDA00F6E0C600F2DA
      BC00F2D5B200EFD0A900EECB9E00EDC79600EBC28C000274A900A3F7FC009EEA
      FB00BFEFFC00C9F2FB007FCFEA00056695000000000000000000000000000000
      000000000000A06C5F00FEE9D300FFE5CA00FFE1C100FFDCBA00FED8B100FED3
      A900FFD0A100FFCC9A007342410000000000000000007F2B2800C24A4B00B144
      4400E2D9D9007916170079161700D9D8DA00D9DEE100D3D9DC00C1BDC1007611
      1100982D2D007F2B280000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BA978F00FFF4E500F7E5CF00F4E0
      C500F3DABB00F2D5B100F0D0A600EECB9E00EDC795000274A90062BDD7001B97
      C2001184B4002D96BD00499FC500056695008E5D59008E5D59008E5D59008E5D
      59008E5D5900A7746300FEEEDD00DD903D00DD903D00DD903D00DD903D00DD90
      3D00DD903D00FED1A4007342410000000000000000007F2B2800C24A4A00B042
      4200E6DCDC007916170079161700D5D3D500D8DEE100D7DDE000C6C2C500700F
      0F00962C2C007F2B280000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C09E9500FFFBF000F8EADC00F6E3
      CF00F4E0C600F2D9BC00F2D5B100F0D0A900EDCB9E000274A9003BC2DA001ACA
      F3002DD5FE006ADCF3001B97C2000566950092625A00FEDDBC00FFD9B400FFD5
      AC00FFD1A500B17D6700FEF3E600FEEFDE00FEEAD800FFE7CF00FEE2C700FEDE
      BD00FFD9B600FED5AD007342410000000000000000007F2B2800C24A4A00B041
      4100EADEDE00E7DDDD00DDD4D500D7D3D500D5D7D900D7D8DA00CAC2C5007E17
      17009E3131007F2B280000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C6A49A00FFFFFC00FAF0E600F8EA
      DA00F7E5CF00F4E0C500F2DABA00F2D5B100F0D0A7000274A90064F5FE0012CE
      FE0021CFFF006EE0FB001DA4D6000566950098665D00FFE3C700DD903D00DD90
      3D00DD903D00BB836900FFF7EF00DD903D00DD903D00DD903D00DD903D00DD90
      3D00DD903D00FEDAB8007342410000000000000000007F2B2800BF474800B845
      4500BA4C4C00BD575700BB575600B64E4E00B4494900BD525100BB4B4C00B542
      4200BF4A4A007F2B280000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CBA99E00FFFFFF00FEF7F200FAEF
      E600F8EAD900F7E3CF00F6E0C500F2DABB00F2D4B1000373A60081FCFF0052FA
      FF0067FFFF0095FCFF0036C4EF0005669500A06C5F00FEE9D300FFE5CA00FFE1
      C100FFDCBA00C48B6C00FEFAF700FEF7F000FEF4EA00FEF2E300FEEDDC00FEE9
      D400FEE5CB00FEE1C2007342410000000000000000007F2B2800A33B3900B160
      5D00C6868400CB918F00CC919000CC908F00CB898800C9898800CB939100CC96
      9600BD4B4C007F2B280000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CFAC9F00FFFFFF00FFFEFC00FCF6
      F000FAEFE600F7EADA00F6E3CF00F4E0C500F3D9BB000274A900C2EBF400FEFE
      FE00CEFFFF00BDFFFF0088F8FB0005669500A7746300FEEEDD00DD903D00DD90
      3D00DD903D00CC937000FEFEFC00FEFBF800FEF8F300FEF6ED00FEF2E600E5D5
      D000C6B1AF00A79395007342410000000000000000007F2B2800BD4B4C00F7F7
      F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7
      F700BD4B4C007F2B280000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D4B0A100FFFFFF00FFFFFF00FFFE
      FC00FEF7F000FAEFE500F8EAD900F7E5CE00F6DEC400F3D9B8000274A9000274
      A9000274A9000274A9000274A90000000000B17D6700FEF3E600FEEFDE00FEEA
      D800FFE7CF00D59C7400FEFEFE00FEFEFE00FEFBFA00FEFAF400FEF6EE00A067
      5B00A0675B00A0675B009D65590000000000000000007F2B2800BD4B4C00F7F7
      F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7
      F700BD4B4C007F2B280000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D9B5A100FFFFFF00FFFFFF00FFFF
      FF00FFFEFC00FCF7F000FAEFE500F8E9D900F8E7D100FBEACE00DECEB400B6AA
      9300A4676900000000000000000000000000BB836900FFF7EF00DD903D00DD90
      3D00DD903D00DCA17500FEFEFE00FEFEFE00FEFEFE00FEFCFB00FEFAF600A067
      5B00E5A15400DC832A000000000000000000000000007F2B2800BD4B4C00F7F7
      F700BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00F7F7
      F700BD4B4C007F2B280000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000DDB7A400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFEFC00FCF6EF00FCF3E600EDD8C900B68A7B00A17B6F009C76
      6700A4676900000000000000000000000000C48B6C00FEFAF700FEF7F000FEF4
      EA00FEF2E300E1A57700D1926D00D1926D00D1926D00D1926D00D1926D00A067
      5B00EB9E4300000000000000000000000000000000007F2B2800BD4B4C00F7F7
      F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7
      F700BD4B4C007F2B280000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E2BCA500FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFEFB00FFFEF700DAC1BA00AD735B00E19E5500E68F
      3100B56D4D00000000000000000000000000CC937000FEFEFC00FEFBF800FEF8
      F300FEF6ED00FEF2E600E5D5D000C6B1AF00A793950073424100000000000000
      000000000000000000000000000000000000000000007F2B2800BD4B4C00F7F7
      F700BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00F7F7
      F700BD4B4C007F2B280000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E6BFA700FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00DCC7C500B8826500F8B55C00BF7A
      5C0000000000000000000000000000000000D59C7400FEFEFE00FEFEFE00FEFB
      FA00FEFAF400FEF6EE00A0675B00A0675B00A0675B009D655900000000000000
      000000000000000000000000000000000000000000007F2B2800BD4B4C00F7F7
      F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7
      F700BD4B4C007F2B280000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E4BCA400FBF4F000FBF4EF00FAF3
      EF00FAF3EF00F8F2EF00F7F2EF00F7F2EF00D8C2C000B77F6200C1836C000000
      000000000000000000000000000000000000DCA17500FEFEFE00FEFEFE00FEFE
      FE00FEFCFB00FEFAF600A0675B00E5A15400DC832A0000000000000000000000
      00000000000000000000000000000000000000000000000000007F2B2800F7F7
      F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7
      F7007F2B28000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E8C4AD00EBCBB700EBCBB700EACB
      B700EACAB600EACAB600EACAB600EACAB600E3C2B100A56B5F00000000000000
      000000000000000000000000000000000000E1A57700D1926D00D1926D00D192
      6D00D1926D00D1926D00A0675B00EB9E43000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF00FFC1F801FFFF00000000F801C0070000
      0000F801800300000000F8018003000000000001800300000000000180030000
      0000000180030000000000018003000000000001800300000001000180030000
      000700038003000000070007800300000007003F80030000000F003F80030000
      001F007FC0070000003F00FFFFFF000000000000000000000000000000000000
      000000000000}
  end
end
