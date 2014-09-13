inherited CreateDBLinkDialog: TCreateDBLinkDialog
  Caption = 'Create Database Link'
  ClientHeight = 233
  ClientWidth = 315
  ExplicitWidth = 331
  ExplicitHeight = 271
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl: TBCPageControl
    Width = 308
    Height = 175
    ActivePage = SettingsTabSheet
    ActivePageCaption = 'Settings'
    ExplicitWidth = 308
    ExplicitHeight = 175
    object SettingsTabSheet: TTabSheet [0]
      Caption = 'Settings'
      ImageIndex = 1
      DesignSize = (
        300
        147)
      object LinkNameLabel: TLabel
        Left = 8
        Top = 9
        Width = 48
        Height = 13
        Caption = 'Link Name'
      end
      object AvailabilityLabel: TLabel
        Left = 8
        Top = 37
        Width = 51
        Height = 13
        Caption = 'Availability'
      end
      object UserNameLabel: TLabel
        Left = 8
        Top = 66
        Width = 52
        Height = 13
        Caption = 'User Name'
      end
      object PasswordLabel: TLabel
        Left = 8
        Top = 93
        Width = 46
        Height = 13
        Caption = 'Password'
      end
      object ServiceNameLabel: TLabel
        Left = 7
        Top = 120
        Width = 65
        Height = 13
        Caption = 'Service Name'
      end
      object LinkNameEdit: TBCEdit
        Left = 94
        Top = 6
        Width = 198
        Height = 21
        Hint = 'Link name'
        Anchors = [akLeft, akTop, akRight]
        CharCase = ecUpperCase
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
      object UserNameEdit: TBCEdit
        Left = 94
        Top = 63
        Width = 120
        Height = 21
        Hint = 'User name'
        Anchors = [akLeft, akTop, akRight]
        CharCase = ecUpperCase
        TabOrder = 3
        EnterToTab = False
        OnlyNumbers = False
        NumbersWithDots = False
        NumbersWithSpots = False
        ErrorColor = 14803198
        NumbersAllowNegative = False
      end
      object PasswordEdit: TBCEdit
        Left = 94
        Top = 90
        Width = 120
        Height = 21
        Hint = 'Password'
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 4
        EnterToTab = False
        OnlyNumbers = False
        NumbersWithDots = False
        NumbersWithSpots = False
        ErrorColor = 14803198
        NumbersAllowNegative = False
      end
      object ServiceNameComboBox: TBCComboBox
        Left = 94
        Top = 117
        Width = 198
        Height = 21
        Hint = 'Service name'
        Anchors = [akLeft, akTop, akRight]
        CharCase = ecUpperCase
        TabOrder = 5
        DeniedKeyStrokes = True
        ReadOnly = False
        DropDownFixedWidth = 0
      end
    end
    inherited SourceTabSheet: TTabSheet
      ExplicitWidth = 300
      ExplicitHeight = 147
      inherited SourcePanel: TPanel
        Width = 300
        Height = 147
        ExplicitWidth = 300
        ExplicitHeight = 147
        inherited SourceSynEdit: TSynEdit
          Width = 298
          Height = 122
          ExplicitWidth = 298
          ExplicitHeight = 122
        end
        inherited SourceTopPanel: TPanel
          Width = 298
          ExplicitWidth = 298
          inherited TopPanel: TPanel
            inherited SourceToolBar: TBCToolBar
              Height = 24
              Align = alLeft
              ExplicitHeight = 24
            end
          end
        end
      end
    end
  end
  inherited OKButton: TButton
    Left = 152
    Top = 185
    ExplicitLeft = 152
    ExplicitTop = 185
  end
  inherited CancelButton: TButton
    Left = 233
    Top = 185
    ExplicitLeft = 233
    ExplicitTop = 185
  end
  inherited StatusBar1: TStatusBar
    Top = 214
    Width = 315
    ExplicitTop = 214
    ExplicitWidth = 315
  end
end
