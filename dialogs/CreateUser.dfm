inherited CreateUserDialog: TCreateUserDialog
  Caption = 'Create User'
  ClientHeight = 402
  ClientWidth = 405
  ExplicitWidth = 421
  ExplicitHeight = 440
  PixelsPerInch = 96
  TextHeight = 13
  object UsernameLabel: TLabel [0]
    Left = 12
    Top = 17
    Width = 52
    Height = 13
    Caption = 'User Name'
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object PasswordLabel: TLabel [1]
    Left = 12
    Top = 44
    Width = 46
    Height = 13
    Caption = 'Password'
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  inherited PageControl: TBCPageControl
    Left = 6
    Top = 91
    Width = 398
    Height = 257
    ActivePage = RolesTabSheet
    ActivePageCaption = 'Roles'
    ExplicitLeft = 6
    ExplicitTop = 91
    ExplicitWidth = 398
    ExplicitHeight = 257
    object RolesTabSheet: TTabSheet [0]
      Caption = 'Roles'
      ImageIndex = 1
      object RolesPanel: TPanel
        Left = 0
        Top = 0
        Width = 390
        Height = 229
        Align = alClient
        BevelOuter = bvNone
        Padding.Right = 2
        Padding.Bottom = 1
        TabOrder = 0
        object RolesStringGrid: TBCStringGrid
          Left = 0
          Top = 0
          Width = 388
          Height = 228
          Align = alClient
          ColCount = 3
          DefaultRowHeight = 18
          FixedCols = 0
          RowCount = 2
          Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRowSelect, goThumbTracking, goFixedHotTrack]
          ScrollBars = ssVertical
          TabOrder = 0
          Alignment = taLeftJustify
          FixedFont.Charset = DEFAULT_CHARSET
          FixedFont.Color = clWindowText
          FixedFont.Height = -11
          FixedFont.Name = 'Tahoma'
          FixedFont.Style = []
          BooleanCols.Strings = (
            '1'
            '2')
          ColWidths = (
            235
            64
            64)
        end
      end
    end
    inherited SourceTabSheet: TTabSheet
      ExplicitWidth = 390
      ExplicitHeight = 229
      inherited SourcePanel: TPanel
        Width = 390
        Height = 229
        ExplicitWidth = 390
        ExplicitHeight = 229
        inherited SourceSynEdit: TSynEdit
          Width = 388
          Height = 204
          ExplicitWidth = 388
          ExplicitHeight = 204
        end
        inherited SourceTopPanel: TPanel
          Width = 388
          ExplicitWidth = 388
        end
      end
    end
  end
  inherited OKButton: TButton
    Left = 241
    Top = 352
    ExplicitLeft = 241
    ExplicitTop = 352
  end
  inherited CancelButton: TButton
    Left = 322
    Top = 352
    ExplicitLeft = 322
    ExplicitTop = 352
  end
  object UsernameEdit: TBCEdit [5]
    Left = 102
    Top = 14
    Width = 295
    Height = 21
    Hint = 'Username'
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
  object PasswordEdit: TBCEdit [6]
    Left = 102
    Top = 41
    Width = 295
    Height = 21
    Hint = 'Password'
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 4
    OnChange = PageControlChange
    EnterToTab = False
    OnlyNumbers = False
    NumbersWithDots = False
    NumbersWithSpots = False
    ErrorColor = 14803198
    NumbersAllowNegative = False
  end
  object PasswordExpiredCheckBox: TBCCheckBox [7]
    Left = 12
    Top = 68
    Width = 106
    Height = 17
    Hint = 'Password Expired'
    Caption = 'Password Expired'
    TabOrder = 5
    OnClick = PageControlChange
    LinkedControls = <>
  end
  inherited StatusBar1: TStatusBar
    Top = 383
    Width = 405
    ExplicitTop = 383
    ExplicitWidth = 405
  end
  object RolesQuery: TOraQuery
    LocalUpdate = True
    SQL.Strings = (
      'SELECT DISTINCT granted_role'
      '  FROM dba_role_privs'
      '-- WHERE grantee = :p_object_name'
      'ORDER BY 1')
    FetchAll = True
    AutoCommit = False
    Left = 300
    Top = 158
  end
end
