object DropUserDialog: TDropUserDialog
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Confirm'
  ClientHeight = 113
  ClientWidth = 214
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnDestroy = FormDestroy
  DesignSize = (
    214
    113)
  PixelsPerInch = 96
  TextHeight = 13
  object TopPanel: TPanel
    Left = 0
    Top = 0
    Width = 214
    Height = 74
    Align = alTop
    Anchors = [akLeft, akTop, akRight, akBottom]
    BevelEdges = []
    BevelOuter = bvNone
    Color = clWhite
    Ctl3D = True
    ParentBackground = False
    ParentCtl3D = False
    TabOrder = 0
    StyleElements = []
    object MessageLabel: TLabel
      Left = 51
      Top = 17
      Width = 67
      Height = 13
      Caption = 'MessageLabel'
    end
    object InfoImage: TImage
      Left = 8
      Top = 8
      Width = 37
      Height = 37
      AutoSize = True
    end
    object CascadeCheckBox: TBCCheckBox
      Left = 10
      Top = 51
      Width = 62
      Height = 17
      Caption = 'Cascade'
      TabOrder = 0
      LinkedControls = <>
    end
  end
  object GrayLinePanel: TPanel
    Left = 0
    Top = 73
    Width = 214
    Height = 1
    Anchors = [akLeft, akRight, akBottom]
    BevelEdges = []
    BevelOuter = bvNone
    Color = cl3DLight
    Ctl3D = True
    ParentBackground = False
    ParentCtl3D = False
    TabOrder = 1
  end
  object Panel1: TPanel
    Left = 0
    Top = 76
    Width = 214
    Height = 37
    Align = alBottom
    BevelOuter = bvNone
    Padding.Left = 6
    Padding.Top = 6
    Padding.Right = 6
    Padding.Bottom = 6
    TabOrder = 2
    object CancelButton: TButton
      Left = 140
      Top = 6
      Width = 68
      Height = 25
      Align = alRight
      Caption = 'No'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ModalResult = 2
      ParentFont = False
      TabOrder = 0
    end
    object OKButton: TButton
      Left = 66
      Top = 6
      Width = 68
      Height = 25
      Align = alRight
      Caption = 'Yes'
      Default = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ModalResult = 1
      ParentFont = False
      TabOrder = 1
    end
    object Separator1Panel: TPanel
      Left = 134
      Top = 6
      Width = 6
      Height = 25
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 2
    end
  end
end
