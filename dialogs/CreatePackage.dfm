inherited CreatePackageDialog: TCreatePackageDialog
  Caption = 'Create Package'
  ClientHeight = 387
  ClientWidth = 741
  ExplicitWidth = 757
  ExplicitHeight = 425
  PixelsPerInch = 96
  TextHeight = 13
  object PackageNameLabel: TLabel [0]
    Left = 8
    Top = 11
    Width = 70
    Height = 13
    Caption = 'Package Name'
  end
  inherited PageControl: TBCPageControl
    Top = 35
    Width = 734
    Height = 298
    ActivePage = SpecificationTabSheet
    ActivePageCaption = 'Specification'
    ExplicitTop = 35
    ExplicitWidth = 734
    ExplicitHeight = 298
    object SpecificationTabSheet: TTabSheet [0]
      Caption = 'Specification'
      ImageIndex = 1
      object SepcificationPanel: TPanel
        Left = 0
        Top = 0
        Width = 726
        Height = 270
        Align = alClient
        BevelOuter = bvNone
        Padding.Right = 2
        Padding.Bottom = 1
        TabOrder = 0
        object SpecificationSynEdit: TSynEdit
          Left = 0
          Top = 0
          Width = 724
          Height = 269
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
    object BodyTabSheet: TTabSheet [1]
      Caption = 'Body'
      ImageIndex = 2
      object BodyPanel: TPanel
        Left = 0
        Top = 0
        Width = 726
        Height = 270
        Align = alClient
        BevelOuter = bvNone
        Padding.Right = 2
        Padding.Bottom = 1
        TabOrder = 0
        object BodySynEdit: TSynEdit
          Left = 0
          Top = 0
          Width = 724
          Height = 269
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
      ExplicitWidth = 726
      ExplicitHeight = 270
      inherited SourcePanel: TPanel
        Width = 726
        Height = 270
        ExplicitWidth = 726
        ExplicitHeight = 270
        inherited SourceSynEdit: TSynEdit
          Width = 724
          Height = 245
          ExplicitWidth = 724
          ExplicitHeight = 245
        end
        inherited SourceTopPanel: TPanel
          Width = 724
          ExplicitWidth = 724
        end
      end
    end
  end
  inherited OKButton: TButton
    Left = 578
    Top = 337
    ExplicitLeft = 578
    ExplicitTop = 337
  end
  inherited CancelButton: TButton
    Left = 659
    Top = 337
    ExplicitLeft = 659
    ExplicitTop = 337
  end
  object PackageNameEdit: TBCEdit [4]
    Left = 100
    Top = 8
    Width = 299
    Height = 21
    Hint = 'Package name'
    Anchors = [akLeft, akTop, akRight]
    CharCase = ecUpperCase
    TabOrder = 3
    OnExit = PackageNameEditExit
    EnterToTab = False
    OnlyNumbers = False
    NumbersWithDots = False
    NumbersWithSpots = False
    ErrorColor = 14803198
    NumbersAllowNegative = False
  end
  inherited StatusBar1: TStatusBar
    Top = 368
    Width = 741
    ExplicitTop = 368
    ExplicitWidth = 741
  end
end
