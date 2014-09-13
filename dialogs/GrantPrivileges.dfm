inherited GrantPrivilegesDialog: TGrantPrivilegesDialog
  Caption = 'Grant Privileges'
  ClientHeight = 340
  ClientWidth = 333
  ExplicitWidth = 349
  ExplicitHeight = 378
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl: TBCPageControl
    Width = 326
    Height = 282
    ActivePage = SettingsTabSheet
    ActivePageCaption = 'Settings'
    ExplicitWidth = 326
    ExplicitHeight = 282
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
        Caption = 'Grant '
        TabOrder = 0
        object DeleteCheckBox: TBCCheckBox
          Left = 236
          Top = 20
          Width = 57
          Height = 17
          Caption = 'DELETE'
          TabOrder = 3
          LinkedControls = <>
        end
        object SelectCheckBox: TBCCheckBox
          Left = 12
          Top = 20
          Width = 57
          Height = 17
          Caption = 'SELECT'
          TabOrder = 0
          LinkedControls = <>
        end
        object InsertCheckBox: TBCCheckBox
          Left = 85
          Top = 20
          Width = 57
          Height = 17
          Caption = 'INSERT'
          TabOrder = 1
          LinkedControls = <>
        end
        object UpdateCheckBox: TBCCheckBox
          Left = 159
          Top = 20
          Width = 60
          Height = 17
          Caption = 'UPDATE'
          TabOrder = 2
          LinkedControls = <>
        end
        object ExecuteCheckBox: TBCCheckBox
          Left = 12
          Top = 43
          Width = 65
          Height = 17
          Caption = 'EXECUTE'
          TabOrder = 4
          LinkedControls = <>
        end
        object AlterCheckBox: TBCCheckBox
          Left = 85
          Top = 43
          Width = 52
          Height = 17
          Caption = 'ALTER'
          TabOrder = 5
          LinkedControls = <>
        end
        object DebugCheckBox: TBCCheckBox
          Left = 159
          Top = 43
          Width = 54
          Height = 17
          Caption = 'DEBUG'
          TabOrder = 6
          LinkedControls = <>
        end
      end
      object OnGroupBox: TGroupBox
        Left = 6
        Top = 73
        Width = 303
        Height = 52
        Anchors = [akLeft, akTop, akRight]
        Caption = 'On '
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
        Caption = 'To '
        TabOrder = 2
        object UserRadioButton: TRadioButton
          Left = 12
          Top = 22
          Width = 113
          Height = 17
          Caption = 'User'
          Checked = True
          TabOrder = 0
          TabStop = True
        end
        object RoleRadioButton: TRadioButton
          Left = 12
          Top = 45
          Width = 113
          Height = 17
          Caption = 'Role'
          TabOrder = 1
        end
        object PublicRadioButton: TRadioButton
          Left = 12
          Top = 68
          Width = 113
          Height = 17
          Caption = 'Public'
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
        Width = 83
        Height = 17
        Anchors = [akLeft, akBottom]
        Caption = 'Grant Option'
        TabOrder = 3
        LinkedControls = <>
      end
    end
    inherited SourceTabSheet: TTabSheet
      ExplicitWidth = 318
      ExplicitHeight = 254
      inherited SourcePanel: TPanel
        Width = 318
        Height = 254
        ExplicitWidth = 318
        ExplicitHeight = 254
        inherited SourceSynEdit: TSynEdit
          Width = 316
          Height = 229
          ExplicitWidth = 316
          ExplicitHeight = 229
        end
        inherited SourceTopPanel: TPanel
          Width = 316
          ExplicitWidth = 316
        end
      end
    end
  end
  inherited OKButton: TButton
    Left = 169
    Top = 290
    ExplicitLeft = 169
    ExplicitTop = 290
  end
  inherited CancelButton: TButton
    Left = 250
    Top = 290
    ExplicitLeft = 250
    ExplicitTop = 290
  end
  inherited StatusBar1: TStatusBar
    Top = 321
    Width = 333
    ExplicitTop = 321
    ExplicitWidth = 333
  end
end
