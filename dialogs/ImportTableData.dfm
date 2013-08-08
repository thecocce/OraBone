object ImportTableDataDialog: TImportTableDataDialog
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Import Table Data'
  ClientHeight = 319
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
    Height = 165
    Align = alTop
    BevelOuter = bvNone
    Padding.Left = 6
    Padding.Top = 4
    Padding.Right = 6
    TabOrder = 0
    object OptionsGroupBox: TGroupBox
      Left = 6
      Top = 4
      Width = 321
      Height = 161
      Align = alClient
      Caption = ' Options '
      TabOrder = 0
      object SchemaLabel: TLabel
        Left = 12
        Top = 74
        Width = 37
        Height = 13
        Caption = 'Schema'
      end
      object TableLabel: TLabel
        Left = 12
        Top = 101
        Width = 26
        Height = 13
        Caption = 'Table'
      end
      object FilenameLabel: TLabel
        Left = 12
        Top = 20
        Width = 42
        Height = 13
        Caption = 'Filename'
      end
      object ComminIntervalLabel: TLabel
        Left = 12
        Top = 128
        Width = 35
        Height = 13
        Caption = 'Commit'
      end
      object Label1: TLabel
        Left = 126
        Top = 128
        Width = 75
        Height = 13
        Caption = 'Row(s) Interval'
      end
      object DelimiterLabel: TLabel
        Left = 12
        Top = 47
        Width = 41
        Height = 13
        Caption = 'Delimiter'
      end
      object SchemaEdit: TBCEdit
        Left = 65
        Top = 71
        Width = 240
        Height = 21
        Hint = 'Schema.'
        CharCase = ecUpperCase
        TabOrder = 0
        Text = ''
        EnterToTab = False
        OnlyNumbers = False
        NumbersWithDots = False
        NumbersWithSpots = False
        ErrorColor = 14803198
        NumbersAllowNegative = False
        EditColor = clInfoBk
        UseColoring = True
      end
      object CommitIntervalSpinEdit: TBCSpinEdit
        Left = 65
        Top = 125
        Width = 55
        Height = 21
        Hint = 'Commit Interval. Zero means no COMMIT clauses.'
        TabOrder = 2
        EditColor = clInfoBk
        FocusOffColor = clWindow
        UseColoring = True
      end
      object TableEdit: TBCEdit
        Left = 65
        Top = 98
        Width = 240
        Height = 21
        Hint = 'Table name.'
        CharCase = ecUpperCase
        TabOrder = 1
        Text = ''
        EnterToTab = False
        OnlyNumbers = False
        NumbersWithDots = False
        NumbersWithSpots = False
        ErrorColor = 14803198
        NumbersAllowNegative = False
        EditColor = clInfoBk
        UseColoring = True
      end
      object DelimiterComboBox: TBCComboBox
        Left = 65
        Top = 44
        Width = 120
        Height = 21
        Hint = 'Delimiter.'
        ItemIndex = 2
        TabOrder = 3
        Text = 'Semicolon'
        StyleElements = [seFont, seBorder]
        Items.Strings = (
          'Comma'
          'Pipe'
          'Semicolon'
          'Tab')
        DeniedKeyStrokes = True
        ReadOnly = False
        EditColor = clInfoBk
        UseColoring = True
        DropDownFixedWidth = 0
      end
      object OpenFilenameEdit: TBCEdit
        Left = 64
        Top = 17
        Width = 221
        Height = 21
        Hint = 'Folder'
        TabOrder = 4
        Text = ''
        EnterToTab = False
        OnlyNumbers = False
        NumbersWithDots = False
        NumbersWithSpots = False
        ErrorColor = 14803198
        NumbersAllowNegative = False
        EditColor = clInfoBk
        UseColoring = True
      end
      object FolderBitBtn: TBitBtn
        Left = 287
        Top = 17
        Width = 21
        Height = 21
        Action = OpenFileButtonAction
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
        TabOrder = 5
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 282
    Width = 333
    Height = 37
    Align = alBottom
    BevelOuter = bvNone
    Padding.Left = 6
    Padding.Top = 6
    Padding.Right = 6
    Padding.Bottom = 6
    TabOrder = 1
    object ImportButton: TButton
      Left = 171
      Top = 6
      Width = 75
      Height = 25
      Action = ImportAction
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
  object Panel3: TPanel
    Left = 0
    Top = 165
    Width = 333
    Height = 115
    Align = alTop
    BevelOuter = bvNone
    Padding.Left = 6
    Padding.Top = 3
    Padding.Right = 6
    TabOrder = 2
    object OutputGroupBox: TGroupBox
      Left = 6
      Top = 3
      Width = 321
      Height = 112
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
        TabOrder = 2
      end
      object LaunchAfterCreationCheckBox: TCheckBox
        Left = 65
        Top = 41
        Width = 141
        Height = 17
        Caption = ' Launch After Creation'
        TabOrder = 1
      end
      object LoadInEditorRadioButton: TRadioButton
        Left = 16
        Top = 80
        Width = 113
        Height = 17
        Caption = ' Load in Editor'
        TabOrder = 3
      end
      object SaveFilenameEdit: TBCEdit
        Left = 64
        Top = 17
        Width = 221
        Height = 21
        Hint = 'Folder'
        TabOrder = 4
        Text = ''
        EnterToTab = False
        OnlyNumbers = False
        NumbersWithDots = False
        NumbersWithSpots = False
        ErrorColor = 14803198
        NumbersAllowNegative = False
        EditColor = clInfoBk
        UseColoring = True
      end
      object BitBtn1: TBitBtn
        Left = 287
        Top = 17
        Width = 21
        Height = 21
        Action = SaveFileButtonAction
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
        TabOrder = 5
      end
    end
  end
  object ActionList: TActionList
    Left = 216
    Top = 32
    object ImportAction: TAction
      Caption = '&Import'
      OnExecute = ImportActionExecute
    end
    object OpenFileButtonAction: TAction
      OnExecute = OpenFileButtonActionExecute
    end
    object SaveFileButtonAction: TAction
      OnExecute = SaveFileButtonActionExecute
    end
  end
end
