object OutputFrame: TOutputFrame
  Left = 0
  Top = 0
  Width = 451
  Height = 302
  Align = alClient
  Color = clWindow
  ParentBackground = False
  ParentColor = False
  TabOrder = 0
  object PageControl: TBCPageControl
    Left = 0
    Top = 0
    Width = 451
    Height = 302
    Align = alClient
    DoubleBuffered = False
    Images = ImagesDataModule.ImageList
    ParentDoubleBuffered = False
    PopupMenu = PopupMenu
    TabOrder = 0
    OnChange = PageControlChange
    OnMouseDown = PageControlMouseDown
    TabDragDrop = False
    HoldShiftToDragDrop = False
    ShowCloseButton = False
    OnCloseButtonClick = PageControlCloseButtonClick
    OnDblClick = PageControlDblClick
  end
  object OutputActionList: TActionList
    Images = ImagesDataModule.ImageList
    Left = 72
    Top = 52
    object OutputCloseAction: TAction
      Caption = '&Close'
      Hint = 'Close tab'
      ImageIndex = 85
      OnExecute = OutputCloseActionExecute
    end
    object ClearDBMSOutputAction: TAction
      Caption = 'Clear DBMS Output'
      Hint = 'Clear DBMS output'
      ImageIndex = 58
      OnExecute = ClearDBMSOutputActionExecute
    end
    object OutputCloseAllAction: TAction
      Caption = 'Close &All'
      ImageIndex = 86
      OnExecute = OutputCloseAllActionExecute
    end
    object OutputCloseAllOtherPagesAction: TAction
      Caption = 'Close A&ll Other Pages'
      ImageIndex = 87
      OnExecute = OutputCloseAllOtherPagesActionExecute
    end
    object CopyToClipboardAction: TAction
      Caption = 'C&opy to Clipboard'
      ImageIndex = 40
      OnExecute = CopyToClipboardActionExecute
    end
  end
  object PopupMenu: TBCPopupMenu
    Images = ImagesDataModule.ImageList
    Left = 264
    Top = 124
  end
end
