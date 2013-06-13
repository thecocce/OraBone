object ExportTableDataDialog: TExportTableDataDialog
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Export Table Data'
  ClientHeight = 374
  ClientWidth = 333
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 333
    Height = 30
    Align = alTop
    BevelOuter = bvNone
    Padding.Left = 6
    Padding.Top = 8
    Padding.Right = 6
    TabOrder = 0
    object FormatLabel: TLabel
      Left = 10
      Top = 11
      Width = 34
      Height = 13
      Caption = 'Format'
    end
    object FormatComboBox: TBCComboBox
      Left = 72
      Top = 8
      Width = 120
      Height = 21
      Hint = 'Export Format.'
      ItemHeight = 13
      ReadOnly = False
      TabOrder = 0
      Text = 'CSV File'
      OnChange = FormatComboBoxChange
      Items.Strings = (
        'CSV File'
        'Insert Statements')
      ItemIndex = 0
      EditColor = clInfoBk
      DeniedKeyStrokes = True
      DropDownFixedWidth = 0
    end
    object SelectedRowsOnlyCheckBox: TCheckBox
      Left = 206
      Top = 8
      Width = 121
      Height = 22
      Hint = 'Export selected rows only.'
      Align = alRight
      Alignment = taLeftJustify
      Caption = ' Selected Rows Only'
      TabOrder = 1
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 30
    Width = 333
    Height = 199
    Align = alTop
    BevelOuter = bvNone
    Caption = 'Panel2'
    Padding.Left = 6
    Padding.Top = 3
    Padding.Right = 6
    Padding.Bottom = 3
    TabOrder = 1
    object PageControl: TBCPageControl
      Left = 6
      Top = 3
      Width = 321
      Height = 193
      ActivePage = Options1TabSheet
      Align = alClient
      TabOrder = 0
      TabDragDrop = False
      HoldShiftToDragDrop = False
      ShowCloseButton = False
      object Options1TabSheet: TTabSheet
        Caption = 'Options'
        object DelimiterLabel: TLabel
          Left = 12
          Top = 15
          Width = 41
          Height = 13
          Caption = 'Delimiter'
        end
        object DelimiterComboBox: TBCComboBox
          Left = 62
          Top = 12
          Width = 120
          Height = 21
          Hint = 'Delimiter.'
          ItemHeight = 13
          ReadOnly = False
          TabOrder = 0
          Text = 'Semicolon'
          Items.Strings = (
            'Comma'
            'Pipe'
            'Semicolon'
            'Tab')
          ItemIndex = 2
          EditColor = clInfoBk
          DeniedKeyStrokes = True
          DropDownFixedWidth = 0
        end
        object IncludeColumnHeadersCheckBox: TCheckBox
          Left = 12
          Top = 43
          Width = 157
          Height = 17
          Hint = 'Include column headers.'
          Caption = ' Include Column Headers'
          Checked = True
          State = cbChecked
          TabOrder = 1
        end
        object QuotedStringColumnsCheckBox: TCheckBox
          Left = 12
          Top = 62
          Width = 157
          Height = 17
          Hint = 'Quote string columns.'
          Caption = ' Quote String Columns'
          TabOrder = 2
          OnClick = QuotedStringColumnsCheckBoxClick
        end
        object SingleQuoteRadioButton: TRadioButton
          Left = 32
          Top = 81
          Width = 113
          Height = 17
          Caption = ' Single Quote'
          Enabled = False
          TabOrder = 3
        end
        object DoubleQuoteRadioButton: TRadioButton
          Left = 32
          Top = 100
          Width = 113
          Height = 17
          Caption = ' Double Quote'
          Enabled = False
          TabOrder = 4
        end
        object IncludeNullColumns1CheckBox: TCheckBox
          Left = 12
          Top = 119
          Width = 138
          Height = 17
          Hint = 'Include NULL columns.'
          Caption = ' Include NULL Columns'
          Checked = True
          State = cbChecked
          TabOrder = 5
        end
        object DelimiterAfterLastColumnCheckBox: TCheckBox
          Left = 12
          Top = 138
          Width = 217
          Height = 17
          Hint = 'Include Delimiter After Last Column'
          Caption = ' Include Delimiter After Last Column'
          TabOrder = 6
        end
      end
      object Options2TabSheet: TTabSheet
        Caption = 'Options'
        ImageIndex = 1
        object SchemaLabel: TLabel
          Left = 10
          Top = 15
          Width = 37
          Height = 13
          Caption = 'Schema'
        end
        object TableLabel: TLabel
          Left = 10
          Top = 42
          Width = 26
          Height = 13
          Caption = 'Table'
        end
        object ComminIntervalLabel: TLabel
          Left = 10
          Top = 69
          Width = 35
          Height = 13
          Caption = 'Commit'
        end
        object Label1: TLabel
          Left = 124
          Top = 69
          Width = 75
          Height = 13
          Caption = 'Row(s) Interval'
        end
        object SchemaEdit: TBCEdit
          Left = 62
          Top = 12
          Width = 241
          Height = 21
          Hint = 'Schema.'
          CharCase = ecUpperCase
          TabOrder = 0
          OnlyNumbers = False
          NumbersWithDots = False
          NumbersWithSpots = False
          EditColor = clInfoBk
          NumbersAllowNegative = False
        end
        object TableEdit: TBCEdit
          Left = 62
          Top = 39
          Width = 241
          Height = 21
          Hint = 'Table name.'
          CharCase = ecUpperCase
          TabOrder = 1
          OnlyNumbers = False
          NumbersWithDots = False
          NumbersWithSpots = False
          EditColor = clInfoBk
          NumbersAllowNegative = False
        end
        object CommitIntervalSpinEdit: TBCSpinEdit
          Left = 63
          Top = 66
          Width = 55
          Height = 21
          Hint = 'Commit Interval. Zero means no COMMIT clauses.'
          TabOrder = 2
          EditColor = clInfoBk
        end
        object IncludeNullColumns2CheckBox: TCheckBox
          Left = 10
          Top = 93
          Width = 138
          Height = 17
          Hint = 'Include NULL columns.'
          Caption = ' Include NULL Columns'
          Checked = True
          State = cbChecked
          TabOrder = 3
        end
      end
      object ColumnsTabSheet: TTabSheet
        Caption = 'Columns'
        ImageIndex = 3
        object ColumnsPanel: TPanel
          Left = 0
          Top = 0
          Width = 313
          Height = 165
          Align = alClient
          BevelOuter = bvNone
          Padding.Right = 2
          Padding.Bottom = 1
          TabOrder = 0
          object SchemaFilterCheckListBox: TCheckListBox
            Left = 0
            Top = 0
            Width = 311
            Height = 164
            Align = alClient
            ItemHeight = 13
            TabOrder = 0
          end
        end
      end
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 229
    Width = 333
    Height = 108
    Align = alTop
    BevelOuter = bvNone
    Padding.Left = 6
    Padding.Right = 6
    Padding.Bottom = 3
    TabOrder = 2
    object OutputGroupBox: TGroupBox
      Left = 6
      Top = 0
      Width = 321
      Height = 105
      Align = alClient
      Caption = ' Output '
      TabOrder = 0
      object FileRadioButton: TRadioButton
        Left = 16
        Top = 20
        Width = 113
        Height = 17
        Caption = ' File'
        Checked = True
        TabOrder = 0
        TabStop = True
      end
      object ClipboardRadioButton: TRadioButton
        Left = 16
        Top = 58
        Width = 113
        Height = 17
        Caption = ' Clipboard'
        TabOrder = 4
      end
      object LaunchAfterCreationCheckBox: TCheckBox
        Left = 65
        Top = 41
        Width = 141
        Height = 17
        Caption = ' Launch After Creation'
        TabOrder = 3
      end
      object LoadInEditorRadioButton: TRadioButton
        Left = 16
        Top = 80
        Width = 113
        Height = 17
        Caption = ' Load in Editor'
        TabOrder = 5
      end
      object FilenameEdit: TBCEdit
        Left = 64
        Top = 17
        Width = 221
        Height = 21
        Hint = 'Folder'
        TabOrder = 1
        OnlyNumbers = False
        NumbersWithDots = False
        NumbersWithSpots = False
        EditColor = clInfoBk
        NumbersAllowNegative = False
      end
      object FolderBitBtn: TBitBtn
        Left = 287
        Top = 17
        Width = 21
        Height = 21
        Action = SelectFileButtonAction
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          0274AC0274AC0274AC0274AC0274AC0274AC0274AC0274AC0274AC0274ACFF00
          FFFF00FFFF00FFFF00FFFF00FF0274AC138AC456B6E14BBFF74ABFF74ABFF74A
          BFF74ABFF64ABFF74ABFF62398CC0C81BAFF00FFFF00FFFF00FFFF00FF0274AC
          33AAE02392C454C7F854C7F753C7F854C7F754C7F854C7F854C7F8279DCEBAEB
          EF0274ACFF00FFFF00FFFF00FF0274AC57CAF80274AC5ED1FA5ED1FA5ED1FA5E
          D1FA5ED1FA5FD1FA5ED1F82CA1CEBAEBEF0274ACFF00FFFF00FFFF00FF0274AC
          68DAFB2BA4D196EBFB74E5FB74E5FB74E5FC74E5FC74E5FB74E5FC33A9CFBAEB
          EFBAEBEF0274ACFF00FFFF00FF0274AC70E3FB5CD1EFFEFFFFB8F4FCBAF4FCBA
          F4FCBAF4FEB8F4FEBAF4FC83C9DEE3FEFEC5EFF60274ACFF00FFFF00FF0274AC
          7AEBFE7AEBFC0274AC0274AC0274AC0274AC0274AC0274AC0274AC0274AC0274
          AC0274AC0274ACFF00FFFF00FF0274AC83F2FE82F3FE83F2FC83F3FE82F3FE83
          F2FE82F3FC83F2FE82F3FE036FA7FF00FFFF00FFFF00FFFF00FFFF00FF0274AC
          FEFEFE89FAFF89FAFE8AF8FE8AFAFE89F8FE8AFAFE8AFAFF89FAFF036FA7FF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FF0274ACFEFEFE8FFEFF8FFEFF0274AC02
          74AC0274AC0274AC0274ACFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FF0274AC0274AC0274ACFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
        TabOrder = 2
      end
    end
  end
  object Panel4: TPanel
    Left = 0
    Top = 337
    Width = 333
    Height = 37
    Align = alBottom
    BevelOuter = bvNone
    Padding.Left = 6
    Padding.Top = 6
    Padding.Right = 6
    Padding.Bottom = 6
    TabOrder = 3
    object ExportButton: TButton
      Left = 171
      Top = 6
      Width = 75
      Height = 25
      Action = ExportAction
      Align = alRight
      Default = True
      TabOrder = 0
    end
    object CancelButton: TButton
      Left = 252
      Top = 6
      Width = 75
      Height = 25
      Align = alRight
      Caption = 'Cancel'
      ModalResult = 2
      TabOrder = 1
    end
    object Separator1Panel: TPanel
      Left = 246
      Top = 6
      Width = 6
      Height = 25
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 2
    end
  end
  object ActionList: TActionList
    Left = 216
    Top = 32
    object ExportAction: TAction
      Caption = '&Export'
      OnExecute = ExportActionExecute
    end
    object SelectFileButtonAction: TAction
      OnExecute = SelectFileButtonActionExecute
    end
  end
end
