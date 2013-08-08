object HistoryEditDialog: THistoryEditDialog
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Edit History'
  ClientHeight = 259
  ClientWidth = 629
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object BottomPanel: TPanel
    Left = 0
    Top = 222
    Width = 629
    Height = 37
    Align = alBottom
    BevelOuter = bvNone
    Padding.Left = 6
    Padding.Top = 6
    Padding.Right = 6
    Padding.Bottom = 6
    TabOrder = 0
    object OKButton: TButton
      Left = 467
      Top = 6
      Width = 75
      Height = 25
      Align = alRight
      Caption = '&OK'
      Default = True
      ModalResult = 1
      TabOrder = 0
    end
    object CancelButton: TButton
      Left = 548
      Top = 6
      Width = 75
      Height = 25
      Align = alRight
      Caption = 'Cancel'
      ModalResult = 2
      TabOrder = 1
    end
    object Separator1Panel: TPanel
      Left = 542
      Top = 6
      Width = 6
      Height = 25
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 2
    end
  end
  object TopPanel: TPanel
    Left = 0
    Top = 0
    Width = 629
    Height = 222
    Align = alClient
    BevelOuter = bvNone
    Padding.Left = 6
    Padding.Top = 6
    Padding.Right = 6
    TabOrder = 1
    object Panel3: TPanel
      Left = 6
      Top = 6
      Width = 617
      Height = 24
      Align = alTop
      BevelOuter = bvNone
      Padding.Bottom = 3
      TabOrder = 0
      object TimePicker: TDateTimePicker
        Left = 173
        Top = 0
        Width = 100
        Height = 21
        Align = alLeft
        Date = 41207.370341851850000000
        Time = 41207.370341851850000000
        Kind = dtkTime
        TabOrder = 1
      end
      object Panel7: TPanel
        Left = 0
        Top = 0
        Width = 70
        Height = 21
        Align = alLeft
        BevelOuter = bvNone
        Padding.Left = 3
        Padding.Top = 3
        TabOrder = 2
        object DateLabel: TLabel
          Left = 3
          Top = 3
          Width = 23
          Height = 18
          Align = alLeft
          Caption = 'Date'
          ExplicitHeight = 13
        end
      end
      object DatePicker: TDateTimePicker
        Left = 70
        Top = 0
        Width = 100
        Height = 21
        Align = alLeft
        Date = 41207.370341851850000000
        Time = 41207.370341851850000000
        TabOrder = 0
      end
      object Panel1: TPanel
        Left = 170
        Top = 0
        Width = 3
        Height = 21
        Align = alLeft
        BevelOuter = bvNone
        TabOrder = 3
      end
    end
    object Panel4: TPanel
      Left = 6
      Top = 30
      Width = 617
      Height = 24
      Align = alTop
      BevelOuter = bvNone
      Padding.Bottom = 3
      TabOrder = 1
      object Panel8: TPanel
        Left = 0
        Top = 0
        Width = 70
        Height = 21
        Align = alLeft
        BevelOuter = bvNone
        Padding.Left = 3
        Padding.Top = 3
        TabOrder = 0
        object SchemaLabel: TLabel
          Left = 3
          Top = 3
          Width = 37
          Height = 18
          Align = alLeft
          Caption = 'Schema'
          ExplicitHeight = 13
        end
      end
      object SchemaEdit: TBCEdit
        Left = 70
        Top = 0
        Width = 547
        Height = 21
        Align = alClient
        TabOrder = 1
        Text = ''
        EnterToTab = False
        OnlyNumbers = False
        NumbersWithDots = False
        NumbersWithSpots = False
        ErrorColor = 14803455
        NumbersAllowNegative = False
        FocusOnColor = clInfoBk
        FocusOffColor = clWindow
        UseColoring = True
      end
    end
    object Panel5: TPanel
      Left = 6
      Top = 54
      Width = 617
      Height = 168
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 2
      object Panel6: TPanel
        Left = 0
        Top = 0
        Width = 70
        Height = 168
        Align = alLeft
        BevelOuter = bvNone
        Padding.Left = 3
        Padding.Top = 3
        TabOrder = 0
        object SQLLabel: TLabel
          Left = 3
          Top = 3
          Width = 67
          Height = 13
          Align = alTop
          Caption = 'SQL'
          ExplicitWidth = 19
        end
      end
      object SQLSynEdit: TSynEdit
        Left = 70
        Top = 0
        Width = 547
        Height = 168
        Align = alClient
        Ctl3D = True
        ParentCtl3D = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = []
        TabOrder = 1
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
end
