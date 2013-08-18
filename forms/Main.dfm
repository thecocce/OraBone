object MainForm: TMainForm
  Left = 0
  Top = 0
  Caption = 'OraBone'
  ClientHeight = 521
  ClientWidth = 861
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIForm
  KeyPreview = True
  OldCreateOrder = False
  Position = poDefault
  ShowHint = True
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnResize = FormResize
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object MainMenuPanel: TPanel
    Left = 0
    Top = 0
    Width = 861
    Height = 25
    Align = alTop
    BevelOuter = bvNone
    Padding.Top = 2
    Padding.Right = 2
    ParentColor = True
    TabOrder = 0
    object ActionMainMenuBar: TActionMainMenuBar
      Left = 0
      Top = 0
      Width = 681
      Height = 30
      UseSystemFont = False
      ActionManager = ActionManager
      Align = alNone
      Color = clMenuBar
      ColorMap.DisabledFontColor = 7171437
      ColorMap.HighlightColor = clWhite
      ColorMap.BtnSelectedFont = clBlack
      ColorMap.UnusedColor = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      HorzMargin = 2
      Spacing = 1
    end
  end
  object ToolBarPanel: TPanel
    Left = 0
    Top = 25
    Width = 861
    Height = 28
    Align = alTop
    AutoSize = True
    BevelOuter = bvNone
    Padding.Left = 2
    Padding.Top = 2
    Padding.Right = 2
    ParentColor = True
    TabOrder = 3
    object ActionToolBar: TActionToolBar
      Left = 2
      Top = 2
      Width = 857
      Height = 26
      ActionManager = ActionManager
      Align = alClient
      Color = clMenuBar
      ColorMap.DisabledFontColor = 7171437
      ColorMap.HighlightColor = clWhite
      ColorMap.BtnSelectedFont = clBlack
      ColorMap.UnusedColor = clWhite
      EdgeInner = esNone
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      HorzSeparator = False
      ParentFont = False
      Spacing = 0
    end
  end
  object MainPanel: TPanel
    Left = 0
    Top = 53
    Width = 861
    Height = 449
    Align = alClient
    BevelOuter = bvNone
    Padding.Left = 3
    Padding.Top = 2
    Padding.Right = 1
    Padding.Bottom = 2
    TabOrder = 1
    object PageControl: TBCPageControl
      Left = 3
      Top = 2
      Width = 857
      Height = 445
      Align = alClient
      DoubleBuffered = False
      Images = MenuImageList
      ParentDoubleBuffered = False
      ParentShowHint = False
      PopupMenu = PageControlPopupMenu
      ShowHint = False
      TabOrder = 0
      OnChange = PageControlChange
      OnMouseDown = PageControlMouseDown
      RightClickSelect = True
      TabDragDrop = True
      HoldShiftToDragDrop = False
      ShowCloseButton = False
      OnCloseButtonClick = PageControlCloseButtonClick
      OnDblClick = PageControlDblClick
    end
  end
  object StatusBar: TStatusBar
    Left = 0
    Top = 502
    Width = 861
    Height = 19
    Panels = <
      item
        Alignment = taCenter
        Width = 99
      end
      item
        Width = 99
      end
      item
        Width = 99
      end
      item
        Width = 50
      end>
  end
  object ActionManager: TActionManager
    ActionBars = <
      item
        Items = <
          item
            Items = <
              item
                Action = FileNewAction
                ImageIndex = 35
                ShortCut = 16462
              end
              item
                Action = FileOpenAction
                Caption = '&Open...'
                ImageIndex = 0
                ShortCut = 16463
              end
              item
                Items = <
                  item
                    Action = FileReopenClearAction
                    ImageIndex = 89
                  end>
                Action = FileReopenAction
                UsageCount = 1
              end
              item
                Caption = '-'
              end
              item
                Action = FileCloseAction
                Caption = '&Close'
                ImageIndex = 1
                ShortCut = 16499
              end
              item
                Action = FileCloseAllAction
                Caption = 'C&lose All'
                ImageIndex = 2
              end
              item
                Caption = '-'
              end
              item
                Action = FileSaveAction
                Caption = '&Save'
                ImageIndex = 3
                ShortCut = 16467
              end
              item
                Action = FileSaveAsAction
                Caption = 'S&ave As...'
                ImageIndex = 4
                ShortCut = 49235
              end
              item
                Action = FileSaveAllAction
                Caption = 'Sa&ve All'
                ImageIndex = 5
              end
              item
                Caption = '-'
              end
              item
                Action = FilePrintAction
                Caption = '&Print...'
                ImageIndex = 6
                ShortCut = 16464
              end
              item
                Action = FilePrintPreviewAction
                Caption = 'Pr&int Preview...'
                ImageIndex = 7
              end
              item
                Caption = '-'
              end
              item
                Action = FileExitAction
                ImageIndex = 8
                ShortCut = 32883
              end>
            Caption = '&File'
          end
          item
            Items = <
              item
                Action = EditUndoAction
                ImageIndex = 9
                ShortCut = 16474
              end
              item
                Action = EditRedoAction
                ImageIndex = 10
                ShortCut = 24666
              end
              item
                Caption = '-'
              end
              item
                Action = EditCutAction
                ImageIndex = 11
                ShortCut = 16472
              end
              item
                Action = EditCopyAction
                Caption = 'C&opy'
                ImageIndex = 12
                ShortCut = 16451
              end
              item
                Action = EditPasteAction
                ImageIndex = 13
                ShortCut = 16470
              end
              item
                Action = EditSelectAllAction
                ImageIndex = 41
                ShortCut = 16449
              end
              item
                Caption = '-'
              end
              item
                Action = EditInsertLineAction
                Caption = 'I&nsert Line'
                ImageIndex = 72
                ShortCut = 16462
              end
              item
                Action = EditDeleteWordAction
                Caption = 'De&lete Word'
                ShortCut = 16468
              end
              item
                Action = EditDeleteLineAction
                ImageIndex = 73
                ShortCut = 16473
              end
              item
                Action = EditDeleteEOLAction
                ShortCut = 24665
              end
              item
                Caption = '-'
              end
              item
                Action = EditIncreaseIndentAction
                ImageIndex = 57
                ShortCut = 24649
              end
              item
                Action = EditDecreaseIndentAction
                Caption = 'D&ecrease Indent'
                ImageIndex = 56
                ShortCut = 24661
              end
              item
                Caption = '-'
              end
              item
                Action = EditSortAscAction
                ImageIndex = 59
                ShortCut = 24641
              end
              item
                Action = EditSortDescAction
                ImageIndex = 60
                ShortCut = 24644
              end
              item
                Caption = '-'
              end
              item
                Action = EditToggleCaseAction
                ImageIndex = 58
                ShortCut = 24643
              end>
            Caption = '&Edit'
          end
          item
            Items = <
              item
                Action = SearchAction
                ImageIndex = 14
                ShortCut = 16454
              end
              item
                Action = SearchReplaceAction
                ImageIndex = 15
                ShortCut = 16466
              end
              item
                Caption = '-'
              end
              item
                Action = SearchFindNextAction
                ImageIndex = 16
                ShortCut = 114
              end
              item
                Action = SearchFindPreviousAction
                ImageIndex = 17
                ShortCut = 8306
              end
              item
                Caption = '-'
              end
              item
                Action = SearchFindInFilesAction
                ImageIndex = 18
                ShortCut = 24646
              end
              item
                Caption = '-'
              end
              item
                Action = SearchToggleBookmarkAction
                Caption = '&Toggle Bookmark'
                ImageIndex = 51
                ShortCut = 16497
              end
              item
                Items = <
                  item
                    Action = ToggleBookmarks0Action
                    ImageIndex = 61
                    ShortCut = 24624
                  end
                  item
                    Action = ToggleBookmarks1Action
                    ImageIndex = 62
                    ShortCut = 24625
                  end
                  item
                    Action = ToggleBookmarks2Action
                    ImageIndex = 63
                    ShortCut = 24626
                  end
                  item
                    Action = ToggleBookmarks3Action
                    ImageIndex = 64
                    ShortCut = 24627
                  end
                  item
                    Action = ToggleBookmarks4Action
                    ImageIndex = 65
                    ShortCut = 24628
                  end
                  item
                    Action = ToggleBookmarks5Action
                    ImageIndex = 66
                    ShortCut = 24629
                  end
                  item
                    Action = ToggleBookmarks6Action
                    ImageIndex = 67
                    ShortCut = 24630
                  end
                  item
                    Action = ToggleBookmarks7Action
                    ImageIndex = 68
                    ShortCut = 24631
                  end
                  item
                    Action = ToggleBookmarks8Action
                    ImageIndex = 69
                    ShortCut = 24632
                  end
                  item
                    Action = ToggleBookmarks9Action
                    ImageIndex = 70
                    ShortCut = 24633
                  end>
                Action = SearchToggleBookmarksAction
                Caption = 'T&oggle Bookmarks'
                UsageCount = 1
              end
              item
                Items = <
                  item
                    Action = GotoBookmarks0Action
                    ImageIndex = 61
                    ShortCut = 16432
                  end
                  item
                    Action = GotoBookmarks1Action
                    ImageIndex = 62
                    ShortCut = 16433
                  end
                  item
                    Action = GotoBookmarks2Action
                    ImageIndex = 63
                    ShortCut = 16434
                  end
                  item
                    Action = GotoBookmarks3Action
                    ImageIndex = 64
                    ShortCut = 16435
                  end
                  item
                    Action = GotoBookmarks4Action
                    ImageIndex = 65
                    ShortCut = 16436
                  end
                  item
                    Action = GotoBookmarks5Action
                    ImageIndex = 66
                    ShortCut = 16437
                  end
                  item
                    Action = GotoBookmarks6Action
                    ImageIndex = 67
                    ShortCut = 16438
                  end
                  item
                    Action = GotoBookmarks7Action
                    ImageIndex = 68
                    ShortCut = 16439
                  end
                  item
                    Action = GotoBookmarks8Action
                    ImageIndex = 69
                    ShortCut = 16440
                  end
                  item
                    Action = GotoBookmarks9Action
                    ImageIndex = 70
                    ShortCut = 16441
                  end>
                Action = SearchGotoBookmarksAction
                Caption = '&Go to Bookmarks'
                UsageCount = 1
              end
              item
                Action = ClearBookmarksAction
                ImageIndex = 71
              end
              item
                Caption = '-'
              end
              item
                Action = SearchGotoLineAction
                Caption = 'Go to &Line'
                ImageIndex = 88
                ShortCut = 16455
              end>
            Caption = '&Search'
          end
          item
            Items = <
              item
                Action = DatabaseNewConnectionMenuAction
                ImageIndex = 19
              end
              item
                Action = DatabaseEndConnectionMenuAction
                ImageIndex = 20
              end
              item
                Caption = '-'
              end
              item
                Action = DatabaseEditorMenuAction
                ImageIndex = 21
              end
              item
                Caption = '-'
              end
              item
                Action = DatabaseObjectSearchAction
                ImageIndex = 55
              end
              item
                Caption = '-'
              end
              item
                Items = <
                  item
                    Action = DatabaseCreateConstraintAction
                    ImageIndex = 76
                  end
                  item
                    Action = DatabaseCreateDBLinkAction
                    ImageIndex = 77
                  end
                  item
                    Action = DatabaseCreateFunctionAction
                    ImageIndex = 84
                  end
                  item
                    Action = DatabaseCreateIndexAction
                    ImageIndex = 78
                  end
                  item
                    Action = DatabaseCreatePackageAction
                    ImageIndex = 79
                  end
                  item
                    Action = DatabaseCreateProcedureAction
                    ImageIndex = 80
                  end
                  item
                    Action = DatabaseCreateSequenceAction
                    ImageIndex = 81
                  end
                  item
                    Action = DatabaseCreateSynonymAction
                    ImageIndex = 82
                  end
                  item
                    Action = DatabaseCreateTableAction
                    ImageIndex = 83
                  end
                  item
                    Action = DatabaseCreateTriggerAction
                    ImageIndex = 85
                  end
                  item
                    Action = DatabaseCreateUserAction
                    ImageIndex = 86
                  end
                  item
                    Action = DatabaseCreateViewAction
                    ImageIndex = 87
                  end>
                Caption = '&Create'
                UsageCount = 1
              end
              item
                Items = <
                  item
                    Action = DatabaseExportTableDataAction
                    ImageIndex = 39
                  end>
                Caption = 'Ex&port'
                UsageCount = 1
              end
              item
                Items = <
                  item
                    Action = DatabaseImportTableDataAction
                    ImageIndex = 40
                  end>
                Caption = '&Import'
                UsageCount = 1
              end
              item
                Caption = '-'
              end
              item
                Action = DatabaseRefreshAction
                ImageIndex = 34
                ShortCut = 116
              end>
            Caption = '&Database'
          end
          item
            Items = <
              item
                Action = ViewToolbarAction
              end
              item
                Action = StatusBarAction
              end
              item
                Action = ViewOutputAction
              end
              item
                Caption = '-'
              end
              item
                Action = SQLHistoryAction
                Caption = 'S&QL History'
                ImageIndex = 46
                ShortCut = 122
              end
              item
                Caption = '-'
              end
              item
                Action = ViewWordWrapAction
                ImageIndex = 24
              end
              item
                Action = ViewLineNumbersAction
                ImageIndex = 25
              end
              item
                Action = ViewSpecialCharsAction
                Caption = 'S&pecial Chars'
                ImageIndex = 26
              end
              item
                Action = ViewSelectionModeAction
                Caption = 'S&election Mode'
                ImageIndex = 27
              end
              item
                Caption = '-'
              end
              item
                Caption = 'St&yle'
                UsageCount = 1
              end
              item
                Caption = '-'
              end
              item
                Action = ViewNextPageAction
                ImageIndex = 50
                ShortCut = 16393
              end
              item
                Action = ViewPreviousPageAction
                Caption = 'P&revious Page'
                ImageIndex = 49
                ShortCut = 24585
              end>
            Caption = '&View'
          end
          item
            Items = <
              item
                Action = ToolsCompareFilesAction
                ImageIndex = 29
              end
              item
                Caption = '-'
              end
              item
                Action = ToolsCompareSchemasAction
                ImageIndex = 48
              end
              item
                Action = SchemaDocumentAction
                Caption = 'Sc&hema Document...'
                ImageIndex = 47
              end
              item
                Action = TNSNamesEditorAction
                ImageIndex = 75
              end
              item
                Caption = '-'
              end
              item
                Action = ToolsOptionsAction
                ImageIndex = 54
              end>
            Caption = '&Tools'
          end
          item
            Items = <
              item
                Action = HelpCheckForUpdateMenuAction
                Caption = '&Check for Updates...'
                ImageIndex = 74
              end
              item
                Caption = '-'
              end
              item
                Action = HelpHomeAction
                Caption = '&Visit Homepage...'
                ImageIndex = 30
              end
              item
                Caption = '-'
              end
              item
                Action = HelpAboutMenuAction
                Caption = '&About OraBone...'
                ImageIndex = 31
              end>
            Caption = '&Help'
          end>
        ActionBar = ActionMainMenuBar
      end
      item
        Items = <
          item
            Action = DatabaseNewConnectionMenuAction
            ImageIndex = 19
            ShowCaption = False
          end
          item
            Action = DatabaseEndConnectionMenuAction
            ImageIndex = 20
            ShowCaption = False
          end
          item
            Caption = '-'
          end
          item
            Action = DatabaseEditorMenuAction
            ImageIndex = 21
            ShowCaption = False
          end
          item
            Caption = '-'
          end
          item
            Action = DatabaseObjectSearchAction
            ImageIndex = 55
            ShowCaption = False
          end
          item
            Caption = '-'
          end
          item
            Action = DatabaseExportTableDataAction
            ImageIndex = 39
            ShowCaption = False
          end
          item
            Action = DatabaseImportTableDataAction
            Caption = 'T&able Data...'
            ImageIndex = 40
            ShowCaption = False
          end
          item
            Caption = '-'
          end
          item
            Action = DatabaseRefreshAction
            ImageIndex = 34
            ShowCaption = False
            ShortCut = 116
          end
          item
            Caption = '-'
          end
          item
            Action = SQLHistoryAction
            ImageIndex = 46
            ShowCaption = False
            ShortCut = 122
          end
          item
            Caption = '-'
          end
          item
            Action = ToolsCompareSchemasAction
            Caption = '&Compare Schemas...'
            ImageIndex = 48
            ShowCaption = False
          end
          item
            Action = SchemaDocumentAction
            Caption = 'Sc&hema Document...'
            ImageIndex = 47
            ShowCaption = False
          end
          item
            Action = TNSNamesEditorAction
            Caption = 'TNSNa&mes Editor...'
            ImageIndex = 75
            ShowCaption = False
          end
          item
            Caption = '-'
          end
          item
            Action = ToolsOptionsAction
            Caption = 'O&ptions...'
            ImageIndex = 54
            ShowCaption = False
          end>
        ActionBar = ActionToolBar
      end
      item
        Items = <
          item
            Action = ViewWordWrapAction
            ImageIndex = 24
          end>
      end
      item
        Items = <
          item
            Action = FileSaveAction
            Caption = '&Save'
            ImageIndex = 3
            ShortCut = 16467
          end>
      end
      item
        Items = <
          item
            Action = ExecuteStatementAction
            Caption = '&Execute Statement'
            ImageIndex = 36
            ShortCut = 120
          end
          item
            Action = ExecuteScriptAction
            Caption = 'E&xecute Script'
            ImageIndex = 37
            ShortCut = 116
          end>
      end>
    Images = MenuImageList
    Left = 62
    Top = 92
    StyleName = 'Platform Default'
    object DatabaseNewConnectionMenuAction: TAction
      Category = '&Database'
      Caption = '&New Connection...'
      Hint = 'Add a new connection'
      ImageIndex = 19
      OnExecute = DatabaseNewConnectionMenuActionExecute
    end
    object DatabaseEndConnectionMenuAction: TAction
      Category = '&Database'
      Caption = '&End Connection...'
      Hint = 'End the active connection'
      ImageIndex = 20
      OnExecute = DatabaseEndConnectionMenuActionExecute
    end
    object DatabaseEditorMenuAction: TAction
      Category = '&Database'
      Caption = 'E&ditor...'
      Hint = 'Open SQL Editor'
      ImageIndex = 21
      OnExecute = DatabaseEditorMenuActionExecute
    end
    object SearchAction: TAction
      Category = '&Search'
      Caption = '&Search...'
      Hint = 'Search the specified text'
      ImageIndex = 14
      ShortCut = 16454
      OnExecute = SearchActionExecute
    end
    object ViewToolbarAction: TAction
      Category = '&View'
      Caption = '&Toolbar'
      Checked = True
      Hint = 'Show or hide the toolbar'
      OnExecute = ViewToolbarActionExecute
    end
    object ToolsOptionsAction: TAction
      Category = '&Tools'
      Caption = '&Options...'
      Hint = 'Set options'
      ImageIndex = 54
      OnExecute = ToolsOptionsActionExecute
    end
    object HelpCheckForUpdateMenuAction: TAction
      Category = '&Help'
      Caption = 'Check for Updates...'
      ImageIndex = 74
      OnExecute = HelpCheckForUpdateMenuActionExecute
    end
    object HelpHomeAction: TAction
      Category = '&Help'
      Caption = 'Visit Homepage...'
      Hint = 'Visit OraBone homepage - http://www.bonecode.com/'
      ImageIndex = 30
      OnExecute = HelpHomeActionExecute
    end
    object HelpAboutMenuAction: TAction
      Category = '&Help'
      Caption = 'About OraBone...'
      Hint = 'Display OraBone information'
      ImageIndex = 31
      OnExecute = HelpAboutMenuActionExecute
    end
    object FileNewAction: TAction
      Category = '&File'
      Caption = '&New'
      Hint = 'Create a new document'
      ImageIndex = 35
      ShortCut = 16462
      OnExecute = FileNewActionExecute
    end
    object FileOpenAction: TAction
      Category = '&File'
      Caption = 'Open...'
      Hint = 'Open an existing SQL file'
      ImageIndex = 0
      ShortCut = 16463
      OnExecute = FileOpenActionExecute
    end
    object FileReopenAction: TAction
      Category = '&File'
      Caption = '&Reopen'
      OnExecute = DummyActionExecute
    end
    object FileCloseAction: TAction
      Category = '&File'
      Caption = 'Close'
      Hint = 'Close the active SQL document'
      ImageIndex = 1
      ShortCut = 16499
      OnExecute = FileCloseActionExecute
    end
    object FileCloseAllAction: TAction
      Category = '&File'
      Caption = 'Close All'
      Hint = 'Close all open SQL documents'
      ImageIndex = 2
      OnExecute = FileCloseAllActionExecute
    end
    object FileCloseAllOtherPagesAction: TAction
      Category = '&File'
      Caption = 'Close All Other Pages'
      Hint = 'Close All Other SQL Documents'
      ShortCut = 24691
      OnExecute = FileCloseAllOtherPagesActionExecute
    end
    object FileSaveAction: TAction
      Category = '&File'
      Caption = 'Save'
      Hint = 'Save the active SQL document'
      ImageIndex = 3
      ShortCut = 16467
      OnExecute = FileSaveActionExecute
    end
    object FileSaveAsAction: TAction
      Category = '&File'
      Caption = 'Save As...'
      Hint = 'Save the active SQL document with a new name'
      ImageIndex = 4
      ShortCut = 49235
      OnExecute = FileSaveAsActionExecute
    end
    object FileSaveAllAction: TAction
      Category = '&File'
      Caption = 'Save All'
      Hint = 'Save all active SQL documents'
      ImageIndex = 5
      OnExecute = FileSaveAllActionExecute
    end
    object FilePrintAction: TAction
      Category = '&File'
      Caption = 'Print...'
      Hint = 'Print the active SQL document'
      ImageIndex = 6
      ShortCut = 16464
      OnExecute = FilePrintActionExecute
    end
    object FilePrintPreviewAction: TAction
      Category = '&File'
      Caption = 'Print Preview...'
      Hint = 'Preview the active SQL document'
      ImageIndex = 7
      OnExecute = FilePrintPreviewActionExecute
    end
    object FileExitAction: TAction
      Category = '&File'
      Caption = '&Exit'
      Hint = 'Quit the application'
      ImageIndex = 8
      ShortCut = 32883
      OnExecute = FileExitActionExecute
    end
    object EditUndoAction: TAction
      Category = '&Edit'
      Caption = '&Undo'
      Hint = 'Undo the last action'
      ImageIndex = 9
      ShortCut = 16474
      OnExecute = EditUndoActionExecute
    end
    object EditRedoAction: TAction
      Category = '&Edit'
      Caption = '&Redo'
      Hint = 'Redo the previously undone action'
      ImageIndex = 10
      ShortCut = 24666
      OnExecute = EditRedoActionExecute
    end
    object EditCutAction: TAction
      Category = '&Edit'
      Caption = '&Cut'
      Hint = 'Cut the selection and put it on the Clipboard'
      ImageIndex = 11
      ShortCut = 16472
      OnExecute = EditCutActionExecute
    end
    object EditCopyAction: TAction
      Category = '&Edit'
      Caption = '&Copy'
      Hint = 'Copy the selection and put it on the Clipboard'
      ImageIndex = 12
      ShortCut = 16451
      OnExecute = EditCopyActionExecute
    end
    object EditPasteAction: TAction
      Category = '&Edit'
      Caption = '&Paste'
      Hint = 'Insert Clipboard contents'
      ImageIndex = 13
      ShortCut = 16470
      OnExecute = EditPasteActionExecute
    end
    object SearchReplaceAction: TAction
      Category = '&Search'
      Caption = '&Replace...'
      Hint = 'Replace the specified text with different text'
      ImageIndex = 15
      ShortCut = 16466
      OnExecute = SearchReplaceActionExecute
    end
    object SearchFindNextAction: TAction
      Category = '&Search'
      Caption = 'Find &Next'
      Hint = 'Find the next matching text'
      ImageIndex = 16
      ShortCut = 114
      OnExecute = SearchFindNextActionExecute
    end
    object SearchFindPreviousAction: TAction
      Category = '&Search'
      Caption = 'Find &Previous'
      Hint = 'Find the previous matching text'
      ImageIndex = 17
      ShortCut = 8306
      OnExecute = SearchFindPreviousActionExecute
    end
    object SearchFindInFilesAction: TAction
      Category = '&Search'
      Caption = '&Find in Files...'
      Hint = 'Search for a string in multiple files'
      ImageIndex = 18
      ShortCut = 24646
      OnExecute = SearchFindInFilesActionExecute
    end
    object SearchToggleBookmarkAction: TAction
      Category = '&Search'
      Caption = 'Toggle Bookmark'
      Hint = 
        'Set or clear bookmark at current line. Bookmarks can be also set' +
        ' by using Ctrl+Shift+0..9. Go to bookmark by using Ctrl+0..9.'
      ImageIndex = 51
      ShortCut = 16497
      OnExecute = SearchToggleBookmarkActionExecute
    end
    object StatusBarAction: TAction
      Category = '&View'
      Caption = '&Status Bar'
      Checked = True
      Hint = 'Show or hide the status bar'
      OnExecute = StatusBarActionExecute
    end
    object ViewOutputAction: TAction
      Category = '&View'
      Caption = '&Output'
      Hint = 'Show or hide the output'
    end
    object SQLHistoryAction: TAction
      Category = '&View'
      Caption = '&SQL History'
      Hint = 'Show executed SQL statements'
      ImageIndex = 46
      ShortCut = 122
      OnExecute = SQLHistoryActionExecute
    end
    object ViewWordWrapAction: TAction
      Category = '&View'
      Caption = '&Word Wrap'
      Hint = 'Toggle word wrap'
      ImageIndex = 24
      OnExecute = ViewWordWrapActionExecute
    end
    object ViewLineNumbersAction: TAction
      Category = '&View'
      Caption = '&Line Numbers'
      Hint = 'Toggle line numbers'
      ImageIndex = 25
      OnExecute = ViewLineNumbersActionExecute
    end
    object ViewSpecialCharsAction: TAction
      Category = '&View'
      Caption = '&Special Chars'
      Hint = 'Toggle special characters'
      ImageIndex = 26
      OnExecute = ViewSpecialCharsActionExecute
    end
    object ViewSelectionModeAction: TAction
      Category = '&View'
      Caption = '&Selection Mode'
      Hint = 
        'Toggle selection mode. Also pressing Alt on editor will toggle s' +
        'election mode.'
      ImageIndex = 27
      OnExecute = ViewSelectionModeActionExecute
    end
    object ViewNextPageAction: TAction
      Category = '&View'
      Caption = '&Next Page'
      Hint = 'Go next page'
      ImageIndex = 50
      ShortCut = 16393
      OnExecute = ViewNextPageActionExecute
    end
    object ToolsCompareFilesAction: TAction
      Category = '&Tools'
      Caption = '&Compare Files...'
      Hint = 'Compare files'
      ImageIndex = 29
      OnExecute = ToolsCompareFilesActionExecute
    end
    object DatabaseRefreshAction: TAction
      Category = '&Database'
      Caption = '&Refresh'
      Hint = 'Refresh active schema browser'
      ImageIndex = 34
      ShortCut = 116
      OnExecute = DatabaseRefreshActionExecute
    end
    object DatabaseCloseTabAction: TAction
      Category = '&Database'
      Caption = '&Close'
      Hint = 'Close the active page'
      ShortCut = 16499
      OnExecute = DatabaseCloseTabActionExecute
    end
    object DatabaseCloseAllTabAction: TAction
      Category = '&Database'
      Caption = 'Close &All'
      Hint = 'Close all pages'
      OnExecute = DatabaseCloseAllTabActionExecute
    end
    object DatabaseCloseAllOtherTabsAction: TAction
      Category = '&Database'
      Caption = 'Close All Other Pages'
      Hint = 'Close all other pages than active page'
      ShortCut = 24691
      OnExecute = DatabaseCloseAllOtherTabsActionExecute
    end
    object ExecuteStatementAction: TAction
      Category = 'SQLEditor'
      Caption = 'Execute Statement'
      Hint = 
        'Execute statement. Execute current statement by using Ctrl+Enter' +
        '.'
      ImageIndex = 36
      ShortCut = 120
      OnExecute = ExecuteStatementActionExecute
    end
    object ExecuteCurrentStatementAction: TAction
      Category = 'SQLEditor'
      Caption = 'Execute Current Statement'
      Hint = 'Execute current statement'
      ImageIndex = 90
      ShortCut = 16397
      OnExecute = ExecuteCurrentStatementActionExecute
    end
    object ExecuteScriptAction: TAction
      Category = 'SQLEditor'
      Caption = 'Execute Script'
      Hint = 'Execute as script'
      ImageIndex = 37
      ShortCut = 116
      OnExecute = ExecuteScriptActionExecute
    end
    object InsertObjectAction: TAction
      Category = 'SQLEditor'
      Caption = 'Insert Object'
      Hint = 'Insert object'
      ImageIndex = 52
      ShortCut = 16463
      OnExecute = InsertObjectActionExecute
    end
    object DBMSOutputAction: TAction
      Category = 'SQLEditor'
      Caption = 'DBMS Output'
      Hint = 'Toggle DBMS output'
      ImageIndex = 44
      OnExecute = DBMSOutputActionExecute
    end
    object ExplainPlanAction: TAction
      Category = 'SQLEditor'
      Caption = 'Explain Plan'
      Hint = 'Run explain plan for current statement'
      ImageIndex = 38
      OnExecute = ExplainPlanActionExecute
    end
    object DatabaseCommitAction: TAction
      Category = '&Database'
      Caption = 'Commit'
      Hint = 'Commit'
      ImageIndex = 22
      OnExecute = DatabaseCommitActionExecute
    end
    object DatabaseRollbackAction: TAction
      Category = '&Database'
      Caption = 'Rollback'
      Hint = 'Rollback'
      ImageIndex = 23
      OnExecute = DatabaseRollbackActionExecute
    end
    object DatabaseExportTableDataAction: TAction
      Category = 'E&xport'
      Caption = '&Table Data...'
      Hint = 'Export table data'
      ImageIndex = 39
      OnExecute = DatabaseExportTableDataActionExecute
    end
    object DatabaseImportTableDataAction: TAction
      Category = '&Import'
      Caption = '&Table Data...'
      Hint = 'Import table data'
      ImageIndex = 40
      OnExecute = DatabaseImportTableDataActionExecute
    end
    object FormatSQLAction: TAction
      Category = 'SQLEditor'
      Caption = 'Format SQL'
      Enabled = False
      Hint = 'Format SQL (upcoming feature)'
      ImageIndex = 53
      OnExecute = FormatSQLActionExecute
    end
    object EditSelectAllAction: TAction
      Category = '&Edit'
      Caption = '&Select All'
      Hint = 'Select all'
      ImageIndex = 41
      ShortCut = 16449
      OnExecute = EditSelectAllActionExecute
    end
    object ToolsCompareSchemasAction: TAction
      Category = '&Tools'
      Caption = 'Compare &Schemas...'
      Hint = 'Compare schemas'
      ImageIndex = 48
      OnExecute = ToolsCompareSchemasActionExecute
    end
    object SchemaDocumentAction: TAction
      Category = '&Tools'
      Caption = 'Schema Document...'
      Hint = 'Schema document'
      ImageIndex = 47
      OnExecute = SchemaDocumentActionExecute
    end
    object ViewPreviousPageAction: TAction
      Category = '&View'
      Caption = '&Previous Page'
      ImageIndex = 49
      ShortCut = 24585
      OnExecute = ViewPreviousPageActionExecute
    end
    object DatabaseObjectSearchAction: TAction
      Category = '&Database'
      Caption = '&Object Search...'
      Hint = 'Object search'
      ImageIndex = 55
      OnExecute = DatabaseObjectSearchActionExecute
    end
    object EditIncreaseIndentAction: TAction
      Category = '&Edit'
      Caption = '&Increase Indent'
      Hint = 'Increase indent'
      ImageIndex = 57
      SecondaryShortCuts.Strings = (
        'Tab')
      ShortCut = 24649
      OnExecute = EditIncreaseIndentActionExecute
    end
    object EditDecreaseIndentAction: TAction
      Category = '&Edit'
      Caption = '&Decrease Indent'
      Hint = 'Decrease indent'
      ImageIndex = 56
      SecondaryShortCuts.Strings = (
        'Shift+Tab')
      ShortCut = 24661
      OnExecute = EditDecreaseIndentActionExecute
    end
    object EditSortAscAction: TAction
      Category = '&Edit'
      Caption = 'Sort &Ascending'
      Hint = 'Sort ascending'
      ImageIndex = 59
      ShortCut = 24641
      OnExecute = EditSortAscActionExecute
    end
    object EditSortDescAction: TAction
      Category = '&Edit'
      Caption = 'Sort &Descending'
      Hint = 'Sort descending'
      ImageIndex = 60
      ShortCut = 24644
      OnExecute = EditSortDescActionExecute
    end
    object EditToggleCaseAction: TAction
      Category = '&Edit'
      Caption = '&Toggle Case'
      Hint = 'Toggle case'
      ImageIndex = 58
      ShortCut = 24643
      OnExecute = EditToggleCaseActionExecute
    end
    object EditInsertLineAction: TAction
      Category = '&Edit'
      Caption = 'Insert Line'
      Hint = 'Insert line'
      ImageIndex = 72
      ShortCut = 16462
      OnExecute = EditInsertLineActionExecute
    end
    object EditDeleteWordAction: TAction
      Category = '&Edit'
      Caption = 'Delete Word'
      Hint = 'Delete word'
      ShortCut = 16468
      OnExecute = EditDeleteWordActionExecute
    end
    object EditDeleteLineAction: TAction
      Category = '&Edit'
      Caption = 'Delete Line'
      Hint = 'Delete line'
      ImageIndex = 73
      ShortCut = 16473
      OnExecute = EditDeleteLineActionExecute
    end
    object EditDeleteEOLAction: TAction
      Category = '&Edit'
      Caption = 'Delete EOL'
      Hint = 'Delete end of line'
      ShortCut = 24665
      OnExecute = EditDeleteEOLActionExecute
    end
    object ToolsSelectForCompareAction: TAction
      Category = '&Tools'
      Caption = 'Select for Compare...'
      Hint = 'Select for compare'
      ImageIndex = 29
      OnExecute = ToolsSelectForCompareActionExecute
    end
    object TNSNamesEditorAction: TAction
      Category = '&Tools'
      Caption = '&TNSNames Editor...'
      Hint = 'Configuration file (tnsnames.ora) editor'
      ImageIndex = 75
      OnExecute = TNSNamesEditorActionExecute
    end
    object DatabaseCreateConstraintAction: TAction
      Category = '&Create'
      Caption = '&Constraint...'
      ImageIndex = 76
      OnExecute = DatabaseCreateConstraintActionExecute
    end
    object DatabaseCreateDBLinkAction: TAction
      Category = '&Create'
      Caption = '&DB Link...'
      ImageIndex = 77
      OnExecute = DatabaseCreateDBLinkActionExecute
    end
    object DatabaseCreateFunctionAction: TAction
      Category = '&Create'
      Caption = '&Function...'
      ImageIndex = 84
      OnExecute = DatabaseCreateFunctionActionExecute
    end
    object DatabaseCreateIndexAction: TAction
      Category = '&Create'
      Caption = '&Index...'
      ImageIndex = 78
      OnExecute = DatabaseCreateIndexActionExecute
    end
    object DatabaseCreatePackageAction: TAction
      Category = '&Create'
      Caption = '&Package...'
      ImageIndex = 79
      OnExecute = DatabaseCreatePackageActionExecute
    end
    object DatabaseCreateProcedureAction: TAction
      Category = '&Create'
      Caption = 'P&rocedure...'
      ImageIndex = 80
      OnExecute = DatabaseCreateProcedureActionExecute
    end
    object DatabaseCreateSequenceAction: TAction
      Category = '&Create'
      Caption = '&Sequence...'
      ImageIndex = 81
      OnExecute = DatabaseCreateSequenceActionExecute
    end
    object DatabaseCreateSynonymAction: TAction
      Category = '&Create'
      Caption = 'S&ynonym...'
      ImageIndex = 82
      OnExecute = DatabaseCreateSynonymActionExecute
    end
    object DatabaseCreateTableAction: TAction
      Category = '&Create'
      Caption = '&Table...'
      ImageIndex = 83
      OnExecute = DatabaseCreateTableActionExecute
    end
    object DatabaseCreateTriggerAction: TAction
      Category = '&Create'
      Caption = 'Tri&gger...'
      ImageIndex = 85
      OnExecute = DatabaseCreateTriggerActionExecute
    end
    object DatabaseCreateUserAction: TAction
      Category = '&Create'
      Caption = '&User...'
      ImageIndex = 86
      OnExecute = DatabaseCreateUserActionExecute
    end
    object DatabaseCreateViewAction: TAction
      Category = '&Create'
      Caption = '&View...'
      ImageIndex = 87
      OnExecute = DatabaseCreateViewActionExecute
    end
    object SelectStyleAction: TAction
      Caption = 'SelectStyleAction'
      OnExecute = SelectStyleActionExecute
    end
    object ClearBookmarksAction: TAction
      Category = '&Search'
      Caption = 'Clear &Bookmarks'
      Hint = 'Clear all bookmarks'
      ImageIndex = 71
      OnExecute = ClearBookmarksActionExecute
    end
    object SearchGotoLineAction: TAction
      Category = '&Search'
      Caption = 'Go to Line'
      ImageIndex = 88
      ShortCut = 16455
      OnExecute = SearchGotoLineActionExecute
    end
    object GotoBookmarks0Action: TAction
      Category = 'Go to Bookmarks'
      Caption = 'Bookmark &0'
      ImageIndex = 61
      ShortCut = 16432
      OnExecute = GotoBookmarks0ActionExecute
    end
    object GotoBookmarks1Action: TAction
      Category = 'Go to Bookmarks'
      Caption = 'Bookmark &1'
      ImageIndex = 62
      ShortCut = 16433
      OnExecute = GotoBookmarks0ActionExecute
    end
    object GotoBookmarks2Action: TAction
      Category = 'Go to Bookmarks'
      Caption = 'Bookmark &2'
      ImageIndex = 63
      ShortCut = 16434
      OnExecute = GotoBookmarks0ActionExecute
    end
    object GotoBookmarks3Action: TAction
      Category = 'Go to Bookmarks'
      Caption = 'Bookmark &3'
      ImageIndex = 64
      ShortCut = 16435
      OnExecute = GotoBookmarks0ActionExecute
    end
    object GotoBookmarks4Action: TAction
      Category = 'Go to Bookmarks'
      Caption = 'Bookmark &4'
      ImageIndex = 65
      ShortCut = 16436
      OnExecute = GotoBookmarks0ActionExecute
    end
    object GotoBookmarks5Action: TAction
      Category = 'Go to Bookmarks'
      Caption = 'Bookmark &5'
      ImageIndex = 66
      ShortCut = 16437
      OnExecute = GotoBookmarks0ActionExecute
    end
    object GotoBookmarks6Action: TAction
      Category = 'Go to Bookmarks'
      Caption = 'Bookmark &6'
      ImageIndex = 67
      ShortCut = 16438
      OnExecute = GotoBookmarks0ActionExecute
    end
    object GotoBookmarks7Action: TAction
      Category = 'Go to Bookmarks'
      Caption = 'Bookmark &7'
      ImageIndex = 68
      ShortCut = 16439
      OnExecute = GotoBookmarks0ActionExecute
    end
    object GotoBookmarks8Action: TAction
      Category = 'Go to Bookmarks'
      Caption = 'Bookmark &8'
      ImageIndex = 69
      ShortCut = 16440
      OnExecute = GotoBookmarks0ActionExecute
    end
    object GotoBookmarks9Action: TAction
      Category = 'Go to Bookmarks'
      Caption = 'Bookmark &9'
      ImageIndex = 70
      ShortCut = 16441
      OnExecute = GotoBookmarks0ActionExecute
    end
    object ToggleBookmarks0Action: TAction
      Category = 'T&oggle Bookmarks'
      Caption = 'Bookmark &0'
      ImageIndex = 61
      ShortCut = 24624
      OnExecute = ToggleBookmarks0ActionExecute
    end
    object ToggleBookmarks1Action: TAction
      Category = 'T&oggle Bookmarks'
      Caption = 'Bookmark &1'
      ImageIndex = 62
      ShortCut = 24625
      OnExecute = ToggleBookmarks0ActionExecute
    end
    object ToggleBookmarks2Action: TAction
      Category = 'T&oggle Bookmarks'
      Caption = 'Bookmark &2'
      ImageIndex = 63
      ShortCut = 24626
      OnExecute = ToggleBookmarks0ActionExecute
    end
    object ToggleBookmarks3Action: TAction
      Category = 'T&oggle Bookmarks'
      Caption = 'Bookmark &3'
      ImageIndex = 64
      ShortCut = 24627
      OnExecute = ToggleBookmarks0ActionExecute
    end
    object ToggleBookmarks4Action: TAction
      Category = 'T&oggle Bookmarks'
      Caption = 'Bookmark &4'
      ImageIndex = 65
      ShortCut = 24628
      OnExecute = ToggleBookmarks0ActionExecute
    end
    object ToggleBookmarks5Action: TAction
      Category = 'T&oggle Bookmarks'
      Caption = 'Bookmark &5'
      ImageIndex = 66
      ShortCut = 24629
      OnExecute = ToggleBookmarks0ActionExecute
    end
    object ToggleBookmarks6Action: TAction
      Category = 'T&oggle Bookmarks'
      Caption = 'Bookmark &6'
      ImageIndex = 67
      ShortCut = 24630
      OnExecute = ToggleBookmarks0ActionExecute
    end
    object ToggleBookmarks7Action: TAction
      Category = 'T&oggle Bookmarks'
      Caption = 'Bookmark &7'
      ImageIndex = 68
      ShortCut = 24631
      OnExecute = ToggleBookmarks0ActionExecute
    end
    object ToggleBookmarks8Action: TAction
      Category = 'T&oggle Bookmarks'
      Caption = 'Bookmark &8'
      ImageIndex = 69
      ShortCut = 24632
      OnExecute = ToggleBookmarks0ActionExecute
    end
    object ToggleBookmarks9Action: TAction
      Category = 'T&oggle Bookmarks'
      Caption = 'Bookmark &9'
      ImageIndex = 70
      ShortCut = 24633
      OnExecute = ToggleBookmarks0ActionExecute
    end
    object FileReopenClearAction: TAction
      Category = '&Reopen'
      Caption = '&Clear'
      ImageIndex = 89
      OnExecute = FileReopenClearActionExecute
    end
    object SelectReopenFileAction: TAction
      OnExecute = SelectReopenFileActionExecute
    end
    object SearchToggleBookmarksAction: TAction
      Category = '&Search'
      Caption = 'Toggle Bookmarks'
      OnExecute = DummyActionExecute
    end
    object SearchGotoBookmarksAction: TAction
      Category = '&Search'
      Caption = 'Go to Bookmarks'
      OnExecute = DummyActionExecute
    end
  end
  object MenuImageList: TBCImageList
    Left = 62
    Top = 418
    Bitmap = {
      494C01015B005D00040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000007001000001002000000000000070
      0100000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000641402003C0C01003C0C
      01003C0C01006214020000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000A59180008E7055008D6E53008D6E53008D6E53008D6E53008D6E
      53008D6E53008D6E53008E715600977C63000000000000000000000000000000
      0000000000003140C0002B3BBE002B3ABE002B3BBE003140C000000000000000
      0000000000000000000000000000000000000000000000000000000000000566
      9500056695000566950005669500056695006715020087220500981E0100971D
      0000891E0300631502003C0C0100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008C6C5000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF008F7156000000000000000000000000002B3B
      BE004A5BE2006175FC00697DFF00697CFF00697DFF006175FC004A5BE2002B3B
      BE000000000000000000000000000000000000000000000000000274A90030C9
      E90012CBFE0020CEFE0054DEFF007E3D1100A9440F00AB350700D89B8300B042
      23009C1B0000A624030066160200651502000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B6B7B600B1B3B200B0B1B000B0B2
      B200B2B6B60088664800FFFFFF00848586007D7E7E009C9C9D007F8080007F80
      80009B9B9C0078797A00FFFFFF008D6E530000000000000000002F3FC200596D
      F6006276FF006074FE005F73FE005F73FD005F73FE006074FE006276FF00596D
      F6002F3FC200000000000000000000000000000000000274A90073FAFE003FE3
      FE0012CBFE0020CEFE0054DEFF008E280900B55F1800A53F0700FFFFFF00FFFF
      FF00BF6247009E1E00009A220300671502000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B0B0AE00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0084624400FFFFFF008687870062626200FFFFFF00646464006464
      6400FFFFFF005A5B5B00FFFFFF008D6E5300000000002C3CBF005669F4005D71
      FC005B6FFA005A6EF9005A6EF9005A6EF9005A6EF9005A6EF9005B6FFA005D71
      FC005669F4002C3CBF000000000000000000000000000274A90073FAFE003FE3
      FE0012CBFE0020CEFE0054DEFF008E280900B8712500AB520D00FFFFFF00FFFF
      FF00FFFFFF00B6523400AA250300671502000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000AEAEAB00FFFFFF00FCFCFC00FDFD
      FD00FFFFFF0083614300FFFFFF00646566007B7B7B00999898007B7B7C007B7B
      7C009796960074757600FFFFFF008D6E5200000000004256DE00576DFB005369
      F8005268F7005267F7005267F7005267F7005267F7005267F7005268F7005369
      F800576DFB004256DE000000000000000000000000000274A90073FAFE003FE3
      FE0012CBFE0020CEFE0054DEFF008E280900CB945200AB570D00FFFFFF00FFFF
      FF00C1744600A12F0500AA2A0500671502000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000ADADAB00FFFFFF00F8F7F700FAF9
      F900FFFFFF0082614200FFFFFF00F2F4F700FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF008D6E53003242C0004E64F4004C63F700425A
      F4003E56F4003D55F4003D55F4003D55F4003D55F4003D55F4003E56F400425A
      F4004C63F7004E64F4003242C00000000000000000000274A9009FFBFE00A3F3
      FF00B6F2FF00DAF8FF00E5FAFF00A7512000D0A07700C78D4D00DDB88F00BA6F
      2C00AB4E0E00AF4A11009D3209006B1A04000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000ADADAB00FFFFFF00F5F4F400F6F5
      F500FAFBFC00B09D8A0083624300846345008462440084624400856345008867
      4A008B6C4F008C6D52008D6F5400C0B0A2002C3CBF005369F8003E56F300FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF003E56F3005369F8002C3CBF0000000000000000000274A900A7E9F3001CAA
      D3000791C5000788BC00108BBC00108BBC008E280900D7AA8400D7AC7800C990
      5000C5874100A94D180084320B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000ADADAB00FFFFFF00F2F1F100F2F1
      F100F4F4F400F7F8F900F6F7F900F7F8FA00F6F7FA00F6F7FA00FFFFFF00B3B7
      B800000000000000000000000000000000002B3BBF006378F700334DF000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00334DF0006378F7002B3BBF0000000000000000000274A90031B5D3003FE3
      FE0012CBFE0020CEFE0054DEFF0074E0F80030B0DA00974C0E008E2809008E28
      09008E28090086370D0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000ADADAB00FFFFFF00EFEDEE00EFEE
      EE00EFEEEE00EFEFEF00EFEFEF00EFEFEF00EFEFEF00F0EFF000FFFFFF00AFB2
      B3000000000000000000AC6E3100000000002A39BF008696F8002F4BEE00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF002F4BEE008696F8002A39BF0000000000000000000274A90073FAFE003FE3
      FE0012CBFE0020CEFE0054DEFF0074E0F80030B0DA000386C100056695000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000ADADAB00FFFFFF00EBEAEA00ECEB
      EB00ECEBEB00EBE9E900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00ADB2
      B50000000000AC6E3100AC6E3100000000002F3EC100A1ACF4003852ED002D48
      EC002B46EB002A46EB002A46EB002A46EB002A46EB002A46EB002B46EB002D48
      EC003852ED00A1ACF4002F3EC10000000000000000000274A90073FAFE003FE3
      FE0012CBFE0020CEFE0054DEFF0074E0F80030B0DA000386C100056695000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000ADADAB00FFFFFF00E8E7E700E9E8
      E800E9E8E800E7E6E600FFFFFF00CBCBCA00A6A6A400A5A5A200FFFFFF00AEB4
      B800B9773100BC7E3D00AC6E310000000000000000006F7CDD008494F5002E4A
      E900334DE900354FEA003650EA003650EA003650EA00354FEA00334DE9002E4A
      E9008494F5006F7CDD000000000000000000000000000274A90073FAFE003FE3
      FE0012CBFE0020CEFE0054DEFF0074E0F80030B0DA000386C100056695000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000AEAEAB00FFFFFF00E4E3E300E5E4
      E400E5E4E400E4E3E300FFFFFF00A6A6A400FBFBFA00FFFFFF00E9E9EB00CCD1
      D30000000000CB8D4600AC6E310000000000000000002737BF009AA7F0007F90
      F300324CE9002D49E700304CE800314CE800304CE8002D49E700324CE9007F90
      F3009AA7F0002737BF000000000000000000000000000274A90078FBFE0068F6
      FF0054F6FF005FFEFF007FFEFF0089FBFE0048CFF200058BC700056695000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000AEAEAC00FFFFFF00E0DFDE00E1DF
      DE00E1DFDE00E0DFDD00FFFFFF00A5A5A300FFFFFF00E8E8E900CCCDCD000000
      00000000000000000000AC6E31000000000000000000000000002F3FC30097A3
      EF009EACF7006075ED003E57E9002441E5003E57E9006075ED009EACF70097A3
      EF002F3FC300000000000000000000000000000000000274A900FBFFFF00F0FF
      FF00C6FFFF00A0FFFF0098FFFF0098FFFF0093FFFF0057F7FE00056695000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000AFAFAD00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E9EAEB00BCBDBD00000000000000
      0000000000000000000000000000000000000000000000000000000000002737
      BF006A77DC009EA9F200AFBAF800AFBBF800AFBAF8009EA9F2006A77DC002737
      BF000000000000000000000000000000000000000000000000000479AF00EDFA
      FC00DCFFFF00B7FFFF0099FFFF0092FFFF0083FAFB00086B9A00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B8B8B600B0B0AD00AEAEAC00AEAE
      AB00AEAEAB00ADAEAB00AEAEAB00AFAFAE00BCBEBE0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000002F3EC2002737BF002737BF002737BF002F3EC200000000000000
      0000000000000000000000000000000000000000000000000000000000000274
      A9000274A9000274A9000274A9000274A9000274A90000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000035A0500035A0500035A
      0500035A05000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000035A0500035A0500035A
      0500035A05000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000035A0500035A0500035A
      0500035A05000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000035A0500035A0500035A
      0500035A0500000000000000000000000000A46769008E5D59008E5D59008E5D
      59008E5D59008E5D59008E5D59008E5D59008E5D5900035A0500089511000690
      0E00035A05000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000035A0500089511000690
      0E00035A05000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000035A0500089511000690
      0E00035A0500000000000000000000000000A46769008E5D59008E5D59008E5D
      59008E5D59008E5D59008E5D59008E5D59008E5D5900035A0500089511000690
      0E00035A0500000000000000000000000000A4676900F3DCB900F2D8B100F0D4
      AA00EFD1A500EECE9E00EECE9E00EBC58E00EBC58E00035A05000C9D19000A99
      1500035A05000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000035A05000C9D19000A99
      1500035A0500000000000000000000000000000000006E2D13006E2D13006E2D
      13006E2D13006E2D13006E2D13000000000000000000035A05000C9D19000A99
      1500035A0500000000000000000000000000A4676900F3DCB900F2D8B100F0D4
      AA00EFD1A500EECE9E00EECE9E00EBC58E00EBC58E00035A05000C9D19000A99
      1500035A0500000000000000000000000000A0675B00F4E0C100F3DCB900F2D8
      B100F0D4AA00F0D4AA00035A0500035A0500035A0500035A050011A624000DA0
      1C00035A0500035A0500035A0500035A05000000000000000000000000000000
      0000000000005C205C00035A0500035A0500035A0500035A050011A624000DA0
      1C00035A0500035A0500035A0500035A05006E2D1300CF3F1A00ED473100F252
      3A00F4604200EB583F00035A0500035A0500035A0500035A050011A624000DA0
      1C00035A0500035A0500035A0500035A0500A0675B00F4E0C100F3DCB900F2D8
      B100F0D4AA00F0D4AA00035A0500035A0500035A0500035A050011A624000DA0
      1C00035A0500035A0500035A0500035A0500A0675B00F6E6CA00F4E0C100F4E0
      C100F4E0C100F2D8B100035A050025C7470025C747001BB735001BB7350013AB
      270011A624000DA01C000A991500035A05000000000000000000000000000000
      000029133B00480C4800035A050025C7470025C747001BB735001BB7350013AB
      270011A624000DA01C000A991500035A05006E2D1300DC411F00F75D4000FD72
      4E00B7411700E3968300035A050025C7470025C747001BB735001BB7350013AB
      270011A624000DA01C000A991500035A0500A0675B00F6E6CA00F4E0C100004B
      0000004B0000004B0000035A050025C7470025C747001BB735001BB7350013AB
      270011A624000DA01C000A991500035A0500A7756B00F8EBD600F8EBD6000000
      820000008200F4E0C100035A05002CD3550027CB4B0025C747001CBA38001BB7
      350017B02E0013AB270011A62400035A05000000000000000000000000002D53
      5D004A0E4A0051155100035A05002CD3550027CB4B0025C747001CBA38001BB7
      350017B02E0013AB270011A62400035A05006E2D1300EE533000FD724E00F86A
      4400B8411700F7E9E700035A05002CD3550027CB4B0025C747001CBA38001BB7
      350017B02E0013AB270011A62400035A0500A7756B00F8EBD600F8EBD6000A7A
      18001DCE4A00004B0000035A05002CD3550027CB4B0025C747001CBA38001BB7
      350017B02E0013AB270011A62400035A0500A7756B00F9EEDD00F8EBD6000000
      820000008200F6E6CA00035A0500035A0500035A0500035A050027CB4B0025C7
      4700035A0500035A0500035A0500035A05000000000000000000000000003329
      49005014500032323200035A0500035A0500035A0500035A050027CB4B0025C7
      4700035A0500035A0500035A0500035A050000000000B5321500F86A4400B841
      1700E9A18C00F8FAFA00035A0500035A0500035A0500035A050027CB4B0025C7
      4700035A0500035A0500035A0500035A0500A7756B00F9EEDD00F8EBD6000A7A
      18000A7A18000A7A1800035A0500035A0500035A0500035A050027CB4B0025C7
      4700035A0500035A0500035A0500035A0500BC826800FAF2E500FAF2E5000000
      820000008200F6E6CA00F6E6CA00F3DCB900F2D8B100035A05002CD3550029CF
      5200035A05000000000000000000000000000000000000000000000000003A19
      46002A2A2A005E5E5E006F6F6F003F3F3F001F1F1F00035A05002CD3550029CF
      5200035A05000000000000000000000000000000000000000000924E41008677
      77005A87990057828E0095685200B532150000000000035A05002CD3550029CF
      5200035A0500000000000000000000000000BC826800FAF2E500FAF2E500F8EB
      D60000650000F6E6CA00F6E6CA00F3DCB90000650000035A05002CD3550029CF
      5200035A0500000000000000000000000000BC826800FCF7EE00FAF2E5000000
      820000008200000082000000820000008200F3DCB900035A050034DE650030D9
      5E00035A05000000000000000000000000000000000000000000000000003031
      4900652965006B6B6B007A7A7A005050500033333300035A050034DE650030D9
      5E00035A050000000000000000000000000000000000000000000F6DDC000464
      CC00095FC2000457C1000B6D99000000000000000000035A050034DE650030D9
      5E00035A0500000000000000000000000000BC826800FCF7EE00FAF2E500FAF2
      E5000065000000650000006500000065000000650000035A050034DE650030D9
      5E00035A0500000000000000000000000000D1926D00FDFAF500FDFAF5000000
      820000008200F9EEDD00F9EEDD00F8E7D000F6E6CA00035A0500035A0500035A
      0500035A0500000000000000000000000000000000000000000000000000795E
      87005D225E00884C88006E6E6E00585858004E4E4E00035A0500035A0500035A
      0500035A05000000000000000000000000000000000002375C001D7EFC002081
      FB002081FB001E7BF700166BEF000B6D990000000000035A0500035A0500035A
      0500035A0500000000000000000000000000D1926D00FDFAF500FDFAF500FCF7
      EE00FAF2E500F9EEDD0000650000F8E7D000F6E6CA00035A0500035A0500035A
      0500035A0500000000000000000000000000D1926D00FEFEFE00FDFAF5000000
      820000008200FAF2E500FAF2E500F9EEDD00F8EBD600F6E6CA00F6E6CA00F3DC
      B90080504B000000000000000000000000000000000000000000000000000000
      0000103343006E37700092569200985C9800783C78005C205C00470B47000000
      00000000000000000000000000000000000001416D000C5397002993FF002993
      FF002993FF00268EFA002081FB001A70EB000B6D990000000000000000000000
      000000000000000000000000000000000000D1926D00FEFEFE00FDFAF500FCF7
      F000FCF7EE0003099D00020BA90004059100F8EBD600F6E6CA00F6E6CA00F3DC
      B90080504B00000000000000000000000000DA9D7500FEFEFE00FEFEFE000000
      8200000082000000820000008200000082000000820000008200F6E6CA00F6E6
      CA0080504B000000000000000000000000000000000000000000000000000000
      00000000000056215A005216520043074300410541005C205C00000000000000
      000000000000000000000000000000000000003B660002375C002990EA00288E
      E600309DFB002D98FA002993FF001F82F7000B6D990000000000000000000000
      000000000000000000000000000000000000DA9D7500FEFEFE00FEFEFE00FEFE
      FE00FDFAF5000427FF00164CFF00020BA900F9EEDD00F9EEDD00F6E6CA00F6E6
      CA0080504B00000000000000000000000000DA9D7500FEFEFE00FEFEFE00FEFE
      FE00FEFEFE00FEFEFE00FCF7EE00FAF2E500FAF2E500F9EEDD00F9EEDD00F7E9
      D30080504B0000000000000000000000000000000000041EFF000525D5000000
      0000000000003D3E5A0054185400000000000000000000000000000000000000
      000000000000000000000000000000000000024D8100024D810002375C000237
      5C0036A6FF00309DFB002993FF002389F6000B6D990000000000000000000000
      000000000000000000000000000000000000DA9D7500FEFEFE00FEFEFE00FEFE
      FE00FEFEFE001323BA000427FF0003099D00FAF2E500F9EEDD00F9EEDD00F7E9
      D30080504B00000000000000000000000000E7AB7900FEFEFE00FEFEFE00FEFE
      FE00FEFEFE00FEFEFE00FDFAF500FDFAF500FCF7EE00FCF7EE00F9EEDD00F9EE
      DD0080504B000000000000000000000000000000000000000000041EFF003A14
      7500261C3D002F0E3C0000000000000000000000000000000000000000000000
      00000000000000000000000000000000000013699C005298BC0001416D001D78
      BD0039ACFF0036A6FF0036A6FF000B6D99000000000000000000000000000000
      000000000000000000000000000000000000E7AB7900FEFEFE00FEFEFE00FEFE
      FE00FEFEFE00FEFEFE00FDFAF500FDFAF500FCF7EE00FCF7EE00F9EEDD00F9EE
      DD0080504B00000000000000000000000000E7AB7900FEFEFE00FEFEFE00FEFE
      FE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FDFAF500FCF7EE00FCF7EE00FAF2
      E50080504B000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000013699C005298BC001563
      9200013D6900003B6600013D69000B6D99000000000000000000000000000000
      000000000000000000000000000000000000E7AB7900FEFEFE00FEFEFE00FEFE
      FE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FDFAF500FCF7EE00FCF7EE00FAF2
      E50080504B00000000000000000000000000E7AB7900CF8E6800CF8E6800CF8E
      6800CF8E6800CF8E6800CF8E6800CF8E6800CF8E6800CF8E6800CF8E6800CF8E
      680080504B000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000002377A6001669
      970007507E00013D690000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E7AB7900CF8E6800CF8E6800CF8E
      6800CF8E6800CF8E6800CF8E6800CF8E6800CF8E6800CF8E6800CF8E6800CF8E
      680080504B000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000035A0500035A0500035A
      0500035A05000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000035A0500035A0500035A
      0500035A05000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000035A0500035A0500035A
      0500035A05000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000035A0500035A0500035A
      0500035A0500000000000000000000000000A46769008E5D59008E5D59008E5D
      59008E5D59008E5D59008E5D59008E5D59008E5D5900035A0500089511000690
      0E00035A05000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000035A0500089511000690
      0E00035A05000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000035A0500089511000690
      0E00035A05000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000035A0500089511000690
      0E00035A0500000000000000000000000000A4676900F3DCB900F2D8B100F0D4
      AA00EFD1A500EECE9E00EECE9E00EBC58E00EBC58E00035A05000C9D19000A99
      1500035A05000000000000000000000000000000000000000000000000000000
      00000B7A00000B7A00000B7A00000B7A000000000000035A05000C9D19000A99
      1500035A05000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000035A05000C9D19000A99
      1500035A0500000000000000000000000000893615007D3213007D3213007D32
      13007D3213007D3213007D3213007D3213007D321300035A05000C9D19000A99
      1500035A05007D3213007D32130000000000A0675B00F4E0C100F3DCB900F2D8
      B100F0D4AA00F0D4AA00035A0500035A0500035A0500035A050011A624000DA0
      1C00035A0500035A0500035A0500035A05000000000000000000000000000000
      00000B7A000000000000035A0500035A0500035A0500035A050011A624000DA0
      1C00035A0500035A0500035A0500035A05000000000000000000000000000000
      00000000000000000000035A0500035A0500035A0500035A050011A624000DA0
      1C00035A0500035A0500035A0500035A0500692A1100FEF0E100FEEBD800FEE5
      CA0000650000FEDCB700035A0500035A0500035A0500035A050011A624000DA0
      1C00035A0500035A0500035A0500035A0500A0675B00F6E6CA00F4E0C100F4E0
      C100F4E0C100F2D8B100035A050025C7470025C747001BB735001BB7350013AB
      270011A624000DA01C000A991500035A05000000000000000000000000000000
      0000000000000B7A0000035A050025C7470025C747001BB735001BB7350013AB
      270011A624000DA01C000A991500035A05000000000000000000000000000000
      00000000000000000000035A050025C7470025C747001BB735001BB7350013AB
      270011A624000DA01C000A991500035A050065281000FEF6EE00FEF0E100FEEB
      D80000650000FEE2C500035A050025C7470025C747001BB735001BB7350013AB
      270011A624000DA01C000A991500035A0500A7756B00F8EBD600F8EBD6000C82
      00000C820000F4E0C100035A05002CD3550027CB4B0025C747001CBA38001BB7
      350017B02E0013AB270011A62400035A05000000000000000000000000000000
      00000000000000000000035A05002CD3550027CB4B0025C747001CBA38001BB7
      350017B02E0013AB270011A62400035A05000000000000000000000000000000
      00000000000000000000035A05002CD3550027CB4B0025C747001CBA38001BB7
      350017B02E0013AB270011A62400035A05006528100000650000006500000065
      00000065000000650000035A05002CD3550027CB4B0025C747001CBA38001BB7
      350017B02E0013AB270011A62400035A0500A7756B00F9EEDD00F8EBD6000C82
      00000C820000F6E6CA00035A0500035A0500035A0500035A050027CB4B0025C7
      4700035A0500035A0500035A0500035A05000000000000000000000000000000
      00000B7A000000000000035A0500035A0500035A0500035A050027CB4B0025C7
      4700035A0500035A0500035A0500035A05000000000000000000000000000000
      00000000000000000000035A0500035A0500035A0500035A050027CB4B0025C7
      4700035A0500035A0500035A0500035A050065281000FEFEFE00FEFEFE00FEF6
      EE0000650000FEEFE000035A0500035A0500035A0500035A050027CB4B0025C7
      4700035A0500035A0500035A0500035A0500BC826800FAF2E500FAF2E5000C82
      00000C820000F6E6CA00F6E6CA00F3DCB900F2D8B100035A05002CD3550029CF
      5200035A05000000000000000000000000000000000000000000000000000000
      0000000000000B7A00000B7A00000000000000000000035A05002CD3550029CF
      5200035A05000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000035A05002CD3550029CF
      5200035A050000000000000000000000000065280F00FEFEFE00FEFEFE00FEFE
      FE0000650000FEF6EE00FEEBD800FEEBD800FEE5CA00035A05002CD3550029CF
      5200035A0500FED3A500752E110000000000BC826800FCF7EE00FAF2E5000C82
      00000C8200000C8200000C8200000C8200000C820000035A050034DE650030D9
      5E00035A05000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000035A050034DE650030D9
      5E00035A05000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000035A050034DE650030D9
      5E00035A050000000000000000000000000065280F00FEFEFE00FEFEFE00FEFE
      FE0000650000FEFBF700FEFBF700FEEFE000FEEBD800035A050034DE650030D9
      5E00035A0500FEE5CA00752E110000000000D1926D00FDFAF500FDFAF5000C82
      00000C820000F9EEDD00F9EEDD00F8E7D0000C820000035A0500035A0500035A
      0500035A05000000000000000000000000000000000000000000000000000000
      FF0000000000000000000000000000000000A2000B00035A0500035A0500035A
      0500035A05000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000035A0500035A0500035A
      0500035A05000000000000000000000000006528100000650000006500000065
      00000065000000650000006500000065000000650000035A0500035A0500035A
      0500035A050000650000752E110000000000D1926D00FEFEFE00FDFAF5000C82
      00000C820000FAF2E500FAF2E500F9EEDD000C8200000C820000F6E6CA00F3DC
      B90080504B000000000000000000000000000000000000000000000000000000
      FF0000000000000000000000000000000000000000000000000000000000A200
      0B00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000065280F00FEFEFE00FEFEFE00FEFE
      FE0000650000FEFEFE00FEFEFE00FEFEFE00FEFBF70000650000FEEFE000FEEB
      D800FEE5CA00FEE0BF00752E110000000000DA9D7500FEFEFE00FEFEFE000C82
      00000C8200000C8200000C8200000C8200000C820000F9EEDD00F6E6CA00F6E6
      CA0080504B000000000000000000000000000000000000000000000000000000
      FF00000000000000000000000000000000000000000000000000A2000B000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000692A1100DCDCDC00DCDCDC00DCDC
      DC0000650000DCDCDC00DCDCDC00DCDCDC00DCDCDC0000650000DCDCDC00DCD7
      D100DCD7D100DCCFC1007D32130000000000DA9D7500FEFEFE00FEFEFE00FEFE
      FE00FEFEFE00FEFEFE00FCF7EE00FAF2E500FAF2E500F9EEDD00F9EEDD00F7E9
      D30080504B000000000000000000000000000000000000000000000000000000
      FF0000000000000000000000000000000000A2000B000000000000000000A200
      0B00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000009941150099411500994115009844
      1000994115009941150098441000994115009844100099411500984410009844
      10009941150097451300752E110000000000E7AB7900FEFEFE00FEFEFE00FEFE
      FE00FEFEFE00FEFEFE00FDFAF500FDFAF500FCF7EE00FCF7EE00F9EEDD00F9EE
      DD0080504B0000000000000000000000000000000000000000000000FF000000
      FF000000000000000000000000000000000000000000A2000B00A2000B000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000099411500E97F1E00E97F1E00E97F
      1E00E97F1E00E97F1E00E97F1E00E97F1E00E97F1E00E97F1E00E97F1E00E97F
      1E00E97F1E00E97F1E00A6420C0000000000E7AB7900FEFEFE00FEFEFE00FEFE
      FE00FEFEFE00FEFEFE00FEFEFE00FEFEFE00FDFAF500FCF7EE00FCF7EE00FAF2
      E50080504B000000000000000000000000000000000000000000000000000000
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000BD580C00BD580C00BD58
      0C00BD580C00BD580C00BD580C00BD580C00BD580C00BD580C00BD580C00BD58
      0C00BD580C00BD580C000000000000000000E7AB7900CF8E6800CF8E6800CF8E
      6800CF8E6800CF8E6800CF8E6800CF8E6800CF8E6800CF8E6800CF8E6800CF8E
      680080504B000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000035A0500035A0500035A
      0500035A05000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000035A0500035A0500035A
      0500035A05000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000035A0500035A0500035A
      0500035A05000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000035A0500035A0500035A
      0500035A05000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000035A0500089511000690
      0E00035A05000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000035A0500089511000690
      0E00035A05000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000035A0500089511000690
      0E00035A05000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000035A0500089511000690
      0E00035A05000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000035A05000C9D19000A99
      1500035A05000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000035A05000C9D19000A99
      1500035A0500000000000000000000000000893615007D3213007B3113007B31
      13007B3113007B3113007B3113007B3113007B311300035A05000C9D19000A99
      1500035A05007E3313008A371500000000000000000000000000000000000000
      000000000000000000000000000032224000250A3500035A05000C9D19000A99
      1500035A05000000000000000000000000000000000000000000000000000000
      00000000000000000000035A0500035A0500035A0500035A050011A624000DA0
      1C00035A0500035A0500035A0500035A05000000000000000000000000000000
      00000000000000000000035A0500035A0500035A0500035A050011A624000DA0
      1C00035A0500035A0500035A0500035A0500692A1100FEF0E200FEEBD700FEE6
      CB00FEE1C100FEDCB700035A0500035A0500035A0500035A050011A624000DA0
      1C00035A0500035A0500035A0500035A05000000000000000000000000000000
      00000000000000000000035A0500035A0500035A0500035A050011A624000DA0
      1C00035A0500035A0500035A0500035A0500000000000000000000000000811E
      0000811E0000811E0000035A050025C7470025C747001BB735001BB7350013AB
      270011A624000DA01C000A991500035A05000000000000000000000000000000
      00000000000000000000035A050025C7470025C747001BB735001BB7350013AB
      270011A624000DA01C000A991500035A050065281000FEF6EE00FEF0E500FEED
      D900FEE7CF00FEE2C500035A050025C7470025C747001BB735001BB7350013AB
      270011A624000DA01C000A991500035A05000000000000000000000000000000
      00006E9ABB009CC7E700035A050025C7470025C747001BB735001BB7350013AB
      270011A624000DA01C000A991500035A0500000000000000000000000000811E
      0000FEFEFE00FEFEFE00035A05002CD3550027CB4B0025C747001CBA38001BB7
      350017B02E0013AB270011A62400035A0500000000000000000000000000004B
      8200004B8200004B8200035A05002CD3550027CB4B0025C747001CBA38001BB7
      350017B02E0013AB270011A62400035A050066281000FEFBF700000082000000
      820000008200FEE9D100035A05002CD3550027CB4B0025C747001CBA38001BB7
      350017B02E0013AB270011A62400035A0500000000000000000050445D00ABDB
      F900ABD9F800A9D7F500035A05002CD3550027CB4B0025C747001CBA38001BB7
      350017B02E0013AB270011A62400035A0500000000000000000000000000811E
      0000FEFEFE00FEFEFE00035A0500035A0500035A0500035A050027CB4B0025C7
      4700035A0500035A0500035A0500035A05000000000000000000004B820000BD
      FF0000BDFF0000BDFF00035A0500035A0500035A0500035A050027CB4B0025C7
      4700035A0500035A0500035A0500035A050066281000FEFEFE00FEFBF800FEF8
      F200FEF3EA00FEEFE000035A0500035A0500035A0500035A050027CB4B0025C7
      4700035A0500035A0500035A0500035A05000000000000000000626F8000A7DF
      FB00ADE0FB00B0E2FA00035A0500035A0500035A0500035A050027CB4B0025C7
      4700035A0500035A0500035A0500035A0500000000000000000000000000811E
      0000CAD4FE00284BFB00011FFA00284BFB000120FA00035A05002CD3550029CF
      5200035A050000000000000000000000000000000000004B820000C7FF0000C2
      FF00004B8200004B8200004B8200004B8200004B8200035A05002CD3550029CF
      5200035A0500004B8200000000000000000065280F00FEFEFE00FEFEFE00FEFC
      FB00FEFAF400FEF4EB00FEF0E100FEEBD800FEE6CB00035A05002CD3550029CF
      5200035A0500035A0500035A0500035A050000000000000000006D8FA000AFE9
      FE00B5ECFB00B7EAFE00B1DFFF00A0CEEE0040628000035A05002CD3550029CF
      5200035A050000142A000000000000000000000000000000000000000000811E
      00003D5DFB00092AFA00AABAFC00EAEEFE00092AFA00035A050034DE650030D9
      5E00035A050000000000000000000000000000000000004B820000DDFF00004B
      820000000000004B820000FFFF0000DDFF0000BDFF00035A050034DE650030D9
      5E00035A0500004B8200000000000000000065280F00FEFEFE00000082000000
      820000008200FEFBF700963511009635110096351100035A050034DE650030D9
      5E00035A05001FB5370011A32100035A050000000000000000006B8E9F00A7E1
      F700B7EEFD00B5E9FC00ACD9F80097C2E100405E7C00035A050034DE650030D9
      5E00035A050001172E000000000000000000000000000000000000000000811E
      0000DCE3FE00CAD4FE00FEFEFE00FEFEFE008097FC00035A0500035A0500035A
      0500035A050000000000000000000000000000000000004B820000F4FF0000EE
      FF00004B8200004B8200004B8200004B8200004B8200035A0500035A0500035A
      0500035A0500004B8200000000000000000066281000FEFEFE00FEFEFE00FEFE
      FE00FEFEFE00FEFEFE00FEFBF700FEF7F000FEF3E600035A0500035A0500035A
      0500035A0500035A0500035A0500035A050000000000000000006F839800AEE0
      FA00B1E9FE00B0E4FB00A2CFEE00B5D0E10049617800035A0500035A0500035A
      0500035A05000A2137000000000000000000000000000000000000000000811E
      0000FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE003D5DFB00011FFA000000
      0000000000000000000000000000000000000000000000000000004B820000FF
      FF0000FAFF0000F4FF0000EDFF00004B820000FFFF0000F7FF0000EBFF0000DE
      FF00004B820000000000000000000000000065280F00FEFEFE00FEFEFE00FEFE
      FE00FEFEFE00FEFEFE00FEFEFE00FEFCFA00FEF8F200FEF4E900FEEFE000BCC7
      9E00035A0500035A0500752E110000000000000000000000000068819100A4D5
      F200C5E4FB00DDF2FF003E434900989995009FBEDE008BA6BB004D687C002F50
      6C00284C69000E253B000000000000000000000000000000000000000000811E
      0000811E0000811E0000811E0000811E0000811E0000761E0700111FB800011F
      FA0000000000000000000000000000000000000000000000000000000000004B
      8200004B8200004B8200004B820000000000004B8200004B8200004B8200004B
      8200000000000000000000000000000000006B2D1200DCDCDC00DCDCDC00DCDC
      DC00DCDCDC00DCDCDC00DCDCDC00DCDCDC00DCDCDC00DCDCDC00DCD9D800DCD7
      D100A3B69600035A05007B3416000000000000000000000000006D7989009FAB
      B5001F2521000F111200EDF3F90088A9C5008DB5D10094B6D4008AAAC60087AA
      C50098B9D6001F33460000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000011F
      FA00011FFA000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000009941150099461100984410009844
      100098441000984410009844100098441000984411009A471300994611009A47
      13009745130095461600762F120000000000000000000000000000000000A186
      A7008C9CA400E2F9FF00677B8400404B5500808E9700BBD2E4009ABAD7009FBA
      D20046415B000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000011FFA000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000099411500E97F1E00E97F1E00E97F
      1E00E97F1E00E97F1E00E97F1E00E97F1E00E97F1E00E97F1E00E97F1E00E97F
      1E00E97F1E00E97F1E00A6420C00000000000000000000000000000000000000
      00000000000000000000A48CAD00807092005E62680042454700705878000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000BC580C00BD580C00BD58
      0C00BD580C00BD580C00BD580C00BD580C00BD590C00BF5A0D00BD580B00BF5A
      0D00BB570C00B8570F0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000008B
      4800008B4900008C4C0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000001C2D
      AD002131AD002233AD0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000811E0000811E0000811E0000811E0000811E0000811E
      0000811E0000811E00000000000000000000BCBCBC00B2B2B200B0B0B000AFAF
      B000AFAFB000AFAFB000AFAFB000AFAFB000AFAFB000AFAFB0000094520000BA
      840077E0C60000BB860000995C00BCBCBC00BCBCBC00B2B2B200B0B0B000AFAF
      B000AFAFB000AFAFB000AFAFB000AFAFB000AFAFB000AFAFB0001B31BF00365D
      FA003961FE003960FA00283EC100BCBCBC000000000000000000977C63008E70
      55008C6D51008B6C51008B6D51008C6D53008C6D53008B6D51008B6C51008C6D
      51008E705500977C630000000000000000000000000000000000056695000566
      95000566950005669500811E0000FEFEFE00FEFEFE00FEFEFE00758EFC00A5B6
      FC00FEFEFE00811E00000000000000000000B2B2B200FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00007F360000BE880000BC
      8300FFFFFF0000BC830000C18D00008C4C00B2B2B200FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000317A5003D61FB003C60
      FB003A5EF9003D61FB004366FD001E30AD0000000000000000008E705500FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF008E7055000000000000000000000000000274A90030C9E90012CB
      FE0020CEFE0054DEFF00811E0000FEFEFE00FEFEFE006480FB00011FFA003D5D
      FB00FEFEFE00811E00000000000000000000B0B0B000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00007F370072E5CB00FFFF
      FF00FFFFFF00FFFFFF0077E7CE00008B4900B0B0B000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000417A400A7B9FF00FFFF
      FF00FFFFFF00FFFFFF00ACBDFF001B2DAC0000000000000000008B6D5100FFFF
      FF00FCFEFF00FDFFFF00FFFFFF00AE722900AE722900FFFFFF00FDFFFF00FCFE
      FF00FFFFFF008B6D510000000000000000000274A90073FAFE003FE3FE0012CB
      FE0020CEFE0054DEFF00811E0000CAD4FE00284BFB00011FFA00284BFB000120
      FA00CAD4FE00811E00000000000000000000B1B1B100FFFFFF0042403E00A2A3
      A300A2A3A300A2A3A300A2A3A300A2A3A300A2A3A300007E360000CA940000C8
      8F00FFFFFF0000C9900000CD9900008C4B00B1B1B100FFFFFF0042403E00A2A3
      A300A2A3A300A2A3A300A2A3A300A2A3A300A2A3A3000115A4005876FE005876
      FF005473FE005877FF005F7CFF001D2EAD0000000000000000008B6C5100FFFF
      FF00F9FAFD00FBFFFF00AD722A00F1BE7100F1BE7100AD722A00FBFFFF00F9FA
      FD00FFFFFF008B6C510000000000000000000274A90073FAFE003FE3FE0012CB
      FE0020CEFE0054DEFF00811E00003D5DFB00092AFA00AABAFC00EAEEFE00092A
      FA003859FB00811E00000000000000000000B1B1B100FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00009B590000D1
      9A0074EED40000D49F0000A36700B0B0B000B1B1B100FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00263BC3006B84
      FF00748CFF00718AFF00384DC800B0B0B00000000000000000008B6D5100FFFF
      FF00F7FDFF00AE722A00EFBC6E00EDBC7100EDBC7100EFBC6E00AE722A00F7FD
      FF00FFFFFF008B6D510000000000000000000274A90073FAFE003FE3FE0012CB
      FE0020CEFE0054DEFF00811E0000DCE3FE00CAD4FE00FEFEFE00FEFEFE008097
      FC00011FFA00491F3F000000000000000000B1B1B100FFFFFF0043414000A2A3
      A300A2A3A300A2A3A300A2A3A300A2A3A300A2A3A300F4F7F900FFFFFF000080
      370000843E0000894700FFFFFF00B1B1B100B1B1B100FFFFFF0043414000A2A3
      A300A2A3A300A2A3A300A2A3A300A2A3A300A2A3A300F4F7F900FFFFFF000518
      A6000F21AA00192BAD00FFFFFF00B1B1B10000000000000000008C6D5200FFFF
      FF00AF722700F4C78300F1C78700EDC28100EBB96E00F2C88800F4C78300AF72
      2700FFFFFF008C6D520000000000000000000274A9009FFBFE00A3F3FF00B6F2
      FF00DAF8FF00E5FAFF00811E0000FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFE
      FE003D5DFB00011FFA000000000000000000B1B1B100FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFE00FEFD
      FC00FDFCFB00FBFAF800FFFFFF00B0B0B000B1B1B100FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFE00FEFD
      FC00FDFCFB00FBFAF800FFFFFF00B0B0B00000000000000000008C6D5200FFFF
      FF00C7A47600B2773100B27A3700EECD9C00E0AC5D00B27B3900B2783100C7A4
      7600FFFFFF008C6D520000000000000000000274A900A7E9F3001CAAD3000791
      C5000788BC00108BBC00811E0000811E0000811E0000811E0000811E0000811E
      0000761E0700111FB800011FFA0000000000B1B1B100FFFFFF0045434200A2A3
      A300A2A3A300A2A3A300A2A3A300A2A3A300A2A3A300A2A3A300F9F9F800F4F4
      F300F2F3F200F2F2F100FFFFFF00B0B0B000B1B1B100FFFFFF0045434200A2A3
      A300A2A3A300A2A3A300A2A3A300A2A3A300A2A3A300A2A3A300F9F9F800F4F4
      F300F2F3F200F2F2F100FFFFFF00B0B0B00000000000000000008B6D5100FFFF
      FF00E8ECF000EBF3FC00B2772F00EFD8B700EBCFA600B3783100EBF3FC00E8EC
      F000FFFFFF008B6D510000000000000000000274A90031B5D3003FE3FE0012CB
      FE0020CEFE0054DEFF0074E0F80030B0DA000268A30003689A00000000000000
      00000000000000000000011FFA00011FFA00B1B1B100FFFFFF00FDFCFB00FFFF
      FF00FFFFFF00FFFFFF00FFFFFE00FFFFFE00FFFFFF00FEFEFD00FAF9F800F8F7
      F600F7F6F500F5F4F300FFFFFF00B0B0B000B1B1B100FFFFFF00FDFCFB00FFFF
      FF00FFFFFF00FFFFFF00FFFFFE00FFFFFE00FFFFFF00FEFEFD00FAF9F800F8F7
      F600F7F6F500F5F4F300FFFFFF00B0B0B00000000000000000008B6C5200FFFF
      FF00E1E2E300E3E6EB00C4A07300B0752C00B0752C00C4A07300E3E6EB00E1E2
      E300FFFFFF008B6D520000000000000000000274A90073FAFE003FE3FE0012CB
      FE0020CEFE0054DEFF0074E0F80030B0DA000386C10005669500000000000000
      0000000000000000000000000000011FFA00B1B1B100FFFFFF00007F3600007F
      3600007F3600007F3600007F3600007F3600007F3600007F3600007F3600007F
      3600007F3600007F3600FFFFFF00B1B1B100B1B1B100FFFFFF000317A5000317
      A5000317A5000317A5000317A5000317A5000317A5000317A5000317A5000317
      A5000317A5000317A500FFFFFF00B1B1B1000000000000000000896D5700FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF008A6D560000000000000000000274A90073FAFE003FE3FE0012CB
      FE0020CEFE0054DEFF0074E0F80030B0DA000386C10005669500000000000000
      000000000000000000000000000000000000B1B1B100FFFFFF00F7F6F500FCFC
      FB00FCFBFB00FBFAF900FAF9F900FAFAF900FBFAF900F9F8F700F5F4F300F3F2
      F100F2F1F000EFEEED00FFFFFF00B0B0B000B1B1B100FFFFFF00F7F6F500FCFC
      FB00FCFBFB00FBFAF900FAF9F900FAFAF900FBFAF900F9F8F700F5F4F300F3F2
      F100F2F1F000EFEEED00FFFFFF00B0B0B0000000000000000000BF8E4800C28A
      3B00BF863800BF863800BF873900BF873A00BF873A00BF873900BF863800BF86
      3800C28A3B00B5874C0000000000000000000274A90073FAFE003FE3FE0012CB
      FE0020CEFE0054DEFF0074E0F80030B0DA000386C10005669500000000000000
      000000000000000000000000000000000000B1B1B100FFFFFF0044424100A2A3
      A300A2A3A300A2A3A300A2A3A300A2A3A300A2A3A300A2A3A300ECECEB00E7E7
      E600E6E6E500E5E5E400FFFFFF00B0B0B000B1B1B100FFFFFF0044424100A2A3
      A300A2A3A300A2A3A300A2A3A300A2A3A300A2A3A300A2A3A300ECECEB00E7E7
      E600E6E6E500E5E5E400FFFFFF00B0B0B0000000000000000000C5914700F5D0
      9B00ECB96E00ECB97000ECB97000ECB97000ECB97000ECB97000ECB97000ECB9
      6E00F5D09B00C691470000000000000000000274A90078FBFE0068F6FF0055F6
      FE005FFEFF0078FBFE0089FBFE0048CFF200058BC70005669500000000000000
      000000000000000000000000000000000000B1B1B100FFFFFF00E8E7E600EBEA
      E900EAE9E800EAE9E800E9E9E700EAE9E800EBEAE900E9E8E600E4E3E200E1E0
      DF00E1DFDE00E0DFDE00FFFFFF00B0B0B000B1B1B100FFFFFF00E8E7E600EBEA
      E900EAE9E800EAE9E800E9E9E700EAE9E800EBEAE900E9E8E600E4E3E200E1E0
      DF00E1DFDE00E0DFDE00FFFFFF00B0B0B0000000000000000000C5904800E6C5
      9200D5A05100D6A15300D6A15400D6A15400D6A15400D6A15400D6A15300D5A0
      5100E6C59200C590480000000000000000000274A900FEFEFE00F0FFFF00C6FF
      FF00A0FFFF009FFBFE009FFBFE0092FFFF0055F6FE0005669500000000000000
      000000000000000000000000000000000000B2B2B200FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00B2B2B200B2B2B200FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00B2B2B2000000000000000000C5914900DDBD
      8F00DCBC8D00DCBC8E00DCBC8E00DCBC8E00DCBC8E00DCBC8E00DCBC8E00DCBC
      8D00DDBD8F00C59149000000000000000000000000000479AF00F0FFFF00DAF8
      FF00B7FFFF009FFBFE0089FBFE0083FAFB00086B9A0000000000000000000000
      000000000000000000000000000000000000BABABA00B2B2B200B0B0B000B0B0
      B000B0B0B000B0B0B000B0B0B000B0B0B000B0B0B000B0B0B000B0B0B000B0B0
      B000B0B0B000B0B0B000B2B2B200BABABA00BABABA00B2B2B200B0B0B000B0B0
      B000B0B0B000B0B0B000B0B0B000B0B0B000B0B0B000B0B0B000B0B0B000B0B0
      B000B0B0B000B0B0B000B2B2B200BABABA000000000000000000CB9A5600C591
      4900C5914800C5914800C5914800C5914800C5914800C5914800C5914800C591
      4800C5914900CB9A5600000000000000000000000000000000000274A9000274
      A9000274A9000274A9000274A9000274A9000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000BA8F6000B8895600B88A
      5700B8895500B5855000B4834C00B4834C00B4834C00B4834C00B4834C00B483
      4C00B4834C00B4834C00B5855000BA805D0000000000BA8F6000B8895600B88A
      5700B8895500B5855000B4834C00B4834C00B4834C00B4834C00B4834C00B483
      4C00B4834C00B4834C00B5855000BA805D0000000000BA8F6000B8895600B88A
      5700B8895500B5855000B4834C00B4834C00B4834C00B4834C00B4834C00B483
      4C00B4834C00B4834C00B5855000BA805D0000000000C19C7000BA864500B984
      4400B7814100B6803F00B57F3F00B57F3F00B57F3F00B57F3F00B57F3F00B57F
      3F00B6803F00B7824100BC9059000000000000000000BA885100FFDFAA00BC8D
      5800B5844F00EAB46400E4A85300E4A85400E4A85400E4A85400E4A85400E4A8
      5400E4A85400E4A85300EAB46400B585500000000000BA885100FFDFAA00BC8D
      5800B5844F00EAB46400E4A85300E4A85400E4A85400E4A85400E4A85400E4A8
      5400E4A85400E4A85300EAB46400B585500000000000BA885100FFDFAA00BC8D
      5800B5844F00EAB46400E4A85300E4A85400E4A85400E4A85400E4A85400E4A8
      5400E4A85400E4A85300EAB46400B585500000000000BA864500C89D6200B680
      3F00FBDDA600F6D69E00F6D69D00F6D69D00F6D69D00F6D69D00F6D69D00F6D6
      9D00F6D69E00FBDDA700B782410000000000888E9700C3CAD40057616E00C697
      5E00B4824B00EAB76C00E3A85200E3A85400FDF9F400FFFFFF00E3A85400E3A8
      5400E3A85400E3A85200EBB86C00B4834C00888E9700C3CAD40057616E00C697
      5E00B4824B00EAB76C00E3A85200E3A85400F8E8D100FFFFFF00FFFFFF00FDF9
      F400E9B97600E3A85200EBB86C00B4834C00888E9700C3CAD40057616E00C697
      5E00B4824B00EAB76C00E3A85200E3A85400F8E8D100FFFFFF00FFFFFF00F6E2
      C600E3A85400E3A85200EBB86C00B4834C0000000000BA854500C89C6100B57E
      3D00F8DAA400F2D09500F1CF9400F2D09400F1CF9400F0CE9400F0CE9400F0CE
      9400F1CF9500F7DAA400B6803F000000000000000000BC895100AA7A3F00CB9F
      6500B2814B00EDBC7400E3A75200E3A85300F8E8D100FFFFFF00E9B97600E3A8
      5400E3A85300E3A75200EDBC7500B4834C0000000000BC895100AA7A3F00CB9F
      6500B2814B00EDBC7400E3A75200F6E2C600FFFFFF00F8E8D100F0D1A400FFFF
      FF00FDF9F400E3A75200EDBC7500B4834C0000000000BC895100AA7A3F00CB9F
      6500B2814B00EDBC7400E3A75200F0D1A300FFFFFF00FFFFFF00F9EEDD00FFFF
      FF00F4DCBA00E3A75200EDBC7500B4834C0000000000BA854500C89C6000B57E
      3C00FADDA600F0CD9100F0CD9100F0CD9100F0CD9100F0CD9100EFCC9100EFCC
      9100F0CD9100F7DBA700B57F3E000000000000000000BA885000FFDFA400D0A5
      6800B2804A00EEC07D00E3A85200E3A85400F2D7B000FFFFFF00F2D7B000E3A9
      5500E3A85400E3A85200EEC17E00B4834C0000000000BA885000FFDFA400D0A5
      6800B2804A00EEC07D00E3A85200FDF9F400FFFFFF00E3A95500E3A95500FDF9
      F400FFFFFF00E3A85200EEC17E00B4834C0000000000BA885000FFDFA400D0A5
      6800B2804A00EEC07D00E3A85200E9B97600F6E2C600E9BA7700E3A95500FFFF
      FF00FFFFFF00E3A85200EEC17E00B4834C0000000000BA854500C89C6000B67F
      3C00FFE3A800F1CA8B00F1CA8B00F1CA8B00F1CA8B00F1CA8B00EFC98C00EFC9
      8C00F0CA8D00F8DCAB00B57F3E0000000000888E9700C3CAD400555F6D00D9AE
      6F00B2804A00EFC78A00E4AA5600E4AB5700E8B66D00FFFFFF00FAEEDD00E4AB
      5700E4AB5700E4AA5600F0C88B00B4834C00888E9700C3CAD400555F6D00D9AE
      6F00B2804A00EFC78A00E4AA5600F6E3C700FFFFFF00F1D2A500E8B66D00FFFF
      FF00FDF9F400E4AA5600F0C88B00B4834C00888E9700C3CAD400555F6D00D9AE
      6F00B2804A00EFC78A00E4AA5600E4AB5700F1D2A500FDF9F400FAEEDD00FDF9
      F400FFFFFF00E4AA5600F0C88B00B4834C0000000000BA854500C89C6000B77F
      3B00FFE9A900EFC68100EFC68100EFC68100EFC68100EFC68100ECC48200EDC6
      8400EEC88800F8DDAF00B57F3E000000000000000000BC885100A67B3A00DEB5
      7600B17F4900F1CD9700E3AC5700E3AC5700E3AC5700F9EEDD00FFFFFF00E7B7
      6D00E3AC5700E3AC5700F2CD9700B4834C0000000000BC885100A67B3A00DEB5
      7600B17F4900F1CD9700E3AC5700E3AC5700F9EEDD00FFFFFF00FFFFFF00FFFF
      FF00E7B76D00E3AC5700F2CD9700B4834C0000000000BC885100A67B3A00DEB5
      7600B17F4900F1CD9700E3AC5700F0D3A500FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00E3AC5700F2CD9700B4834C0000000000BA854500C89C6000B880
      3A00FFEDAC00EEC48300FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00EEC48300F8DEB200B57F3E000000000000000000BA875000FFE09F00E3BB
      7A00B17E4900F3D3A100E3AD5900E3AD5900E3AD5900E7B86F00FFFFFF00F6E4
      C800E3AD5900E3AD5900F4D4A300B4834C0000000000BA875000FFE09F00E3BB
      7A00B17E4900F3D3A100E3AD5900F0D3A600FFFFFF00F9EFDE00F4DEBD00FFFF
      FF00F6E4C800E3AD5900F4D4A300B4834C0000000000BA875000FFE09F00E3BB
      7A00B17E4900F3D3A100E3AD5900FDFAF400FFFFFF00E7B86F00E3AD5900FFFF
      FF00FFFFFF00E3AD5900F4D4A300B4834C0000000000BA854500C89C6000B77F
      3A00FFEEAF00EDBE7300EDBE7300EDBE7300EDBE7300EDBE7300EABC7400EBBE
      7800EDC38000F9DFB600B57F3D0000000000888E9700C3CAD400545E6D00EBC4
      7F00B17E4900F4D9AD00E3B15E00E3B15E00E3B15E00E3B15E00F2DBB400FFFF
      FF00ECCB9400E3B15E00F5DAAE00B4834C00888E9700C3CAD400545E6D00EBC4
      7F00B17E4900F4D9AD00E3B15E00F6E5C900FFFFFF00F0D5A900E3B15E00FFFF
      FF00FDFAF400E3B15E00F5DAAE00B4834C00888E9700C3CAD400545E6D00EBC4
      7F00B17E4900F4D9AD00E3B15E00FDFAF400FFFFFF00E7BB7300E3B15E00FFFF
      FF00FDFAF400E3B15E00F5DAAE00B4834C0000000000BA854500C89C6000B77F
      3A00FFEFB400EDC27D00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00EDC27D00F9E1BB00B57F3D000000000000000000BC895100A47C3600ECC5
      8100B07E4900F5DEB600E4B26100FDFAF400FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00E4B26100F6DFB800B4824C0000000000BC895100A47C3600ECC5
      8100B07E4900F5DEB600E4B26100F1D6AB00FFFFFF00FFFFFF00FBF5EA00FFFF
      FF00F6E5CA00E4B26100F6DFB800B4824C0000000000BC895100A47C3600ECC5
      8100B07E4900F5DEB600E4B26100F1D6AB00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00F1D6AB00E4B26100F6DFB800B4824C0000000000BA854500C89B6000B77F
      3A00FFF1B800EFC07900EFC07900EFC07900EFC07900EFC07900EBBE7A00ECBF
      7C00EDC07E00FBE4BF00B57F3D000000000000000000BA875000F9D18B00EBC4
      7F00B07D4800F8E3C000E5B56500F8EBD600FDFAF500FDFAF500FDFAF500FDFA
      F500FDFAF500E5B56500F8E5C200B4824C0000000000BA875000F9D18B00EBC4
      7F00B07D4800F8E3C000E5B56500E5B56500F1D8AD00FCF5EA00FDFAF500F5E1
      C100E5B56500E5B56500F8E5C200B4824C0000000000BA875000F9D18B00EBC4
      7F00B07D4800F8E3C000E5B56500E5B56500F1D8AD00FDFAF500FDFAF500F1D8
      AD00E5B56500E5B56500F8E5C200B4824C0000000000BA854500C89B6000B77F
      3900FFF4BD00EFC37D00EFC37D00EFC37D00EFC37D00EFC47F00ECC18000ECC1
      8000ECC07E00FBE6C500B57F3C0000000000888D9700C1C8D200525A6700EBC3
      7B00B07D4600F9EACB00E6BB6F00E4B96B00E4B86800E4B76800E4B86800E4B8
      6800E4B96B00E6BB6F00FAECCD00B4834C00888D9700C1C8D200525A6700EBC3
      7B00B07D4600F9EACB00E6BB6F00E4B96B00E4B86800E4B76800E4B86800E4B8
      6800E4B96B00E6BB6F00FAECCD00B4834C00888D9700C1C8D200525A6700EBC3
      7B00B07D4600F9EACB00E6BB6F00E4B96B00E4B86800E4B76800E4B86800E4B8
      6800E4B96B00E6BB6F00FAECCD00B4834C0000000000BA854500C79B5F00B77F
      3900FFF5C100EFC37D00EFC37D00EFC37D00EFC37D00EFC37D00ECC17E00ECC0
      7D00ECBF7A00FCE8C900B57F3C000000000000000000BA864E00FFF2D400FEF1
      D400B27F4900FEF1D700FCEED300FBEDD200FBEDD200FBEDD200FBEDD200FBED
      D200FBEDD200FCEED300FFF2D800B5844F0000000000BA864E00FFF2D400FEF1
      D400B27F4900FEF1D700FCEED300FBEDD200FBEDD200FBEDD200FBEDD200FBED
      D200FBEDD200FCEED300FFF2D800B5844F0000000000BA864E00FFF2D400FEF1
      D400B27F4900FEF1D700FCEED300FBEDD200FBEDD200FBEDD200FBEDD200FBED
      D200FBEDD200FCEED300FFF2D800B5844F0000000000B9844400C6995D00B77E
      3700FFF7C700EFBF7700EFBF7700EFBF7700EFBF7700EFBF7700ECBD7800ECBD
      7700ECBC7500FDEBCF00B57F3C000000000000000000C49C7100B7875200B686
      5200B7875200B5844E00B4824C00B4824B00B4824B00B4824B00B4824B00B482
      4B00B4824B00B4824C00B5844F00BC80600000000000C49C7100B7875200B686
      5200B7875200B5844E00B4824C00B4824B00B4824B00B4824B00B4824B00B482
      4B00B4824B00B4824C00B5844F00BC80600000000000C49C7100B7875200B686
      5200B7875200B5844E00B4824C00B4824B00B4824B00B4824B00B4824B00B482
      4B00B4824B00B4824C00B5844F00BC80600000000000B9844200EEDFCB00B87F
      3900FFFBCE00FEEDD000FEEDD000FEEDD000FEEDD000FEEDD000FCECD000FCEC
      D000FCECD000FFF0D500B6813E00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000BE8D5100B9844200BA84
      4100B77F3B00B77F3B00B77F3B00B77F3B00B77F3B00B77F3B00B57E3C00B57E
      3C00B57F3C00B6813E00BD8C5000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000BA8F6000B8895600B88A
      5700B8895500B5855000B4834C00B4834C00B4834C00B4834C00B4834C00B483
      4C00B4834C00B4834C00B5855000BA805D0000000000BA8F6000B8895600B88A
      5700B8895500B5855000B4834C00B4834C00B4834C00B4834C00B4834C00B483
      4C00B4834C00B4834C00B5855000BA805D0000000000BA8F6000B8895600B88A
      5700B8895500B5855000B4834C00B4834C00B4834C00B4834C00B4834C00B483
      4C00B4834C00B4834C00B5855000BA805D0000000000BA8F6000B8895600B88A
      5700B8895500B5855000B4834C00B4834C00B4834C00B4834C00B4834C00B483
      4C00B4834C00B4834C00B5855000BA805D0000000000BA885100FFDFAA00BC8D
      5800B5844F00EAB46400E4A85300E4A85400E4A85400E4A85400E4A85400E4A8
      5400E4A85400E4A85300EAB46400B585500000000000BA885100FFDFAA00BC8D
      5800B5844F00EAB46400E4A85300E4A85400E4A85400E4A85400E4A85400E4A8
      5400E4A85400E4A85300EAB46400B585500000000000BA885100FFDFAA00BC8D
      5800B5844F00EAB46400E4A85300E4A85400E4A85400E4A85400E4A85400E4A8
      5400E4A85400E4A85300EAB46400B585500000000000BA885100FFDFAA00BC8D
      5800B5844F00EAB46400E4A85300E4A85400E4A85400E4A85400E4A85400E4A8
      5400E4A85400E4A85300EAB46400B5855000888E9700C3CAD40057616E00C697
      5E00B4824B00EAB76C00E3A85200E3A85400F8E8D100FFFFFF00FFFFFF00F9EE
      DD00E7B46B00E3A85200EBB86C00B4834C00888E9700C3CAD40057616E00C697
      5E00B4824B00EAB76C00E3A85200E3A85400E3A85400E3A85400F6E2C600FFFF
      FF00F0D1A400E3A85200EBB86C00B4834C00888E9700C3CAD40057616E00C697
      5E00B4824B00EAB76C00E3A85200E3A85400F8E8D100FFFFFF00FFFFFF00F9EE
      DD00E7B46B00E3A85200EBB86C00B4834C00888E9700C3CAD40057616E00C697
      5E00B4824B00EAB76C00E3A85200E3A85400F2D6AF00FFFFFF00FFFFFF00FDF9
      F400E7B46B00E3A85200EBB86C00B4834C0000000000BC895100AA7A3F00CB9F
      6500B2814B00EDBC7400E3A75200F4DCBA00FFFFFF00FDF9F400F9EEDD00FFFF
      FF00F9EEDD00E3A75200EDBC7500B4834C0000000000BC895100AA7A3F00CB9F
      6500B2814B00EDBC7400E3A75200F0D1A300F0D1A400F0D1A400F9EEDD00FFFF
      FF00F4DCBA00E7B36900EDBC7500B4834C0000000000BC895100AA7A3F00CB9F
      6500B2814B00EDBC7400E3A75200F4DCBA00FFFFFF00FDF9F400F8E8D100FFFF
      FF00F9EEDD00E3A75200EDBC7500B4834C0000000000BC895100AA7A3F00CB9F
      6500B2814B00EDBC7400E3A75200F0D1A300FFFFFF00FDF9F400F8E8D100FFFF
      FF00FDF9F400E3A75200EDBC7500B4834C0000000000BA885000FFDFA400D0A5
      6800B2804A00EEC07D00E3A85200F4DCBB00FDF9F400E7B46C00E3A95500FFFF
      FF00FFFFFF00E3A85200EEC17E00B4834C0000000000BA885000FFDFA400D0A5
      6800B2804A00EEC07D00E3A85200FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00F0D1A300EEC17E00B4834C0000000000BA885000FFDFA400D0A5
      6800B2804A00EEC07D00E3A85200F4DCBB00FDF9F400E7B46C00E3A95500FFFF
      FF00FFFFFF00E3A85200EEC17E00B4834C0000000000BA885000FFDFA400D0A5
      6800B2804A00EEC07D00E3A85200F8E8D100FFFFFF00E7B46C00E3A95500FDF9
      F400FFFFFF00E3A85200EEC17E00B4834C00888E9700C3CAD400555F6D00D9AE
      6F00B2804A00EFC78A00E4AA5600E4AB5700E4AB5700E4AB5700E4AB5700FFFF
      FF00FFFFFF00E4AA5600F0C88B00B4834C00888E9700C3CAD400555F6D00D9AE
      6F00B2804A00EFC78A00E4AA5600FFFFFF00FFFFFF00F1D2A500FAEEDD00FFFF
      FF00F4DDBC00E8B56D00F0C88B00B4834C00888E9700C3CAD400555F6D00D9AE
      6F00B2804A00EFC78A00E4AA5600E9BC7900F4DDBC00E8B66D00E4AB5700FFFF
      FF00FFFFFF00E4AA5600F0C88B00B4834C00888E9700C3CAD400555F6D00D9AE
      6F00B2804A00EFC78A00E4AA5600FDF9F400FFFFFF00EDC78F00E8B66D00FFFF
      FF00FFFFFF00E4AA5600F0C88B00B4834C0000000000BC885100A67B3A00DEB5
      7600B17F4900F1CD9700E3AC5700E3AC5700E3AC5700F2D8B100FFFFFF00FFFF
      FF00ECC88F00E3AC5700F2CD9700B4834C0000000000BC885100A67B3A00DEB5
      7600B17F4900F1CD9700E3AC5700ECC88F00FFFFFF00F0D3A500F6E3C700FFFF
      FF00F0D3A500E3AC5700F2CD9700B4834C0000000000BC885100A67B3A00DEB5
      7600B17F4900F1CD9700E3AC5700F0D3A500FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00F9EEDD00E3AC5700F2CD9700B4834C0000000000BC885100A67B3A00DEB5
      7600B17F4900F1CD9700E3AC5700FDF9F400FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00F2D8B100E3AC5700F2CD9700B4834C0000000000BA875000FFE09F00E3BB
      7A00B17E4900F3D3A100E3AD5900E3AD5900E3AD5900ECC89000FFFFFF00FFFF
      FF00E9BD7A00E3AD5900F4D4A300B4834C0000000000BA875000FFE09F00E3BB
      7A00B17E4900F3D3A100E3AD5900E3AD5900F6E4C800FFFFFF00F8E9D300FFFF
      FF00F0D3A600E3AD5900F4D4A300B4834C0000000000BA875000FFE09F00E3BB
      7A00B17E4900F3D3A100E3AD5900E9BD7A00FFFFFF00FFFFFF00FDFAF400F6E4
      C800E7B86F00E3AD5900F4D4A300B4834C0000000000BA875000FFE09F00E3BB
      7A00B17E4900F3D3A100E3AD5900FDFAF400FFFFFF00F0D3A600F6E4C800F0D3
      A600E3AD5900E3AD5900F4D4A300B4834C00888E9700C3CAD400545E6D00EBC4
      7F00B17E4900F4D9AD00E3B15E00F0D5A900FBF5EA00F0D5A900F0D5A900FFFF
      FF00F6E5C900E3B15E00F5DAAE00B4834C00888E9700C3CAD400545E6D00EBC4
      7F00B17E4900F4D9AD00E3B15E00E3B15E00E3B15E00FFFFFF00FFFFFF00FFFF
      FF00F0D5A900E3B15E00F5DAAE00B4834C00888E9700C3CAD400545E6D00EBC4
      7F00B17E4900F4D9AD00E3B15E00E3B15E00FFFFFF00FFFFFF00E3B15E00E3B1
      5E00E3B15E00E3B15E00F5DAAE00B4834C00888E9700C3CAD400545E6D00EBC4
      7F00B17E4900F4D9AD00E3B15E00F4E0BF00FFFFFF00ECCB9400E7BB7300FDFA
      F400F4E0BF00E3B15E00F5DAAE00B4834C0000000000BC895100A47C3600ECC5
      8100B07E4900F5DEB600E4B26100E9C18100FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00F1D6AB00E4B26100F6DFB800B4824C0000000000BC895100A47C3600ECC5
      8100B07E4900F5DEB600E4B26100E4B26100E4B26100E9C18100FFFFFF00FFFF
      FF00F1D6AB00E4B26100F6DFB800B4824C0000000000BC895100A47C3600ECC5
      8100B07E4900F5DEB600E4B26100E4B26100FDFAF400FFFFFF00FFFFFF00FFFF
      FF00F6E5CA00E4B26100F6DFB800B4824C0000000000BC895100A47C3600ECC5
      8100B07E4900F5DEB600E4B26100E8BC7600FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00F2DBB500E4B26100F6DFB800B4824C0000000000BA875000F9D18B00EBC4
      7F00B07D4800F8E3C000E5B56500E5B56500F1D8AD00FCF5EA00FDFAF500F1D8
      AD00E5B56500E5B56500F8E5C200B4824C0000000000BA875000F9D18B00EBC4
      7F00B07D4800F8E3C000E5B56500E5B56500E5B56500E5B56500F3DCB700FDFA
      F500EECE9800E5B56500F8E5C200B4824C0000000000BA875000F9D18B00EBC4
      7F00B07D4800F8E3C000E5B56500E5B56500F3DCB700FDFAF500FDFAF500FDFA
      F500F3DCB700E5B56500F8E5C200B4824C0000000000BA875000F9D18B00EBC4
      7F00B07D4800F8E3C000E5B56500E5B56500EAC48400FAF0E000FDFAF500F6E6
      CC00E5B56500E5B56500F8E5C200B4824C00888D9700C1C8D200525A6700EBC3
      7B00B07D4600F9EACB00E6BB6F00E4B96B00E4B86800E4B76800E4B86800E4B8
      6800E4B96B00E6BB6F00FAECCD00B4834C00888D9700C1C8D200525A6700EBC3
      7B00B07D4600F9EACB00E6BB6F00E4B96B00E4B86800E4B76800E4B86800E4B8
      6800E4B96B00E6BB6F00FAECCD00B4834C00888D9700C1C8D200525A6700EBC3
      7B00B07D4600F9EACB00E6BB6F00E4B96B00E4B86800E4B76800E4B86800E4B8
      6800E4B96B00E6BB6F00FAECCD00B4834C00888D9700C1C8D200525A6700EBC3
      7B00B07D4600F9EACB00E6BB6F00E4B96B00E4B86800E4B76800E4B86800E4B8
      6800E4B96B00E6BB6F00FAECCD00B4834C0000000000BA864E00FFF2D400FEF1
      D400B27F4900FEF1D700FCEED300FBEDD200FBEDD200FBEDD200FBEDD200FBED
      D200FBEDD200FCEED300FFF2D800B5844F0000000000BA864E00FFF2D400FEF1
      D400B27F4900FEF1D700FCEED300FBEDD200FBEDD200FBEDD200FBEDD200FBED
      D200FBEDD200FCEED300FFF2D800B5844F0000000000BA864E00FFF2D400FEF1
      D400B27F4900FEF1D700FCEED300FBEDD200FBEDD200FBEDD200FBEDD200FBED
      D200FBEDD200FCEED300FFF2D800B5844F0000000000BA864E00FFF2D400FEF1
      D400B27F4900FEF1D700FCEED300FBEDD200FBEDD200FBEDD200FBEDD200FBED
      D200FBEDD200FCEED300FFF2D800B5844F0000000000C49C7100B7875200B686
      5200B7875200B5844E00B4824C00B4824B00B4824B00B4824B00B4824B00B482
      4B00B4824B00B4824C00B5844F00BC80600000000000C49C7100B7875200B686
      5200B7875200B5844E00B4824C00B4824B00B4824B00B4824B00B4824B00B482
      4B00B4824B00B4824C00B5844F00BC80600000000000C49C7100B7875200B686
      5200B7875200B5844E00B4824C00B4824B00B4824B00B4824B00B4824B00B482
      4B00B4824B00B4824C00B5844F00BC80600000000000C49C7100B7875200B686
      5200B7875200B5844E00B4824C00B4824B00B4824B00B4824B00B4824B00B482
      4B00B4824B00B4824C00B5844F00BC8060000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000B783
      4400B7834400000000000000000000000000000000005E92620049854C004A85
      4C00548C580000000000000000000000000000000000BA8F6000B8895600B88A
      5700B8895500B5855000B4834C00B4834C00B4834C00B4834C00B4834C00B483
      4C00B4834C00B4834C00B5855000BA805D0000000000BA8F6000B8895600B88A
      5700B8895500B5855000B4834C00B4834C00B4834C00B4834C00B4834C00B483
      4C00B4834C00B4834C00B5855000BA805D0000000000BA8F6000B8895600B88A
      5700B8895500B5855000B4834C00B4834C00B4834C00B4834C00B4834C00B483
      4C00B4834C00B4834C00B5855000BA805D000000000000000000B5814100F4C4
      7A00F4C47A00B581410000000000000000000000000047844B009EE9CA0053CC
      98004A854C0000000000000000000000000000000000BA885100FFDFAA00BC8D
      5800B5844F00EAB46400E4A85300E4A85400E4A85400E4A85400E4A85400E4A8
      5400E4A85400E4A85300EAB46400B585500000000000BA885100FFDFAA00BC8D
      5800B5844F00EAB46400E4A85300E4A85400E4A85400E4A85400E4A85400E4A8
      5400E4A85400E4A85300EAB46400B585500000000000BA885100FFDFAA00BC8D
      5800B5844F00EAB46400E4A85300E4A85400E4A85400E4A85400E4A85400E4A8
      5400E4A85400E4A85300EAB46400B585500000000000B5814100F2C17600EEBC
      7200EEBD7300F2C17600B8814100000000000000000045844A00BCEBDE00BDEB
      DF0048854B00000000000000000000000000888E9700C3CAD40057616E00C697
      5E00B4824B00EAB76C00E3A85200E3A85400F6E2C600FFFFFF00FFFFFF00F9EE
      DD00E7B46B00E3A85200EBB86C00B4834C00888E9700C3CAD40057616E00C697
      5E00B4824B00EAB76C00E3A85200E3A85400E3A85400E3A85400FFFFFF00FDF9
      F400E3A85400E3A85200EBB86C00B4834C00888E9700C3CAD40057616E00C697
      5E00B4824B00EAB76C00E3A85200FBF3E800FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00E3A85200EBB86C00B4834C00B8844400F7CE8F00F2C98900EDC2
      8200EBB96F00F2C98A00F9CE8F00C28443000000000083AF890047844A004784
      4A0077A57A0000000000000000000000000000000000BC895100AA7A3F00CB9F
      6500B2814B00EDBC7400E3A75200F0D1A300FFFFFF00FFFFFF00FBF3E800FFFF
      FF00F6E2C600E3A75200EDBC7500B4834C0000000000BC895100AA7A3F00CB9F
      6500B2814B00EDBC7400E3A75200E3A85300E3A85400E3A85400FFFFFF00FDF9
      F400E3A85300E3A75200EDBC7500B4834C0000000000BC895100AA7A3F00CB9F
      6500B2814B00EDBC7400E3A75200F0D1A300FFFFFF00FFFFFF00FDF9F400FDF9
      F400FDF9F400E3A75200EDBC7500B4834C00CAA16F00B7824200B37D3D00F0C8
      8E00E9B86C00B37E3F00B8824200CFA170000000000000000000000000000000
      00000000000000000000000000000000000000000000BA885000FFDFA400D0A5
      6800B2804A00EEC07D00E3A85200F8E8D100FFFFFF00E9BA7700E3A95500FFFF
      FF00FFFFFF00E3A85200EEC17E00B4834C0000000000BA885000FFDFA400D0A5
      6800B2804A00EEC07D00E3A85200E3A85400E3A95500E3A95500FFFFFF00FDF9
      F400E3A85400E3A85200EEC17E00B4834C0000000000BA885000FFDFA400D0A5
      6800B2804A00EEC07D00E3A85200E3A85400F8E8D200FFFFFF00F2D7B000E3A9
      5500E3A85400E3A85200EEC17E00B4834C000000000000000000B6804000F0CB
      9600E7B46900B6824200000000000000000000000000729E770048854B004A84
      4A004B854D00749E77000000000000000000888E9700C3CAD400555F6D00D9AE
      6F00B2804A00EFC78A00E4AA5600FDF9F400FFFFFF00E4AB5700E4AB5700FDF9
      F400FFFFFF00E4AA5600F0C88B00B4834C00888E9700C3CAD400555F6D00D9AE
      6F00B2804A00EFC78A00E4AA5600E4AB5700E4AB5700E4AB5700FFFFFF00FDF9
      F400E4AB5700E4AA5600F0C88B00B4834C00888E9700C3CAD400555F6D00D9AE
      6F00B2804A00EFC78A00E4AA5600E4AB5700E4AB5700FAEEDD00FFFFFF00F2D8
      B100E4AB5700E4AA5600F0C88B00B4834C000000000000000000B6814000EFCE
      9D00E4B16400B882430000000000000000000000000046854B009EE8C90051C9
      930055CC98004A854C00000000000000000000000000BC885100A67B3A00DEB5
      7600B17F4900F1CD9700E3AC5700FDF9F400FFFFFF00E3AC5700E3AC5700FDF9
      F400FFFFFF00E3AC5700F2CD9700B4834C0000000000BC885100A67B3A00DEB5
      7600B17F4900F1CD9700E3AC5700E3AC5700E3AC5700E3AC5700FFFFFF00FDF9
      F400E3AC5700E3AC5700F2CD9700B4834C0000000000BC885100A67B3A00DEB5
      7600B17F4900F1CD9700E3AC5700E3AC5700E3AC5700E3AC5700F9EEDD00FFFF
      FF00F0D3A500E3AC5700F2CD9700B4834C000000000000000000B6813F00F0D1
      A400E0AC5E00B883430000000000000000000000000047844A00BBEADD00B9E7
      D900BDEBDE0048854B00000000000000000000000000BA875000FFE09F00E3BB
      7A00B17E4900F3D3A100E3AD5900FDFAF400FFFFFF00E3AD5900E3AD5900FDFA
      F400FFFFFF00E3AD5900F4D4A300B4834C0000000000BA875000FFE09F00E3BB
      7A00B17E4900F3D3A100E3AD5900F0D3A600FBF4E900ECC89000FFFFFF00FDFA
      F400E3AD5900E3AD5900F4D4A300B4834C0000000000BA875000FFE09F00E3BB
      7A00B17E4900F3D3A100E3AD5900E3AD5900E3AD5900E3AD5900E3AD5900FFFF
      FF00FFFFFF00E3AD5900F4D4A300B4834C000000000000000000B6813F00EFD4
      AD00DDA85A00B983440000000000000000000000000083AE870047844A004582
      480047844A0059915D000000000000000000888E9700C3CAD400545E6D00EBC4
      7F00B17E4900F4D9AD00E3B15E00F6E5C900FFFFFF00F0D5A900E7BB7300FFFF
      FF00FDFAF400E3B15E00F5DAAE00B4834C00888E9700C3CAD400545E6D00EBC4
      7F00B17E4900F4D9AD00E3B15E00E9C17E00FFFFFF00FFFFFF00FFFFFF00FDFA
      F400E3B15E00E3B15E00F5DAAE00B4834C00888E9700C3CAD400545E6D00EBC4
      7F00B17E4900F4D9AD00E3B15E00F2DBB400FFFFFF00F0D5A900E3B15E00FFFF
      FF00FFFFFF00E3B15E00F5DAAE00B4834C000000000000000000B6813F00F0D8
      B500D9A35400B983440000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000BC895100A47C3600ECC5
      8100B07E4900F5DEB600E4B26100E9C18100FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00F2DBB500E4B26100F6DFB800B4824C0000000000BC895100A47C3600ECC5
      8100B07E4900F5DEB600E4B26100E4B26100E4B26100FAF0DF00FFFFFF00FDFA
      F400E4B26100E4B26100F6DFB800B4824C0000000000BC895100A47C3600ECC5
      8100B07E4900F5DEB600E4B26100E9C18100FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FDFAF400E4B26100F6DFB800B4824C000000000000000000B6803E00F1DC
      BC00D59F4F00B9844400000000000000000000000000749E770049854B004A84
      4A004A844A004B844B004B854D00749D760000000000BA875000F9D18B00EBC4
      7F00B07D4800F8E3C000E5B56500E5B56500F1D8AD00FCF5EA00FDFAF500F3DC
      B700E5B56500E5B56500F8E5C200B4824C0000000000BA875000F9D18B00EBC4
      7F00B07D4800F8E3C000E5B56500E5B56500E5B56500E5B56500FAF0E000F8EB
      D600E5B56500E5B56500F8E5C200B4824C0000000000BA875000F9D18B00EBC4
      7F00B07D4800F8E3C000E5B56500E5B56500EECE9800FCF5EA00FDFAF500F8EB
      D600E8BF7A00E5B56500F8E5C200B4824C000000000000000000B7813E00F0DB
      BB00D0994800BA83430000000000000000000000000048844B009EE8C90050C8
      920052C8930053C8940055CC99004A854C00888D9700C1C8D200525A6700EBC3
      7B00B07D4600F9EACB00E6BB6F00E4B96B00E4B86800E4B76800E4B86800E4B8
      6800E4B96B00E6BB6F00FAECCD00B4834C00888D9700C1C8D200525A6700EBC3
      7B00B07D4600F9EACB00E6BB6F00E4B96B00E4B86800E4B76800E4B86800E4B8
      6800E4B96B00E6BB6F00FAECCD00B4834C00888D9700C1C8D200525A6700EBC3
      7B00B07D4600F9EACB00E6BB6F00E4B96B00E4B86800E4B76800E4B86800E4B8
      6800E4B96B00E6BB6F00FAECCD00B4834C000000000000000000B8824000EFDB
      BB00EAD0A900BA83420000000000000000000000000047844A00BBEADD00B8E6
      D800B9E6D800BAE7D900BDEBDE0048854B0000000000BA864E00FFF2D400FEF1
      D400B27F4900FEF1D700FCEED300FBEDD200FBEDD200FBEDD200FBEDD200FBED
      D200FBEDD200FCEED300FFF2D800B5844F0000000000BA864E00FFF2D400FEF1
      D400B27F4900FEF1D700FCEED300FBEDD200FBEDD200FBEDD200FBEDD200FBED
      D200FBEDD200FCEED300FFF2D800B5844F0000000000BA864E00FFF2D400FEF1
      D400B27F4900FEF1D700FCEED300FBEDD200FBEDD200FBEDD200FBEDD200FBED
      D200FBEDD200FCEED300FFF2D800B5844F000000000000000000CFAB7E00B882
      4100B8834100D1AB7F0000000000000000000000000082AD860047844A004582
      4700458247004582470047844A00568F5A0000000000C49C7100B7875200B686
      5200B7875200B5844E00B4824C00B4824B00B4824B00B4824B00B4824B00B482
      4B00B4824B00B4824C00B5844F00BC80600000000000C49C7100B7875200B686
      5200B7875200B5844E00B4824C00B4824B00B4824B00B4824B00B4824B00B482
      4B00B4824B00B4824C00B5844F00BC80600000000000C49C7100B7875200B686
      5200B7875200B5844E00B4824C00B4824B00B4824B00B4824B00B4824B00B482
      4B00B4824B00B4824C00B5844F00BC8060000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B1B1B100A2A2A200A0A0A000A1A1
      A100A1A1A100A1A1A100A1A1A100A1A1A100A1A1A100A0A0A0009F9F9F009F9F
      9F009F9F9F009F9F9F00A2A2A200B1B1B100B1B1B100A2A2A200A0A0A000A1A1
      A100A1A1A100A1A1A100A1A1A100A1A1A100A1A1A100A0A0A0009F9F9F009F9F
      9F009F9F9F009F9F9F00A2A2A200B1B1B100BCBCBC00B2B2B200B0B0B000B1B0
      B000B1B0B100B1B0B000B0B0B000B0B0B100B0B1B200B0B1B200B0B1B200B0B1
      B200B0B1B200B0B1B200B2B2B200BCBCBC000000000000000000BB8A4E00B783
      4300B7834400BD894E000000000000000000000000005E92620049854B004A84
      4A004A844A004B844B004B854D00548C5800A2A2A200FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00A2A2A200A2A2A200FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00A2A2A200B2B2B200FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00B2B2B2000000000000000000B7824300FBCE
      8800F9CA8000B983430000000000000000000000000048844B009EE8C90050C8
      920052C8930053C8940055CC99004A854C009F9F9F00FFFFFF00FFFFFF004442
      40005D5A58006F6D6A0073706E00605E5B0048464500FFFFFF00FFFFFF00FEFE
      FF00FEFEFE00FEFEFE00FFFFFF009F9F9F009F9F9F00FFFFFF00FFFFFF004442
      40005D5A58006F6D6A0073706E00605E5B0048464500FFFFFF00FFFFFF00FEFE
      FF00FEFEFE00FEFEFE00FFFFFF009F9F9F00B1B0B000FFFFFF00FFFFFF00FFFF
      FF0000792B0082C7A400FFFFFF00FFFFFF00D2944E00C97D2800D8A36700D8A3
      6700C97B2600D1914900FFFFFF00B0B1B1000000000000000000B6814100F4CB
      8A00F1C07500B882420000000000000000000000000047844A00BBEADD00B8E6
      D800B9E6D800BAE7D900BDEBDE0048854B009F9F9F00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF009F9F9F009F9F9F00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF009F9F9F00B2B1B100FFFFFF0049AE8100007D
      33000081380000782B004BA97900FFFFFF00C97C2700CB833200D69D6000CC84
      3500CA812F00F5EDE500FFFFFF00B0B0B1000000000000000000B6814100F1CA
      9000EBB86D00B882420000000000000000000000000083AE870047844A004582
      4700458247004582470047844A0074A377009F9F9F00FFFFFF00FEFEFE00FFFF
      FF00FFFFFF00FFFFFF00D4872F00FFFFFF00767471006A6766005F5D5C005552
      500043414000FEFEFE00FFFFFF009F9F9F009F9F9F00FFFFFF00FEFEFE00D487
      2F00FFFFFF00FFFFFF00FFFFFF00FFFFFF00767471006A6766005F5D5C005552
      500043414000FEFEFE00FFFFFF009F9F9F00B3B1B200FFFFFF00007A2D00FFFF
      FF00007A2E0082C7A400FEFBFE00FAFFFF00CF8C4200D49C5C00FFFFFF00CC84
      3500CB802E00FBFFFF00FFFFFF00B0B0B0000000000000000000B6814000EFCD
      9800E6B26600B882430000000000000000000000000000000000000000000000
      0000000000000000000000000000000000009F9F9F00FFFFFF00F8F8F800FCFC
      FB00FCFCFB00D1904700D4872F00FCFCFB00FCFCFB00FCFCFB00FCFCFB00FCFC
      FB00FCFCFB00FCFCFB00FFFFFF009F9F9F009F9F9F00FFFFFF00F8F8F800D487
      2F00D1904700FCFCFB00FCFCFB00FCFCFB00FCFCFB00FCFCFB00FCFCFB00FCFC
      FB00FCFCFB00FCFCFB00FFFFFF009F9F9F00B2B1B200FFFFFF0000772700FFFF
      FF00FFFCFF00FCF9FA00F7F7F800F7FCFF00F2ECE700D1914A00DEB68B00CD85
      3600CB802E00F8FFFF00FFFFFF00B0B0B0000000000000000000B6814000EECF
      A100E0AC5E00B9834400000000000000000000000000749E770049854B004A84
      4A004B854D00759E780000000000000000009F9F9F00FFFFFF00F3F3F300FCFB
      FA00D48D3A00D2862E00D4872F00FCFBFA00504E4C006B696800807E7B00706E
      6D0054524F00FCFBFA00FFFFFF009F9F9F009F9F9F00FFFFFF00F3F3F300D487
      2F00D2862E00D48D3A00FCFBFA00FCFBFA00504E4C006B696800807E7B00706E
      6D0054524F00FCFBFA00FFFFFF009F9F9F00B1B1B100FFFFFF00FFFBFF00FBFA
      FF00F7F8FC00F5F8FD00F5FAFF00F7FFFF00CD853700D1934E00E0BE9800CD85
      3600CB802D00F5FBFF00FFFFFF00B0B0B0000000000000000000B6813F00EFD3
      AA00DAA55700B983440000000000000000000000000047844B009EE8C90051C9
      930055CC98004A854C0000000000000000009F9F9F00FFFFFF00EFF2F400DF99
      4500DE933A00DE943B00D4872F00F8F8F700F8F8F700F8F8F700F8F8F700F8F8
      F700F8F8F700F8F8F700FFFFFF009F9F9F009F9F9F00FFFFFF00EFF2F400D487
      2F00DE943B00DE933A00DF994500F8F8F700F8F8F700F8F8F700F8F8F700F8F8
      F700F8F8F700F8F8F700FFFFFF009F9F9F00B0B1B100FFFFFF00D3955200CA79
      2100F4FFFF00D59C6000CB7D2800D59E6100CB802D00D1924E00F5FFFF00CC83
      3300CA7E2A00F2F8FE00FFFFFF00B0B0B0000000000000000000B6813F00F0D9
      B400D69F5000B884440000000000000000000000000045844A00BBEADD00B9E7
      D900BDEBDE0048854B0000000000000000009F9F9F00FFFFFF00EDF0F300F4F2
      F100D7954900D4872F00D4872F00F4F2F100504E4C006B696800807E7B00706E
      6D0054524F00F4F2F100FFFFFF009F9F9F009F9F9F00FFFFFF00EDF0F300D487
      2F00D4872F00D7954900F4F2F100F4F2F100504E4C006B696800807E7B00706E
      6D0054524F00F4F2F100FFFFFF009F9F9F00B0B0B100FFFFFF00EAE6E100CF85
      3000D0883600D08B3B00D0883600EDECEC00E2CBB200CD843500CA7D2800CB7E
      2900D8A97500EEF1F400FFFFFF00B0B0B0000000000000000000B7813F00EFDB
      BD00D09A4900B884450000000000000000000000000082AE880046844A004582
      480047844A0057905B0000000000000000009F9F9F00FFFFFF00EAECEE00F2F3
      F200F2F3F200D18F4700D4872F00F2F3F200F2F3F200F2F3F200F2F3F200F2F3
      F200F2F3F200F2F3F200FFFFFF009F9F9F009F9F9F00FFFFFF00EAECEE00D487
      2F00D18F4700F2F3F200F2F3F200F2F3F200F2F3F200F2F3F200F2F3F200F2F3
      F200F2F3F200F2F3F200FFFFFF009F9F9F00B0B0B000FFFFFF00EAEFF400DFB3
      7B00EAE6DE00DD9D4D00DFB07300ECF3F900ECF0F400EDF2F700EAEBEB00EAEB
      EA00ECF0F40000772700FFFFFF00B0B0B000BC8A4E00B9844300B7814000DAB7
      8700C68F4500B8834400BA844300C38A4E000000000000000000000000000000
      0000000000000000000000000000000000009F9F9F00FFFFFF00E8E8E800F0EF
      EE00F0EFEE00F0EFEE00D4872F00F0EFEE00514F4D006C6A6900817E7C00716F
      6E00F0EFEE00F0EFEE00FFFFFF009F9F9F009F9F9F00FFFFFF00E8E8E800D487
      2F00F0EFEE00F0EFEE00F0EFEE00F0EFEE00514F4D006C6A6900817E7C00716F
      6E00F0EFEE00F0EFEE00FFFFFF009F9F9F00B0B0B000FFFFFF00E8E9EB00E6D9
      C900DB9E4F00DA9A4700E5D4C000E9EBED00E8E8E800E8E8E80082C7A400007A
      2E00E8E8E800007A2D00FFFFFF00B0B0B000B9844400E8D1AC00C68F3E00C68F
      4000C6904100C68F3E00ECD5B200C384420000000000739E790049854C004A85
      4C00759E78000000000000000000000000009F9F9F00FFFFFF00E7E7E600E7E7
      E600E7E7E600E7E7E600E7E7E600E7E7E600E7E7E600E7E7E600E7E7E600E7E7
      E600E7E7E600EAEAE900FFFFFF009F9F9F009F9F9F00FFFFFF00E7E7E600E7E7
      E600E7E7E600E7E7E600E7E7E600E7E7E600E7E7E600E7E7E600E7E7E600E7E7
      E600E7E7E600EAEAE900FFFFFF009F9F9F00B0B0B000FFFFFF00E3E5E500E5EB
      F000D4995400D3934800E6ECF200E5E6E700E4E5E4004BA9790000782B000081
      3800007D330049AE8100FFFFFF00B0B0B00000000000B8824000E8D0AD00C28B
      3800C28B3800E8D0AD00B9824000000000000000000046854B009EE9CA0053CC
      98004A854C00000000000000000000000000A0A0A000FFFFFF00E6E5E4004240
      3F0053514F005D5B5A006966640073706E00767472006B696800615F5E005755
      520046434200E7E6E400FFFFFF00A0A0A000A0A0A000FFFFFF00E6E5E4004240
      3F0053514F005D5B5A006966640073706E00767472006B696800615F5E005755
      520046434200E7E6E400FFFFFF00A0A0A000B0B0B000FFFFFF00E0DFDF00E1E3
      E500D8BD9D00D5AE8300E2E4E600E1E0E000E1E0DF00E1E0DF0082C7A4000079
      2B00E1DFDE00E0DFDE00FFFFFF00B0B0B0000000000000000000B7814000E8D1
      B000E8D1B000B881400000000000000000000000000046844A00BCEBDE00BDEB
      DF0048854B00000000000000000000000000A2A2A200FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00A2A2A200A2A2A200FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00A2A2A200B2B2B200FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00B2B2B200000000000000000000000000B883
      4200B88342000000000000000000000000000000000082AD860047844A004784
      4A00568F5A00000000000000000000000000ABABAB00A2A2A200A0A0A000A1A1
      A100A1A1A100A1A1A100A1A1A100A1A1A100A1A1A100A1A1A100A1A1A100A1A1
      A100A1A1A100A0A0A000A2A2A200ABABAB00ABABAB00A2A2A200A0A0A000A1A1
      A100A1A1A100A1A1A100A1A1A100A1A1A100A1A1A100A1A1A100A1A1A100A1A1
      A100A1A1A100A0A0A000A2A2A200ABABAB00BABABA00B2B2B200B0B0B000B0B0
      B000B0B0B100B0B0B100B0B0B000B0B0B000B0B0B000B0B0B000B0B0B000B0B0
      B000B0B0B000B0B0B000B2B2B200BABABA000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000092635D00A4676900A4676900A4676900A4676900A467
      6900A4676900A4676900A4676900A46769000000000000000000811E00000000
      000000000000811E000000000000811E0000811E0000811E0000000000000000
      000000000000811E0000811E0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000051627E0053626D000000000000000000000000000000
      0000000000000000000096655E00FFFBD100FADEB400F8D9A600F4D19700F3CB
      8A00F0C78100F0C78100FCD586009F6F60000000000000000000811E00000000
      000000000000811E000000000000811E00000000000000000000811E00000000
      0000811E00000000000000000000811E00000000000000000000000000000000
      0000000000000000000000000000C18C2600C4912B0000000000000000000000
      0000000000000000000000000000000000000000000000000000056695000566
      9500056695000566950005669500056695000000000000000000000000000000
      0000000000005B667E000F6FD7004093D3000000000000000000000000000000
      000000000000000000009A685E00FFF3D900F2D9BB00F2D4AF00EECCA1000155
      0300EAC08900E7BC8000F3C982009F6F60000000000000000000811E0000811E
      0000811E0000811E000000000000811E0000811E0000811E0000811E00000000
      0000811E00000000000000000000000000000000000000000000000000000000
      00000000000000000000C0891E00E7A84200EAB05400D9A44800000000000000
      000000000000000000000000000000000000000000000274A90030C9E90012CB
      FE0020CEFE0054DEFF0074E0F8002CA7D3000566950000000000000000000000
      00005F697E00106CD30035A3FF003C9AF0000000000000000000000000000000
      000000000000000000009F6C5F00FFFBE900F4E0C600F3DABA00015503002CC5
      580001550300EAC18700F3CA81009F6F60000000000000000000811E00000000
      000000000000811E00001280FF002567B8000000000000000000811E00000000
      0000811E00000000000000000000811E0000BA892600B67E0E00B57C0900B57B
      0900B57B0900B47C0A00BF820F00FFF2D300E2A23900E8AF5100D9A34400B680
      1200B8811200BD8A270000000000000000000274A90073FAFE003FE3FE0012CB
      FE0020CEFE0054DEFF0074DEF70032AFD8000484BF000566950000000000706C
      7D001165C100309FFF003C9AF000000000000000000000000000000000000000
      00000000000000000000A5706000FFFFF800F7E5D4000155030030BD570041E0
      750022B63E0001550300F4CE8A009F6F6000000000000000000000000000811E
      0000811E00001773D7001673E9000F74E9000B74E7003F425400000000000000
      000000000000811E0000811E000000000000B67E0E00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00CFAD6800CA850900FFF0CE00E1A13500E9AC4800D5B4
      7100FFFFFF00BD810A0000000000000000000274A90073FAFE003FE3FE0012CB
      FE0020CEFE005BC7E1009E7F7A00B08F8100B6998A00986D6300735050004579
      AB0035A3FF00309FFF0000000000000000000000000000000000000000000000
      00000000000000000000AC756200FFFFFF0001550300067F14001A922F0027BB
      4500149A26000C881600015503009F6F60000000000000000000000000000000
      00001370C7002287DE002B93EF002084E200116CCE000768CC000367C7000363
      BC0000000000000000000000000000000000B57B0900FFFFFF00E5D5CB00E5D6
      CA00E5D5C900F9FCFF00FBFFFF00CBA86200CA830500FFEDC500DBB16C00B5B8
      C1006A6A6E006F6F750087898D00000000000274A90073FAFE003FE3FE0012CB
      FE002DB6DD009E7F7A00E5D4C000FEFBCF00FFFFDC00F4EECB00C4A58A00986D
      6300309FFF000000000000000000000000000000000000000000000000000000
      00000000000000000000B47A6300FFFFFF00FCF7F200FAEEE3000155030015A5
      280001550300F2D3AC00FBDCA7009F6F60000000000000000000000000000000
      00002288D70039A7ED003CA7EF004ABAFA003DAAF3001F83D7000D67B8000559
      A5000455980000569D000000000000000000B47B0800FFFFFF00E3D1C200E4D2
      C300E4D1C000F1F3F400F2F4F600F4F9FF00C9A35900E0C28900D9DBE300CECD
      D000D3D4D400EEEEEF00ECEAED007C7B7A000274A9009FFBFE00A3F3FF00B6F2
      FF00A3898700E1D3CA00FFFFEE00FEFBCF00FEFBCF00FFFAC700FFEEAB00BB8A
      7200000000000000000000000000000000000000000000000000000000000000
      00000000820000000000744E3E00FFFFFF00FFFEFE00FEF7F200036007000996
      130001550300FBE6C400EEDCB2009F6F60000000000000000000000000001448
      C1002884D9002982DC001C72CB003AA3ED003AA5F00046B5FF00359FF0002C92
      E6001574BF00035493000000000000000000B47B0900FFFFFF00E0CCBB00E1CE
      BC00E1CCB900ECEDEE00EBEBEB00ECECEE00EEF0F400F2F3F700A7A6A700DBD9
      DA00D1CFCF00767474007C7B7C00817F7F000274A900A7E9F3001CAAD3000791
      C50084787600FCFBD700FEFBCF00FEFBCF00FCFBD700FBF0BF00F6C28300E9C5
      9600986C6B000000000000000000000000000000000000000000000000000000
      82003858F3000000820077513F009E9E9E00FFFFFF00036E070004780A00058C
      0D0001550300CBA69300AC8E8400A16B6D000000000000000000050997000E28
      B1002981E7002277D700206ACC002478D5001E6DCF002D8FE700349DF4003CA6
      FF003EA9FF00000000000000000000000000B57B0900FFFFFF00DDC6B300DEC9
      B500DEC7B200E6E7E800E5E4E400E5E4E400E7E6E600EDECEB0079777500D9D7
      D600C5C2C2007B7B7D0000000000000000000274A90031B5D3003FE3FE0012CB
      FE008F878200FFFFDC00FEFBCF00FEFBCF00FCFBD700F3CF9600EFAD6A00F2D6
      A000986C6B000000000000000000000000000000000000000000000082003858
      F300001DDA00000C96000000820001350200013502000177070005840C000266
      0600DAC1BB00A96A5400D98A40009F675B000000000005099700192FCB002A4F
      EE001A40DE001547E0001F6BE500195DCC001E67D1001A64CB00277DE20039A4
      FF0000000000000000000000000000000000B57B0900FFFFFF00DAC1AA00DCC4
      AD00DCC3AA00DFE0E100DEDEDD00DEDDDC00DFDEDD00E5E4E30076737000E3E1
      E200B3B1AF008A87870082818300878585000274A90073FAFE003FE3FE0012CB
      FE007F7B7A00F7F3CA00FEFBCF00FFFAC700F6D89E00EEBB8100FEE3A600DCBD
      9600986C6B0000000000000000000000000000000000000082003858F300001B
      F800001FEB000022E300000C9600000082009E9E9E009E9E9E00FFFFFF00FFFF
      FF00D8C5C7009F675B00E09A5B00000000000000000005099700284BE9002A5A
      FF00163EFF000525FF000122F3000D44EA001650CF00103EB500000000000000
      000000000000000000000000000000000000B57B0900FFFFFF00D4B89E00D5BA
      A000D6B99E00D5D6D800D5D5D500D5D4D400D6D5D500D9D9D900A3A2A000BDBB
      BB00F4F4F400E5E5E600C4C4C500898785000274A90073FAFE003FE3FE0012CB
      FE004392AB00C6A98C00FFF6B500F6C28300F0B87500FFF4D700F7F3EE00986C
      6B00000000000000000000000000000000000000820093A6F700072FFF000425
      FF00001EFA00001EF2000020E300000C960000008200CF8E6800CF8E6800CF8E
      6800CF8E68009F675B00000000000000000000000000000000000711A400133D
      F4000D35FF00011DEB000227EA000A40E70005169F0000000000000000000000
      000000000000000000000000000000000000B57C0A00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00A8A9
      AF007D7D820082838900A0A1A600000000000274A90073FAFE003FE3FE0012CB
      FE0020CEFE00708E9800BD967D00E9C59600F2D6A000CCB4A100986C6B00986C
      6B0000000000000000000000000000000000000000000000820093A6F7000D35
      FF00062AFF000123FF000514A900000082000000000000000000000000000000
      00000000000000000000000000000000000000000000000181000321CC00113C
      FA000818C4000106950003047D00000000000000000000000000000000000000
      000000000000000000000000000000000000B57E0F00F7E0BE00E7B87000E8BE
      7A00E8BE7A00E8BD7900E8BD7800E8BD7800E7BD7700E8BD7700EABF7900ECBC
      7300FFE6C000BB80080000000000000000000274A90078FBFE0068F6FF0055F6
      FE005FFEFF0078FBFE0088B5B600767F83006C6A6E006E555500000000000000
      00000000000000000000000000000000000000000000000000000000820093A6
      F7001340FF001730CC0001028600000000000000000000000000000000000000
      00000000000000000000000000000000000000007E000523C4000E3FFF000C19
      AD00000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B6801300F2D8AE00CD840800D08A
      1300D28E1A00D4922200D5952900D8992F00D99B3600DB9F3E00DEA34500E0A6
      4A00F2D8AC00B781120000000000000000000274A900FBFFFF00F0FFFF00C6FF
      FF00A0FFFF009FFBFE009FFBFE0092FFFF0055F6FE0005669500000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      820093A6F70003068B0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000316AD000C43FF000815B0000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B8821700EED09C00ECCE9900ECCF
      9A00ECCF9A00ECCE9A00ECCE9900ECCE9800EBCD9800EBCD9700EBCD9700EBCD
      9600EECF9A00B88217000000000000000000000000000479AF00EDFAFC00DCFF
      FF00B7FFFF009FFBFE0092FFFF0078FBFE00086B9A0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000082000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000010CA100040FAF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BE8D2A00B8821700B7811600B781
      1600B7811600B7811600B7811600B7811500B7811500B6811500B6811500B781
      1500B8821700BF8E2D00000000000000000000000000000000000274A9000274
      A9000274A9000274A9000274A9000274A9000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000056695000566
      9500056695000566950005669500000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000566950046D3E9001CD9
      FF002EDAFF007AEDFF0023A4D300056695000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C19C7000BA864500B984
      4400B7814100B6803F00B57F3F00B57F3F00B57F3F00B57F3F00B57F3F00B57F
      3F00B6803F00B7824100BC905900000000000000000000000000000000000000
      000000000000000000000000000000000000000000000563910062F1FA0012CC
      FC0021CFFF0069E1FB001DA4D600056695000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000BA864500C89D6200B680
      3F00FBDDA600F6D69E00F6D69D00F6D69D00F6D69D00F6D69D00F6D69D00F6D6
      9D00F6D69E00FBDDA700B7824100000000000000000000000000000000000000
      00000000000000000000000000000000000000000000045B850099E8EC009AE4
      F400BFEFFC00C9F2FB007FCFEA00056695000000000000000000000000000000
      000000C68400008A4A0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008A4A0000C6
      84000000000000000000000000000000000000000000BA854500C89C6100B57E
      3D00F8DAA400F2D09500F1CF9400F2D09400F1CF9400F0CE9400F0CE9400F0CE
      9400F1CF9500F7DAA400B6803F00000000000000000000000000000000000000
      00000000000000000000005CFF000000000000000000005CFF00509BB0001888
      AF001180AF002D95BC00499FC5000566950000000000000000000000000000BE
      800000E4A6000088470000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000088470000E4
      A60000BE800000000000000000000000000000000000BA854500C89C6000B57E
      3C00FADDA600F8D38F00FAD48E00E9C89200F4CF9000F0CD9100EFCC9100EFCC
      9100F0CD9100F7DBA700B57F3E00000000000000000000000000000000000000
      00000000000000000000005CFF00005CFF00005CFF00005CFF002885960015A6
      C7002AC8EE0068D9EF001B97C20005669500000000000000000000BC800000D8
      A00000D9A100008342000087460000884700008A480046A37900000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000046A37900008A480000884700008746000083420000D9
      A10000D8A00000BC8000000000000000000000000000BA854500C89C6000B67F
      3C00FFE3A8006667B400CFB396003745C100FBD28900F1CA8B00EFC98C00EFC9
      8C00F0CA8D00F8DCAB00B57F3E0000000000000000000566950005639100045B
      8500005CFF00005CFF00005CFF00005CFF00005CFF00005CFF00005CFF00005C
      FF001DB8E3006BDAF4001DA4D600056695005187460000B9810000D39F0000D0
      9C0000D09C0000D59F0000D7A00000D7A00040E8C20000884600C9803F00B880
      3F00B57F3F00B6804000B8834200BA854500BA854500B8834200B6804000B57F
      3F00B8803F00C9803F000088460040E8C20000D7A00000D7A00000D59F0000D0
      9C0000D09C0000D39F0000B981005187460000000000BA854500C89C6000B77F
      3B00FFE9A900152DC9000821F000162CC700FFD27F00EFC68100ECC48200EDC6
      8400EEC88800F8DDAF00B57F3E00000000000566950046D3E9001BD3F80028BE
      DE0054A3AF00005CFF00005CFF000000000000000000005CFF00005CFF0038AC
      AF005ADEDE0091F5F80036C4EF0005669500008A480060E6CD0000CA9A0000C8
      980000C7970000C8990000C8990000C899006BE7CF0000834000FFDC9F00FBD9
      9D00F8D89C00FCE1A800E4C18600B9844400B9844400E4C18600FCE1A800F8D8
      9C00FBD99D00FFDC9F00008340006BE7CF0000C8990000C8990000C8990000C7
      970000C8980000CA9A0060E6CD00008A480000000000BA854500C89C6000B880
      3A00FFEDAC001C32C6001930EE001B2FC100FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00EEC48300F8DEB200B57F3E00000000000566950064F5FE0012C8F7001DB4
      DE00489AAC00005CFF00005CFF000000000000000000005CFF00005CFF00AEAF
      AE00B3DEDE00B8F8F80088F8FB00056695000000000000B381005DE0C60000C3
      970093E8D8004DE6D1004EE7D3004AE8D40090EDE20000823F00FFD08C00F6CC
      8900F4CB8700FBE1AE00B47D3C00D1AF8400D1AF8400B47D3C00FBE1AE00F4CB
      8700F6CC8900FFD08C0000823F0090EDE2004AE8D4004EE7D3004DE6D10093E8
      D80000C397005DE0C60000B381000000000000000000BA854500C89C6000B77F
      3A00FFEEAF001D32C5002239EF001C2FC100FFCD7200EDBE7300EABC7400EBBE
      7800EDC38000F9DFB600B57F3D000000000005669500A3F7FC009AE4F400AAD5
      E000005CFF00005CFF00005CFF00005CFF00005CFF00005CFF00005CFF00005C
      FF00045B8500056391000566950000000000000000004885430000AC7D0055D9
      C30080E4D50000813A0000833F000082400000834100489D5900FFC67F00F4C3
      7C00F2C27900FCDFAA00B57F3E000000000000000000B57F3E00FCDFAA00F2C2
      7900F4C37C00FFC67F00489D5900008341000082400000833F0000813A0080E4
      D50055D9C30000AC7D00488543000000000000000000BA854500C89C6000B77F
      3A00FFEFB4001D31C500283EF0001B2FC100FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00EDC27D00F9E1BB00B57F3D00000000000566950062BDD7001B95BF00107C
      A900257B9B00326D8700005CFF00005CFF00005CFF00005CFF00000000000000
      00000000000000000000000000000000000000000000D08240005AAD730000A6
      790070E1D50000844100FFC27300FFC07300FFBF7300FFBE7200F7BC7100F2BB
      6E00F2BA6B00FFE8BF00B57F3E000000000000000000B57F3E00FFE8BF00F2BA
      6B00F2BB6E00F7BC7100FFBE7200FFBF7300FFC07300FFC273000084410070E1
      D50000A679005AAD7300D08240000000000000000000BA854500C89B6000B77F
      3A00FFF1B8001C30C4003046F3001B30C400FFCD7500EFC07900EBBE7A00ECBF
      7C00EDC07E00FBE4BF00B57F3D0000000000056695003BC2DA001AC8F1002CCF
      F70060C6DB00167C9F00005CFF000000000000000000005CFF00000000000000
      00000000000000000000000000000000000000000000BF844500FFD6AA0054AC
      710000A37C0000824000FFB66000F8B45F00F5B45F00F4B45F00F3B35E00F2B2
      5C00FBD09400F2D3A800B78344000000000000000000B7834400F2D3A800FBD0
      9400F2B25C00F3B35E00F4B45F00F5B45F00F8B45F00FFB660000082400000A3
      7C0054AC7100FFD6AA00BF8445000000000000000000BA854500C89B6000B77F
      3900FFF4BD001B30C400374DF4001B31C700FFCF7900EFC47F00ECC18000ECC1
      8000ECC07E00FBE6C500B57F3C00000000000566950064F5FE0012CEFE0021CF
      FF006BDAF4001B9AC900045B8500000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C0884700FFD7
      AF00FFF0CC00FFE5B800FFE4B800FFE3B800FFE3B800FFE3B800FFE2B700FFEE
      CD00F5D5AE00BA87460000000000000000000000000000000000BA874600F5D5
      AE00FFEECD00FFE2B700FFE3B800FFE3B800FFE3B800FFE4B800FFE5B800FFF0
      CC00FFD7AF00C0884700000000000000000000000000BA854500C79B5F00B77F
      3900FFF5C1001B2FC4003E55F7001B30C700FFCE7600EFC37D00ECC17E00ECC0
      7D00ECBF7A00FCE8C900B57F3C00000000000566950081FCFF0052FAFF0067FF
      FF0094FAFD0035C1EB0005639100000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000BA83
      4400B87F3E00B77F3E00B57F3E00B57F3E00B47F3E00B47F3E00B47F3E00B57F
      3E00B7834400000000000000000000000000000000000000000000000000B783
      4400B57F3E00B47F3E00B47F3E00B47F3E00B57F3E00B57F3E00B77F3E00B87F
      3E00BA83440000000000000000000000000000000000B9844400C6995D00B77E
      3700FFF7C7001A2FC400455CF9001A2FC700FFCA7200EFBF7700ECBD7800ECBD
      7700ECBC7500FDEBCF00B57F3C000000000005669500C2EBF400FEFFFE00CEFF
      FF00BDFFFF0088F8FB0005669500000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B9844200EEDFCB00B87F
      3900FFFBCE001930C9004C64FF00192FCA00FFF8CB00FEEDD000FCECD000FCEC
      D000FCECD000FFF0D500B6813E00000000000000000005669500056695000566
      9500056695000566950000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000BE8D5100B9844200BA84
      4100C3883700605793002338CB0060579200C2863400B77F3B00B57E3C00B57E
      3C00B57F3C00B6813E00BD8C5000000000000000FF000000FF00C2A6A400C2A6
      A4000000FF000000FF00C2A6A400C2A6A4000000FF00C2A6A400C2A6A400C2A6
      A4000000FF00C2A6A4000000FF000000FF0005A1180005A11800C2A6A400C2A6
      A40005A1180005A11800C2A6A400C2A6A40005A11800C2A6A400C2A6A400C2A6
      A40005A11800C2A6A40005A1180005A118000000000000000000000000000000
      0000000000005F5D5D005F5D5D005F5D5D005F5D5D005F5D5D005F5D5D000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000092635D00A4676900A4676900A4676900A4676900A467
      6900A4676900A4676900A4676900A46769000000FF00000000000000FF00FEFC
      FB000000FF00FEFCFB000000FF00FEFCFB000000FF00FEFCFB00FEFCFB00FEFC
      FB000000FF00C2A6A400000000000000FF0005A118000000000005A11800FEFC
      FB0005A11800FEFCFB0005A11800FEFCFB0005A11800FEFCFB00FEFCFB00FEFC
      FB0005A11800C2A6A4000000000005A118000000000000000000000000005F5C
      5C005F5D5D00B7B7B800A1A09F00908C8400928A80009C918F00AFA0A1005F5D
      5D005F5D5D000000000000000000000000000000000000000000000000000000
      0000000000000000000096655E00FFFBD100FADEB400F8D9A600F4D19700F3CB
      8A00F0C78100F0C78100FCD586009F6F60000000FF00000000000000FF00FEFC
      FB000000FF000000FF00DDCFC200DDCFC2000000FF00DDCFC2000000FF00DDCF
      C2000000FF00C2A6A4000000FF000000FF0005A118000000000005A11800FEFC
      FB0005A1180005A11800DDCFC200DDCFC20005A11800DDCFC20005A11800DDCF
      C20005A11800C2A6A40005A1180005A1180000000000000000005F5D5D00CFCE
      D0009F9F9D00918F8000BCBBA600A1A7BF008390C200C1BCAA0092897900907E
      7900C2A9AA005F5D5D0000000000000000000000000000000000000000000000
      000000000000000000009A685E00FFF3D900F2D9BB00F2D4AF00EECCA1000155
      0300EAC08900E7BC8000F3C982009F6F60000000FF00000000000000FF00FEFA
      F5000000FF00FEFAF5000000FF00FEFCFB000000FF000000FF00FEFCFB000000
      FF000000FF00C2A6A4000000FF000000000005A118000000000005A11800FEFA
      F50005A11800FEFAF50005A11800FEFCFB0005A1180005A11800FEFCFB0005A1
      180005A11800C2A6A40005A1180000000000000000005F5D5D00D5D3D4004178
      4100427D3C00FAEDD300FCDDB80095A1ED003D59F200FFE7CE00FFFFFA00AFAD
      A00087746C00C9A9AA005F5D5D00000000000000000000000000000000000000
      000000000000000000009F6C5F00FFFBE900F4E0C600F3DABA00015503002CC5
      580001550300EAC18700F3CA81009F6F60000000FF000000FF00C2A6A400FEFA
      F5000000FF000000FF00DDCFC200DDCFC2000000FF00FEFAF500FEFAF500FEFA
      F5000000FF00C2A6A4000000FF000000FF0005A1180005A11800C2A6A400FEFA
      F50005A1180005A11800DDCFC200DDCFC20005A11800FEFAF500FEFAF500FEFA
      F50005A11800C2A6A40005A1180005A11800000000005F5D5D0063926300046B
      0B00046B0B007AA05400F2CA8E00F4BD7B00F3AD6800EDB47600FBE7BB00FFFF
      FC00ACAA9C00957874005F5D5D00000000000000000000000000000000000000
      00000000000000000000A5706000FFFFF800F7E5D4000155030030BD570041E0
      750022B63E0001550300F4CE8A009F6F60000000000000000000C2A6A400FEF7
      F000FEF7F000FEF7F000FEF7F000FEF7F000FEF7F000FEF7F000FEF7F000FEF7
      F000FEF7F000C2A6A40000000000000000000000000000000000C2A6A400FEF7
      F000FEF7F000FEF7F000FEF7F000FEF7F000FEF7F000FEF7F000FEF7F000FEF7
      F000FEF7F000C2A6A40000000000000000005F5D5D0081AF8400046B0B0038D4
      650043E27800046B0B0096C07700FEF2BD00F7D79F00EEB87F00EEBD8100F4D0
      9D00FCFBED00887A6B00C9A1A1005F5D5D000000000000000000000000000000
      00000000000000000000AC756200FFFFFF0001550300067F14001A922F0027BB
      4500149A26000C881600015503009F6F60000000000000000000C2A6A400FEF7
      F000DDCFC200DDCFC200DDCFC200DDCFC200DDCFC200DDCFC200FEF3E900FEF7
      F000FEF7F000C2A6A40000000000000000000000000000000000C2A6A400FEF7
      F000DDCFC200DDCFC200DDCFC200DDCFC200DDCFC200DDCFC200FEF3E900FEF7
      F000FEF7F000C2A6A400000000000000000044704700046B0B0026BD46002CC4
      4F0034CE5D0034C75C00046B0B0093C17D00FCF8C900FFEDB400FCC28200EFA9
      6600FFE3BF00B8B1A300AD8B86005F5D5D000000000005669500056695000566
      95000566950005669500B47A6300FFFFFF00FCF7F200FAEEE3000155030015A5
      280001550300F2D3AC00FBDCA7009F6F60000000000000000000C2A6A400FEF3
      E900FEF3E900FEF3E900FEF3E900FEF3E900FEF3E900FEF3E900FEF3E900FEF3
      E900FEF3E900C2A6A40000000000000000000000000000000000C2A6A400FEF3
      E900FEF3E900FEF3E900FEF3E900FEF3E900FEF3E900FEF3E900FEF3E900FEF3
      E900FEF3E900C2A6A4000000000000000000046B0B00046B0B000974110023BB
      410025B64400046B0B00046B0B00046B0B006B6C63009EA184009C876500C08A
      570095A1ED00909ABD009D7E76005F5D5D000566950046D3E9001CD9FF002EDA
      FF007AEDFF0023A4D30005669500FFFFFF00FFFEFE00FEF7F200036007000996
      130001550300FBE6C400EEDCB2009F6F60000000000000000000C2A6A400FFF0
      E200DDCFC200DDCFC200DDCFC200FEF3E900FFEEDE00FEF3E900FFEEDE00FEF3
      E900FFEEDE00C2A6A40000000000000000000000000000000000C2A6A400FFF0
      E200DDCFC200DDCFC200DDCFC200FEF3E900FFEEDE00FEF3E900FFEEDE00FEF3
      E900FFEEDE00C2A6A40000000000000000005F5D5D00D5CFCA00046B0B001BAB
      33001DAA3500046B0B00FCFCCC008F8F7E001A1C1D00222321001A1C1D00A67F
      52003D59F2006679BC00A5867A005F5D5D000566950064F5FE0012CEFE0021CF
      FF0069E1FB001DA4D60005669500FFFFFF00FFFFFF00036E070004780A00058C
      0D0001550300CBA69300AC8E8400A16B6D000000000000000000C2A6A400FEF3
      E900FFEEDE00FFF0E200FEF3E900FFEEDE00FFF0E200DDCFC200DDCFC200DDCF
      C200DDCFC200C2A6A40000000000000000000000000000000000C2A6A400FEF3
      E900FFEEDE00FFF0E200FEF3E900FFEEDE00FFF0E200DDCFC200DDCFC200DDCF
      C200DDCFC200C2A6A40000000000000000005F5D5D00DEDDDD00046B0B0016A3
      290017A72D00599E5C00FFFFE600F4F4CB00B5B59A001A1C1D00A9A18300FFD5
      9300FFE0AC00BFBC9F00B48F8F005F5D5D0005669500A3F7FC009EEAFB00BFEF
      FC00C9F2FB007FCFEA000566950001550300015503000177070005840C000266
      0600DAC1BB00A96A5400D98A40009F675B000000000000000000C2A6A400FFEE
      DE00DDCFC200DDCFC200DDCFC200DDCFC200DDCFC200C3B4A800C3B4A800C3B4
      A800C3B4A800C2A6A40000000000000000000000000000000000C2A6A400FFEE
      DE00DDCFC200DDCFC200DDCFC200DDCFC200DDCFC200C3B4A800C3B4A800C3B4
      A800C3B4A800C2A6A40000000000000000005F5D5D00E1E0E2009DA48700046B
      0B0016AA2900046B0B00ACCEAD00FFFFEF00FFFFE300CFCFB2001A1C1D008773
      5900FCF8D100958C7D00C9A1A4005F5D5D000566950062BDD7001B97C2001184
      B4002D96BD00499FC50005669500FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00D8C5C7009F675B00E09A5B00000000000000000000000000C2A6A400FFEE
      DE00FFEAD700FFEEDE00FFEAD700FFEAD700FFEEDE00B0A29600B0A29600B0A2
      9600B0A29600C2A6A40000000000000000000000000000000000C2A6A400FFEE
      DE00FFEAD700FFEEDE00FFEAD700FFEAD700FFEEDE00B0A29600B0A29600B0A2
      9600B0A29600C2A6A4000000000000000000000000005F5D5D00D1CECB006D93
      5B00046B0B0016A72900046B0B0060A464009FC79D00B1D3B000A5BB90008E8E
      7F00BFC0A500A18987005F5D5D0000000000056695003BC2DA001ACAF3002DD5
      FE006ADCF3001B97C20005669500CF8E6800CF8E6800CF8E6800CF8E6800CF8E
      6800CF8E68009F675B0000000000000000000000000000000000C2A6A400FFEA
      D700DDCFC200DDCFC200DDCFC200FFEAD700C9B9AC00FEFAF500FEF7F000E6DA
      D900C2A6A4000000000000000000000000000000000000000000C2A6A400FFEA
      D700DDCFC200DDCFC200DDCFC200FFEAD700C9B9AC00FEFAF500FEF7F000E6DA
      D900C2A6A400000000000000000000000000000000005F5D5C00D3D4D500BDB8
      B400789D6500046B0B00046B0B00046B0B00046B0B00046B0B0080B57D00D4D5
      B5009C8C8700CAAAAA005F5D5D00000000000566950064F5FE0012CEFE0021CF
      FF006EE0FB001DA4D60005669500000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C2A6A400FFEA
      D700FFE6D000FFEAD700FFE6D000FFEAD700C5B5A900FEFAF500DDCFC200C2A6
      A400000000000000000000000000000000000000000000000000C2A6A400FFEA
      D700FFE6D000FFEAD700FFE6D000FFEAD700C5B5A900FEFAF500DDCFC200C2A6
      A4000000000000000000000000000000000000000000000000005F5D5D00CBCB
      CE00C4BFBC00C1B6A500E0D3C000D5DAD700C0D4DC00E0DCCB00B5B1A100AD9C
      9900C1A7A7005F5D5D0000000000000000000566950081FCFF0052FAFF0067FF
      FF0095FCFF0036C4EF0005669500000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C2A6A400FFE6
      D000FFE6D000FFE6D000FFE6D000FFE6D000C9B9AC00DDCFC200C2A6A4000000
      0000000000000000000000000000000000000000000000000000C2A6A400FFE6
      D000FFE6D000FFE6D000FFE6D000FFE6D000C9B9AC00DDCFC200C2A6A4000000
      0000000000000000000000000000000000000000000000000000000000005F5D
      5D005F5D5D00B8BABB00B6B4B100B5AFA700B6ADA400B1A7A400B2A5A6005F5D
      5D005F5D5D0000000000000000000000000005669500C2EBF400FEFFFE00CEFF
      FF00BDFFFF0088F8FB0005669500000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C2A6A400C2A6
      A400C2A6A400C2A6A400C2A6A400C2A6A400C2A6A400C2A6A400000000000000
      0000000000000000000000000000000000000000000000000000C2A6A400C2A6
      A400C2A6A400C2A6A400C2A6A400C2A6A400C2A6A400C2A6A400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000605E5E005F5D5D005F5D5D005F5D5D005F5D5D00605E5E000000
      0000000000000000000000000000000000000000000005669500056695000566
      9500056695000566950000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007D7D7D000000
      0000848484000000000084848400000000007C7D7D00000000007C7D7D000000
      00007C7C7D000000000086868600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000BB89
      2600B67E0E00B47B0900B47A0700B47A0800B47B0800B47A0800B47A0800B47B
      0800B47A0800B47B0900B67E0E00BB8825008A8A8A00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000B67E
      0E00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00B67E0E0000000000FFFFFF00E5E4E300E5E4
      E300E6E5E400E7E6E400E6E5E400E6E5E300E6E5E300E6E4E300E6E5E300E6E4
      E300E5E4E300E5E4E300FFFFFF008B8B8B000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000B8831700B379
      0400FFFFFF00FFFFFF00FFFFFF00FFFFFF00D7BFA400FFFFFF00FFFFFF00D7BF
      A400FFFFFF00FFFFFF00FFFFFF00B47B09008A8A8A00FFFFFF00E1E0DF00E2E1
      E000E3E2E100E3E2E100E3E2E100E3E2E100E3E2E100E3E2E100E3E2E100E3E2
      E100E2E1E000E1E0DF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000B57E0E00FFFF
      FF00AC6D0000DAC4AC00D8C0A400D8BFA200D9C1A300D8BFA100D8BFA100D9C1
      A300D7BE9F00D5BC9C00FFFFFF00B47B080000000000FFFFFF00DEDCDB00E0DD
      DD00E0DEDD00BFBEBD007D7D7D007D7D7D007D7D7D00979797007D7D7D00E0DE
      DD00E0DDDD00DEDCDB00FFFFFF008A8A8A000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B47C0B00B37A0900AF740000FFFF
      FF00FFFFFF00AC6D0000FFFFFF00FFFFFF00D7BC9E00FFFFFC00FFFFFC00D7BC
      9D00FFFFFB00FFFFF700FFFFFF00B47B08008A8A8A00FFFFFF00DAD9D700DBDB
      D800DCDBD9008A8A8900A3A3A200DCDBD900C9C8C7007D7D7D0083838300DCDB
      D900DBDBD800DAD9D700FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFAE500FFFAE400FFF7DE00FFFA
      EB00FFFAEB00FFFFFF00AD6E0000FFFFFE00D7BC9A00FFFFF400FFFFF400D7BB
      9800FFFFF300FFFDEF00FFFFFF00B47B080000000000FFFFFF00D6D4D200D7D6
      D400D8D7D5008F8F8F008F8F8F00BAB9B800D8D7D500AEADAC0083838300D8D7
      D500D7D6D400D6D4D200FFFFFF008A8A8A000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFF5
      E000FFF6E000FFFFFF00AD6F0000D9BD9D00D9BC9900D7B99500D7B99500D8BB
      9700D6B89300D4B58F00FFFFFF00B47B08008A8A8B00FFFFFF00D1D0CE00D3D2
      D000D4D3D100C8C8C6008E8E8E007D7D7D007D7D7D007D7D7D0083838300D4D3
      D100D3D2D000D1D0CE00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B47A0800B37A0600AF730000FFF8
      E100FFFFFF00AA6B0000FFFFF000FFFEEC00D7B99100FFFCE800FFFCE800D7B8
      9000FFFBE600FFF8E200FFFFFF00B47B080000000000FFFFFF00CECCCB00D0CE
      CD00D1CFCE00C0BFBE00AAA9A800D1CFCE00D1CFCE00A4A3A30083828200D1CF
      CE00D0CECD00CECCCB00FFFFFF008B8B8B000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000B57D0D00FFFF
      FF00AC6D0000FFFCE700FFF9E200FFF9E100D7B58C00FFF9E100FFF9E100D7B5
      8C00FFF8DF00FFF5DA00FFFFFF00B47B08008B8B8B00FFFFFF00CAC7C600CCCA
      C900CDCBCA00A8A7A6007D7D7D00A8A7A600A8A7A600888787008D8D8C00CDCB
      CA00CCCAC900CAC7C600FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000B8831700B378
      0300FFFFFF00DEB48200E0B58100E0B68300DEB78700DFB68400DFB68400DEB7
      8700DFB58200DDB27D00FFFFFF00B57B090000000000FFFFFF00C5C4C200C8C7
      C500C9C8C600C9C8C600A6A5A40087878700828282008C8C8C00BFBEBC00C9C8
      C600C8C7C500C5C4C200FFFFFF008B8B8B000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000B57B
      0800FFFFFF0044C4FF0049C5FF0047C6FF00E3B57E0046C7FF0046C7FF00E3B5
      7E0046C6FF0044C4FF00FFFFFF00B57C09008B8B8B00FFFFFF00C1BFBD00C4C2
      C000C5C3C100C5C3C100C5C3C100C5C3C100C5C3C100C5C3C100C5C3C100C5C3
      C100C4C2C000C1BFBD00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000B67E
      0E00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00B67E0E0000000000FFFFFF00B9B7B500BBB9
      B700BCBAB800BDBAB800BCBAB800BCBAB800BCBAB800BCBAB800BCBAB800BCBA
      B800BBB9B700B9B7B500FFFFFF008B8B8B000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000CFAA
      6000B67E0E00B67C0900B67B0700B67B0800B57B0800B67B0800B67B0800B57B
      0800B67B0800B67C0900B67E0E00BD8C27008B8B8B00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007D7D7D000000
      0000848484000000000084848400000000007D7D7D00000000007D7D7D000000
      00007D7D7D000000000086868600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000002640600013C0300013C
      0300013C03000262060000000000000000000000000000000000000000000000
      000000000000B433070000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000566
      9500056695000566950005669500056695000267060005870F00019808000097
      070003890A0002630700013C0300000000000000000000000000000000000000
      000005669500304B5000B4330700354141000566950005669500000000000000
      00000000000000000000000000000000000000000000BC4E0300BC4E0300BC4E
      0300BC4E0300BC4E0300BC4E0300BC4E0300BC4E0300BC4E0300BC4E0300BC4E
      0300BC4E0300BC4E0300BC4E0300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000274A90030C9
      E90012CBFE0020CEFE0054DEFF00117E2D000FA92D0007AB1D0083D88E0023B0
      2D00009C040003A60C0002660700026506000000000000000000000000000274
      A90030C9E90013CAFB0072462A00B4330700797666002CA7D300056695000000
      00000000000000000000000000000000000000000000BC4D0200FFFFFF00FFFF
      FF00FFFFFF0068BA5B00FFEACF00FFEACF00FFEACF00B47B4100726A1E00FFCF
      A000FFCFA000FFCFA000BC4C010000000000BB882500B67E0E00B47B0900B47A
      0700B47A0800B47B0800B47A0800B47A0800B47B0800B47A0800B47B0900B67E
      0F00BB882500000000000000000000000000000000000274A90073FAFE003FE3
      FE0012CBFE0020CEFE0054DEFF00098E140018B5480007A52700FFFFFF00FFFF
      FF0047BF5000009E0700039A0C000267060000000000000000000274A90073FA
      FE003FE3FE0013CAFB002DAFCC00863E1B00AC400600506664000386C1000566
      95000000000000000000000000000000000000000000BC4E0300FFFFFF00FFFF
      FF00FFFFFF0068BA5B00FFEACF00FFEBD300FFE9C5007D706D000E485F007368
      5B00D4AC8300FFCFA000BD4D020000000000B67E0E00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00B67F1000000000000000000000000000000000000274A90073FAFE003FE3
      FE0012CBFE0020CEFE0054DEFF00098E140025B85B000DAB3B00FFFFFF00FFFF
      FF00FFFFFF0034B63F0003AA0C000267060000000000000000000274A90073FA
      FE003FE3FE0013CAFB0020CEFE0067827A0093411800B43307003E4340000566
      95000000000000000000000000000000000000000000BA4C010070B7600067B6
      590067B65B003D9F2D0063AF4B0067AF4B0067AF48004E9941003C636F009F67
      6D005A4A360052773200BA4D010000000000B47B0900FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00D7BFA400FFFFFF00FFFFFF00D7BFA500FFFFFF00FFFFFF00D3AF
      6900B47B0900000000000000000000000000000000000274A90073FAFE003FE3
      FE0012CBFE0020CEFE0054DEFF00098E140052CB82000DAB4000FFFFFF00FFFF
      FF0046C1620005A1180005AA11000267060000000000000000000274A90073FA
      FE003FE3FE0013CAFB0020CEFE0055D8F600874F3100B8663000A62902002D41
      48000000000000000000000000000000000000000000BC4D0200EDF3E500EDF7
      EB00EDF7EB0062B55500DAE5C400EDE6C900EDE0BB00E1D8A6005A7D3F00E595
      9A00A068690060483800C149000000000000B47B0800FFFFFF00D5BB9C00D6BC
      9C00D8BEA000D9C1A300D8BFA100D8BFA100DBC3A800DCC6AF00DDC9B600B073
      0000FFFFFF00B37906000000000000000000000000000274A9009FFBFE00A3F3
      FF00B6F2FF00DAF8FF00E5FAFF0020A73D0077D093004DC77B008FDDAC002CBA
      5A000EAB370011AF3300099D1C00046B0B0000000000000000000274A9009FFB
      FE00A3F3FF00B6F2FF00DAF8FF00E5FAFF00C5C2BA0093411800E7B47900A629
      02000000000000000000000000000000000000000000BC4D0200FFFFF800FCFC
      FF00F7F7FF0063B46000F0F4E100FFFCEE00FFF2E600FAE6C70067AC4700DE9D
      9A00D9939900B16462006B5B330000000000B47B0800FFFFFF00FFFEF700FFFF
      F700FFFFFB00D7BC9D00FFFFFC00FFFFFD00DAC1A700AF720000AF720000CFA8
      5A00FFFFFF00FFFFFF00B279040000000000000000000274A900A7E9F3001CAA
      D3000791C5000788BC00108BBC00168F8000098E140084D79E0078D79E0050C9
      7E0041C5730018A938000B8420000000000000000000000000000274A900A7E9
      F3001CAAD3000791C5000788BC00B0410000B0410000AC400600CE8C5900FEE0
      A700A629020000000000000000000000000000000000C64E00008B8AF2004445
      EE003232E300222BC7006363F700A7BACE00A6D4880096C57B004EA739009FC4
      780084834F00758089000897C9000018A000B47B0800FFFFFF00FFFCEE00FFFD
      EF00FFFFF300D7BB9800FFFFF400FFFFF500D8BD9C00FFFFF600FFFFF400FFFC
      EE00FFF8E800FFFAEC00FFFFFF00B67E0E00000000000274A90031B5D3003FE3
      FE0012CBFE0020CEFE0054DEFF0074E0F80023A79E000E973800098E1400098E
      1400098E14000D862500000000000000000000000000000000000274A90031B5
      D3003FE3FE0013CAFB0020CEFE00B0410000BF734000FCD39600EEB77A00A92D
      0300A6290200A629020000000000000000000000000066479D004647CC009790
      B600A099B400A7A1C1005B59C1001B2BBB006E9D9A009ED387004DA73C00A0CE
      8C00AFC27D006EADA7000559E000040CA500B47B0800FFFFFF00D4B48E00D5B6
      9100D7B99400D8BB9700D7B99500D7B99500D8BB9900FFFFFF00FFFFFF00FFFF
      FF00FFF4DD00FFF6E100FFFFFF00B67E0E00000000000274A90073FAFE003FE3
      FE0012CBFE0020CEFE0054DEFF0074E0F80030B0DA000386C100056695000000
      00000000000000000000000000000000000000000000000000000274A90073FA
      FE003FE3FE0013CAFB0020CEFE0054DEFF00B0410000BC693300F3B56A00DC8F
      4700A62902000000000000000000000000004141FA00545AF000D4D4C500FFEF
      AC00F4BF8100FBC78800FFFAD1006D6BBD005952FF00EDEDF2006DBA5900FFFC
      FF00FFEFDD00FFE5B8005D446C0000000000B47B0800FFFFFF00FFF8E100FFF9
      E300FFFCE700D7B89000FFFCE800FFFDE900D9BC9600AD700000AE700000CEA3
      4E00FFF7DF00FFFFFF00B278040000000000000000000274A90073FAFE003FE3
      FE0012CBFE0020CEFE0054DEFF0074E0F80030B0DA000386C100056695000000
      00000000000000000000000000000000000000000000000000000274A90073FA
      FE003FE3FE0013CAFB0020CEFE0054DEFF0074E0F800B0410000B2541700D877
      1D00C65D0C00A92D030000000000000000004141FA009F9ED700FFFFD400FEFC
      CA00FBF4C400F4D19600EEBB7D00D5C4B100393ACE00B4B8E90079C15B00FFF8
      F000FEEBD400FEE1BA00B0490A0000000000B47B0800FFFFFF00FFF5D900FFF6
      DC00FFF9E000D7B58C00FFF9E100FFFAE100D9B89000FFFFEC00FFFFF100B073
      0000FFFFFF00B37906000000000000000000000000000274A90073FAFE003FE3
      FE0012CBFE0020CEFE0054DEFF0074E0F80030B0DA000386C100056695000000
      00000000000000000000000000000000000000000000000000000274A90073FA
      FE003FE3FE0013CAFB0020CEFE0054DEFF0074E0F80030B0DA00B0410000B041
      0000B0410000A6290200A6290200000000004D4CF400AFBAE300FFFFF600FFFF
      D9008687750031343400544B3E00A39696004145D40092463700CE580100C756
      0200C7560200C75602000000000000000000B57B0900FFFFFF00DDB17D00E0B4
      7F00E0B68300DEB78700DFB68400DFB68400DEB88700E0B78600E0B88900D7B1
      6C00B57B0800000000000000000000000000000000000274A90078FBFE0068F6
      FF0054F6FF005FFEFF007FFEFF0089FBFE0048CFF200058BC700056695000000
      00000000000000000000000000000000000000000000000000000274A90078FB
      FE0068F6FF0055F6FE005FFEFF0078FBFE0089FBFE0048CFF200058BC7000566
      9500000000000000000000000000000000004545F800B2B2E000FFFFFF00FFFF
      F300D8D8B7005F605300B2976B00E7CBA900353EE5008E403000000000000000
      000000000000000000000000000000000000B57C0900FFFFFF0044C3FF0049C5
      FF0047C6FF00E3B57E0046C7FF0046C7FF00E3B57E0046C6FF0045C6FF00FFFF
      FF00B67D0B00000000000000000000000000000000000274A900FBFFFF00F0FF
      FF00C6FFFF00A0FFFF0098FFFF0098FFFF0093FFFF0057F7FE00056695000000
      00000000000000000000000000000000000000000000000000000274A900FBFF
      FF00F0FFFF00C6FFFF00A0FFFF009FFBFE009FFBFE0092FFFF0055F6FE000566
      9500000000000000000000000000000000004545F8007E79E300F8F4EB00FFFF
      FF00FFFFFF00F2F2DE00A7A17900938FB5002D30FF0000000000000000000000
      000000000000000000000000000000000000B67E0E00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00B67E0F0000000000000000000000000000000000000000000479AF00EDFA
      FC00DCFFFF00B7FFFF0099FFFF0092FFFF0083FAFB00086B9A00000000000000
      0000000000000000000000000000000000000000000000000000000000000479
      AF00EDFAFC00DAF8FF00B7FFFF009FFBFE0089FBFE0083FAFB00086B9A000000
      000000000000000000000000000000000000000000004647FB00827FE000DDD8
      E500EAF4F000EEF3F600A6A5DC003839E9000000000000000000000000000000
      000000000000000000000000000000000000CFAA6000B67E0E00B67C0900B67B
      0700B67B0800B57B0800B67B0800B67B0800B57B0800B67B0800B67C0900B67E
      0E00CFAA60000000000000000000000000000000000000000000000000000274
      A9000274A9000274A9000274A9000274A9000274A90000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000274A9000274A9000274A9000274A9000274A9000274A900000000000000
      00000000000000000000000000000000000000000000000000003536FE00403E
      F0004A49E9003C3CED002828FA00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000056695000566950005669500056695000566950000008200000082000000
      0000000000000000820000008200000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C7C6C300BBB7
      AF00B2ACA000AFA99D00AEA99C00AEA89C00AEA89C00AEA89C00AFA99D00B2AC
      A000BBB7AF00C7C6C30000000000000000000000000000000000000000000274
      A90030C9E90012CBFE0020CEFE0054DEFF00000082003A66FF00010EBF000000
      9D0000009D000115F6000013EA00000082000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BABAB900AFAFAD00AEAEAB00ADAD
      AB00ADADAB00ADADAB00ADADAB00AEAEAC00B3B0AF00C5B5B900529F7A00008B
      4800008B4900008C4C0053A882000000000000000000C1BEB900B4ADA200C2BB
      B000D0C7BE00DFD5CD00E6DCD400EDE1DB00EFE4DD00E7DDD600E1D6CF00D1C9
      BF00C3BCB100B4AEA200C1BEB9000000000000000000000000000274A90073FA
      FE003FE3FE0012CBFE0020CEFE0054DEFF00000082002C4FFF00204AFF00000C
      AA000112D7000320FF00010EBF00000082000000000000000000000000000000
      000000000000008C4C003EA07300000000000000000000000000000000000000
      000000000000000000000000000000000000B0B0AD00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF006DC29B000094520000BA
      840077E0C60000BB860000995C0053A8820000000000B1AB9F00C7C0B600CFC7
      BE00D5CCC300DBD2C900E2D8D000E9DDD700EBE0D900E3D9D200DDD3CB00D6CE
      C500D1C9C000C9C2B900B1AB9F000000000000000000000000000274A90073FA
      FE003FE3FE0012CBFE0020CEFE0054DEFF0074E0F800000082003153FF002351
      FF00031FFF00000DA40000008200000000000000000000000000000000000000
      00000088470018C8910000874600000000000000000000000000000000000000
      000000000000000000000000000000000000AEAEAB00FFFFFF00FDFDFD00FCFC
      FD00FCFCFD00FCFCFD00FCFCFD00FFFEFF00FFFFFF00007F360000BE880000BC
      8300FFFFFF0000BC830000C18D00008C4C0000000000B1AB9F00C9C0B800CDC5
      BC00D4CBC200DAD1C800E1D7CF00E7DCD500EADFD800E2D8D100DCD2CA00D5CD
      C400CFC7BE00CAC3B900B1AB9F000000000000000000000000000274A90073FA
      FE003FE3FE0012CBFE0020CEFE0054DEFF0074E0F800000082003153FF005790
      FF00204AFF00000CAA0000008200000000000000000000000000000000000088
      46003CCE9E0000DCA20000BC7F00009B5C00009D5F0000884700008948002497
      610000000000000000000000000000000000ADADAB00FFFFFF00FAF8F800F9F8
      F800F9F8F800F9F8F800F9F8F800FDFAFB00FFFFFF00007F370072E5CB00FFFF
      FF00FFFFFF00FFFFFF0077E7CE00008B490000000000B0AB9E00C8BFB700CBC3
      BA00D2C9C000D8CFC500DFD5CD00E9DFD800E9DDD600E0D6CF00DAD0C800D3CB
      C200CEC6BD00C9C2B700B0AA9E000000000000000000000000000274A90078FB
      FE0068F6FF0055F6FE005FFEFF0078FBFE00000082003153FF004579FF002842
      F3003153FF00204AFF000110B600000082000000000000000000008C4A0061D8
      B50000D49E0000D29C0000D5A1005ADEC7005ADEC7005ADEC7005ADEC70000C2
      8C0000905000000000000000000000000000ADADAB00FFFFFF00F6F6F600F6F6
      F600F6F6F600F6F6F600F6F6F600F9F7F800FFFFFF00007E360000CA940000C8
      8F00FFFFFF0000C9900000CD9900008C4B0000000000B0AA9E00C9C2B900E2DD
      D400F5EFE900FFFBF400FEFAF300FDF9F200FDF9F200FDFAF300FFFBF400F6F0
      E800E4DDD500CBC4BA00B0AA9E000000000000000000000000000274A900A7E9
      F3001CAAD3000791C5000787BB00108BBC0000008200699CFF003153FF000000
      8200000082002E51FF00204AFF00000082000000000000000000000000000087
      440086EBDB0000C69F0000B1800000874500008D4D00009B6000009A5F0000B2
      800000B6890044A277000000000000000000ADADAB00FFFFFF00F4F4F300F4F4
      F300F4F4F300F4F4F300F4F4F300F6F5F500FFFAFC0063B68F00009B590000D1
      9A0074EED40000D49F0000A3670068BC960000000000C1BDB600F9F4EE00D7D0
      C800C6BEB600BEB5AB00C2B9AF00C7BCB400C8BEB500C3B9B100BFB6AC00C7BF
      B700D8D1C900F9F5ED00C1BDB6000000000000000000000000000274A90031B5
      D3003FE3FE0012CBFE0020CEFE0054DEFF0074E0F80000008200000082000368
      9A00000000000000820000008200000000000000000000000000000000000000
      000000874200A3EEED0000884500000000000000000000000000000000003CA6
      750000A17100009153000000000000000000ADADAB00FFFFFF00F2F1F000F2F1
      F000F2F1F000F2F1F000F2F1F000F3F1F000F8F3F400FFF9FD0062B58E000080
      370000843E000089470069BD96000000000000000000BBB7AF00A3998F00B6AE
      A400C8BFB600D8CFC700E3D9D100EADED800ECE1DA00E4DAD300DAD1C900CAC1
      B800B8AFA600A49C9200BBB7AF000000000000000000000000000274A90073FA
      FE003FE3FE0012CBFE0020CEFE0054DEFF0074E0F80030B0DA000386C1000566
      9500000000000000000000000000000000000000000000000000008E4E000000
      000000000000008B480058B48900000000000000000046A27800008B4A000000
      000000000000008E4E000000000000000000ADADAB00FFFFFF00EFEFEE00EFEF
      EE00EFEFEE00EFEFEE00EFEFEE00EFEFEE00F0EFEF00F4F1F100FDF4F600FFFF
      FF00CBB4BB0000000000000000000000000000000000B1AB9F00CAC1B900CEC7
      BE00D5CCC300DAD1C800E1D7CF00E8DCD600EADFD800E2D8D100DCD2CA00D6CE
      C500D1C9C000CBC4BA00B1AB9F000000000000000000000000000274A90073FA
      FE003FE3FE0012CBFE0020CEFE0054DEFF0074E0F80030B0DA000386C1000566
      95000000000000000000000000000000000000000000000000000093530000AE
      7000309A6800000000000000000000000000000000000088470018E8B4000086
      450000000000000000000000000000000000ADADAB00FFFFFF00ECEBEA00EDEC
      EB00EDECEB00EDECEB00EDECEB00ECEBEA00ECEBE900ECEBEA00EEEBEB00FFFF
      FF00B7AFB00000000000000000000000000000000000B1AB9E00C8BFB700CBC3
      BA00D2C8BF00D8CEC500DFD5CD00E9DED800E9DDD600E0D6CF00DACFC700D3CB
      C200CEC6BD00C9C2B800B0AB9E000000000000000000000000000274A90073FA
      FE003FE3FE0012CBFE0020CEFE0054DEFF0074E0F80030B0DA000386C1000566
      950000000000000000000000000000000000000000000000000055B2880000C3
      870000BB7E00009D5F00009F6000008847000087450000BC800000DBA0003CE9
      BD0000874500000000000000000000000000ADADAB00FFFFFF00E9E9E800EAEA
      E900EAEAE900EAEAE900E9E9E800F3F4F200FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00AFAEAC0000000000000000000000000000000000B0AA9D00C7C0B800E1DB
      D200F3EDE600FDF9F200FCF8F100FBF7F000FBF7F000FCF8F100FDF8F200F4EE
      E600E2DBD300CAC3B900AFAA9D000000000000000000000000000274A90078FB
      FE0068F6FF0055F6FE005FFEFF0078FBFE0089FBFE0048CFF200058BC7000566
      950000000000000000000000000000000000000000000000000000000000008F
      500000C48C0000DBA9005ADEC7005ADEC7005ADEC70000D4A10000D19C0000D3
      9E0061DBB700008C4A000000000000000000ADAEAB00FFFFFF00E7E5E400E8E7
      E600E8E7E600E8E7E600E7E5E400FFFFFF00CBCBCA00A7A7A400A5A5A300FFFF
      FF00AFAFAD0000000000000000000000000000000000AEA89C00FBF5EF00EEE7
      DE00E3DCD300DDD5CC00DDD5CB00DDD4CB00DDD4CB00DDD4CB00DDD5CB00E3DC
      D300EEE7DE00FBF6EF00AEA89C000000000000000000000000000274A900FBFF
      FF00F0FFFF00C6FFFF00A0FFFF0098FFFF0098FFFF0092FFFF0055F6FE000566
      9500000000000000000000000000000000000000000000000000000000000000
      00002D9F6A00008A490000894800008948000087450000B1800000C7A00086DC
      C50000874400000000000000000000000000AEAEAB00FFFFFF00E3E3E200E4E4
      E300E4E5E400E4E4E300E3E3E200FFFFFF00A7A7A400EBEBEA00FFFFFF00E9E9
      E900CACAC80000000000000000000000000000000000AFA99D00E1D8CE00E1D8
      CE00DFD6CC00DFD6CB00DFD5CB00DFD5CB00DFD5CB00DFD5CB00DFD6CB00DFD6
      CC00E1D8CE00E1D8CE00AFA99D00000000000000000000000000000000000479
      AF00EDFAFC00DCFFFF00B7FFFF0098FFFF0092FFFF0083FAFB00086B9A000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000894600A3E4DA000087
      440000000000000000000000000000000000AEAEAC00FFFFFF00E0DFDE00E1DF
      DE00E1E0DF00E1DFDE00E0DFDE00FFFFFF00A5A5A300FFFFFF00E8E8E800CBCB
      C9000000000000000000000000000000000000000000DCDAD400B6B0A400D2CA
      BF00E2D9D000EFE7DD00EEE6DC00EEE6DC00EEE6DC00EEE6DC00EFE7DD00E2D9
      D000D2CABF00B6B0A400DCDAD400000000000000000000000000000000000000
      00000274A9000274A9000274A9000274A9000274A9000274A900000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000004EB08300008C49000000
      000000000000000000000000000000000000AFAFAD00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E9E9E900CACAC9000000
      000000000000000000000000000000000000000000000000000000000000CBC7
      BF00B2ACA100AEA89C00AEA89C00AEA89C00AEA89C00AEA89C00AEA89C00B2AC
      A100CBC7BF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B8B8B600B0B0AD00AEAEAC00AEAE
      AB00AEAEAB00AEAEAB00ADAEAB00AEAEAB00AFAFAD00B7B7B500000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000020A1C9002CAACF001082AC00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000002BA3
      C90024A5CC000F84AE00149AC30024AED60033B1D500188BB4001787AF0043AB
      CC003DA8CB00000000000000000000000000BEBEBD00AFAFAD00ADADAB00ADAD
      AB00ADADAB00ADADAB00AFAFAD00B4B4B300B8B8B600AFAFAD00ADADAB00ADAD
      AB00ADADAB00ADADAB00AFAFAD00BFBFBE000000000000000000A09F9D008C89
      8700918B8800746D6900776E6900776E6800776E6800776E6900746D6900918B
      88008C898700A09F9D0000000000000000000000000000000000000000000000
      0000000000000000000000000000AE865D00A7774500AE865D00000000000000
      00000000000000000000000000000000000000000000000000000000000032A5
      C90037B8DC0014AED90011A1CB001DC7F00048D7F80034A6CA005CC1DD0067C4
      DE003FA4C600000000000000000000000000AFAFAD00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00AFAFAD00AFAFAD00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00AFAFAD0000000000000000008D898700AFC4
      BC00B8C7BC0000418C00359FDA002F9AD6002F9AD600359FDA0000418C00B8C7
      BC00AFC4BC008D89870000000000000000000000000000000000000000000000
      00000000000000000000A97F5200C5A37E00FBF4E700C5A37E00A97F52000000
      00000000000000000000000000000000000000000000208CB4002C98BD004EB5
      D50085DBEF0051C0DE0039C8EC001ED7FF003ADBFF005FD4F10075C6DF00B0E1
      EC0090CEE1001B8BB5000000000000000000AEAEAB00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00ACACAA00ACACAA00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00AEAEAB0000000000000000008D888700F4FE
      FB00FFFFFA0000458D004AA3D600288ECA00288ECA004AA3D60000458D00FFFF
      FA00F4FEFB008D88870000000000000000000000000000000000000000000000
      000000000000A9805300C4A47F00F6EDDF00C19E7900F6EDDF00C4A47F00A980
      5300000000000000000000000000000000000000000060BAD70048B0D20053BE
      E00095EDFF008DEFFF005AE5FF0027DAFF001CD8FF0052E2FF0079E8FF007DEB
      FF003FCBEE0031B1D9002CA4CE0000000000ADADAB00FFFFFF00FBFBFB00FAFA
      FA00FAFAFA00FBFBFB00FFFFFF00ACACAA00ACACAA00FFFFFF00FBFBFB00FAFA
      FA00FAFAFA00FBFBFB00FFFFFF00ADADAB000000000000000000908C8A00BBD8
      D300C7DCD0000049920060ABD7001D84C2001D84C20060ABD70000499200C7DC
      D000BBD8D300908C8A0000000000000000000000000000000000000000000000
      0000A9805300C5A58100F8F1E600B4895D00A3723E00B4895D00F8F1E600C5A5
      8100A9805300000000000000000000000000000000001391C00022A6D7004EC3
      EA0081DFF70092EFFF0071D3E8005CB8CC0050B2C9002AC7EB0007D1FF0004CF
      FE0009D0FE0008C9F5000EB4E10000000000ADADAB00FFFFFF00F8F7F700F8F7
      F700F8F7F700F8F7F700FFFFFF00ACACAA00ACACAA00FFFFFF00F8F7F700F8F7
      F700F8F7F700F8F7F700FFFFFF00ADADAB000000000000000000948F8D00BFDB
      D600CBDED400004E980075B6DC000E7CBB000E7CBB0075B6DC00004E9800CBDE
      D400BFDBD600948F8D000000000000000000000000000000000000000000A980
      5300C7A68400FAF4EA00B3895C00A2703C00A3713D00A2703C00B3895C00FAF4
      EA00C7A68400A98053000000000000000000000000001C8EB80028ADDE003FBB
      E7006DD7F60091C7D3009796960097969600979696009796960045BCD80002D2
      FF0014D3FE001ED2FB000C9ECB0000000000ADADAB00FFFFFF00F5F4F400F5F4
      F400F5F4F400F5F4F400FFFFFF00ACACAA00ACACAA00FFFFFF00F5F4F400F5F4
      F400F5F4F400F5F4F400FFFFFF00ADADAB0000000000000000009B928F00C3DC
      D800CEDFD60000539E008EC1E000006FB500006FB5008EC1E00000539E00CEDF
      D600C3DCD8009B928F0000000000000000000000000000000000A97E5100C6A7
      8400FCF7EF00B38A5F00B8916800FAF2E400F8EFE000FBF3E600B9926900B38B
      5F00FCF7EF00C6A78400A97E510000000000000000001E92BC0027ADDF0031B4
      E3005ACFF40097969600E9E3E200B2B3B300ACA2A200E1B7B5009796960059DC
      FA009CF0FF00B5EFFC003D9BBD0000000000ADADAB00FFFFFF00F2F0F100F2F1
      F100F2F1F100F2F1F100FFFFFF00ACACAA00ACACAA00FFFFFF00F2F1F100F2F1
      F100F2F1F100F2F0F100FFFFFF00ADADAB000000000000000000A4999200CDE3
      DF00CEDFD6000055A300A7CFE600B5D6E900B5D6E900A7CFE6000055A300CEDF
      D600CDE3DF00A4999200000000000000000000000000B18D6800C8A88700FDF9
      F200B58C6000A6764300A5754200B8906600FDF8EF00A26F3A00A7774500A676
      4400B58C6000FDF9F200C8A88700AD865C0000000000148CB8001F9DCD0027AC
      DD0047C5EF0097969600E9E2E000B1B2B200ACA2A200DCB5B400979696007CE4
      FB00ACECF9008ACBE00048A5C40000000000ADADAB00FFFFFF00EEECED00EEEC
      ED00EDECEC00EEECED00FFFFFF00ACACAA00ACACAA00FFFFFF00EEECED00EDEC
      EC00EEECED00EEECED00FFFFFF00ADADAB00000000004474A000AE9F9400E3F1
      EC00CCDFD700388DBA00005CA900005DAB00005DAB00005CA900388DBA00CCDF
      D700E3F1EC00AE9F94004474A0000000000000000000A6754300FFFFFF00C4A4
      8100A3723E00A8784700A6754200B9916700FFFFFE00A4723E00A97A4A00A97A
      4900A4723E00C4A48100FFFFFF00A675430000000000000000000E80AA0020A2
      D30036BCEB0097969600E9E2E000B1B2B200ACA2A200DDB6B4009796960065E1
      FD0068CAE6000579A4000000000000000000AEAEAB00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00F3F3F300FFFFFF00ACACAA00ACACAA00FFFFFF00F4F4F400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00AEAEAB0000000000004F900034688F00FFFF
      FB00CBE0DA00CEE1DB00D3E6E000D6ECE800D6ECE800D3E6E000CEE1DB00CCDF
      DA00FFFFFB0034689000004F90000000000000000000C4A38200C9A98900FFFF
      FC00B48D6200A5744200BE9A7400FFFFFF00FFFFFF00A5744100A97A4900A777
      4400B58D6300FFFFFC00C9A98900BC9873000000000000000000000000001389
      B4000D8FBE0097969600ECE5E200B1B2B200ACA2A200E0B8B600979696001E9A
      C1002293BA00000000000000000000000000AFAFAD00FFFFFF00A5A5A300A7A7
      A500CBCBCA00FFFFFF00FFFFFF00ACACAA00ACACAA00FFFFFF00FFFEFE00CBCB
      CA00A7A7A400A5A5A300FFFFFF00AFAFAD000000000000000000005093004285
      AD00DEEBE200D3E4E100CAE4E700B04B0000AF4B0000CAE4E700D4E5E200DFEB
      E4004185AD000050950000000000000000000000000000000000C5A58300C9AA
      8B00FFFFFF00B68C6200A3723D00A2703B00A2703B00A6764300A6764300B78D
      6300FFFFFF00C9AA8B00C5A58300000000000000000000000000000000000000
      00000000000097969600E5E3E200AEAFAF00ABA1A100D8B6B600979696000000
      000000000000000000000000000000000000CACAC900E9E9E900FFFFFF00E3E2
      E100A7A7A400FFFFFF00FFFFFF00ACACAA00ACACAA00FFFFFF00FFFFFE00A7A7
      A500EBEBEA00FFFFFF00E9E9E900CACAC80000000000000000000060A2000050
      96004387B100EBF4ED00DAEFF000C4722B00C4722B00DBF0F000EBF4ED003D85
      B200004F9900000000000000000000000000000000000000000000000000C5A5
      8300CAAB8C00FFFFFF00B58C6100BA946B00FFFFFE00A3713D00B68E6300FFFF
      FF00CAAB8C00C5A5830000000000000000000000000000000000000000000000
      00000000000097969600B2B2B200A0A0A00099969600ABA0A000979696000000
      00000000000000000000000000000000000000000000B7B7B500E8E8E800FFFF
      FF00A5A5A300FFFFFF00FFFFFF00ACACAA00ADADAA00FFFFFF00FDFDFE00A5A5
      A300FFFFFF00E8E8E800CBCBC9000000000000000000000000000067A90043A2
      D70000549A00438CB600F7FCF800E3F4F500E3F4F600F9FDF9003C88B600004D
      9C00AC9B90000000000000000000000000000000000000000000000000000000
      0000C5A58300CAAC8E00FFFFFF00B38A5F00A06C3600B48B6000FFFFFF00CAAC
      8E00C5A583000000000000000000000000000000000000000000000000000000
      00000000000097969600E1E0E000C6C7C700A5A3A300B3A5A500979696000000
      0000000000000000000000000000000000000000000000000000B8B8B500E9E9
      E900FFFFFF00FFFFFF00FFFFFF00AFAFAD00AFAFAD00FFFFFF00FFFFFF00FFFF
      FF00E9E9E900BDBDBC00000000000000000000000000000000004F9BC800006C
      B100006CB100005CA200448FBA00FFFFFD00FFFFFE003E8CBA000052A000E0EF
      E700A19893000000000000000000000000000000000000000000000000000000
      000000000000C4A58300CBAD8E00FFFFFF00C6A88600FFFFFF00CBAD8F00C4A5
      8300000000000000000000000000000000000000000000000000000000000000
      00000000000097969600E5E4E400EAE9E900BCBCBC00A39E9E00979696000000
      000000000000000000000000000000000000000000000000000000000000B7B7
      B500AFAFAD00AEAEAC00AFAFAD00BCBCBA00C9C9C700AFAFAD00AEAEAC00AFAF
      AD00B7B7B5000000000000000000000000000000000000000000000000000000
      000000000000000000000061A8004F99C1004D98C100005CA800B29F9300D6EC
      E9009F9A97000000000000000000000000000000000000000000000000000000
      00000000000000000000C4A58300CBAE9100FFFFFF00CBAE9100C4A583000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000097969600979696009796960097969600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000006CB000006AB00000000000CDC4BE00A59E
      9B00BEBCBB000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000C4A38200A6754100C4A38200000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BCBCBC00B2B2B200B0B0B000AFAF
      B000AFAFB000AFAFB000AFAFB000AFAFB000AFAFB000AFAFB000AFAFB000AFAF
      B000AFAFB000B0B0B000B2B2B200BCBCBC00BCBCBC00B2B2B200B0B0B000AFAF
      B000AFAFB000AFAFB000AFAFB000AFAFB000AFAFB000AFAFB000AFAFB000AFAF
      B000AFAFB000B0B0B000B2B2B200BCBCBC000000000000000000000000000000
      000000000000BA8D5300B16E1900B16E1900BB8E540000000000BB8E5400B16E
      1900B16E1900BA8D53000000000000000000B1B1B100A2A2A2009F9F9F009F9F
      9F009F9F9F009F9F9F009F9F9F009F9F9F009F9F9F009F9F9F009F9F9F009F9F
      9F009F9F9F009F9F9F00A2A2A200B1B1B100B2B2B200FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00B2B2B200B2B2B200FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00B2B2B2000000000000000000000000000000
      000000000000B16E1900F7C67800EEBA6C00B16E190000000000B16E1800F7C6
      7800F7C67800B16E18000000000000000000A2A2A200FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00A2A2A200B0B0B000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00B0B0B000B0B0B000FFFFFF00FEFFFF00FFFF
      FF00FFFFFF00FFFFFF00FEFFFF00FEFEFF00FEFEFE00FEFEFE00FEFEFE00FEFE
      FE00FEFEFE00FDFEFE00FFFFFF00B0B0B0000000000000000000000000000000
      000000000000B06D1700F1BE7000F2BE7000B06D170000000000B06D1700F1BE
      6F00F1BE6F00B06D17000000000000000000A0A0A000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00A0A0A000AFAFAF00FFFFFF00FFFFFF00403E
      3C0052504D005D5A580066646300716F6D0074726F006A6765005F5D5C005452
      4F0043403F00FFFFFF00FFFFFF00AFAFAF00AFAFAF00FFFFFF00FCFFFF00C674
      1A00C87A2400C7751C00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FDFCFC00FFFFFF00AFAFAF000000000000000000000000000000
      000000000000B06D1700EDB96B00EDB96B00B06D170000000000B06D1700EDB9
      6B00EDB96B00B06D17000000000000000000A0A0A000FFFFFF00454341005F5D
      5C0074716F00646261004A474500FFFFFF00FFFFFF00454240005F5D5C007471
      6F00646261004A484500FFFFFF00A0A0A000AFAFAF00FFFFFF00FDFEFE00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FDFDFE00FFFFFF00AFAFAF00AFAFAF00FFFFFF00F8FCFF00E0BE
      9600CD853500EBD3BC00FFFFFF00434140005A5855006C6A6800716E6C005E5B
      590046444300FCFDFD00FFFFFF00AFAFAF000000000000000000000000000000
      000000000000B06D1700EBB56800EBB56800B06D170000000000B06D1700EBB5
      6800EBB56800B06D17000000000000000000A0A0A000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FEFEFE00FEFEFE00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00A0A0A000B0B0B000FFFFFF00FCFCFB004340
      3F0055535000605D5B006967660074727000777472006D6A680062605F005755
      530045434200FCFCFB00FFFFFF00B0B0B000B0B0B000FFFFFF00F6F8F900F8FF
      FF00F1EBE600C8781F00FAFFFF00FDFEFE00FFFFFE00FFFFFE00FEFFFE00FFFF
      FE00FCFDFB00F7F7F600FFFFFF00B0B0B0000000000000000000000000000000
      000000000000B06D1800E9B16500E9B16500B06D180000000000B06D1800E9B1
      6500E9B16500B06D18000000000000000000A0A0A000FFFFFF0048454300625F
      5F0077747200676564004C4A4800FDFDFC00FDFDFC004845430062605F007774
      7200676564004D4A4800FFFFFF00A0A0A000B0B0B000FFFFFF00F9F7F600FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00F8F7F600FFFFFF00B0B0B000B0B0B000FFFFFF00F3F4F600D293
      4F00D9AA7600CF8F4700F5F8FB00F4F4F300F4F3F200F4F3F200F4F3F200F4F3
      F200F4F2F100F2F1F000FFFFFF00B0B0B0000000000000000000000000000000
      000000000000B06D1700E5AD6100E5AD6100B06E180000000000B06E1800E5AD
      6100E5AD6100B06E18000000000000000000A0A0A000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FAF9F800FAF9F800FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00A0A0A000B0B0B000FFFFFF00F6F6F5004442
      410056545100605E5C006A67670075737000787673006E6B6900636160005856
      540046444300F6F6F500FFFFFF00B0B0B000B0B0B000FFFFFF00EFF1F100F1F6
      FA00F2FAFF00F2F7FC00F1F2F300F1F1F000F1F1F000F1F1F000F1F1F000F1F1
      F000F0F0EF00EFEFEE00FFFFFF00B0B0B000000000000000000000000000B373
      1F00B16E1800AE6B1400E2A85B00E3A95C00B16E180000000000B16E1800E3A9
      5D00E3A95D00B16E18000000000000000000A0A0A000FFFFFF00484644006360
      600077757300686665004D4B4900F7F8F700F7F8F70049464400636160007775
      7300686564004D4B4900FFFFFF00A0A0A000B0B0B000FFFFFF00F3F2F100FEFD
      FC00FFFFFF00FFFFFF00FFFFFF00FFFFFE00FFFFFE00FFFFFF00FFFFFF00FFFF
      FF00FDFCFC00F3F2F100FFFFFF00B0B0B000B0B0B000FFFFFF00EDEDED00EFF2
      F700C7741800F0F3F800F1F1F100F5F4F300F7F6F500F6F5F400F6F5F400F7F6
      F500F5F4F300EFEEED00FFFFFF00B0B0B0000000000000000000B4731D00D598
      4B00E1A45A00DFA35800DEA15500E1A45900B16E180000000000B16E1800E1A4
      5900E1A45900B16E18000000000000000000A0A0A000FFFFFF00FDFCFB00FFFF
      FF00FFFFFF00FFFFFF00FDFCFB00F4F3F200F4F3F200FDFCFB00FFFFFF00FFFF
      FF00FFFFFE00FCFBFA00FFFFFF00A0A0A000B0B0B000FFFFFF00F0F0EF004543
      420056545200615F5D006B69680076747100787674006E6C6A00636160005957
      540047454400F0F0EF00FFFFFF00B0B0B000B0B0B000FFFFFF00E9EBEB00ECF2
      F800C9781E00EDF3F800F0F2F200454341005D5A58006F6D6B0073716E00605E
      5C0049474600EFEFEE00FFFFFF00B0B0B00000000000B2721E00D3944600DC9F
      5300DA9D5200D99D5100DA9D5100DDA05500B16F190000000000B16F1900DDA1
      5600DDA15600B16F19000000000000000000A0A0A000FFFFFF00494644006361
      600078767400696766004F4C4A00F2F2F100F2F2F1004A474500646261007876
      7400686665004E4B4900FFFFFF00A0A0A000B0B0B000FFFFFF00EDECEB00F8F7
      F600FDFCFB00FCFCFB00FBFAF900FAF9F800F9F9F800FBFAF900FCFBFA00FCFC
      FB00F8F7F600EDECEB00FFFFFF00B0B0B000B0B0B000FFFFFF00E8E8E900EBF1
      F800CA7A2100EBEFF500ECECEC00F0EFEE00F2F1F000F1F0EF00F1F0EF00F2F1
      F000F0EFEE00EAE9E800FFFFFF00B0B0B00000000000B26E1800DEA35E00D898
      4D00D7984D00D7984D00D7984D00DA9C5200B26F190000000000B26F1900DB9C
      5300DB9C5300B26F19000000000000000000A0A0A000FFFFFF00F6F5F400FBFA
      F900FBFAF900FBFAF900F7F6F500EFEEED00EFEEED00F8F7F600FBFAF900FBFA
      F900FAF9F800F6F5F400FFFFFF00A0A0A000B0B0B000FFFFFF00EAEAE9004442
      410055535100605E5C006967660075727000787573006D6B680062605F005855
      530047444300E9EAE900FFFFFF00B0B0B000B0B0B000FFFFFF00E4E7E900CF93
      4F00CA781E00E6EBEF00E5E7E600E6E6E500E6E7E600E6E7E600E6E6E500E6E7
      E600E5E6E500E3E4E200FFFFFF00B0B0B00000000000B26E1700E7BB8900D593
      4600D5934700D5944800D5944900D8984D00B16E180000000000B16E1800D898
      4D00D8984E00B26F19000000000000000000A0A0A000FFFFFF00484643006260
      5F0077757300686564004E4C4900EBECEB00ECECEB0049474400636060007775
      7300676564004D4B4800FFFFFF00A0A0A000B0B0B000FFFFFF00E3E2E100E9E8
      E600EBEAE900EBEAE900EAE9E800E9E8E700E9E8E700EAE9E800EBEAE900EBEA
      E900E9E8E600E3E2E100FFFFFF00B0B0B000B0B0B000FFFFFF00E0E1E100E2E5
      E800DDD0C100E2E3E400E1E0DF00E1E0DF00E1E0DF00E1E0DF00E1E0DF00E1E0
      DF00E1DFDE00E0DFDE00FFFFFF00B0B0B00000000000B4731E00CD985900E5BB
      8C00DBA56900D6995500D6995500D99B5800AF6B1300B16D1500AF6B1300D99C
      5900DAA15F00B26F18000000000000000000A0A0A000FFFFFF00E8E7E600EAE9
      E800EAE9E800EAE9E800E9E7E600E5E4E300E5E4E300E9E8E700EAE9E800EAE9
      E800EAE9E800E8E7E600FFFFFF00A0A0A000B2B2B200FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00B2B2B200B2B2B200FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00B2B2B2000000000000000000B26F1800BD80
      3200D19D5E00DFAF7A00E1B38000E2B48100E3B68300E4B68400E3B68300E2B4
      8200E4B78500B26F18000000000000000000A2A2A200FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00A2A2A200BABABA00B2B2B200B0B0B000B0B0
      B000B0B0B000B0B0B000B0B0B000B0B0B000B0B0B000B0B0B000B0B0B000B0B0
      B000B0B0B000B0B0B000B2B2B200BABABA00BABABA00B2B2B200B0B0B000B0B0
      B000B0B0B000B0B0B000B0B0B000B0B0B000B0B0B000B0B0B000B0B0B000B0B0
      B000B0B0B000B0B0B000B2B2B200BABABA000000000000000000000000000000
      0000B5752100B26E1600B16E1600B16E1600B16E1600B26E1600B16E1600B16E
      1600B26F1800000000000000000000000000ABABAB00A2A2A200A0A0A0009F9F
      9F009F9F9F009F9F9F009F9F9F009F9F9F009F9F9F009F9F9F009F9F9F009F9F
      9F009F9F9F00A0A0A000A2A2A200ABABAB000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000056695000566
      9500056695000566950005669500000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000008750D000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000001B7D000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000374D
      CC00384DCB00384DCC000000000000000000A4676900A4676900A4676900A467
      6900A4676900A4676900A4676900A4676900A46769000274A90046D3E9001CD9
      FF002EDAFF007AEDFF0023A4D300056695000000000000000000056695000566
      9500056695000566950005669500056695000000000000000000000000000875
      0D0008750D000000000000000000000000000000000000000000056695000566
      9500056695000566950005669500056695000000000000000000001B7D00001B
      7D000000000000000000000000000000000000000000C6C5C300B9B4AB00B0AA
      9E00AFA99D00AEA89C00AEA89C00B0AA9C00B9B199006C76B800324ED900375C
      F900375DFA00385DF9003852D70000000000B7918700FCEACE00F3DABC00F2D5
      B100F0D0A700EECB9E00EDC79300EDC28B00E9BD81000274A90064F5FE0012CE
      FE0021CFFF0069E1FB001DA4D60005669500000000000274A90030C9E90012CB
      FE0020CEFE0054DEFF0074E0F80030B0DA000268A3000000000008750D004FDC
      7B0008750D00000000000000000000000000000000000274A90030C9E90012CB
      FE0020CEFE0054DEFF0074E0F80030B0DA000268A30000000000001B7D00362C
      FF00001B7D00000000000000000000000000BDB9B200B4AEA200C5BEB300D4CA
      C200E1D7CF00E8DED600EFE4DD00EDE2D800F0E3CE00213CCE003E62FC003B60
      FA003A5DF8003C60FA004165FB00344BCC00B7938A00FEEFDA00F6E0C600F2DA
      BC00F2D5B200EFD0A900EECB9E00EDC79600EBC28C000274A900A3F7FC009EEA
      FB00BFEFFC00C9F2FB007FCFEA00056695000274A90073FAFE003FE3FE0012CB
      FE0020CEFE0054DEFF0074E0F80030B0DA000386C10008750D004FDC7B004CDA
      770008750D0008750D0008750D0008750D000274A90073FAFE003FE3FE0012CB
      FE0020CEFE0054DEFF0074E0F800001B7D00001B7D00001B7D00001B7D002F27
      FF00362CFF00001B7D000000000000000000B1AB9F00C8C1B600CFC7BF00D6CC
      C500DCD3CA00E4D9D200EBE0D900E8DED400EEE0CA001F39CB00A6B8FF00FFFF
      FF00FFFFFF00FFFFFF00A9BAFF003148CA00BA978F00FFF4E500F7E5CF00F4E0
      C500F3DABB00F2D5B100F0D0A600EECB9E00EDC795000274A90062BDD7001B97
      C2001184B4002D96BD00499FC500056695000274A90073FAFE003FE3FE0012CB
      FE0020CEFE0054DEFF0074E0F80030B0DA0008750D004FDC7B004FDC7B0048D7
      710038CB590027BF410027BF410008750D000274A90073FAFE003FE3FE0012CB
      FE0020CEFE0054DEFF0074E0F800001B7D000016E6000016E600040FFF002420
      FF00362CFF00362CFF00001B7D0000000000B0AB9E00C7C0B600CDC4BB00D3CA
      C200DAD1C800E2D7CF00ECE1DA00E7DBD100EBDDC9001C37CA005875FE005775
      FE005473FD005776FE005D79FF00334ACB00C09E9500FFFBF000F8EADC00F6E3
      CF00F4E0C600F2D9BC00F2D5B100F0D0A900EDCB9E000274A9003BC2DA001ACA
      F3002DD5FE006ADCF3001B97C200056695000274A90073FAFE003FE3FE0012CB
      FE0020CEFE0054DEFF0074E0F80008750D004FDC7B004FDC7B004FDC7B0043D3
      690032C7510023BC3B0027BF410008750D000274A90073FAFE003FE3FE0012CB
      FE0020CEFE0054DEFF0074E0F800001B7D000016E6000018DF00000FF9001718
      FF00362CFF00362CFF00362CFF00001B7D00B0AA9E00CAC3B900EAE5DD00F7F3
      EB00FFFBF400FDFAF300FDF9F200FFFAF300FFFFF3008993DD003954DE006C86
      FF00728AFF006F89FF00465EDD0000000000C6A49A00FFFFFC00FAF0E600F8EA
      DA00F7E5CF00F4E0C500F2DABA00F2D5B100F0D0A7000274A90064F5FE0012CE
      FE0021CFFF006EE0FB001DA4D600056695000274A90078FBFE0068F6FF0055F6
      FE005FFEFF0078FBFE0089FBFE0048CFF20008750D004FDC7B004CDA76003ECF
      61002CC3480020BA370027BF410008750D000274A90078FBFE0068F6FF0055F6
      FE005FFEFF0078FBFE0089FBFE00001B7D000016E600001ADA000014EF000E14
      FF002D27FF00362CFF00001B7D0000000000C1BDB600F9F3ED00D8D1C900C2B8
      B000BFB6AE00C5BAB200C8BEB500C6BCB300C4BAAF00D1C5B2006771BA00233E
      D0002942CE002F47CD000000000000000000CBA99E00FFFFFF00FEF7F200FAEF
      E600F8EAD900F7E3CF00F6E0C500F2DABB00F2D4B1000373A60081FCFF0052FA
      FF0067FFFF0095FCFF0036C4EF00056695000274A900A7E9F3001CAAD3000791
      C5000787BB00108BBC001F91BF001479AD0079C0DC0008750D0048D7710037CB
      590008750D0008750D0008750D0008750D000274A900A7E9F3001CAAD3000791
      C5000787BB00108BBC001F91BF00001B7D00001B7D00001B7D00001B7D00030C
      FF002420FF00001B7D000000000000000000BBB7AF00A39A8F00BAB2A700CAC1
      B800DED5CC00E5DBD300ECE1DA00E8DED500E1D7CE00D1C6BB00C6BBAA00B4A7
      9000C8C1AE00000000000000000000000000CFAC9F00FFFFFF00FFFEFC00FCF6
      F000FAEFE600F7EADA00F6E3CF00F4E0C500F3D9BB000274A900C2EBF400FEFE
      FE00CEFFFF00BDFFFF0088F8FB00056695000274A90031B5D3003FE3FE0012CB
      FE0020CEFE0054DEFF0074E0F80030B0DA000268A30003689A0008750D0032C7
      510008750D000000000000000000000000000274A90031B5D3003FE3FE0012CB
      FE0020CEFE0054DEFF0074E0F80030B0DA000268A30003689A00001B7D00000F
      F900001B7D00000000000000000000000000B1AB9F00C9C2B900CFC7BF00D5CC
      C400DCD3CA00E3D9D100EADFD800E5DCD300DED4CC00D8CFC500D3CBC100CEC6
      BA00B7B09D00000000000000000000000000D4B0A100FFFFFF00FFFFFF00FFFE
      FC00FEF7F000FAEFE500F8EAD900F7E5CE00F6DEC400F3D9B8000274A9000274
      A9000274A9000274A9000274A900000000000274A90073FAFE003FE3FE0012CB
      FE0020CEFE0054DEFF0074E0F80030B0DA000386C10005669500000000000875
      0D0008750D000000000000000000000000000274A90073FAFE003FE3FE0012CB
      FE0020CEFE0054DEFF0074E0F80030B0DA000386C10005669500001B7D00001B
      7D0000000000000000000000000000000000B0AB9E00C7C0B600CCC4BB00D3C9
      C100DAD0C700E1D7CF00EBE1DA00E4D9D100DCD1C900D5CCC200CEC6BD00CAC1
      B900B1AB9E00000000000000000000000000D9B5A100FFFFFF00FFFFFF00FFFF
      FF00FFFEFC00FCF7F000FAEFE500F8E9D900F8E7D100FBEACE00DECEB400B6AA
      9300A46769000000000000000000000000000274A90073FAFE003FE3FE0012CB
      FE0020CEFE0054DEFF0074E0F80030B0DA000386C10005669500000000000000
      000008750D000000000000000000000000000274A90073FAFE003FE3FE0012CB
      FE0020CEFE0054DEFF0074E0F80030B0DA000386C10005669500001B7D000000
      000000000000000000000000000000000000AFAA9D00C8C1B700E8E3DB00F5F0
      E800FDF8F200FCF8F100FBF7F000FCF7F100FCF8F100F6F0EA00E9E2DB00CAC2
      BA00AFA99D00000000000000000000000000DDB7A400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFEFC00FCF6EF00FCF3E600EDD8C900B68A7B00A17B6F009C76
      6700A46769000000000000000000000000000274A90073FAFE003FE3FE0012CB
      FE0020CEFE0054DEFF0074E0F80030B0DA000386C10005669500000000000000
      0000000000000000000000000000000000000274A90073FAFE003FE3FE0012CB
      FE0020CEFE0054DEFF0074E0F80030B0DA000386C10005669500000000000000
      000000000000000000000000000000000000AEA89C00FBF5EF00EEE7DE00E0D8
      CE00DDD5CC00DDD4CB00DDD4CB00DDD4CB00DDD5CC00E0D7CE00EDE6DE00FBF6
      EF00AEA89C00000000000000000000000000E2BCA500FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFEFB00FFFEF700DAC1BA00AD735B00E19E5500E68F
      3100B56D4D000000000000000000000000000274A90078FBFE0068F6FF0055F6
      FE005FFEFF0078FBFE0089FBFE0048CFF200058BC70005669500000000000000
      0000000000000000000000000000000000000274A90078FBFE0068F6FF0055F6
      FE005FFEFF0078FBFE0089FBFE0048CFF200058BC70005669500000000000000
      000000000000000000000000000000000000AFA99D00E1D8CE00E1D7CE00DFD6
      CC00DFD5CB00DFD5CB00DFD5CB00DFD5CB00DFD5CB00DFD6CC00E1D7CE00E1D8
      CE00AFA99D00000000000000000000000000E6BFA700FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00DCC7C500B8826500F8B55C00BF7A
      5C00000000000000000000000000000000000274A900FBFFFF00F0FFFF00C6FF
      FF00A0FFFF0098FFFF0098FFFF0092FFFF0055F6FE0005669500000000000000
      0000000000000000000000000000000000000274A900FBFFFF00F0FFFF00C6FF
      FF00A0FFFF0098FFFF0098FFFF0092FFFF0055F6FE0005669500000000000000
      000000000000000000000000000000000000D0CDC500B6B0A400D6CFC400E6DE
      D500EFE7DD00EEE6DC00EEE6DC00EEE6DC00EFE7DD00E6DED500D6CFC400B6B0
      A400D0CDC500000000000000000000000000E4BCA400FBF4F000FBF4EF00FAF3
      EF00FAF3EF00F8F2EF00F7F2EF00F7F2EF00D8C2C000B77F6200C1836C000000
      000000000000000000000000000000000000000000000479AF00EDFAFC00DCFF
      FF00B7FFFF0098FFFF0092FFFF0083FAFB00086B9A0000000000000000000000
      000000000000000000000000000000000000000000000479AF00EDFAFC00DCFF
      FF00B7FFFF0098FFFF0092FFFF0083FAFB00086B9A0000000000000000000000
      0000000000000000000000000000000000000000000000000000C5C0B700AEA9
      9C00AEA89C00AEA89C00AEA89C00AEA89C00AEA89C00AEA99C00C5C0B7000000
      000000000000000000000000000000000000E8C4AD00EBCBB700EBCBB700EACB
      B700EACAB600EACAB600EACAB600EACAB600E3C2B100A56B5F00000000000000
      00000000000000000000000000000000000000000000000000000274A9000274
      A9000274A9000274A9000274A9000274A9000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000274A9000274
      A9000274A9000274A9000274A9000274A9000000000000000000000000000000
      00000000000000000000000000000000000000000000676363006B676700706E
      6C00000000000000000000000000676363006A676500706E6C00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000706E6C006A6765006763630000000000000000000000
      0000706E6C006B67670067636300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000615E5D0085848200BDBCBA00C3C3
      C10078757300000000005F5B5B0085848200BDBCBA00C3C2C000777472000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000077747200C3C2C000BDBCBA00858482005F5B5B00000000007875
      7300C3C3C100BDBCBA0085848200615E5D000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000004497D1004B9AD2000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000009E
      5E00009D5D00009E5E0000000000000000005F5C5B0081807E00B7B6B400BEBD
      BB00757270006E6C6A005C59580080807E00B7B6B400BEBDBB00757371000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000075737100BEBDBB00B7B6B40080807E005C5958006E6C6A007572
      7000BEBDBB00B7B6B40081807E005F5C5B000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000004194D00089EFFF004397D10000000000C6C5C300B9B4AB00B0AA
      9E00AFA99D00AEA89C00AEA89C00B0A89D00BDABA2004EA37B0000A5670000BA
      850077DFC40000BA860000A66A00000000005F5C5B00C3C2C100E1E0DF00E5E5
      E40073716E00BBB9B80059565500C1C1C000E1E0DF00E6E5E400757371000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000075737100E6E5E400E1E0DF00C1C1C00059565500BBB9B8007371
      6E00E5E5E400E1E0DF00C3C2C1005F5C5B000000000000000000000000000000
      0000000000000000000000000000000000007DB3D5003896D6003592D5003793
      D4003B93D20087EEFF0056ADDE0000000000BDB9B200B4AEA200C5BEB300D4CA
      C200E1D7CF00E8DED600EFE4DD00EEE1DA00F6DBD8000099530000BF8A0000BB
      8200FFFFFF0000BB820000C08C00009E5E00615E5D0064605F00656261006A68
      660000000000BAB8B70000000000605C5C0063615E006C6A6800797775000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000797775006C6A680063615E00605C5C0000000000BAB8B7000000
      00006A6866006562610064605F00615E5D004D9BD2004094D0003E92CF003F92
      CE003F92CE003F92CE003F92CF0045A3DE0075B7D400FDDDA900FFEBB700FFEE
      C2006AA9CF003B92D1000000000000000000B1AB9F00C8C1B600CFC7BF00D6CC
      C500DCD3CA00E4D9D200EBE0D900EADDD600F3D8D5000096500073E4CA00FFFF
      FF00FFFFFF00FFFFFF0077E5CC00009C5C0000000000615E5D009A989700CBC9
      C60076727100BBBAB9005C5958009A989700CCCAC70078757400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000078757400CCCAC7009A9897005C595800BBBAB9007672
      7100CBC9C6009A989700615E5D00000000004094D000ABFAFF0094F2FF0094F2
      FF0094F2FF0095F2FF0095F4FF004AB5ED00F6D09900FFEDD000FFEAC500FFF4
      CC00FFEEC1003692D3000000000000000000B0AB9E00C7C0B600CDC4BB00D3CA
      C200DAD1C800E2D7CF00ECE1DA00E7DBD300F0D6D20000954E0000CA940000C7
      8F00FFFFFF0000C88F0000CC9800009D5D000000000000000000686464006D6B
      6900000000006F6D6B0000000000666362006E6C6A0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000006E6C6A0066636200000000006F6D6B000000
      00006D6B69006864640000000000000000003D92CF00AEF4FF0086E7FF0087E7
      FE0087E7FE0088E7FE0089EAFF004BBCF200FDCD9000FFF7E900FAEED500FFEA
      C500FFEBB600409FDC000000000000000000B0AA9E00CAC3B900EAE5DD00F7F3
      EB00FFFBF400FDFAF300FDF9F200FFFAF300FFFEFA0068C49D0000AB6A0000D3
      9C0075EDD30000D39E0000AE7200000000000000000000000000625F5D00B9B9
      B7007977750000000000615F5D00BAB9B7007977750000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000079777500BAB9B700615F5D00000000007977
      7500B9B9B700625F5D0000000000000000003C92CE00B5F3FF007CE1FD007EE1
      FC007FE1FC0080E1FC0081E3FE0053C4F900F2C88D00FEEBD200FFF7E900FFED
      D000FCDCAA003A99DA000000000000000000C1BDB600F9F3ED00D8D1C900C2B8
      B000BFB6AE00C5BAB200C8BEB500C6BBB300C5B8B100D7BEBB0047A27800009B
      5400009A5600009C5B0000000000000000000000000000000000646260006E6C
      6A007A7876000000000062605E006D6B69007A78760000000000000000004081
      3500008C4A00000000000000000000000000000000000000000000000000008C
      4A004081350000000000000000007A7876006D6B690062605E00000000007A78
      76006E6C6A006462600000000000000000003C92CF00BFF4FF0071DDFC0073DC
      FB0075DCFB0078DDFB007ADEFC0068D4FC0088C7D500F2C88D00FDCD9000F6D0
      9A007DB6CC00429FDA000000000000000000BBB7AF00A39A8F00BAB2A700CAC1
      B800DED5CC00E5DBD300ECE1DA00E8DED500E1D6CE00D2C4BD00CAB6B000BA9F
      9A00CDBBB7000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000085
      3D004ED4A8000088460000000000000000000000000000000000008846004ED4
      A80000853D000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000003D93D000DFFFFF00DAF9FF00DBF8
      FF00DEF9FF0072DBFC0074DAFB0073DAFC0063D2FD0055C8FA004EBFF50049B8
      EE0079CEF5003E94D1000000000000000000B1AB9F00C9C2B900CFC7BF00D5CC
      C400DCD3CA00E3D9D100EADFD800E5DCD300DED4CC00D8CFC600D3CAC100CFC4
      BD00BAACA2000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000034A27C00008134000081380000B8
      7B0011DCA90062D3AE000087440000000000000000000087440062D3AE0011DC
      A90000B87B00008138000081340034A27C000000000000000000000000000000
      0000000000000000000000000000000000004095D100368ECD00348BCB00358A
      CA00368ACA005ABCEA006DD8FB0069D5FA0067D5FA0067D5FB0066D5FC0065D6
      FC00BCF2FF003D93D0000000000000000000B0AB9E00C7C0B600CCC4BB00D3C9
      C100DAD0C700E1D7CF00EBE1DA00E4D9D100DCD1C900D5CCC200CEC6BD00CAC1
      B900B2AB9F000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000008233005AE8C80000CF9C0000CD
      9B0000CC9A0012D3A70072D7B900008A4800008A480072D7B90012D3A70000CC
      9A0000CD9B0000CF9C005AE8C800008233000000000000000000000000000000
      0000000000000000000000000000000000003E94D000C5F7FF0074DEFE0076DE
      FD0077DFFE0050A9DC0054B8E800D9F7FF00D5F6FF00D5F6FF00D5F6FF00D5F7
      FF00DAFBFF003D94D0000000000000000000AFAA9D00C8C1B700E8E3DB00F5F0
      E800FDF8F200FCF8F100FBF7F000FCF7F100FCF8F100F6F0EA00E9E2DB00CAC2
      BA00B0A99D000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000008234006DE5D0005BDEC50060DD
      C40000C4990000C59B0083E5D200008A4700008A470083E5D20000C59B0000C4
      990060DDC4005BDEC5006DE5D000008234000000000000000000000000000000
      0000000000000000000000000000000000003C92CF00CBF6FF006AD6FA006DD6
      FA006CD7FA006CD9FC0047A8DD00318ACB002F8ACB002F8ACB002F8ACB00308B
      CB00358FCD004095D1000000000000000000AEA89C00FBF5EF00EEE7DE00E0D8
      CE00DDD5CC00DDD4CB00DDD4CB00DDD4CB00DDD5CC00E0D7CE00EDE6DE00FBF6
      EF00AEA89C000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000991560002995A0007985B000DBB
      950000BE9B0095E5D6001B975C0000000000000000001B975C0095E5D60000BE
      9B000DBB950007985B0002995A00099156000000000000000000000000000000
      0000000000000000000000000000000000003B92CF00D5F7FF0060D1F90061D0
      F800B5EBFD00DAF8FF00DCFBFF00DDFDFF00DDFDFF00DDFDFF00DDFDFF00DDFE
      FF00E3FFFF004096D1000000000000000000AFA99D00E1D8CE00E1D7CE00DFD6
      CC00DFD5CB00DFD5CB00DFD5CB00DFD5CB00DFD5CB00DFD6CC00E1D7CE00E1D8
      CE00AFA99D000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000087
      40009EE7E0001E995E00000000000000000000000000000000001E995E009EE7
      E000008740000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000003D94D000DCFCFF00D8F7FF00D8F7
      FF00DBFAFF00358ECD003A92CF003B92CF003B93CF003B93CF003B93CF003B93
      D0003E95D0004F9ED5000000000000000000D0CDC500B6B0A400D6CFC400E6DE
      D500EFE7DD00EEE6DC00EEE6DC00EEE6DC00EFE7DD00E6DED500D6CFC400B6B0
      A400D0CDC5000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000001083
      39001B9D64000000000000000000000000000000000000000000000000001B9D
      6400108339000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000004F9ED5003D94D0003A92CF003A92
      CF003D94D00053A1D50000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C5C0B700AEA9
      9C00AEA89C00AEA89C00AEA89C00AEA89C00AEA89C00AEA99C00C5C0B7000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000B5B5B300B0B0AE00AEAEAC00ADADAB00ADADAB00ADAD
      AB00ADADAB00AEAEAB00AFAFAD00B5B5B3000000000000000000000000000000
      00000000000000000000C0BCB600B1B0AE00AEAEAB00ADADAB00ADADAB00ADAD
      AB00ADADAB00AEAEAB00AFAFAD00B5B5B3000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000004780
      AB00487FAA004881AC000000000000000000B1B1B100A2A2A200A09FA000A09F
      A000A1A0A000A09FA0009F9F9F009F9FA0009FA0A100A0A0A200A0A0A200A0A0
      A200A0A0A200A0A0A100A2A2A200B1B1B1000000000000000000000000000000
      00000000000000000000B0B0AE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00B0B0AD006B87A500406893003F6893004068
      93003E679300335F8F00BBB7B000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00B0B0AD000000000000000000000000000000
      00000000000000000000000000000000000000000000000000003E81B300739D
      BF001FADFF0092CEEA004491C60000000000A2A2A200FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00A2A2A2000000000000000000000000000000
      00000000000000000000B0B0AD00F6F6F500ECECEB00FBFAFA00FDFDFD00FCFC
      FC00FBFBFC00FCFCFC00FFFFFF00AEAEAB003F6A9400568AB0004C82AB004D82
      AB004B81AB00417BA800B9B4AD00FFFFFF00FCFCFC00FBFBFC00FBFBFC00FBFB
      FC00FBFBFC00FCFCFC00FFFFFF00AEAEAB000000000000000000000000000000
      00007F7D7C007B7A78007B7978007B79780085817E005B7D9700A29A9200AFA3
      9B00A0C2D800B0ECFF003F90C60000000000A0A0A000FFFFFF00FFFFFF00FFFF
      FF0000792C00FFFFFF00FFFFFF00FFFFFF00D2944F00CA7D2800D8A36700D9A3
      6800C97C2600D2914900FFFFFF00A0A0A100B4B4B200AFAFAD00AEAEAB00ADAD
      AB00ADADAB00ADADAB00ACACAA00A9A9A700A8A8A600B8B7B600FBFAFA00F8F6
      F600F7F6F600F7F6F600FFFFFF00ADADAB003F6A95006594BB004C83AE004E83
      AE004C82AE00427DAC00B8B3AC00FFFFFF00F7F6F600F7F6F600F7F6F600F7F6
      F600F7F6F600F7F6F600FFFFFF00ADADAB000000000000000000888785009C9D
      9D00D1D3D500E3E5EA00E2E4E900E3E4E900D1D1D3009C9A9A0083807D00C6C2
      BD00F4EBE400BFDEEA003F92CA0000000000A1A0A000FFFFFF0049AE8100007D
      33000081380000782B00FFFFFF00FFFFFF00C97C2700CB833200D69D6000CC84
      3500CA812F00F5EDE500FFFFFF009FA0A000B0B0AD00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00A8A8A500F9F8F800F5F4
      F400F4F3F300F4F3F300FFFFFF00ADADAB003F6B950074A1C3004F86B1005187
      B2004F86B2004581B000B8B2AB00FFFFFF00F4F3F300F4F3F300F4F3F300F4F3
      F300F4F3F300F4F3F300FFFFFF00ADADAB000000000089888700B4B3B600E6E4
      DF00E9CD9A00F1CA7E00F5D38800F9DA8D00F2E1AD00E6E5E000B0AEB000908B
      8A00EDE3DB00368FCA000000000000000000A2A0A100FFFFFF00007A2D00FFFF
      FF00007A2E00FFFFFF00FEFBFE00FAFFFF00CF8C4200D49C5C00FFFFFF00CC84
      3500CB802E00FBFFFF00FFFFFF009F9F9F00AEAEAB00FFFFFF00FCFCFC00FBFB
      FC00FBFBFC00FBFBFC00FBFBFC00FCFCFC00FFFFFF00A7A7A500F5F5F400F1F1
      F000EFEFEE00EFEFEE00FFFFFF00ADADAB003F6B970082ABCC005088B500528A
      B6005189B6004784B500B8B2AB00FFFFFF00F0F0EF00F0F0EF00F0F0EF00F0F0
      EF00EFEFEE00EFEFEE00FFFFFF00ADADAB0000000000A2A1A200EBE6E200E9BB
      7500ECC47C00F1D08900F5DA9400FAE39C00FDE89E00FBE39B00EBE8E300A09C
      9C005B87A500000000000000000000000000A2A0A100FFFFFF0000762600FFFF
      FF00FFFCFF00FCF9FB00F7F7F800F7FCFF00F1ECE600D1914A00DEB68B00CD85
      3600CB802E00F8FFFF00FFFFFF009F9F9F00ADADAB00FFFFFF00F7F6F600F7F6
      F600F7F6F600F7F6F600F7F6F600F7F6F600FFFFFF00A7A7A500F1F1F100EDED
      EC00EBEBEA00EBEBEA00FFFFFF00ADADAB003E6C970091B6D500528BBA00558C
      BB00548CBB004B88BB00B8B2AB00FFFFFF00ECECEB00EDEDEC00EDEDEC00ECEC
      EB00EBEBEA00EBEBEA00FFFFFF00ADADAB0087858400DCDFE100E6C28F00EBC4
      8A00EED09700F1D28E00F5DD9800FBEAA200FFF1A900FCE89D00F5E2AE00DBDC
      DE008B868400000000000000000000000000A0A0A000FFFFFF00FEF7FB00FAF9
      FE00F8FAFF00F6FAFF00F5F8FD00F5FBFF00CC843400D1934D00E0BE9800CD85
      3600CB802D00F6FCFF00FFFFFF009F9F9F00ADADAB00FFFFFF00F4F3F300F4F3
      F300F4F3F300F4F3F300F4F3F300F4F3F300FFFFFF00A8A8A500EDECEC00F4F3
      F300FFFFFF00FFFFFF00FFFFFF00AEAEAB003E6D97009FC1DD00538EBD005791
      BF005691BF004D8CBF00B7B1AA00FFFFFF00E9E8E800EAE8E900E9E8E800F3F2
      F200FFFFFF00FFFFFF00FFFFFF00AEAEAB0085848200F4F8FC00E1A95D00F3DB
      B700F1D9AC00F2D9A000F5DC9600F8E59E00FBEAA200F9E39C00F7D98B00F3F4
      FA00858382000000000000000000000000009F9F9F00FFFFFF00F2F5F800DBAF
      8000CC823100CA7C2600D9AB7800F4FDFF00CA7C2700D1914D00F5FFFF00CC83
      3300CA7E2A00F2F8FE00FFFFFF009F9F9F00ADADAB00FFFFFF00F0F0EF00F0F0
      EF00F0F0EF00F0F0EF00EFEFEE00EFEFEE00FFFFFF00A8A8A500E9E8E700FFFF
      FF00CACAC900A4A4A200FFFFFF00AFAFAD003E6E9900ACCAE4005691C1005A93
      C3005993C300508FC300B7B1AA00FFFFFF00E5E4E300E6E5E400E5E4E300FFFF
      FF00CACAC900A4A4A200FFFFFF00AFAFAD0088858400F7FCFF00DEA45800F6E8
      D100F3DFBB00F3DCAD00F4DCA300F5DC9700F5DD9800F4DA9300F3D18600F5F9
      FF00888584000000000000000000000000009F9F9F00FFFFFF00EFF3F800C979
      2100F1F9FF00CE8A3F00CB7E2A00F1FAFF00E1C9AF00CD843400CA7D2800CB7E
      2900D8A97500EFF1F500FFFFFF009F9F9F00ADADAB00FFFFFF00ECECEB00EDED
      EC00EDEDEC00ECECEB00EBEBEA00EBEBEA00FFFFFF00A8A8A500E4E4E300FFFF
      FF00A4A4A200FFFFFF00E9E9E900CACAC8003E6F9A00B9D5EA005794C6005B97
      C8005B98C8005294C900B7B1AA00FFFFFF00E0E0DF00E0E0DF00E0E0DF00FFFF
      FF00A4A4A200FFFFFF00E9E9E900CACAC8008A888600FDFFFF00DC9E5300F6E7
      D400F6E6CD00F4DFBA00F3DCAD00F2D99F00F1D28D00F0CF8900EEC87B00FBFD
      FF008A8786000000000000000000000000009F9F9F00FFFFFF00ECF2F700CA7B
      2500EDF7FF00CF8A3F00CB7F2A00EDF4FB00ECF0F400EDF2F700EAEBEB00EAEB
      EA00ECF0F400EAECEC00FFFFFF009F9F9F00ADADAB00FFFFFF00E9E8E800EAE8
      E900E9E8E800F3F2F200FFFFFF00FFFFFF00FFFFFF00A9A9A600FFFFFF00FFFF
      FF00FFFFFF00E9E9E900CBCBC900000000003D709A00C6DEF0005997CB005E9A
      CD005E9BCE005798CF00BAB3AB00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00E9E9E900CBCBC90000000000908D8C00EAEDF100E5B98800ECCC
      A300F9F1E500F6E6CC00F3DFBB00F1D9AC00EFD09700EBC37B00F0D3A100E9EB
      F0008F8D8B000000000000000000000000009F9F9F00FFFFFF00EAEFF500CB7D
      2700CF8E4700CB7E2900D5A06600EAEDF100E9E9E900E8E8E800E9E9E900E9E9
      E900E8E8E800E7E6E500FFFFFF009F9F9F00AEAEAB00FFFFFF00E5E4E300E6E5
      E400E5E4E300FFFFFF00CACAC900A4A4A200FFFFFF00ADADAA00AFAFAD00AEAE
      AC00AFAFAD00CACAC80000000000000000003E729D00D4E7F8005997CB007F95
      A70099938E0099938E00B0AFAD00B5B3AE00B2B0AC00B3B0AA00B4B0AB00B1B0
      AC00B0AFAD00CACAC800000000000000000000000000B3B2B200FEFAF500DBA0
      5800ECCBA200F9ECDC00F6E7D000F2DDBB00ECC99500E7B97200FFFDF900B2B1
      B200000000000000000000000000000000009FA0A000FFFFFF00E6EEF500CA7C
      2400E8F3FD00E7EEF400E6EAEE00E5E7E700E5E5E400E4E5E400E4E5E400E4E5
      E400E4E4E300E3E3E200FFFFFF009F9F9F00AEAEAC00FFFFFF00E0E0DF00E0E0
      DF00E0E0DF00FFFFFF00A4A4A200FFFFFF00E9E9E900CCCCCB00000000000000
      00000000000000000000000000000000000042759F00ADD2F4005997CB00A7A1
      9B00D6CBC500D6CBC500D6CBC500A7A19B005997CB00A6D0F600336D9E000000
      000000000000000000000000000000000000000000009D9B9A00CDCDCF00FFFD
      FA00E7BC8A00DA9C5100DDA25600DEA65A00ECC89600FFFFFC00CCCCCE009D9A
      9A0000000000000000000000000000000000A0A0A000FFFFFF00D0995B00C978
      1E00E2E2E000E2E3E400E1E1E100E1E0DF00E1E0DF00E1E0DF00E1E0DF00E1E0
      DF00E1E0DF00E1DFDE00FFFFFF00A0A0A000AFAFAD00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00E9E9E900CBCBC90000000000000000000000
      00000000000000000000000000000000000080A3C0003E77A4003E77A4009993
      8E00E5DDD800E5DDD800E5DDD80099938E003E77A4003C76A4007DA2C0000000
      00000000000000000000000000000000000000000000000000009F9D9B00B8B8
      B900F5F8FC00FFFFFF00FFFFFF00FFFFFF00F5F7FC00B8B7B9009F9C9B000000
      000000000000000000000000000000000000A2A2A200FFFFFF00FFFFFF00FCEB
      D800FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00A2A2A200B8B8B600B0B0AD00AEAEAC00AEAE
      AB00ADADAB00AEAEAB00AFAFAD00BDBDBB000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000099938E0099938E0099938E00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000999695009593910095929100959291009996950000000000000000000000
      000000000000000000000000000000000000ABACAC00A2A2A200A0A1A200A0A2
      A300A0A1A2009FA0A0009F9F9F009F9F9F009F9F9F009F9F9F009F9F9F009F9F
      9F009F9F9F00A0A0A000A2A2A200ABABAB000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000008C
      4B00329D6C000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000004B7DA30068A4D90000000000000000000087450054D9
      B000008847000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000008948000088470000884700008847000088470000884700008847000088
      470000884700008A49000D915500000000000000000000000000000000000000
      0000B97B3D00B0773F00BFA99400000000000000000000000000000000000000
      0000000000000000000000000000000000005C5C5C005C5C5C005E5B5A005E5A
      59005D5A5A005B5A5B005A5B5B005A5B5B005A5B5B005B5A5A005C5956005768
      76004E7EA4004C80AC005082AB0065A2D500000000000087440065D7B30000D9
      A00000C384000085440000874600008847000088470000884700008847000089
      48000000000000000000000000000000000000000000000000000089470000B1
      740000D79C0000DCA10000DCA00000DCA00000DCA00000DCA00000DCA00000DC
      A00000DCA10000E1A700008A4900000000000000000000000000000000000000
      0000C1803C0000000000B2773F00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000003F69
      A50075666700706869006D6969006C6A69006C6A69006C6A68006E6762004C89
      BA004E85B2004D83AE005D8CB200629ED100008A480074DBBD0000D09C0000CE
      9A0000D59C0000D89F0000D9A00000D9A00000D9A00000D9A00000D9A10000D7
      9C0000B1740000894700000000000000000000000000008A470000C5930000D0
      9F0029D8AF005BE3C5005BE4C6005CE5C7005CE5C8005CE5C8005CE5C8005CE5
      C8005CE6C90060EACE00008A4800000000000000000000000000000000000000
      0000C9843A0000000000B97B3D0000000000000000000000000000000000C49D
      7700B0773F00B7916D0000000000000000000000000000000000000000001382
      6B0000934600715C62006A62630067646300666463006764620068615B004F8A
      BB005086B4004F84B1006895B9005F9BCD00008A480086E0C80000CB9B0000C9
      99005FE3C3005CE5C6005CE6C7005CE6C8005CE6C7005BE5C6005BE4C50029D8
      AF0000D09F0000C59300008A4700000000000000000000A8760000C5A1000DC8
      A60060D6BC0029AA780000864200008744000087440000874400008744000087
      440000874500008947004FB08300000000000000000000000000000000000000
      0000D5955100CCB7A000C07F3C00000000000000000000000000C0884E00D0A4
      7A0000000000B37A46000000000000000000000000000000000000000000008C
      46004FDDB000008D43006B585E00655E60006361600062605F00645D5700518D
      BE00528AB7005187B400739FC2005D97C90000000000008743009BE3D00000C6
      9E0000C28F00008441000087440000874400008744000086420029AA780060D6
      BC000DC8A60000C5A10000A8760000000000068C4C0000C19A0000C6A00040CA
      AA000E9256000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000D0873600C98235000000000000000000C99A6A00C48849000000
      0000C4A98E00BE88530000000000000000000D915400008A4700008845000084
      410000DAA20060D9B300008D420068545A00625B5C00605C5A00605852005490
      C200558CBA004E81AD007EA6C8005A94C400000000000000000000874300A4E6
      D900008845000000000000000000000000000000000000000000000000000E92
      560040CAAA0000C6A00000C19A00068C4C000089470000CFA40000CDA100009D
      6100000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000B3906D00B9B9B900D1A06A00CC853800CC8F4E00CC94
      5A00BE7E3C00000000000000000000000000008A470063EDD00000D4A00000D2
      9E0000CC9C0000CD9C006FDCBD0000934600615457005C5756005B534D005794
      C500588EBC0047749B0088AFCF005790C000000000000000000000000000008B
      49003FA978000000000000000000000000000000000000000000000000000000
      0000009D610000CDA10000CFA400008947000089470000D6A30000D4A1000096
      5600000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000AB8968009E958E00E09B4D0000000000000000000000
      000000000000000000000000000000000000008A470061E1D00060DDCA0063DC
      C80000C49B0000C69C0082E1C800009447005C50540058535300574F4A005A96
      CA005B8FBE0022B9F70095B5D300548DBC000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000096560000D4A10000D6A300008947000088470000DAA30000D8A00000A0
      6100000000000000000000000000000000000000000000000000000000003EA0
      7400008C4B000000000000000000000000000000000000000000000000000000
      000000000000B5B8BC00D37C1D00B98B5E000000000000000000000000000000
      00000000000000000000000000000000000010945700008A4700008844000085
      3F0000C1A00097E3D100008F43005A484E005650510053514F00524B45005B9A
      CD005C91C10020B7F5009EBCD7005189B8000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000A0610000D8A00000DAA30000884700078B4D0000D1970000D99F0000CB
      9000008D4B000000000000000000000000000000000000000000000000000089
      470054D9B0000088460000000000000000000000000000000000000000000000
      0000B7B6B600ECEDEF00BDB4A800CACCD0000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000008B
      4400A0E8DA000091440055434A00524B4D004F4D4E004F4D4C004D4641005E9C
      D2005C95C5005990C100A6C4DF004E86B5000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000008D
      4B0000CB900000D99F0000D19700078B4D00000000002FBD8B0020DEAD0000D5
      9D0000C78F00009F6000008744000088460000884600008846000086430000BA
      7E0000D8A00065D7B3000087440000000000000000000000000000000000B0AE
      AB00EBEBEB00DAD9D900C4C3C300C7C6C6000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000001786
      6D0000964700523F45004F4749004D494A004C4A4A004C4848004A423D0060A0
      D5005D98C9005894C600AFCCE6004B83B000000000003FA07400008A49000088
      4600008846000088460000884600008846000088460000874400009F600000C7
      8F0000D59D0020DEAD002FBD8B000000000000000000008846003AD1AB0052E1
      C2001DD5AB0010D4A80011D5AA0011D6AB0011D6AB0011D6AB0011D5A90013D3
      A80000CC9B0000CE9D0074DBBF00008A48000000000000000000BEBDBD00EBEA
      EB00DBDAD90000000000CDCBCA00C8C7C5000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000004D7B
      B0004C3D3B004A43430048454400484644004846440047454200433C36005FA1
      D8005C9ACC005896C900B8D3EB004980AC0000000000008A490014DFB00011DA
      AB0011DAAA0011DAAA0011DAAA0011DAAA0011DAAA0011D9A90010D4A9001DD5
      AB0052E1C2003AD1AB0000884600000000000000000000000000008845003ABA
      910062DEC80061E0CA0062E0CA0062E0CA0062E0CA0062E0CA0062E0C90065DE
      C70000C59A0000C69C0086DEC800008A48000000000000000000D4D4D300DDDC
      DB000000000000000000D4D2D100BDBBBA000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000004A7F
      AC0044383100433B3700433D3800433D3800433D3800423B36003C332C00B9DA
      F5007FB0DA005495CC00C0DAEF00467CA80000000000008A470066E2D00062DD
      CA0062DDC80062DDC80062DDC80062DDC80062DDC80062DDC90061E0CA0062DE
      C8003ABA91000088450000000000000000000000000000000000000000000000
      00000089460000884400008744000087440000874400008744000086410000AB
      7D0000BF9E009BDFD00000874300000000000000000000000000C5C3C2000000
      00000000000000000000D9D7D600C2C2C0000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000082A6
      C3004A82AE004A83B0004A83B0004A83B0004A83B0004A82AF00447DA900709C
      BF00B9D5EB00B3D1EA00C1DBF2004279A500000000004FB0820000965D000093
      5A00009359000093590000935900009359000093590000945A00008743000089
      4500000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000089
      4500A4E4D9000087430000000000000000000000000000000000000000000000
      00000000000000000000D3D1D100B6B4B2000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000CEE3F5003F75A1000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000004EB0
      8300008C49000000000000000000000000000000000000000000000000000000
      00000000000000000000BBB9B700000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000AC731400AD751900AC731600AC721400AB721400AA711300AA70
      1300AA701300AA711300AC741900B07A23000000000000000000000000000000
      00000000000000000000C3AA7700BF881600BF881600BF881600BF881600BF88
      1600BF881600BF881600BF881600BF9D58000000000000000000000000000000
      0000C09E7900B5844E00B3824B00B3814B00B3814B00B3824B00B5844E00C09E
      790000000000000000000000000000000000BABAB900AFAFAD00AEAEAB00ADAD
      AB00ADADAB00ADADAB00AEAEAB00AEAEAC00AFAFAD00AFAFAD00B0B0AE00B6B3
      AF00C7C1BB0031699E00396D9E0000000000C3AB7A00B7821600B37A0600D7D0
      D400D8D1D300A96D0B00F7EFE300FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00AC7419000000000000000000000000000000
      00000000000000000000BF881600F6CD8B00F3C27500F9FCFF008B8D9000F9F9
      F900F4F8FC00F2C17400F6CD8B00BF8816000000000000000000000000000000
      0000BA854B00FFFFFC00FFFFF500FFFFF400FFFFF400FFFFF500FFFFFC00BA85
      4B0000000000000000000000000000000000B0B0AD00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0023629E0025B0FF0044C8FF003A83CC00B7821800F6CC8A00F0C17200F9F7
      FC00FFFFFF00A6690500F5EBDA00979A9F005354560095969700FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00AA7114000000000000000000000000000000
      00000000000000000000BF881600F3CC8B00EBB65C00F2EDEC007F797800F1E9
      E200EEE9E800EAB55A00F3CC8B00BF8816009A9A9A0081818100818182007F83
      8600BD854600FFFFF700FFF3DA00FFF2D900FFF2D900FFF3DA00FFFFF700BD85
      46007F83860081818200818181009A9A9A00AEAEAB00FFFFFF00FDFDFD00FCFC
      FD00FDFDFD00FEFEFE00FFFFFF00D3D3D4006E6F710058585C005A5A5D006360
      60007D7068003AC6FF0057DBFF003981C900B6811600F3CA8600EBB66000F8F5
      F800FFFFFF00A5680300F5EAD900FFFFFF0057575700FFFFFF00FBFBFA00F6F6
      F500F5F5F400F5F7F700FFFFFF00AA711300000000000000000000000000C3AA
      7700BF881600BF881600BF881600F3CE9200E6AC4D00EAD9C600FFFFFF00FDFE
      FF00E8D7C400E6AC4C00F3CE9300BF88160081818100D5D2D100CBC9C9007D7C
      7C0067676800A8A6A800A4A2A400A3A2A300A3A2A300A4A2A400A8A6A8006767
      68007D7C7C00CBC9C900D5D2D10081818100ADADAB00FFFFFF00FAF8F800F9F8
      F800FAF9F900FFFDFE00D1D1D20067646300E3C38C00FFEBA400FFF3AF00E7D3
      A10076706B00A09085003280CF0000000000B6811600F1CA8900E8B15500F9F8
      FD00FAF8FB00A6690500F6ECDB008C8E9200545556008B8B8C00E3E2E300DFDE
      DE00DEDEDE00DDDEE000FFFFFF00AA711400000000000000000000000000BF88
      1600F7CE8E00F5C78000BF881600F4D29B00E3A43B00E3A33500E3A13100E3A1
      3100E3A23500E3A43B00F4D39B00BF8816007F7F7F00DAD7D600C2BFBE00C8C5
      C400AFACAC00AFACAB00ADAAAA00ADAAAA00ADAAAA00ADAAAA00AFACAB00AFAC
      AC00C8C5C400C2BFBE00DAD7D6007F7F7F00ADADAB00FFFFFF00F6F6F600F6F6
      F600F8F8F800FEFFFF0077787900E3BE8400FFE6A500FFE7A600FFEFB300FFF9
      BB00E9D6A200807875000000000000000000B6811500F3CB8F00E6AD4D00FDFF
      FF00EEE7E500A76B0900F6EFE300FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00AC741900C3AA7700BF881600BF881600BF88
      1600F4CD8D00EEBD6A00BF881600F5D5A300E8C99D00EDE4E100EEE4DF00EEE4
      DF00EDE4E100E8C99D00F5D6A500BF8816007E7E7E00E1E0DF00BDBBB9009290
      8E007B7977007D7B78007D7B78007D7B78007D7B78007D7B78007D7B78007B79
      770092908E00BDBBB900E1E0DF007E7E7E00ADADAB00FFFFFF00F4F4F300F4F4
      F300F6F6F500FDFEFE00696A6D00FFE09D00FFEFCA00FFE7B300FFE9AB00FFEF
      B200FFF4AF00787677000000000000000000B6811500F3D09500E4AA4600E8CB
      A500FFFFFF00A66D1000A76F1300A76D1000A66D0E00A66C0E00A56C0E00A56B
      0E00A66C0E00A96F1200AC741900B07A2300BF881600F7CE8E00F5C78000BF88
      1600F3CF9400EAB35900BF881600F7DCAF00EFE7E300B1A9A400B3ABA400B3AB
      A400B1A9A400EFE7E300F7DDB000BF8816007D7D7D00EDEBEB00B8B5B3006462
      61006B6968006C6A69006C6A69006C6A69006C6A69006C6A69006C6A69006B69
      680064626100B8B5B300EDEBEB007D7D7D00ADADAB00FFFFFF00F2F1F000F2F1
      F000F4F3F200FBFAFB006F6F7200FFDD9700FFF7E400FFEDC800FFE7B200FFE6
      A500FFECA5007C7B7E000000000000000000B6811500F3D39C00E3A53E00E2A2
      3700E4A13200E6A43700E7A53A00E7A63A00E7A63A00E7A63C00E7A84000E8AA
      4300F6D69E00B88212000000000000000000BF881600F4CD8E00EEBD6A00BF88
      1600F4D39C00E7A94400BF881600F9E4C400EFEBE500F0EAE000F1EBE000F1EB
      E000F0EAE000EFEBE500FAE5C500BF8816007C7C7D00F9F8F800F3F4F2009491
      90009B9897009C9998009C9998009C9998009C9998009C9998009C9998009B98
      970094919000F3F4F200F9F8F8007C7C7D00ADADAB00FFFFFF00EFEFEE00EFEF
      EE00F0F1F000F6F7F70084858700E7BB7C00FFF5DB00FFF7E400FFEECA00FFE5
      A400EBCC9500868587000000000000000000B6811400F4D5A400E09E3100F4E0
      B700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F4E1B800E19F
      3200F5D6A400B68114000000000000000000BF881600F4CF9500EAB35900BF88
      1600F5D6A500EACEA800BF881600FDE6C100FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FEE9C700BF8816007C7C7D00F4F3F200D3D1D000827F
      7E00888685008986860089868500898685008986850089868500898686008886
      8500827F7E00D3D1D000F4F3F2007C7C7D00ADADAB00FFFFFF00ECEBEA00EDEC
      EB00EEECEB00F1F0F000CFCFD00083807D00E8BC7D00FFDC9700FFDF9C00EAC5
      8B008C888700000000000000000000000000B6801400F5DAAE00DF982200FCFF
      FF00797C8000A1A3A500FEFBF200797A7C00A3A4A600A0A3A700FBFEFF00DF97
      2200F5DAAE00B68014000000000000000000BF881600F5D49D00E7A94400BF88
      1600F7DDB000F0EAEA00E0BC7300BF881600BF881600BF881600BF881600BF88
      1600BF881600BF881600BF881600D1AE69007E7E7E00FFFFFF00FFFFFF006D6B
      6A00706F6F006C6B6B006A6867006A6867006A6867006A6867006C6B6B00706F
      6F006D6B6A00FFFFFF00FFFFFF007E7E7E00ADADAB00FFFFFF00E9E9E800EAEA
      E900EAEAE900EBECEB00EFEFEF00D8D7D8009494960085858800848487009796
      9800A9AAAA00000000000000000000000000B6801300F7DFB900DD921500FCFC
      FC00FDF8EC00FFF8EA00FDF6E800FCF6E800FBF4E700F9F4E800FAFAFA00DC91
      1500F7DFB900B68013000000000000000000BF881600F6D7A700EACEA900BF88
      1600F9E4C300EFECE800F0ECE900F1EEEC00F1EEEC00F1EEED00F2F0F100FDE9
      CD00BF881600000000000000000000000000A9A9A9007F7F7F007F7F80008083
      8700BF864800FFFFF800FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFF800BF86
      4800808387007F7F80007F7F7F00A9A9A900ADAEAB00FFFFFF00E7E5E400E8E7
      E600E8E7E600E8E7E600E8E7E600FFFFFF00D3D3D300AFB0AF00AEAFAD00FFFF
      FF00B3B3B100000000000000000000000000B67F1200FAE5C500DA8C0900FEFE
      FF00787879007A797900A2A1A1009F9E9E00F5EBE0009B9B9D00FCFCFF00DA8C
      0900FAE5C500B67F12000000000000000000BF881600F8DEB200F0ECEE00BF88
      1600FCE4BF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFE9
      C900BF8816000000000000000000000000000000000000000000000000007577
      7A00BA834700FFFFF300FFF0DD00FFEFDC00FFEFDC00FFF0DD00FFFFF300BA83
      470075777A00000000000000000000000000AEAEAB00FFFFFF00E3E3E200E4E4
      E300E4E5E400E4E4E300E3E3E200FFFFFF00A8A8A600EDEDEC00FFFFFF00EAEA
      EA00CACAC900000000000000000000000000B67F1200FBECD200D8840000FFFF
      FF00F1E5DA00F2E6DA00F2E6DA00F0E4D800EEE2D700EEE2D800FEFFFF00D883
      0000FBECD200B67F12000000000000000000BF881600FBE6C700F0EFEF00E0BC
      7300BF881600BF881600BF881600BF881600BF881600BF881600BF881600BF88
      1600DDC491000000000000000000000000000000000000000000000000000000
      0000B7834900FFFFF400FFE1C000FFE0BF00FFE0BF00FFE1C000FFFFF400B783
      490000000000000000000000000000000000AEAEAC00FFFFFF00E0DFDE00E1DF
      DE00E1E0DF00E1DFDE00E0DFDE00FFFFFF00A5A5A300FFFFFF00E8E8E800CBCB
      C90000000000000000000000000000000000B7811400FFECCD00FCE6C300FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FCE6
      C300FFECCD00B78114000000000000000000BF881600FFE9C800FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFEDD000BF881600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000B7854E00FFFFFD00FFFFF500FFFEF400FFFEF400FFFFF500FFFFFD00B785
      4E0000000000000000000000000000000000AFAFAD00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E9E9E900CACAC9000000
      000000000000000000000000000000000000DEC69500B7811400B57E0F00B57C
      0B00B57C0900B57C0900B57C0900B57C0900B57C0900B57C0900B57C0B00B57E
      0F00B7811400DEC695000000000000000000D1AE6900BF881600BF881600BF88
      1600BF881600BF881600BF881600BF881600BF881600D2B06B00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000CEAE8A00B5844F00B3824B00B3814B00B3814B00B3824B00B5844F00CEAE
      8A0000000000000000000000000000000000B8B8B600B0B0AD00AEAEAC00AEAE
      AB00AEAEAB00AEAEAB00ADAEAB00AEAEAB00AFAFAD00B7B7B500000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000068A4CE004195D100469AD40000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000058A0D1004296D1004296D1004094D0003F92CF003F92CE003F92CE003F92
      CE003F92CE003F92CF004094D0004D9BD200C2A97500B7821800B6801400B37A
      0600D7CFD200D8CEC900CFCECD00C9BFAC00D9CFCE00D5CAC300D4CAC400D6CF
      D200B37A0600B6801400B7821800C2A9750000000000000000000000000068A4
      CF004092CE0054ADDE0066C4ED0078E0FE003591D100BBB2AA00B0AEAB00ADAD
      AB00AEAEAB00AFAFAD00BABAB900000000004B9CD4003695D7003694D8003694
      D8003694D8003694D8003694D8003694D8003694D8003694D8003D92D0003694
      D8003694D8003694D8003694D7004B9CD4000000000000000000000000000000
      00004195D000AAF9FF0091F0FF0092F0FF0091F0FF0092F0FF0092F0FF0092F0
      FF0092F0FF0092F0FF00A8F9FF004094D000B7821800F6CD8B00F2C67D00F0C1
      7100FAF7FB00FFFFFF004C48480098939200FFFFFF00F7EFEA00F6EFEB00F9F6
      FA00F0C17100F2C67D00F6CD8B00B7821800000000004E9CD10058B0DF006DC9
      EF007FE2FD007EE3FE007ADEFC007EE1FF00308CCD00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00B0B0AD00000000004095D10091FBFF0091FBFF0091FB
      FF008CF8FF0092F4FF0093F3FF0093F2FF0093F3FF0093F3FF0092F4FF0090F3
      FF0091FBFF0091FBFF00A0FEFF003F94D1000000000000000000000000000000
      00004094CF00BAF5FF007FE3FF0081E3FE007FE3FF0081E3FE0082E3FE0082E3
      FE0082E3FE0081E4FF00B0F3FF003D92CF00B6811600F3CA8700EDBC6D00EBB7
      6100F8F5F700FFFFFF004A454100948C8800FFFFFF00F1E8E000F0E7E000F7F4
      F700EBB76100EDBC6D00F3CA8700B6811600000000004094CF0092F1FF0085E7
      FF0080E1FD007ADEFB0077DBFB0083E1FF00308ACB00FFFFFB00FFFFFD00FCFC
      FC00FCFCFC00FFFFFF00AEAEAB00000000003E93D00088F4FF0088F4FF0088F4
      FF0088F4FF0080EEFF0082EDFF0082EDFF0082EEFF0082EEFF0081EFFF0088F4
      FF0088F4FF0088F4FF009FF8FF003D93D0000000000000000000000000000000
      00003F93CF00D3F9FF0070DBFC0071DAFB0070DBFC0071DAFB0072DAFB0072DA
      FB0073DAFB0073DBFB00BFF3FF003C92CE00B6811600F1CB8900E9B76200E7B2
      5700F9F8FB00FDF7F200877F79004A444100FEF7F200EEE3D800EDE2D900F8F7
      FB00E8B25700E9B76200F1CB8900B6811600000000003E92CE009AF0FF0083E4
      FD007EDFFC007ADDFB0076DAFA0089E2FE0048A8DD0070AED900FFFCF800F9F6
      F600F7F6F600FFFFFF00ADADAB00000000003F93D00082EDFF0082EDFF0082ED
      FF0082EDFF0082EDFF0082EDFF0082EDFF0082EDFF0082EDFF0082EDFF0082ED
      FF0082EDFF0082EDFF00A2F5FF003D92D0000000000000000000000000000000
      00003E93CF00DEFCFF00DAFAFF00DBF9FF00DAF8FF00AEEAFE0064D5FA0064D5
      FA0064D5FA0064D5FA00D3F8FF003B92CF00B6811600F3CC8E00E8B25A00E7AE
      5100FCFFFF00ECE0D700F1E4DA00F1E5DA00EDE0D500EADDD300E9DED500FBFF
      FF00E7AE5100E8B25A00F3CC8E00B6811600000000003E92CE00A3F1FF0082E3
      FC007EDFFC007ADDFB0076DAFA0071D9FB009DE8FF002A89CB00FFFBF600F6F4
      F300F4F3F300FFFFFF00ADADAB00000000003F93CF007DE8FF007DE8FF007DE8
      FF007DE8FF007DE8FF007DE8FF007DE8FF007DE8FF007DE8FF007DE8FF007DE8
      FF007DE8FF007DE8FF00A8F2FF003D92CF006EA8D0004296D1004296D1004095
      D0003B91CE00388DCC00388DCC00368CCB00318BCB00D8F9FF00D6F7FF00D6F7
      FF00D6F7FF00D6F7FF00DBFBFF003D94D000B6811500F3CE9400E6AE5100E5AB
      4B00E6C9A400FFFFFF00FFFFFF00FFFFFF00FEFFFF00FDFFFF00FEFFFF00E6C9
      A400E5AC4B00E6AE5100F3CE9400B6811500000000003D92CE00ADF3FF0081E3
      FC007EDFFC007ADDFB0076DAFA006FD8FA00ABEBFF002B89CC00FFF8F100F2F1
      EF00EFF0EE00FFFFFF00ADADAB00000000003F93CF0076E1FF006DDDFF0069DD
      FF0068DDFF006ADEFF006DDEFF006FDEFF006FDEFF006FDEFF006FDEFF006FDE
      FF006FDEFF0070DDFF00AFEFFF003D92CF004195D0009DFCFF0091F0FF0091F0
      FF00368DCC00C6F5FF006FDBFC0063C8F1003E9BD500318BCB00308BCC00358E
      CD00358ECD00358ECD00358ECD003F95D100B6811500F3D09A00E5A84500E3A6
      4000E2A13600E29E2F00E19D2D00E19D2C00E19D2C00E19D2D00E29E2F00E2A1
      3600E3A64000E5A84500F3D09A00B6811500000000003C92CE00B6F6FF0080E3
      FC007DDFFC007ADDFB0076DAFA006ED7FA00B9EFFF002A89CC00FCF2ED00EEEC
      EB00EBEAEA00FFFFFF00ADADAB00000000003E94D000E1FFFF00DAFAFF00D9F9
      FF00D9FAFF00DCFAFF006EDAFD0070D9FC0070D8FB006FD8FB006FD8FB006FD8
      FB006FD8FB006CD8FB00B5EFFF003D92CF004094CF009FF8FF0081E3FE0081E3
      FE00328BCB00D3F6FF0062D3F90063D4F900B7EDFE00DBFAFF00DCFBFF00DEFE
      FF00DEFEFF00DFFFFF00E4FFFF004096D100B6811400F4D4A000E1A13600F2DE
      B700FCFFFF00FBFFFD00FBFFFC00FBFFFD00FBFFFD00FBFFFD00FBFFFD00FBFF
      FF00F2DEB700E1A13600F4D4A000B6811400000000003C91CE00C0F8FF007FE2
      FC007DDFFC007ADDFB0075DAFA006DD7FA00C6F3FF002989CB00FFF9F400FFFF
      FF00FFFFFF00FFFFFF00AEAEAB00000000004095D100378ECD00348BCB00358B
      CB00368BCA00378ACA005BBBEA006CD6FB0068D4FA0066D2F90065D2F90065D2
      F90065D2F90063D2FA00B9F0FF003C92CF003F93CF00A7F6FF0070DBFC0070DB
      FC00318CCC00DAFBFF00D8F8FF00D8F8FF00D8FAFF00308ACB00338DCC003790
      CE003A92CF003B93D0003E95D0004F9ED500B6801400F6D8A700E09C2700FBFF
      FF00FCFBF300FCF9EF00FBF8EE00FCFAF000FCFAF000FBF9EE00F9F8ED00FAF9
      F100FAFEFE00E09B2700F6D8A700B6801400000000003B91CE00C9F9FF007EE2
      FC007CDEFC0078DCFB0072D9FA006AD6FA00D2F6FF002888CB00FFFFFF00CDCB
      C900A4A4A200FFFFFF00AFAFAD00000000003E94D000C8F8FF0072DDFE0075DD
      FD0076DEFD0076DEFE004FAADC0054B8E800D9F7FF00D5F6FF00D5F6FF00D5F6
      FF00D4F5FF00D4F6FF00D9FBFF003D94D0003E93CF00B1F7FF00DAFAFF00E3FF
      FF006EB3DF003991CE003991CE00378FCD00338DCC0043A5DC00D9FEFF003C93
      D00000000000000000000000000000000000B6801400F8DCB000E0981C00FBFB
      F80079787B00A2A0A200FCF6EA0079787900A3A1A300A09FA100FAF4E9009D9D
      A000F9F9F600E0981C00F8DCB000B6801400000000003A91CE00D2FCFF007AE2
      FC0077DDFC007FDFFB009BE6FD00B3EDFF00D4F9FF002688CB00FFFFFF00A7A5
      A200FFFFFF00E9E9E900CACAC800000000003B92CF00CEF7FF0069D5FA006DD5
      FA006DD5FA006BD5FA006BD8FC0047A8DD00318ACB002F8ACB002F8ACB002F8A
      CB002F8ACB00308BCB00358FCD004095D1003D93CF00388DCC00388DCC00388D
      CC00318BCB00DEFEFF00DEFEFF00DEFEFF00DEFEFF00D9FBFF00DCFEFF003D94
      D00000000000000000000000000000000000B6811300FCE3BC009B610400FDFC
      F900FDF5E800FEF4E700FBF2E500FCF2E500FBF2E500FBF2E500FAF1E300F9F1
      E500FCFAF7009A610400FCE3BC00B6811300000000003991CF00E9FFFF00AFF0
      FF00CEF7FF00DAFAFF00C4ECFC008CCAEC005FAEE00082BDE600FFFFFF00FFFF
      FF00E9E9E900CBCBC90000000000000000003B92CF00D5F8FF0060D1F90063D1
      F80062D1F800B5EBFD00DAF8FF00DCFBFF00DDFDFF00DDFDFF00DDFDFF00DDFD
      FF00DDFDFF00DDFEFF00E3FFFF004096D1003B92CF00C7F5FF006EDBFC0063C8
      F1004BACDF00318CCC00318CCC00318CCC00318CCC00308CCC00358FCD003F95
      D10000000000000000000000000000000000B6801200FEE9C60071410000FFFF
      FF0079797A007A7A7A00A2A1A1009F9F9F00F6ECDE0077777700A1A1A1009E9F
      A000FFFFFF0070410000FEE9C600B6801200000000003C93D000E9FFFF00A8DA
      F3007BBDE4004398D200408EC7006E9CBC0090A5B200BAAFA600B5ADA600B5AF
      A900CFCDCA000000000000000000000000003D94D000DCFCFF00D8F8FF00D9F7
      FF00D9F7FF00DBFAFF00358ECD003A92CF003B92CF003B93CF003B93CF003B93
      CF003B93CF003B93D0003E95D0007DB8E0003B92CF00D5F7FF0062D2F90062D2
      F900B6ECFE00DBF9FF00DCFBFF00DDFDFF00DEFEFF00DFFFFF00E4FFFF004096
      D10000000000000000000000000000000000B6801200FDECD100DA860000FFFF
      FF00F1E5D800F2E5D800F2E5D700F0E3D600EFE2D500F1E4D700F1E4D600EFE3
      D600FFFFFF00DA860000FDECD100B6801200000000004297D2003B93D00062AD
      DC0093CDED00BBE7FA00D8FCFF00D6FCFF00D3FBFF00D1FBFF00D3FCFF002E91
      D500000000000000000000000000000000006EAFDC003D94D0003A92CF003A92
      CF003A92CF003D94D00072B2DD00000000000000000000000000000000000000
      0000000000000000000000000000000000003D94D000DCFDFF00D8F9FF00D8F8
      FF00DBFBFF00358ECD003991CE003A92CF003B92CF003B93D0003E95D0007DB8
      E00000000000000000000000000000000000B7811500FFECCD00FCE7C300FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FCE7C300FFECCD00B78115000000000051A0D6004498D2004197
      D1003F95D1003D94D0003B93D0003A92D0003A92D0003A93D0003C94D1004B9E
      D600000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000004F9ED5003D94D0003A92CF003A92
      CF003D94D00053A1D50000000000000000000000000000000000000000000000
      000000000000000000000000000000000000DCC28F00B7811400B57E0F00B57C
      0B00B57C0900B57C0900B57C0900B57C0900B57C0900B57C0900B57C0900B57C
      0900B57C0B00B57E0F00B7811400DCC28F00424D3E000000000000003E000000
      2800000040000000700100000100010000000000800B00000000000000000000
      000000000000000000000000FFFFFF00FFFFFFFFFF830000F800F83FE0010000
      F800E00FC00000000000C0078000000000008003800000000000800380000000
      00000001800000000000000180010000000F000180030000000D0001801F0000
      00090001801F000000018003801F000000098003801F0000001DC007801F0000
      003FE00FC03F0000007FF83FE07F0000FF87FF87FF87FF870007FF87FF870007
      0007FF87818700070000F800000000000000F000000000000000E00000000000
      0000E000800000000007E007C08700070007E007C18700070007E00780870007
      0007F01F007F00070007F83F007F0007000799FF007F00070007C3FF00FF0007
      0007FFFF80FF00070007FFFFC3FF0007FF87FF87FF87FF870007FF87FF87FF87
      0007F087FF8700010000F400FC0000000000F800FC0000000000FC00C4000000
      0000F400B40000000007F987C78500010007FF87F40500010007EF07CF830001
      0007EFEFFFEF00010007EFDFFFCF00010007EF6FFFFF00010007CF9FFFFF0001
      0007EFFFFFFF80030007FFFFFFFFFFFFFF87FF87FF87FF87FF87FF87FF87FF87
      FF87FF870001FE07FC00FC000000FC00E000FC000000F000E000E0000000C000
      E000C0000000C000E00780030000C003E00788030000C003E00780030000C003
      E01FC0070001C003E00FE10F0001C003FFE7FFFF0001E007FFF7FFFF0001FC1F
      FFFFFFFF8003FFFFFFFFFFFFFFFFFFFFFFE3FFE3FFFFFC0300000000C003C003
      00000000C003800300000000C003000300000000C003000300000000C0030003
      00000000C003000300000000C003000100000000C003003C00000000C003003E
      00000000C003003F00000000C003003F00000000C003003F00000000C003003F
      00000000C003807F00000000C003C0FFFFFFFFFFFFFFFFFF8000800080008001
      8000800080008001000000000000800180008000800080018000800080008001
      0000000000008001800080008000800180008000800080010000000000008001
      8000800080008001800080008000800100000000000080018000800080008001
      8000800080008001FFFFFFFFFFFF8001FFFFFFFFFFFFFFFF8000800080008000
      8000800080008000000000000000000080008000800080008000800080008000
      0000000000000000800080008000800080008000800080000000000000000000
      8000800080008000800080008000800000000000000000008000800080008000
      8000800080008000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE787800080008000
      C3878000800080008187000000000000008780008000800000FF800080008000
      C383000000000000C383800080008000C383800080008000C383000000000000
      C3FF800080008000C380800080008000C380000000000000C380800080008000
      C380800080008000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000C380
      000000000000C380000000000000C380000000000000C380000000000000C3FF
      000000000000C383000000000000C383000000000000C383000000000000C383
      00000000000000FF00000000000000870000000000008187000000000000C387
      000000000000E787000000000000FFFFFC00DA39FFFFFFFCFC00DAD6FE7FC0F8
      FC00C217FC3F8070FC00D8D600030021FC00E03900030003FC00F00F00010007
      FC00F0030000000FF400E00300000007E000C00700030007C000800F00000007
      8001803F0000000F0003C07F0001000F80FF81FF0003003FC1FF0FFF0003003F
      E3FF1FFF0003807FF7FF3FFF0003C0FFFFC1FFFFFFFFFFFFFF80FFFFFFFF8001
      FF80FFFFFFFF8001FF80F3FFFFCF8001FD80E3FFFFC78001FC00C03FFC038001
      8000000000008001018000000000800101808000000180010001800180018001
      003F80018001800101BF80018001800101FFC003C003800101FFE007E0078001
      01FFFFFFFFFF800183FFFFFFFFFF800100000000F81FFC0040024002E007FC00
      40004000C003FC00400140018001FC00000000008001FC00C003C0030000FC00
      C003C00300008000C003C00300000000C003C00300000000C003C00300000000
      C003C00300000001C003C00380010003C007C007800101FFC00FC00FC00301FF
      C01FC01FE00701FFC03FC03FF81F83FFFFFFFFFFFFFFFFFFFFFFD555FFFFFFFF
      E0000001FFFFFFFFE0008000FE3FFFFFC0000001FE3FFFFFC0008000FE3FFFFF
      00000001F007E00700008000F007E00700000001F007E00700008000FE3FFFFF
      C0000001FE3FFFFFC0008000FE3FFFFFE0000001FFFFFFFFE0008000FFFFFFFF
      E0000001FFFFFFFFFFFFD555FFFFFFFFFF83FBFFFFFFFFFFE001F03F8001FFFF
      C000E01F800100078000C00F800100078000C00F800100078000C00F80010003
      8000C00F800100018001C007800000008003C00380000000801FC00700010001
      801FC00300010003801FC00100030007801FC00F003F0007801FC00F007F0007
      C03FE01F80FF0007E07FF03FC1FFFFFFFFFFF019FFFFFFFFC003E000FFFF0001
      8001C000F9FF00008001C001F1FF00008001C001E00F00008001C000C0070000
      8001C000E00300008001C009F1E300018001C00FD99B00078001C00FC78F0007
      8001C00FC00700078001C00FE00300078001C00FF00700078001E01FFF8F000F
      8001F03FFF9F001FE007FFFFFFFF003FFE3FFFFFFFFFFFFFE0070000C003FE3F
      E0070000C003FC1F80030000C003F80F80010000C003F00780010000C003E003
      80010000C003C00180010000C00380008001000080018000C003000080018000
      E0070000C003C001F81F0000C007E003F81F8001C007F007F81FC003C007F80F
      F81FE007FC07FC1FFC3FFFFFFE47FE3FFFFFFFFFFFFFFFFF00000000F8430000
      00000000F843000000000000F843000000000000F843000000000000F8430000
      00000000F843000000000000F843000000000000E043000000000000C0430000
      0000000080430000000000008043000000000000804300000000000080030000
      00000000C003000000000000F0070000FFFFFFC1FFF7FFDFFFE30000C0E7C0CF
      8001000080478047000000000000000300000000000000010000000000000000
      000100000000000100030000000000030007000000070007000700010027000F
      000700070037001F00070007003F003F00070007003F003F0007000F003F003F
      0007001F807F807FC01F003FC0FFC0FF8E3FFC71FFFFFFFF041FF820FFFCFFE3
      001FF800FFF88001001FF800FF0100000A1FF85000030000803FFC0100030000
      CA7FFE5300030001C47FFE2300030003C467E62300030007FFE3C7FF00030007
      FF0180FF00030007FF0000FF00030007FF0000FF00030007FF0180FF00030007
      FFE3C7FF00030007FFE7E7FF03FFC01FFFFFFFFFFFFFFFFFFC00FC00FFE30000
      FC000000FFC10000FC000000F001000000000000C00100000000000080030000
      0000000080070000000000000007000000000000000700000000000000070000
      0000000000070000000100010007000000030003800F0000003F001F800F0000
      007F001FC01F000000FFF1FFF07F0000FFFFE7FFFFFFFFFFFFFCC7FFF001F1FF
      0000800FC001F5FFE00000038001F5E3E00000018001F1CBE000800107FFF993
      0000C7E00FFFFC070000E7F00FFFFC7F0000FFF00FE7F8FF0000FFF007E3F0FF
      E000FFE08001E0FFE00080018000C4FFE0008001C000CCFFE0008003F001DCFF
      E000800FFFE3FCFFFFFCFFFFFFE7FDFFFFFFFFFFFFFFFFFFF800FC00F00F0001
      0000FC00F00F00000000FC00000000000000E000000000010000E00000000003
      0000000000000003000000000000000300030000000000030003000000000007
      0003000000000007000300070000000700030007E007000700030007F00F000F
      0003003FF00F001F0003003FF00F003FFFFFFFFFFFFFFFFFFC7FFFFFF0000000
      E0010000F000000080010000F000000080010000F000000080010000F0000000
      8001000000000000800100000000000080010000000000008001000000000000
      80010000000F000080010000000F000080030000000F000080070000000F0000
      800F01FF000F0000800FFFFF03FF000000000000000000000000000000000000
      000000000000}
  end
  object ApplicationEvents: TApplicationEvents
    OnActivate = ApplicationEventsActivate
    OnHint = ApplicationEventsHint
    OnMessage = ApplicationEventsMessage
    Left = 62
    Top = 148
  end
  object PageControlPopupMenu: TBCPopupMenu
    Left = 62
    Top = 236
    object FileCloseMenuItem: TMenuItem
      Action = DatabaseCloseTabAction
    end
    object FileCloseAllMenuItem: TMenuItem
      Action = DatabaseCloseAllTabAction
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object CloseAllOtherPages1: TMenuItem
      Action = DatabaseCloseAllOtherTabsAction
      Enabled = False
    end
  end
  object DocumentPopupMenu: TBCPopupMenu
    Images = MenuImageList
    Left = 60
    Top = 302
    object MenuItem1: TMenuItem
      Action = FileCloseAction
    end
    object MenuItem2: TMenuItem
      Action = FileCloseAllAction
    end
    object MenuItem3: TMenuItem
      Caption = '-'
    end
    object MenuItem4: TMenuItem
      Action = FileCloseAllOtherPagesAction
    end
    object Separator1MenuItem: TMenuItem
      Caption = '-'
    end
    object SaveMenuItem: TMenuItem
      Action = FileSaveAction
    end
    object SaveAsMenuItem: TMenuItem
      Action = FileSaveAsAction
    end
    object Separator2MenuItem: TMenuItem
      Caption = '-'
    end
    object PrintMenuItem: TMenuItem
      Action = FilePrintAction
    end
    object PrintPreviewMenuItem: TMenuItem
      Action = FilePrintPreviewAction
    end
    object Separator3MenuItem: TMenuItem
      Caption = '-'
    end
    object SelectforCompareMenuItem: TMenuItem
      Action = ToolsSelectForCompareAction
    end
  end
  object DragDrop: TJvDragDrop
    DropTarget = Owner
    OnDrop = DragDropDrop
    Left = 212
    Top = 144
  end
end
