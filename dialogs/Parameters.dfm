object ParametersDialog: TParametersDialog
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Parameters'
  ClientHeight = 292
  ClientWidth = 332
  Color = clBtnFace
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
      ExplicitLeft = 168
      ExplicitTop = 16
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
      ExplicitLeft = 249
      ExplicitTop = 16
    end
    object Separator1Panel: TPanel
      Left = 245
      Top = 6
      Width = 6
      Height = 25
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 2
      ExplicitLeft = 246
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
    ExplicitLeft = 92
    ExplicitTop = 108
    ExplicitWidth = 185
    ExplicitHeight = 41
    object ValueListEditor: TValueListEditor
      Left = 6
      Top = 6
      Width = 320
      Height = 249
      Align = alClient
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goColSizing, goEditing, goTabs, goAlwaysShowEditor, goThumbTracking]
      ScrollBars = ssHorizontal
      TabOrder = 0
      TitleCaptions.Strings = (
        'Parameter'
        'Value')
      OnKeyUp = ValueListEditorKeyUp
      ExplicitLeft = 8
      ExplicitTop = 8
      ExplicitWidth = 304
      ExplicitHeight = 243
      ColWidths = (
        150
        164)
    end
  end
end
