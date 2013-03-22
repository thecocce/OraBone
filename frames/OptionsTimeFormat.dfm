object TimeFormatFrame: TTimeFormatFrame
  Left = 0
  Top = 0
  Width = 582
  Height = 304
  Align = alClient
  TabOrder = 0
  ExplicitWidth = 451
  object Panel: TPanel
    Left = 0
    Top = 0
    Width = 582
    Height = 304
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitWidth = 451
    object TimeFormatLabel: TLabel
      Left = 11
      Top = 13
      Width = 59
      Height = 13
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Time Format'
    end
    object Label25: TLabel
      Left = 11
      Top = 39
      Width = 40
      Height = 13
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Example'
    end
    object Label26: TLabel
      Left = 11
      Top = 65
      Width = 493
      Height = 26
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 
        'Use the Time Format property to specify the default time format ' +
        'used when Oracle makes conversions from internal time format int' +
        'o string values and vice versa.'
      WordWrap = True
    end
    object Label29: TLabel
      Left = 11
      Top = 94
      Width = 14
      Height = 13
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'HH'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      WordWrap = True
    end
    object Label32: TLabel
      Left = 11
      Top = 110
      Width = 26
      Height = 13
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'HH24'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      WordWrap = True
    end
    object Label33: TLabel
      Left = 11
      Top = 126
      Width = 12
      Height = 13
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'MI'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      WordWrap = True
    end
    object Label34: TLabel
      Left = 11
      Top = 142
      Width = 12
      Height = 13
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'SS'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      WordWrap = True
    end
    object Label47: TLabel
      Left = 53
      Top = 142
      Width = 72
      Height = 13
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Second (0-59).'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      WordWrap = True
    end
    object Label48: TLabel
      Left = 52
      Top = 126
      Width = 69
      Height = 13
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Minute (0-59).'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      WordWrap = True
    end
    object Label31: TLabel
      Left = 53
      Top = 110
      Width = 94
      Height = 13
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Hour of day (0-23).'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      WordWrap = True
    end
    object Label30: TLabel
      Left = 53
      Top = 94
      Width = 94
      Height = 13
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Hour of day (1-12).'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      WordWrap = True
    end
    object TimeFormatExampleEdit: TBCEdit
      Left = 84
      Top = 36
      Width = 355
      Height = 21
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      TabStop = False
      CharCase = ecUpperCase
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 0
      OnlyNumbers = False
      NumbersWithDots = False
      NumbersWithSpots = False
      EditColor = clInfoBk
      NumbersAllowNegative = False
    end
    object TimeFormatEdit: TBCEdit
      Left = 84
      Top = 10
      Width = 355
      Height = 21
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      CharCase = ecUpperCase
      TabOrder = 1
      Text = 'HH24:MI:SS'
      Visible = False
      OnChange = TimeFormatEditChange
      OnlyNumbers = False
      NumbersWithDots = False
      NumbersWithSpots = False
      EditColor = clInfoBk
      NumbersAllowNegative = False
    end
  end
end
