inherited CreateSynonymDialog: TCreateSynonymDialog
  Caption = 'Create Synonym'
  ClientHeight = 233
  ClientWidth = 325
  ExplicitWidth = 341
  ExplicitHeight = 271
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl: TBCPageControl
    Width = 318
    Height = 175
    ActivePage = SettingsTabSheet
    ActivePageCaption = 'Settings'
    ExplicitWidth = 318
    ExplicitHeight = 175
    object SettingsTabSheet: TTabSheet [0]
      Caption = 'Settings'
      ImageIndex = 1
      object Label1: TLabel
        Left = 8
        Top = 10
        Width = 74
        Height = 13
        Caption = 'Synonym Name'
      end
      object AvailabilityLabel: TLabel
        Left = 8
        Top = 37
        Width = 51
        Height = 13
        Caption = 'Availability'
      end
      object ObjectOwnerLabel: TLabel
        Left = 8
        Top = 65
        Width = 67
        Height = 13
        Caption = 'Object Owner'
      end
      object ObjectNameLabel: TLabel
        Left = 8
        Top = 92
        Width = 62
        Height = 13
        Caption = 'Object Name'
      end
      object DBLinkLabel: TLabel
        Left = 8
        Top = 119
        Width = 67
        Height = 13
        Caption = 'Database Link'
      end
      object SynonymNameEdit: TBCEdit
        Left = 97
        Top = 7
        Width = 202
        Height = 21
        Hint = 'Synonym name'
        TabOrder = 0
        EnterToTab = False
        OnlyNumbers = False
        NumbersWithDots = False
        NumbersWithSpots = False
        ErrorColor = 14803198
        NumbersAllowNegative = False
      end
      object PublicRadioButton: TRadioButton
        Left = 96
        Top = 36
        Width = 53
        Height = 17
        Caption = 'Public'
        Checked = True
        TabOrder = 1
        TabStop = True
      end
      object PrivateRadioButton: TRadioButton
        Left = 165
        Top = 36
        Width = 113
        Height = 17
        Caption = 'Private'
        TabOrder = 2
      end
      object ObjectOwnerComboBox: TBCComboBox
        Left = 97
        Top = 62
        Width = 202
        Height = 21
        Hint = 'Object owner'
        TabOrder = 3
        DeniedKeyStrokes = True
        ReadOnly = False
        DropDownFixedWidth = 0
      end
      object ObjectNameComboBox: TBCComboBox
        Left = 97
        Top = 89
        Width = 202
        Height = 21
        Hint = 'Object name'
        TabOrder = 4
        DeniedKeyStrokes = True
        ReadOnly = False
        DropDownFixedWidth = 0
      end
      object DBLinkComboBox: TBCComboBox
        Left = 97
        Top = 116
        Width = 202
        Height = 21
        Hint = 'Database link'
        TabOrder = 5
        DeniedKeyStrokes = True
        ReadOnly = False
        DropDownFixedWidth = 0
      end
    end
    inherited SourceTabSheet: TTabSheet
      ExplicitWidth = 310
      ExplicitHeight = 147
      inherited SourcePanel: TPanel
        Width = 310
        Height = 147
        ExplicitWidth = 310
        ExplicitHeight = 147
        inherited SourceSynEdit: TSynEdit
          Width = 308
          Height = 122
          ExplicitWidth = 308
          ExplicitHeight = 122
        end
        inherited SourceTopPanel: TPanel
          Width = 308
          ExplicitWidth = 308
        end
      end
    end
  end
  inherited OKButton: TButton
    Left = 162
    Top = 183
    ExplicitLeft = 162
    ExplicitTop = 183
  end
  inherited CancelButton: TButton
    Left = 243
    Top = 183
    ExplicitLeft = 243
    ExplicitTop = 183
  end
  inherited StatusBar1: TStatusBar
    Top = 214
    Width = 325
    ExplicitTop = 214
    ExplicitWidth = 325
  end
end
