inherited CreatePackageDialog: TCreatePackageDialog
  Caption = 'Create Package'
  ClientHeight = 387
  ClientWidth = 741
  OnShow = FormShow
  ExplicitWidth = 757
  ExplicitHeight = 423
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
    object BodyTabSheet: TTabSheet [1]
      Caption = 'Body'
      ImageIndex = 2
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 285
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
        ExplicitHeight = 285
        object BodySynEdit: TSynEdit
          Left = 0
          Top = 0
          Width = 724
          Height = 269
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
          ExplicitHeight = 284
        end
      end
    end
    inherited SourceTabSheet: TTabSheet
      Caption = 'Specification'
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 726
      ExplicitHeight = 285
      inherited SourcePanel: TPanel
        Width = 726
        Height = 270
        ExplicitWidth = 726
        ExplicitHeight = 285
        inherited SourceSynEdit: TSynEdit
          Width = 724
          Height = 245
          ExplicitWidth = 724
          ExplicitHeight = 260
        end
        inherited SourceTopPanel: TPanel
          Width = 724
          ExplicitWidth = 724
          inherited TopPanel: TPanel
            Width = 726
            ExplicitWidth = 726
          end
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
    Text = ''
    OnExit = PackageNameEditExit
    EnterToTab = False
    OnlyNumbers = False
    NumbersWithDots = False
    NumbersWithSpots = False
    ErrorColor = 14803198
    NumbersAllowNegative = False
    FocusOnColor = clInfoBk
    FocusOffColor = clWindow
    UseColoring = True
  end
  inherited StatusBar1: TStatusBar
    Top = 368
    Width = 741
    ExplicitTop = 368
    ExplicitWidth = 741
  end
end
