inherited CreateSequenceDialog: TCreateSequenceDialog
  Caption = 'Create Sequence'
  ClientHeight = 280
  ClientWidth = 365
  OnShow = FormShow
  ExplicitWidth = 381
  ExplicitHeight = 316
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl: TBCPageControl
    Width = 358
    Height = 221
    ActivePage = SettingsTabSheet
    ActivePageCaption = 'Settings'
    ExplicitWidth = 358
    ExplicitHeight = 221
    object SettingsTabSheet: TTabSheet [0]
      Caption = 'Settings'
      ImageIndex = 1
      DesignSize = (
        350
        193)
      object SequenceNameLabel: TLabel
        Left = 8
        Top = 9
        Width = 77
        Height = 13
        Caption = 'Sequence Name'
      end
      object MinValueLabel: TLabel
        Left = 8
        Top = 36
        Width = 45
        Height = 13
        Caption = 'Min Value'
      end
      object MaxValueLabel: TLabel
        Left = 8
        Top = 63
        Width = 49
        Height = 13
        Caption = 'Max Value'
      end
      object StartWithLabel: TLabel
        Left = 8
        Top = 90
        Width = 49
        Height = 13
        Caption = 'Start With'
      end
      object IncrementByLabel: TLabel
        Left = 8
        Top = 117
        Width = 64
        Height = 13
        Caption = 'Increment By'
      end
      object CacheLabel: TLabel
        Left = 8
        Top = 144
        Width = 30
        Height = 13
        Caption = 'Cache'
      end
      object SequenceNameEdit: TBCEdit
        Left = 94
        Top = 6
        Width = 248
        Height = 21
        Hint = 'Sequence name'
        Anchors = [akLeft, akTop, akRight]
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
      object MinValueEdit: TBCEdit
        Left = 94
        Top = 33
        Width = 124
        Height = 21
        Hint = 'Min value'
        Anchors = [akLeft, akTop, akRight]
        CharCase = ecUpperCase
        TabOrder = 1
        Text = '1'
        EnterToTab = False
        OnlyNumbers = True
        NumbersWithDots = False
        NumbersWithSpots = False
        ErrorColor = 14803198
        NumbersAllowNegative = False
        EditColor = clInfoBk
        UseColoring = True
      end
      object MaxValueEdit: TBCEdit
        Left = 94
        Top = 60
        Width = 248
        Height = 21
        Hint = 'Max value'
        Anchors = [akLeft, akTop, akRight]
        CharCase = ecUpperCase
        TabOrder = 2
        Text = '999999999999999999999999999'
        EnterToTab = False
        OnlyNumbers = True
        NumbersWithDots = False
        NumbersWithSpots = False
        ErrorColor = 14803198
        NumbersAllowNegative = False
        EditColor = clInfoBk
        UseColoring = True
      end
      object StartWithEdit: TBCEdit
        Left = 94
        Top = 87
        Width = 124
        Height = 21
        Hint = 'Start with'
        Anchors = [akLeft, akTop, akRight]
        CharCase = ecUpperCase
        TabOrder = 3
        Text = '1'
        EnterToTab = False
        OnlyNumbers = True
        NumbersWithDots = False
        NumbersWithSpots = False
        ErrorColor = 14803198
        NumbersAllowNegative = False
        EditColor = clInfoBk
        UseColoring = True
      end
      object IncrementByEdit: TBCEdit
        Left = 94
        Top = 114
        Width = 124
        Height = 21
        Hint = 'Increment by'
        Anchors = [akLeft, akTop, akRight]
        CharCase = ecUpperCase
        TabOrder = 4
        Text = '1'
        EnterToTab = False
        OnlyNumbers = True
        NumbersWithDots = False
        NumbersWithSpots = False
        ErrorColor = 14803198
        NumbersAllowNegative = False
        EditColor = clInfoBk
        UseColoring = True
      end
      object CacheEdit: TBCEdit
        Left = 94
        Top = 141
        Width = 124
        Height = 21
        Hint = 'Cache'
        Anchors = [akLeft, akTop, akRight]
        CharCase = ecUpperCase
        TabOrder = 5
        Text = '20'
        EnterToTab = False
        OnlyNumbers = True
        NumbersWithDots = False
        NumbersWithSpots = False
        ErrorColor = 14803198
        NumbersAllowNegative = False
        EditColor = clInfoBk
        UseColoring = True
      end
      object OrderCheckBox: TCheckBox
        Left = 119
        Top = 168
        Width = 99
        Height = 17
        Alignment = taLeftJustify
        Caption = 'Order'
        Checked = True
        State = cbChecked
        TabOrder = 7
      end
      object CycleCheckBox: TCheckBox
        Left = 8
        Top = 168
        Width = 99
        Height = 17
        Alignment = taLeftJustify
        Caption = 'Cycle'
        TabOrder = 6
      end
    end
    inherited SourceTabSheet: TTabSheet
      Caption = 'Settings'
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 350
      ExplicitHeight = 209
      inherited SourcePanel: TPanel
        Width = 350
        Height = 193
        ExplicitWidth = 350
        ExplicitHeight = 209
        inherited SourceSynEdit: TSynEdit
          Width = 348
          Height = 168
          ExplicitWidth = 348
          ExplicitHeight = 184
        end
        inherited SourceTopPanel: TPanel
          Width = 348
          ExplicitWidth = 348
          inherited TopPanel: TPanel
            Width = 350
            ExplicitWidth = 350
          end
        end
      end
    end
  end
  inherited OKButton: TButton
    Left = 202
    Top = 230
    ExplicitLeft = 202
    ExplicitTop = 230
  end
  inherited CancelButton: TButton
    Left = 283
    Top = 230
    ExplicitLeft = 283
    ExplicitTop = 230
  end
  inherited StatusBar1: TStatusBar
    Top = 261
    Width = 365
    ExplicitTop = 261
    ExplicitWidth = 365
  end
end
