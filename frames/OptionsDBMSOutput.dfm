inherited OptionsDBMSOutputFrame: TOptionsDBMSOutputFrame
  Width = 154
  Height = 39
  AutoSize = True
  Visible = False
  object Panel: TPanel
    AlignWithMargins = True
    Left = 4
    Top = 0
    Width = 150
    Height = 39
    Margins.Left = 4
    Margins.Top = 0
    Margins.Right = 0
    Margins.Bottom = 0
    AutoSize = True
    BevelOuter = bvNone
    Color = clWindow
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    TabOrder = 0
    object PollingIntervalLabel: TLabel
      Left = 7
      Top = 0
      Width = 119
      Height = 13
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Polling interval: 1 second'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object PollingIntervalTrackBar: TTrackBar
      Left = 0
      Top = 12
      Width = 150
      Height = 27
      Min = 1
      Position = 1
      TabOrder = 0
      OnChange = PollingIntervalTrackBarChange
    end
  end
end
