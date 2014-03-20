object DataFilterDialog: TDataFilterDialog
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Data Filter'
  ClientHeight = 438
  ClientWidth = 704
  Color = clWindow
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 401
    Width = 704
    Height = 37
    Align = alBottom
    BevelOuter = bvNone
    Padding.Left = 6
    Padding.Top = 6
    Padding.Right = 6
    Padding.Bottom = 6
    TabOrder = 0
    ExplicitTop = 368
    object Button11: TButton
      Left = 6
      Top = 6
      Width = 75
      Height = 25
      Action = ClearFilterAction
      Align = alLeft
      TabOrder = 0
    end
    object OKButton: TButton
      Left = 542
      Top = 6
      Width = 75
      Height = 25
      Action = OKAction
      Align = alRight
      Default = True
      TabOrder = 1
    end
    object CancelButton: TButton
      Left = 623
      Top = 6
      Width = 75
      Height = 25
      Align = alRight
      Caption = 'Cancel'
      ModalResult = 2
      TabOrder = 2
    end
    object Separator1Panel: TPanel
      Left = 617
      Top = 6
      Width = 6
      Height = 25
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 3
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 704
    Height = 401
    Align = alClient
    BevelOuter = bvNone
    Padding.Left = 6
    Padding.Top = 6
    Padding.Right = 6
    TabOrder = 1
    ExplicitHeight = 368
    object Panel3: TPanel
      Left = 179
      Top = 6
      Width = 80
      Height = 395
      Align = alLeft
      BevelOuter = bvNone
      Padding.Left = 6
      Padding.Right = 6
      TabOrder = 0
      ExplicitHeight = 362
      object Label1: TLabel
        Left = 13
        Top = 3
        Width = 54
        Height = 13
        Caption = 'Filter Name'
      end
      object EqualButton: TButton
        Left = 8
        Top = 26
        Width = 63
        Height = 25
        Action = EqualAction
        TabOrder = 0
      end
      object SmallerButton: TButton
        Left = 8
        Top = 57
        Width = 63
        Height = 25
        Action = SmallerAction
        TabOrder = 1
      end
      object SmallerOrEqualButton: TButton
        Left = 8
        Top = 88
        Width = 63
        Height = 25
        Action = SmallerOrEqualAction
        TabOrder = 2
      end
      object InequalButton: TButton
        Left = 8
        Top = 119
        Width = 63
        Height = 25
        Action = InequalAction
        TabOrder = 3
      end
      object EqualOrGreaterButton: TButton
        Left = 8
        Top = 150
        Width = 63
        Height = 25
        Action = EqualOrGreaterAction
        TabOrder = 4
      end
      object GreaterButton: TButton
        Left = 8
        Top = 181
        Width = 63
        Height = 25
        Action = GreaterAction
        TabOrder = 5
      end
      object AndButton: TButton
        Left = 8
        Top = 212
        Width = 63
        Height = 25
        Action = AndAction
        TabOrder = 6
      end
      object OrButton: TButton
        Left = 8
        Top = 243
        Width = 63
        Height = 25
        Action = OrAction
        TabOrder = 7
      end
      object BetweenButton: TButton
        Left = 8
        Top = 306
        Width = 63
        Height = 25
        Action = BetweenAction
        TabOrder = 9
      end
      object ToDateButton: TButton
        Left = 8
        Top = 368
        Width = 63
        Height = 25
        Action = ToDateAction
        TabOrder = 11
      end
      object InButton: TButton
        Left = 8
        Top = 337
        Width = 63
        Height = 25
        Action = InAction
        TabOrder = 10
      end
      object LikeButton: TButton
        Left = 8
        Top = 274
        Width = 63
        Height = 25
        Action = LikeAction
        TabOrder = 8
      end
    end
    object ColumnListBox: TJvListBox
      Left = 6
      Top = 6
      Width = 173
      Height = 395
      Align = alLeft
      ItemHeight = 13
      Background.FillMode = bfmTile
      Background.Visible = False
      TabOrder = 1
      OnClick = ColumnClickActionExecute
      ExplicitHeight = 362
    end
    object Panel4: TPanel
      Left = 259
      Top = 6
      Width = 439
      Height = 395
      Align = alClient
      BevelOuter = bvNone
      Caption = 'Panel4'
      TabOrder = 2
      ExplicitHeight = 362
      object FilterSynEdit: TSynEdit
        Left = 0
        Top = 24
        Width = 439
        Height = 371
        Align = alClient
        Ctl3D = True
        ParentCtl3D = False
        CodeFolding.CaseSensitive = False
        CodeFolding.FolderBarLinesColor = 12434877
        ActiveLine.Background = clYellow
        ActiveLine.Foreground = clNavy
        ActiveLine.Visible = True
        LineDivider.Visible = False
        LineDivider.Color = clRed
        LineDivider.Style = psSolid
        RightEdge.MouseMove = False
        RightEdge.Visible = True
        RightEdge.Position = 80
        RightEdge.Color = clSilver
        RightEdge.Style = psSolid
        LineSpacing = 0
        LineSpacingRule = lsSpecified
        Background.Visible = False
        Background.RepeatMode = brmNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = []
        TabOrder = 0
        Gutter.ShowLineModified = False
        Gutter.LineModifiedColor = clYellow
        Gutter.LineNormalColor = clLime
        Gutter.Intens = False
        Gutter.AutoSize = True
        Gutter.Font.Charset = DEFAULT_CHARSET
        Gutter.Font.Color = clWindowText
        Gutter.Font.Height = -11
        Gutter.Font.Name = 'Courier New'
        Gutter.Font.Style = []
        Gutter.BookmarkPanelColor = clNone
        Gutter.RightOffset = 2
        Gutter.RightOffsetColor = clNone
        Gutter.ShowLineNumbers = True
        Gutter.ShowBookmarks = False
        Gutter.ShowBookmarkPanel = False
        Gutter.Width = 34
        Highlighter = SynSQLSyn
        Options = [eoAutoIndent, eoDragDropEditing, eoEnhanceEndKey, eoGroupUndo, eoShowScrollHint, eoSmartTabDelete, eoSmartTabs, eoTabsToSpaces, eoTrimTrailingSpaces]
        WantTabs = True
        WordWrap.Enabled = False
        WordWrap.Position = 80
        WordWrap.Style = wwsClientWidth
        OnChange = FilterSynEditChange
        FontSmoothing = fsmNone
        ExplicitHeight = 338
      end
      object Panel5: TPanel
        Left = 0
        Top = 0
        Width = 439
        Height = 24
        Align = alTop
        BevelOuter = bvNone
        Caption = 'Panel5'
        Padding.Bottom = 3
        TabOrder = 1
        object FilterNameEdit: TBCEdit
          Left = 0
          Top = 0
          Width = 439
          Height = 21
          Align = alClient
          TabOrder = 0
          OnChange = FilterNameEditChange
          OnKeyPress = FilterNameEditKeyPress
          EnterToTab = False
          OnlyNumbers = False
          NumbersWithDots = False
          NumbersWithSpots = False
          ErrorColor = 14803198
          NumbersAllowNegative = False
        end
      end
    end
  end
  object ActionList: TActionList
    Left = 256
    Top = 204
    object ColumnClickAction: TAction
      Category = 'Click'
      Caption = 'ColumnClickAction'
      OnExecute = ColumnClickActionExecute
    end
    object OKAction: TAction
      Category = 'Click'
      Caption = '&OK'
      OnExecute = OKActionExecute
    end
    object SmallerAction: TAction
      Category = 'Click'
      Caption = '<'
      OnExecute = SmallerActionExecute
    end
    object SmallerOrEqualAction: TAction
      Category = 'Click'
      Caption = '<='
      OnExecute = SmallerOrEqualActionExecute
    end
    object InequalAction: TAction
      Category = 'Click'
      Caption = '<>'
      OnExecute = InequalActionExecute
    end
    object EqualOrGreaterAction: TAction
      Category = 'Click'
      Caption = '=>'
      OnExecute = EqualOrGreaterActionExecute
    end
    object GreaterAction: TAction
      Category = 'Click'
      Caption = '>'
      OnExecute = GreaterActionExecute
    end
    object EqualAction: TAction
      Category = 'Click'
      Caption = '='
      OnExecute = EqualActionExecute
    end
    object AndAction: TAction
      Category = 'Click'
      Caption = 'AND'
      OnExecute = AndActionExecute
    end
    object OrAction: TAction
      Category = 'Click'
      Caption = 'OR'
      OnExecute = OrActionExecute
    end
    object BetweenAction: TAction
      Category = 'Click'
      Caption = 'BETWEEN'
      OnExecute = BetweenActionExecute
    end
    object ToDateAction: TAction
      Category = 'Click'
      Caption = 'TO_DATE'
      OnExecute = ToDateActionExecute
    end
    object ClearFilterAction: TAction
      Category = 'Click'
      Caption = 'Clear &Filter'
      OnExecute = ClearFilterActionExecute
    end
    object InAction: TAction
      Category = 'Click'
      Caption = 'IN'
      OnExecute = InActionExecute
    end
    object LikeAction: TAction
      Category = 'Click'
      Caption = 'LIKE'
      OnExecute = LikeActionExecute
    end
  end
  object SynSQLSyn: TSynSQLSyn
    CommentAttri.Foreground = clGreen
    DataTypeAttri.Foreground = clRed
    DataTypeAttri.Style = []
    FunctionAttri.Foreground = clBlue
    KeyAttri.Foreground = clBlue
    KeyAttri.Style = []
    NumberAttri.Foreground = clRed
    StringAttri.Foreground = clPurple
    VariableAttri.Foreground = clNavy
    Left = 412
    Top = 160
  end
  object FilterMultiStringHolder: TJvMultiStringHolder
    MultipleStrings = <>
    Left = 284
    Top = 64
  end
end
