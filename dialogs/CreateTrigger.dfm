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
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
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
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
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
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
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
      Caption = 'Settings'
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
