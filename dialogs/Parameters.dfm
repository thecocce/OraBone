object ParametersDialog: TParametersDialog
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Parameters'
  ClientHeight = 292
  ClientWidth = 332
  Color = clWindow
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 255
    Width = 332
    Height = 37
    Align = alBottom
    BevelOuter = bvNone
    Padding.Left = 6
    Padding.Top = 6
    Padding.Right = 6
    Padding.Bottom = 6
    TabOrder = 0
    object OKButton: TButton
      Left = 170
      Top = 6
      Width = 75
      Height = 25
      Align = alRight
      Caption = '&OK'
      Default = True
      ModalResult = 1
      TabOrder = 0
    end
    object CancelButton: TButton
      Left = 251
      Top = 6
      Width = 75
      Height = 25
      Align = alRight
      Caption = 'Cancel'
      ModalResult = 2
      TabOrder = 1
    end
    object Separator1Panel: TPanel
      Left = 245
      Top = 6
      Width = 6
      Height = 25
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 2
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 332
    Height = 255
    Align = alClient
    BevelOuter = bvNone
    Caption = 'Panel2'
    Padding.Left = 6
    Padding.Top = 6
    Padding.Right = 6
    TabOrder = 1
    object ValueListEditor: TValueListEditor
      Left = 6
      Top = 6
      Width = 320
      Height = 249
      Align = alClient
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goColSizing, goEditing, goTabs, goAlwaysShowEditor, goThumbTracking]
      TabOrder = 0
      TitleCaptions.Strings = (
        'Parameter'
        'Value')
      OnKeyUp = ValueListEditorKeyUp
      ColWidths = (
        150
        164)
    end
  end
end
