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
      Font.Height = -12
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
                ImageIndex = 0
                ShortCut = 16462
              end
              item
                Action = FileOpenAction
                Caption = '&Open...'
                ImageIndex = 1
                ShortCut = 16463
              end
              item
                Items = <
                  item
                    Action = FileReopenClearAction
                    ImageIndex = 20
                  end>
                Action = FileReopenAction
                ImageIndex = 2
                UsageCount = 1
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
                Action = FileCloseAction
                Caption = '&Close'
                ImageIndex = 6
                ShortCut = 16499
              end
              item
                Action = FileCloseAllAction
                Caption = 'C&lose All'
                ImageIndex = 7
              end
              item
                Action = FileCloseAllOtherPagesAction
                Caption = 'Close All O&ther Pages'
                ImageIndex = 8
                ShortCut = 24691
              end
              item
                Caption = '-'
              end
              item
                Action = FilePrintAction
                Caption = '&Print...'
                ImageIndex = 9
                ShortCut = 16464
              end
              item
                Action = FilePrintPreviewAction
                Caption = 'Pr&int Preview...'
                ImageIndex = 10
              end
              item
                Caption = '-'
              end
              item
                Action = FileExitAction
                ImageIndex = 11
                ShortCut = 32883
              end>
            Caption = '&File'
          end
          item
            Items = <
              item
                Action = EditUndoAction
                ImageIndex = 12
                ShortCut = 16474
              end
              item
                Action = EditRedoAction
                ImageIndex = 13
                ShortCut = 24666
              end
              item
                Caption = '-'
              end
              item
                Action = EditCutAction
                ImageIndex = 14
                ShortCut = 16472
              end
              item
                Action = EditCopyAction
                Caption = 'C&opy'
                ImageIndex = 15
                ShortCut = 16451
              end
              item
                Action = EditPasteAction
                ImageIndex = 16
                ShortCut = 16470
              end
              item
                Action = EditSelectAllAction
                ImageIndex = 17
                ShortCut = 16449
              end
              item
                Caption = '-'
              end
              item
                Items = <
                  item
                    Action = EditInsertLineAction
                    ImageIndex = 19
                    ShortCut = 16462
                  end>
                Action = EditInsertAction
                ImageIndex = 18
                UsageCount = 1
              end
              item
                Items = <
                  item
                    Action = EditDeleteLineAction
                    ImageIndex = 21
                    ShortCut = 16473
                  end
                  item
                    Action = EditDeleteEOLAction
                    Caption = '&End of Line'
                    ImageIndex = 22
                    ShortCut = 24665
                  end
                  item
                    Action = EditDeleteWordAction
                    ImageIndex = 23
                    ShortCut = 16468
                  end>
                Action = EditDeleteAction
                ImageIndex = 20
                UsageCount = 1
              end
              item
                Caption = '-'
              end
              item
                Items = <
                  item
                    Action = EditIncreaseIndentAction
                    ImageIndex = 25
                    ShortCut = 24649
                  end
                  item
                    Action = EditDecreaseIndentAction
                    ImageIndex = 26
                    ShortCut = 24661
                  end>
                Action = EditIndentAction
                ImageIndex = 24
                UsageCount = 1
              end
              item
                Items = <
                  item
                    Action = EditSortAscAction
                    ImageIndex = 28
                    ShortCut = 24641
                  end
                  item
                    Action = EditSortDescAction
                    ImageIndex = 29
                    ShortCut = 24644
                  end>
                Action = EditSortAction
                ImageIndex = 27
                UsageCount = 1
              end
              item
                Caption = '-'
              end
              item
                Action = EditToggleCaseAction
                ImageIndex = 30
                ShortCut = 24643
              end>
            Caption = '&Edit'
          end
          item
            Items = <
              item
                Action = SearchAction
                ImageIndex = 31
                ShortCut = 16454
              end
              item
                Action = SearchReplaceAction
                ImageIndex = 32
                ShortCut = 16466
              end
              item
                Action = SearchFindInFilesAction
                ImageIndex = 33
                ShortCut = 24646
              end
              item
                Caption = '-'
              end
              item
                Action = SearchFindNextAction
                ImageIndex = 34
                ShortCut = 114
              end
              item
                Action = SearchFindPreviousAction
                ImageIndex = 35
                ShortCut = 8306
              end
              item
                Caption = '-'
              end
              item
                Action = SearchToggleBookmarkAction
                Caption = '&Toggle Bookmark'
                ImageIndex = 36
                ShortCut = 16497
              end
              item
                Items = <
                  item
                    Action = ToggleBookmarks1Action
                    ImageIndex = 38
                    ShortCut = 24625
                  end
                  item
                    Action = ToggleBookmarks2Action
                    ImageIndex = 39
                    ShortCut = 24626
                  end
                  item
                    Action = ToggleBookmarks3Action
                    ImageIndex = 40
                    ShortCut = 24627
                  end
                  item
                    Action = ToggleBookmarks4Action
                    ImageIndex = 41
                    ShortCut = 24628
                  end
                  item
                    Action = ToggleBookmarks5Action
                    ImageIndex = 42
                    ShortCut = 24629
                  end
                  item
                    Action = ToggleBookmarks6Action
                    ImageIndex = 43
                    ShortCut = 24630
                  end
                  item
                    Action = ToggleBookmarks7Action
                    ImageIndex = 44
                    ShortCut = 24631
                  end
                  item
                    Action = ToggleBookmarks8Action
                    ImageIndex = 45
                    ShortCut = 24632
                  end
                  item
                    Action = ToggleBookmarks9Action
                    ImageIndex = 46
                    ShortCut = 24633
                  end>
                Action = SearchToggleBookmarksAction
                Caption = 'T&oggle Bookmarks'
                ImageIndex = 37
                UsageCount = 1
              end
              item
                Items = <
                  item
                    Action = GotoBookmarks1Action
                    ImageIndex = 38
                    ShortCut = 16433
                  end
                  item
                    Action = GotoBookmarks2Action
                    ImageIndex = 39
                    ShortCut = 16434
                  end
                  item
                    Action = GotoBookmarks3Action
                    ImageIndex = 40
                    ShortCut = 16435
                  end
                  item
                    Action = GotoBookmarks4Action
                    ImageIndex = 41
                    ShortCut = 16436
                  end
                  item
                    Action = GotoBookmarks5Action
                    ImageIndex = 42
                    ShortCut = 16437
                  end
                  item
                    Action = GotoBookmarks6Action
                    ImageIndex = 43
                    ShortCut = 16438
                  end
                  item
                    Action = GotoBookmarks7Action
                    ImageIndex = 44
                    ShortCut = 16439
                  end
                  item
                    Action = GotoBookmarks8Action
                    ImageIndex = 45
                    ShortCut = 16440
                  end
                  item
                    Action = GotoBookmarks9Action
                    ImageIndex = 46
                    ShortCut = 16441
                  end>
                Action = SearchGotoBookmarksAction
                Caption = '&Go to Bookmarks'
                ImageIndex = 47
                UsageCount = 1
              end
              item
                Action = ClearBookmarksAction
                ImageIndex = 48
              end
              item
                Caption = '-'
              end
              item
                Action = SearchGotoLineAction
                Caption = 'Go to &Line'
                ImageIndex = 49
                ShortCut = 16455
              end>
            Caption = '&Search'
          end
          item
            Items = <
              item
                Action = DatabaseNewConnectionMenuAction
                ImageIndex = 50
              end
              item
                Action = DatabaseEndConnectionMenuAction
                ImageIndex = 51
              end
              item
                Caption = '-'
              end
              item
                Action = DatabaseEditorMenuAction
                ImageIndex = 52
              end
              item
                Caption = '-'
              end
              item
                Action = DatabaseObjectSearchAction
                ImageIndex = 53
              end
              item
                Caption = '-'
              end
              item
                Items = <
                  item
                    Action = DatabaseCreateConstraintAction
                    ImageIndex = 54
                  end
                  item
                    Action = DatabaseCreateDBLinkAction
                    ImageIndex = 55
                  end
                  item
                    Action = DatabaseCreateFunctionAction
                    ImageIndex = 56
                  end
                  item
                    Action = DatabaseCreateIndexAction
                    ImageIndex = 57
                  end
                  item
                    Action = DatabaseCreatePackageAction
                    ImageIndex = 58
                  end
                  item
                    Action = DatabaseCreateProcedureAction
                    ImageIndex = 59
                  end
                  item
                    Action = DatabaseCreateSequenceAction
                    ImageIndex = 60
                  end
                  item
                    Action = DatabaseCreateSynonymAction
                    ImageIndex = 61
                  end
                  item
                    Action = DatabaseCreateTableAction
                    ImageIndex = 62
                  end
                  item
                    Action = DatabaseCreateTriggerAction
                    ImageIndex = 63
                  end
                  item
                    Action = DatabaseCreateUserAction
                    ImageIndex = 64
                  end
                  item
                    Action = DatabaseCreateViewAction
                    ImageIndex = 65
                  end>
                Action = DatabaseCreateAction
                ImageIndex = 18
                UsageCount = 1
              end
              item
                Items = <
                  item
                    Action = DatabaseExportTableDataAction
                    ImageIndex = 66
                  end>
                Action = DatabaseExportAction
                ImageIndex = 66
                UsageCount = 1
              end
              item
                Items = <
                  item
                    Action = DatabaseImportTableDataAction
                    ImageIndex = 67
                  end>
                Caption = '&Import'
                ImageIndex = 67
                UsageCount = 1
              end
              item
                Caption = '-'
              end
              item
                Action = DatabaseRefreshAction
                ImageIndex = 68
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
                ImageIndex = 69
                ShortCut = 122
              end
              item
                Caption = '-'
              end
              item
                Action = ViewWordWrapAction
              end
              item
                Action = ViewLineNumbersAction
              end
              item
                Action = ViewSpecialCharsAction
                Caption = 'S&pecial Chars'
              end
              item
                Action = ViewSelectionModeAction
                Caption = 'S&election Mode'
              end
              item
                Caption = '-'
              end
              item
                Action = ViewStyleAction
                ImageIndex = 74
                UsageCount = 1
              end
              item
                Caption = '-'
              end
              item
                Action = ViewNextPageAction
                ImageIndex = 75
                ShortCut = 16393
              end
              item
                Action = ViewPreviousPageAction
                Caption = 'P&revious Page'
                ImageIndex = 76
                ShortCut = 24585
              end>
            Caption = '&View'
          end
          item
            Items = <
              item
                Action = ToolsCompareFilesAction
                ImageIndex = 77
              end
              item
                Caption = '-'
              end
              item
                Action = ToolsCompareSchemasAction
                ImageIndex = 78
              end
              item
                Action = SchemaDocumentAction
                Caption = 'Sc&hema Document...'
                ImageIndex = 79
              end
              item
                Action = TNSNamesEditorAction
                ImageIndex = 80
              end
              item
                Caption = '-'
              end
              item
                Action = ToolsOptionsAction
                ImageIndex = 81
              end>
            Caption = '&Tools'
          end
          item
            Items = <
              item
                Action = HelpCheckForUpdateMenuAction
                Caption = '&Check for Updates...'
                ImageIndex = 82
              end
              item
                Caption = '-'
              end
              item
                Action = HelpHomeAction
                Caption = '&Visit Homepage...'
                ImageIndex = 83
              end
              item
                Caption = '-'
              end
              item
                Action = HelpAboutMenuAction
                Caption = '&About OraBone...'
                ImageIndex = 84
              end>
            Caption = '&Help'
          end>
        ActionBar = ActionMainMenuBar
      end
      item
        Items = <
          item
            Action = DatabaseNewConnectionMenuAction
            ImageIndex = 50
            ShowCaption = False
          end
          item
            Action = DatabaseEndConnectionMenuAction
            ImageIndex = 51
            ShowCaption = False
          end
          item
            Caption = '-'
          end
          item
            Action = DatabaseEditorMenuAction
            ImageIndex = 52
            ShowCaption = False
          end
          item
            Caption = '-'
          end
          item
            Action = DatabaseObjectSearchAction
            ImageIndex = 53
            ShowCaption = False
          end
          item
            Caption = '-'
          end
          item
            Action = DatabaseExportTableDataAction
            ImageIndex = 66
            ShowCaption = False
          end
          item
            Action = DatabaseImportTableDataAction
            Caption = 'T&able Data...'
            ImageIndex = 67
            ShowCaption = False
          end
          item
            Caption = '-'
          end
          item
            Action = DatabaseRefreshAction
            ImageIndex = 68
            ShowCaption = False
            ShortCut = 116
          end
          item
            Caption = '-'
          end
          item
            Action = SQLHistoryAction
            ImageIndex = 69
            ShowCaption = False
            ShortCut = 122
          end
          item
            Caption = '-'
          end
          item
            Action = ToolsCompareSchemasAction
            Caption = '&Compare Schemas...'
            ImageIndex = 78
            ShowCaption = False
          end
          item
            Action = SchemaDocumentAction
            Caption = 'Sc&hema Document...'
            ImageIndex = 79
            ShowCaption = False
          end
          item
            Action = TNSNamesEditorAction
            Caption = 'TNSNa&mes Editor...'
            ImageIndex = 80
            ShowCaption = False
          end
          item
            Caption = '-'
          end
          item
            Action = ToolsOptionsAction
            Caption = 'O&ptions...'
            ImageIndex = 81
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
      ImageIndex = 50
      OnExecute = DatabaseNewConnectionMenuActionExecute
    end
    object DatabaseEndConnectionMenuAction: TAction
      Category = '&Database'
      Caption = '&End Connection...'
      Hint = 'End the active connection'
      ImageIndex = 51
      OnExecute = DatabaseEndConnectionMenuActionExecute
    end
    object DatabaseEditorMenuAction: TAction
      Category = '&Database'
      Caption = 'E&ditor...'
      Hint = 'Open SQL Editor'
      ImageIndex = 52
      OnExecute = DatabaseEditorMenuActionExecute
    end
    object SearchAction: TAction
      Category = '&Search'
      Caption = '&Search...'
      Hint = 'Search the specified text'
      ImageIndex = 31
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
    object ToolsCompareFilesAction: TAction
      Category = '&Tools'
      Caption = '&Compare Files...'
      Hint = 'Compare files'
      ImageIndex = 77
      OnExecute = ToolsCompareFilesActionExecute
    end
    object HelpCheckForUpdateMenuAction: TAction
      Category = '&Help'
      Caption = 'Check for Updates...'
      ImageIndex = 82
      OnExecute = HelpCheckForUpdateMenuActionExecute
    end
    object HelpHomeAction: TAction
      Category = '&Help'
      Caption = 'Visit Homepage...'
      Hint = 'Visit OraBone homepage - http://www.bonecode.com/'
      ImageIndex = 83
      OnExecute = HelpHomeActionExecute
    end
    object HelpAboutMenuAction: TAction
      Category = '&Help'
      Caption = 'About OraBone...'
      Hint = 'Display OraBone information'
      ImageIndex = 84
      OnExecute = HelpAboutMenuActionExecute
    end
    object FileNewAction: TAction
      Category = '&File'
      Caption = '&New'
      Hint = 'Create a new document'
      ImageIndex = 0
      ShortCut = 16462
      OnExecute = FileNewActionExecute
    end
    object FileOpenAction: TAction
      Category = '&File'
      Caption = 'Open...'
      Hint = 'Open an existing SQL file'
      ImageIndex = 1
      ShortCut = 16463
      OnExecute = FileOpenActionExecute
    end
    object FileReopenAction: TAction
      Category = '&Reopen'
      Caption = '&Reopen'
      ImageIndex = 2
      OnExecute = DummyActionExecute
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
    object FileCloseAction: TAction
      Category = '&File'
      Caption = 'Close'
      Hint = 'Close the active SQL document'
      ImageIndex = 6
      ShortCut = 16499
      OnExecute = FileCloseActionExecute
    end
    object FileCloseAllAction: TAction
      Category = '&File'
      Caption = 'Close All'
      Hint = 'Close all open SQL documents'
      ImageIndex = 7
      OnExecute = FileCloseAllActionExecute
    end
    object FileCloseAllOtherPagesAction: TAction
      Category = '&File'
      Caption = 'Close All Other Pages'
      Hint = 'Close All Other SQL Documents'
      ImageIndex = 8
      ShortCut = 24691
      OnExecute = FileCloseAllOtherPagesActionExecute
    end
    object FilePrintAction: TAction
      Category = '&File'
      Caption = 'Print...'
      Hint = 'Print the active SQL document'
      ImageIndex = 9
      ShortCut = 16464
      OnExecute = FilePrintActionExecute
    end
    object FilePrintPreviewAction: TAction
      Category = '&File'
      Caption = 'Print Preview...'
      Hint = 'Preview the active SQL document'
      ImageIndex = 10
      OnExecute = FilePrintPreviewActionExecute
    end
    object FileExitAction: TAction
      Category = '&File'
      Caption = '&Exit'
      Hint = 'Quit the application'
      ImageIndex = 11
      ShortCut = 32883
      OnExecute = FileExitActionExecute
    end
    object EditUndoAction: TAction
      Category = '&Edit'
      Caption = '&Undo'
      Hint = 'Undo the last action'
      ImageIndex = 12
      ShortCut = 16474
      OnExecute = EditUndoActionExecute
    end
    object EditRedoAction: TAction
      Category = '&Edit'
      Caption = '&Redo'
      Hint = 'Redo the previously undone action'
      ImageIndex = 13
      ShortCut = 24666
      OnExecute = EditRedoActionExecute
    end
    object EditCutAction: TAction
      Category = '&Edit'
      Caption = '&Cut'
      Hint = 'Cut the selection and put it on the Clipboard'
      ImageIndex = 14
      ShortCut = 16472
      OnExecute = EditCutActionExecute
    end
    object EditCopyAction: TAction
      Category = '&Edit'
      Caption = '&Copy'
      Hint = 'Copy the selection and put it on the Clipboard'
      ImageIndex = 15
      ShortCut = 16451
      OnExecute = EditCopyActionExecute
    end
    object EditPasteAction: TAction
      Category = '&Edit'
      Caption = '&Paste'
      Hint = 'Insert Clipboard contents'
      ImageIndex = 16
      ShortCut = 16470
      OnExecute = EditPasteActionExecute
    end
    object SearchReplaceAction: TAction
      Category = '&Search'
      Caption = '&Replace...'
      Hint = 'Replace the specified text with different text'
      ImageIndex = 32
      ShortCut = 16466
      OnExecute = SearchReplaceActionExecute
    end
    object SearchFindInFilesAction: TAction
      Category = '&Search'
      Caption = '&Find in Files...'
      Hint = 'Search for a string in multiple files'
      ImageIndex = 33
      ShortCut = 24646
      OnExecute = SearchFindInFilesActionExecute
    end
    object SearchFindNextAction: TAction
      Category = '&Search'
      Caption = 'Find &Next'
      Hint = 'Find the next matching text'
      ImageIndex = 34
      ShortCut = 114
      OnExecute = SearchFindNextActionExecute
    end
    object SearchFindPreviousAction: TAction
      Category = '&Search'
      Caption = 'Find &Previous'
      Hint = 'Find the previous matching text'
      ImageIndex = 35
      ShortCut = 8306
      OnExecute = SearchFindPreviousActionExecute
    end
    object SearchToggleBookmarkAction: TAction
      Category = '&Search'
      Caption = 'Toggle Bookmark'
      Hint = 
        'Set or clear bookmark at current line. Bookmarks can be also set' +
        ' by using Ctrl+Shift+0..9. Go to bookmark by using Ctrl+0..9.'
      ImageIndex = 36
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
      ImageIndex = 69
      ShortCut = 122
      OnExecute = SQLHistoryActionExecute
    end
    object ViewWordWrapAction: TAction
      Category = '&View'
      Caption = '&Word Wrap'
      Hint = 'Toggle word wrap'
      ImageIndex = 70
      OnExecute = ViewWordWrapActionExecute
    end
    object ViewLineNumbersAction: TAction
      Category = '&View'
      Caption = '&Line Numbers'
      Hint = 'Toggle line numbers'
      ImageIndex = 71
      OnExecute = ViewLineNumbersActionExecute
    end
    object ViewSpecialCharsAction: TAction
      Category = '&View'
      Caption = '&Special Chars'
      Hint = 'Toggle special characters'
      ImageIndex = 72
      OnExecute = ViewSpecialCharsActionExecute
    end
    object ViewSelectionModeAction: TAction
      Category = '&View'
      Caption = '&Selection Mode'
      Hint = 
        'Toggle selection mode. Also pressing Alt on editor will toggle s' +
        'election mode.'
      ImageIndex = 73
      OnExecute = ViewSelectionModeActionExecute
    end
    object ViewStyleAction: TAction
      Category = '&View'
      Caption = 'St&yle'
      ImageIndex = 74
      OnExecute = DummyActionExecute
    end
    object ViewNextPageAction: TAction
      Category = '&View'
      Caption = '&Next Page'
      Hint = 'Go next page'
      ImageIndex = 75
      ShortCut = 16393
      OnExecute = ViewNextPageActionExecute
    end
    object DatabaseObjectSearchAction: TAction
      Category = '&Database'
      Caption = '&Object Search...'
      Hint = 'Object search'
      ImageIndex = 53
      OnExecute = DatabaseObjectSearchActionExecute
    end
    object DatabaseRefreshAction: TAction
      Category = '&Database'
      Caption = '&Refresh'
      Hint = 'Refresh active schema browser'
      ImageIndex = 68
      ShortCut = 116
      OnExecute = DatabaseRefreshActionExecute
    end
    object DatabaseCloseTabAction: TAction
      Category = 'SQLEditor'
      Caption = '&Close'
      Hint = 'Close the active page'
      ImageIndex = 6
      ShortCut = 16499
      OnExecute = DatabaseCloseTabActionExecute
    end
    object DatabaseCloseAllTabAction: TAction
      Category = 'SQLEditor'
      Caption = 'Close &All'
      Hint = 'Close all pages'
      ImageIndex = 7
      OnExecute = DatabaseCloseAllTabActionExecute
    end
    object DatabaseCloseAllOtherTabsAction: TAction
      Category = 'SQLEditor'
      Caption = 'Close All Other Pages'
      Hint = 'Close all other pages than active page'
      ImageIndex = 8
      ShortCut = 24691
      OnExecute = DatabaseCloseAllOtherTabsActionExecute
    end
    object DatabaseCommitAction: TAction
      Category = 'SQLEditor'
      Caption = 'Commit'
      Hint = 'Commit'
      ImageIndex = 85
      OnExecute = DatabaseCommitActionExecute
    end
    object DatabaseRollbackAction: TAction
      Category = 'SQLEditor'
      Caption = 'Rollback'
      Hint = 'Rollback'
      ImageIndex = 86
      OnExecute = DatabaseRollbackActionExecute
    end
    object ExecuteStatementAction: TAction
      Category = 'SQLEditor'
      Caption = 'Execute Statement'
      Hint = 
        'Execute statement. Execute current statement by using Ctrl+Enter' +
        '.'
      ImageIndex = 87
      ShortCut = 120
      OnExecute = ExecuteStatementActionExecute
    end
    object ExecuteCurrentStatementAction: TAction
      Category = 'SQLEditor'
      Caption = 'Execute Current Statement'
      Hint = 'Execute current statement'
      ImageIndex = 88
      ShortCut = 16397
      OnExecute = ExecuteCurrentStatementActionExecute
    end
    object ExecuteScriptAction: TAction
      Category = 'SQLEditor'
      Caption = 'Execute Script'
      Hint = 'Execute as script'
      ImageIndex = 89
      ShortCut = 116
      OnExecute = ExecuteScriptActionExecute
    end
    object InsertObjectAction: TAction
      Category = 'SQLEditor'
      Caption = 'Insert Object'
      Hint = 'Insert object'
      ImageIndex = 90
      ShortCut = 16463
      OnExecute = InsertObjectActionExecute
    end
    object DBMSOutputAction: TAction
      Category = 'SQLEditor'
      Caption = 'DBMS Output'
      Hint = 'Toggle DBMS output'
      ImageIndex = 91
      OnExecute = DBMSOutputActionExecute
    end
    object ExplainPlanAction: TAction
      Category = 'SQLEditor'
      Caption = 'Explain Plan'
      Hint = 'Run explain plan for current statement'
      ImageIndex = 93
      OnExecute = ExplainPlanActionExecute
    end
    object DatabaseExportAction: TAction
      Category = 'E&xport'
      Caption = 'Ex&port'
      ImageIndex = 66
      OnExecute = DummyActionExecute
    end
    object DatabaseExportTableDataAction: TAction
      Category = 'E&xport'
      Caption = '&Table Data...'
      Hint = 'Export table data'
      ImageIndex = 66
      OnExecute = DatabaseExportTableDataActionExecute
    end
    object DatabaseImportAction: TAction
      Category = '&Import'
      Caption = '&Import'
      ImageIndex = 67
      OnExecute = DummyActionExecute
    end
    object DatabaseImportTableDataAction: TAction
      Category = '&Import'
      Caption = '&Table Data...'
      Hint = 'Import table data'
      ImageIndex = 67
      OnExecute = DatabaseImportTableDataActionExecute
    end
    object FormatSQLAction: TAction
      Category = 'SQLEditor'
      Caption = 'Format SQL'
      Enabled = False
      Hint = 'Format SQL (upcoming feature)'
      ImageIndex = 94
      OnExecute = FormatSQLActionExecute
    end
    object EditSelectAllAction: TAction
      Category = '&Edit'
      Caption = '&Select All'
      Hint = 'Select all'
      ImageIndex = 17
      ShortCut = 16449
      OnExecute = EditSelectAllActionExecute
    end
    object ToolsSelectForCompareAction: TAction
      Category = '&Tools'
      Caption = 'Select for Compare...'
      Hint = 'Select for compare'
      ImageIndex = 77
      OnExecute = ToolsSelectForCompareActionExecute
    end
    object ToolsCompareSchemasAction: TAction
      Category = '&Tools'
      Caption = 'Compare &Schemas...'
      Hint = 'Compare schemas'
      ImageIndex = 78
      OnExecute = ToolsCompareSchemasActionExecute
    end
    object SchemaDocumentAction: TAction
      Category = '&Tools'
      Caption = 'Schema Document...'
      Hint = 'Schema document'
      ImageIndex = 79
      OnExecute = SchemaDocumentActionExecute
    end
    object ViewPreviousPageAction: TAction
      Category = '&View'
      Caption = '&Previous Page'
      ImageIndex = 76
      ShortCut = 24585
      OnExecute = ViewPreviousPageActionExecute
    end
    object EditIndentAction: TAction
      Category = '&Indent'
      Caption = 'I&ndent'
      ImageIndex = 24
      OnExecute = DummyActionExecute
    end
    object EditIncreaseIndentAction: TAction
      Category = '&Indent'
      Caption = '&Increase'
      Hint = 'Increase indent'
      ImageIndex = 25
      SecondaryShortCuts.Strings = (
        'Tab')
      ShortCut = 24649
      OnExecute = EditIncreaseIndentActionExecute
    end
    object EditDecreaseIndentAction: TAction
      Category = '&Indent'
      Caption = '&Decrease'
      Hint = 'Decrease indent'
      ImageIndex = 26
      SecondaryShortCuts.Strings = (
        'Shift+Tab')
      ShortCut = 24661
      OnExecute = EditDecreaseIndentActionExecute
    end
    object EditSortAction: TAction
      Category = '&Sort'
      Caption = 'Sort'
      ImageIndex = 27
      OnExecute = DummyActionExecute
    end
    object EditSortAscAction: TAction
      Category = '&Sort'
      Caption = '&Ascending'
      Hint = 'Sort ascending'
      ImageIndex = 28
      ShortCut = 24641
      OnExecute = EditSortAscActionExecute
    end
    object EditSortDescAction: TAction
      Category = '&Sort'
      Caption = '&Descending'
      Hint = 'Sort descending'
      ImageIndex = 29
      ShortCut = 24644
      OnExecute = EditSortDescActionExecute
    end
    object EditToggleCaseAction: TAction
      Category = '&Edit'
      Caption = '&Toggle Case'
      Hint = 'Toggle case'
      ImageIndex = 30
      ShortCut = 24643
      OnExecute = EditToggleCaseActionExecute
    end
    object EditInsertAction: TAction
      Category = '&Insert'
      Caption = '&Insert'
      ImageIndex = 18
      OnExecute = DummyActionExecute
    end
    object EditInsertLineAction: TAction
      Category = '&Insert'
      Caption = '&Line'
      Hint = 'Insert line'
      ImageIndex = 19
      ShortCut = 16462
      OnExecute = EditInsertLineActionExecute
    end
    object EditDeleteAction: TAction
      Category = '&Delete'
      Caption = '&Delete'
      ImageIndex = 20
      OnExecute = DummyActionExecute
    end
    object EditDeleteLineAction: TAction
      Category = '&Delete'
      Caption = '&Line'
      Hint = 'Delete line'
      ImageIndex = 21
      ShortCut = 16473
      OnExecute = EditDeleteLineActionExecute
    end
    object EditDeleteEOLAction: TAction
      Category = '&Delete'
      Caption = 'End of Line'
      Hint = 'Delete end of line'
      ImageIndex = 22
      ShortCut = 24665
      OnExecute = EditDeleteEOLActionExecute
    end
    object EditDeleteWordAction: TAction
      Category = '&Delete'
      Caption = '&Word'
      Hint = 'Delete word'
      ImageIndex = 23
      ShortCut = 16468
      OnExecute = EditDeleteWordActionExecute
    end
    object TNSNamesEditorAction: TAction
      Category = '&Tools'
      Caption = '&TNSNames Editor...'
      Hint = 'Configuration file (tnsnames.ora) editor'
      ImageIndex = 80
      OnExecute = TNSNamesEditorActionExecute
    end
    object ToolsOptionsAction: TAction
      Category = '&Tools'
      Caption = '&Options...'
      Hint = 'Set options'
      ImageIndex = 81
      OnExecute = ToolsOptionsActionExecute
    end
    object DatabaseCreateAction: TAction
      Category = '&Create'
      Caption = '&Create'
      ImageIndex = 18
      OnExecute = DummyActionExecute
    end
    object DatabaseCreateConstraintAction: TAction
      Category = '&Create'
      Caption = '&Constraint...'
      ImageIndex = 54
      OnExecute = DatabaseCreateConstraintActionExecute
    end
    object DatabaseCreateDBLinkAction: TAction
      Category = '&Create'
      Caption = '&DB Link...'
      ImageIndex = 55
      OnExecute = DatabaseCreateDBLinkActionExecute
    end
    object DatabaseCreateFunctionAction: TAction
      Category = '&Create'
      Caption = '&Function...'
      ImageIndex = 56
      OnExecute = DatabaseCreateFunctionActionExecute
    end
    object DatabaseCreateIndexAction: TAction
      Category = '&Create'
      Caption = '&Index...'
      ImageIndex = 57
      OnExecute = DatabaseCreateIndexActionExecute
    end
    object DatabaseCreatePackageAction: TAction
      Category = '&Create'
      Caption = '&Package...'
      ImageIndex = 58
      OnExecute = DatabaseCreatePackageActionExecute
    end
    object DatabaseCreateProcedureAction: TAction
      Category = '&Create'
      Caption = 'P&rocedure...'
      ImageIndex = 59
      OnExecute = DatabaseCreateProcedureActionExecute
    end
    object DatabaseCreateSequenceAction: TAction
      Category = '&Create'
      Caption = '&Sequence...'
      ImageIndex = 60
      OnExecute = DatabaseCreateSequenceActionExecute
    end
    object DatabaseCreateSynonymAction: TAction
      Category = '&Create'
      Caption = 'S&ynonym...'
      ImageIndex = 61
      OnExecute = DatabaseCreateSynonymActionExecute
    end
    object DatabaseCreateTableAction: TAction
      Category = '&Create'
      Caption = '&Table...'
      ImageIndex = 62
      OnExecute = DatabaseCreateTableActionExecute
    end
    object DatabaseCreateTriggerAction: TAction
      Category = '&Create'
      Caption = 'Tri&gger...'
      ImageIndex = 63
      OnExecute = DatabaseCreateTriggerActionExecute
    end
    object DatabaseCreateUserAction: TAction
      Category = '&Create'
      Caption = '&User...'
      ImageIndex = 64
      OnExecute = DatabaseCreateUserActionExecute
    end
    object DatabaseCreateViewAction: TAction
      Category = '&Create'
      Caption = '&View...'
      ImageIndex = 65
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
      ImageIndex = 48
      OnExecute = ClearBookmarksActionExecute
    end
    object SearchGotoLineAction: TAction
      Category = '&Search'
      Caption = 'Go to Line'
      ImageIndex = 49
      ShortCut = 16455
      OnExecute = SearchGotoLineActionExecute
    end
    object SearchGotoBookmarksAction: TAction
      Category = 'Go to Bookmarks'
      Caption = 'Go to Bookmarks'
      ImageIndex = 47
      OnExecute = DummyActionExecute
    end
    object GotoBookmarks1Action: TAction
      Category = 'Go to Bookmarks'
      Caption = 'Bookmark &1'
      ImageIndex = 38
      ShortCut = 16433
      OnExecute = GotoBookmarks0ActionExecute
    end
    object GotoBookmarks2Action: TAction
      Category = 'Go to Bookmarks'
      Caption = 'Bookmark &2'
      ImageIndex = 39
      ShortCut = 16434
      OnExecute = GotoBookmarks0ActionExecute
    end
    object GotoBookmarks3Action: TAction
      Category = 'Go to Bookmarks'
      Caption = 'Bookmark &3'
      ImageIndex = 40
      ShortCut = 16435
      OnExecute = GotoBookmarks0ActionExecute
    end
    object GotoBookmarks4Action: TAction
      Category = 'Go to Bookmarks'
      Caption = 'Bookmark &4'
      ImageIndex = 41
      ShortCut = 16436
      OnExecute = GotoBookmarks0ActionExecute
    end
    object GotoBookmarks5Action: TAction
      Category = 'Go to Bookmarks'
      Caption = 'Bookmark &5'
      ImageIndex = 42
      ShortCut = 16437
      OnExecute = GotoBookmarks0ActionExecute
    end
    object GotoBookmarks6Action: TAction
      Category = 'Go to Bookmarks'
      Caption = 'Bookmark &6'
      ImageIndex = 43
      ShortCut = 16438
      OnExecute = GotoBookmarks0ActionExecute
    end
    object GotoBookmarks7Action: TAction
      Category = 'Go to Bookmarks'
      Caption = 'Bookmark &7'
      ImageIndex = 44
      ShortCut = 16439
      OnExecute = GotoBookmarks0ActionExecute
    end
    object GotoBookmarks8Action: TAction
      Category = 'Go to Bookmarks'
      Caption = 'Bookmark &8'
      ImageIndex = 45
      ShortCut = 16440
      OnExecute = GotoBookmarks0ActionExecute
    end
    object GotoBookmarks9Action: TAction
      Category = 'Go to Bookmarks'
      Caption = 'Bookmark &9'
      ImageIndex = 46
      ShortCut = 16441
      OnExecute = GotoBookmarks0ActionExecute
    end
    object SearchToggleBookmarksAction: TAction
      Category = 'T&oggle Bookmarks'
      Caption = 'Toggle Bookmarks'
      ImageIndex = 37
      OnExecute = DummyActionExecute
    end
    object ToggleBookmarks1Action: TAction
      Category = 'T&oggle Bookmarks'
      Caption = 'Bookmark &1'
      ImageIndex = 38
      ShortCut = 24625
      OnExecute = ToggleBookmarks0ActionExecute
    end
    object ToggleBookmarks2Action: TAction
      Category = 'T&oggle Bookmarks'
      Caption = 'Bookmark &2'
      ImageIndex = 39
      ShortCut = 24626
      OnExecute = ToggleBookmarks0ActionExecute
    end
    object ToggleBookmarks3Action: TAction
      Category = 'T&oggle Bookmarks'
      Caption = 'Bookmark &3'
      ImageIndex = 40
      ShortCut = 24627
      OnExecute = ToggleBookmarks0ActionExecute
    end
    object ToggleBookmarks4Action: TAction
      Category = 'T&oggle Bookmarks'
      Caption = 'Bookmark &4'
      ImageIndex = 41
      ShortCut = 24628
      OnExecute = ToggleBookmarks0ActionExecute
    end
    object ToggleBookmarks5Action: TAction
      Category = 'T&oggle Bookmarks'
      Caption = 'Bookmark &5'
      ImageIndex = 42
      ShortCut = 24629
      OnExecute = ToggleBookmarks0ActionExecute
    end
    object ToggleBookmarks6Action: TAction
      Category = 'T&oggle Bookmarks'
      Caption = 'Bookmark &6'
      ImageIndex = 43
      ShortCut = 24630
      OnExecute = ToggleBookmarks0ActionExecute
    end
    object ToggleBookmarks7Action: TAction
      Category = 'T&oggle Bookmarks'
      Caption = 'Bookmark &7'
      ImageIndex = 44
      ShortCut = 24631
      OnExecute = ToggleBookmarks0ActionExecute
    end
    object ToggleBookmarks8Action: TAction
      Category = 'T&oggle Bookmarks'
      Caption = 'Bookmark &8'
      ImageIndex = 45
      ShortCut = 24632
      OnExecute = ToggleBookmarks0ActionExecute
    end
    object ToggleBookmarks9Action: TAction
      Category = 'T&oggle Bookmarks'
      Caption = 'Bookmark &9'
      ImageIndex = 46
      ShortCut = 24633
      OnExecute = ToggleBookmarks0ActionExecute
    end
    object FileReopenClearAction: TAction
      Category = '&Reopen'
      Caption = '&Clear'
      ImageIndex = 20
      OnExecute = FileReopenClearActionExecute
    end
    object SelectReopenFileAction: TAction
      OnExecute = SelectReopenFileActionExecute
    end
  end
  object MenuImageList: TBCImageList
    Left = 62
    Top = 418
    Bitmap = {
      494C010160006500040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000009001000001002000000000000090
      0100000000000000000000000000000000000000000000000000000000000000
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
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF000000FF00C2A6A400C2A6
      A4000000FF000000FF00C2A6A400C2A6A4000000FF00C2A6A400C2A6A400C2A6
      A4000000FF00C2A6A4000000FF000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000811E00000000
      000000000000811E000000000000811E0000811E0000811E0000000000000000
      000000000000811E0000811E0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF00000000000000FF00FEFC
      FB000000FF00FEFCFB000000FF00FEFCFB000000FF00FEFCFB00FEFCFB00FEFC
      FB000000FF00C2A6A400000000000000FF0000000000BC4E0300BC4E0300BC4E
      0300BC4E0300BC4E0300BC4E0300BC4E0300BC4E0300BC4E0300BC4E0300BC4E
      0300BC4E0300BC4E0300BC4E0300000000000000000000000000811E00000000
      000000000000811E000000000000811E00000000000000000000811E00000000
      0000811E00000000000000000000811E00000000000000000000C7C6C300BBB7
      AF00B2ACA000AFA99D00AEA99C00AEA89C00AEA89C00AEA89C00AFA99D00B2AC
      A000BBB7AF00C7C6C30000000000000000000000FF00000000000000FF00FEFC
      FB000000FF000000FF00DDCFC200DDCFC2000000FF00DDCFC2000000FF00DDCF
      C2000000FF00C2A6A4000000FF000000FF0000000000BC4D0200FFFFFF00FFFF
      FF00FFFFFF0068BA5B00FFEACF00FFEACF00FFEACF00B47B4100726A1E00FFCF
      A000FFCFA000FFCFA000BC4C0100000000000000000000000000811E0000811E
      0000811E0000811E000000000000811E0000811E0000811E0000811E00000000
      0000811E000000000000000000000000000000000000C1BEB900B4ADA200C2BB
      B000D0C7BE00DFD5CD00E6DCD400EDE1DB00EFE4DD00E7DDD600E1D6CF00D1C9
      BF00C3BCB100B4AEA200C1BEB900000000000000FF00000000000000FF00FEFA
      F5000000FF00FEFAF5000000FF00FEFCFB000000FF000000FF00FEFCFB000000
      FF000000FF00C2A6A4000000FF000000000000000000BC4E0300FFFFFF00FFFF
      FF00FFFFFF0068BA5B00FFEACF00FFEBD300FFE9C5007D706D000E485F007368
      5B00D4AC8300FFCFA000BD4D0200000000000000000000000000811E00000000
      000000000000811E00001280FF002567B8000000000000000000811E00000000
      0000811E00000000000000000000811E000000000000B1AB9F00C7C0B600CFC7
      BE00D5CCC300DBD2C900E2D8D000E9DDD700EBE0D900E3D9D200DDD3CB00D6CE
      C500D1C9C000C9C2B900B1AB9F00000000000000FF000000FF00C2A6A400FEFA
      F5000000FF000000FF00DDCFC200DDCFC2000000FF00FEFAF500FEFAF500FEFA
      F5000000FF00C2A6A4000000FF000000FF0000000000BA4C010070B7600067B6
      590067B65B003D9F2D0063AF4B0067AF4B0067AF48004E9941003C636F009F67
      6D005A4A360052773200BA4D010000000000000000000000000000000000811E
      0000811E00001773D7001673E9000F74E9000B74E7003F425400000000000000
      000000000000811E0000811E00000000000000000000B1AB9F00C9C0B800CDC5
      BC00D4CBC200DAD1C800E1D7CF00E7DCD500EADFD800E2D8D100DCD2CA00D5CD
      C400CFC7BE00CAC3B900B1AB9F00000000000000000000000000C2A6A400FEF7
      F000FEF7F000FEF7F000FEF7F000FEF7F000FEF7F000FEF7F000FEF7F000FEF7
      F000FEF7F000C2A6A400000000000000000000000000BC4D0200EDF3E500EDF7
      EB00EDF7EB0062B55500DAE5C400EDE6C900EDE0BB00E1D8A6005A7D3F00E595
      9A00A068690060483800C1490000000000000000000000000000000000000000
      00001370C7002287DE002B93EF002084E200116CCE000768CC000367C7000363
      BC000000000000000000000000000000000000000000B0AB9E00C8BFB700CBC3
      BA00D2C9C000D8CFC500DFD5CD00E9DFD800E9DDD600E0D6CF00DAD0C800D3CB
      C200CEC6BD00C9C2B700B0AA9E00000000000000000000000000C2A6A400FEF7
      F000DDCFC200DDCFC200DDCFC200DDCFC200DDCFC200DDCFC200FEF3E900FEF7
      F000FEF7F000C2A6A400000000000000000000000000BC4D0200FFFFF800FCFC
      FF00F7F7FF0063B46000F0F4E100FFFCEE00FFF2E600FAE6C70067AC4700DE9D
      9A00D9939900B16462006B5B3300000000000000000000000000000000000000
      00002288D70039A7ED003CA7EF004ABAFA003DAAF3001F83D7000D67B8000559
      A5000455980000569D00000000000000000000000000B0AA9E00C9C2B900E2DD
      D400F5EFE900FFFBF400FEFAF300FDF9F200FDF9F200FDFAF300FFFBF400F6F0
      E800E4DDD500CBC4BA00B0AA9E00000000000000000000000000C2A6A400FEF3
      E900FEF3E900FEF3E900FEF3E900FEF3E900FEF3E900FEF3E900FEF3E900FEF3
      E900FEF3E900C2A6A400000000000000000000000000C64E00008B8AF2004445
      EE003232E300222BC7006363F700A7BACE00A6D4880096C57B004EA739009FC4
      780084834F00758089000897C9000018A0000000000000000000000000001448
      C1002884D9002982DC001C72CB003AA3ED003AA5F00046B5FF00359FF0002C92
      E6001574BF0003549300000000000000000000000000C1BDB600F9F4EE00D7D0
      C800C6BEB600BEB5AB00C2B9AF00C7BCB400C8BEB500C3B9B100BFB6AC00C7BF
      B700D8D1C900F9F5ED00C1BDB600000000000000000000000000C2A6A400FFF0
      E200DDCFC200DDCFC200DDCFC200FEF3E900FFEEDE00FEF3E900FFEEDE00FEF3
      E900FFEEDE00C2A6A40000000000000000000000000066479D004647CC009790
      B600A099B400A7A1C1005B59C1001B2BBB006E9D9A009ED387004DA73C00A0CE
      8C00AFC27D006EADA7000559E000040CA5000000000000000000050997000E28
      B1002981E7002277D700206ACC002478D5001E6DCF002D8FE700349DF4003CA6
      FF003EA9FF0000000000000000000000000000000000BBB7AF00A3998F00B6AE
      A400C8BFB600D8CFC700E3D9D100EADED800ECE1DA00E4DAD300DAD1C900CAC1
      B800B8AFA600A49C9200BBB7AF00000000000000000000000000C2A6A400FEF3
      E900FFEEDE00FFF0E200FEF3E900FFEEDE00FFF0E200DDCFC200DDCFC200DDCF
      C200DDCFC200C2A6A40000000000000000004141FA00545AF000D4D4C500FFEF
      AC00F4BF8100FBC78800FFFAD1006D6BBD005952FF00EDEDF2006DBA5900FFFC
      FF00FFEFDD00FFE5B8005D446C00000000000000000005099700192FCB002A4F
      EE001A40DE001547E0001F6BE500195DCC001E67D1001A64CB00277DE20039A4
      FF000000000000000000000000000000000000000000B1AB9F00CAC1B900CEC7
      BE00D5CCC300DAD1C800E1D7CF00E8DCD600EADFD800E2D8D100DCD2CA00D6CE
      C500D1C9C000CBC4BA00B1AB9F00000000000000000000000000C2A6A400FFEE
      DE00DDCFC200DDCFC200DDCFC200DDCFC200DDCFC200C3B4A800C3B4A800C3B4
      A800C3B4A800C2A6A40000000000000000004141FA009F9ED700FFFFD400FEFC
      CA00FBF4C400F4D19600EEBB7D00D5C4B100393ACE00B4B8E90079C15B00FFF8
      F000FEEBD400FEE1BA00B0490A00000000000000000005099700284BE9002A5A
      FF00163EFF000525FF000122F3000D44EA001650CF00103EB500000000000000
      00000000000000000000000000000000000000000000B1AB9E00C8BFB700CBC3
      BA00D2C8BF00D8CEC500DFD5CD00E9DED800E9DDD600E0D6CF00DACFC700D3CB
      C200CEC6BD00C9C2B800B0AB9E00000000000000000000000000C2A6A400FFEE
      DE00FFEAD700FFEEDE00FFEAD700FFEAD700FFEEDE00B0A29600B0A29600B0A2
      9600B0A29600C2A6A40000000000000000004D4CF400AFBAE300FFFFF600FFFF
      D9008687750031343400544B3E00A39696004145D40092463700CE580100C756
      0200C7560200C7560200000000000000000000000000000000000711A400133D
      F4000D35FF00011DEB000227EA000A40E70005169F0000000000000000000000
      00000000000000000000000000000000000000000000B0AA9D00C7C0B800E1DB
      D200F3EDE600FDF9F200FCF8F100FBF7F000FBF7F000FCF8F100FDF8F200F4EE
      E600E2DBD300CAC3B900AFAA9D00000000000000000000000000C2A6A400FFEA
      D700DDCFC200DDCFC200DDCFC200FFEAD700C9B9AC00FEFAF500FEF7F000E6DA
      D900C2A6A4000000000000000000000000004545F800B2B2E000FFFFFF00FFFF
      F300D8D8B7005F605300B2976B00E7CBA900353EE5008E403000000000000000
      00000000000000000000000000000000000000000000000181000321CC00113C
      FA000818C4000106950003047D00000000000000000000000000000000000000
      00000000000000000000000000000000000000000000AEA89C00FBF5EF00EEE7
      DE00E3DCD300DDD5CC00DDD5CB00DDD4CB00DDD4CB00DDD4CB00DDD5CB00E3DC
      D300EEE7DE00FBF6EF00AEA89C00000000000000000000000000C2A6A400FFEA
      D700FFE6D000FFEAD700FFE6D000FFEAD700C5B5A900FEFAF500DDCFC200C2A6
      A400000000000000000000000000000000004545F8007E79E300F8F4EB00FFFF
      FF00FFFFFF00F2F2DE00A7A17900938FB5002D30FF0000000000000000000000
      00000000000000000000000000000000000000007E000523C4000E3FFF000C19
      AD00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000AFA99D00E1D8CE00E1D8
      CE00DFD6CC00DFD6CB00DFD5CB00DFD5CB00DFD5CB00DFD5CB00DFD6CB00DFD6
      CC00E1D8CE00E1D8CE00AFA99D00000000000000000000000000C2A6A400FFE6
      D000FFE6D000FFE6D000FFE6D000FFE6D000C9B9AC00DDCFC200C2A6A4000000
      000000000000000000000000000000000000000000004647FB00827FE000DDD8
      E500EAF4F000EEF3F600A6A5DC003839E9000000000000000000000000000000
      0000000000000000000000000000000000000316AD000C43FF000815B0000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000DCDAD400B6B0A400D2CA
      BF00E2D9D000EFE7DD00EEE6DC00EEE6DC00EEE6DC00EEE6DC00EFE7DD00E2D9
      D000D2CABF00B6B0A400DCDAD400000000000000000000000000C2A6A400C2A6
      A400C2A6A400C2A6A400C2A6A400C2A6A400C2A6A400C2A6A400000000000000
      00000000000000000000000000000000000000000000000000003536FE00403E
      F0004A49E9003C3CED002828FA00000000000000000000000000000000000000
      000000000000000000000000000000000000010CA100040FAF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000CBC7
      BF00B2ACA100AEA89C00AEA89C00AEA89C00AEA89C00AEA89C00AEA89C00B2AC
      A100CBC7BF000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000CEA4
      6F00AD712B000000000000000000000000000000000000000000000000000000
      000000000000B433070000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000092635D00A4676900A4676900A4676900A4676900A467
      6900A4676900A4676900A4676900A467690005A1180005A11800C2A6A400C2A6
      A40005A1180005A11800C2A6A400C2A6A40005A11800C2A6A400C2A6A400C2A6
      A40005A11800C2A6A40005A1180005A118000000000000000000C7C6C300BBB7
      AF00B2ACA000AFA99D00AEA99C00AEA89C00AEA89C00AEA89C00AFA99D00AF76
      3200F5CB8900AE74300000000000000000000000000000000000000000000000
      000005669500304B5000B4330700354141000566950005669500000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000096655E00FFFBD100FADEB400F8D9A600F4D19700F3CB
      8A00F0C78100F0C78100FCD586009F6F600005A118000000000005A11800FEFC
      FB0005A11800FEFCFB0005A11800FEFCFB0005A11800FEFCFB00FEFCFB00FEFC
      FB0005A11800C2A6A4000000000005A1180000000000C1BEB900B4ADA200C2BB
      B000D0C7BE00DFD5CD00E6DCD400EDE1DB00EFE4DD00E7DDD600E1D6CF00B179
      3600E2AF6200E7BA7700AF763200000000000000000000000000000000000274
      A90030C9E90013CAFB0072462A00B4330700797666002CA7D300056695000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000009A685E00FFF3D900F2D9BB00F2D4AF00EECCA1000155
      0300EAC08900E7BC8000F3C982009F6F600005A118000000000005A11800FEFC
      FB0005A1180005A11800DDCFC200DDCFC20005A11800DDCFC20005A11800DDCF
      C20005A11800C2A6A40005A1180005A1180000000000B1AB9F00C7C0B600CFC7
      BE00D5CCC300DBD2C900E2D8D000E9DDD700EBE0D900E3D9D200DDD3CB00B27A
      3800D29E4F00D19C4D00D09A4900AD722D0000000000000000000274A90073FA
      FE003FE3FE0013CAFB002DAFCC00863E1B00AC400600506664000386C1000566
      9500000000000000000000000000000000000000000000000000000000000000
      000000000000000000009F6C5F00FFFBE900F4E0C600F3DABA00015503002CC5
      580001550300EAC18700F3CA81009F6F600005A118000000000005A11800FEFA
      F50005A11800FEFAF50005A11800FEFCFB0005A1180005A11800FEFCFB0005A1
      180005A11800C2A6A40005A118000000000000000000B1AB9F00C9C0B800CDC5
      BC00D4CBC200DAD1C800E1D7CF00E7DCD500EADFD800E2D8D100DCD2CA00B27A
      3800C28A3800DCBE8F00B07734000000000000000000000000000274A90073FA
      FE003FE3FE0013CAFB0020CEFE0067827A0093411800B43307003E4340000566
      9500000000000000000000000000000000000000000000000000000000000000
      00000000000000000000A5706000FFFFF800F7E5D4000155030030BD570041E0
      750022B63E0001550300F4CE8A009F6F600005A1180005A11800C2A6A400FEFA
      F50005A1180005A11800DDCFC200DDCFC20005A11800FEFAF500FEFAF500FEFA
      F50005A11800C2A6A40005A1180005A1180000000000B0AB9E00C8BFB700CBC3
      BA00D2C9C000D8CFC500DFD5CD00E9DFD800E9DDD600E0D6CF00DAD0C800B179
      3500E4D0B000B0773300B0AA9E000000000000000000000000000274A90073FA
      FE003FE3FE0013CAFB0020CEFE0055D8F600874F3100B8663000A62902002D41
      4800000000000000000000000000000000000000000000000000000000000000
      00000000000000000000AC756200FFFFFF0001550300067F14001A922F0027BB
      4500149A26000C881600015503009F6F60000000000000000000C2A6A400FEF7
      F000FEF7F000FEF7F000FEF7F000FEF7F000FEF7F000FEF7F000FEF7F000FEF7
      F000FEF7F000C2A6A400000000000000000000000000B0AA9E00C9C2B900E2DD
      D400F5EFE900FFFBF400FEFAF300FDF9F200FDF9F200FDFAF300FFFBF400CC9E
      6500AF763100CBC4BA00B0AA9E000000000000000000000000000274A9009FFB
      FE00A3F3FF00B6F2FF00DAF8FF00E5FAFF00C5C2BA0093411800E7B47900A629
      0200000000000000000000000000000000000000000000000000000000000000
      00000000000000000000B47A6300FFFFFF00FCF7F200FAEEE3000155030015A5
      280001550300F2D3AC00FBDCA7009F6F60000000000000000000C2A6A400FEF7
      F000DDCFC200DDCFC200DDCFC200DDCFC200DDCFC200DDCFC200FEF3E900FEF7
      F000FEF7F000C2A6A400000000000000000000000000C1BDB600F9F4EE00D7D0
      C800C6BEB600BEB5AB00C2B9AF00C7BCB400C8BEB500C3B9B100BFB6AC00C7BF
      B700D8D1C900F9F5ED00C1BDB6000000000000000000000000000274A900A7E9
      F3001CAAD3000791C5000788BC00B0410000B0410000AC400600CE8C5900FEE0
      A700A62902000000000000000000000000000000000000000000000000000000
      00000000820000000000744E3E00FFFFFF00FFFEFE00FEF7F200036007000996
      130001550300FBE6C400EEDCB2009F6F60000000000000000000C2A6A400FEF3
      E900FEF3E900FEF3E900FEF3E900FEF3E900FEF3E900FEF3E900FEF3E900FEF3
      E900FEF3E900C2A6A400000000000000000000000000BBB7AF00A3998F00B6AE
      A400C8BFB600D8CFC700E3D9D100EADED800ECE1DA00E4DAD300DAD1C900CAC1
      B800B8AFA600A49C9200BBB7AF000000000000000000000000000274A90031B5
      D3003FE3FE0013CAFB0020CEFE00B0410000BF734000FCD39600EEB77A00A92D
      0300A6290200A629020000000000000000000000000000000000000000000000
      82003858F3000000820077513F009E9E9E00FFFFFF00036E070004780A00058C
      0D0001550300CBA69300AC8E8400A16B6D000000000000000000C2A6A400FFF0
      E200DDCFC200DDCFC200DDCFC200FEF3E900FFEEDE00FEF3E900FFEEDE00FEF3
      E900FFEEDE00C2A6A400000000000000000000000000B1AB9F00CAC1B900CEC7
      BE00D5CCC300DAD1C800E1D7CF00E8DCD600EADFD800E2D8D100DCD2CA00D6CE
      C500D1C9C000CBC4BA00B1AB9F000000000000000000000000000274A90073FA
      FE003FE3FE0013CAFB0020CEFE0054DEFF00B0410000BC693300F3B56A00DC8F
      4700A62902000000000000000000000000000000000000000000000082003858
      F300001DDA00000C96000000820001350200013502000177070005840C000266
      0600DAC1BB00A96A5400D98A40009F675B000000000000000000C2A6A400FEF3
      E900FFEEDE00FFF0E200FEF3E900FFEEDE00FFF0E200DDCFC200DDCFC200DDCF
      C200DDCFC200C2A6A400000000000000000000000000B1AB9E00C8BFB700CBC3
      BA00D2C8BF00D8CEC500DFD5CD00E9DED800E9DDD600E0D6CF00DACFC700D3CB
      C200CEC6BD00C9C2B800B0AB9E000000000000000000000000000274A90073FA
      FE003FE3FE0013CAFB0020CEFE0054DEFF0074E0F800B0410000B2541700D877
      1D00C65D0C00A92D0300000000000000000000000000000082003858F300001B
      F800001FEB000022E300000C9600000082009E9E9E009E9E9E00FFFFFF00FFFF
      FF00D8C5C7009F675B00E09A5B00000000000000000000000000C2A6A400FFEE
      DE00DDCFC200DDCFC200DDCFC200DDCFC200DDCFC200C3B4A800C3B4A800C3B4
      A800C3B4A800C2A6A400000000000000000000000000B0AA9D00C7C0B800E1DB
      D200F3EDE600FDF9F200FCF8F100FBF7F000FBF7F000FCF8F100FDF8F200F4EE
      E600E2DBD300CAC3B900AFAA9D000000000000000000000000000274A90073FA
      FE003FE3FE0013CAFB0020CEFE0054DEFF0074E0F80030B0DA00B0410000B041
      0000B0410000A6290200A6290200000000000000820093A6F700072FFF000425
      FF00001EFA00001EF2000020E300000C960000008200CF8E6800CF8E6800CF8E
      6800CF8E68009F675B0000000000000000000000000000000000C2A6A400FFEE
      DE00FFEAD700FFEEDE00FFEAD700FFEAD700FFEEDE00B0A29600B0A29600B0A2
      9600B0A29600C2A6A400000000000000000000000000AEA89C00FBF5EF00EEE7
      DE00E3DCD300DDD5CC00DDD5CB00DDD4CB00DDD4CB00DDD4CB00DDD5CB00E3DC
      D300EEE7DE00FBF6EF00AEA89C000000000000000000000000000274A90078FB
      FE0068F6FF0055F6FE005FFEFF0078FBFE0089FBFE0048CFF200058BC7000566
      950000000000000000000000000000000000000000000000820093A6F7000D35
      FF00062AFF000123FF000514A900000082000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C2A6A400FFEA
      D700DDCFC200DDCFC200DDCFC200FFEAD700C9B9AC00FEFAF500FEF7F000E6DA
      D900C2A6A40000000000000000000000000000000000AFA99D00E1D8CE00E1D8
      CE00DFD6CC00DFD6CB00DFD5CB00DFD5CB00DFD5CB00DFD5CB00DFD6CB00DFD6
      CC00E1D8CE00E1D8CE00AFA99D000000000000000000000000000274A900FBFF
      FF00F0FFFF00C6FFFF00A0FFFF009FFBFE009FFBFE0092FFFF0055F6FE000566
      95000000000000000000000000000000000000000000000000000000820093A6
      F7001340FF001730CC0001028600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C2A6A400FFEA
      D700FFE6D000FFEAD700FFE6D000FFEAD700C5B5A900FEFAF500DDCFC200C2A6
      A4000000000000000000000000000000000000000000DCDAD400B6B0A400D2CA
      BF00E2D9D000EFE7DD00EEE6DC00EEE6DC00EEE6DC00EEE6DC00EFE7DD00E2D9
      D000D2CABF00B6B0A400DCDAD400000000000000000000000000000000000479
      AF00EDFAFC00DAF8FF00B7FFFF009FFBFE0089FBFE0083FAFB00086B9A000000
      0000000000000000000000000000000000000000000000000000000000000000
      820093A6F70003068B0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C2A6A400FFE6
      D000FFE6D000FFE6D000FFE6D000FFE6D000C9B9AC00DDCFC200C2A6A4000000
      000000000000000000000000000000000000000000000000000000000000CBC7
      BF00B2ACA100AEA89C00AEA89C00AEA89C00AEA89C00AEA89C00AEA89C00B2AC
      A100CBC7BF000000000000000000000000000000000000000000000000000000
      00000274A9000274A9000274A9000274A9000274A9000274A900000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000082000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C2A6A400C2A6
      A400C2A6A400C2A6A400C2A6A400C2A6A400C2A6A400C2A6A400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000834200008A
      4A00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000002B3ABE002B3A
      BE00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000002640600013C0300013C
      0300013C03000262060000000000000000000000000000000000000000000000
      0000000000000000000000000000AE865D00A7774500AE865D00000000000000
      00000000000000000000000000000000000000000000C7C6C300BBB7AF00B2AC
      A000AFA99D00AEA99C00AEA89C0097928800AEA89C000083420000E4A6000088
      47009F9E9C0000000000000000000000000000000000C7C6C300BBB7AF00B2AC
      A000AFA99D00AEA99C00AEA89C00AEA89C00AEA89C00AFA99D002B3ABE005F73
      FE002B3ABE000000000000000000000000000000000000000000000000000566
      9500056695000566950005669500056695000267060005870F00019808000097
      070003890A0002630700013C0300000000000000000000000000000000000000
      00000000000000000000A97F5200C5A37E00FBF4E700C5A37E00A97F52000000
      000000000000000000000000000000000000C1BEB900B4ADA200C2BBB000D0C7
      BE00DFD5CD00E6DCD400CDC3BE00EFE4DD000083420000D8A00000D9A1000083
      42000087460000884700008A48000D845400C1BEB900B4ADA200C2BBB000D0C7
      BE00DFD5CD00E6DCD4003140C0002B3ABE002B3ABE002B3ABE002B3ABE005A6E
      F9005A6EF9002B3ABE00000000000000000000000000000000000274A90030C9
      E90012CBFE0020CEFE0054DEFF00117E2D000FA92D0007AB1D0083D88E0023B0
      2D00009C040003A60C0002660700026506000000000000000000000000000000
      000000000000A9805300C4A47F00F6EDDF00C19E7900F6EDDF00C4A47F00A980
      530000000000000000000000000000000000B1AB9F00C7C0B600CFC7BE00D5CC
      C300DBD2C900E2D8D000E9DDD7000083420000D39F0000D09C0000D09C0000D5
      9F0000D7A00000D7A00043E8C20000894700B1AB9F00C7C0B600CFC7BE00D5CC
      C300DBD2C900E2D8D0002B3ABE003E56F3005267F7005267F7005267F7005267
      F7005267F7005267F7002B3ABE0000000000000000000274A90073FAFE003FE3
      FE0012CBFE0020CEFE0054DEFF00098E140018B5480007A52700FFFFFF00FFFF
      FF0047BF5000009E0700039A0C00026706000000000000000000000000000000
      0000A9805300C5A58100F8F1E600B4895D00A3723E00B4895D00F8F1E600C5A5
      8100A9805300000000000000000000000000B1AB9F00C9C0B800CDC5BC00D4CB
      C200DAD1C800E1D7CF00008A470063E6CD0000CA9A0000C8980000C7970000C8
      990000C8990000C899006FE8D00000884500B1AB9F00C9C0B800CDC5BC00D4CB
      C200DAD1C800E1D7CF002B3ABE008696F8003E56F3003E56F3003E56F3003E56
      F3003E56F3003E56F3008696F8002B3ABE00000000000274A90073FAFE003FE3
      FE0012CBFE0020CEFE0054DEFF00098E140025B85B000DAB3B00FFFFFF00FFFF
      FF00FFFFFF0034B63F0003AA0C0002670600000000000000000000000000A980
      5300C7A68400FAF4EA00B3895C00A2703C00A3713D00A2703C00B3895C00FAF4
      EA00C7A68400A98053000000000000000000B0AB9E00C8BFB700CBC3BA00D2C9
      C000D8CFC500DFD5CD00E9DFD8000083420060E0C70000C3970094E8D8004DE6
      D10051E8D4004FE9D50099F0E40000894600B0AB9E00C8BFB700CBC3BA00D2C9
      C000D8CFC500DFD5CD002B3ABE00A1ACF4008696F8008696F8008696F800A1AC
      F400334DF0008696F8002B3ABE0000000000000000000274A90073FAFE003FE3
      FE0012CBFE0020CEFE0054DEFF00098E140052CB82000DAB4000FFFFFF00FFFF
      FF0046C1620005A1180005AA1100026706000000000000000000A97E5100C6A7
      8400FCF7EF00B38A5F00B8916800FAF2E400F8EFE000FBF3E600B9926900B38B
      5F00FCF7EF00C6A78400A97E510000000000B0AA9E00C9C2B900E2DDD400F5EF
      E900FFFBF400FEFAF300FDF9F200FDF9F200008342005ADAC40082E4D6000082
      3B0000864200008744000089460010845700B0AA9E00C9C2B900E2DDD400F5EF
      E900FFFBF400FEFAF3003140C0002B3ABE002B3ABE002B3ABE002B3ABE00A1AC
      F4008696F8002B3ABE000000000000000000000000000274A9009FFBFE00A3F3
      FF00B6F2FF00DAF8FF00E5FAFF0020A73D0077D093004DC77B008FDDAC002CBA
      5A000EAB370011AF3300099D1C00046B0B0000000000B18D6800C8A88700FDF9
      F200B58C6000A6764300A5754200B8906600FDF8EF00A26F3A00A7774500A676
      4400B58C6000FDF9F200C8A88700AD865C00C1BDB600F9F4EE00D7D0C800C6BE
      B600BEB5AB00C2B9AF00C7BCB400C8BEB500C3B9B100008342007AE4D8000088
      4400F9F5ED00C1BDB6000000000000000000C1BDB600F9F4EE00D7D0C800C6BE
      B600BEB5AB00C2B9AF00C7BCB400C8BEB500C3B9B100BFB6AC002B3ABE00A1AC
      F4002B3ABE00C1BDB6000000000000000000000000000274A900A7E9F3001CAA
      D3000791C5000788BC00108BBC00168F8000098E140084D79E0078D79E0050C9
      7E0041C5730018A938000B8420000000000000000000A6754300FFFFFF00C4A4
      8100A3723E00A8784700A6754200B9916700FFFFFE00A4723E00A97A4A00A97A
      4900A4723E00C4A48100FFFFFF00A6754300BBB7AF00A3998F00B6AEA400C8BF
      B600D8CFC700E3D9D100EADED800ECE1DA00E4DAD300DAD1C90000834200008C
      4900A49C9200BBB7AF000000000000000000BBB7AF00A3998F00B6AEA400C8BF
      B600D8CFC700E3D9D100EADED800ECE1DA00E4DAD300DAD1C9003140C0002B3A
      BE00A49C9200BBB7AF000000000000000000000000000274A90031B5D3003FE3
      FE0012CBFE0020CEFE0054DEFF0074E0F80023A79E000E973800098E1400098E
      1400098E14000D862500000000000000000000000000C4A38200C9A98900FFFF
      FC00B48D6200A5744200BE9A7400FFFFFF00FFFFFF00A5744100A97A4900A777
      4400B58D6300FFFFFC00C9A98900BC987300B1AB9F00CAC1B900CEC7BE00D5CC
      C300DAD1C800E1D7CF00E8DCD600EADFD800E2D8D100DCD2CA00D6CEC500D1C9
      C000CBC4BA00B1AB9F000000000000000000B1AB9F00CAC1B900CEC7BE00D5CC
      C300DAD1C800E1D7CF00E8DCD600EADFD800E2D8D100DCD2CA00D6CEC500D1C9
      C000CBC4BA00B1AB9F000000000000000000000000000274A90073FAFE003FE3
      FE0012CBFE0020CEFE0054DEFF0074E0F80030B0DA000386C100056695000000
      0000000000000000000000000000000000000000000000000000C5A58300C9AA
      8B00FFFFFF00B68C6200A3723D00A2703B00A2703B00A6764300A6764300B78D
      6300FFFFFF00C9AA8B00C5A5830000000000B1AB9E00C8BFB700CBC3BA00D2C8
      BF00D8CEC500DFD5CD00E9DED800E9DDD600E0D6CF00DACFC700D3CBC200CEC6
      BD00C9C2B800B0AB9E000000000000000000B1AB9E00C8BFB700CBC3BA00D2C8
      BF00D8CEC500DFD5CD00E9DED800E9DDD600E0D6CF00DACFC700D3CBC200CEC6
      BD00C9C2B800B0AB9E000000000000000000000000000274A90073FAFE003FE3
      FE0012CBFE0020CEFE0054DEFF0074E0F80030B0DA000386C100056695000000
      000000000000000000000000000000000000000000000000000000000000C5A5
      8300CAAB8C00FFFFFF00B58C6100BA946B00FFFFFE00A3713D00B68E6300FFFF
      FF00CAAB8C00C5A583000000000000000000B0AA9D00C7C0B800E1DBD200F3ED
      E600FDF9F200FCF8F100FBF7F000FBF7F000FCF8F100FDF8F200F4EEE600E2DB
      D300CAC3B900AFAA9D000000000000000000B0AA9D00C7C0B800E1DBD200F3ED
      E600FDF9F200FCF8F100FBF7F000FBF7F000FCF8F100FDF8F200F4EEE600E2DB
      D300CAC3B900AFAA9D000000000000000000000000000274A90073FAFE003FE3
      FE0012CBFE0020CEFE0054DEFF0074E0F80030B0DA000386C100056695000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C5A58300CAAC8E00FFFFFF00B38A5F00A06C3600B48B6000FFFFFF00CAAC
      8E00C5A58300000000000000000000000000AEA89C00FBF5EF00EEE7DE00E3DC
      D300DDD5CC00DDD5CB00DDD4CB00DDD4CB00DDD4CB00DDD5CB00E3DCD300EEE7
      DE00FBF6EF00AEA89C000000000000000000AEA89C00FBF5EF00EEE7DE00E3DC
      D300DDD5CC00DDD5CB00DDD4CB00DDD4CB00DDD4CB00DDD5CB00E3DCD300EEE7
      DE00FBF6EF00AEA89C000000000000000000000000000274A90078FBFE0068F6
      FF0054F6FF005FFEFF007FFEFF0089FBFE0048CFF200058BC700056695000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C4A58300CBAD8E00FFFFFF00C6A88600FFFFFF00CBAD8F00C4A5
      830000000000000000000000000000000000AFA99D00E1D8CE00E1D8CE00DFD6
      CC00DFD6CB00DFD5CB00DFD5CB00DFD5CB00DFD5CB00DFD6CB00DFD6CC00E1D8
      CE00E1D8CE00AFA99D000000000000000000AFA99D00E1D8CE00E1D8CE00DFD6
      CC00DFD6CB00DFD5CB00DFD5CB00DFD5CB00DFD5CB00DFD6CB00DFD6CC00E1D8
      CE00E1D8CE00AFA99D000000000000000000000000000274A900FBFFFF00F0FF
      FF00C6FFFF00A0FFFF0098FFFF0098FFFF0093FFFF0057F7FE00056695000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000C4A58300CBAE9100FFFFFF00CBAE9100C4A583000000
      000000000000000000000000000000000000DCDAD400B6B0A400D2CABF00E2D9
      D000EFE7DD00EEE6DC00EEE6DC00EEE6DC00EEE6DC00EFE7DD00E2D9D000D2CA
      BF00B6B0A400DCDAD4000000000000000000DCDAD400B6B0A400D2CABF00E2D9
      D000EFE7DD00EEE6DC00EEE6DC00EEE6DC00EEE6DC00EFE7DD00E2D9D000D2CA
      BF00B6B0A400DCDAD400000000000000000000000000000000000479AF00EDFA
      FC00DCFFFF00B7FFFF0099FFFF0092FFFF0083FAFB00086B9A00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000C4A38200A6754100C4A38200000000000000
      0000000000000000000000000000000000000000000000000000CBC7BF00B2AC
      A100AEA89C00AEA89C00AEA89C00AEA89C00AEA89C00AEA89C00B2ACA100CBC7
      BF00000000000000000000000000000000000000000000000000CBC7BF00B2AC
      A100AEA89C00AEA89C00AEA89C00AEA89C00AEA89C00AEA89C00B2ACA100CBC7
      BF00000000000000000000000000000000000000000000000000000000000274
      A9000274A9000274A9000274A9000274A9000274A90000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000006C6A69006C6A
      6900000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000C18C2600C4912B0000000000000000000000
      0000000000000000000000000000000000000000000000000000977C63008E70
      55008C6D51008B6C51008B6D51008C6D53008C6D53008B6D51008B6C51008C6D
      51008E705500977C630000000000000000000000000000000000A09F9D008C89
      8700918B8800746D6900776E6900776E6800776E6800776E6900746D6900918B
      88008C898700A09F9D000000000000000000000000000000000000000000B0AA
      9E00AFA99D00AEA89C00C9C3B60073716F0077757300CBC4B800999796009997
      9600000000007775730073716F00000000000000000000000000000000000000
      00000000000000000000C0891E00E7A84200EAB05400D9A44800000000000000
      00000000000000000000000000000000000000000000000000008E705500FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF008E705500000000000000000000000000000000008D898700AFC4
      BC00B8C7BC0000418C00359FDA002F9AD6002F9AD600359FDA0000418C00B8C7
      BC00AFC4BC008D898700000000000000000000000000B4AEA200C5BEB300D4CA
      C200E1D7CF00E8DED600FBEFE8007F7D7B00C7C4C30086848300BCBAB900BCBA
      B90086848300C7C4C3007876750000000000BA892600B67E0E00B57C0900B57B
      0900B57B0900B47C0A00BF820F00FFF2D300E2A23900E8AF5100D9A34400B680
      1200B8811200BD8A2700000000000000000000000000000000008B6D5100FFFF
      FF00FCFEFF00FDFFFF00FFFFFF00AE722900AE722900FFFFFF00FDFFFF00FCFE
      FF00FFFFFF008B6D5100000000000000000000000000000000008D888700F4FE
      FB00FFFFFA0000458D004AA3D600288ECA00288ECA004AA3D60000458D00FFFF
      FA00F4FEFB008D8887000000000000000000B1AB9F00C8C1B600CFC7BF00D6CC
      C500DCD3CA00E9DDD600FFFFFF00C2BEB80087858400A9A7A600817F7D00817F
      7D00A9A7A600878584000000000000000000B67E0E00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00CFAD6800CA850900FFF0CE00E1A13500E9AC4800D5B4
      7100FFFFFF00BD810A00000000000000000000000000000000008B6C5100FFFF
      FF00F9FAFD00FBFFFF00AD722A00F1BE7100F1BE7100AD722A00FBFFFF00F9FA
      FD00FFFFFF008B6C510000000000000000000000000000000000908C8A00BBD8
      D300C7DCD0000049920060ABD7001D84C2001D84C20060ABD70000499200C7DC
      D000BBD8D300908C8A000000000000000000B0AB9E00C7C0B600CDC4BB00D3CA
      C200DAD1C800FFFFFC00716F6D00A19F9E00C1BFBD0083807F00FCF2E600F5EA
      E00083807F00C1BFBD00A09E9D007B797700B57B0900FFFFFF00E5D5CB00E5D6
      CA00E5D5C900F9FCFF00FBFFFF00CBA86200CA830500FFEDC500DBB16C00B5B8
      C1006A6A6E006F6F750087898D000000000000000000000000008B6D5100FFFF
      FF00F7FDFF00AE722A00EFBC6E00EDBC7100EDBC7100EFBC6E00AE722A00F7FD
      FF00FFFFFF008B6D510000000000000000000000000000000000948F8D00BFDB
      D600CBDED400004E980075B6DC000E7CBB000E7CBB0075B6DC00004E9800CBDE
      D400BFDBD600948F8D000000000000000000B0AA9E00CAC3B900EAE5DD00F7F3
      EB00FFFBF400FFFFFB0072706E00A3A09F00C4C2C10086848000EFEEEE00D1CA
      C10086848000C3C1C100A19F9E007C7A7800B47B0800FFFFFF00E3D1C200E4D2
      C300E4D1C000F1F3F400F2F4F600F4F9FF00C9A35900E0C28900D9DBE300CECD
      D000D3D4D400EEEEEF00ECEAED007C7B7A0000000000000000008C6D5200FFFF
      FF00AF722700F4C78300F1C78700EDC28100EBB96E00F2C88800F4C78300AF72
      2700FFFFFF008C6D5200000000000000000000000000000000009B928F00C3DC
      D800CEDFD60000539E008EC1E000006FB500006FB5008EC1E00000539E00CEDF
      D600C3DCD8009B928F000000000000000000C1BDB600F9F3ED00D8D1C900C2B8
      B000BFB6AE00C5BAB200E1D5CB00A8A09B008C8A8800B2AFAE00878584008785
      8400B2AFAE008C8A88000000000000000000B47B0900FFFFFF00E0CCBB00E1CE
      BC00E1CCB900ECEDEE00EBEBEB00ECECEE00EEF0F400F2F3F700A7A6A700DBD9
      DA00D1CFCF00767474007C7B7C00817F7F0000000000000000008C6D5200FFFF
      FF00C7A47600B2773100B27A3700EECD9C00E0AC5D00B27B3900B2783100C7A4
      7600FFFFFF008C6D520000000000000000000000000000000000A4999200CDE3
      DF00CEDFD6000055A300A7CFE600B5D6E900B5D6E900A7CFE6000055A300CEDF
      D600CDE3DF00A49992000000000000000000BBB7AF00A39A8F00BAB2A700CAC1
      B800DED5CC00E5DBD300FFFFFF0086848100D5D3D2008D8B8900C9C7C600C9C7
      C6008D8B8900D5D3D2007F7D7B0000000000B57B0900FFFFFF00DDC6B300DEC9
      B500DEC7B200E6E7E800E5E4E400E5E4E400E7E6E600EDECEB0079777500D9D7
      D600C5C2C2007B7B7D00000000000000000000000000000000008B6D5100FFFF
      FF00E8ECF000EBF3FC00B2772F00EFD8B700EBCFA600B3783100EBF3FC00E8EC
      F000FFFFFF008B6D51000000000000000000000000004474A000AE9F9400E3F1
      EC00CCDFD700388DBA00005CA900005DAB00005DAB00005CA900388DBA00CCDF
      D700E3F1EC00AE9F94004474A00000000000B1AB9F00C9C2B900CFC7BF00D5CC
      C400DCD3CA00E3D9D100F7EBE4007A78760087858300D9D9D800A9A7A500A9A7
      A500C0BBAF00878583007B79770000000000B57B0900FFFFFF00DAC1AA00DCC4
      AD00DCC3AA00DFE0E100DEDEDD00DEDDDC00DFDEDD00E5E4E30076737000E3E1
      E200B3B1AF008A878700828183008785850000000000000000008B6C5200FFFF
      FF00E1E2E300E3E6EB00C4A07300B0752C00B0752C00C4A07300E3E6EB00E1E2
      E300FFFFFF008B6D5200000000000000000000000000004F900034688F00FFFF
      FB00CBE0DA00CEE1DB00D3E6E000D6ECE800D6ECE800D3E6E000CEE1DB00CCDF
      DA00FFFFFB0034689000004F900000000000B0AB9E00C7C0B600CCC4BB00D3C9
      C100DAD0C700E1D7CF00EBE1DA00F4E8DF00FFFBF200F3E9DD00767472007674
      7200BDB6AA00000000000000000000000000B57B0900FFFFFF00D4B89E00D5BA
      A000D6B99E00D5D6D800D5D5D500D5D4D400D6D5D500D9D9D900A3A2A000BDBB
      BB00F4F4F400E5E5E600C4C4C500898785000000000000000000896D5700FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF008A6D560000000000000000000000000000000000005093004285
      AD00DEEBE200D3E4E100CAE4E700B04B0000AF4B0000CAE4E700D4E5E200DFEB
      E4004185AD00005095000000000000000000AFAA9D00C8C1B700E8E3DB00F5F0
      E800FDF8F200FCF8F100FBF7F000FCF7F100FCF8F100F6F0EA00E9E2DB00CAC2
      BA00AFA99D00000000000000000000000000B57C0A00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00A8A9
      AF007D7D820082838900A0A1A600000000000000000000000000BF8E4800C28A
      3B00BF863800BF863800BF873900BF873A00BF873A00BF873900BF863800BF86
      3800C28A3B00B5874C00000000000000000000000000000000000060A2000050
      96004387B100EBF4ED00DAEFF000C4722B00C4722B00DBF0F000EBF4ED003D85
      B200004F9900000000000000000000000000AEA89C00FBF5EF00EEE7DE00E0D8
      CE00DDD5CC00DDD4CB00DDD4CB00DDD4CB00DDD5CC00E0D7CE00EDE6DE00FBF6
      EF00AEA89C00000000000000000000000000B57E0F00F7E0BE00E7B87000E8BE
      7A00E8BE7A00E8BD7900E8BD7800E8BD7800E7BD7700E8BD7700EABF7900ECBC
      7300FFE6C000BB80080000000000000000000000000000000000C5914700F5D0
      9B00ECB96E00ECB97000ECB97000ECB97000ECB97000ECB97000ECB97000ECB9
      6E00F5D09B00C6914700000000000000000000000000000000000067A90043A2
      D70000549A00438CB600F7FCF800E3F4F500E3F4F600F9FDF9003C88B600004D
      9C00AC9B9000000000000000000000000000AFA99D00E1D8CE00E1D7CE00DFD6
      CC00DFD5CB00DFD5CB00DFD5CB00DFD5CB00DFD5CB00DFD6CC00E1D7CE00E1D8
      CE00AFA99D00000000000000000000000000B6801300F2D8AE00CD840800D08A
      1300D28E1A00D4922200D5952900D8992F00D99B3600DB9F3E00DEA34500E0A6
      4A00F2D8AC00B781120000000000000000000000000000000000C5904800E6C5
      9200D5A05100D6A15300D6A15400D6A15400D6A15400D6A15400D6A15300D5A0
      5100E6C59200C5904800000000000000000000000000000000004F9BC800006C
      B100006CB100005CA200448FBA00FFFFFD00FFFFFE003E8CBA000052A000E0EF
      E700A198930000000000000000000000000000000000B6B0A400D6CFC400E6DE
      D500EFE7DD00EEE6DC00EEE6DC00EEE6DC00EFE7DD00E6DED500D6CFC400B6B0
      A40000000000000000000000000000000000B8821700EED09C00ECCE9900ECCF
      9A00ECCF9A00ECCE9A00ECCE9900ECCE9800EBCD9800EBCD9700EBCD9700EBCD
      9600EECF9A00B882170000000000000000000000000000000000C5914900DDBD
      8F00DCBC8D00DCBC8E00DCBC8E00DCBC8E00DCBC8E00DCBC8E00DCBC8E00DCBC
      8D00DDBD8F00C591490000000000000000000000000000000000000000000000
      000000000000000000000061A8004F99C1004D98C100005CA800B29F9300D6EC
      E9009F9A9700000000000000000000000000000000000000000000000000AEA9
      9C00AEA89C00AEA89C00AEA89C00AEA89C00AEA89C00AEA99C00000000000000
      000000000000000000000000000000000000BE8D2A00B8821700B7811600B781
      1600B7811600B7811600B7811600B7811500B7811500B6811500B6811500B781
      1500B8821700BF8E2D0000000000000000000000000000000000CB9A5600C591
      4900C5914800C5914800C5914800C5914800C5914800C5914800C5914800C591
      4800C5914900CB9A560000000000000000000000000000000000000000000000
      0000000000000000000000000000006CB000006AB00000000000CDC4BE00A59E
      9B00BEBCBB000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B2AEA600B0AB9F00AFA99C00AEA8
      9C00AEA99C00B0AA9E00BAB6AE00000000000000000000000000000000000000
      000000000000000000000000000059915D004A854C004B844B004A844A004A84
      4A004B844B004C864D00749D7600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BEBEBD00AFAFAD00ADADAB00ADAD
      AB00ADADAB00ADADAB00AFAFAD00B4B4B300B8B8B600AFAFAD00ADADAB00ADAD
      AB00ADADAB00ADADAB00AFAFAD00BFBFBE000000000000000000000000000000
      0000000000000000000000000000C5BFB500B7B1A400D3C9C100E4DAD200EFE4
      DD00E8DDD600D5CDC400B9B4A700B7B2A7000000000000000000B5B5B300AFAF
      AD00AEAEAB00AFAFAD00BAB3B7003F7F41004EC5920042BE87003EBB84003DBB
      830040BD86004FC693004B864D00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000AFAFAD00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00AFAFAD00AFAFAD00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00AFAFAD000000000000000000000000000000
      0000000000000000000000000000A9A29400C8C1B700D4CCC300E1D6CE00EBE1
      D900E4DAD200D7D0C700CDC6BC00B1AB9F000000000000000000B0B0AD00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF003A7A3B0053C29300FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0050C293004A844A00000000000000000000000000000000000000
      000000C68400008A4A0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000AEAEAB00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00ACACAA00ACACAA00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00AEAEAB000000000000000000000000000000
      0000000000000000000000000000A9A29500C7C0B600D3CBC200DFD5CD00EAE0
      D800E3D8D000D6CEC500CCC5BB00B0AA9E000000000000000000AEAEAB00FFFF
      FF00FDFDFC00FFFEFE00FFFFFF003879390063C59C001EA56B0075C7A400FFFF
      FF00FFFFFF005BC29800488349000000000000000000000000000000000000BE
      800000E4A6000088470000000000000000000000000000000000000000000000
      000000000000000000000000000000000000ADADAB00FFFFFF00FBFBFB00FAFA
      FA00FAFAFA00FBFBFB00FFFFFF00ACACAA00ACACAA00FFFFFF00FBFBFB00FAFA
      FA00FAFAFA00FBFBFB00FFFFFF00ADADAB000000000000000000000000000000
      0000000000000000000000000000A9A29500C6BFB400D1C8C000DED3CB00E8DE
      D600E1D6CE00D4CCC300CAC3B900B0AA9E000000000000000000ADADAB00FFFF
      FF00F8F8F800FBFAFB00FFFFFF003678380071C9A70077C7A700FFFFFF006BC2
      9D00FFFFFF006CC7A4004783480000000000000000000000000000BC800000D8
      A00000D9A100008342000087460000884700008A480046A37900000000000000
      000000000000000000000000000000000000ADADAB00FFFFFF00F8F7F700F8F7
      F700F8F7F700F8F7F700FFFFFF00ACACAA00ACACAA00FFFFFF00F8F7F700F8F7
      F700F8F7F700F8F7F700FFFFFF00ADADAB000000000000000000000000000000
      0000000000000000000000000000A8A19400E3DDD600F8F4EE00FDF9F200F9F5
      ED00FDF8F200F9F4EE00E6DFD800AEA99C000000000000000000ADADAB00FFFF
      FF00F6F5F500F9F7F800FFFFFF003578370083CFB300FFFFFF006DC2A0000295
      5900FFFFFF0083D0B40046834800000000005187460000B9810000D39F0000D0
      9C0000D09C0000D59F0000D7A00000D7A00040E8C20000884600C9803F00B880
      3F00B57F3F00B6804000B8834200BA854500ADADAB00FFFFFF00F5F4F400F5F4
      F400F5F4F400F5F4F400FFFFFF00ACACAA00ACACAA00FFFFFF00F5F4F400F5F4
      F400F5F4F400F5F4F400FFFFFF00ADADAB000000000000000000000000000000
      0000000000000000000000000000A7A09300EDE5DC00DCD3C800D8CFC500D8CF
      C500D8CFC500DDD3C900EFE7DE00AEA99C000000000000000000ADADAB00FFFF
      FF00F3F2F200F5F3F400FFFBFF003277360090D5BD008ED3B90090D3BA0092D4
      BB008FD3BA0095D9C20047844A0000000000008A480060E6CD0000CA9A0000C8
      980000C7970000C8990000C8990000C899006BE7CF0000834000FFDC9F00FBD9
      9D00F8D89C00FCE1A800E4C18600B9844400ADADAB00FFFFFF00F2F0F100F2F1
      F100F2F1F100F2F1F100FFFFFF00ACACAA00ACACAA00FFFFFF00F2F1F100F2F1
      F100F2F1F100F2F0F100FFFFFF00ADADAB0000000000B2AEA600B0AB9F00AFA9
      9C00AEA89C00AEA99C00B0AA9E00BAB5AB00C8C0B400E7DFD500ECE4DA00ECE4
      DA00EDE5DB00E9E1D700CCC5BA00BDB8AE000000000000000000ADADAB00FFFF
      FF00F0F0EF00F1F1F000FAF6F8007DA780003277360034783700357837003578
      3700377939003D7F410086AF8800000000000000000000B381005DE0C60000C3
      970093E8D8004DE6D1004EE7D3004AE8D40090EDE20000823F00FFD08C00F6CC
      8900F4CB8700FBE1AE00B47D3C00D1AF8400ADADAB00FFFFFF00EEECED00EEEC
      ED00EDECEC00EEECED00FFFFFF00ACACAA00ACACAA00FFFFFF00EEECED00EDEC
      EC00EEECED00EEECED00FFFFFF00ADADAB00C5BFB500B7B1A400D3C9C100E4DA
      D200EFE4DD00E8DDD600D5CDC400B9B4A700C7C3BB00ACA59800A7A09300A8A2
      9400ACA59800AEA89C00D1CDC600000000000000000000000000ADADAB00FFFF
      FF00EEECEB00EEEDEC00F1EFEF00F7F3F500FCF5F900FDF5FA00FDF5FA00FDF5
      FA00FFFFFF00BEB5BB000000000000000000000000004885430000AC7D0055D9
      C30080E4D50000813A0000833F000082400000834100489D5900FFC67F00F4C3
      7C00F2C27900FCDFAA00B57F3E0000000000AEAEAB00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00F3F3F300FFFFFF00ACACAA00ACACAA00FFFFFF00F4F4F400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00AEAEAB00A9A29400C8C1B700D4CCC300E1D6
      CE00EBE1D900E4DAD200D7D0C700CDC6BC00B1AB9F0000000000000000000000
      0000000000000000000000000000000000000000000000000000ADADAB00FFFF
      FF00EAE9E900EBEAEA00EBEAEA00EBEAEA00F6F5F500FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00B2B0B000000000000000000000000000D08240005AAD730000A6
      790070E1D50000844100FFC27300FFC07300FFBF7300FFBE7200F7BC7100F2BB
      6E00F2BA6B00FFE8BF00B57F3E0000000000AFAFAD00FFFFFF00A5A5A300A7A7
      A500CBCBCA00FFFFFF00FFFFFF00ACACAA00ACACAA00FFFFFF00FFFEFE00CBCB
      CA00A7A7A400A5A5A300FFFFFF00AFAFAD00A9A29500C7C0B600D3CBC200DFD5
      CD00EAE0D800E3D8D000D6CEC500CCC5BB00B0AA9E0000000000000000000000
      0000000000000000000000000000000000000000000000000000ADADAB00FFFF
      FF00E7E7E600E8E8E700E8E8E700E6E7E500FFFFFF00CBCBCA00A6A6A400A5A5
      A200FFFFFF00AFAFAD00000000000000000000000000BF844500FFD6AA0054AC
      710000A37C0000824000FFB66000F8B45F00F5B45F00F4B45F00F3B35E00F2B2
      5C00FBD09400F2D3A800B783440000000000CACAC900E9E9E900FFFFFF00E3E2
      E100A7A7A400FFFFFF00FFFFFF00ACACAA00ACACAA00FFFFFF00FFFFFE00A7A7
      A500EBEBEA00FFFFFF00E9E9E900CACAC800A9A29500C6BFB400D1C8C000DED3
      CB00E8DED600E1D6CE00D4CCC300CAC3B900B0AA9E0000000000000000000000
      0000000000000000000000000000000000000000000000000000AEAEAB00FFFF
      FF00E4E3E200E5E4E300E5E4E300E4E3E200FFFFFF00A6A6A400FBFBFA00FFFF
      FF00E9E9E900CACAC80000000000000000000000000000000000C0884700FFD7
      AF00FFF0CC00FFE5B800FFE4B800FFE3B800FFE3B800FFE3B800FFE2B700FFEE
      CD00F5D5AE00BA874600000000000000000000000000B7B7B500E8E8E800FFFF
      FF00A5A5A300FFFFFF00FFFFFF00ACACAA00ADADAA00FFFFFF00FDFDFE00A5A5
      A300FFFFFF00E8E8E800CBCBC90000000000A8A19400E3DDD600F8F4EE00FDF9
      F200F9F5ED00FDF8F200F9F4EE00E6DFD800AEA99C0000000000000000000000
      0000000000000000000000000000000000000000000000000000AEAEAC00FFFF
      FF00E0DFDE00E1DFDE00E1DFDE00E0DFDE00FFFFFF00A5A5A200FFFFFF00E7E7
      E800CBCBC900000000000000000000000000000000000000000000000000BA83
      4400B87F3E00B77F3E00B57F3E00B57F3E00B47F3E00B47F3E00B47F3E00B57F
      3E00B78344000000000000000000000000000000000000000000B8B8B500E9E9
      E900FFFFFF00FFFFFF00FFFFFF00AFAFAD00AFAFAD00FFFFFF00FFFFFF00FFFF
      FF00E9E9E900BDBDBC000000000000000000A7A09300EDE5DC00DCD3C800D8CF
      C500D8CFC500D8CFC500DDD3C900EFE7DE00AEA99C0000000000000000000000
      0000000000000000000000000000000000000000000000000000AFAFAD00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E9E9E900CACA
      C900000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000B7B7
      B500AFAFAD00AEAEAC00AFAFAD00BCBCBA00C9C9C700AFAFAD00AEAEAC00AFAF
      AD00B7B7B500000000000000000000000000BAB5AB00C8C0B400E7DFD500ECE4
      DA00ECE4DA00EDE5DB00E9E1D700CCC5BA00BDB8AE0000000000000000000000
      0000000000000000000000000000000000000000000000000000B8B8B600B0B0
      AD00AEAEAC00AEAEAB00AEAEAB00ADAEAB00AEAEAB00AFAFAD00B7B7B5000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C7C3BB00ACA59800A7A0
      9300A8A29400ACA59800AEA89C00D1CDC6000000000000000000000000000000
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
      000000000000BA8D5300B16E1900B16E1900BB8E540000000000BB8E5400B16E
      1900B16E1900BA8D53000000000000000000B1B1B100A2A2A2009F9F9F009F9F
      9F009F9F9F009F9F9F009F9F9F009F9F9F009F9F9F009F9F9F009F9F9F009F9F
      9F009F9F9F009F9F9F00A2A2A200B1B1B1000000000000000000B6813C00B47F
      3A00B37D3A00B47F3A00B6803C000000000000000000B6803C00B47F3A00B27D
      3A00B27D3A00B47F3A00B6803C00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000B16E1900F7C67800EEBA6C00B16E190000000000B16E1800F7C6
      7800F7C67800B16E18000000000000000000A2A2A200FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00A2A2A2000000000000000000B57F3B00FFC0
      6E00FBBC6900FCBB6900B37E3A000000000000000000B9833E00FDBF6E00F9B7
      6300F9B86400FDBF6E00B57F3B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000B06D1700F1BE7000F2BE7000B06D170000000000B06D1700F1BE
      6F00F1BE6F00B06D17000000000000000000A0A0A000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00A0A0A0000000000000000000B47F3A00C08A
      4400CC975100F8BB6C00BA843D000000000000000000B9823E00D0995200F4B2
      5F00F4B56500D0984F00B57F3B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008A4A0000C6
      8400000000000000000000000000000000000000000000000000000000000000
      000000000000B06D1700EDB96B00EDB96B00B06D170000000000B06D1700EDB9
      6B00EDB96B00B06D17000000000000000000A0A0A000FFFFFF00454341005F5D
      5C0074716F00646261004A474500FFFFFF00FFFFFF00454240005F5D5C007471
      6F00646261004A484500FFFFFF00A0A0A0000000000000000000000000000000
      0000B27C3800E9B47100E5AE6600000000000000000000000000AF7B3700F2AF
      5B00F4BA6F00B17C380000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000088470000E4
      A60000BE80000000000000000000000000000000000000000000000000000000
      000000000000B06D1700EBB56800EBB56800B06D170000000000B06D1700EBB5
      6800EBB56800B06D17000000000000000000A0A0A000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FEFEFE00FEFEFE00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00A0A0A000D0924800CF904400D09145000000
      000000000000BF8B4A00F8C07C00C0873E00B17B3600B17B3600AF793500F0AC
      5700F4BE7900B27C380000000000000000000000000000000000000000000000
      0000000000000000000046A37900008A480000884700008746000083420000D9
      A10000D8A00000BC800000000000000000000000000000000000000000000000
      000000000000B06D1800E9B16500E9B16500B06D180000000000B06D1800E9B1
      6500E9B16500B06D18000000000000000000A0A0A000FFFFFF0048454300625F
      5F0077747200676564004C4A4800FDFDFC00FDFDFC004845430062605F007774
      7200676564004D4A4800FFFFFF00A0A0A000CF904500FFFACA00F4D19600CF98
      560000000000B37D3800DDAF7300F2B56800F6C68A00F9C98F00F8C98F00ECA7
      5300F3C28300B27C37000000000000000000BA854500B8834200B6804000B57F
      3F00B8803F00C9803F000088460040E8C20000D7A00000D7A00000D59F0000D0
      9C0000D09C0000D39F0000B98100518746000000000000000000000000000000
      000000000000B06D1700E5AD6100E5AD6100B06E180000000000B06E1800E5AD
      6100E5AD6100B06E18000000000000000000A0A0A000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FAF9F800FAF9F800FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00A0A0A000CF914600D49A5200FFE7B500D699
      4F000000000000000000B7823F00F4C78E00C68B4100B8813800B27F3F00EBA6
      5000F4C68D00B37C37000000000000000000B9844400E4C18600FCE1A800F8D8
      9C00FBD99D00FFDC9F00008340006BE7CF0000C8990000C8990000C8990000C7
      970000C8980000CA9A0060E6CD00008A4800000000000000000000000000B373
      1F00B16E1800AE6B1400E2A85B00E3A95C00B16E180000000000B16E1800E3A9
      5D00E3A95D00B16E18000000000000000000A0A0A000FFFFFF00484644006360
      600077757300686665004D4B4900F7F8F700F7F8F70049464400636160007775
      7300686564004D4B4900FFFFFF00A0A0A0000000000000000000E3B37400FADA
      9F00D89D5400D08E4100B67B3300D2A56D00E7B373000000000000000000EAA3
      4E00F4CA9700B37C36000000000000000000D1AF8400B47D3C00FBE1AE00F4CB
      8700F6CC8900FFD08C0000823F0090EDE2004AE8D4004EE7D3004DE6D10093E8
      D80000C397005DE0C60000B38100000000000000000000000000B4731D00D598
      4B00E1A45A00DFA35800DEA15500E1A45900B16E180000000000B16E1800E1A4
      5900E1A45900B16E18000000000000000000A0A0A000FFFFFF00FDFCFB00FFFF
      FF00FFFFFF00FFFFFF00FDFCFB00F4F3F200F4F3F200FDFCFB00FFFFFF00FFFF
      FF00FFFFFE00FCFBFA00FFFFFF00A0A0A0000000000000000000CD8D4100FDE3
      B600FFE2A400FFF2CB00F2D7A900B17A3400F2CFA400C28F4C0000000000E6A0
      4900F6CFA200B37C3500000000000000000000000000B57F3E00FCDFAA00F2C2
      7900F4C37C00FFC67F00489D5900008341000082400000833F0000813A0080E4
      D50055D9C30000AC7D00488543000000000000000000B2721E00D3944600DC9F
      5300DA9D5200D99D5100DA9D5100DDA05500B16F190000000000B16F1900DDA1
      5600DDA15600B16F19000000000000000000A0A0A000FFFFFF00494644006361
      600078767400696766004F4C4A00F2F2F100F2F2F1004A474500646261007876
      7400686665004E4B4900FFFFFF00A0A0A000000000000000000000000000E0B2
      7500FFE2AD00DBA25600CD8B3D00CFA26100C7995F00E8C29700C1843700E299
      4200F5D3AA00B27B3400000000000000000000000000B57F3E00FFE8BF00F2BA
      6B00F2BB6E00F7BC7100FFBE7200FFBF7300FFC07300FFC273000084410070E1
      D50000A679005AAD7300D08240000000000000000000B26E1800DEA35E00D898
      4D00D7984D00D7984D00D7984D00DA9C5200B26F190000000000B26F1900DB9C
      5300DB9C5300B26F19000000000000000000A0A0A000FFFFFF00F6F5F400FBFA
      F900FBFAF900FBFAF900F7F6F500EFEEED00EFEEED00F8F7F600FBFAF900FBFA
      F900FAF9F800F6F5F400FFFFFF00A0A0A000000000000000000000000000CD8D
      4000FCE4BE00E6B87B00CB8E4600FCE3BA00B1762D00E4C49B00EBB57500E3A5
      5A00F9E2C500B37A3300000000000000000000000000B7834400F2D3A800FBD0
      9400F2B25C00F3B35E00F4B45F00F5B45F00F8B45F00FFB660000082400000A3
      7C0054AC7100FFD6AA00BF8445000000000000000000B26E1700E7BB8900D593
      4600D5934700D5944800D5944900D8984D00B16E180000000000B16E1800D898
      4D00D8984E00B26F19000000000000000000A0A0A000FFFFFF00484643006260
      5F0077757300686564004E4C4900EBECEB00ECECEB0049474400636060007775
      7300676564004D4B4800FFFFFF00A0A0A0000000000000000000000000000000
      0000E1B47C00F6D4A300E2AD6700FFF1D200BF813500C1925500FAE6CC00FAE4
      C900FDE7CC00B47C350000000000000000000000000000000000BA874600F5D5
      AE00FFEECD00FFE2B700FFE3B800FFE3B800FFE3B800FFE4B800FFE5B800FFF0
      CC00FFD7AF00C0884700000000000000000000000000B4731E00CD985900E5BB
      8C00DBA56900D6995500D6995500D99B5800AF6B1300B16D1500AF6B1300D99C
      5900DAA15F00B26F18000000000000000000A0A0A000FFFFFF00E8E7E600EAE9
      E800EAE9E800EAE9E800E9E7E600E5E4E300E5E4E300E9E8E700EAE9E800EAE9
      E800EAE9E800E8E7E600FFFFFF00A0A0A0000000000000000000000000000000
      0000CD8C3F00FBE6C600FBD29100FFF6E100CF8D3E0000000000B37B3400B37A
      3200B47C3400000000000000000000000000000000000000000000000000B783
      4400B57F3E00B47F3E00B47F3E00B47F3E00B57F3E00B57F3E00B77F3E00B87F
      3E00BA8344000000000000000000000000000000000000000000B26F1800BD80
      3200D19D5E00DFAF7A00E1B38000E2B48100E3B68300E4B68400E3B68300E2B4
      8200E4B78500B26F18000000000000000000A2A2A200FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00A2A2A2000000000000000000000000000000
      000000000000E1B68100FFFEF300FFFFF500D08F410000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000B5752100B26E1600B16E1600B16E1600B16E1600B26E1600B16E1600B16E
      1600B26F1800000000000000000000000000ABABAB00A2A2A200A0A0A0009F9F
      9F009F9F9F009F9F9F009F9F9F009F9F9F009F9F9F009F9F9F009F9F9F009F9F
      9F009F9F9F00A0A0A000A2A2A200ABABAB000000000000000000000000000000
      000000000000D3995200CD8D3F00CE8E40000000000000000000000000000000
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
      000000000000000000000000000000000000BCBCBC00B2B2B200B0B0B000AFAF
      B000AFAFB000AFAFB000AFAFB000AFAFB000AFAFB000AFAFB000AFAFB000AFAF
      B000AFAFB000B0B0B000B2B2B200BCBCBC00BCBCBC00B2B2B200B0B0B000AFAF
      B000AFAFB000AFAFB000AFAFB000AFAFB000AFAFB000AFAFB000AFAFB000AFAF
      B000AFAFB000B0B0B000B2B2B200BCBCBC000000000000000000000000000000
      000000000000008C4C003EA07300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000086838000817E7C00817E7C00817E7C008683
      800000000000000000000000000000000000B2B2B200FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00B2B2B200B2B2B200FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00B2B2B2000000000000000000000000000000
      00000088470018C8910000874600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000918C8B00A09D9C00CCC9C800DCDADB00DBDADA00DCDADB00CCC9
      C800A09D9C008F8C8A000000000000000000B0B0B000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00B0B0B000B0B0B000FFFFFF00FEFFFF00FFFF
      FF00FFFFFF00FFFFFF00FEFFFF00FEFEFF00FEFEFE00FEFEFE00FEFEFE00FEFE
      FE00FEFEFE00FDFEFE00FFFFFF00B0B0B0000000000000000000000000000088
      46003CCE9E0000DCA20000BC7F00009B5C00009D5F0000884700008948002497
      6100000000000000000000000000000000000000000000000000000000000000
      0000A7939800B6AEB000D0CCCC00B2AFAD00A29E9C00A19E9B00A29E9C00B2AF
      AC00CFCCCB00AFADAC009592900000000000AFAFAF00FFFFFF00FFFFFF00403E
      3C0052504D005D5A580066646300716F6D0074726F006A6765005F5D5C005452
      4F0043403F00FFFFFF00FFFFFF00AFAFAF00AFAFAF00FFFFFF00FCFFFF00C674
      1A00C87A2400C7751C00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FDFCFC00FFFFFF00AFAFAF000000000000000000008C4A0061D8
      B50000D49E0000D29C0000D5A1005ADEC7005ADEC7005ADEC7005ADEC70000C2
      8C0000905000000000000000000000000000000000000000000000000000008A
      4700128E5500CCC4C500ABA1A200DCD9D900FFFFFF00FFFFFF00FFFFFF00DBD9
      D800A3A09E00C7C5C400A3A19F0000000000AFAFAF00FFFFFF00FDFEFE00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FDFDFE00FFFFFF00AFAFAF00AFAFAF00FFFFFF00F8FCFF00E0BE
      9600CD853500EBD3BC00FFFFFF00434140005A5855006C6A6800716E6C005E5B
      590046444300FCFDFD00FFFFFF00AFAFAF000000000000000000000000000087
      440086EBDB0000C69F0000B1800000874500008D4D00009B6000009A5F0000B2
      800000B6890044A27700000000000000000000000000000000000087470000EB
      A700008441000F8C5100E2DCDB00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00D8D7D700ADAAA900BEBCBB0098979500B0B0B000FFFFFF00FCFCFB004340
      3F0055535000605D5B006967660074727000777472006D6A680062605F005755
      530045434200FCFCFB00FFFFFF00B0B0B000B0B0B000FFFFFF00F6F8F900F8FF
      FF00F1EBE600C8781F00FAFFFF00FDFEFE00FFFFFE00FFFFFE00FEFFFE00FFFF
      FE00FCFDFB00F7F7F600FFFFFF00B0B0B0000000000000000000000000000000
      000000874200A3EEED0000884500000000000000000000000000000000003CA6
      750000A1710000915300000000000000000000000000008A4A0000E8A70000E3
      A10000E7A40000854100189A6000FAFAF900FFFFFF0055555500FFFFFF00FFFF
      FF00FFFFFF00A29F9D00C2C0BE009C999700B0B0B000FFFFFF00F9F7F600FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00F8F7F600FFFFFF00B0B0B000B0B0B000FFFFFF00F3F4F600D293
      4F00D9AA7600CF8F4700F5F8FB00F4F4F300F4F3F200F4F3F200F4F3F200F4F3
      F200F4F2F100F2F1F000FFFFFF00B0B0B0000000000000000000008E4E000000
      000000000000008B480058B48900000000000000000046A27800008B4A000000
      000000000000008E4E000000000000000000008E4E00008A4A0000BE800000DC
      A20000BD7D000085400000803500BCE0CF005B585A00A6A6A6005A5A5A008181
      8100ADADAE00918E8C00C0BCBC00A29F9C00B0B0B000FFFFFF00F6F6F5004442
      410056545100605E5C006A67670075737000787673006E6B6900636160005856
      540046444300F6F6F500FFFFFF00B0B0B000B0B0B000FFFFFF00EFF1F100F1F6
      FA00F2FAFF00F2F7FC00F1F2F300F1F1F000F1F1F000F1F1F000F1F1F000F1F1
      F000F0F0EF00EFEFEE00FFFFFF00B0B0B00000000000000000000093530000AE
      7000309A6800000000000000000000000000000000000088470018E8B4000086
      4500000000000000000000000000000000000000000000000000008C4C0000D7
      A500009958008C998E00FFFEFF00FFF8FB00FFFEFF005B5B5C00FFFFFF00FBF9
      FA00FDFCFC009F9C9A00CBC9C800A6A4A200B0B0B000FFFFFF00F3F2F100FEFD
      FC00FFFFFF00FFFFFF00FFFFFF00FFFFFE00FFFFFE00FFFFFF00FFFFFF00FFFF
      FF00FDFCFC00F3F2F100FFFFFF00B0B0B000B0B0B000FFFFFF00EDEDED00EFF2
      F700C7741800F0F3F800F1F1F100F5F4F300F7F6F500F6F5F400F6F5F400F7F6
      F500F5F4F300EFEEED00FFFFFF00B0B0B000000000000000000055B2880000C3
      870000BB7E00009D5F00009F6000008847000087450000BC800000DBA0003CE9
      BD00008745000000000000000000000000000000000000000000008A480000D4
      A9000098580078978300DACED100F5F3F300F6F6F50076767600F6F7F600F3F3
      F200CDCBCA00AEABAA00CDCCCA00ABA9A700B0B0B000FFFFFF00F0F0EF004543
      420056545200615F5D006B69680076747100787674006E6C6A00636160005957
      540047454400F0F0EF00FFFFFF00B0B0B000B0B0B000FFFFFF00E9EBEB00ECF2
      F800C9781E00EDF3F800F0F2F200454341005D5A58006F6D6B0073716E00605E
      5C0049474600EFEFEE00FFFFFF00B0B0B000000000000000000000000000008F
      500000C48C0000DBA9005ADEC7005ADEC7005ADEC70000D4A10000D19C0000D3
      9E0061DBB700008C4A000000000000000000000000000000000056B2860000B5
      850000B181004AA07500B29FA200D1CACB00F6F4F3009E9D9D00F5F4F300CBC8
      C8009E9A9800D8D6D500BDBBB90000000000B0B0B000FFFFFF00EDECEB00F8F7
      F600FDFCFB00FCFCFB00FBFAF900FAF9F800F9F9F800FBFAF900FCFBFA00FCFC
      FB00F8F7F600EDECEB00FFFFFF00B0B0B000B0B0B000FFFFFF00E8E8E900EBF1
      F800CA7A2100EBEFF500ECECEC00F0EFEE00F2F1F000F1F0EF00F1F0EF00F2F1
      F000F0EFEE00EAE9E800FFFFFF00B0B0B0000000000000000000000000000000
      00002D9F6A00008A490000894800008948000087450000B1800000C7A00086DC
      C50000874400000000000000000000000000000000000000000000000000008F
      4F0000BB980000A4710092BCA300C8B4B800A69999008F8786009E979600B4AF
      AF00E0DFDF00CDCCCA00BBB9B70000000000B0B0B000FFFFFF00EAEAE9004442
      410055535100605E5C006967660075727000787573006D6B680062605F005855
      530047444300E9EAE900FFFFFF00B0B0B000B0B0B000FFFFFF00E4E7E900CF93
      4F00CA781E00E6EBEF00E5E7E600E6E6E500E6E7E600E6E7E600E6E6E500E6E7
      E600E5E6E500E3E4E200FFFFFF00B0B0B0000000000000000000000000000000
      0000000000000000000000000000000000000000000000894600A3E4DA000087
      4400000000000000000000000000000000000000000000000000000000000000
      0000008F4F0000A6790000B08D0032BDA1009FDED700B5D1C400DBE8E100EDE8
      E900CAC7C600BEBDBB000000000000000000B0B0B000FFFFFF00E3E2E100E9E8
      E600EBEAE900EBEAE900EAE9E800E9E8E700E9E8E700EAE9E800EBEAE900EBEA
      E900E9E8E600E3E2E100FFFFFF00B0B0B000B0B0B000FFFFFF00E0E1E100E2E5
      E800DDD0C100E2E3E400E1E0DF00E1E0DF00E1E0DF00E1E0DF00E1E0DF00E1E0
      DF00E1DFDE00E0DFDE00FFFFFF00B0B0B0000000000000000000000000000000
      000000000000000000000000000000000000000000004EB08300008C49000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000008C4900008A46000089440000874000399A6E00B8BB
      B60000000000000000000000000000000000B2B2B200FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00B2B2B200B2B2B200FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00B2B2B2000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BABABA00B2B2B200B0B0B000B0B0
      B000B0B0B000B0B0B000B0B0B000B0B0B000B0B0B000B0B0B000B0B0B000B0B0
      B000B0B0B000B0B0B000B2B2B200BABABA00BABABA00B2B2B200B0B0B000B0B0
      B000B0B0B000B0B0B000B0B0B000B0B0B000B0B0B000B0B0B000B0B0B000B0B0
      B000B0B0B000B0B0B000B2B2B200BABABA000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000009E
      5E00009D5D00009E5E0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008D4C00008B
      4A00008C4C000000000000000000000000000000000000000000000000000000
      0000BB8A2700B67E0E00B47B0900B47A0800B47B0800B47B080000A66A0000BA
      860077DFC40000BA860000A66A00BB8825000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000A8561100A752
      0A00A7520A00A7520900A9510900B54F07004A732F00009B5E0000BB860077E0
      C60000BB860000995C0000000000000000000000000000000000000000000000
      0000B67E0E00FFFFFF00FFFFFF00FFFFFF00FFFFFF00009E5E0000C08C0000BB
      8200FFFFFF0000BB820000C08C00009E5E00BB882500B67E0E00B47B0900B47A
      0700B47A0800B47B0800B47A0800B47A0800B47B0800B47A0800B47B0900B67E
      0F00BB882500000000000000000000000000000000000000000000000000BB89
      2600B67E0E00B47B0900B47A0700B47A0800B47B0800B47A0800B47A0800B47B
      0800B47A0800B47B0900B67E0E00BB88250000000000B15F1600D7975A00E2A7
      6D00E2A66C00E2A56C00E5A56C00F5A56C00008E4D0000C28E0000BC8300FFFF
      FF0000BC830000C18D00008C4C00000000000000000000000000C09C5500B881
      1400B3790500FFFFFF00FFFFFF00FFFFFF00D7C0A500009C5C0077E5CC00FFFF
      FF00FFFFFF00FFFFFF0077E5CC00009C5C00B67E0E00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00B67F1000000000000000000000000000000000000000000000000000B67E
      0E00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00B67E0E0000000000C0763300E8B98D00DF9F
      5D00DF9C5900DF9A5500E29A5600F59D5A000089460073E7CE00FFFFFF00FFFF
      FF00FFFFFF0077E7CE00008B4900000000000000000000000000B8811400FFFF
      FF00B1750000FFFFFF00D5BA9B00D6BC9E00D8BFA200009D5D0000CC980000C8
      8F00FFFFFF0000C88F0000CC9800009D5D00B47B0900FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00D7BFA400FFFFFF00FFFFFF00D7BFA500FFFFFF00FFFFFF00D3AF
      6900B47B09000000000000000000000000000000000000000000B8831700B379
      0400FFFFFF00FFFFFF00FFFFFF00FFFFFF00D7BFA400FFFFFF00FFFFFF00D7BF
      A400FFFFFF00FFFFFF00FFFFFF00B47B090000000000CA864800EDCBAA00EAAD
      6B00EAAF6F00F6FAFE00EFF0F200FFB171000086420000CB970000C99000FFFF
      FF0000C9900000CD9900008C4B0000000000BB8A2700B7801200B57C0B00FFFF
      FF00B0730000FFFFFF00FFFFF500FFFFF900D9BE9D00FFFFFD0000AE720000D4
      9E0077EDD40000D49E0000AE7200B47B0800B47B0800FFFFFF00D5BB9C00D6BC
      9C00D8BEA000D9C1A300D8BFA100D8BFA100DBC3A800DCC6AF00DDC9B600B073
      0000FFFFFF00B379060000000000000000000000000000000000B57E0E00FFFF
      FF00AC6D0000DAC4AC00D8C0A400D8BFA200D9C1A300D8BFA100D8BFA100D9C1
      A300D7BE9F00D5BC9C00FFFFFF00B47B080000000000D3955900F4DFCD00F6BF
      7D00FFF1DF00FFFEFE00F7F5F300FADFCA0066A25F00009F610000D49E0076EF
      D60000D49F0000A367000000000000000000B67F1100FFFFFF00B2770200FFFF
      FF00B0730000FFFFFF00D5B69100D7B99500D9BC9900D9BC9900D9BD9900009C
      5D00009B5B00009C5D00FFFFFF00B47B0900B47B0800FFFFFF00FFFEF700FFFF
      F700FFFFFB00D7BC9D00FFFFFC00FFFFFD00DAC1A700AF720000AF720000CFA8
      5A00FFFFFF00FFFFFF00B279040000000000B47C0B00B37A0900AF740000FFFF
      FF00FFFFFF00AC6D0000FFFFFF00FFFFFF00D7BC9E00FFFFFC00FFFFFC00D7BC
      9D00FFFFFB00FFFFF700FFFFFF00B47B080000000000D5924F00EBC49F00FFEC
      D600B3D9EF005DA1C5003D7FA400809DB200FFF3DE005E9E6600008949000089
      4800008B4A00000000000000000000000000B57D0C00FFFFFF00B1750000FFFF
      FF00B0730000FFFFFF00FFFAE200FFFDE700D9BA9200FFFFEB00D9BA9300FFFF
      EB00D8B99100FFFCE500FFFFFF00B47B0800B47B0800FFFFFF00FFFCEE00FFFD
      EF00FFFFF300D7BB9800FFFFF400FFFFF500D8BD9C00FFFFF600FFFFF400FFFC
      EE00FFF8E800FFFAEC00FFFFFF00B67E0E00FFFAE500FFFAE400FFF7DE00FFFA
      EB00FFFAEB00FFFFFF00AD6E0000FFFFFE00D7BC9A00FFFFF400FFFFF400D7BB
      9800FFFFF300FFFDEF00FFFFFF00B47B08000000000000000000EBB88600F0AA
      6300BDC3BB006099B800437A980094948B00F8AF690000000000000000000000
      000000000000000000000000000000000000B57C0B00FFFFFF00B0740000FFFF
      FF00B0730000FFFFFF00DDB28000DFB68500DEB78A00DEB78A00DEB88B00DEB7
      8A00DDB78900DBB38300FFFFFF00B57B0800B47B0800FFFFFF00D4B48E00D5B6
      9100D7B99400D8BB9700D7B99500D7B99500D8BB9900FFFFFF00FFFFFF00FFFF
      FF00FFF4DD00FFF6E100FFFFFF00B67E0E00FFFFFF00FFFFFF00FFFFFF00FFF5
      E000FFF6E000FFFFFF00AD6F0000D9BD9D00D9BC9900D7B99500D7B99500D8BB
      9700D6B89300D4B58F00FFFFFF00B47B08000000000000000000000000000000
      00007CADC40078BADE006AABCF006290A8000000000000000000000000000000
      000000000000000000000000000000000000B57C0B00FFFFFF00B0740000FFFF
      FF00B1730000FFFFFF0044C4FF0046C6FF00E2B57F0043C7FF00E1B6800043C7
      FF00E1B57E0040C4FF00FFFFFF00B57C0900B47B0800FFFFFF00FFF8E100FFF9
      E300FFFCE700D7B89000FFFCE800FFFDE900D9BC9600AD700000AE700000CEA3
      4E00FFF7DF00FFFFFF00B278040000000000B47A0800B37A0600AF730000FFF8
      E100FFFFFF00AA6B0000FFFFF000FFFEEC00D7B99100FFFCE800FFFCE800D7B8
      9000FFFBE600FFF8E200FFFFFF00B47B08000000000000000000000000000000
      00009AE2FF0086C7E80077B6D8006DAED0000000000000000000000000000000
      000000000000000000000000000000000000B57C0B00FFFFFF00B0740000FFFF
      FF00B2730000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00B67E0E00B47B0800FFFFFF00FFF5D900FFF6
      DC00FFF9E000D7B58C00FFF9E100FFFAE100D9B89000FFFFEC00FFFFF100B073
      0000FFFFFF00B379060000000000000000000000000000000000B57D0D00FFFF
      FF00AC6D0000FFFCE700FFF9E200FFF9E100D7B58C00FFF9E100FFF9E100D7B5
      8C00FFF8DF00FFF5DA00FFFFFF00B47B08000000000000000000000000000634
      6500AFF7FF0096D9F80086C8E7007FC1E00005285B0000000000000000000000
      000000000000000000000000000000000000B57C0B00FFFFFF00B0720000FFFF
      FF008E8E5400B1710000B0710000B0710000AF710000AF710000AF710000B071
      0000B1740000B4790300B67E0D00BE8C2800B57B0900FFFFFF00DDB17D00E0B4
      7F00E0B68300DEB78700DFB68400DFB68400DEB88700E0B78600E0B88900D7B1
      6C00B57B08000000000000000000000000000000000000000000B8831700B378
      0300FFFFFF00DEB48200E0B58100E0B68300DEB78700DFB68400DFB68400DEB7
      8700DFB58200DDB27D00FFFFFF00B57B09000000000000000000000000000E3F
      6F00226190005488B2007CB3D500679BBE000E2E5E0000000000000000000000
      000000000000000000000000000000000000B57C0A00FFFFFF00B1720000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00B77F11000000000000000000B57C0900FFFFFF0044C3FF0049C5
      FF0047C6FF00E3B57E0046C7FF0046C7FF00E3B57E0046C6FF0045C6FF00FFFF
      FF00B67D0B00000000000000000000000000000000000000000000000000B57B
      0800FFFFFF0044C4FF0049C5FF0047C6FF00E3B57E0046C7FF0046C7FF00E3B5
      7E0046C6FF0044C4FF00FFFFFF00B57C09000000000000000000000000001246
      7500307DAF004E8EBC00517FAC002D4B77001132610000000000000000000000
      000000000000000000000000000000000000B57C0A00FFFFFF0086926500B171
      0000AF710000AF710000AF720000AF720000AF720000AF720000B1740000B37A
      0600B67F1000CFAB62000000000000000000B67E0E00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00B67E0F00000000000000000000000000000000000000000000000000B67E
      0E00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00B67E0E00000000000000000000000000395E
      86002577A9003C88BA003C7AA900224A75003958810000000000000000000000
      000000000000000000000000000000000000B67E0F00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B77F
      110000000000000000000000000000000000CFAA6000B67E0E00B67C0900B67B
      0700B67B0800B57B0800B67B0800B67B0800B57B0800B67B0800B67C0900B67E
      0E00CFAA6000000000000000000000000000000000000000000000000000CFAA
      6000B67E0E00B67C0900B67B0700B67B0800B57B0800B67B0800B67B0800B57B
      0800B67B0800B67C0900B67E0E00BD8C27000000000000000000000000000000
      0000265581001A588A001951820027507D000000000000000000000000000000
      000000000000000000000000000000000000BD8C2700B67E0F00B57C0A00B57C
      0A00B57C0B00B57C0B00B57C0B00B57C0B00B57C0B00B57D0C00B77F1100BE8C
      2800000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000009E
      5E00009D5D00009E5E00000000000000000000000000CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00009E
      5E00009D5D00009E5E00CCCCCC00000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000008D
      4C00008B4A00008C4C0000000000000000000000000000000000000000000000
      0000000000005DA9CE004AA9D40051B3DA0053B0DC000000000000000000009E
      5D00009D5D00009E5E0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000A66A0000BA
      860077DFC40000BA860000A66A0000000000B1B1B100A2A2A200A09FA000A09F
      A000A1A0A000A09FA0009F9F9F009F9FA0009FA0A100A0A0A20000A66A0000BA
      860077DFC40000BA860000A66A00B1B1B100BB882500B67E0E00B47B0900B47A
      0700B47A0800B47B0800B47A0800B67B0800C47D0A005188330000995D0000BB
      860077E0C60000BB860000995C00000000000000000000000000000000000000
      00004CADD7006BD7F5007CEAFF0080EEFF008AF3FF0030B79E0000A4620000BA
      850077DFC40000BA860000A66A00000000000000000000000000000000000000
      00000000000000000000000000000000000000000000009E5E0000C08C0000BB
      8200FFFFFF0000BB820000C08C00009E5E00A2A2A200FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00009E5E0000C08C0000BB
      8200FFFFFF0000BB820000C08C00009E5E00B67E0E00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000086430000C08D0000BC
      8300FFFFFF0000BC830000C18D00008C4C000000000000000000000000004BAC
      D7006EDFFE0061D0F4004EC0EA0042B5E20057C9FB0000994C0000BF880000BB
      8200FFFFFF0000BB820000C08C00009E5E00393939002F2F2F002F2F2F002F2F
      2F0030303000313131002F2F2F002D2E2E002D2E2E00009C5C0077E5CC00FFFF
      FF00FFFFFF00FFFFFF0077E5CC00009C5C00A0A0A000FFFFFF00007626000076
      26000076260000762600FFFFFF00FFFFFF00D2944F00009C5C0077E5CC00FFFF
      FF00FFFFFF00FFFFFF0077E5CC00009C5C00B47B0900FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00D6BDA200FFFFFF00FFFFFF00EEC6B10000833D0073E6CC00FFFF
      FF00FFFFFF00FFFFFF0077E7CE00008B4900000000000000000048A9D30067DB
      FC0053C1EA0050BDE70056C4EB0039A2D10046AFE70000994D0075E5C900FFFF
      FF00FFFFFF00FFFFFF0077E5CC00009C5C002F2F2F002725250024222200211E
      1E002623230000000000222020001C1A1A001C1A1A00009D5D0000CC980000C8
      8F00FFFFFF0000C88F0000CC9800009D5D00A1A0A000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C97C2700009D5D0000CC980000C8
      8F00FFFFFF0000C88F0000CC9800009D5D00B47A0800FFFFFF00FFFFFD00FFFF
      FD00FFFFFF00D7BEA000FFFFFF00FFFFFF00EEC6AE0000833D0000CB960000C8
      8F00FFFFFF0000C9900000CD9900008C4B000000000045A3CE005DCFF50057C5
      EE0045ABDC0079E1FA007FE5FE005BD1FB0061CBF80000984B0000CB930000C7
      8E00FFFFFF0000C88F0000CC9800009D5D00303030002C2B2B0023222200FFFF
      FF00242323000303030075747400FDFDFD00FDFDFD007574740000AE720000D4
      9E0077EDD40000D49E0000AE72002E2E2E00A2A0A100FFFFFF00007626000076
      26000076260000762600FEFBFE00FAFFFF00CF8C4200D49C5C0000AE720000D4
      9E0077EDD40000D49E0000AE72009F9F9F00B47B0800FFFFFF00D4B99900D5BA
      9A00D6BC9E00D8BFA100D7BD9E00D9BD9F00E6C3A800569E6D00009C5C0000D2
      9B0073EDD40000D39E0000A3680000000000000000004FB9E2005ACEF70046A8
      D80046AADB0072D8F50093ECFF005BCBF40074E1FF0027B1990000AB660000D2
      9A0076EDD30000D39E0000AE72000000000031313100110F0F0006040400F9F9
      F9000403030000000000EAEAEA000000000000000000EAEAEA0001010100009C
      5D00009B5B00009C5D00070606002F2F2F00A2A0A100FFFFFF00FFFFFF00FFFF
      FF00FFFCFF00FCF9FB00F7F7F800F7FCFF00F1ECE600D1914A00DEB68B00009C
      5D00009B5B00009C5D00FFFFFF009F9F9F00B47B0800FFFFFF00FFFDF200FFFE
      F300FFFFF700D7BB9A00FFFFF800FFFFF800DCBD9D00FFFFFF0068BB90000081
      3B0000813B0000844100558631000000000046A4CF0056CEF70041A1D10048A8
      D90048ABDA004BB2E10062CEF10063D3F5006EDDFF0072DAFF0021A691000099
      4D00009A5100009C58000000000000000000313131000000000000000000F2F2
      F2000000000000000000F4F4F4000000000000000000F4F4F400000000000000
      000000000000000000000000000030303000A0A0A000FFFFFF00FEF7FB00FAF9
      FE00F8FAFF00F6FAFF00F5F8FD00F5FBFF00CC843400D1934D00E0BE9800CD85
      3600CB802D00F6FCFF00FFFFFF009F9F9F00B47B0800FFFFFF00FFFBEB00FFFC
      EC00FFFFF000D7BA9600FFFFF100FFFFF100D8BA9700FFFFF400FFFFF800ECBF
      9F00FFFFFB00FFFFFF00C67D09000000000046A3CE0055D3FD002D7DB100388E
      C100368FC300308DC00051C3E90063D7FB006ADAFC0072DDFD005DC0EA005EBB
      EA00000000000000000000000000000000002E2E2E00383737002A282800F8F8
      F8002F2E2E0000000000FEFEFE002C2B2B002C2B2B00FEFEFE00000000003837
      37003332320032313100373636002C2C2C009F9F9F00FFFFFF00F2F5F800DBAF
      8000CC823100CA7C2600D9AB7800F4FDFF00CA7C2700D1914D00F5FFFF00CC83
      3300CA7E2A00F2F8FE00FFFFFF009F9F9F00B47B0800FFFFFF00D4B38C00D5B5
      8F00D7B89200D8BA9500D7B89300D7B89300D8BA9500D7B89300D9B99400DBBA
      9600DAB89200FFFFFF00B77B09000000000047A4CE0052CFFC002976AB00297C
      B100389FCF0054CAF2007DDCFA0074D9FA0062D7F9006DDDFC0067D3F30063CC
      EF004FACDA000000000000000000000000002B2B2B004D4C4B00FCFDFD00F7F7
      F7004847450000000000F7F5F5003F3E3D003F3E3D00F5F4F400000000008C8C
      8B00FEFEFF00FDFEFE008B8C8A00262626009F9F9F00FFFFFF00EFF3F800C979
      2100F1F9FF00CE8A3F00CB7E2A00F1FAFF00E1C9AF00CD843400CA7D2800CB7E
      2900D8A97500EFF1F500FFFFFF009F9F9F00B47B0800FFFFFF00FFF7DF00FFF8
      E100FFFBE500D6B78F00FFFBE600FFFBE600D6B78F00FFFBE600FFFBE600D5B7
      8E00FFFAE300FFFFFF00B47B080000000000000000004CBDE90050CEFA0071D9
      FC0083DDFC00AFEAFD00A0E4FA0086DBF8005CD2F80061D7F90069DAFA0061CB
      EE0059BFE4000000000000000000000000002A2B2B006563610058565500FFFF
      FF00615F5E00000000009E9D9C00FFFFFF00FFFFFF00A7A6A50000000000FCFC
      FB005653520055535200FBFBFA00232324009F9F9F00FFFFFF00ECF2F700CA7B
      2500EDF7FF00CF8A3F00CB7F2A00EDF4FB00ECF0F400EDF2F700EAEBEB00EAEB
      EA00ECF0F400EAECEC00FFFFFF009F9F9F00B47B0800FFFFFF00FFF5D700FFF6
      D900FFF9DE00D7B58B00FFF9DF00FFF9DF00D7B58B00FFF9DF00FFF9DF00D7B5
      8A00FFF8DB00FFFFFF00B47B08000000000000000000000000004BBEEB0055CC
      F900D0F4FF00D2F4FF009DE1FA0081D8F800A1E3FB007EDBF90061D7FA0066D6
      F80060CBED0041A0CC0000000000000000002C2C2C00444341003E3D3B003C3B
      380043423F0000000000403F3D0039383600393835003F3E3B00000000009A9A
      9B003B3A37003B3A37009A9A9A00262626009F9F9F00FFFFFF00EAEFF500CB7D
      2700CF8E4700CB7E2900D5A06600EAEDF100E9E9E900E8E8E800E9E9E900E9E9
      E900E8E8E800E7E6E500FFFFFF009F9F9F00B57B0900FFFFFF00DDB17C00E0B4
      7E00E0B68200DEB78600DFB68300DFB68300DEB78600DFB68300DFB68300DDB6
      8400DBB37F00FFFFFF00B57B0900000000000000000000000000000000000000
      000063B2D60053B0D80053B7DF00ACE0F500C7F0FE00ACE7FC007EDCFA0063D9
      FB0064D5F7003E9BC70000000000000000002C2C2C0065656500626363006262
      6200646464006565650063636400616162006161610063636300646464006161
      61006161610061616100626262002A2A2A009FA0A000FFFFFF00E6EEF500CA7C
      2400E8F3FD00E7EEF400E6EAEE00E5E7E700E5E5E400E4E5E400E4E5E400E4E5
      E400E4E4E300E3E3E200FFFFFF009F9F9F00B57C0900FFFFFF0044C3FF0049C5
      FF0047C6FF00E3B57E0046C7FF0046C7FF00E3B57E0046C7FF0046C7FF00E1B4
      7E0040C4FF00FFFFFF00B57C0900000000000000000000000000000000000000
      0000000000000000000000000000000000003EAAD70077D3F500A8E9FD0085E1
      FE005ABDE20046A7D3005FB5DE00000000006F6F6F002C2C2C002B2B2B002B2B
      2B002B2B2B002B2B2B002B2B2B002B2B2B002B2B2B002B2B2B002B2B2B002A2A
      2A002A2A2A002A2A2A002B2B2B006E6E6E00A0A0A000FFFFFF00D0995B00C978
      1E00E2E2E000E2E3E400E1E1E100E1E0DF00E1E0DF00E1E0DF00E1E0DF00E1E0
      DF00E1E0DF00E1DFDE00FFFFFF00A0A0A000B67E0E00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00B67E0E00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000063B2D6004BAED80056AD
      D50046A8D2006FE0FB005EB4DD00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A2A2A200FFFFFF00FFFFFF00FCEB
      D800FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00A2A2A200BD8C2700B67E0E00B67C0900B67B
      0700B67B0800B57B0800B67B0800B67B0800B57B0800B67B0800B67B0800B57B
      0800B67C0900B67E0E00BD8C2700000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00005FB5DE005EB4DD0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000ABACAC00A2A2A200A0A1A200A0A2
      A300A0A1A2009FA0A0009F9F9F009F9F9F009F9F9F009F9F9F009F9F9F009F9F
      9F009F9F9F00A0A0A000A2A2A200ABABAB000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000009E
      5E00009D5D00009E5E000000000000000000BC8F3300B67E0E00B47B0900B47A
      0700B47A0800B47B0800B47A0800B47A0800B47B0800B47A0800B47A0800009E
      5E00009D5D00009E5E00BB882500000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000009E
      5E00009D5D00009E5E0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000009E
      5E00009D5D00009E5E0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000A66A0000BA
      860077DFC40000BA860000A66A0000000000B67E0E00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000A66A0000BA
      860077DFC40000BA860000A66A00000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000A66A0000BA
      860077DFC40000BA860000A66A00000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000A66A0000BA
      860077DFC40000BA860000A66A000000000000000000000000008D4D35009954
      39009952380098513700985036009851370099523800009E5E0000C08C0000BB
      8200FFFFFF0000BB820000C08C00009E5E00B47B0900FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00D6BDA200FFFFFF00FFFFFF00D6BDA200009E5E0000C08C0000BB
      8200FFFFFF0000BB820000C08C00009E5E004296D000368FCE00368ECC00368E
      CC00368ECC00368ECC00368ECC00368ECC00368ECC00009E5E0000C08C0000BB
      8200FFFFFF0000BB820000C08C00009E5E00000000000000000090822A009C8D
      2D009C8C2C009B8B2B009B8B2A009B8B2B009C8C2C00009E5E0000C08C0000BB
      8200FFFFFF0000BB820000C08C00009E5E00000000000000000099543900B36F
      4A00AD684200AA623B00A85F3700AA623B00AD684200009C5C0077E5CC00FFFF
      FF00FFFFFF00FFFFFF0077E5CC00009C5C00B47A0800FFFFFF00FFFFFD00FFFF
      FD00FFFFFF00D7BEA000FFFFFF00FFFFFF00D7BEA000009C5C0077E5CC00FFFF
      FF00FFFFFF00FFFFFF0077E5CC00009C5C00368FCE0084DFFF0076D8FF0076D7
      FF0076D7FF0076D7FF0076D7FF0076D7FF0076D7FF00009C5C0077E5CC00FFFF
      FF00FFFFFF00FFFFFF0077E5CC00009C5C0000000000000000009C8D2D00B8B1
      3F00B2AB3600AFA72E00ADA52A00AFA72E00B2AB3600009C5C0077E5CC00FFFF
      FF00FFFFFF00FFFFFF0077E5CC00009C5C00000000000000000099523800B571
      4E00A7603B00FFFFFF00FFFFFF00FFFFFF00A7613B00009D5D0000CC980000C8
      8F00FFFFFF0000C88F0000CC9800009D5D00B47B0800FFFFFF00D4B99900D5BA
      9A00D6BC9E00D8BFA100D7BD9E00D7BD9E00D8BFA100009D5D0000CC980000C8
      8F00FFFFFF0000C88F0000CC9800009D5D00358ECD0088D9FF0068CBFC0069CB
      FB0069CBFB0069CBFB0069CBFB0069CBFB0069CBFB00009D5D0000CC980000C8
      8F00FFFFFF0000C88F0000CC9800009D5D0000000000000000009C8C2C00BAB2
      4300ACA22F00FFFFFF00FFFFFF00FFFFFF00ACA32F00009D5D0000CC980000C8
      8F00FFFFFF0000C88F0000CC9800009D5D00000000000000000098533800B875
      5200A7603C00A0522B00FFFFFF009F502900A65E3A00A963410000AE720000D4
      9E0077EDD40000D49E0000AE720000000000B47B0800FFFFFF00FFFDF200FFFE
      F300FFFFF700D7BB9A00FFFFF800FFFFF800D7BB9A00FFFFF80000AE720000D4
      9E0077EDD40000D49E0000AE720000000000348ECD008FD9FC005DC4F8005FC4
      F70060C4F70060C4F70060C4F70060C4F70060C4F70060C4F70000AE720000D4
      9E0077EDD40000D49E0000AE7200348ECD0000000000000000009B8C2C00BCB4
      4700ACA13000A5991E00FFFFFF00A4981C00ABA02E00AEA3350000AE720000D4
      9E0077EDD40000D49E0000AE720000000000000000000000000098533800BC79
      5700A5613E00A0552F00FFFFFF009B4B24009F552F00A25A3500A55F3B00009C
      5D00009B5B00009C5D000000000000000000B47B0800FFFFFF00FFFBEB00FFFC
      EC00FFFFF000D7BA9600FFFFF100FFFFF100D7BA9600FFFFF100FFFFF100009C
      5D00009B5B00009C5D00B47B080000000000338ECD009ADBFC0054BCF30057BD
      F30058BDF30058BDF30058BDF30058BDF30058BDF30058BDF30058BDF300009C
      5D00009B5B00009C5D009ADBFC00338ECD0000000000000000009B8C2C00C0B7
      4C00AAA03200A59A2200FFFFFF00A0941700A49A2200A79D2900AAA02F00009C
      5D00009B5B00009C5D000000000000000000000000000000000098523700BF7C
      5C00A35E3D009F532F00FFFFFF00FFFFFF00FFFFFF00FFFFFF00A25A3500A35C
      3A00BF7C5C00985237000000000000000000B47B0800FFFFFF00D4B38C00D5B5
      8F00D7B89200D8BA9500D7B89300D7B89300D8BA9500D7B89300D7B89300D8B9
      9400D6B68F00FFFFFF00B47B080000000000338ECD00A5DDFB0049B5F0004EB6
      F0004FB7F0004FB7F0004FB7F0004FB7F0004FB7F0004FB7F0004FB7F0004FB7
      F0004EB6F00049B5F000A5DDFB00338ECD0000000000000000009B8C2B00C3B9
      5100A89D3100A3972200FFFFFF00FFFFFF00FFFFFF00FFFFFF00B8AF5500A89C
      2E00C3B951009B8C2B000000000000000000000000000000000098513700C27F
      6000A25D3C009D522F00FFFFFF00984722009B4D2900984C2C009C502E009F55
      3300C27F6000985137000000000000000000B47B0800FFFFFF00FFF7DF00FFF8
      E100FFFBE500D6B78F00FFFBE600FFFBE600D6B78F00FFFBE600FFFBE600D5B7
      8E00FFFAE300FFFFFF00B47B080000000000328ECD00B4E1FB003CACEC0040AE
      ED0041AEEC0041AEEC0041AEEC0041AEEC0041AEEC0041AEEC0041AEEC0041AE
      EC0040AEED003CACEC00B4E1FB00328ECD0000000000000000009B8B2B00C6BB
      5500A69B3000A1952200FFFFFF009C8F15009F921C00C8C17F00FFFFFF00A397
      2700C6BB55009B8B2B000000000000000000000000000000000098513700C483
      65009F5A39009B4F2D00FFFFFF009A4C29009E52310099492600984C2C009C50
      2E00C4836500985137000000000000000000B47B0800FFFFFF00FFF5D700FFF6
      D900FFF9DE00D7B58B00FFF9DF00FFF9DF00D7B58B00FFF9DF00FFF9DF00D7B5
      8A00FFF8DB00FFFFFF00B47B080000000000328ECD00C4E6FB0091CFF40093D0
      F40093D0F40092CEF20092CEF20091CEF20091CEF20092CEF20092CEF20093D0
      F40093D0F40091CFF400C4E6FB00328ECD0000000000000000009B8B2B00C8BE
      5A00A4982D009F922000FFFFFF009E911C00A29425009D8F1900FFFFFF00A093
      2200C8BE5A009B8B2B000000000000000000000000000000000098503600C786
      67009C54340096472500FFFFFF00944320009748260097482600FFFFFF00984C
      2C00C6856700985036000000000000000000B57B0900FFFFFF00DDB17C00E0B4
      7E00E0B68200DEB78600DFB68300DFB68300DEB78600DFB68300DFB68300DDB6
      8400DBB37F00FFFFFF00B57B090000000000358FCD0074D8FF0055B0E3003E8D
      C40059B3E50072D5FF0071D4FF006FD2FF006FD2FF0071D4FF0072D5FF0059B3
      E5003E8DC40055B0E30074D8FF00358FCD0000000000000000009B8B2A00CCC1
      5D00A09328009A8B1800FFFFFF00988913009B8C1900C4BD7A00FFFFFF009C8E
      2000CBC05D009B8B2A000000000000000000000000000000000097513600C987
      6B0098503000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF009850
      3000C8866A00975136000000000000000000B57C0900FFFFFF0044C3FF0049C5
      FF0047C6FF00E3B57E002839C4002839C400E3B57E0046C7FF0046C7FF00E1B4
      7E0040C4FF00FFFFFF00B57C09000000000079B5DE0058B8ED0069CDFD0069CD
      FD0052ABE0003D8CC30054AEE10068CCFD0068CCFD0054AEE1003D8CC30052AB
      E00069CDFD0069CDFD0058B8ED0059A3D60000000000000000009A8B2A00CEC1
      61009C8F2400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E1D99F009C8F
      2400CDC060009A8B2A000000000000000000000000000000000097513600CC8B
      6F0099523400974D2E00964A2A00954929009348280093482800934828008E41
      2400CA886C00975035000000000000000000B67E0E00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF001C32CB0098A3F400A1AEF5001B30CB00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00B67E0E0000000000000000007CB6DE004FB2E8005DC4
      F8005DC4F9005EC6FA0050ABE1003884BB003884BB0050ABE1005EC6FA005DC4
      F9005DC4F8004FB2E8007CB6DE000000000000000000000000009A8B2A00D1C4
      66009C8F28009B8D22009A8C1E00998B1D0097891C0097891C0097891C009281
      1800CFC262009A8B2900000000000000000000000000000000008D4D35009952
      3900995239009952390099523900995239009952390099523900995239009952
      3900995239008D4D35000000000000000000C9A04D00B67E0E00B67C0900B67B
      07001329C9008D9BF500465FF8003853F100A9B5F8001228C900B67B0800B57B
      0800B67C0900B67E0E00C3963A000000000000000000000000007DB6DF004AAD
      E60049A6DE003D8DC50047A5DE0053BFF70053BFF70047A5DE003D8DC50049A6
      DE004AADE6007DB6DF000000000000000000000000000000000090822A009C8C
      2D009C8C2D009C8C2D009C8C2D009C8C2D009C8C2D009C8C2D009C8C2D009C8C
      2D009C8C2D0090822A0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000091E
      BF00818EF500546AFF004961F9003C56F3002A48F000A7B3F7000B21C4000000
      00000000000000000000000000000000000000000000000000000000000079B5
      DF003992CF003992D0003992CF003991CF003991CF003992CF003992D0003992
      CF0079B5DF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000005D5F
      B3001225BD00182BBE001B2DBE001B2DBE00192CC1001226C2005F5FAE000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000003A6EA0003B6C9B00000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000009E
      5E00009D5D00009E5E0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000009E
      5E00009D5D00009E5E000000000000000000BABAB900AFAFAD00AEAEAB00ADAD
      AB00ADADAB00ADAEAB00AFAFAE00B2B3B000B2AEA600B0AB9F00AFA99C00AEA8
      9C00AEA99C00B0AA9E00BAB6AE000000000000000000C7C6C300BBB7AF00B2AC
      A000AFA99D00AEA99C00AEA89C00AEA89C00AEA89C00AFA99D00B2ACA000BBB7
      AF00316EA70029B2FF0044C8FF003A82CA000000000000000000000000000000
      0000000000000000000000000000A1613D00000000000000000000A66A0000BA
      860077DFC40000BA860000A66A00000000000000000000000000676564006765
      640063616000000000000000000000000000000000000000000000A66A0000BA
      860077DFC40000BA860000A66A0000000000B0B0AD00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00C5BFB500B7B1A400D3C9C100E4DAD200EFE4
      DD00E8DDD600D5CDC400B9B4A700B7B2A700C1BEB900B4ADA200C2BBB000D0C7
      BE00DFD5CD00E6DCD400E0D5CF00A8A29E006C6C6E0067676B0067676A006D6A
      690081746B003BC6FF0057DBFF003980C9000000000000000000000000000000
      000000000000A1613D00A1613D00A1613D00A1613D00009E5E0000C08C0000BB
      8200FFFFFF0000BB820000C08C00009E5E00000000006A686600B7B5B300B2B0
      AE00AEABA800615F5E00000000000000000000000000009E5E0000C08C0000BB
      8200FFFFFF0000BB820000C08C00009E5E00AEAEAB00FFFFFF00FDFDFD00FCFC
      FD00FCFCFD00FDFDFE00FFFFFF00A9A29400C8C1B700D4CCC300E1D6CE00EBE1
      D900E4DAD200D7D0C700CDC6BC00B1AB9F00B1AB9F00C7C0B600CFC7BE00D5CC
      C300DBD2C900E2D8D000A7A09D0076737200E8C99200FFEEA700FFF5B100E8D5
      A30077716C00A09085003280CF00000000000000000000000000000000000000
      00000000000000000000A1613D00A1613D00A1613D00009C5C0077E5CC00FFFF
      FF00FFFFFF00FFFFFF0077E5CC00009C5C0076747200C1C1BE007F7D7B000000
      0000716F6D009E9C9900615F5E000000000000000000009C5C0077E5CC00FFFF
      FF00FFFFFF00FFFFFF0077E5CC00009C5C00ADADAB00FFFFFF00FAF8F800F9F8
      F800F9F8F800FAF9FA00FFFFFF00A9A29500C7C0B600D3CBC200DFD5CD00EAE0
      D800E3D8D000D6CEC500CCC5BB00B0AA9E00B1AB9F00C9C0B800CDC5BC00D4CB
      C200DAD1C800E1D7CF0077777800E9C48A00FFE7A600FFE7A600FFEFB300FFF9
      BB00E9D6A2008078750000000000000000000000000000000000000000000000
      0000000000000000000000000000A1613D0000000000009D5D0000CC980000C8
      8F00FFFFFF0000C88F0000CC9800009D5D007C7A7800D5D3D200000000000000
      00000000000074727000AFACAA006664620000000000009D5D0000CC980000C8
      8F00FFFFFF0000C88F0000CC9800009D5D00ADADAB00FFFFFF00F6F6F600F6F6
      F600F6F6F600F7F7F800FCFDFF00A9A29500C6BFB400D1C8C000DED3CB00E8DE
      D600E1D6CE00D4CCC300CAC3B900B0AA9E00B0AB9E00C8BFB700CBC3BA00D2C9
      C000D8CFC500DFD5CD0076787B00FFE3A000FFEFCA00FFE7B300FFE9AB00FFEF
      B200FFF4AF007876770000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000AE720000D4
      9E0077EDD40000D49E0000AE7200000000007F7D7A00EEEDEC0083817F000000
      00006D6A680058565600B7B5B3006F6D6B00000000000000000000AE720000D4
      9E0077EDD40000D49E0000AE720000000000ADADAB00FFFFFF00F4F4F300F4F4
      F300F4F4F300F5F5F500FAFBFB00A8A19400E3DDD600F8F4EE00FDF9F200F9F5
      ED00FDF8F200F9F4EE00E6DFD800AEA99C00B0AA9E00C9C2B900E2DDD400F5EF
      E900FFFBF400FEFAF3007C7C7F00FFDF9900FFF7E400FFEDC800FFE7B200FFE6
      A500FFECA5007C7B7E00000000000000000000000000A1613D00000000000000
      000000000000A1613D00A1613D00A1613D00A1613D00A1613D0000000000009C
      5D00009B5B00009C5D000000000000000000000000007A787600EAEBEA008482
      80007A787600B9B8B700585654003F404000000000000000000000000000009C
      5D00009B5B00009C5D000000000000000000ADADAB00FFFFFF00F2F1F000F2F1
      F000F2F1F000F3F2F100F7F7F700A7A09300EDE5DC00DCD3C800D8CFC500D8CF
      C500D8CFC500DDD3C900EFE7DE00AEA99C00C1BDB600F9F4EE00D7D0C800C6BE
      B600BEB5AB00C2B9AF0084838500EBC08000FFF5DC00FFF7E400FFEFCA00FFE6
      A500EBCC950084838500000000000000000000000000A1613D00A1613D000000
      000000000000A1613D00000000000000000000000000A1613D00000000000000
      0000A1613D00A1613D000000000000000000000000000000000078767500EEED
      EC00D7D5D50079777500F5F6F6005A5856000000000000000000000000000000
      000000000000000000000000000000000000ADADAB00FFFFFF00EFEFEE00EFEF
      EE00EFEFEE00EFF0EF00F3F4F300BAB5AB00C8C0B400E7DFD500ECE4DA00ECE4
      DA00EDE5DB00E9E1D700CCC5BA00BDB8AE00BBB7AF00A3998F00B6AEA400C8BF
      B600D8CFC700E3D9D100CFC6C2008E8B8800ECC08100FFDE9800FFE19D00ECC7
      8D008E8A8900AEAAA5000000000000000000A1613D00A1613D00A1613D00A161
      3D0000000000A1613D00000000000000000000000000A1613D0000000000A161
      3D00A1613D00A1613D00A1613D00000000000000000000000000000000007F7D
      7B00807E7C007F7D7B007A787600F5F6F6005A5756003F3F3F006E6C6A006463
      620000000000000000000000000000000000ADADAB00FFFFFF00ECEBEA00EDEC
      EB00EDECEB00EDECEB00EFEEED00ECEBEB00C7C3BB00ACA59800A7A09300A8A2
      9400ACA59800AEA89C00D1CDC60000000000B1AB9F00CAC1B900CEC7BE00D5CC
      C300DAD1C800E1D7CF00E8DCD600D1C8C3008F8D8F008B8B8E008B8B8E008E8D
      8F00BAB5AE00B1AB9F00000000000000000000000000A1613D00A1613D000000
      000000000000A1613D00000000000000000000000000A1613D00000000000000
      0000A1613D00A1613D0000000000000000000000000000000000000000000000
      00000000000000000000000000007A787600F5F5F50056545300B7B5B300AFAC
      AA0061605F00000000000000000000000000ADADAB00FFFFFF00E9E9E800EAEA
      E900EAEAE900EAEAE900E9EAE900F5F5F400FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00AFB0B000000000000000000000000000B1AB9E00C8BFB700CBC3BA00D2C8
      BF00D8CEC500DFD5CD00E9DED800E9DDD600E0D6CF00DACFC700D3CBC200CEC6
      BD00C9C2B800B0AB9E00000000000000000000000000A1613D00000000000000
      000000000000A1613D00A1613D00A1613D00A1613D00A1613D00000000000000
      000000000000A1613D0000000000000000000000000000000000000000000000
      00000000000000000000000000007D7B790077757200F4F4F500575555006260
      5E00B0ADAB00636160000000000000000000ADAEAB00FFFFFF00E7E5E400E8E7
      E600E8E7E600E8E7E600E7E5E400FFFFFF00CCCCCB00A7A7A500A6A6A400FFFF
      FF00AFAFAE00000000000000000000000000B0AA9D00C7C0B800E1DBD200F3ED
      E600FDF9F200FCF8F100FBF7F000FBF7F000FCF8F100FDF8F200F4EEE600E2DB
      D300CAC3B900AFAA9D0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000007F7D7C00D6D4D300797775006E6C69000000
      00005F5D5B00AFABA9006664630000000000AEAEAB00FFFFFF00E3E3E200E4E4
      E300E4E5E400E4E4E300E3E3E200FFFFFF00A7A7A400EBEBEA00FFFFFF00E9E9
      E900CACAC800000000000000000000000000AEA89C00FBF5EF00EEE7DE00E3DC
      D300DDD5CC00DDD5CB00DDD4CB00DDD4CB00DDD4CB00DDD5CB00E3DCD300EEE7
      DE00FBF6EF00AEA89C0000000000000000000000000000000000000000000000
      0000000000000000000000000000A1613D000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000007F7D7B00EEEDEC007F7D7A00000000000000
      000000000000B2B0AE006A68660000000000AEAEAC00FFFFFF00E0DFDE00E1DF
      DE00E1E0DF00E1DFDE00E0DFDE00FFFFFF00A5A5A300FFFFFF00E8E8E800CBCB
      C90000000000000000000000000000000000AFA99D00E1D8CE00E1D8CE00DFD6
      CC00DFD6CB00DFD5CB00DFD5CB00DFD5CB00DFD5CB00DFD6CB00DFD6CC00E1D8
      CE00E1D8CE00AFA99D0000000000000000000000000000000000000000000000
      00000000000000000000A1613D00A1613D00A1613D0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000079777500F5F5F4007E7B79000000
      00006C6A6700B9B7B4006D6B6A0000000000AFAFAD00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E9E9E900CACAC9000000
      000000000000000000000000000000000000DCDAD400B6B0A400D2CABF00E2D9
      D000EFE7DD00EEE6DC00EEE6DC00EEE6DC00EEE6DC00EFE7DD00E2D9D000D2CA
      BF00B6B0A400DCDAD40000000000000000000000000000000000000000000000
      000000000000A1613D00A1613D00A1613D00A1613D00A1613D00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000007B787600EEEDEC00D5D3
      D200C3C2C00073716E000000000000000000B8B8B600B0B0AD00AEAEAC00AEAE
      AB00AEAEAB00AEAEAB00ADAEAB00AEAEAB00AFAFAD00B7B7B500000000000000
      0000000000000000000000000000000000000000000000000000CBC7BF00B2AC
      A100AEA89C00AEA89C00AEA89C00AEA89C00AEA89C00AEA89C00B2ACA100CBC7
      BF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000A1613D000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000817F7D007F7D
      7C007C7A78000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C19C7000BA864500B984
      4400B7814100B6803F00B57F3F00B57F3F00B57F3F00B57F3F00B57F3F00B57F
      3F00B6803F00B7824100BC905900000000000000000000000000000000000000
      000000000000A59180008E7055008D6E53008D6E53008D6E53008D6E53008D6E
      53008D6E53008D6E53008E715600977C63000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000009E
      5E00009D5D00009E5E0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000374D
      CC00384DCB00384DCC00000000000000000000000000BA864500C89D6200B680
      3F00FBDDA600F6D69E00F6D69D00F6D69D00F6D69D00F6D69D00F6D69D00F6D6
      9D00F6D69E00FBDDA700B7824100000000000000000000000000000000000000
      0000000000008C6C5000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF008F71560000000000C6C5C300B9B4AB00B0AA
      9E00AFA99D00AEA89C00AEA89C00B0A89D00BDABA2004EA37B0000A5670000BA
      850077DFC40000BA860000A66A000000000000000000C6C5C300B9B4AB00B0AA
      9E00AFA99D00AEA89C00AEA89C00B0AA9C00B9B199006C76B800324ED900375C
      F900375DFA00385DF9003852D7000000000000000000BA854500C89C6100B57E
      3D00F8DAA400F2D09500F1CF9400F2D09400F1CF9400F0CE9400F0CE9400F0CE
      9400F1CF9500F7DAA400B6803F0000000000B6B7B600B1B3B200B0B1B000B0B2
      B200B2B6B60088664800FFFFFF00848586007D7E7E009C9C9D007F8080007F80
      80009B9B9C0078797A00FFFFFF008D6E5300BDB9B200B4AEA200C5BEB300D4CA
      C200E1D7CF00E8DED600EFE4DD00EEE1DA00F6DBD8000099530000BF8A0000BB
      8200FFFFFF0000BB820000C08C00009E5E00BDB9B200B4AEA200C5BEB300D4CA
      C200E1D7CF00E8DED600EFE4DD00EDE2D800F0E3CE00213CCE003E62FC003B60
      FA003A5DF8003C60FA004165FB00344BCC0000000000BA854500C89C6000B57E
      3C00FADDA600F0CD9100F0CD9100F0CD9100F0CD9100F0CD9100EFCC9100EFCC
      9100F0CD9100F7DBA700B57F3E0000000000B0B0AE00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0084624400FFFFFF008687870062626200FFFFFF00646464006464
      6400FFFFFF005A5B5B00FFFFFF008D6E5300B1AB9F00C8C1B600CFC7BF00D6CC
      C500DCD3CA00E4D9D200EBE0D900EADDD600F3D8D5000096500073E4CA00FFFF
      FF00FFFFFF00FFFFFF0077E5CC00009C5C00B1AB9F00C8C1B600CFC7BF00D6CC
      C500DCD3CA00E4D9D200EBE0D900E8DED400EEE0CA001F39CB00A6B8FF00FFFF
      FF00FFFFFF00FFFFFF00A9BAFF003148CA0000000000BA854500C89C6000B67F
      3C00FFE3A800F1CA8B00F1CA8B00F1CA8B00F1CA8B00F1CA8B00EFC98C00EFC9
      8C00F0CA8D00F8DCAB00B57F3E0000000000AEAEAB00FFFFFF00FCFCFC00FDFD
      FD00FFFFFF0083614300FFFFFF00646566007B7B7B00999898007B7B7C007B7B
      7C009796960074757600FFFFFF008D6E5200B0AB9E00C7C0B600CDC4BB00D3CA
      C200DAD1C800E2D7CF00ECE1DA00E7DBD300F0D6D20000954E0000CA940000C7
      8F00FFFFFF0000C88F0000CC9800009D5D00B0AB9E00C7C0B600CDC4BB00D3CA
      C200DAD1C800E2D7CF00ECE1DA00E7DBD100EBDDC9001C37CA005875FE005775
      FE005473FD005776FE005D79FF00334ACB0000000000BA854500C89C6000B77F
      3B00FFE9A900EFC68100EFC68100EFC68100EFC68100EFC68100ECC48200EDC6
      8400EEC88800F8DDAF00B57F3E0000000000ADADAB00FFFFFF00F8F7F700FAF9
      F900FFFFFF0082614200FFFFFF00F2F4F700FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF008D6E5300B0AA9E00CAC3B900EAE5DD00F7F3
      EB00FFFBF400FDFAF300FDF9F200FFFAF300FFFEFA0068C49D0000AB6A0000D3
      9C0075EDD30000D39E0000AE720000000000B0AA9E00CAC3B900EAE5DD00F7F3
      EB00FFFBF400FDFAF300FDF9F200FFFAF300FFFFF3008993DD003954DE006C86
      FF00728AFF006F89FF00465EDD000000000000000000BA854500C89C6000B880
      3A00FFEDAC00EEC48300FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00EEC48300F8DEB200B57F3E0000000000ADADAB00FFFFFF00F5F4F400F6F5
      F500FAFBFC00B09D8A0083624300846345008462440084624400856345008867
      4A008B6C4F008C6D52008D6F5400C0B0A200C1BDB600F9F3ED00D8D1C900C2B8
      B000BFB6AE00C5BAB200C8BEB500C6BBB300C5B8B100D7BEBB0047A27800009B
      5400009A5600009C5B000000000000000000C1BDB600F9F3ED00D8D1C900C2B8
      B000BFB6AE00C5BAB200C8BEB500C6BCB300C4BAAF00D1C5B2006771BA00233E
      D0002942CE002F47CD00000000000000000000000000BA854500C89C6000B77F
      3A00FFEEAF00EDBE7300EDBE7300EDBE7300EDBE7300EDBE7300EABC7400EBBE
      7800EDC38000F9DFB600B57F3D0000000000ADADAB00FFFFFF00F2F1F100F2F1
      F100F4F4F400F7F8F900F6F7F900F7F8FA00F6F7FA00F6F7FA00FFFFFF00B3B7
      B80000000000000000000000000000000000BBB7AF00A39A8F00BAB2A700CAC1
      B800DED5CC00E5DBD300ECE1DA00E8DED500E1D6CE00D2C4BD00CAB6B000BA9F
      9A00CDBBB700000000000000000000000000BBB7AF00A39A8F00BAB2A700CAC1
      B800DED5CC00E5DBD300ECE1DA00E8DED500E1D7CE00D1C6BB00C6BBAA00B4A7
      9000C8C1AE0000000000000000000000000000000000BA854500C89C6000B77F
      3A00FFEFB400EDC27D00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00EDC27D00F9E1BB00B57F3D0000000000ADADAB00FFFFFF00EFEDEE00EFEE
      EE00EFEEEE00EFEFEF00EFEFEF00EFEFEF00EFEFEF00F0EFF000FFFFFF00AFB2
      B3000000000000000000AC6E310000000000B1AB9F00C9C2B900CFC7BF00D5CC
      C400DCD3CA00E3D9D100EADFD800E5DCD300DED4CC00D8CFC600D3CAC100CFC4
      BD00BAACA200000000000000000000000000B1AB9F00C9C2B900CFC7BF00D5CC
      C400DCD3CA00E3D9D100EADFD800E5DCD300DED4CC00D8CFC500D3CBC100CEC6
      BA00B7B09D0000000000000000000000000000000000BA854500C89B6000B77F
      3A00FFF1B800EFC07900EFC07900EFC07900EFC07900EFC07900EBBE7A00ECBF
      7C00EDC07E00FBE4BF00B57F3D0000000000ADADAB00FFFFFF00EBEAEA00ECEB
      EB00ECEBEB00EBE9E900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00ADB2
      B50000000000AC6E3100AC6E310000000000B0AB9E00C7C0B600CCC4BB00D3C9
      C100DAD0C700E1D7CF00EBE1DA00E4D9D100DCD1C900D5CCC200CEC6BD00CAC1
      B900B2AB9F00000000000000000000000000B0AB9E00C7C0B600CCC4BB00D3C9
      C100DAD0C700E1D7CF00EBE1DA00E4D9D100DCD1C900D5CCC200CEC6BD00CAC1
      B900B1AB9E0000000000000000000000000000000000BA854500C89B6000B77F
      3900FFF4BD00EFC37D00EFC37D00EFC37D00EFC37D00EFC47F00ECC18000ECC1
      8000ECC07E00FBE6C500B57F3C0000000000ADADAB00FFFFFF00E8E7E700E9E8
      E800E9E8E800E7E6E600FFFFFF00CBCBCA00A6A6A400A5A5A200FFFFFF00AEB4
      B800B9773100BC7E3D00AC6E310000000000AFAA9D00C8C1B700E8E3DB00F5F0
      E800FDF8F200FCF8F100FBF7F000FCF7F100FCF8F100F6F0EA00E9E2DB00CAC2
      BA00B0A99D00000000000000000000000000AFAA9D00C8C1B700E8E3DB00F5F0
      E800FDF8F200FCF8F100FBF7F000FCF7F100FCF8F100F6F0EA00E9E2DB00CAC2
      BA00AFA99D0000000000000000000000000000000000BA854500C79B5F00B77F
      3900FFF5C100EFC37D00EFC37D00EFC37D00EFC37D00EFC37D00ECC17E00ECC0
      7D00ECBF7A00FCE8C900B57F3C0000000000AEAEAB00FFFFFF00E4E3E300E5E4
      E400E5E4E400E4E3E300FFFFFF00A6A6A400FBFBFA00FFFFFF00E9E9EB00CCD1
      D30000000000CB8D4600AC6E310000000000AEA89C00FBF5EF00EEE7DE00E0D8
      CE00DDD5CC00DDD4CB00DDD4CB00DDD4CB00DDD5CC00E0D7CE00EDE6DE00FBF6
      EF00AEA89C00000000000000000000000000AEA89C00FBF5EF00EEE7DE00E0D8
      CE00DDD5CC00DDD4CB00DDD4CB00DDD4CB00DDD5CC00E0D7CE00EDE6DE00FBF6
      EF00AEA89C0000000000000000000000000000000000B9844400C6995D00B77E
      3700FFF7C700EFBF7700EFBF7700EFBF7700EFBF7700EFBF7700ECBD7800ECBD
      7700ECBC7500FDEBCF00B57F3C0000000000AEAEAC00FFFFFF00E0DFDE00E1DF
      DE00E1DFDE00E0DFDD00FFFFFF00A5A5A300FFFFFF00E8E8E900CCCDCD000000
      00000000000000000000AC6E310000000000AFA99D00E1D8CE00E1D7CE00DFD6
      CC00DFD5CB00DFD5CB00DFD5CB00DFD5CB00DFD5CB00DFD6CC00E1D7CE00E1D8
      CE00AFA99D00000000000000000000000000AFA99D00E1D8CE00E1D7CE00DFD6
      CC00DFD5CB00DFD5CB00DFD5CB00DFD5CB00DFD5CB00DFD6CC00E1D7CE00E1D8
      CE00AFA99D0000000000000000000000000000000000B9844200EEDFCB00B87F
      3900FFFBCE00FEEDD000FEEDD000FEEDD000FEEDD000FEEDD000FCECD000FCEC
      D000FCECD000FFF0D500B6813E0000000000AFAFAD00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E9EAEB00BCBDBD00000000000000
      000000000000000000000000000000000000D0CDC500B6B0A400D6CFC400E6DE
      D500EFE7DD00EEE6DC00EEE6DC00EEE6DC00EFE7DD00E6DED500D6CFC400B6B0
      A400D0CDC500000000000000000000000000D0CDC500B6B0A400D6CFC400E6DE
      D500EFE7DD00EEE6DC00EEE6DC00EEE6DC00EFE7DD00E6DED500D6CFC400B6B0
      A400D0CDC50000000000000000000000000000000000BE8D5100B9844200BA84
      4100B77F3B00B77F3B00B77F3B00B77F3B00B77F3B00B77F3B00B57E3C00B57E
      3C00B57F3C00B6813E00BD8C500000000000B8B8B600B0B0AD00AEAEAC00AEAE
      AB00AEAEAB00ADAEAB00AEAEAB00AFAFAE00BCBEBE0000000000000000000000
      0000000000000000000000000000000000000000000000000000C5C0B700AEA9
      9C00AEA89C00AEA89C00AEA89C00AEA89C00AEA89C00AEA99C00C5C0B7000000
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
      00000000000000000000000000000000000000000000BA8F6000B8895600B88A
      5700B8895500B5855000B4834C00B4834C00B4834C00B4834C00B4834C00B483
      4C00B4834C00B4834C00B5855000BA805D0000000000BA8F6000B8895600B88A
      5700B8895500B5855000B4834C00B4834C00B4834C00B4834C00B4834C00B483
      4C00B4834C00B4834C00B5855000BA805D0000000000BA8F6000B8895600B88A
      5700B8895500B5855000B4834C00B4834C00B4834C00B4834C00B4834C00B483
      4C00B4834C00B4834C00B5855000BA805D0000000000BA8F6000B8895600B88A
      5700B8895500B5855000B4834C00B4834C00B4834C00B4834C002C7E440000C6
      84000D864600B4834C00B5855000BA805D0000000000BA885100FFDFAA00BC8D
      5800B5844F00EAB46400E4A85300E4A85400E4A85400E4A85400E4A85400E4A8
      5400E4A85400E4A85300EAB46400B585500000000000BA885100FFDFAA00BC8D
      5800B5844F00EAB46400E4A85300E4A85400E4A85400E4A85400E4A85400E4A8
      5400E4A85400E4A85300EAB46400B585500000000000BA885100FFDFAA00BC8D
      5800B5844F00EAB46400E4A85300E4A85400E4A85400E4A85400E4A85400E4A8
      5400E4A85400E4A85300EAB46400B585500000000000BA885100FFDFAA00BC8D
      5800B5844F00EAB46400E4A85300E4A85400E4A85400E4A854000088470000E4
      A60000BE800022894700CC9D5700B5855000888E9700C3CAD40057616E00C697
      5E00B4824B00EAB76C00E3A85200E3A85400FDF9F400FFFFFF00E3A85400E3A8
      5400E3A85400E3A85200EBB86C00B4834C00888E9700C3CAD40057616E00C697
      5E00B4824B00EAB76C00E3A85200E3A85400F8E8D100FFFFFF00FFFFFF00FDF9
      F400E9B97600E3A85200EBB86C00B4834C00888E9700C3CAD40057616E00C697
      5E00B4824B00EAB76C00E3A85200E3A85400F8E8D100FFFFFF00FFFFFF00F6E2
      C600E3A85400E3A85200EBB86C00B4834C00888E9700C3CAD40057616E00C697
      5E00B4824B00EAB76C0037874500008A480000884700008746000088470000D9
      A10000D8A00000BC8000418C4D00B4834C0000000000BC895100AA7A3F00CB9F
      6500B2814B00EDBC7400E3A75200E3A85300F8E8D100FFFFFF00E9B97600E3A8
      5400E3A85300E3A75200EDBC7500B4834C0000000000BC895100AA7A3F00CB9F
      6500B2814B00EDBC7400E3A75200F6E2C600FFFFFF00F8E8D100F0D1A400FFFF
      FF00FDF9F400E3A75200EDBC7500B4834C0000000000BC895100AA7A3F00CB9F
      6500B2814B00EDBC7400E3A75200F0D1A300FFFFFF00FFFFFF00F9EEDD00FFFF
      FF00F4DCBA00E3A75200EDBC7500B4834C0000000000BC895100AA7A3F00CB9F
      6500B2814B00EDBC74000089470043E8C20000D7A00000D7A00000D59F0000D0
      9C0000D09C0000D39F0000B981002F7F450000000000BA885000FFDFA400D0A5
      6800B2804A00EEC07D00E3A85200E3A85400F2D7B000FFFFFF00F2D7B000E3A9
      5500E3A85400E3A85200EEC17E00B4834C0000000000BA885000FFDFA400D0A5
      6800B2804A00EEC07D00E3A85200FDF9F400FFFFFF00E3A95500E3A95500FDF9
      F400FFFFFF00E3A85200EEC17E00B4834C0000000000BA885000FFDFA400D0A5
      6800B2804A00EEC07D00E3A85200E9B97600F6E2C600E9BA7700E3A95500FFFF
      FF00FFFFFF00E3A85200EEC17E00B4834C0000000000BA885000FFDFA400D0A5
      6800B2804A00EEC07D00008845006FE8D00000C8990000C8990000C8990000C7
      970000C8980000CA9A0063E6CD00008A4700888E9700C3CAD400555F6D00D9AE
      6F00B2804A00EFC78A00E4AA5600E4AB5700E8B66D00FFFFFF00FAEEDD00E4AB
      5700E4AB5700E4AA5600F0C88B00B4834C00888E9700C3CAD400555F6D00D9AE
      6F00B2804A00EFC78A00E4AA5600F6E3C700FFFFFF00F1D2A500E8B66D00FFFF
      FF00FDF9F400E4AA5600F0C88B00B4834C00888E9700C3CAD400555F6D00D9AE
      6F00B2804A00EFC78A00E4AA5600E4AB5700F1D2A500FDF9F400FAEEDD00FDF9
      F400FFFFFF00E4AA5600F0C88B00B4834C00888E9700C3CAD400555F6D00D9AE
      6F00B2804A00EFC78A000089460099F0E4004FE9D50051E8D4004DE6D10094E8
      D80000C3970060E0C70000B281003B884A0000000000BC885100A67B3A00DEB5
      7600B17F4900F1CD9700E3AC5700E3AC5700E3AC5700F9EEDD00FFFFFF00E7B7
      6D00E3AC5700E3AC5700F2CD9700B4834C0000000000BC885100A67B3A00DEB5
      7600B17F4900F1CD9700E3AC5700E3AC5700F9EEDD00FFFFFF00FFFFFF00FFFF
      FF00E7B76D00E3AC5700F2CD9700B4834C0000000000BC885100A67B3A00DEB5
      7600B17F4900F1CD9700E3AC5700F0D3A500FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00E3AC5700F2CD9700B4834C0000000000BC885100A67B3A00DEB5
      7600B17F4900F1CD970045934C000089460000874400008642000088470082E4
      D6005ADAC40000AD7F0054A06300B4834C0000000000BA875000FFE09F00E3BB
      7A00B17E4900F3D3A100E3AD5900E3AD5900E3AD5900E7B86F00FFFFFF00F6E4
      C800E3AD5900E3AD5900F4D4A300B4834C0000000000BA875000FFE09F00E3BB
      7A00B17E4900F3D3A100E3AD5900F0D3A600FFFFFF00F9EFDE00F4DEBD00FFFF
      FF00F6E4C800E3AD5900F4D4A300B4834C0000000000BA875000FFE09F00E3BB
      7A00B17E4900F3D3A100E3AD5900FDFAF400FFFFFF00E7B86F00E3AD5900FFFF
      FF00FFFFFF00E3AD5900F4D4A300B4834C0000000000BA875000FFE09F00E3BB
      7A00B17E4900F3D3A1001D31C500283EF0001B2FC100E3AD5900008847007AE4
      D80000AA7F002B904A00F4D4A300B4834C00888E9700C3CAD400545E6D00EBC4
      7F00B17E4900F4D9AD00E3B15E00E3B15E00E3B15E00E3B15E00F2DBB400FFFF
      FF00ECCB9400E3B15E00F5DAAE00B4834C00888E9700C3CAD400545E6D00EBC4
      7F00B17E4900F4D9AD00E3B15E00F6E5C900FFFFFF00F0D5A900E3B15E00FFFF
      FF00FDFAF400E3B15E00F5DAAE00B4834C00888E9700C3CAD400545E6D00EBC4
      7F00B17E4900F4D9AD00E3B15E00FDFAF400FFFFFF00E7BB7300E3B15E00FFFF
      FF00FDFAF400E3B15E00F5DAAE00B4834C00888E9700C3CAD400545E6D00EBC4
      7F00B17E4900F4D9AD001C30C4003046F3001B30C400E3B15E0045944E0000AA
      8500148D4800E3B15E00F5DAAE00B4834C0000000000BC895100A47C3600ECC5
      8100B07E4900F5DEB600E4B26100FDFAF400FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00E4B26100F6DFB800B4824C0000000000BC895100A47C3600ECC5
      8100B07E4900F5DEB600E4B26100F1D6AB00FFFFFF00FFFFFF00FBF5EA00FFFF
      FF00F6E5CA00E4B26100F6DFB800B4824C0000000000BC895100A47C3600ECC5
      8100B07E4900F5DEB600E4B26100F1D6AB00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00F1D6AB00E4B26100F6DFB800B4824C0000000000BC895100A47C3600ECC5
      8100B07E4900F5DEB6001B30C400374DF4001B31C700E4B26100E4B26100E4B2
      6100E4B26100E4B26100F6DFB800B4824C0000000000BA875000F9D18B00EBC4
      7F00B07D4800F8E3C000E5B56500F8EBD600FDFAF500FDFAF500FDFAF500FDFA
      F500FDFAF500E5B56500F8E5C200B4824C0000000000BA875000F9D18B00EBC4
      7F00B07D4800F8E3C000E5B56500E5B56500F1D8AD00FCF5EA00FDFAF500F5E1
      C100E5B56500E5B56500F8E5C200B4824C0000000000BA875000F9D18B00EBC4
      7F00B07D4800F8E3C000E5B56500E5B56500F1D8AD00FDFAF500FDFAF500F1D8
      AD00E5B56500E5B56500F8E5C200B4824C0000000000BA875000F9D18B00EBC4
      7F00B07D4800F8E3C0001B2FC4003E55F7001B30C700E5B56500E5B56500E5B5
      6500E5B56500E5B56500F8E5C200B4824C00888D9700C1C8D200525A6700EBC3
      7B00B07D4600F9EACB00E6BB6F00E4B96B00E4B86800E4B76800E4B86800E4B8
      6800E4B96B00E6BB6F00FAECCD00B4834C00888D9700C1C8D200525A6700EBC3
      7B00B07D4600F9EACB00E6BB6F00E4B96B00E4B86800E4B76800E4B86800E4B8
      6800E4B96B00E6BB6F00FAECCD00B4834C00888D9700C1C8D200525A6700EBC3
      7B00B07D4600F9EACB00E6BB6F00E4B96B00E4B86800E4B76800E4B86800E4B8
      6800E4B96B00E6BB6F00FAECCD00B4834C00888D9700C1C8D200525A6700EBC3
      7B00B07D4600F9EACB001A2FC400455CF9001A2FC700E4B76800E4B86800E4B8
      6800E4B96B00E6BB6F00FAECCD00B4834C0000000000BA864E00FFF2D400FEF1
      D400B27F4900FEF1D700FCEED300FBEDD200FBEDD200FBEDD200FBEDD200FBED
      D200FBEDD200FCEED300FFF2D800B5844F0000000000BA864E00FFF2D400FEF1
      D400B27F4900FEF1D700FCEED300FBEDD200FBEDD200FBEDD200FBEDD200FBED
      D200FBEDD200FCEED300FFF2D800B5844F0000000000BA864E00FFF2D400FEF1
      D400B27F4900FEF1D700FCEED300FBEDD200FBEDD200FBEDD200FBEDD200FBED
      D200FBEDD200FCEED300FFF2D800B5844F0000000000BA864E00FFF2D400FEF1
      D400B27F4900FEF1D7001930C9004C64FF00192FCA00FBEDD200FBEDD200FBED
      D200FBEDD200FCEED300FFF2D800B5844F0000000000C49C7100B7875200B686
      5200B7875200B5844E00B4824C00B4824B00B4824B00B4824B00B4824B00B482
      4B00B4824B00B4824C00B5844F00BC80600000000000C49C7100B7875200B686
      5200B7875200B5844E00B4824C00B4824B00B4824B00B4824B00B4824B00B482
      4B00B4824B00B4824C00B5844F00BC80600000000000C49C7100B7875200B686
      5200B7875200B5844E00B4824C00B4824B00B4824B00B4824B00B4824B00B482
      4B00B4824B00B4824C00B5844F00BC80600000000000C49C7100B7875200B686
      5200B7875200B5844E00605793002338CB0060579200B4824B00B4824B00B482
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
      00000000000000000000000000000000000000000000C19C7000BA864500B984
      4400B7814100B6803F00B57F3F00B57F3F00B57F3F00B57F3F00B57F3F00B57F
      3F00B6803F00B7824100BC9059000000000000000000BA8F6000B8895600B88A
      5700B8895500B5855000B4834C00B4834C00B4834C00B4834C00B4834C00B483
      4C00B4834C00B4834C00B5855000BA805D0000000000BA8F6000B8895600B88A
      5700B8895500B5855000B4834C00B4834C00B4834C00B4834C00B4834C00B483
      4C00B4834C00B4834C00B5855000BA805D0000000000BA8F6000B8895600B88A
      5700B8895500B5855000B4834C00B4834C00B4834C00B4834C00B4834C00B483
      4C00B4834C00B4834C00B5855000BA805D0000000000BA864500C89D6200B680
      3F00FBDDA600F6D69E00F6D69D00F6D69D00F6D69D00F6D69D00F6D69D00F6D6
      9D00F6D69E00FBDDA700B78241000000000000000000BA885100FFDFAA00BC8D
      5800B5844F00EAB46400E4A85300E4A85400E4A85400E4A85400E4A85400E4A8
      5400E4A85400E4A85300EAB46400B585500000000000BA885100FFDFAA00BC8D
      5800B5844F00EAB46400E4A85300E4A85400E4A85400E4A85400E4A85400E4A8
      5400E4A85400E4A85300EAB46400B585500000000000BA885100FFDFAA00BC8D
      5800B5844F00EAB46400E4A85300E4A85400E4A85400E4A85400E4A85400E4A8
      5400E4A85400E4A85300EAB46400B585500000000000BA854500C89C6100B57E
      3D00F8DAA400F2D09500F1CF9400F2D09400F1CF9400F0CE9400F0CE9400F0CE
      9400F1CF9500F7DAA400B6803F0000000000888E9700C3CAD40057616E00C697
      5E00B4824B00EAB76C00E3A85200E3A85400E3A85400E3A85400E3A85400E3A8
      5400E3A85400E3A85200EBB86C00B4834C00888E9700C3CAD40057616E00C697
      5E00B4824B00EAB76C00E3A85200E3A85400E3A85400E3A85400FFFFFF00FDF9
      F400E3A85400E3A85200EBB86C00B4834C00888E9700C3CAD40057616E00C697
      5E00B4824B00EAB76C00E3A85200FBF3E800FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00E3A85200EBB86C00B4834C0000000000BA854500C89C6000B57E
      3C00FADDA600F8D38F00FAD48E00E9C89200F4CF9000F0CD9100EFCC9100EFCC
      9100F0CD9100F7DBA700B57F3E000000000000000000BC895100AA7A3F00CB9F
      6500B2814B00EDBC74006667B400CFB396003745C100E3A85400E3A85400E3A8
      5400E3A85300E3A75200EDBC7500B4834C0000000000BC895100AA7A3F00CB9F
      6500B2814B00EDBC7400E3A75200E3A85300E3A85400E3A85400FFFFFF00FDF9
      F400E3A85300E3A75200EDBC7500B4834C0000000000BC895100AA7A3F00CB9F
      6500B2814B00EDBC7400E3A75200F0D1A300FFFFFF00FFFFFF00FDF9F400FDF9
      F400FDF9F400E3A75200EDBC7500B4834C0000000000BA854500C89C6000B67F
      3C00FFE3A8006667B400CFB396003745C100FBD28900F1CA8B00EFC98C00EFC9
      8C00F0CA8D00F8DCAB00B57F3E000000000000000000BA885000FFDFA400D0A5
      6800B2804A00EEC07D00152DC9000821F000162CC700E3A95500E3A95500E3A9
      5500E3A85400E3A85200EEC17E00B4834C0000000000BA885000FFDFA400D0A5
      6800B2804A00EEC07D00E3A85200E3A85400E3A95500E3A95500FFFFFF00FDF9
      F400E3A85400E3A85200EEC17E00B4834C0000000000BA885000FFDFA400D0A5
      6800B2804A00EEC07D00E3A85200E3A85400F8E8D200FFFFFF00F2D7B000E3A9
      5500E3A85400E3A85200EEC17E00B4834C0000000000BA854500C89C6000B77F
      3B00FFE9A900152DC9000821F000162CC700FFD27F00EFC68100ECC48200EDC6
      8400EEC88800F8DDAF00B57F3E0000000000888E9700C3CAD400555F6D00D9AE
      6F00B2804A00EFC78A001C32C6001930EE001B2FC100E4AB5700E4AB5700E4AB
      5700E4AB5700E4AA5600F0C88B00B4834C00888E9700C3CAD400555F6D00D9AE
      6F00B2804A00EFC78A00E4AA5600E4AB5700E4AB5700E4AB5700FFFFFF00FDF9
      F400E4AB5700E4AA5600F0C88B00B4834C00888E9700C3CAD400555F6D00D9AE
      6F00B2804A00EFC78A00E4AA5600E4AB5700E4AB5700FAEEDD00FFFFFF00F2D8
      B100E4AB5700E4AA5600F0C88B00B4834C0000000000BA854500C89C6000B880
      3A00FFEDAC001C32C6001930EE001B2FC100FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00EEC48300F8DEB200B57F3E000000000000000000BC885100A67B3A00DEB5
      7600B17F4900F1CD97001D32C5002239EF001C2FC100E3AC5700E3AC5700E3AC
      5700E3AC5700E3AC5700F2CD9700B4834C0000000000BC885100A67B3A00DEB5
      7600B17F4900F1CD9700E3AC5700E3AC5700E3AC5700E3AC5700FFFFFF00FDF9
      F400E3AC5700E3AC5700F2CD9700B4834C0000000000BC885100A67B3A00DEB5
      7600B17F4900F1CD9700E3AC5700E3AC5700E3AC5700E3AC5700F9EEDD00FFFF
      FF00F0D3A500E3AC5700F2CD9700B4834C0000000000BA854500C89C6000B77F
      3A00FFEEAF001D32C5002239EF001C2FC100FFCD7200EDBE7300EABC7400EBBE
      7800EDC38000F9DFB600B57F3D000000000000000000BA875000FFE09F00E3BB
      7A00B17E4900F3D3A1001D31C500283EF0001B2FC100E3AD5900E3AD5900E3AD
      5900E3AD5900E3AD5900F4D4A300B4834C0000000000BA875000FFE09F00E3BB
      7A00B17E4900F3D3A100E3AD5900F0D3A600FBF4E900ECC89000FFFFFF00FDFA
      F400E3AD5900E3AD5900F4D4A300B4834C0000000000BA875000FFE09F00E3BB
      7A00B17E4900F3D3A100E3AD5900E3AD5900E3AD5900E3AD5900E3AD5900FFFF
      FF00FFFFFF00E3AD5900F4D4A300B4834C0000000000BA854500C89C6000B77F
      3A00FFEFB4001D31C500283EF0001B2FC100FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00EDC27D00F9E1BB00B57F3D0000000000888E9700C3CAD400545E6D00EBC4
      7F00B17E4900F4D9AD001C30C4003046F3001B30C400E3B15E00E3B15E00E3B1
      5E00E3B15E00E3B15E00F5DAAE00B4834C00888E9700C3CAD400545E6D00EBC4
      7F00B17E4900F4D9AD00E3B15E00E9C17E00FFFFFF00FFFFFF00FFFFFF00FDFA
      F400E3B15E00E3B15E00F5DAAE00B4834C00888E9700C3CAD400545E6D00EBC4
      7F00B17E4900F4D9AD00E3B15E00F2DBB400FFFFFF00F0D5A900E3B15E00FFFF
      FF00FFFFFF00E3B15E00F5DAAE00B4834C0000000000BA854500C89B6000B77F
      3A00FFF1B8001C30C4003046F3001B30C400FFCD7500EFC07900EBBE7A00ECBF
      7C00EDC07E00FBE4BF00B57F3D000000000000000000BC895100A47C3600ECC5
      8100B07E4900F5DEB6001B30C400374DF4001B31C700E4B26100E4B26100E4B2
      6100E4B26100E4B26100F6DFB800B4824C0000000000BC895100A47C3600ECC5
      8100B07E4900F5DEB600E4B26100E4B26100E4B26100FAF0DF00FFFFFF00FDFA
      F400E4B26100E4B26100F6DFB800B4824C0000000000BC895100A47C3600ECC5
      8100B07E4900F5DEB600E4B26100E9C18100FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FDFAF400E4B26100F6DFB800B4824C0000000000BA854500C89B6000B77F
      3900FFF4BD001B30C400374DF4001B31C700FFCF7900EFC47F00ECC18000ECC1
      8000ECC07E00FBE6C500B57F3C000000000000000000BA875000F9D18B00EBC4
      7F00B07D4800F8E3C0001B2FC4003E55F7001B30C700E5B56500E5B56500E5B5
      6500E5B56500E5B56500F8E5C200B4824C0000000000BA875000F9D18B00EBC4
      7F00B07D4800F8E3C000E5B56500E5B56500E5B56500E5B56500FAF0E000F8EB
      D600E5B56500E5B56500F8E5C200B4824C0000000000BA875000F9D18B00EBC4
      7F00B07D4800F8E3C000E5B56500E5B56500EECE9800FCF5EA00FDFAF500F8EB
      D600E8BF7A00E5B56500F8E5C200B4824C0000000000BA854500C79B5F00B77F
      3900FFF5C1001B2FC4003E55F7001B30C700FFCE7600EFC37D00ECC17E00ECC0
      7D00ECBF7A00FCE8C900B57F3C0000000000888D9700C1C8D200525A6700EBC3
      7B00B07D4600F9EACB001A2FC400455CF9001A2FC700E4B76800E4B86800E4B8
      6800E4B96B00E6BB6F00FAECCD00B4834C00888D9700C1C8D200525A6700EBC3
      7B00B07D4600F9EACB00E6BB6F00E4B96B00E4B86800E4B76800E4B86800E4B8
      6800E4B96B00E6BB6F00FAECCD00B4834C00888D9700C1C8D200525A6700EBC3
      7B00B07D4600F9EACB00E6BB6F00E4B96B00E4B86800E4B76800E4B86800E4B8
      6800E4B96B00E6BB6F00FAECCD00B4834C0000000000B9844400C6995D00B77E
      3700FFF7C7001A2FC400455CF9001A2FC700FFCA7200EFBF7700ECBD7800ECBD
      7700ECBC7500FDEBCF00B57F3C000000000000000000BA864E00FFF2D400FEF1
      D400B27F4900FEF1D7001930C9004C64FF00192FCA00FBEDD200FBEDD200FBED
      D200FBEDD200FCEED300FFF2D800B5844F0000000000BA864E00FFF2D400FEF1
      D400B27F4900FEF1D700FCEED300FBEDD200FBEDD200FBEDD200FBEDD200FBED
      D200FBEDD200FCEED300FFF2D800B5844F0000000000BA864E00FFF2D400FEF1
      D400B27F4900FEF1D700FCEED300FBEDD200FBEDD200FBEDD200FBEDD200FBED
      D200FBEDD200FCEED300FFF2D800B5844F0000000000B9844200EEDFCB00B87F
      3900FFFBCE001930C9004C64FF00192FCA00FFF8CB00FEEDD000FCECD000FCEC
      D000FCECD000FFF0D500B6813E000000000000000000C49C7100B7875200B686
      5200B7875200B5844E00605793002338CB0060579200B4824B00B4824B00B482
      4B00B4824B00B4824C00B5844F00BC80600000000000C49C7100B7875200B686
      5200B7875200B5844E00B4824C00B4824B00B4824B00B4824B00B4824B00B482
      4B00B4824B00B4824C00B5844F00BC80600000000000C49C7100B7875200B686
      5200B7875200B5844E00B4824C00B4824B00B4824B00B4824B00B4824B00B482
      4B00B4824B00B4824C00B5844F00BC80600000000000BE8D5100B9844200BA84
      4100C3883700605793002338CB0060579200C2863400B77F3B00B57E3C00B57E
      3C00B57F3C00B6813E00BD8C5000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000676363006B676700706E
      6C00000000000000000000000000676363006A676500706E6C00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000706E6C006A6765006763630000000000000000000000
      0000706E6C006B6767006763630000000000B1B1B100A2A2A200A09FA000A09F
      A000A1A0A000A09FA0009F9F9F009F9FA0009FA0A100A0A0A200A0A0A200A0A0
      A200A0A0A200A0A0A100A2A2A200B1B1B1000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000004497D1004B9AD200615E5D0085848200BDBCBA00C3C3
      C10078757300000000005F5B5B0085848200BDBCBA00C3C2C000777472000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000077747200C3C2C000BDBCBA00858482005F5B5B00000000007875
      7300C3C3C100BDBCBA0085848200615E5D00A2A2A200FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00A2A2A2000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000004194D00089EFFF004397D1005F5C5B0081807E00B7B6B400BEBD
      BB00757270006E6C6A005C59580080807E00B7B6B400BEBDBB00757371000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000075737100BEBDBB00B7B6B40080807E005C5958006E6C6A007572
      7000BEBDBB00B7B6B40081807E005F5C5B00A0A0A000FFFFFF00FFFFFF00FFFF
      FF0000792C00FFFFFF00FFFFFF00FFFFFF00D2944F00CA7D2800D8A36700D9A3
      6800C97C2600D2914900FFFFFF00A0A0A1000000000000000000000000000000
      0000000000000000000000000000000000007DB3D5003896D6003592D5003793
      D4003B93D20087EEFF0056ADDE00000000005F5C5B00C3C2C100E1E0DF00E5E5
      E40073716E00BBB9B80059565500C1C1C000E1E0DF00E6E5E400757371000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000075737100E6E5E400E1E0DF00C1C1C00059565500BBB9B8007371
      6E00E5E5E400E1E0DF00C3C2C1005F5C5B00A1A0A000FFFFFF0049AE8100007D
      33000081380000782B00FFFFFF00FFFFFF00C97C2700CB833200D69D6000CC84
      3500CA812F00F5EDE500FFFFFF009FA0A0004D9BD2004094D0003E92CF003F92
      CE003F92CE003F92CE003F92CF0045A3DE0075B7D400FDDDA900FFEBB700FFEE
      C2006AA9CF003B92D1000000000000000000615E5D0064605F00656261006A68
      660000000000BAB8B70000000000605C5C0063615E006C6A6800797775000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000797775006C6A680063615E00605C5C0000000000BAB8B7000000
      00006A6866006562610064605F00615E5D00A2A0A100FFFFFF00007A2D00FFFF
      FF00007A2E00FFFFFF00FEFBFE00FAFFFF00CF8C4200D49C5C00FFFFFF00CC84
      3500CB802E00FBFFFF00FFFFFF009F9F9F004094D000ABFAFF0094F2FF0094F2
      FF0094F2FF0095F2FF0095F4FF004AB5ED00F6D09900FFEDD000FFEAC500FFF4
      CC00FFEEC1003692D300000000000000000000000000615E5D009A989700CBC9
      C60076727100BBBAB9005C5958009A989700CCCAC70078757400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000078757400CCCAC7009A9897005C595800BBBAB9007672
      7100CBC9C6009A989700615E5D0000000000A2A0A100FFFFFF0000762600FFFF
      FF00FFFCFF00FCF9FB00F7F7F800F7FCFF00F1ECE600D1914A00DEB68B00CD85
      3600CB802E00F8FFFF00FFFFFF009F9F9F003D92CF00AEF4FF0086E7FF0087E7
      FE0087E7FE0088E7FE0089EAFF004BBCF200FDCD9000FFF7E900FAEED500FFEA
      C500FFEBB600409FDC0000000000000000000000000000000000686464006D6B
      6900000000006F6D6B0000000000666362006E6C6A0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000006E6C6A0066636200000000006F6D6B000000
      00006D6B6900686464000000000000000000A0A0A000FFFFFF00FEF7FB00FAF9
      FE00F8FAFF00F6FAFF00F5F8FD00F5FBFF00CC843400D1934D00E0BE9800CD85
      3600CB802D00F6FCFF00FFFFFF009F9F9F003C92CE00B5F3FF007CE1FD007EE1
      FC007FE1FC0080E1FC0081E3FE0053C4F900F2C88D00FEEBD200FFF7E900FFED
      D000FCDCAA003A99DA0000000000000000000000000000000000625F5D00B9B9
      B7007977750000000000615F5D00BAB9B7007977750000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000079777500BAB9B700615F5D00000000007977
      7500B9B9B700625F5D0000000000000000009F9F9F00FFFFFF00F2F5F800DBAF
      8000CC823100CA7C2600D9AB7800F4FDFF00CA7C2700D1914D00F5FFFF00CC83
      3300CA7E2A00F2F8FE00FFFFFF009F9F9F003C92CF00BFF4FF0071DDFC0073DC
      FB0075DCFB0078DDFB007ADEFC0068D4FC0088C7D500F2C88D00FDCD9000F6D0
      9A007DB6CC00429FDA0000000000000000000000000000000000646260006E6C
      6A007A7876000000000062605E006D6B69007A78760000000000000000004081
      3500008C4A00000000000000000000000000000000000000000000000000008C
      4A004081350000000000000000007A7876006D6B690062605E00000000007A78
      76006E6C6A006462600000000000000000009F9F9F00FFFFFF00EFF3F800C979
      2100F1F9FF00CE8A3F00CB7E2A00F1FAFF00E1C9AF00CD843400CA7D2800CB7E
      2900D8A97500EFF1F500FFFFFF009F9F9F003D93D000DFFFFF00DAF9FF00DBF8
      FF00DEF9FF0072DBFC0074DAFB0073DAFC0063D2FD0055C8FA004EBFF50049B8
      EE0079CEF5003E94D10000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000085
      3D004ED4A8000088460000000000000000000000000000000000008846004ED4
      A80000853D000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000009F9F9F00FFFFFF00ECF2F700CA7B
      2500EDF7FF00CF8A3F00CB7F2A00EDF4FB00ECF0F400EDF2F700EAEBEB00EAEB
      EA00ECF0F400EAECEC00FFFFFF009F9F9F004095D100368ECD00348BCB00358A
      CA00368ACA005ABCEA006DD8FB0069D5FA0067D5FA0067D5FB0066D5FC0065D6
      FC00BCF2FF003D93D00000000000000000000000000000000000000000000000
      00000000000000000000000000000000000034A27C00008134000081380000B8
      7B0011DCA90062D3AE000087440000000000000000000087440062D3AE0011DC
      A90000B87B00008138000081340034A27C000000000000000000000000000000
      0000000000000000000000000000000000009F9F9F00FFFFFF00EAEFF500CB7D
      2700CF8E4700CB7E2900D5A06600EAEDF100E9E9E900E8E8E800E9E9E900E9E9
      E900E8E8E800E7E6E500FFFFFF009F9F9F003E94D000C5F7FF0074DEFE0076DE
      FD0077DFFE0050A9DC0054B8E800D9F7FF00D5F6FF00D5F6FF00D5F6FF00D5F7
      FF00DAFBFF003D94D00000000000000000000000000000000000000000000000
      000000000000000000000000000000000000008233005AE8C80000CF9C0000CD
      9B0000CC9A0012D3A70072D7B900008A4800008A480072D7B90012D3A70000CC
      9A0000CD9B0000CF9C005AE8C800008233000000000000000000000000000000
      0000000000000000000000000000000000009FA0A000FFFFFF00E6EEF500CA7C
      2400E8F3FD00E7EEF400E6EAEE00E5E7E700E5E5E400E4E5E400E4E5E400E4E5
      E400E4E4E300E3E3E200FFFFFF009F9F9F003C92CF00CBF6FF006AD6FA006DD6
      FA006CD7FA006CD9FC0047A8DD00318ACB002F8ACB002F8ACB002F8ACB00308B
      CB00358FCD004095D10000000000000000000000000000000000000000000000
      000000000000000000000000000000000000008234006DE5D0005BDEC50060DD
      C40000C4990000C59B0083E5D200008A4700008A470083E5D20000C59B0000C4
      990060DDC4005BDEC5006DE5D000008234000000000000000000000000000000
      000000000000000000000000000000000000A0A0A000FFFFFF00D0995B00C978
      1E00E2E2E000E2E3E400E1E1E100E1E0DF00E1E0DF00E1E0DF00E1E0DF00E1E0
      DF00E1E0DF00E1DFDE00FFFFFF00A0A0A0003B92CF00D5F7FF0060D1F90061D0
      F800B5EBFD00DAF8FF00DCFBFF00DDFDFF00DDFDFF00DDFDFF00DDFDFF00DDFE
      FF00E3FFFF004096D10000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000991560002995A0007985B000DBB
      950000BE9B0095E5D6001B975C0000000000000000001B975C0095E5D60000BE
      9B000DBB950007985B0002995A00099156000000000000000000000000000000
      000000000000000000000000000000000000A2A2A200FFFFFF00FFFFFF00FCEB
      D800FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00A2A2A2003D94D000DCFCFF00D8F7FF00D8F7
      FF00DBFAFF00358ECD003A92CF003B92CF003B93CF003B93CF003B93CF003B93
      D0003E95D0004F9ED50000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000087
      40009EE7E0001E995E00000000000000000000000000000000001E995E009EE7
      E000008740000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000ABACAC00A2A2A200A0A1A200A0A2
      A300A0A1A2009FA0A0009F9F9F009F9F9F009F9F9F009F9F9F009F9F9F009F9F
      9F009F9F9F00A0A0A000A2A2A200ABABAB004F9ED5003D94D0003A92CF003A92
      CF003D94D00053A1D50000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000001083
      39001B9D64000000000000000000000000000000000000000000000000001B9D
      6400108339000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000BB8A4E00B783
      4300B7834400BD894E000000000000000000000000005E92620049854B004A84
      4A004A844A004B844B004B854D00548C5800000000000000000000000000B783
      4400B7834400000000000000000000000000000000005E92620049854C004A85
      4C00548C5800000000000000000000000000BCBCBC00B2B2B200B0B0B000B1B0
      B000B1B0B100B1B0B000B0B0B000B0B0B100B0B1B200B0B1B200B0B1B200B0B1
      B200B0B1B200B0B1B200B2B2B200BCBCBC000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000004780
      AB00487FAA004881AC0000000000000000000000000000000000B7824300FBCE
      8800F9CA8000B983430000000000000000000000000048844B009EE8C90050C8
      920052C8930053C8940055CC99004A854C000000000000000000B5814100F4C4
      7A00F4C47A00B581410000000000000000000000000047844B009EE9CA0053CC
      98004A854C00000000000000000000000000B2B2B200FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00B2B2B2000000000000000000000000000000
      00000000000000000000000000000000000000000000000000003E81B300739D
      BF001FADFF0092CEEA004491C600000000000000000000000000B6814100F4CB
      8A00F1C07500B882420000000000000000000000000047844A00BBEADD00B8E6
      D800B9E6D800BAE7D900BDEBDE0048854B0000000000B5814100F2C17600EEBC
      7200EEBD7300F2C17600B8814100000000000000000045844A00BCEBDE00BDEB
      DF0048854B00000000000000000000000000B1B0B000FFFFFF00FFFFFF00FFFF
      FF0000792B0082C7A400FFFFFF00FFFFFF00D2944E00C97D2800D8A36700D8A3
      6700C97B2600D1914900FFFFFF00B0B1B1000000000000000000000000000000
      00007F7D7C007B7A78007B7978007B79780085817E005B7D9700A29A9200AFA3
      9B00A0C2D800B0ECFF003F90C600000000000000000000000000B6814100F1CA
      9000EBB86D00B882420000000000000000000000000083AE870047844A004582
      4700458247004582470047844A0074A37700B8844400F7CE8F00F2C98900EDC2
      8200EBB96F00F2C98A00F9CE8F00C28443000000000083AF890047844A004784
      4A0077A57A00000000000000000000000000B2B1B100FFFFFF0049AE8100007D
      33000081380000782B004BA97900FFFFFF00C97C2700CB833200D69D6000CC84
      3500CA812F00F5EDE500FFFFFF00B0B0B1000000000000000000888785009C9D
      9D00D1D3D500E3E5EA00E2E4E900E3E4E900D1D1D3009C9A9A0083807D00C6C2
      BD00F4EBE400BFDEEA003F92CA00000000000000000000000000B6814000EFCD
      9800E6B26600B882430000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CAA16F00B7824200B37D3D00F0C8
      8E00E9B86C00B37E3F00B8824200CFA170000000000000000000000000000000
      000000000000000000000000000000000000B3B1B200FFFFFF00007A2D00FFFF
      FF00007A2E0082C7A400FEFBFE00FAFFFF00CF8C4200D49C5C00FFFFFF00CC84
      3500CB802E00FBFFFF00FFFFFF00B0B0B0000000000089888700B4B3B600E6E4
      DF00E9CD9A00F1CA7E00F5D38800F9DA8D00F2E1AD00E6E5E000B0AEB000908B
      8A00EDE3DB00368FCA0000000000000000000000000000000000B6814000EECF
      A100E0AC5E00B9834400000000000000000000000000749E770049854B004A84
      4A004B854D00759E780000000000000000000000000000000000B6804000F0CB
      9600E7B46900B6824200000000000000000000000000729E770048854B004A84
      4A004B854D00749E77000000000000000000B2B1B200FFFFFF0000772700FFFF
      FF00FFFCFF00FCF9FA00F7F7F800F7FCFF00F2ECE700D1914A00DEB68B00CD85
      3600CB802E00F8FFFF00FFFFFF00B0B0B00000000000A2A1A200EBE6E200E9BB
      7500ECC47C00F1D08900F5DA9400FAE39C00FDE89E00FBE39B00EBE8E300A09C
      9C005B87A5000000000000000000000000000000000000000000B6813F00EFD3
      AA00DAA55700B983440000000000000000000000000047844B009EE8C90051C9
      930055CC98004A854C0000000000000000000000000000000000B6814000EFCE
      9D00E4B16400B882430000000000000000000000000046854B009EE8C90051C9
      930055CC98004A854C000000000000000000B1B1B100FFFFFF00FFFBFF00FBFA
      FF00F7F8FC00F5F8FD00F5FAFF00F7FFFF00CD853700D1934E00E0BE9800CD85
      3600CB802D00F5FBFF00FFFFFF00B0B0B00087858400DCDFE100E6C28F00EBC4
      8A00EED09700F1D28E00F5DD9800FBEAA200FFF1A900FCE89D00F5E2AE00DBDC
      DE008B8684000000000000000000000000000000000000000000B6813F00F0D9
      B400D69F5000B884440000000000000000000000000045844A00BBEADD00B9E7
      D900BDEBDE0048854B0000000000000000000000000000000000B6813F00F0D1
      A400E0AC5E00B883430000000000000000000000000047844A00BBEADD00B9E7
      D900BDEBDE0048854B000000000000000000B0B1B100FFFFFF00D3955200CA79
      2100F4FFFF00D59C6000CB7D2800D59E6100CB802D00D1924E00F5FFFF00CC83
      3300CA7E2A00F2F8FE00FFFFFF00B0B0B00085848200F4F8FC00E1A95D00F3DB
      B700F1D9AC00F2D9A000F5DC9600F8E59E00FBEAA200F9E39C00F7D98B00F3F4
      FA00858382000000000000000000000000000000000000000000B7813F00EFDB
      BD00D09A4900B884450000000000000000000000000082AE880046844A004582
      480047844A0057905B0000000000000000000000000000000000B6813F00EFD4
      AD00DDA85A00B983440000000000000000000000000083AE870047844A004582
      480047844A0059915D000000000000000000B0B0B100FFFFFF00EAE6E100CF85
      3000D0883600D08B3B00D0883600EDECEC00E2CBB200CD843500CA7D2800CB7E
      2900D8A97500EEF1F400FFFFFF00B0B0B00088858400F7FCFF00DEA45800F6E8
      D100F3DFBB00F3DCAD00F4DCA300F5DC9700F5DD9800F4DA9300F3D18600F5F9
      FF0088858400000000000000000000000000BC8A4E00B9844300B7814000DAB7
      8700C68F4500B8834400BA844300C38A4E000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000B6813F00F0D8
      B500D9A35400B983440000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B0B0B000FFFFFF00EAEFF400DFB3
      7B00EAE6DE00DD9D4D00DFB07300ECF3F900ECF0F400EDF2F700EAEBEB00EAEB
      EA00ECF0F40000772700FFFFFF00B0B0B0008A888600FDFFFF00DC9E5300F6E7
      D400F6E6CD00F4DFBA00F3DCAD00F2D99F00F1D28D00F0CF8900EEC87B00FBFD
      FF008A878600000000000000000000000000B9844400E8D1AC00C68F3E00C68F
      4000C6904100C68F3E00ECD5B200C384420000000000739E790049854C004A85
      4C00759E78000000000000000000000000000000000000000000B6803E00F1DC
      BC00D59F4F00B9844400000000000000000000000000749E770049854B004A84
      4A004A844A004B844B004B854D00749D7600B0B0B000FFFFFF00E8E9EB00E6D9
      C900DB9E4F00DA9A4700E5D4C000E9EBED00E8E8E800E8E8E80082C7A400007A
      2E00E8E8E800007A2D00FFFFFF00B0B0B000908D8C00EAEDF100E5B98800ECCC
      A300F9F1E500F6E6CC00F3DFBB00F1D9AC00EFD09700EBC37B00F0D3A100E9EB
      F0008F8D8B0000000000000000000000000000000000B8824000E8D0AD00C28B
      3800C28B3800E8D0AD00B9824000000000000000000046854B009EE9CA0053CC
      98004A854C000000000000000000000000000000000000000000B7813E00F0DB
      BB00D0994800BA83430000000000000000000000000048844B009EE8C90050C8
      920052C8930053C8940055CC99004A854C00B0B0B000FFFFFF00E3E5E500E5EB
      F000D4995400D3934800E6ECF200E5E6E700E4E5E4004BA9790000782B000081
      3800007D330049AE8100FFFFFF00B0B0B00000000000B3B2B200FEFAF500DBA0
      5800ECCBA200F9ECDC00F6E7D000F2DDBB00ECC99500E7B97200FFFDF900B2B1
      B200000000000000000000000000000000000000000000000000B7814000E8D1
      B000E8D1B000B881400000000000000000000000000046844A00BCEBDE00BDEB
      DF0048854B000000000000000000000000000000000000000000B8824000EFDB
      BB00EAD0A900BA83420000000000000000000000000047844A00BBEADD00B8E6
      D800B9E6D800BAE7D900BDEBDE0048854B00B0B0B000FFFFFF00E0DFDF00E1E3
      E500D8BD9D00D5AE8300E2E4E600E1E0E000E1E0DF00E1E0DF0082C7A4000079
      2B00E1DFDE00E0DFDE00FFFFFF00B0B0B000000000009D9B9A00CDCDCF00FFFD
      FA00E7BC8A00DA9C5100DDA25600DEA65A00ECC89600FFFFFC00CCCCCE009D9A
      9A0000000000000000000000000000000000000000000000000000000000B883
      4200B88342000000000000000000000000000000000082AD860047844A004784
      4A00568F5A000000000000000000000000000000000000000000CFAB7E00B882
      4100B8834100D1AB7F0000000000000000000000000082AD860047844A004582
      4700458247004582470047844A00568F5A00B2B2B200FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00B2B2B20000000000000000009F9D9B00B8B8
      B900F5F8FC00FFFFFF00FFFFFF00FFFFFF00F5F7FC00B8B7B9009F9C9B000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BABABA00B2B2B200B0B0B000B0B0
      B000B0B0B100B0B0B100B0B0B000B0B0B000B0B0B000B0B0B000B0B0B000B0B0
      B000B0B0B000B0B0B000B2B2B200BABABA000000000000000000000000000000
      0000999695009593910095929100959291009996950000000000000000000000
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
      9F009F9F9F009F9F9F00A2A2A200B1B1B100B1B1B100A2A2A200A0A0A000A1A1
      A100A1A1A100A1A1A100A1A1A100A1A1A100A1A1A100A0A0A0009F9F9F009F9F
      9F009F9F9F009F9F9F00A2A2A200B1B1B100749E770049854B004A844A004A84
      4A004B844B004B854D00749D760000000000000000005E92620049854C004A85
      4C00548C5800000000000000000000000000A2A2A200FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00A2A2A200A2A2A200FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00A2A2A200A2A2A200FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00A2A2A20048844B009EE8C90050C8920052C8
      930053C8940055CC99004A854C00000000000000000047844B009EE9CA0053CC
      98004A854C000000000000000000000000009F9F9F00FFFFFF00FFFFFF004442
      40005D5A58006F6D6A0073706E00605E5B0048464500FFFFFF00FFFFFF00FEFE
      FF00FEFEFE00FEFEFE00FFFFFF009F9F9F009F9F9F00FFFFFF00FFFFFF004442
      40005D5A58006F6D6A0073706E00605E5B0048464500FFFFFF00FFFFFF00FEFE
      FF00FEFEFE00FEFEFE00FFFFFF009F9F9F009F9F9F00FFFFFF00FFFFFF004442
      40005D5A58006F6D6A0073706E00605E5B0048464500FFFFFF00FFFFFF00FEFE
      FF00FEFEFE00FEFEFE00FFFFFF009F9F9F0047844A00BBEADD00B8E6D800B9E6
      D800BAE7D900BDEBDE0048854B00000000000000000045844A00BCEBDE00BDEB
      DF0048854B000000000000000000000000009F9F9F00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF009F9F9F009F9F9F00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF009F9F9F009F9F9F00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF009F9F9F0082AD860047844A00458247004582
      47004582470047844A00568F5A00000000000000000083AF890047844A004784
      4A0077A57A000000000000000000000000009F9F9F00FFFFFF00FEFEFE00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00767471006A6766005F5D5C005552
      500043414000FEFEFE00FFFFFF009F9F9F009F9F9F00FFFFFF00FEFEFE00D487
      2F00FFFFFF00FFFFFF00FFFFFF00FFFFFF00767471006A6766005F5D5C005552
      500043414000FEFEFE00FFFFFF009F9F9F009F9F9F00FFFFFF00FEFEFE00FFFF
      FF00FFFFFF00FFFFFF00D4872F00FFFFFF00767471006A6766005F5D5C005552
      500043414000FEFEFE00FFFFFF009F9F9F000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000009F9F9F00FFFFFF00F8F8F800FCFC
      FB00FCFCFB00FCFCFB00FCFCFB00FCFCFB00FCFCFB00FCFCFB00FCFCFB00FCFC
      FB00FCFCFB00FCFCFB00FFFFFF009F9F9F009F9F9F00FFFFFF00F8F8F800D487
      2F00D1904700FCFCFB00FCFCFB00FCFCFB00FCFCFB00FCFCFB00FCFCFB00FCFC
      FB00FCFCFB00FCFCFB00FFFFFF009F9F9F009F9F9F00FFFFFF00F8F8F800FCFC
      FB00FCFCFB00D1904700D4872F00FCFCFB00FCFCFB00FCFCFB00FCFCFB00FCFC
      FB00FCFCFB00FCFCFB00FFFFFF009F9F9F000000000000000000729E77004885
      4B004A844A004B854D00749E77000000000000000000729E770048854B004A84
      4A004B854D00749E770000000000000000009F9F9F00FFFFFF00F3F3F300FCFB
      FA00FCFBFA00FCFBFA00FCFBFA00FCFBFA00504E4C006B696800807E7B00706E
      6D0054524F00FCFBFA00FFFFFF009F9F9F009F9F9F00FFFFFF00F3F3F300D487
      2F00D2862E00D48D3A00FCFBFA00FCFBFA00504E4C006B696800807E7B00706E
      6D0054524F00FCFBFA00FFFFFF009F9F9F009F9F9F00FFFFFF00F3F3F300FCFB
      FA00D48D3A00D2862E00D4872F00FCFBFA00504E4C006B696800807E7B00706E
      6D0054524F00FCFBFA00FFFFFF009F9F9F00000000000000000046854B009EE8
      C90051C9930055CC98004A854C00000000000000000046854B009EE8C90051C9
      930055CC98004A854C0000000000000000009F9F9F00FFFFFF00EFF2F400F8F8
      F700F8F8F700F8F8F700F8F8F700F8F8F700F8F8F700F8F8F700F8F8F700F8F8
      F700F8F8F700F8F8F700FFFFFF009F9F9F009F9F9F00FFFFFF00EFF2F400D487
      2F00DE943B00DE933A00DF994500F8F8F700F8F8F700F8F8F700F8F8F700F8F8
      F700F8F8F700F8F8F700FFFFFF009F9F9F009F9F9F00FFFFFF00EFF2F400DF99
      4500DE933A00DE943B00D4872F00F8F8F700F8F8F700F8F8F700F8F8F700F8F8
      F700F8F8F700F8F8F700FFFFFF009F9F9F00000000000000000047844A00BBEA
      DD00B9E7D900BDEBDE0048854B00000000000000000047844A00BBEADD00B9E7
      D900BDEBDE0048854B0000000000000000009F9F9F00FFFFFF00EDF0F300F4F2
      F100F4F2F100F4F2F100F4F2F100F4F2F100504E4C006B696800807E7B00706E
      6D0054524F00F4F2F100FFFFFF009F9F9F009F9F9F00FFFFFF00EDF0F300D487
      2F00D4872F00D7954900F4F2F100F4F2F100504E4C006B696800807E7B00706E
      6D0054524F00F4F2F100FFFFFF009F9F9F009F9F9F00FFFFFF00EDF0F300F4F2
      F100D7954900D4872F00D4872F00F4F2F100504E4C006B696800807E7B00706E
      6D0054524F00F4F2F100FFFFFF009F9F9F00000000000000000083AE87004784
      4A004582480047844A0059915D00000000000000000083AE870047844A004582
      480047844A0059915D0000000000000000009F9F9F00FFFFFF00EAECEE00F2F3
      F200F2F3F200F2F3F200F2F3F200F2F3F200F2F3F200F2F3F200F2F3F200F2F3
      F200F2F3F200F2F3F200FFFFFF009F9F9F009F9F9F00FFFFFF00EAECEE00D487
      2F00D18F4700F2F3F200F2F3F200F2F3F200F2F3F200F2F3F200F2F3F200F2F3
      F200F2F3F200F2F3F200FFFFFF009F9F9F009F9F9F00FFFFFF00EAECEE00F2F3
      F200F2F3F200D18F4700D4872F00F2F3F200F2F3F200F2F3F200F2F3F200F2F3
      F200F2F3F200F2F3F200FFFFFF009F9F9F000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000009F9F9F00FFFFFF00E8E8E800F0EF
      EE00F0EFEE00F0EFEE00F0EFEE00F0EFEE00514F4D006C6A6900817E7C00716F
      6E00F0EFEE00F0EFEE00FFFFFF009F9F9F009F9F9F00FFFFFF00E8E8E800D487
      2F00F0EFEE00F0EFEE00F0EFEE00F0EFEE00514F4D006C6A6900817E7C00716F
      6E00F0EFEE00F0EFEE00FFFFFF009F9F9F009F9F9F00FFFFFF00E8E8E800F0EF
      EE00F0EFEE00F0EFEE00D4872F00F0EFEE00514F4D006C6A6900817E7C00716F
      6E00F0EFEE00F0EFEE00FFFFFF009F9F9F000000000000000000000000005E92
      620049854C004A854C00548C58000000000000000000749E770049854B004A84
      4A004A844A004B844B004B854D00749D76009F9F9F00FFFFFF00E7E7E600E7E7
      E600E7E7E600E7E7E600E7E7E600E7E7E600E7E7E600E7E7E600E7E7E600E7E7
      E600E7E7E600EAEAE900FFFFFF009F9F9F009F9F9F00FFFFFF00E7E7E600E7E7
      E600E7E7E600E7E7E600E7E7E600E7E7E600E7E7E600E7E7E600E7E7E600E7E7
      E600E7E7E600EAEAE900FFFFFF009F9F9F009F9F9F00FFFFFF00E7E7E600E7E7
      E600E7E7E600E7E7E600E7E7E600E7E7E600E7E7E600E7E7E600E7E7E600E7E7
      E600E7E7E600EAEAE900FFFFFF009F9F9F000000000000000000000000004784
      4B009EE9CA0053CC98004A854C00000000000000000048844B009EE8C90050C8
      920052C8930053C8940055CC99004A854C00A0A0A000FFFFFF00E6E5E4004240
      3F0053514F005D5B5A006966640073706E00767472006B696800615F5E005755
      520046434200E7E6E400FFFFFF00A0A0A000A0A0A000FFFFFF00E6E5E4004240
      3F0053514F005D5B5A006966640073706E00767472006B696800615F5E005755
      520046434200E7E6E400FFFFFF00A0A0A000A0A0A000FFFFFF00E6E5E4004240
      3F0053514F005D5B5A006966640073706E00767472006B696800615F5E005755
      520046434200E7E6E400FFFFFF00A0A0A0000000000000000000000000004584
      4A00BCEBDE00BDEBDF0048854B00000000000000000047844A00BBEADD00B8E6
      D800B9E6D800BAE7D900BDEBDE0048854B00A2A2A200FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00A2A2A200A2A2A200FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00A2A2A200A2A2A200FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00A2A2A20000000000000000000000000083AF
      890047844A0047844A0077A57A00000000000000000082AD860047844A004582
      4700458247004582470047844A00568F5A00ABABAB00A2A2A200A0A0A000A1A1
      A100A1A1A100A1A1A100A1A1A100A1A1A100A1A1A100A1A1A100A1A1A100A1A1
      A100A1A1A100A0A0A000A2A2A200ABABAB00ABABAB00A2A2A200A0A0A000A1A1
      A100A1A1A100A1A1A100A1A1A100A1A1A100A1A1A100A1A1A100A1A1A100A1A1
      A100A1A1A100A0A0A000A2A2A200ABABAB00ABABAB00A2A2A200A0A0A000A1A1
      A100A1A1A100A1A1A100A1A1A100A1A1A100A1A1A100A1A1A100A1A1A100A1A1
      A100A1A1A100A0A0A000A2A2A200ABABAB000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000001C2D
      AD002131AD002233AD0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000001C2D
      AD002131AD002233AD0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000001C2D
      AD002131AD002233AD0000000000000000000000000000000000000000000000
      000000000000000000002F3EC2002F3EC2002F3EC2002F3EC200000000000000
      000000000000000000000000000000000000BCBCBC00B2B2B200B0B0B000AFAF
      B000AFAFB000AFAFB000AFAFB000AFAFB000AFAFB000AFAFB0001B31BF00365D
      FA003961FE003960FA00283EC100BCBCBC00BCBCBC00B2B2B200B0B0B000AFAF
      B000AFAFB000AFAFB000AFAFB000AFAFB000AFAFB000AFAFB0001B31BF00365D
      FA003961FE003960FA00283EC100BCBCBC00BCBCBC00B2B2B200B0B0B000AFAF
      B000AFAFB000AFAFB000AFAFB000AFAFB000AFAFB000AFAFB0001B31BF00365D
      FA003961FE003960FA00283EC100BCBCBC000000000000000000000000000000
      00002F3EC2004A5BE2006175FC00697DFF00697DFF006175FC004A5BE2002F3E
      C20000000000000000000000000000000000B2B2B200FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000317A5003D61FB003C60
      FB003A5EF9003D61FB004366FD001E30AD00B2B2B200FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000317A5003D61FB003C60
      FB003A5EF9003D61FB004366FD001E30AD00B2B2B200FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000317A5003D61FB003C60
      FB003A5EF9003D61FB004366FD001E30AD000000000000000000000000002F3E
      C200596DF6006175FC006175FC006175FC006175FC006175FC006175FC00596D
      F6002F3EC200000000000000000000000000B0B0B000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000417A400A7B9FF00FFFF
      FF00FFFFFF00FFFFFF00ACBDFF001B2DAC00B0B0B000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000417A400A7B9FF00FFFF
      FF00FFFFFF00FFFFFF00ACBDFF001B2DAC00B0B0B000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000417A400A7B9FF00FFFF
      FF00FFFFFF00FFFFFF00ACBDFF001B2DAC0000000000000000002F3EC200596D
      F6005A6EF9005A6EF9005A6EF9005A6EF9005A6EF9005A6EF9005A6EF9005A6E
      F900596DF6002F3EC2000000000000000000B1B1B100FFFFFF0042403E00A2A3
      A300A2A3A300A2A3A300A2A3A300A2A3A300A2A3A3000115A4005876FE005876
      FF005473FE005877FF005F7CFF001D2EAD00B1B1B100FFFFFF0042403E00A2A3
      A300A2A3A300A2A3A300A2A3A300A2A3A300A2A3A3000115A4005876FE005876
      FF005473FE005877FF005F7CFF001D2EAD00B1B1B100FFFFFF0042403E00A2A3
      A300A2A3A300A2A3A300A2A3A300A2A3A300A2A3A3000115A4005876FE005876
      FF005473FE005877FF005F7CFF001D2EAD0000000000000000004256DE00576D
      FB005267F7005267F7005267F7005267F7005267F7005267F7005267F7005267
      F700576DFB004256DE000000000000000000B1B1B100FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00263BC3006B84
      FF00748CFF00718AFF00384DC800B0B0B000B1B1B100FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00263BC3006B84
      FF00748CFF00718AFF00384DC800B0B0B000B1B1B100FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00263BC3006B84
      FF00748CFF00718AFF00384DC800B0B0B000000000002F3EC2004E64F4004C63
      F7003D55F4003D55F4003D55F4003D55F4003D55F4003D55F4003D55F4003D55
      F4004C63F7004E64F4002F3EC20000000000B1B1B100FFFFFF0043414000A2A3
      A300A2A3A300A2A3A300A2A3A300A2A3A300A2A3A300F4F7F900FFFFFF000518
      A6000F21AA00192BAD00FFFFFF00B1B1B100B1B1B100FFFFFF0043414000A2A3
      A300A2A3A300A2A3A300A2A3A300A2A3A300A2A3A300F4F7F900FFFFFF000518
      A6000F21AA00192BAD00FFFFFF00B1B1B100B1B1B100FFFFFF0043414000A2A3
      A300A2A3A300A2A3A300A2A3A300A2A3A300A2A3A300F4F7F900FFFFFF000518
      A6000F21AA00192BAD00FFFFFF00B1B1B100000000002F3EC2005369F8003E56
      F300FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF003E56F3005369F8002F3EC20000000000B1B1B100FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFE00FEFD
      FC00FDFCFB00FBFAF800FFFFFF00B0B0B000B1B1B100FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFE00FEFD
      FC00FDFCFB00FBFAF800FFFFFF00B0B0B000B1B1B100FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFE00FEFD
      FC00FDFCFB00FBFAF800FFFFFF00B0B0B000000000002F3EC2006378F7002F4B
      EE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF002F4BEE006378F7002F3EC20000000000B1B1B100FFFFFF0045434200A2A3
      A300A2A3A300A2A3A300A2A3A300A2A3A300A2A3A300A2A3A300F9F9F800F4F4
      F300F2F3F200F2F2F100FFFFFF00B0B0B000B1B1B100FFFFFF0045434200A2A3
      A300A2A3A300A2A3A300A2A3A300A2A3A300A2A3A300A2A3A300F9F9F800F4F4
      F300F2F3F200F2F2F100FFFFFF00B0B0B000B1B1B100FFFFFF0045434200A2A3
      A300A2A3A300A2A3A300A2A3A300A2A3A300A2A3A300A2A3A300F9F9F800F4F4
      F300F2F3F200F2F2F100FFFFFF00B0B0B000000000002F3EC2008696F8003852
      ED002A46EB002A46EB002A46EB002A46EB002A46EB002A46EB002A46EB002A46
      EB003852ED008696F8002F3EC20000000000B1B1B100FFFFFF00FDFCFB00FFFF
      FF00FFFFFF00FFFFFF00FFFFFE00FFFFFE00FFFFFF00FEFEFD00FAF9F800F8F7
      F600F7F6F500F5F4F300FFFFFF00B0B0B000B1B1B100FFFFFF00FDFCFB00FFFF
      FF00FFFFFF00FFFFFF00FFFFFE00FFFFFE00FFFFFF00FEFEFD00FAF9F800F8F7
      F600F7F6F500F5F4F300FFFFFF00B0B0B000B1B1B100FFFFFF00FDFCFB00FFFF
      FF00FFFFFF00FFFFFF00FFFFFE00FFFFFE00FFFFFF00FEFEFD00FAF9F800F8F7
      F600F7F6F500F5F4F300FFFFFF00B0B0B00000000000000000006F7CDD008494
      F5003650EA003650EA003650EA003650EA003650EA003650EA003650EA003650
      EA008494F5006F7CDD000000000000000000B1B1B100FFFFFF000317A5005473
      FE005473FE005473FE005473FE005473FE005473FE005473FE005473FE005473
      FE005473FE005473FE00FFFFFF00B1B1B100B1B1B100FFFFFF0044424100A2A3
      A300A2A3A300A2A3A300A2A3A300A2A3A300A2A3A300A2A3A3005473FE005473
      FE005473FE005473FE00FFFFFF00B1B1B100B1B1B100FFFFFF0044424100A2A3
      A300A2A3A300FFFFFF005473FE005473FE005473FE005473FE00FFFFFF00A2A3
      A300A2A3A300A2A3A300FFFFFF00B1B1B10000000000000000002F3EC2009AA7
      F0007F90F300304CE800304CE800304CE800304CE800304CE800304CE8007F90
      F3009AA7F0002F3EC2000000000000000000B1B1B100FFFFFF00F7F6F500FCFC
      FB00FCFBFB00FBFAF900FAF9F900FAFAF900FBFAF900F9F8F700F5F4F300F3F2
      F100F2F1F000EFEEED00FFFFFF00B0B0B000B1B1B100FFFFFF00F7F6F500FCFC
      FB00FCFBFB00FBFAF900FAF9F900FAFAF900FBFAF900F9F8F700F5F4F300F3F2
      F100F2F1F000EFEEED00FFFFFF00B0B0B000B1B1B100FFFFFF00F7F6F500FCFC
      FB00FCFBFB00FBFAF900FAF9F900FAFAF900FBFAF900F9F8F700F5F4F300F3F2
      F100F2F1F000EFEEED00FFFFFF00B0B0B0000000000000000000000000002F3E
      C20097A3EF009EACF7006075ED003E57E9003E57E9006075ED009EACF70097A3
      EF002F3EC200000000000000000000000000B1B1B100FFFFFF0044424100A2A3
      A300A2A3A300A2A3A300A2A3A300A2A3A300A2A3A300A2A3A300ECECEB00E7E7
      E600E6E6E500E5E5E400FFFFFF00B0B0B000B1B1B100FFFFFF0044424100A2A3
      A300A2A3A300A2A3A300A2A3A300A2A3A300A2A3A300A2A3A300ECECEB00E7E7
      E600E6E6E500E5E5E400FFFFFF00B0B0B000B1B1B100FFFFFF0044424100A2A3
      A300A2A3A300A2A3A300A2A3A300A2A3A300A2A3A300A2A3A300ECECEB00E7E7
      E600E6E6E500E5E5E400FFFFFF00B0B0B0000000000000000000000000000000
      00002F3EC2006F7CDD009EA9F200AFBBF800AFBBF8009EA9F2006F7CDD002F3E
      C20000000000000000000000000000000000B1B1B100FFFFFF00E8E7E600EBEA
      E900EAE9E800EAE9E800E9E9E700EAE9E800EBEAE900E9E8E600E4E3E200E1E0
      DF00E1DFDE00E0DFDE00FFFFFF00B0B0B000B1B1B100FFFFFF00E8E7E600EBEA
      E900EAE9E800EAE9E800E9E9E700EAE9E800EBEAE900E9E8E600E4E3E200E1E0
      DF00E1DFDE00E0DFDE00FFFFFF00B0B0B000B1B1B100FFFFFF00E8E7E600EBEA
      E900EAE9E800EAE9E800E9E9E700EAE9E800EBEAE900E9E8E600E4E3E200E1E0
      DF00E1DFDE00E0DFDE00FFFFFF00B0B0B0000000000000000000000000000000
      000000000000000000002F3EC2002F3EC2002F3EC2002F3EC200000000000000
      000000000000000000000000000000000000B2B2B200FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00B2B2B200B2B2B200FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00B2B2B200B2B2B200FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00B2B2B2000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BABABA00B2B2B200B0B0B000B0B0
      B000B0B0B000B0B0B000B0B0B000B0B0B000B0B0B000B0B0B000B0B0B000B0B0
      B000B0B0B000B0B0B000B2B2B200BABABA00BABABA00B2B2B200B0B0B000B0B0
      B000B0B0B000B0B0B000B0B0B000B0B0B000B0B0B000B0B0B000B0B0B000B0B0
      B000B0B0B000B0B0B000B2B2B200BABABA00BABABA00B2B2B200B0B0B000B0B0
      B000B0B0B000B0B0B000B0B0B000B0B0B000B0B0B000B0B0B000B0B0B000B0B0
      B000B0B0B000B0B0B000B2B2B200BABABA000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000008B
      4800008B4900008C4C0000000000000000000000000000000000000000000000
      00000000000000000000C0BCB600B1B0AE00AEAEAB00ADADAB00ADADAB00ADAD
      AB00ADADAB00AEAEAB00AFAFAD00B5B5B30000000000000000007D7D7D000000
      0000848484000000000084848400000000007C7D7D00000000007C7D7D000000
      00007C7C7D000000000086868600000000000000000000000000000000000000
      00000000000000000000008C4B00008B4A00008B4A00008C4B00000000000000
      000000000000000000000000000000000000BCBCBC00B2B2B200B0B0B000AFAF
      B000AFAFB000AFAFB000AFAFB000AFAFB000AFAFB000AFAFB0000094520000BA
      840077E0C60000BB860000995C00BCBCBC006B87A500406893003F6893004068
      93003E679300335F8F00BBB7B000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00B0B0AD008A8A8A00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      00000090500001A1690000AA760000AB770000AB770000AA760001A169000090
      500000000000000000000000000000000000B2B2B200FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00007F360000BE880000BC
      8300FFFFFF0000BC830000C18D00008C4C003F6A9400568AB0004C82AB004D82
      AB004B81AB00417BA800B9B4AD00FFFFFF00FCFCFC00FBFBFC00FBFBFC00FBFB
      FC00FBFBFC00FCFCFC00FFFFFF00AEAEAB0000000000FFFFFF00E5E4E300E5E4
      E300E6E5E400E7E6E400E6E5E400E6E5E300E6E5E300E6E4E300E6E5E300E6E4
      E300E5E4E300E5E4E300FFFFFF008B8B8B000000000000000000000000000091
      520002AC770000C38C0000D6990018DEA80018DEA80000D6990000C38C0001AB
      760000925300000000000000000000000000B0B0B000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00007F370072E5CB00FFFF
      FF00FFFFFF00FFFFFF0077E7CE00008B49003F6A95006594BB004C83AE004E83
      AE004C82AE00427DAC00B8B3AC00FFFFFF00F7F6F600F7F6F600F7F6F600F7F6
      F600F7F6F600F7F6F600FFFFFF00ADADAB008A8A8A00FFFFFF00E1E0DF00E2E1
      E000E3E2E100E3E2E100E3E2E100E3E2E100E3E2E100E3E2E100E3E2E100E3E2
      E100E2E1E000E1E0DF00FFFFFF00000000000000000000000000009051000FB4
      830002D2990000D69B0000D19300FFFFFF00FFFFFF0000D1930000D69B0000D1
      980001AB7600009050000000000000000000B1B1B100FFFFFF0042403E00A2A3
      A300A2A3A300A2A3A300A2A3A300A2A3A300A2A3A300007E360000CA940000C8
      8F00FFFFFF0000C9900000CD9900008C4B003F6B950074A1C3004F86B1005187
      B2004F86B2004581B000B8B2AB00FFFFFF00F4F3F300F4F3F300F4F3F300F4F3
      F300F4F3F300F4F3F300FFFFFF00ADADAB0000000000FFFFFF00DEDCDB00E0DD
      DD00E0DEDD00BFBEBD007D7D7D007D7D7D007D7D7D00979797007D7D7D00E0DE
      DD00E0DDDD00DEDCDB00FFFFFF008A8A8A00000000000000000016AB780011C9
      970000D49A0000D2970000CD8E00FFFFFF00FFFFFF0000CD8E0000D2970000D5
      9B0000C18C0001A169000000000000000000B1B1B100FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00009B590000D1
      9A0074EED40000D49F0000A36700B0B0B0003F6B970082ABCC005088B500528A
      B6005189B6004784B500B8B2AB00FFFFFF00F0F0EF00F0F0EF00F0F0EF00F0F0
      EF00EFEFEE00EFEFEE00FFFFFF00ADADAB008A8A8A00FFFFFF00DAD9D700DBDB
      D800DCDBD9008A8A8900A3A3A200DCDBD900C9C8C7007D7D7D0083838300DCDB
      D900DBDBD800DAD9D700FFFFFF000000000000000000008A480038C49C0000D1
      980000CD920000CB8E0000C78700FFFFFF00FFFFFF0000C7870000CB8E0000CE
      930000D09A0000AB7600008C4B0000000000B1B1B100FFFFFF0043414000A2A3
      A300A2A3A300A2A3A300A2A3A300A2A3A300A2A3A300F4F7F900FFFFFF000080
      370000843E0000894700FFFFFF00B1B1B1003E6C970091B6D500528BBA00558C
      BB00548CBB004B88BB00B8B2AB00FFFFFF00ECECEB00EDEDEC00EDEDEC00ECEC
      EB00EBEBEA00EBEBEA00FFFFFF00ADADAB0000000000FFFFFF00D6D4D200D7D6
      D400D8D7D5008F8F8F008F8F8F00BAB9B800D8D7D500AEADAC0083838300D8D7
      D500D7D6D400D6D4D200FFFFFF008A8A8A00000000000089460051D2AF0012D4
      A300FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000CF970000AD7800008B4A0000000000B1B1B100FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFE00FEFD
      FC00FDFCFB00FBFAF800FFFFFF00B0B0B0003E6D97009FC1DD00538EBD005791
      BF005691BF004D8CBF00B7B1AA00FFFFFF00E9E8E800EAE8E900E9E8E800F3F2
      F200FFFFFF00FFFFFF00FFFFFF00AEAEAB008A8A8B00FFFFFF00D1D0CE00D3D2
      D000D4D3D100C8C8C6008E8E8E007D7D7D007D7D7D007D7D7D0083838300D4D3
      D100D3D2D000D1D0CE00FFFFFF0000000000000000000088450066DDBE0010D0
      A200FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000CD970000AD7800008B4A0000000000B1B1B100FFFFFF0045434200A2A3
      A300A2A3A300A2A3A300A2A3A300A2A3A300A2A3A300A2A3A300F9F9F800F4F4
      F300F2F3F200F2F2F100FFFFFF00B0B0B0003E6E9900ACCAE4005691C1005A93
      C3005993C300508FC300B7B1AA00FFFFFF00E5E4E300E6E5E400E5E4E300FFFF
      FF00CACAC900A4A4A200FFFFFF00AFAFAD0000000000FFFFFF00CECCCB00D0CE
      CD00D1CFCE00C0BFBE00AAA9A800D1CFCE00D1CFCE00A4A3A30083828200D1CF
      CE00D0CECD00CECCCB00FFFFFF008B8B8B00000000000088460076E0C50000CA
      980000C5900000C48E0000C18700FFFFFF00FFFFFF0000C1870000C48E0000C7
      930000CB990000AB7600008C4B0000000000B1B1B100FFFFFF00FDFCFB00FFFF
      FF00FFFFFF00FFFFFF00FFFFFE00FFFFFE00FFFFFF00FEFEFD00FAF9F800F8F7
      F600F7F6F500F5F4F300FFFFFF00B0B0B0003E6F9A00B9D5EA005794C6005B97
      C8005B98C8005294C900B7B1AA00FFFFFF00E0E0DF00E0E0DF00E0E0DF00FFFF
      FF00A4A4A200FFFFFF00E9E9E900CACAC8008B8B8B00FFFFFF00CAC7C600CCCA
      C900CDCBCA00A8A7A6007D7D7D00A8A7A600A8A7A600888787008D8D8C00CDCB
      CA00CCCAC900CAC7C600FFFFFF0000000000000000000000000059C9A40049DE
      BC0000C7940000C7940000C38E00FFFFFF00FFFFFF0000C38E0000C8960000CB
      9A0006C1900000A168000000000000000000B1B1B100FFFFFF00007F360000D1
      9A0000D19A0000D19A0000D19A0000D19A0000D19A0000D19A0000D19A0000D1
      9A0000D19A0000D19A00FFFFFF00B1B1B1003D709A00C6DEF0005997CB005E9A
      CD005E9BCE005798CF00BAB3AB00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00E9E9E900CBCBC9000000000000000000FFFFFF00C5C4C200C8C7
      C500C9C8C600C9C8C600A6A5A40087878700828282008C8C8C00BFBEBC00C9C8
      C600C8C7C500C5C4C200FFFFFF008B8B8B0000000000000000000A945800ADF8
      E90018D0A70000C4940000C29000FFFFFF00FFFFFF0000C3910000C7990005C8
      9B0018B78700009050000000000000000000B1B1B100FFFFFF00F7F6F500FCFC
      FB00FCFBFB00FBFAF900FAF9F900FAFAF900FBFAF900F9F8F700F5F4F300F3F2
      F100F2F1F000EFEEED00FFFFFF00B0B0B0003E729D00D4E7F8005997CB007F95
      A70099938E0099938E00B0AFAD00B5B3AE00B2B0AC00B3B0AA00B4B0AB00B1B0
      AC00B0AFAD00CACAC80000000000000000008B8B8B00FFFFFF00C1BFBD00C4C2
      C000C5C3C100C5C3C100C5C3C100C5C3C100C5C3C100C5C3C100C5C3C100C5C3
      C100C4C2C000C1BFBD00FFFFFF0000000000000000000000000000000000199C
      6300BCFFF7005DE4C90000C3970000BF900000C0910000C4980022CAA20031C2
      970003935500000000000000000000000000B1B1B100FFFFFF0044424100A2A3
      A300A2A3A300A2A3A300A2A3A300A2A3A300A2A3A300A2A3A300ECECEB00E7E7
      E600E6E6E500E5E5E400FFFFFF00B0B0B00042759F00ADD2F4005997CB00A7A1
      9B00D6CBC500D6CBC500D6CBC500A7A19B005997CB00A6D0F600336D9E000000
      00000000000000000000000000000000000000000000FFFFFF00B9B7B500BBB9
      B700BCBAB800BDBAB800BCBAB800BCBAB800BCBAB800BCBAB800BCBAB800BCBA
      B800BBB9B700B9B7B500FFFFFF008B8B8B000000000000000000000000000000
      00000E96590074D5B6009FF3E00092EFDA0079E5CA005DD6B5002EB586000391
      520000000000000000000000000000000000B1B1B100FFFFFF00E8E7E600EBEA
      E900EAE9E800EAE9E800E9E9E700EAE9E800EBEAE900E9E8E600E4E3E200E1E0
      DF00E1DFDE00E0DFDE00FFFFFF00B0B0B00080A3C0003E77A4003E77A4009993
      8E00E5DDD800E5DDD800E5DDD80099938E003E77A4003C76A4007DA2C0000000
      0000000000000000000000000000000000008B8B8B00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000874400008743000087440000894600000000000000
      000000000000000000000000000000000000B2B2B200FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00B2B2B2000000000000000000000000000000
      000099938E0099938E0099938E00000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007D7D7D000000
      0000848484000000000084848400000000007D7D7D00000000007D7D7D000000
      00007D7D7D000000000086868600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BABABA00B2B2B200B0B0B000B0B0
      B000B0B0B000B0B0B000B0B0B000B0B0B000B0B0B000B0B0B000B0B0B000B0B0
      B000B0B0B000B0B0B000B2B2B200BABABA00000000000000000000000000008C
      4B00329D6C000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000087450054D9
      B000008847000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000008948000088470000884700008847000088470000884700008847000088
      470000884700008A49000D915500000000000000000000000000000000000000
      0000B97B3D00B0773F00BFA99400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000B5B5B300B0B0AE00AEAEAC00ADADAB00ADADAB00ADAD
      AB00ADADAB00AEAEAB00AFAFAD00B5B5B300000000000087440065D7B30000D9
      A00000C384000085440000874600008847000088470000884700008847000089
      48000000000000000000000000000000000000000000000000000089470000B1
      740000D79C0000DCA10000DCA00000DCA00000DCA00000DCA00000DCA00000DC
      A00000DCA10000E1A700008A4900000000000000000000000000000000000000
      0000C1803C0000000000B2773F00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000B0B0AE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00B0B0AD00008A480074DBBD0000D09C0000CE
      9A0000D59C0000D89F0000D9A00000D9A00000D9A00000D9A00000D9A10000D7
      9C0000B1740000894700000000000000000000000000008A470000C5930000D0
      9F0029D8AF005BE3C5005BE4C6005CE5C7005CE5C8005CE5C8005CE5C8005CE5
      C8005CE6C90060EACE00008A4800000000000000000000000000000000000000
      0000C9843A0000000000B97B3D0000000000000000000000000000000000C49D
      7700B0773F00B7916D0000000000000000000000000000000000000000000000
      00000000000000000000B0B0AD00F6F6F500ECECEB00FBFAFA00FDFDFD00FCFC
      FC00FBFBFC00FCFCFC00FFFFFF00AEAEAB00008A480086E0C80000CB9B0000C9
      99005FE3C3005CE5C6005CE6C7005CE6C8005CE6C7005BE5C6005BE4C50029D8
      AF0000D09F0000C59300008A4700000000000000000000A8760000C5A1000DC8
      A60060D6BC0029AA780000864200008744000087440000874400008744000087
      440000874500008947004FB08300000000000000000000000000000000000000
      0000D5955100CCB7A000C07F3C00000000000000000000000000C0884E00D0A4
      7A0000000000B37A46000000000000000000B4B4B200AFAFAD00AEAEAB00ADAD
      AB00ADADAB00ADADAB00ACACAA00A9A9A700A8A8A600B8B7B600FBFAFA00F8F6
      F600F7F6F600F7F6F600FFFFFF00ADADAB0000000000008743009BE3D00000C6
      9E0000C28F00008441000087440000874400008744000086420029AA780060D6
      BC000DC8A60000C5A10000A8760000000000068C4C0000C19A0000C6A00040CA
      AA000E9256000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000D0873600C98235000000000000000000C99A6A00C48849000000
      0000C4A98E00BE8853000000000000000000B0B0AD00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00A8A8A500F9F8F800F5F4
      F400F4F3F300F4F3F300FFFFFF00ADADAB00000000000000000000874300A4E6
      D900008845000000000000000000000000000000000000000000000000000E92
      560040CAAA0000C6A00000C19A00068C4C000089470000CFA40000CDA100009D
      6100000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000B3906D00B9B9B900D1A06A00CC853800CC8F4E00CC94
      5A00BE7E3C00000000000000000000000000AEAEAB00FFFFFF00FCFCFC00FBFB
      FC00FBFBFC00FBFBFC00FBFBFC00FCFCFC00FFFFFF00A7A7A500F5F5F400F1F1
      F000EFEFEE00EFEFEE00FFFFFF00ADADAB00000000000000000000000000008B
      49003FA978000000000000000000000000000000000000000000000000000000
      0000009D610000CDA10000CFA400008947000089470000D6A30000D4A1000096
      5600000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000AB8968009E958E00E09B4D0000000000000000000000
      000000000000000000000000000000000000ADADAB00FFFFFF00F7F6F600F7F6
      F600F7F6F600F7F6F600F7F6F600F7F6F600FFFFFF00A7A7A500F1F1F100EDED
      EC00EBEBEA00EBEBEA00FFFFFF00ADADAB000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000096560000D4A10000D6A300008947000088470000DAA30000D8A00000A0
      6100000000000000000000000000000000000000000000000000000000003EA0
      7400008C4B000000000000000000000000000000000000000000000000000000
      000000000000B5B8BC00D37C1D00B98B5E000000000000000000000000000000
      000000000000000000000000000000000000ADADAB00FFFFFF00F4F3F300F4F3
      F300F4F3F300F4F3F300F4F3F300F4F3F300FFFFFF00A8A8A500EDECEC00F4F3
      F300FFFFFF00FFFFFF00FFFFFF00AEAEAB000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000A0610000D8A00000DAA30000884700078B4D0000D1970000D99F0000CB
      9000008D4B000000000000000000000000000000000000000000000000000089
      470054D9B0000088460000000000000000000000000000000000000000000000
      0000B7B6B600ECEDEF00BDB4A800CACCD0000000000000000000000000000000
      000000000000000000000000000000000000ADADAB00FFFFFF00F0F0EF00F0F0
      EF00F0F0EF00F0F0EF00EFEFEE00EFEFEE00FFFFFF00A8A8A500E9E8E700FFFF
      FF00CACAC900A4A4A200FFFFFF00AFAFAD000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000008D
      4B0000CB900000D99F0000D19700078B4D00000000002FBD8B0020DEAD0000D5
      9D0000C78F00009F6000008744000088460000884600008846000086430000BA
      7E0000D8A00065D7B3000087440000000000000000000000000000000000B0AE
      AB00EBEBEB00DAD9D900C4C3C300C7C6C6000000000000000000000000000000
      000000000000000000000000000000000000ADADAB00FFFFFF00ECECEB00EDED
      EC00EDEDEC00ECECEB00EBEBEA00EBEBEA00FFFFFF00A8A8A500E4E4E300FFFF
      FF00A4A4A200FFFFFF00E9E9E900CACAC800000000003FA07400008A49000088
      4600008846000088460000884600008846000088460000874400009F600000C7
      8F0000D59D0020DEAD002FBD8B000000000000000000008846003AD1AB0052E1
      C2001DD5AB0010D4A80011D5AA0011D6AB0011D6AB0011D6AB0011D5A90013D3
      A80000CC9B0000CE9D0074DBBF00008A48000000000000000000BEBDBD00EBEA
      EB00DBDAD90000000000CDCBCA00C8C7C5000000000000000000000000000000
      000000000000000000000000000000000000ADADAB00FFFFFF00E9E8E800EAE8
      E900E9E8E800F3F2F200FFFFFF00FFFFFF00FFFFFF00A9A9A600FFFFFF00FFFF
      FF00FFFFFF00E9E9E900CBCBC9000000000000000000008A490014DFB00011DA
      AB0011DAAA0011DAAA0011DAAA0011DAAA0011DAAA0011D9A90010D4A9001DD5
      AB0052E1C2003AD1AB0000884600000000000000000000000000008845003ABA
      910062DEC80061E0CA0062E0CA0062E0CA0062E0CA0062E0CA0062E0C90065DE
      C70000C59A0000C69C0086DEC800008A48000000000000000000D4D4D300DDDC
      DB000000000000000000D4D2D100BDBBBA000000000000000000000000000000
      000000000000000000000000000000000000AEAEAB00FFFFFF00E5E4E300E6E5
      E400E5E4E300FFFFFF00CACAC900A4A4A200FFFFFF00ADADAA00AFAFAD00AEAE
      AC00AFAFAD00CACAC800000000000000000000000000008A470066E2D00062DD
      CA0062DDC80062DDC80062DDC80062DDC80062DDC80062DDC90061E0CA0062DE
      C8003ABA91000088450000000000000000000000000000000000000000000000
      00000089460000884400008744000087440000874400008744000086410000AB
      7D0000BF9E009BDFD00000874300000000000000000000000000C5C3C2000000
      00000000000000000000D9D7D600C2C2C0000000000000000000000000000000
      000000000000000000000000000000000000AEAEAC00FFFFFF00E0E0DF00E0E0
      DF00E0E0DF00FFFFFF00A4A4A200FFFFFF00E9E9E900CCCCCB00000000000000
      000000000000000000000000000000000000000000004FB0820000965D000093
      5A00009359000093590000935900009359000093590000945A00008743000089
      4500000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000089
      4500A4E4D9000087430000000000000000000000000000000000000000000000
      00000000000000000000D3D1D100B6B4B2000000000000000000000000000000
      000000000000000000000000000000000000AFAFAD00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00E9E9E900CBCBC90000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000004EB0
      8300008C49000000000000000000000000000000000000000000000000000000
      00000000000000000000BBB9B700000000000000000000000000000000000000
      000000000000000000000000000000000000B8B8B600B0B0AD00AEAEAC00AEAE
      AB00ADADAB00AEAEAB00AFAFAD00BDBDBB000000000000000000000000000000
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
      0000C09E7900B5844E00B3824B00B3814B00B3814B00B3824B00B5844E00C09E
      790000000000000000000000000000000000BABAB900AFAFAD00AEAEAB00ADAD
      AB00ADADAB00ADADAB00AEAEAB00AEAEAC00AFAFAD00AFAFAD00B0B0AE00B6B3
      AF00C7C1BB0031699E00396D9E00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000004B7DA30068A4D9000000000000000000000000000000
      000000000000000000000000000000000000000000006DA8D0004094D0003F92
      CF003F92CE003E92CF003E94D0006DA8D0000000000000000000000000000000
      0000BA854B00FFFFFC00FFFFF500FFFFF400FFFFF400FFFFF500FFFFFC00BA85
      4B0000000000000000000000000000000000B0B0AD00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0023629E0025B0FF0044C8FF003A83CC005C5C5C005C5C5C005E5B5A005E5A
      59005D5A5A005B5A5B005A5B5B005A5B5B005A5B5B005B5A5A005C5956005768
      76004E7EA4004C80AC005082AB0065A2D5000000000000000000000000000000
      000000000000000000000000000000000000000000003B93D100A9F9FF008FF0
      FF008FEFFF008DF0FF00D2FFFF003E94D0009A9A9A0081818100818182007F83
      8600BD854600FFFFF700FFF3DA00FFF2D900FFF2D900FFF3DA00FFFFF700BD85
      46007F83860081818200818181009A9A9A00AEAEAB00FFFFFF00FDFDFD00FCFC
      FD00FDFDFD00FEFEFE00FFFFFF00D3D3D4006E6F710058585C005A5A5D006360
      60007D7068003AC6FF0057DBFF003981C9000000000000000000000000003F69
      A50075666700706869006D6969006C6A69006C6A69006C6A68006E6762004C89
      BA004E85B2004D83AE005D8CB200629ED1000000000000000000000000000000
      000000000000000000000000000000000000000000003390D100B7F3FF0077E0
      FD0077E0FD0076E0FE00DAFEFF003B92CF0081818100D5D2D100CBC9C9007D7C
      7C0067676800A8A6A800A4A2A400A3A2A300A3A2A300A4A2A400A8A6A8006767
      68007D7C7C00CBC9C900D5D2D10081818100ADADAB00FFFFFF00FAF8F800F9F8
      F800FAF9F900FFFDFE00D1D1D20067646300E3C38C00FFEBA400FFF3AF00E7D3
      A10076706B00A09085003280CF00000000000000000000000000000000001382
      6B0000934600715C62006A62630067646300666463006764620068615B004F8A
      BB005086B4004F84B1006895B9005F9BCD0063A4D1004397D1004094D0003C92
      D0003991D0003B92D1004899D3000000000000000000308FD200CEF7FF00B5EE
      FE00DBF9FF00DDFBFF00E2FFFF003D94D0007F7F7F00DAD7D600C2BFBE00C8C5
      C400AFACAC00AFACAB00ADAAAA00ADAAAA00ADAAAA00ADAAAA00AFACAB00AFAC
      AC00C8C5C400C2BFBE00DAD7D6007F7F7F00ADADAB00FFFFFF00F6F6F600F6F6
      F600F8F8F800FEFFFF0077787900E3BE8400FFE6A500FFE7A600FFEFB300FFF9
      BB00E9D6A200807875000000000000000000000000000000000000000000008C
      46004FDDB000008D43006B585E00655E60006361600062605F00645D5700518D
      BE00528AB7005187B400739FC2005D97C9004397D10054A6D90082E3FD0086EB
      FF0083EAFF0085ECFF0051B3E40000000000000000003492D300DCFDFF00DAFB
      FF00348DCD003991CE003D94D0007EB8E0007E7E7E00E1E0DF00BDBBB9009290
      8E007B7977007D7B78007D7B78007D7B78007D7B78007D7B78007D7B78007B79
      770092908E00BDBBB900E1E0DF007E7E7E00ADADAB00FFFFFF00F4F4F300F4F4
      F300F6F6F500FDFEFE00696A6D00FFE09D00FFEFCA00FFE7B300FFE9AB00FFEF
      B200FFF4AF007876770000000000000000000D915400008A4700008845000084
      410000DAA20060D9B300008D420068545A00625B5C00605C5A00605852005490
      C200558CBA004E81AD007EA6C8005A94C4004095D000A0E5FB0048A7DD00DDFA
      FF00DAF9FF00DBFAFF00DDFCFF0059A0D30000000000539FD4003C93D0003B92
      CF005CA0D0000000000000000000000000007D7D7D00EDEBEB00B8B5B3006462
      61006B6968006C6A69006C6A69006C6A69006C6A69006C6A69006C6A69006B69
      680064626100B8B5B300EDEBEB007D7D7D00ADADAB00FFFFFF00F2F1F000F2F1
      F000F4F3F200FBFAFB006F6F7200FFDD9700FFF7E400FFEDC800FFE7B200FFE6
      A500FFECA5007C7B7E000000000000000000008A470063EDD00000D4A00000D2
      9E0000CC9C0000CD9C006FDCBD0000934600615457005C5756005B534D005794
      C500588EBC0047749B0088AFCF005790C0003D93CF00C1F7FF0051B5E5002F89
      CA002F8ACB00328CCC003992CF003F97D3000000000075ABD0003E93CF003E91
      CE003E92CE003E92CF003E94D0006EA9D1007C7C7D00F9F8F800F3F4F2009491
      90009B9897009C9998009C9998009C9998009C9998009C9998009C9998009B98
      970094919000F3F4F200F9F8F8007C7C7D00ADADAB00FFFFFF00EFEFEE00EFEF
      EE00F0F1F000F6F7F70084858700E7BB7C00FFF5DB00FFF7E400FFEECA00FFE5
      A400EBCC9500868587000000000000000000008A470061E1D00060DDCA0063DC
      C80000C49B0000C69C0082E1C800009447005C50540058535300574F4A005A96
      CA005B8FBE0022B9F70095B5D300548DBC003B92CF00D2F9FF00B6F0FF00DCFD
      FF00DFFFFF00E5FFFF003E95D00000000000000000003C93D100A9F9FF008FF0
      FF008FEFFF008DF0FF00D2FFFF003E94D0007C7C7D00F4F3F200D3D1D000827F
      7E00888685008986860089868500898685008986850089868500898686008886
      8500827F7E00D3D1D000F4F3F2007C7C7D00ADADAB00FFFFFF00ECEBEA00EDEC
      EB00EEECEB00F1F0F000CFCFD00083807D00E8BC7D00FFDC9700FFDF9C00EAC5
      8B008C88870000000000000000000000000010945700008A4700008844000085
      3F0000C1A00097E3D100008F43005A484E005650510053514F00524B45005B9A
      CD005C91C10020B7F5009EBCD7005189B8003D94D000DCFDFF00DAFBFF00358F
      CD003A92CF003E95D0007EB8E00000000000000000003490D100B7F3FF0077E0
      FD0077E0FD0076E0FE00DAFEFF003B92CF007E7E7E00FFFFFF00FFFFFF006D6B
      6A00706F6F006C6B6B006A6867006A6867006A6867006A6867006C6B6B00706F
      6F006D6B6A00FFFFFF00FFFFFF007E7E7E00ADADAB00FFFFFF00E9E9E800EAEA
      E900EAEAE900EBECEB00EFEFEF00D8D7D8009494960085858800848487009796
      9800A9AAAA00000000000000000000000000000000000000000000000000008B
      4400A0E8DA000091440055434A00524B4D004F4D4E004F4D4C004D4641005E9C
      D2005C95C5005990C100A6C4DF004E86B5004E9ED5003D94D0003D94D00053A1
      D50000000000000000000000000000000000000000003190D200CEF7FF00B5EE
      FE00DBF9FF00DDFBFF00E2FFFF003D94D000A9A9A9007F7F7F007F7F80008083
      8700BF864800FFFFF800FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFF800BF86
      4800808387007F7F80007F7F7F00A9A9A900ADAEAB00FFFFFF00E7E5E400E8E7
      E600E8E7E600E8E7E600E8E7E600FFFFFF00D3D3D300AFB0AF00AEAFAD00FFFF
      FF00B3B3B1000000000000000000000000000000000000000000000000001786
      6D0000964700523F45004F4749004D494A004C4A4A004C4848004A423D0060A0
      D5005D98C9005894C600AFCCE6004B83B0000000000000000000000000000000
      000000000000000000000000000000000000000000003692D200DCFDFF00DAFB
      FF00348DCD003991CE003D94D0007DB7E0000000000000000000000000007577
      7A00BA834700FFFFF300FFF0DD00FFEFDC00FFEFDC00FFF0DD00FFFFF300BA83
      470075777A00000000000000000000000000AEAEAB00FFFFFF00E3E3E200E4E4
      E300E4E5E400E4E4E300E3E3E200FFFFFF00A8A8A600EDEDEC00FFFFFF00EAEA
      EA00CACAC9000000000000000000000000000000000000000000000000004D7B
      B0004C3D3B004A43430048454400484644004846440047454200433C36005FA1
      D8005C9ACC005896C900B8D3EB004980AC000000000000000000000000000000
      000000000000000000000000000000000000000000007EB9E1003D94D0003D94
      D00082BAE1000000000000000000000000000000000000000000000000000000
      0000B7834900FFFFF400FFE1C000FFE0BF00FFE0BF00FFE1C000FFFFF400B783
      490000000000000000000000000000000000AEAEAC00FFFFFF00E0DFDE00E1DF
      DE00E1E0DF00E1DFDE00E0DFDE00FFFFFF00A5A5A300FFFFFF00E8E8E800CBCB
      C900000000000000000000000000000000000000000000000000000000004A7F
      AC0044383100433B3700433D3800433D3800433D3800423B36003C332C00B9DA
      F5007FB0DA005495CC00C0DAEF00467CA8000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000B7854E00FFFFFD00FFFFF500FFFEF400FFFEF400FFFFF500FFFFFD00B785
      4E0000000000000000000000000000000000AFAFAD00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E9E9E900CACAC9000000
      00000000000000000000000000000000000000000000000000000000000082A6
      C3004A82AE004A83B0004A83B0004A83B0004A83B0004A82AF00447DA900709C
      BF00B9D5EB00B3D1EA00C1DBF2004279A5000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000CEAE8A00B5844F00B3824B00B3814B00B3814B00B3824B00B5844F00CEAE
      8A0000000000000000000000000000000000B8B8B600B0B0AD00AEAEAC00AEAE
      AB00AEAEAB00AEAEAB00ADAEAB00AEAEAB00AFAFAD00B7B7B500000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000CEE3F5003F75A1000000000000000000000000000000
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
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000058A0D1004296D1004296D1004094D0003F92CF003F92CE003F92CE003F92
      CE003F92CE003F92CF004094D0004D9BD200C3AB7A00B7821600B37A0600D7D0
      D400D8D1D300A96D0B00F7EFE300FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00AC7419000000000000000000000000000000
      00000000000000000000BF881600F6CD8B00F3C27500F9FCFF008B8D9000F9F9
      F900F4F8FC00F2C17400F6CD8B00BF8816004B9CD4003695D7003694D8003694
      D8003694D8003694D8003694D8003694D8003694D8003694D8003D92D0003694
      D8003694D8003694D8003694D7004B9CD4000000000000000000000000000000
      00004195D000AAF9FF0091F0FF0092F0FF0091F0FF0092F0FF0092F0FF0092F0
      FF0092F0FF0092F0FF00A8F9FF004094D000B7821800F6CC8A00F0C17200F9F7
      FC00FFFFFF00A6690500F5EBDA00979A9F005354560095969700FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00AA7114000000000000000000000000000000
      00000000000000000000BF881600F3CC8B00EBB65C00F2EDEC007F797800F1E9
      E200EEE9E800EAB55A00F3CC8B00BF8816004095D10091FBFF0091FBFF0091FB
      FF008CF8FF0092F4FF0093F3FF0093F2FF0093F3FF0093F3FF0092F4FF0090F3
      FF0091FBFF0091FBFF00A0FEFF003F94D1000000000000000000000000000000
      00004094CF00BAF5FF007FE3FF0081E3FE007FE3FF0081E3FE0082E3FE0082E3
      FE0082E3FE0081E4FF00B0F3FF003D92CF00B6811600F3CA8600EBB66000F8F5
      F800FFFFFF00A5680300F5EAD900FFFFFF0057575700FFFFFF00FBFBFA00F6F6
      F500F5F5F400F5F7F700FFFFFF00AA711300000000000000000000000000C3AA
      7700BF881600BF881600BF881600F3CE9200E6AC4D00EAD9C600FFFFFF00FDFE
      FF00E8D7C400E6AC4C00F3CE9300BF8816003E93D00088F4FF0088F4FF0088F4
      FF0088F4FF0080EEFF0082EDFF0082EDFF0082EEFF0082EEFF0081EFFF0088F4
      FF0088F4FF0088F4FF009FF8FF003D93D0000000000000000000000000000000
      00003F93CF00D3F9FF0070DBFC0071DAFB0070DBFC0071DAFB0072DAFB0072DA
      FB0073DAFB0073DBFB00BFF3FF003C92CE00B6811600F1CA8900E8B15500F9F8
      FD00FAF8FB00A6690500F6ECDB008C8E9200545556008B8B8C00E3E2E300DFDE
      DE00DEDEDE00DDDEE000FFFFFF00AA711400000000000000000000000000BF88
      1600F7CE8E00F5C78000BF881600F4D29B00E3A43B00E3A33500E3A13100E3A1
      3100E3A23500E3A43B00F4D39B00BF8816003F93D00082EDFF0082EDFF0082ED
      FF0082EDFF0082EDFF0082EDFF0082EDFF0082EDFF0082EDFF0082EDFF0082ED
      FF0082EDFF0082EDFF00A2F5FF003D92D0000000000000000000000000000000
      00003E93CF00DEFCFF00DAFAFF00DBF9FF00DAF8FF00AEEAFE0064D5FA0064D5
      FA0064D5FA0064D5FA00D3F8FF003B92CF00B6811500F3CB8F00E6AD4D00FDFF
      FF00EEE7E500A76B0900F6EFE300FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00AC741900C3AA7700BF881600BF881600BF88
      1600F4CD8D00EEBD6A00BF881600F5D5A300E8C99D00EDE4E100EEE4DF00EEE4
      DF00EDE4E100E8C99D00F5D6A500BF8816003F93CF007DE8FF007DE8FF007DE8
      FF007DE8FF007DE8FF007DE8FF007DE8FF007DE8FF007DE8FF007DE8FF007DE8
      FF007DE8FF007DE8FF00A8F2FF003D92CF006EA8D0004296D1004296D1004095
      D0003B91CE00388DCC00388DCC00368CCB00318BCB00D8F9FF00D6F7FF00D6F7
      FF00D6F7FF00D6F7FF00DBFBFF003D94D000B6811500F3D09500E4AA4600E8CB
      A500FFFFFF00A66D1000A76F1300A76D1000A66D0E00A66C0E00A56C0E00A56B
      0E00A66C0E00A96F1200AC741900B07A2300BF881600F7CE8E00F5C78000BF88
      1600F3CF9400EAB35900BF881600F7DCAF00EFE7E300B1A9A400B3ABA400B3AB
      A400B1A9A400EFE7E300F7DDB000BF8816003F93CF0076E1FF006DDDFF0069DD
      FF0068DDFF006ADEFF006DDEFF006FDEFF006FDEFF006FDEFF006FDEFF006FDE
      FF006FDEFF0070DDFF00AFEFFF003D92CF004195D0009DFCFF0091F0FF0091F0
      FF00368DCC00C6F5FF006FDBFC0063C8F1003E9BD500318BCB00308BCC00358E
      CD00358ECD00358ECD00358ECD003F95D100B6811500F3D39C00E3A53E00E2A2
      3700E4A13200E6A43700E7A53A00E7A63A00E7A63A00E7A63C00E7A84000E8AA
      4300F6D69E00B88212000000000000000000BF881600F4CD8E00EEBD6A00BF88
      1600F4D39C00E7A94400BF881600F9E4C400EFEBE500F0EAE000F1EBE000F1EB
      E000F0EAE000EFEBE500FAE5C500BF8816003E94D000E1FFFF00DAFAFF00D9F9
      FF00D9FAFF00DCFAFF006EDAFD0070D9FC0070D8FB006FD8FB006FD8FB006FD8
      FB006FD8FB006CD8FB00B5EFFF003D92CF004094CF009FF8FF0081E3FE0081E3
      FE00328BCB00D3F6FF0062D3F90063D4F900B7EDFE00DBFAFF00DCFBFF00DEFE
      FF00DEFEFF00DFFFFF00E4FFFF004096D100B6811400F4D5A400E09E3100F4E0
      B700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F4E1B800E19F
      3200F5D6A400B68114000000000000000000BF881600F4CF9500EAB35900BF88
      1600F5D6A500EACEA800BF881600FDE6C100FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FEE9C700BF8816004095D100378ECD00348BCB00358B
      CB00368BCA00378ACA005BBBEA006CD6FB0068D4FA0066D2F90065D2F90065D2
      F90065D2F90063D2FA00B9F0FF003C92CF003F93CF00A7F6FF0070DBFC0070DB
      FC00318CCC00DAFBFF00D8F8FF00D8F8FF00D8FAFF00308ACB00338DCC003790
      CE003A92CF003B93D0003E95D0004F9ED500B6801400F5DAAE00DF982200FCFF
      FF00797C8000A1A3A500FEFBF200797A7C00A3A4A600A0A3A700FBFEFF00DF97
      2200F5DAAE00B68014000000000000000000BF881600F5D49D00E7A94400BF88
      1600F7DDB000F0EAEA00E0BC7300BF881600BF881600BF881600BF881600BF88
      1600BF881600BF881600BF881600D1AE69003E94D000C8F8FF0072DDFE0075DD
      FD0076DEFD0076DEFE004FAADC0054B8E800D9F7FF00D5F6FF00D5F6FF00D5F6
      FF00D4F5FF00D4F6FF00D9FBFF003D94D0003E93CF00B1F7FF00DAFAFF00E3FF
      FF006EB3DF003991CE003991CE00378FCD00338DCC0043A5DC00D9FEFF003C93
      D00000000000000000000000000000000000B6801300F7DFB900DD921500FCFC
      FC00FDF8EC00FFF8EA00FDF6E800FCF6E800FBF4E700F9F4E800FAFAFA00DC91
      1500F7DFB900B68013000000000000000000BF881600F6D7A700EACEA900BF88
      1600F9E4C300EFECE800F0ECE900F1EEEC00F1EEEC00F1EEED00F2F0F100FDE9
      CD00BF8816000000000000000000000000003B92CF00CEF7FF0069D5FA006DD5
      FA006DD5FA006BD5FA006BD8FC0047A8DD00318ACB002F8ACB002F8ACB002F8A
      CB002F8ACB00308BCB00358FCD004095D1003D93CF00388DCC00388DCC00388D
      CC00318BCB00DEFEFF00DEFEFF00DEFEFF00DEFEFF00D9FBFF00DCFEFF003D94
      D00000000000000000000000000000000000B67F1200FAE5C500DA8C0900FEFE
      FF00787879007A797900A2A1A1009F9E9E00F5EBE0009B9B9D00FCFCFF00DA8C
      0900FAE5C500B67F12000000000000000000BF881600F8DEB200F0ECEE00BF88
      1600FCE4BF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFE9
      C900BF8816000000000000000000000000003B92CF00D5F8FF0060D1F90063D1
      F80062D1F800B5EBFD00DAF8FF00DCFBFF00DDFDFF00DDFDFF00DDFDFF00DDFD
      FF00DDFDFF00DDFEFF00E3FFFF004096D1003B92CF00C7F5FF006EDBFC0063C8
      F1004BACDF00318CCC00318CCC00318CCC00318CCC00308CCC00358FCD003F95
      D10000000000000000000000000000000000B67F1200FBECD200D8840000FFFF
      FF00F1E5DA00F2E6DA00F2E6DA00F0E4D800EEE2D700EEE2D800FEFFFF00D883
      0000FBECD200B67F12000000000000000000BF881600FBE6C700F0EFEF00E0BC
      7300BF881600BF881600BF881600BF881600BF881600BF881600BF881600BF88
      1600DDC491000000000000000000000000003D94D000DCFCFF00D8F8FF00D9F7
      FF00D9F7FF00DBFAFF00358ECD003A92CF003B92CF003B93CF003B93CF003B93
      CF003B93CF003B93D0003E95D0007DB8E0003B92CF00D5F7FF0062D2F90062D2
      F900B6ECFE00DBF9FF00DCFBFF00DDFDFF00DEFEFF00DFFFFF00E4FFFF004096
      D10000000000000000000000000000000000B7811400FFECCD00FCE6C300FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FCE6
      C300FFECCD00B78114000000000000000000BF881600FFE9C800FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFEDD000BF881600000000000000
      0000000000000000000000000000000000006EAFDC003D94D0003A92CF003A92
      CF003A92CF003D94D00072B2DD00000000000000000000000000000000000000
      0000000000000000000000000000000000003D94D000DCFDFF00D8F9FF00D8F8
      FF00DBFBFF00358ECD003991CE003A92CF003B92CF003B93D0003E95D0007DB8
      E00000000000000000000000000000000000DEC69500B7811400B57E0F00B57C
      0B00B57C0900B57C0900B57C0900B57C0900B57C0900B57C0900B57C0B00B57E
      0F00B7811400DEC695000000000000000000D1AE6900BF881600BF881600BF88
      1600BF881600BF881600BF881600BF881600BF881600D2B06B00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000004F9ED5003D94D0003A92CF003A92
      CF003D94D00053A1D50000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000008C4C003EA0730000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BABAB900AFAFAD00AEAEAB00ADAD
      AB00ADADAB00ADADAB00ADADAB00AEAEAC00B3B0AF00C5B5B900529F7A00008B
      4800008B4900008C4C0053A88200000000000000000000000000000000000000
      0000000000000000000068A4CE004195D100469AD40000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000088470018C891000087460000000000000000000000
      000000000000000000000000000000000000C2A97500B7821800B6801400B37A
      0600D7CFD200D8CEC900CFCECD00C9BFAC00D9CFCE00D5CAC300D4CAC400D6CF
      D200B37A0600B6801400B7821800C2A97500B0B0AD00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF006DC29B000094520000BA
      840077E0C60000BB860000995C0053A8820000000000000000000000000068A4
      CF004092CE0054ADDE0066C4ED0078E0FE003591D100BBB2AA00B0AEAB00ADAD
      AB00AEAEAB00AFAFAD00BABAB90000000000000000000000000068A4CF004092
      CE00438AB200008846003CCE9E0000DCA20000BC7F00009B5C00009D5F000088
      470000894800249761000000000000000000B7821800F6CD8B00F2C67D00F0C1
      7100FAF7FB00FFFFFF004C48480098939200FFFFFF00F7EFEA00F6EFEB00F9F6
      FA00F0C17100F2C67D00F6CD8B00B7821800AEAEAB00FFFFFF00FDFDFD00FCFC
      FD00FCFCFD00FCFCFD00FCFCFD00FFFEFF00FFFFFF00007F360000BE880000BC
      8300FFFFFF0000BC830000C18D00008C4C00000000004E9CD10058B0DF006DC9
      EF007FE2FD007EE3FE007ADEFC007EE1FF00308CCD00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00B0B0AD00000000004E9CD10058B0DF006DC9EF007FE2
      FD00008C4A0061D8B50000D49E0000D29C0000D5A1005ADEC7005ADEC7005ADE
      C7005ADEC70000C28C000090500000000000B6811600F3CA8700EDBC6D00EBB7
      6100F8F5F700FFFFFF004A454100948C8800FFFFFF00F1E8E000F0E7E000F7F4
      F700EBB76100EDBC6D00F3CA8700B6811600ADADAB00FFFFFF00FAF8F800F9F8
      F800F9F8F800F9F8F800F9F8F800FDFAFB00FFFFFF00007F370072E5CB00FFFF
      FF00FFFFFF00FFFFFF0077E7CE00008B4900000000004094CF0092F1FF0085E7
      FF0080E1FD007ADEFB0077DBFB0083E1FF00308ACB00FFFFFB00FFFFFD00FCFC
      FC00FCFCFC00FFFFFF00AEAEAB00000000004094CF0092F1FF0085E7FF0080E1
      FD007ADEFB000087440086EBDB0000C69F0000B1800000874500008D4D00009B
      6000009A5F0000B2800000B6890044A27700B6811600F1CB8900E9B76200E7B2
      5700F9F8FB00FDF7F200877F79004A444100FEF7F200EEE3D800EDE2D900F8F7
      FB00E8B25700E9B76200F1CB8900B6811600ADADAB00FFFFFF00F6F6F600F6F6
      F600F6F6F600F6F6F600F6F6F600F9F7F800FFFFFF00007E360000CA940000C8
      8F00FFFFFF0000C9900000CD9900008C4B00000000003E92CE009AF0FF0083E4
      FD007EDFFC007ADDFB0076DAFA0089E2FE0048A8DD0070AED900FFFCF800F9F6
      F600F7F6F600FFFFFF00ADADAB00000000003E92CE009AF0FF0083E4FD007EDF
      FC0062B1C9006DC9E60000874200A3EEED00008845008DEDFF009FF3FF00367F
      B400000000003CA6750000A1710000915300B6811600F3CC8E00E8B25A00E7AE
      5100FCFFFF00ECE0D700F1E4DA00F1E5DA00EDE0D500EADDD300E9DED500FBFF
      FF00E7AE5100E8B25A00F3CC8E00B6811600ADADAB00FFFFFF00F4F4F300F4F4
      F300F4F4F300F4F4F300F4F4F300F6F5F500FFFAFC0063B68F00009B590000D1
      9A0074EED40000D49F0000A3670068BC9600000000003E92CE00A3F1FF0082E3
      FC007EDFFC007ADDFB0076DAFA0071D9FB009DE8FF002A89CB00FFFBF600F6F4
      F300F4F3F300FFFFFF00ADADAB00000000003E92CE00A3F1FF0082E3FC007EDF
      FC00008E4E0038A1960060B8D500008B4800138C770087EBFF00A3F2FF001184
      6B00008B4A000000000000000000008E4E00B6811500F3CE9400E6AE5100E5AB
      4B00E6C9A400FFFFFF00FFFFFF00FFFFFF00FEFFFF00FDFFFF00FEFFFF00E6C9
      A400E5AC4B00E6AE5100F3CE9400B6811500ADADAB00FFFFFF00F2F1F000F2F1
      F000F2F1F000F2F1F000F2F1F000F3F1F000F8F3F400FFF9FD0062B58E000080
      370000843E000089470069BD960000000000000000003D92CE00ADF3FF0081E3
      FC007EDFFC007ADDFB0076DAFA006FD8FA00ABEBFF002B89CC00FFF8F100F2F1
      EF00EFF0EE00FFFFFF00ADADAB00000000003D92CE00ADF3FF0081E3FC007EDF
      FC000093530000AE7000159267008ABCCC002A6EA2008DC3CC0089C3CC000088
      470018E8B400008645000000000000000000B6811500F3D09A00E5A84500E3A6
      4000E2A13600E29E2F00E19D2D00E19D2C00E19D2C00E19D2D00E29E2F00E2A1
      3600E3A64000E5A84500F3D09A00B6811500ADADAB00FFFFFF00EFEFEE00EFEF
      EE00EFEFEE00EFEFEE00EFEFEE00EFEFEE00F0EFEF00F4F1F100FDF4F600FFFF
      FF00CBB4BB00000000000000000000000000000000003C92CE00B6F6FF0080E3
      FC007DDFFC007ADDFB0076DAFA006ED7FA00B9EFFF002A89CC00FCF2ED00EEEC
      EB00EBEAEA00FFFFFF00ADADAB00000000003C92CE00B6F6FF0080E3FC007DDF
      FC0029A7860000C3870000BB7E00009D5F00009F6000008847000087450000BC
      800000DBA0003CE9BD000087450000000000B6811400F4D4A000E1A13600F2DE
      B700FCFFFF00FBFFFD00FBFFFC00FBFFFD00FBFFFD00FBFFFD00FBFFFD00FBFF
      FF00F2DEB700E1A13600F4D4A000B6811400ADADAB00FFFFFF00ECEBEA00EDEC
      EB00EDECEB00EDECEB00EDECEB00ECEBEA00ECEBE900ECEBEA00EEEBEB00FFFF
      FF00B7AFB000000000000000000000000000000000003C91CE00C0F8FF007FE2
      FC007DDFFC007ADDFB0075DAFA006DD7FA00C6F3FF002989CB00FFF9F400FFFF
      FF00FFFFFF00FFFFFF00AEAEAB00000000003C91CE00C0F8FF007FE2FC007DDF
      FC007ADDFB00008F500000C48C0000DBA9005ADEC7005ADEC7005ADEC70000D4
      A10000D19C0000D39E0061DBB700008C4A00B6801400F6D8A700E09C2700FBFF
      FF00FCFBF300FCF9EF00FBF8EE00FCFAF000FCFAF000FBF9EE00F9F8ED00FAF9
      F100FAFEFE00E09B2700F6D8A700B6801400ADADAB00FFFFFF00E9E9E800EAEA
      E900EAEAE900EAEAE900E9E9E800F3F4F200FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00AFAEAC00000000000000000000000000000000003B91CE00C9F9FF007EE2
      FC007CDEFC0078DCFB0072D9FA006AD6FA00D2F6FF002888CB00FFFFFF00CDCB
      C900A4A4A200FFFFFF00AFAFAD00000000003B91CE00C9F9FF007EE2FC007CDE
      FC0078DCFB0072D9FA0013986900008A490000894800008948000087450000B1
      800000C7A00086DCC5000087440000000000B6801400F8DCB000E0981C00FBFB
      F80079787B00A2A0A200FCF6EA0079787900A3A1A300A09FA100FAF4E9009D9D
      A000F9F9F600E0981C00F8DCB000B6801400ADAEAB00FFFFFF00E7E5E400E8E7
      E600E8E7E600E8E7E600E7E5E400FFFFFF00CBCBCA00A7A7A400A5A5A300FFFF
      FF00AFAFAD00000000000000000000000000000000003A91CE00D2FCFF007AE2
      FC0077DDFC007FDFFB009BE6FD00B3EDFF00D4F9FF002688CB00FFFFFF00A7A5
      A200FFFFFF00E9E9E900CACAC800000000003A91CE00D2FCFF007AE2FC0077DD
      FC007FDFFB009BE6FC00B4EDFF00D8FAFF00318ACB00C6F8FF003D93CF000089
      4600A3E4DA00008744000000000000000000B6811300FCE3BC009B610400FDFC
      F900FDF5E800FEF4E700FBF2E500FCF2E500FBF2E500FBF2E500FAF1E300F9F1
      E500FCFAF7009A610400FCE3BC00B6811300AEAEAB00FFFFFF00E3E3E200E4E4
      E300E4E5E400E4E4E300E3E3E200FFFFFF00A7A7A400EBEBEA00FFFFFF00E9E9
      E900CACAC800000000000000000000000000000000003991CF00E9FFFF00AFF0
      FF00CEF7FF00DAFAFF00C4ECFC008CCAEC005FAEE00082BDE600FFFFFF00FFFF
      FF00E9E9E900CBCBC90000000000000000003991CF00E9FFFF00AFF0FF00CEF7
      FF00DAFAFF00C5EBFB0090C8EA0066ADDB0047A8DD00CBF8FF003C92CF004EB0
      8300008C4900000000000000000000000000B6801200FEE9C60071410000FFFF
      FF0079797A007A7A7A00A2A1A1009F9F9F00F6ECDE0077777700A1A1A1009E9F
      A000FFFFFF0070410000FEE9C600B6801200AEAEAC00FFFFFF00E0DFDE00E1DF
      DE00E1E0DF00E1DFDE00E0DFDE00FFFFFF00A5A5A300FFFFFF00E8E8E800CBCB
      C90000000000000000000000000000000000000000003C93D000E9FFFF00A8DA
      F3007BBDE4004398D200408EC7006E9CBC0090A5B200BAAFA600B5ADA600B5AF
      A900CFCDCA000000000000000000000000003C93D000E9FFFF00A8DAF3007BBD
      E4004398D1003493D10046AAE00053BDEB0061D3FB00CEF8FF003B92CF000000
      000000000000000000000000000000000000B6801200FDECD100DA860000FFFF
      FF00F1E5D800F2E5D800F2E5D700F0E3D600EFE2D500F1E4D700F1E4D600EFE3
      D600FFFFFF00DA860000FDECD100B6801200AFAFAD00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E9E9E900CACAC9000000
      000000000000000000000000000000000000000000004297D2003B93D00062AD
      DC0093CDED00BBE7FA00D8FCFF00D6FCFF00D3FBFF00D1FBFF00D3FCFF002E91
      D500000000000000000000000000000000004297D2003B93D00062ADDC0093CD
      ED00BBE7FA00D9FCFF00D9FAFF00D7F9FF00D7F9FF00D9FBFF003D94D0000000
      000000000000000000000000000000000000B7811500FFECCD00FCE7C300FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FCE7C300FFECCD00B7811500B8B8B600B0B0AD00AEAEAC00AEAE
      AB00AEAEAB00AEAEAB00ADAEAB00AEAEAB00AFAFAD00B7B7B500000000000000
      0000000000000000000000000000000000000000000051A0D6004498D2004197
      D1003F95D1003D94D0003B93D0003A92D0003A92D0003A93D0003C94D1004B9E
      D6000000000000000000000000000000000051A0D6004498D2004197D1003F95
      D1003D94D0003B93D0003B92CF003B92CF003B92CF003D94D0004F9ED5000000
      000000000000000000000000000000000000DCC28F00B7811400B57E0F00B57C
      0B00B57C0900B57C0900B57C0900B57C0900B57C0900B57C0900B57C0900B57C
      0900B57C0B00B57E0F00B7811400DCC28F00424D3E000000000000003E000000
      2800000040000000900100000100010000000000800C00000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFDA39FFFF40028001DAD6C003
      40008001C217800140018001D8D6800100008001E0398001C0038001F00F8001
      C0038001F0038001C0038000E0038001C0038000C0078001C0030001800F8001
      C0030001803F8001C0030003C07F8001C007003F81FF8001C00F007F0FFF8001
      C01F80FF1FFF8001C03FC1FF3FFFE007FFE7FBFFFC000000C003F03FFC004002
      8001E01FFC0040008000C00FFC0040018001C00FFC0000008001C00FFC00C003
      8001C00FFC00C0038001C007F400C0038001C003E000C0038001C007C000C003
      8001C0038001C0038001C0010003C0038001C00F80FFC0078001C00FC1FFC00F
      8001E01FE3FFC01FE007F03FF7FFC03FFFFFFFCFFFCFFF83FE3F80078007E001
      FC1F00000003C000F80F000000018000F007000000008000E003000000018000
      C00100000003800080000003000380018000000300038003800000030003801F
      C00100030003801FE00300030003801FF00700030003801FF80F00030003801F
      FC1F00030003C03FFE3FC00FC00FE07FFFFFFFFFFFFFFFFFFFCFFE7FC003C003
      E009FC3FC003C00380010003C003C00300030003C003C00300000001C003C003
      00000000C003C00300030000C003C00300010003C003800100010000C0038001
      00070000C003C00300070001C003C00700070003C003C00700070003C003C007
      800F0003C003FC07E03F0003C003FE47FFFFFFFFFF01FE01FFFF0000FE00C001
      FFFF0000FE00C001F3FF0000FE00C001E3FF0000FE00C001C03F0000FE00C001
      00000000FE00C001000000008000C001800000000001C00380010000007FC003
      80010000007FC00380010000007FC003C0038001007FC007E007C003007FC00F
      FFFFE007007FC01FFFFFFFFF80FFFFFFFFFFFFFFFFFFFFFFF8430000C181FFFF
      F8430000C181FFFFF8430000C181FFCFF8430000F1C3FFC7F84300001803FC03
      F843000008030000F84300000C030000E0430000C0630001C0430000C0238001
      80430000E003800180430000E003800180430000F003C00380030000F047E007
      C0030000F87FFFFFF0070000F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000
      F9FFFE0F00000000F1FFF80300000000E00FF00100000000C007E00100000000
      E003C00000000000F1E3800000000000D99B000000000000C78FC00000000000
      C007C00000000000E003C00100000000F007E00100000000FF8FF00300000000
      FF9FFC0F00000000FFFFFFFF00000000FFFFFFE3FFFFFFFFFFC7F000FFFFFFFF
      C003F0000007E0008001C0000007E0008001C0000007C000800100000003C000
      80030000000100008007000000000000C07F000000000000F0FF000000010000
      F0FF00000003C000E07F00000007C000E07F00030007E000E07F00030007E000
      E07F000F0007E000F0FF000FFFFFFFFFFFE38001FFE3F863FFC100000001F001
      FF8000000000E000000000000000C00000000000000080000000000000018001
      0000000000010003000000000001000F00000000000100070000000000018007
      000000000001C003000000000001F003000000000001FF01000000000001FF81
      FFFF00000001FFF3FFFF0000FFFFFFFFFFE30001FFE3FFE3FFC10001FFC1FFC1
      C00000000000C000C00000000000C000C00000000000C000C00100010000C001
      C00300010000C003C00300010000C003C00300010000C003C00300010000C003
      C00300010000C003C00300010000C003C00300018001C003C0030001C003C003
      FFFFE01FE007FFFFFFFFE01FFFFFFFFFFFFFFFF9FFE3FFE300018000FEC1C7C1
      00000000F800838000000001FC00118000000003FE80388000000003FFC110C1
      00000003B82380E3000000039BB3C0FF000000030BA1E00F000100039BB3FE07
      00070003B83BFE0300070003FFFFFE1100070003FEFFFE39000F0003FC7FFF11
      001F0003F83FFF83003FC00FFEFFFFC7FFFFFFFFFFFFFFFF8001F800FFE3FFE3
      8001F80080018001800100000000000080010000000000008001000000000000
      800100000001000180010000000300038001000F000700078001000D00070007
      8001000900070007800100010007000780010009000700078001001D00070007
      8001003F000700078001007FC01FC01FFFFFFFFFFFFFFFFF8000800080008000
      8000800080008000000000000000000080008000800080008000800080008000
      0000000000000000800080008000800080008000800080000000000000000000
      8000800080008000800080008000800000000000000000008000800080008000
      8000800080008000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8000800080008000
      8000800080008000000000000000000080008000800080008000800080008000
      0000000000000000800080008000800080008000800080000000000000000000
      8000800080008000800080008000800000000000000000008000800080008000
      8000800080008000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8001800080008000
      8001800080008000800100000000000080018000800080008001800080008000
      8001000000000000800180008000800080018000800080008001000000000000
      8001800080008000800180008000800080010000000000008001800080008000
      80018000800080008001FFFFFFFFFFFFFFFFFFFF8E3FFC710000FFFC041FF820
      0000FFF8001FF8000000FF01001FF800000000030A1FF85000000003803FFC01
      00000003CA7FFE5300000003C47FFE2300000003C467E62300000003FFE3C7FF
      00000003FF0180FF00000003FF0000FF00000003FF0000FF00000003FF0180FF
      00000003FFE3C7FF000003FFFFE7E7FFFFFFFFFFFFFFFFFFC380E7870000FFE3
      C380C3870000FFC1C38081870000F001C38000870000C001C3FF00FF00008003
      C383C38300008007C383C38300000007C383C38300000007C383C38300000007
      00FFC3FF000000070087C380000000078187C3800000800FC387C3800000800F
      E787C3800000C01FFFFFFFFF0000F07FFFFFFFFFFFFFFFFF0000000000000187
      000000000000018700000000000001870000000000000187000000000000FFFF
      000000000000C183000000000000C183000000000000C183000000000000C183
      000000000000FFFF000000000000E180000000000000E180000000000000E180
      000000000000E180000000000000FFFFFFFFFFE3FFE3FFE3FC3F000000000000
      F00F000000000000E007000000000000C003000000000000C003000000000000
      8001000000000000800100000000000080010000000000008001000000000000
      C003000000000000C003000000000000E007000000000000F00F000000000000
      FC3F000000000000FFFF000000000000FFFFFFFFFFFFFFE3FC00D555FC3F0000
      00000001F00F000000008000E007000000000001C003000000008000C0030000
      0000000180010000000080008001000000000001800100000000800080010000
      00000001C003000000018000C003000000030001E0070000001F8000F00F0000
      001F0001FC3F0000F1FFD555FFFF0000E7FFFFFFFFFFFFFFC7FFF001F1FFFC00
      800FC001F5FFFC0000038001F5E3FC0000018001F1CB0000800107FFF9930000
      C7E00FFFFC070000E7F00FFFFC7F0000FFF00FE7F8FF0000FFF007E3F0FF0000
      FFE08001E0FF000080018000C4FF00018001C000CCFF00038003F001DCFF003F
      800FFFE3FCFF007FFFFFFFE7FDFF00FFFFFFFFFFFFFFFFFFFFFFF00F0001FFFC
      FF80F00F00000000FF8000000000E000FF8000000001E000018000000003E000
      0180000000030000008700000003000000800000000300000180000000070000
      018000000007E0000F8000000007E000FF80E0070007E000FF87F00F000FE000
      FFFFF00F001FE000FFFFF00F003FFFFCFFFFFFFFFFFFFFFFF800FC00FFFFF000
      0000FC000000F0000000FC000000F0000000E0000000F0000000E0000000F000
      0000000000000000000000000000000000030000000000000003000000000000
      000300000000000F000300070000000F000300070000000F000300070000000F
      0003003F01FF000F0003003FFFFF03FFFFFFFFFFFE7FFFFF0001FC7FFC7F0000
      0000E001C0030000000080010001000000008001000000000000800100080000
      0000800100060000000180010003000000078001000100000007800100000000
      000780010001000000078001000300000007800300070000000F8007001F0000
      001F800F001F0000003F800F001F000000000000000000000000000000000000
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
    Images = MenuImageList
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
