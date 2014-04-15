inherited GrantPrivilegesDialog: TGrantPrivilegesDialog
  Caption = 'Grant Privileges'
  ClientHeight = 340
  ClientWidth = 333
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl: TBCPageControl
    Width = 326
    Height = 282
    object SettingsTabSheet: TTabSheet [0]
      Caption = 'Settings'
      ImageIndex = 1
      DesignSize = (
        318
        254)
      object GrantGroupBox: TGroupBox
        Left = 6
        Top = 0
        Width = 303
        Height = 72
        Anchors = [akLeft, akTop, akRight]
        Caption = ' Grant '
        TabOrder = 0
        object DeleteCheckBox: TBCCheckBox
          Left = 236
          Top = 20
          Width = 58
          Height = 15
          Caption = ' DELETE'
          TabOrder = 3
          AutoSize = True
          ReadOnly = False
        end
        object SelectCheckBox: TBCCheckBox
          Left = 12
          Top = 20
          Width = 58
          Height = 15
          Caption = ' SELECT'
          TabOrder = 0
          AutoSize = True
          ReadOnly = False
        end
        object InsertCheckBox: TBCCheckBox
          Left = 85
          Top = 20
          Width = 58
          Height = 15
          Caption = ' INSERT'
          TabOrder = 1
          AutoSize = True
          ReadOnly = False
        end
        object UpdateCheckBox: TBCCheckBox
          Left = 159
          Top = 20
          Width = 61
          Height = 15
          Caption = ' UPDATE'
          TabOrder = 2
          AutoSize = True
          ReadOnly = False
        end
        object ExecuteCheckBox: TBCCheckBox
          Left = 12
          Top = 43
          Width = 66
          Height = 15
          Caption = ' EXECUTE'
          TabOrder = 4
          AutoSize = True
          ReadOnly = False
        end
        object AlterCheckBox: TBCCheckBox
          Left = 85
          Top = 43
          Width = 53
          Height = 15
          Caption = ' ALTER'
          TabOrder = 5
          AutoSize = True
          ReadOnly = False
        end
        object DebugCheckBox: TBCCheckBox
          Left = 159
          Top = 43
          Width = 55
          Height = 15
          Caption = ' DEBUG'
          TabOrder = 6
          AutoSize = True
          ReadOnly = False
        end
      end
      object OnGroupBox: TGroupBox
        Left = 6
        Top = 73
        Width = 303
        Height = 52
        Anchors = [akLeft, akTop, akRight]
        Caption = ' On '
        TabOrder = 1
        object OnEdit: TBCEdit
          Left = 12
          Top = 18
          Width = 279
          Height = 21
          TabStop = False
          Color = clBtnFace
          ReadOnly = True
          TabOrder = 0
          EnterToTab = False
          OnlyNumbers = False
          NumbersWithDots = False
          NumbersWithSpots = False
          ErrorColor = 14803198
          NumbersAllowNegative = False
        end
      end
      object ToGroupBox: TGroupBox
        Left = 6
        Top = 127
        Width = 303
        Height = 96
        Anchors = [akLeft, akTop, akRight]
        Caption = ' To '
        TabOrder = 2
        object UserRadioButton: TRadioButton
          Left = 12
          Top = 22
          Width = 113
          Height = 17
          Caption = ' User'
          Checked = True
          TabOrder = 0
          TabStop = True
        end
        object RoleRadioButton: TRadioButton
          Left = 12
          Top = 45
          Width = 113
          Height = 17
          Caption = ' Role'
          TabOrder = 1
        end
        object PublicRadioButton: TRadioButton
          Left = 12
          Top = 68
          Width = 113
          Height = 17
          Caption = ' Public'
          TabOrder = 2
        end
        object UserComboBox: TBCComboBox
          Left = 66
          Top = 22
          Width = 225
          Height = 21
          TabOrder = 3
          DeniedKeyStrokes = False
          ReadOnly = False
          DropDownFixedWidth = 0
        end
        object RoleComboBox: TBCComboBox
          Left = 66
          Top = 45
          Width = 225
          Height = 21
          TabOrder = 4
          DeniedKeyStrokes = False
          ReadOnly = False
          DropDownFixedWidth = 0
        end
      end
      object GrantOptionCheckBox: TBCCheckBox
        Left = 10
        Top = 230
        Width = 84
        Height = 15
        Anchors = [akLeft, akBottom]
        Caption = ' Grant Option'
        TabOrder = 3
        AutoSize = True
        ReadOnly = False
      end
    end
    inherited SourceTabSheet: TTabSheet
      inherited SourcePanel: TPanel
        Width = 318
        Height = 254
        inherited SourceSynEdit: TSynEdit
          Width = 316
          Height = 229
        end
        inherited SourceTopPanel: TPanel
          Width = 316
        end
      end
    end
  end
  inherited OKButton: TButton
    Left = 169
    Top = 290
  end
  inherited CancelButton: TButton
    Left = 250
    Top = 290
  end
  inherited StatusBar1: TStatusBar
    Top = 321
    Width = 333
  end
end
