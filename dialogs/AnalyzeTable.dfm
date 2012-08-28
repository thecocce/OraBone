object AnalyzeTableDialog: TAnalyzeTableDialog
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Analyze Table: %s'
  ClientHeight = 118
  ClientWidth = 295
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object TopPanel: TPanel
    Left = 0
    Top = 0
    Width = 295
    Height = 81
    Align = alClient
    BevelOuter = bvNone
    Padding.Left = 6
    Padding.Top = 3
    Padding.Right = 6
    Padding.Bottom = 3
    TabOrder = 0
    object GroupBox1: TGroupBox
      Left = 6
      Top = 3
      Width = 283
      Height = 75
      Align = alClient
      Caption = ' Statistics '
      TabOrder = 0
      object ComputeStatisticsRadioButton: TRadioButton
        Left = 16
        Top = 20
        Width = 113
        Height = 17
        Caption = ' Compute'
        Checked = True
        TabOrder = 0
        TabStop = True
      end
      object EstimateStatisticsRadioButton: TRadioButton
        Left = 16
        Top = 43
        Width = 113
        Height = 17
        Caption = ' Estimate'
        TabOrder = 1
      end
    end
  end
  object BottomPanel: TPanel
    Left = 0
    Top = 81
    Width = 295
    Height = 37
    Align = alBottom
    BevelOuter = bvNone
    Padding.Left = 6
    Padding.Top = 6
    Padding.Right = 6
    Padding.Bottom = 6
    TabOrder = 1
    object ExportButton: TButton
      Left = 133
      Top = 6
      Width = 75
      Height = 25
      Align = alRight
      Caption = 'Analyze'
      Default = True
      ModalResult = 1
      TabOrder = 0
    end
    object CancelButton: TButton
      Left = 214
      Top = 6
      Width = 75
      Height = 25
      Align = alRight
      Caption = 'Cancel'
      ModalResult = 2
      TabOrder = 1
    end
    object Separator1Panel: TPanel
      Left = 208
      Top = 6
      Width = 6
      Height = 25
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 2
    end
  end
end
