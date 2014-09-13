inherited CreateTriggerDialog: TCreateTriggerDialog
  Caption = 'Create Trigger'
  ClientHeight = 318
  ClientWidth = 357
  ExplicitWidth = 373
  ExplicitHeight = 356
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
    Visible = False
    OnChange = PageControlChange
    EnterToTab = False
    OnlyNumbers = False
    NumbersWithDots = False
    NumbersWithSpots = False
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
    ExplicitHeight = 204
    object SettingsTabSheet: TTabSheet [0]
      Caption = 'Settings'
      ImageIndex = 1
      DesignSize = (
        342
        176)
      object WhenRadioGroup: TRadioGroup
        Left = 3
        Top = 0
        Width = 332
        Height = 45
        Anchors = [akLeft, akTop, akRight]
        Caption = 'When '
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
        Caption = 'On '
        TabOrder = 1
        DesignSize = (
          332
          45)
        object DeleteCheckBox: TBCCheckBox
          Left = 139
          Top = 20
          Width = 52
          Height = 17
          Anchors = [akTop]
          Caption = 'Delete'
          TabOrder = 0
          LinkedControls = <>
        end
        object InsertCheckBox: TBCCheckBox
          Left = 11
          Top = 20
          Width = 50
          Height = 17
          Caption = 'Insert'
          TabOrder = 1
          LinkedControls = <>
        end
        object UpdateCheckBox: TBCCheckBox
          Left = 269
          Top = 20
          Width = 56
          Height = 17
          Anchors = [akTop, akRight]
          Caption = 'Update'
          TabOrder = 2
          LinkedControls = <>
        end
      end
      object ReferencingGroupBox: TGroupBox
        Left = 3
        Top = 94
        Width = 332
        Height = 77
        Anchors = [akLeft, akTop, akRight]
        Caption = 'Referencing '
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
          EnterToTab = False
          OnlyNumbers = False
          NumbersWithDots = False
          NumbersWithSpots = False
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
          EnterToTab = False
          OnlyNumbers = False
          NumbersWithDots = False
          NumbersWithSpots = False
          ErrorColor = 14803198
          NumbersAllowNegative = False
        end
      end
    end
    object WhenClauseTabSheet: TTabSheet [1]
      Caption = 'When Clause'
      ImageIndex = 2
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
        object WhenClauseSynEdit: TSynEdit
          Left = 0
          Top = 0
          Width = 340
          Height = 175
          ActiveLine.Background = clYellow
          ActiveLine.Foreground = clNavy
          ActiveLine.Visible = True
          Align = alClient
          Background.Visible = False
          Background.RepeatMode = brmNone
          CodeFolding.CaseSensitive = False
          CodeFolding.FolderBarLinesColor = 12434877
          Ctl3D = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = []
          FontSmoothing = fsmNone
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
          Gutter.Width = 54
          Gutter.Gradient = True
          Highlighter = SynSQLSyn
          LineDivider.Visible = False
          LineDivider.Color = clRed
          LineDivider.Style = psSolid
          LineSpacing = 0
          LineSpacingRule = lsSpecified
          Options = [eoAutoIndent, eoDragDropEditing, eoEnhanceEndKey, eoGroupUndo, eoShowScrollHint, eoSmartTabDelete, eoSmartTabs, eoTabsToSpaces, eoTrimTrailingSpaces]
          ParentCtl3D = False
          RightEdge.MouseMove = False
          RightEdge.Visible = True
          RightEdge.Position = 80
          RightEdge.Color = clSilver
          RightEdge.Style = psSolid
          TabOrder = 0
          WantTabs = True
          WordWrap.Enabled = False
          WordWrap.Position = 80
          WordWrap.Style = wwsClientWidth
        end
      end
    end
    object BodyTabSheet: TTabSheet [2]
      Caption = 'Body'
      ImageIndex = 3
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
        object BodySynEdit: TSynEdit
          Left = 0
          Top = 0
          Width = 340
          Height = 175
          ActiveLine.Background = clYellow
          ActiveLine.Foreground = clNavy
          ActiveLine.Visible = True
          Align = alClient
          Background.Visible = False
          Background.RepeatMode = brmNone
          CodeFolding.CaseSensitive = False
          CodeFolding.FolderBarLinesColor = 12434877
          Ctl3D = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = []
          FontSmoothing = fsmNone
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
          Gutter.Width = 54
          Gutter.Gradient = True
          Highlighter = SynSQLSyn
          LineDivider.Visible = False
          LineDivider.Color = clRed
          LineDivider.Style = psSolid
          LineSpacing = 0
          LineSpacingRule = lsSpecified
          Options = [eoAutoIndent, eoDragDropEditing, eoEnhanceEndKey, eoGroupUndo, eoShowScrollHint, eoSmartTabDelete, eoSmartTabs, eoTabsToSpaces, eoTrimTrailingSpaces]
          ParentCtl3D = False
          RightEdge.MouseMove = False
          RightEdge.Visible = True
          RightEdge.Position = 80
          RightEdge.Color = clSilver
          RightEdge.Style = psSolid
          TabOrder = 0
          WantTabs = True
          WordWrap.Enabled = False
          WordWrap.Position = 80
          WordWrap.Style = wwsClientWidth
        end
      end
    end
    inherited SourceTabSheet: TTabSheet
      ExplicitWidth = 342
      ExplicitHeight = 176
      inherited SourcePanel: TPanel
        Width = 342
        Height = 176
        ExplicitWidth = 342
        ExplicitHeight = 176
        inherited SourceSynEdit: TSynEdit
          Width = 340
          Height = 151
          ExplicitWidth = 340
          ExplicitHeight = 151
        end
        inherited SourceTopPanel: TPanel
          Width = 340
          ExplicitWidth = 340
        end
      end
    end
  end
  inherited OKButton: TButton
    Left = 193
    Top = 268
    ExplicitLeft = 193
    ExplicitTop = 268
  end
  inherited CancelButton: TButton
    Left = 274
    Top = 268
    ExplicitLeft = 274
    ExplicitTop = 268
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
    OnChange = PageControlChange
    EnterToTab = False
    OnlyNumbers = False
    NumbersWithDots = False
    NumbersWithSpots = False
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
    DeniedKeyStrokes = False
    ReadOnly = False
    DropDownFixedWidth = 0
  end
  inherited StatusBar1: TStatusBar
    Top = 299
    Width = 357
    ExplicitTop = 299
    ExplicitWidth = 357
  end
end
