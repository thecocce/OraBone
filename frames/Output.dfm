object OutputFrame: TOutputFrame
  Left = 0
  Top = 0
  Width = 451
  Height = 304
  Align = alClient
  Color = clWindow
  ParentBackground = False
  ParentColor = False
  TabOrder = 0
  object PageControl: TBCPageControl
    Left = 0
    Top = 0
    Width = 451
    Height = 304
    Align = alClient
    DoubleBuffered = False
    Images = ImagesDataModule.ImageList
    ParentDoubleBuffered = False
    PopupMenu = PopupActionBar
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
    object CopyAllToClipboardAction: TAction
      Caption = 'C&opy all to Clipboard'
      Hint = 'Copy all to clipboard'
      ImageIndex = 40
      OnExecute = CopyAllToClipboardActionExecute
    end
    object CopySelectedToClipboardAction: TAction
      Caption = 'Cop&y selected to Clipboard'
      Hint = 'Copy selected to clipboard'
      ImageIndex = 259
      OnExecute = CopySelectedToClipboardActionExecute
    end
    object OpenAllAction: TAction
      Caption = 'O&pen All'
      Hint = 'Open all files'
      ImageIndex = 135
      OnExecute = OpenAllActionExecute
    end
    object OpenSelectedAction: TAction
      Caption = 'Op&en selected'
      Hint = 'Open selected files'
      ImageIndex = 258
      OnExecute = OpenSelectedActionExecute
    end
    object SelectAllAction: TAction
      Caption = 'Select all'
      Hint = 'Select all files'
      ImageIndex = 260
      OnExecute = SelectAllActionExecute
    end
    object UnselectAllAction: TAction
      Caption = 'Unselect all'
      Hint = 'Unselect all files'
      ImageIndex = 261
      OnExecute = UnselectAllActionExecute
    end
    object ClearDBMSOutputAction: TAction
      Caption = 'Clear DBMS Output'
      Hint = 'Clear DBMS output'
      ImageIndex = 58
      OnExecute = ClearDBMSOutputActionExecute
    end
  end
  object PopupActionBar: TPopupActionBar
    Images = ImagesDataModule.ImageList
    Left = 264
    Top = 124
  end
end
