object SQLProgressDialog: TSQLProgressDialog
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Statement Processing...'
  ClientHeight = 86
  ClientWidth = 298
  Color = clWindow
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnDestroy = FormDestroy
  OnShow = FormShow
  DesignSize = (
    298
    86)
  PixelsPerInch = 96
  TextHeight = 13
  object ExecutionTimeLabel: TLabel
    Left = 0
    Top = 16
    Width = 298
    Height = 13
    Alignment = taCenter
    Anchors = [akLeft, akTop, akRight]
    AutoSize = False
    Caption = 'Execution time: %s'
  end
  object CancelButton: TButton
    Left = 111
    Top = 45
    Width = 77
    Height = 25
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Action = CancelAction
    Anchors = [akLeft, akRight]
    Cancel = True
    Default = True
    ModalResult = 2
    TabOrder = 0
  end
  object ActionList: TActionList
    Left = 240
    Top = 32
    object CancelAction: TAction
      Caption = 'Cancel'
      OnExecute = CancelActionExecute
    end
  end
end
