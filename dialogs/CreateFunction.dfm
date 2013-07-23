inherited CreateFunctionDialog: TCreateFunctionDialog
  Caption = 'Create Functioin'
  ClientHeight = 377
  ClientWidth = 358
  OnShow = FormShow
  ExplicitWidth = 374
  ExplicitHeight = 413
  PixelsPerInch = 96
  TextHeight = 13
  object FunctionNameLabel: TLabel [0]
    Left = 8
    Top = 11
    Width = 71
    Height = 13
    Caption = 'Function Name'
  end
  object ReturnTypeLabel: TLabel [1]
    Left = 8
    Top = 36
    Width = 60
    Height = 13
    Caption = 'Return Type'
  end
  inherited PageControl: TBCPageControl
    Top = 62
    Width = 351
    Height = 259
    ActivePage = ParametersTabSheet
    ActivePageCaption = 'Parameters'
    ExplicitTop = 62
    ExplicitWidth = 351
    ExplicitHeight = 259
    object ParametersTabSheet: TTabSheet [0]
      Caption = 'Parameters'
      ImageIndex = 1
      object ColumnsPanel: TPanel
        Left = 0
        Top = 0
        Width = 343
        Height = 208
        Align = alClient
        BevelOuter = bvNone
        Padding.Right = 2
        Padding.Bottom = 1
        TabOrder = 0
        object BCDBGrid1: TBCDBGrid
          Left = 0
          Top = 0
          Width = 341
          Height = 207
          Align = alClient
          AllowedSelections = [gstRecordBookmarks, gstAll]
          DataSource = ColumnsDataSource
          DrawGraphicData = True
          DrawMemoText = True
          DynProps = <>
          FooterParams.Color = clWindow
          GridLineParams.VertEmptySpaceStyle = dessNonEh
          IndicatorOptions = []
          Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
          OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghDialogFind, dghColumnResize, dghColumnMove]
          TabOrder = 0
          Columns = <
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'COLUMN_NAME'
              Footers = <>
              Title.Caption = 'Column Name'
              Width = 147
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'INOUT'
              Footers = <>
              PickList.Strings = (
                'IN'
                'OUT'
                'IN OUT')
              Title.Caption = 'In/Out'
              Width = 70
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'DATA_TYPE'
              Footers = <>
              PickList.Strings = (
                'BFILE'
                'BINARY_INTEGER'
                'BLOB'
                'CHAR'
                'CLOB'
                'DATE'
                'NCHAR'
                'NCLOB'
                'NUMBER'
                'NVARCHAR2'
                'PLS_INTEGER'
                'RAW'
                'ROWID'
                'TIMESTAMP'
                'UROWID'
                'VARCHAR2'
                'XMLTYPE')
              Title.Caption = 'Data Type'
              Width = 100
            end>
          object RowDetailData: TRowDetailPanelControlEh
          end
        end
      end
      object ColumnButtonPanel: TPanel
        Left = 0
        Top = 208
        Width = 343
        Height = 23
        Align = alBottom
        BevelOuter = bvNone
        Padding.Top = 1
        TabOrder = 1
        object ParametersToolBar: TBCToolBar
          Left = 0
          Top = 1
          Width = 92
          Height = 22
          Align = alLeft
          Images = ImageList
          TabOrder = 0
          object MoveUpToolButton: TToolButton
            Left = 0
            Top = 0
            Action = MoveupColumnAction
          end
          object MoveDownToolButton: TToolButton
            Left = 23
            Top = 0
            Action = MoveDownColumnAction
          end
          object AddColumnToolButton: TToolButton
            Left = 46
            Top = 0
            Action = AddColumnAction
          end
          object DeleteColumnToolButton: TToolButton
            Left = 69
            Top = 0
            Action = DeleteColumnAction
          end
        end
      end
    end
    object BodyTabSheet: TTabSheet [1]
      Caption = 'Body'
      ImageIndex = 2
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object BodyPanel: TPanel
        Left = 0
        Top = 0
        Width = 343
        Height = 231
        Align = alClient
        BevelOuter = bvNone
        Padding.Right = 2
        Padding.Bottom = 1
        TabOrder = 0
        object BodySynEdit: TSynEdit
          Left = 0
          Top = 0
          Width = 341
          Height = 230
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
        end
      end
    end
    inherited SourceTabSheet: TTabSheet
      Caption = 'Parameters'
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 343
      ExplicitHeight = 231
      inherited SourcePanel: TPanel
        Width = 343
        Height = 231
        ExplicitWidth = 343
        ExplicitHeight = 231
        inherited SourceSynEdit: TSynEdit
          Width = 341
          Height = 206
          ExplicitWidth = 341
          ExplicitHeight = 206
        end
        inherited SourceTopPanel: TPanel
          Width = 341
          ExplicitWidth = 341
        end
      end
    end
  end
  inherited OKButton: TButton
    Left = 194
    Top = 327
    ExplicitLeft = 194
    ExplicitTop = 327
  end
  inherited CancelButton: TButton
    Left = 275
    Top = 327
    ExplicitLeft = 275
    ExplicitTop = 327
  end
  object FunctionNameEdit: TBCEdit [5]
    Left = 100
    Top = 8
    Width = 250
    Height = 21
    Hint = 'Function name'
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
  object ReturnTypeComboBox: TBCComboBox [6]
    Left = 100
    Top = 33
    Width = 250
    Height = 21
    Hint = 'Return type'
    Anchors = [akLeft, akTop, akRight]
    DropDownCount = 17
    TabOrder = 4
    OnChange = PageControlChange
    Items.Strings = (
      'BFILE'
      'BINARY_INTEGER'
      'BLOB'
      'CHAR'
      'CLOB'
      'DATE'
      'NCHAR'
      'NCLOB'
      'NUMBER'
      'NVARCHAR2'
      'PLS_INTEGER'
      'RAW'
      'ROWID'
      'TIMESTAMP'
      'UROWID'
      'VARCHAR2'
      'XMLTYPE')
    EditColor = clInfoBk
    DeniedKeyStrokes = False
    ReadOnly = False
    DropDownFixedWidth = 0
  end
  inherited StatusBar1: TStatusBar
    Top = 358
    Width = 358
    ExplicitTop = 358
    ExplicitWidth = 358
  end
  inherited ActionList: TActionList
    object MoveupColumnAction: TAction
      Hint = 'Move selected row up'
      ImageIndex = 3
      OnExecute = MoveupColumnActionExecute
    end
    object MoveDownColumnAction: TAction
      Hint = 'Move selected row down'
      ImageIndex = 4
      OnExecute = MoveDownColumnActionExecute
    end
    object AddColumnAction: TAction
      Hint = 'Add column'
      ImageIndex = 5
      OnExecute = AddColumnActionExecute
    end
    object DeleteColumnAction: TAction
      Hint = 'Delete column'
      ImageIndex = 6
      OnExecute = DeleteColumnActionExecute
    end
  end
  inherited SynSQLSyn: TSynSQLSyn
    Left = 154
    Top = 120
  end
  inherited ImageList: TBCImageList
    Bitmap = {
      494C010107000E00640210001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000002000000001002000000000000020
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000092635D00A467
      6900A4676900A4676900A4676900A4676900A4676900A4676900A4676900A467
      6900A4676900A4676900A467690000000000000000000000000092635D00A467
      6900A4676900A4676900A4676900A4676900A4676900A4676900A4676900A467
      6900A4676900A4676900A4676900000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000096655E00F3DE
      BB00F3DAB500F2D8AF00F2D5A900F0D3A400EFD09F00EFCE9A00EECB9600EDCA
      9200EDC68F00EDC68B009F6F600000000000000000000000000096655E00F3DE
      BB00F3DAB500F2D8AF00F2D5A900F0D3A400EFD09F00EFCE9A00EECB9600EDCA
      9200EDC68F00EDC68B009F6F6000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000007F5B0000CF98080000000000000000000000
      000000000000000000000000000000000000000000000000000099685F00F4E1
      C000004B0000F3DCB600F3D8B000811E0000811E0000811E0000811E0000811E
      0000811E0000EEC78F009F6F600000000000000000000000000099685F00F4E1
      C000004B0000F3DCB600F3D8B000811E0000811E0000811E0000811E0000811E
      0000811E0000EEC78F009F6F6000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000007F5B0000CF980800FFF3D500CF980800000000000000
      00000000000000000000000000000000000000000000000000009E6B6200F7E5
      C900F6E1C200F4DEBC00F4DCB600F2D8B100F2D7AB00F0D3A600EFD0A100EFCF
      9D00EECB9800EEC993009F6F60000000000000000000000000009E6B6200F7E5
      C900F6E1C200F4DEBC00F4DCB600F2D8B100F2D7AB00F0D3A600EFD0A100EFCF
      9D00EECB9800EEC993009F6F6000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000007F5B0000CF980800F6CB9700F6CB9700FFF3D500CF9808000000
      00000000000000000000000000000000000000000000004B0000004B0000004B
      0000004B0000004B0000004B0000004B0000004B0000004B0000004B0000004B
      0000004B0000004B0000004B0000004B00000000000000008200000082000000
      8200000082000000820000008200000082000000820000008200000082000000
      8200000082000000820000008200000082000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00007F5B0000CF980800F6CB9700F6CB9700F6CB9700F6CB9700FFF3D500CF98
      08000000000000000000000000000000000000000000004B0000A9756600F8EB
      D500004B0000F7E6CA00F7E2C400811E0000811E0000811E0000811E0000811E
      0000811E0000F0CF9E009F6F6000004B00000000000000008200A9756600F8EB
      D50000008200F7E6CA00F7E2C400000082000000820000008200000082000000
      820000008200F0CF9E009F6F6000000082000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007F5B
      0000CF980800F6CB9700F6CB9700F6CB9700F6CB9700F6CB9700F6CB9700FFF3
      D500CF98080000000000000000000000000000000000004B0000004B0000004B
      0000004B0000004B0000004B0000004B0000004B0000004B0000004B0000004B
      0000004B0000004B0000004B0000004B00000000000000008200000082000000
      8200000082000000820000008200000082000000820000008200000082000000
      8200000082000000820000008200000082000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007F5B0000CF98
      0800F6CB9700F6CB9700F6CB9700F6CB9700F6CB9700F6CB9700F6CB9700F6CB
      9700FFF3D500CF98080000000000000000000000000000000000B67F6A00FBF2
      E200FAEEDD00F8EBD800F7E9D100F7E6CB00F7E3C600F6E1C000F4DDBA00F3DC
      B500F2D8B000F0D5AA009F6F6000000000000000000000000000B67F6A00FBF2
      E200FAEEDD00F8EBD800F7E9D100F7E6CB00F7E3C600F6E1C000F4DDBA00F3DC
      B500F2D8B000F0D5AA009F6F6000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000007F5B0000CF980800F6CB
      9700F6CB9700F6CB9700F6CB9700F6CB9700F6CB9700FFF3D500FFF3D500FFF3
      D500FFF3D500FFF3D500CF980800000000000000000000000000BC846C00ABA6
      9E0000330000AAA39700F8EDD800811E0000811E0000811E0000811E0000811E
      0000811E0000F3D9B0009F6F6000000000000000000000000000BC846C00FBF4
      E900004B0000FAEFDE00F8EDD800811E0000811E0000811E0000811E0000811E
      0000811E0000F3D9B0009F6F6000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CF9808007F5B00007F5B
      00007F5B00007F5B0000F6CB9700F6CB9700F6CB9700FFF3D5007F5B00007F5B
      00007F5B00007F5B00007F5B0000000000000000000000000000004B0000004B
      0000004B0000AAA59C00FBF0DE00FAEED900F8EBD400F7E6CE00F6E3C900F6E2
      C200F4E0BD00F4DCB6009F6F6000000000000000000000000000C1896F00FCF7
      EE00FCF4E900FAF2E500FBF0DE00FAEED900F8EBD400F7E6CE00F6E3C900F6E2
      C200F4E0BD00F4DCB6009F6F6000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000007F5B0000F6CB9700F6CB9700F6CB9700FFF3D500CF9808000000
      0000000000000000000000000000000000000000000000000000004B00000D9A
      1A00004B0000ACA69F00ABA59C00ABA39900F8EEDA00F8EBD400F7E7CF00F7E5
      CA00F6E2C400F4DEBD009F6F600000000000000000000000000088604C00ACA9
      A500ACA9A300ACA69F00ABA59C00ABA39900F8EEDA00F8EBD400F7E7CF00F7E5
      CA00F6E2C400F4DEBD009F6F6000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000007F5B0000F6CB9700F6CB9700F6CB9700FFF3D500CF9808000000
      000000000000000000000000000000000000004B0000004B0000004B000016AC
      2D00004B0000004B0000004B000058140000811E0000811E0000811E0000811E
      0000811E0000F6E2C5009F6F6000000000000000820000008200000082000000
      820000008200000082000000820058140000811E0000811E0000811E0000811E
      0000811E0000F6E2C5009F6F6000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000007F5B0000F6CB9700F6CB9700F6CB9700FFF3D500CF9808000000
      000000000000000000000000000000000000004B000031DA60002BD0540023C2
      44001AB4340013A52500004B0000ACA7A000FCF3E600FBF0E200FAEFDD00FAEB
      D700F8E9D100F7E5CB009F6F60000000000000008200315EFF001B47FF00052B
      FF000018F300000CC40000008200ACA7A000FCF3E600FBF0E200FAEFDD00FAEB
      D700F8E9D100F7E5CB009F6F6000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000CF9808007F5B00007F5B00007F5B00007F5B0000CF9808000000
      000000000000000000000000000000000000004B0000004B0000004B00002ED5
      5A00004B0000004B0000004B0000FCF8F000FCF7ED00FBF4E700FAF2E300FAEF
      DD00F8EDD900F8E9D1009F6F6000000000000000820000008200000082000000
      8200000082000000820000008200FCF8F000FCF7ED00FBF4E700FAF2E300FAEF
      DD00F8EDD900F8E9D1009F6F6000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000004B000034DE
      6500004B00008C604600CF8E6800CF8E6800CF8E6800CF8E6800CF8E6800CF8E
      6800CF8E6800CF8E6800CF8E6800000000000000000000000000D4987500CF8E
      6800CF8E6800CF8E6800CF8E6800CF8E6800CF8E6800CF8E6800CF8E6800CF8E
      6800CF8E6800CF8E6800CF8E6800000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000004B0000004B
      0000004B00000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
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
      000000000000CF9808007F5B00007F5B00007F5B00007F5B0000CF9808000000
      000000000000000000000000000000000000B7938A00FEEFDA00F6E0C600F2DA
      BC00F2D5B200EFD0A900EECB9E00EDC79600EBC28C000274A900A3F7FC009EEA
      FB00BFEFFC00C9F2FB007FCFEA00056695000000000000000000000000000000
      000000000000A06C5F00FEE9D300FFE5CA00FFE1C100FFDCBA00FED8B100FED3
      A900FFD0A100FFCC9A007342410000000000000000007F2B2800C24A4B00B144
      4400E2D9D9007916170079161700D9D8DA00D9DEE100D3D9DC00C1BDC1007611
      1100982D2D007F2B280000000000000000000000000000000000000000000000
      0000000000007F5B0000F6CB9700F6CB9700F6CB9700FFF3D500CF9808000000
      000000000000000000000000000000000000BA978F00FFF4E500F7E5CF00F4E0
      C500F3DABB00F2D5B100F0D0A600EECB9E00EDC795000274A90062BDD7001B97
      C2001184B4002D96BD00499FC500056695008E5D59008E5D59008E5D59008E5D
      59008E5D5900A7746300FEEEDD00DD903D00DD903D00DD903D00DD903D00DD90
      3D00DD903D00FED1A4007342410000000000000000007F2B2800C24A4A00B042
      4200E6DCDC007916170079161700D5D3D500D8DEE100D7DDE000C6C2C500700F
      0F00962C2C007F2B280000000000000000000000000000000000000000000000
      0000000000007F5B0000F6CB9700F6CB9700F6CB9700FFF3D500CF9808000000
      000000000000000000000000000000000000C09E9500FFFBF000F8EADC00F6E3
      CF00F4E0C600F2D9BC00F2D5B100F0D0A900EDCB9E000274A9003BC2DA001ACA
      F3002DD5FE006ADCF3001B97C2000566950092625A00FEDDBC00FFD9B400FFD5
      AC00FFD1A500B17D6700FEF3E600FEEFDE00FEEAD800FFE7CF00FEE2C700FEDE
      BD00FFD9B600FED5AD007342410000000000000000007F2B2800C24A4A00B041
      4100EADEDE00E7DDDD00DDD4D500D7D3D500D5D7D900D7D8DA00CAC2C5007E17
      17009E3131007F2B280000000000000000000000000000000000000000000000
      0000000000007F5B0000F6CB9700F6CB9700F6CB9700FFF3D500CF9808000000
      000000000000000000000000000000000000C6A49A00FFFFFC00FAF0E600F8EA
      DA00F7E5CF00F4E0C500F2DABA00F2D5B100F0D0A7000274A90064F5FE0012CE
      FE0021CFFF006EE0FB001DA4D6000566950098665D00FFE3C700DD903D00DD90
      3D00DD903D00BB836900FFF7EF00DD903D00DD903D00DD903D00DD903D00DD90
      3D00DD903D00FEDAB8007342410000000000000000007F2B2800BF474800B845
      4500BA4C4C00BD575700BB575600B64E4E00B4494900BD525100BB4B4C00B542
      4200BF4A4A007F2B2800000000000000000000000000CF9808007F5B00007F5B
      00007F5B00007F5B0000F6CB9700F6CB9700F6CB9700FFF3D5007F5B00007F5B
      00007F5B00007F5B00007F5B000000000000CBA99E00FFFFFF00FEF7F200FAEF
      E600F8EAD900F7E3CF00F6E0C500F2DABB00F2D4B1000373A60081FCFF0052FA
      FF0067FFFF0095FCFF0036C4EF0005669500A06C5F00FEE9D300FFE5CA00FFE1
      C100FFDCBA00C48B6C00FEFAF700FEF7F000FEF4EA00FEF2E300FEEDDC00FEE9
      D400FEE5CB00FEE1C2007342410000000000000000007F2B2800A33B3900B160
      5D00C6868400CB918F00CC919000CC908F00CB898800C9898800CB939100CC96
      9600BD4B4C007F2B28000000000000000000000000007F5B0000CF980800F6CB
      9700F6CB9700F6CB9700F6CB9700F6CB9700F6CB9700FFF3D500FFF3D500FFF3
      D500FFF3D500FFF3D500CF98080000000000CFAC9F00FFFFFF00FFFEFC00FCF6
      F000FAEFE600F7EADA00F6E3CF00F4E0C500F3D9BB000274A900C2EBF400FEFE
      FE00CEFFFF00BDFFFF0088F8FB0005669500A7746300FEEEDD00DD903D00DD90
      3D00DD903D00CC937000FEFEFC00FEFBF800FEF8F300FEF6ED00FEF2E600E5D5
      D000C6B1AF00A79395007342410000000000000000007F2B2800BD4B4C00F7F7
      F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7
      F700BD4B4C007F2B2800000000000000000000000000000000007F5B0000CF98
      0800F6CB9700F6CB9700F6CB9700F6CB9700F6CB9700F6CB9700F6CB9700F6CB
      9700FFF3D500CF9808000000000000000000D4B0A100FFFFFF00FFFFFF00FFFE
      FC00FEF7F000FAEFE500F8EAD900F7E5CE00F6DEC400F3D9B8000274A9000274
      A9000274A9000274A9000274A90000000000B17D6700FEF3E600FEEFDE00FEEA
      D800FFE7CF00D59C7400FEFEFE00FEFEFE00FEFBFA00FEFAF400FEF6EE00A067
      5B00A0675B00A0675B009D65590000000000000000007F2B2800BD4B4C00F7F7
      F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7
      F700BD4B4C007F2B280000000000000000000000000000000000000000007F5B
      0000CF980800F6CB9700F6CB9700F6CB9700F6CB9700F6CB9700F6CB9700FFF3
      D500CF980800000000000000000000000000D9B5A100FFFFFF00FFFFFF00FFFF
      FF00FFFEFC00FCF7F000FAEFE500F8E9D900F8E7D100FBEACE00DECEB400B6AA
      9300A4676900000000000000000000000000BB836900FFF7EF00DD903D00DD90
      3D00DD903D00DCA17500FEFEFE00FEFEFE00FEFEFE00FEFCFB00FEFAF600A067
      5B00E5A15400DC832A000000000000000000000000007F2B2800BD4B4C00F7F7
      F700BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00F7F7
      F700BD4B4C007F2B280000000000000000000000000000000000000000000000
      00007F5B0000CF980800F6CB9700F6CB9700F6CB9700F6CB9700FFF3D500CF98
      080000000000000000000000000000000000DDB7A400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFEFC00FCF6EF00FCF3E600EDD8C900B68A7B00A17B6F009C76
      6700A4676900000000000000000000000000C48B6C00FEFAF700FEF7F000FEF4
      EA00FEF2E300E1A57700D1926D00D1926D00D1926D00D1926D00D1926D00A067
      5B00EB9E4300000000000000000000000000000000007F2B2800BD4B4C00F7F7
      F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7
      F700BD4B4C007F2B280000000000000000000000000000000000000000000000
      0000000000007F5B0000CF980800F6CB9700F6CB9700FFF3D500CF9808000000
      000000000000000000000000000000000000E2BCA500FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFEFB00FFFEF700DAC1BA00AD735B00E19E5500E68F
      3100B56D4D00000000000000000000000000CC937000FEFEFC00FEFBF800FEF8
      F300FEF6ED00FEF2E600E5D5D000C6B1AF00A793950073424100000000000000
      000000000000000000000000000000000000000000007F2B2800BD4B4C00F7F7
      F700BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00F7F7
      F700BD4B4C007F2B280000000000000000000000000000000000000000000000
      000000000000000000007F5B0000CF980800FFF3D500CF980800000000000000
      000000000000000000000000000000000000E6BFA700FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00DCC7C500B8826500F8B55C00BF7A
      5C0000000000000000000000000000000000D59C7400FEFEFE00FEFEFE00FEFB
      FA00FEFAF400FEF6EE00A0675B00A0675B00A0675B009D655900000000000000
      000000000000000000000000000000000000000000007F2B2800BD4B4C00F7F7
      F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7
      F700BD4B4C007F2B280000000000000000000000000000000000000000000000
      00000000000000000000000000007F5B0000CF98080000000000000000000000
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
      2800000040000000200000000100010000000000000100000000000000000000
      000000000000000000000000FFFFFF00FFFFC001C0010000FFFFC001C0010000
      FE7FC001C0010000FC3FC001C0010000F81F800080000000F00F800080000000
      E007800080000000C003C001C00100008001C001C00100008001C001C0010000
      F81FC001C0010000F81F000100010000F81F000100010000F81F000100010000
      FFFFC001C0010000FFFFC7FFFFFF0000FFC1F801FFFFFFFF0000F801C007FFFF
      0000F8018003F81F0000F8018003F81F000000018003F81F000000018003F81F
      00000001800380010000000180038001000000018003C003000100018003E007
      000700038003F00F000700078003F81F0007003F8003FC3F000F003F8003FE7F
      001F007FC007FFFF003F00FFFFFFFFFF00000000000000000000000000000000
      000000000000}
  end
  object ColumnsDataSource: TOraDataSource
    DataSet = ColumnsQuery
    Left = 208
    Top = 158
  end
  object ColumnsQuery: TOraQuery
    LocalUpdate = True
    SQL.Strings = (
      
        'SELECT LPAD('#39' '#39', 30) column_name, LPAD('#39' '#39', 6) inout, LPAD('#39' '#39', ' +
        '106) data_type'
      '  FROM dual'
      ' WHERE 1=0')
    Options.StrictUpdate = False
    Left = 214
    Top = 226
  end
end
