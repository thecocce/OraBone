object StringDataDialog: TStringDataDialog
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Edit Field: %s'
  ClientHeight = 226
  ClientWidth = 552
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 189
    Width = 552
    Height = 37
    Align = alBottom
    BevelOuter = bvNone
    Padding.Left = 6
    Padding.Top = 6
    Padding.Right = 6
    Padding.Bottom = 6
    TabOrder = 0
    object OKButton: TButton
      Left = 390
      Top = 6
      Width = 75
      Height = 25
      Align = alRight
      Caption = '&OK'
      Default = True
      ModalResult = 1
      TabOrder = 0
      ExplicitLeft = 388
      ExplicitTop = 16
    end
    object CancelButton: TButton
      Left = 471
      Top = 6
      Width = 75
      Height = 25
      Align = alRight
      Caption = 'Cancel'
      ModalResult = 2
      TabOrder = 1
      ExplicitLeft = 469
      ExplicitTop = 16
    end
    object Separator1Panel: TPanel
      Left = 465
      Top = 6
      Width = 6
      Height = 25
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 2
      ExplicitLeft = 261
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 552
    Height = 189
    Align = alClient
    BevelOuter = bvNone
    Padding.Left = 6
    Padding.Top = 6
    Padding.Right = 6
    TabOrder = 1
    ExplicitLeft = 94
    ExplicitTop = 88
    ExplicitWidth = 185
    ExplicitHeight = 41
    object StringDataEdit: TSynEdit
      Left = 6
      Top = 6
      Width = 540
      Height = 183
      Align = alClient
      Ctl3D = True
      ParentCtl3D = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Courier New'
      Font.Style = []
      TabOrder = 0
      Gutter.AutoSize = True
      Gutter.Font.Charset = DEFAULT_CHARSET
      Gutter.Font.Color = clWindowText
      Gutter.Font.Height = -11
      Gutter.Font.Name = 'Courier New'
      Gutter.Font.Style = []
      Gutter.ShowLineNumbers = True
      Gutter.Gradient = True
      Options = [eoAutoIndent, eoDragDropEditing, eoEnhanceEndKey, eoGroupUndo, eoShowScrollHint, eoSmartTabDelete, eoSmartTabs, eoTabsToSpaces, eoTrimTrailingSpaces]
      WantTabs = True
      ExplicitLeft = 4
      ExplicitTop = 4
      ExplicitWidth = 544
      ExplicitHeight = 177
    end
  end
end
