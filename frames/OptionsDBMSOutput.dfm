inherited OptionsDBMSOutputFrame: TOptionsDBMSOutputFrame
  Width = 150
  Height = 39
  Visible = False
  ExplicitWidth = 150
  ExplicitHeight = 39
  object Panel: TPanel
    Left = 0
    Top = 0
    Width = 150
    Height = 39
    BevelOuter = bvNone
    Color = clWindow
    ParentBackground = False
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
