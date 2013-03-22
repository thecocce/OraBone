object DBMSOutputFrame: TDBMSOutputFrame
  Left = 0
  Top = 0
  Width = 320
  Height = 240
  Align = alClient
  TabOrder = 0
  Visible = False
  object Panel: TPanel
    Left = 0
    Top = 0
    Width = 320
    Height = 240
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object PollingIntervalLabel: TLabel
      Left = 9
      Top = 7
      Width = 119
      Height = 13
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Polling interval: 1 second'
    end
    object PollingIntervalTrackBar: TTrackBar
      Left = 2
      Top = 19
      Width = 150
      Height = 27
      Min = 1
      Position = 1
      TabOrder = 0
      OnChange = PollingIntervalTrackBarChange
    end
  end
end
