object MainForm: TMainForm
  Left = 0
  Top = 0
  Caption = 'OraBone'
  ClientHeight = 565
  ClientWidth = 919
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
  OnKeyDown = FormKeyDown
  OnResize = FormResize
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object MainMenuPanel: TPanel
    Left = 0
    Top = 0
    Width = 919
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
    Width = 919
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
      Width = 915
      Height = 26
      ActionManager = ActionManager
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
    Width = 919
    Height = 493
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
      Width = 915
      Height = 489
      Hint = 'Hold shift down to move connection tabs.'
      Align = alClient
      DoubleBuffered = False
      Images = MenuImageList
      ParentDoubleBuffered = False
      ParentShowHint = False
      PopupMenu = PageControlPopupMenu
      ShowHint = False
      TabOrder = 0
      OnChange = PageControlChange
      TabDragDrop = True
      HoldShiftToDragDrop = True
      ShowCloseButton = False
      OnCloseButtonClick = PageControlCloseButtonClick
    end
  end
  object StatusBar: TStatusBar
    Left = 0
    Top = 546
    Width = 919
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
                Caption = 'P&rint Preview...'
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
                Caption = '&Go to Bookmarks'
                UsageCount = 1
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
                Caption = 'T&oggle Bookmarks'
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
                Action = ViewGotoLineAction
                Caption = 'Go to &Line'
                ImageIndex = 88
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
                Action = ViewOutputAction
              end
              item
                Caption = '-'
              end
              item
                Action = SQLHistoryAction
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
          end
          item
            Caption = '-'
          end
          item
            Action = HelpHomeAction
            Caption = '&Visit Homepage...'
            ImageIndex = 30
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
      Hint = 'Execute statement'
      ImageIndex = 36
      ShortCut = 120
      OnExecute = ExecuteStatementActionExecute
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
      ShortCut = 24649
      OnExecute = EditIncreaseIndentActionExecute
    end
    object EditDecreaseIndentAction: TAction
      Category = '&Edit'
      Caption = '&Decrease Indent'
      Hint = 'Decrease indent'
      ImageIndex = 56
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
      ImageIndex = 71
      OnExecute = ClearBookmarksActionExecute
    end
    object ViewGotoLineAction: TAction
      Category = '&Search'
      Caption = 'Go to Line'
      ImageIndex = 88
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
  end
  object MenuImageList: TBCImageList
    Left = 62
    Top = 418
    Bitmap = {
      494C010159005802580510001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000007001000001002000000000000070
      0100000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000025604000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000002560400025604000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000002590500025905000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000004620800096F11000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000006680D0018932D000256
      0400000000000000000000000000000000000000000002560400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000006680D002CB84F00096F
      1100000000000000000000000000000000000000000002560400025604000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000025905002BB44C0024AA
      4200025604000000000000000000000000000000000002560400078110000256
      0400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000168A280042E2
      76001C9C3300025604000256040002560400025604000256040009981300047D
      0B00025604000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000025604002BB4
      4C003FE06F002BB44C0016982A0013982500169C28000E911C0009981300058F
      0E00047D0B000256040000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000256
      040024AA420036D362002ECC540024BD42001BAF320013A325000C981800058F
      0E0006920E000781100002560400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000002560400096F11001FA5390023B43F001BAF320018AA2D000C9818000998
      13000A7F14000256040000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000259050002590500046208000256040018AA2D00096F
      1100025604000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000002560400096F11000259
      0500000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000002560400025604000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000002560400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
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
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000811E0000811E0000811E0000811E0000811E0000811E
      0000811E0000811E00000000000000000000BD4C0000BD4C0000BD4C0000BD4C
      0000BD4C0000BD4C0000BD4C0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000555556005555
      5600555556003838380000000000000000000000000000000000056695000566
      95000566950005669500811E0000FEFEFE00FEFEFE00FEFEFE00758EFC00A5B6
      FC00FEFEFE00811E00000000000000000000FEFBF700FFF7ED00FFF0E000FEEA
      D100FEE3C500FEDEB800BD4C0000000000000000000000000000000000000000
      000000000000000000000000000000000000BD4C0000BD4C0000BD4C0000BD4C
      0000BD4C0000BD4C0000BD4C0000BD4C0000BD4C000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000086380F0087310E007431100054351E002B2A2B00CAC9CC00A1A0
      A300928F9300928C91004F4B4C0000000000000000000274A90030C9E90012CB
      FE0020CEFE0054DEFF00811E0000FEFEFE00FEFEFE006480FB00011FFA003D5D
      FB00FEFEFE00811E00000000000000000000FFFEFB00FFFAF200FFF3E600FEEE
      D900FEE6CB00FEE0C000BD4C0000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFEFB00FFFAF400FEF6EB00FFF2
      E100FFEBD800FEE7CE00FEE3C500FEE0BD00BD4C000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000B251
      0700B2510700B554060036574300278B1C00185E230083838800838187009C9C
      9E00817E81006863660048454600000000000274A90073FAFE003FE3FE0012CB
      FE0020CEFE0054DEFF00811E0000CAD4FE00284BFB00011FFA00284BFB000120
      FA00CAD4FE00811E00000000000000000000FFFFFF00FFFBF800FFF6ED00FFF0
      E000FFE9D300FEE3C500BD4C0000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFEFC00FFFBF700FFF7EF00FFF3
      E600FFEEDC00FEE9D100FEE5C700FEE1BF00BD4C000000000000000000000000
      0000000000000000000000000000000000000000000000000000DD680100E66D
      0100F36D0100737E140003458E0001479D0026557E00B4A99C009F9792008884
      8B00696B770036373E0000000000000000000274A90073FAFE003FE3FE0012CB
      FE0020CEFE0054DEFF00811E00003D5DFB00092AFA00AABAFC00EAEEFE00092A
      FA003859FB00811E00000000000000000000811E0000811E0000811E0000811E
      0000811E0000811E0000BD4C0000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFCFA00FFF8F200FEF4
      E900FEF0DE00FEEBD400FEE6CB00FEE2C200BD4C000000000000000000000000
      00000000000000000000000000000000000000000000F0770300F47D0600F680
      0900F47F0C00BD831400094677000452BB00034EB200074999007A826900FBBD
      6400E6B77700CBAD8E0079747400393839000274A90073FAFE003FE3FE0012CB
      FE0020CEFE0054DEFF00811E0000DCE3FE00CAD4FE00FEFEFE00FEFEFE008097
      FC00011FFA00491F3F0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000004B000000000000BD4C0000811E
      0000811E0000811E0000811E0000811E0000811E0000811E0000811E0000811E
      0000811E0000811E0000811E0000811E0000811E0000811E0000811E0000BD4C
      000000000000004B0000000000000000000000000000F8871100F48B1C00D788
      2C006A604E001E4E6E00094D9E000F72E6000D7AFE000353BB000349A000FFA5
      2200FFA62400FFA72900F69C2800454545000274A9009FFBFE00A3F3FF00B6F2
      FF00DAF8FF00E5FAFF00811E0000FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFE
      FE003D5DFB00011FFA0000000000000000000000000000000000000000000000
      0000000000000000000000000000004B0000004B000000000000BD4C0000FFF7
      ED00FFF0E000FEEAD100FEE3C500FEDEB800FFFFFE00FFFBF800FFFAF200FFF6
      EB00FEF2E300FFEEDC00FEEAD400FEE7CC00FEE3C600FEE1BF00FEDEBA00BD4C
      000000000000004B0000004B000000000000F4891800FF972C00FF9F3E005B6A
      6F000D4F9F00146AC7002396FC001C87EF001687FF00034FB40076846E00FFC4
      5200FFC15000FFBB4100F69F22003D3D3D000274A900A7E9F3001CAAD3000791
      C5000788BC00108BBC00811E0000811E0000811E0000811E0000811E0000811E
      0000761E0700111FB800011FFA00000000000000000000000000000000000000
      00000000000000000000004B000031C75800004B000000000000BD4C0000FFFA
      F200FFF3E600FEEED900FEE6CB00FEE0C000FFFEFE00FFFCFA00FEFAF300FFF7
      EE00FFF3E600FFEFDE00FEEDD700FFE9CF00FEE5C700FEE1C100FEDEBB00BD4C
      000000000000004B00004BFE8200004B0000FB952B007DA43000469741001057
      9D00187ADE001F80DE001560AF001667B6000D64C20007489800F7D06D00FFD9
      7900FFD57300FFCC5F00F4AF3B00343434000274A90031B5D3003FE3FE0012CB
      FE0020CEFE0054DEFF0074E0F80030B0DA000268A30003689A00000000000000
      00000000000000000000011FFA00011FFA000000000000000000000000000000
      0000000000000000000000000000004B0000004B000000000000BD4C0000FFFB
      F800FFF6ED00FFF0E000FFE9D300FEE3C500FFFFFF00FFFCFB00FFFAF600FFF7
      EF00FEF4E700FFF0E000FFEDD900FEE9D100FEE5C900FEE2C200FEE0BC00BD4C
      000000000000004B0000004B000000000000F39F3C0034A52C00057E3F000C5A
      B5001573D70008498300077A3E0007425E00034CAA00818E7300FFEB8700FFFA
      A300FFEB9200FFDC7300EFB54B002B2A2B000274A90073FAFE003FE3FE0012CB
      FE0020CEFE0054DEFF0074E0F80030B0DA000386C10005669500000000000000
      0000000000000000000000000000011FFA000000000000000000000000000000
      000000000000000000000000000000000000004B000000000000BD4C0000811E
      0000811E0000811E0000811E0000811E0000811E0000811E0000811E0000811E
      0000811E0000811E0000811E0000811E0000811E0000811E0000811E0000BD4C
      000000000000004B00000000000000000000FAA64A00BFB55A00208945000950
      A5000A59A7000C7E3C0010A92300115F380016447E0089816E009A977B00A9A3
      8900C2AB7B00DCB76A00DEAF5800232323000274A90073FAFE003FE3FE0012CB
      FE0020CEFE0054DEFF0074E0F80030B0DA000386C10005669500000000000000
      000000000000000000000000000000000000811E0000811E0000811E0000811E
      0000811E0000811E0000BD4C0000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFCFA00FFF8F200FFF4
      E700FFEEDD00FFEAD100FEE5C700FEE1BD00BD4C000000000000000000000000
      00000000000000000000000000000000000000000000FFBC7700E3C695001353
      8C00095189000FA121000FA523001D8E27008F673D007F4F25006B461F005E4F
      2C0035573F00303D380037363900000000000274A90073FAFE003FE3FE0012CB
      FE0020CEFE0054DEFF0074E0F80030B0DA000386C10005669500000000000000
      000000000000000000000000000000000000FEFBF700FFF7ED00FFF0E000FEEA
      D100FEE3C500FEDEB800BD4C0000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFEFE00FFFAF600FFF6
      EB00FFF0E100FEEBD500FFE6CB00FEE1C200BD4C000000000000000000000000
      0000000000000000000000000000000000000000000075AF4800FFCB93005879
      9F000D4789000A8B2D000FA1230011A524003EAF2F0045AC2A00FF8811006889
      100007A01F000000000000000000000000000274A90078FBFE0068F6FF0055F6
      FE005FFEFF0078FBFE0089FBFE0048CFF200058BC70005669500000000000000
      000000000000000000000000000000000000FFFEFB00FFFAF200FFF3E600FEEE
      D900FEE6CB00FEE0C000BD4C0000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFCF800FFF8
      F000FEF3E600FEEEDC00FEE9CF00FEE5C500BD4C000000000000000000000000
      000000000000000000000000000000000000000000000000000067B14A00C7B0
      96002858820013972E000FA1220011A3230009A323002E9F2300FF800C004C96
      1600000000000000000000000000000000000274A900FEFEFE00F0FFFF00C6FF
      FF00A0FFFF009FFBFE009FFBFE0092FFFF0055F6FE0005669500000000000000
      000000000000000000000000000000000000FFFFFF00FFFBF800FFF6ED00FFF0
      E000FFE9D300FEE3C500BD4C0000000000000000000000000000000000000000
      000000000000000000000000000000000000BD4C0000BD4C0000BD4C0000BD4C
      0000BD4C0000BD4C0000BD4C0000BD4C0000BD4C000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007FB1
      4C0095B557000FA3230010A323000FA323000FA42400A5901A00FF7704000000
      000000000000000000000000000000000000000000000479AF00F0FFFF00DAF8
      FF00B7FFFF009FFBFE0089FBFE0083FAFB00086B9A0000000000000000000000
      000000000000000000000000000000000000BD4C0000BD4C0000BD4C0000BD4C
      0000BD4C0000BD4C0000BD4C0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000011A3230011A323000CA4240068971F0000000000000000000000
      00000000000000000000000000000000000000000000000000000274A9000274
      A9000274A9000274A9000274A9000274A9000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000434141004341
      4100434141004341410043414100434141004341410043414100434141004341
      4100434141004341410000000000000000000000000000000000434141004341
      4100434141004341410043414100434141004341410043414100434141004341
      4100434141004341410000000000000000000000000000000000434141004341
      4100434141004341410043414100434141004341410043414100434141004341
      4100434141004341410000000000000000000000000000000000434141004341
      41004341410043414100434141001877EA001574E00043414100434141004341
      410043414100434141000000000000000000000000004D4A4A006D6767007367
      6700776666007D66640081646400866464008A6462008C6462008C6462008C64
      62008C6462008C6462004341410000000000000000004D4A4A006D6767007367
      6700776666007D66640081646400866464008A6462008C6462008C6462008C64
      62008C6462008C6462004341410000000000000000004D4A4A006D6767007367
      6700776666007D66640081646400866464008A6462008C6462008C6462008C64
      62008C6462008C6462004341410000000000000000004D4A4A006D6767007367
      6700776666007D6664001776E6001573E700136FDC00126ED3000F6AC9008C64
      62008C6462008C6462004341410000000000000000004D4A4A00878484008981
      810090818100987F7F00A0807D00A77E7D00B07B7B00B77B7900BB7B7900BB7B
      7900BB7B79008C6462004341410000000000000000004D4A4A00878484008981
      810090818100987F7F00A0807D00A77E7D00B07B7B00B77B7900BB7B7900BB7B
      7900BB7B79008C6462004341410000000000000000004D4A4A00878484008981
      810090818100987F7F00A0807D00A77E7D00B07B7B00B77B7900BB7B7900BB7B
      7900BB7B79008C6462004341410000000000000000004D4A4A00878484008981
      8100908181001676CA00268BE500278CEB002184E300116CCF000C67C4000B64
      BB000962B400075CA9004341410000000000000000004D4A4A008C8C8C008886
      860089828200C2BABA00FFFFFF00FFFFFF00A67E7D00AF7B7B00B67B7A00BB7B
      7900BB7B79008C6462004341410000000000000000004D4A4A008C8C8C008886
      86008982820090818000FFFFFF00FFFFFF00FFFFFF00FFFFFF00D7B7B600BB7B
      7900BB7B79008C6462004341410000000000000000004D4A4A008C8C8C008886
      860089828200C2BABA00FFFFFF00FFFFFF00FFFFFF00D3B7B700B67B7A00BB7B
      7900BB7B79008C6462004341410000000000000000004D4A4A008C8C8C008886
      860089828200258BD8003EABEE0045B4F7002687DD003DAAF4001E80D5000F69
      BF00065BAA000458A00004579A0003549500000000004D4A4A009A9A9A009090
      90008988880088818100E3DFDF00FFFFFF00D9CDCD00A57E7D00AD7B7B00B57B
      7A00BB7B79008C6462004341410000000000000000004D4A4A009A9A9A009090
      900089888800F0EFEF00FFFFFF00C6BABA009E7E7E00F3EEEE00FFFFFF00CAA0
      9F00BB7B79008C6462004341410000000000000000004D4A4A009A9A9A009090
      900089888800888181008F81800097808000E6DEDE00FFFFFF00D2B7B700B57B
      7A00BB7B79008C6462004341410000000000000000004D4A4A009A9A9A009090
      900001500A00319CF70039A4F4001B6DC40048B7FA002687DD0041ADFA003BA7
      F8001F81D400197ACC00065B9F0002529100000000004D4A4A00ADADAD009D9D
      9D009291910088888800A9A4A400FFFFFF00FFFFFF009D7F7F00A47E7D00AC7B
      7A00B47B7A008C6462004341410000000000000000004D4A4A00ADADAD009D9D
      9D0092919100FFFFFF00FFFFFF008E81800096808000E6DFDF00FFFFFF00D2B7
      B600B47B7A008C6462004341410000000000000000004D4A4A00ADADAD009D9D
      9D009291910088888800878181008E81800096808000FFFFFF00F3EEEE00AC7B
      7A00B47B7A008C6462004341410000000000000000004D4A4A00ADADAD000B63
      4400185F690001500A00166AD4002581CE001160C0002889E30040ACFE00359E
      F2003CA6FF003CA6FF002D95EF0000000000000000004D4A4A00C1C0C000ABAA
      AA009C9C9C00918F8F0087878700E1DFDF00FFFFFF00D6CDCD009C7F7F00A37F
      7D00AB7E7D00876463004341410000000000000000004D4A4A00C1C0C000ABAA
      AA009C9C9C00D4D3D300FFFFFF00E1DFDF00FFFFFF00FFFFFF00FFFFFF00A37F
      7D00AB7E7D00876463004341410000000000000000004D4A4A00C1C0C000ABAA
      AA009C9C9C00B0AFAF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BDA3
      A200AB7E7D00876463004341410000000000000000004D4A4A000663090025AC
      46001CB62F001CB62F001CB62F0001500A0001500A00196DA3002380E1002C8F
      EB0038A3FF0038A1FF004341410000000000000000004D4A4A00CECECE00B7B6
      B600A5A5A5009A99990090909000A9A9A900FFFFFF00FFFFFF0092818100997F
      7F00A17F7D00826564004341410000000000000000004D4A4A00CECECE00B7B6
      B600A5A5A500B6B6B600FFFFFF00FFFFFF00FFFFFF00FFFFFF00B1A4A400997F
      7F00A17F7D00826564004341410000000000000000004D4A4A00CECECE00B7B6
      B600A5A5A500F2F2F200FFFFFF00BEBEBE0087828200F0EFEF00FFFFFF00B6A3
      A300A17F7D0082656400434141000000000000000000096D11001C9A310047F7
      790036E554001CB62F000E912D0012805B001CB62F001CB62F0001500A000150
      0A00A17F7D00826564004341410000000000000000004D4A4A00D7D5D500C0C0
      C000B1AFAF00A3A3A3009998980091919100E1E1E100FFFFFF00D1CECE009281
      8100987F7F007B6664004341410000000000000000004D4A4A00D7D5D500C0C0
      C000B1AFAF00E8E8E800FFFFFF00D4D4D40089898900EFEFEF00FFFFFF009281
      8100987F7F007B6664004341410000000000000000004D4A4A00D7D5D500C0C0
      C000B1AFAF00FFFFFF00FFFFFF009191910089898900EFEFEF00FFFFFF009281
      8100987F7F007B6664004341410000000000000000001C982F001890290035E0
      5D0021C239000CA015000086000000830000068E0F001DA657002D9197009281
      8100987F7F007B6664004341410000000000000000004D4A4A00DCDADA00CAC9
      C900BDBDBD00B4B1B100A6A6A6009D9C9C00B3B3B300FFFFFF00FFFFFF008981
      810090818100766666004341410000000000000000004D4A4A00DCDADA00CAC9
      C900BDBDBD00ECEBEB00FFFFFF00C9C9C90095959500FFFFFF00FFFFFF00AAA4
      A40090818100766666004341410000000000000000004D4A4A00DCDADA00CAC9
      C900BDBDBD00ECEBEB00FFFFFF00C9C9C900B3B3B300FFFFFF00F0EFEF008981
      810090818100766666004341410000000000000000004D4A4A00035A06001799
      280011AA1D0001820200007B0000048A0B00005D0100005D0100878484008981
      810090818100766666004341410000000000000000004D4A4A00E0E0E000D1D0
      D000C5C4C400EFEEEE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00A9A9
      A90088818100706766004341410000000000000000004D4A4A00E0E0E000D1D0
      D000C5C4C400BFBDBD00F5F5F500FFFFFF00FFFFFF00FFFFFF00C0C0C0008787
      870088818100706766004341410000000000000000004D4A4A00E0E0E000D1D0
      D000C5C4C400BFBDBD00F5F5F500FFFFFF00FFFFFF00FFFFFF008C8C8C008787
      870088818100706766004341410000000000000000004D4A4A00138723002AD1
      490004880700005C0000005D0100046D0A00A3A3A300979797008C8C8C008787
      870088818100706766004341410000000000000000004D4A4A00E1E1E100DEDE
      DE00D8D7D700D3D1D100CACACA00BFBFBF00B4B4B400A4A4A400979797008E8E
      8E00878787006B6767004341410000000000000000004D4A4A00E1E1E100DEDE
      DE00D8D7D700D3D1D100CACACA00BFBFBF00B4B4B400A4A4A400979797008E8E
      8E00878787006B6767004341410000000000000000004D4A4A00E1E1E100DEDE
      DE00D8D7D700D3D1D100CACACA00BFBFBF00B4B4B400A4A4A400979797008E8E
      8E00878787006B6767004341410000000000000000000E7818002CD44D00068C
      090000540000D3D1D100CACACA00BFBFBF00B4B4B400A4A4A400979797008E8E
      8E00878787006B6767004341410000000000000000004D4A4A00D8D7D700E1E1
      E100E2E2E200E0E0E000DADADA00D0CFCF00C0BFBF00B0ADAD009F9F9F009695
      95008E8E8E006B6B6B004341410000000000000000004D4A4A00D8D7D700E1E1
      E100E2E2E200E0E0E000DADADA00D0CFCF00C0BFBF00B0ADAD009F9F9F009695
      95008E8E8E006B6B6B004341410000000000000000004D4A4A00D8D7D700E1E1
      E100E2E2E200E0E0E000DADADA00D0CFCF00C0BFBF00B0ADAD009F9F9F009695
      95008E8E8E006B6B6B00434141000000000008690E002BCE490007960D000058
      0000E2E2E200E0E0E000DADADA00D0CFCF00C0BFBF00B0ADAD009F9F9F009695
      95008E8E8E006B6B6B00434141000000000000000000000000005B5A5A006A69
      69006C6B6B006C6B6B0068676700636262005B5A5A00535353004F4E4E004E4D
      4D004D4C4C004D4C4C00000000000000000000000000000000005B5A5A006A69
      69006C6B6B006C6B6B0068676700636262005B5A5A00535353004F4E4E004E4D
      4D004D4C4C004D4C4C00000000000000000000000000000000005B5A5A006A69
      69006C6B6B006C6B6B0068676700636262005B5A5A00535353004F4E4E004E4D
      4D004D4C4C004D4C4C0000000000000000000D8217000C9D1500005E00006A69
      69006C6B6B006C6B6B0068676700636262005B5A5A00535353004F4E4E004E4D
      4D004D4C4C004D4C4C0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000B89130000650100000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000434141004341
      4100434141004341410043414100434141004341410043414100434141004341
      4100434141004341410000000000000000000000000000000000434141004341
      4100434141004341410043414100434141004341410043414100434141004341
      4100434141004341410000000000000000000000000000000000434141004341
      4100434141004341410043414100434141004341410043414100434141004341
      4100434141004341410000000000000000000000000000000000434141004341
      4100434141004341410043414100434141004341410043414100434141004341
      410043414100434141000000000000000000000000004D4A4A006D6767007367
      6700776666007D66640081646400866464008A6462008C6462008C6462008C64
      62008C6462008C6462004341410000000000000000004D4A4A006D6767007367
      6700776666007D66640081646400866464008A6462008C6462008C6462008C64
      62008C6462008C6462004341410000000000000000004D4A4A006D6767007367
      6700776666007D66640081646400866464008A6462008C6462008C6462008C64
      62008C6462008C6462004341410000000000000000004D4A4A006D6767007367
      6700776666007D66640081646400866464008A6462008C6462008C6462008C64
      62008C6462008C6462004341410000000000000000004D4A4A00878484008981
      810090818100987F7F00A0807D00A77E7D00B07B7B00B77B7900BB7B7900BB7B
      7900BB7B79008C6462004341410000000000000000004D4A4A00878484008981
      810090818100987F7F00A0807D00A77E7D00B07B7B00B77B7900BB7B7900BB7B
      7900BB7B79008C6462004341410000000000000000004D4A4A00878484008981
      810090818100987F7F00A0807D00A77E7D00B07B7B00B77B7900BB7B7900BB7B
      7900BB7B79008C6462004341410000000000000000004D4A4A00878484008981
      810090818100987F7F00A0807D00A77E7D00B07B7B00B77B7900BB7B7900BB7B
      7900BB7B79008C6462004341410000000000000000004D4A4A008C8C8C008886
      860089828200F1EFEF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B67B7A00BB7B
      7900BB7B79008C6462004341410000000000000000004D4A4A008C8C8C008886
      86008982820090818000987F7F009F807E00E8DEDE00FFFFFF00D7B7B600BB7B
      7900BB7B79008C6462004341410000000000000000004D4A4A008C8C8C008886
      8600E1DFDF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00AF7B7B00B67B7A00BB7B
      7900BB7B79008C6462004341410000000000000000004D4A4A008C8C8C008886
      86008982820090818000D7CDCD00FFFFFF00FFFFFF00FFFFFF00CBA09F00BB7B
      7900BB7B79008C6462004341410000000000000000004D4A4A009A9A9A009090
      900089888800F0EFEF00AFA4A40097808000B9A2A200FFFFFF00FFFFFF00B57B
      7A00BB7B79008C6462004341410000000000000000004D4A4A009A9A9A009090
      900089888800888181008F81800097808000E6DEDE00FFFFFF00D2B7B700B57B
      7A00BB7B79008C6462004341410000000000000000004D4A4A009A9A9A009090
      9000E1E1E100A9A4A4008F818000B4A4A400FFFFFF00F3EEEE00AD7B7B00B57B
      7A00BB7B79008C6462004341410000000000000000004D4A4A009A9A9A009090
      900089888800BEBABA00FFFFFF00D6CDCD009E7E7E00FFFFFF00FFFFFF00B57B
      7A00BB7B79008C6462004341410000000000000000004D4A4A00ADADAD009D9D
      9D009291910088888800878181008E81800096808000F2EFEF00FFFFFF00C3A0
      9F00B47B7A008C6462004341410000000000000000004D4A4A00ADADAD009D9D
      9D0092919100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00DFCB
      CB00B47B7A008C6462004341410000000000000000004D4A4A00ADADAD009D9D
      9D009291910088888800878181008E818000F1EFEF00FFFFFF00BEA2A200AC7B
      7A00B47B7A008C6462004341410000000000000000004D4A4A00ADADAD009D9D
      9D0092919100E1E1E100FFFFFF00C1BABA0096808000E6DFDF00FFFFFF00D2B7
      B600B47B7A008C6462004341410000000000000000004D4A4A00C1C0C000ABAA
      AA009C9C9C00918F8F0087878700878181008C828100FFFFFF00FFFFFF00A37F
      7D00AB7E7D00876463004341410000000000000000004D4A4A00C1C0C000ABAA
      AA009C9C9C00F1F1F100E1E1E10087818100E2DFDF00FFFFFF00C9B9B900A37F
      7D00AB7E7D00876463004341410000000000000000004D4A4A00C1C0C000ABAA
      AA009C9C9C00918F8F0087878700A9A4A400FFFFFF00FFFFFF009C7F7F00A37F
      7D00AB7E7D00876463004341410000000000000000004D4A4A00C1C0C000ABAA
      AA009C9C9C00F1F1F100FFFFFF00A9A4A4008C828100F1EFEF00FFFFFF00BDA3
      A200AB7E7D00876463004341410000000000000000004D4A4A00CECECE00B7B6
      B600A5A5A5009A99990090909000FFFFFF00FFFFFF00E2DFDF0092818100997F
      7F00A17F7D00826564004341410000000000000000004D4A4A00CECECE00B7B6
      B600A5A5A500B6B6B600FFFFFF00BEBEBE00E1DFDF00FFFFFF00C3BABA00997F
      7F00A17F7D00826564004341410000000000000000004D4A4A00CECECE00B7B6
      B600CECECE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0BABA0092818100997F
      7F00A17F7D00826564004341410000000000000000004D4A4A00CECECE00B7B6
      B600A5A5A500E5E5E500FFFFFF00FFFFFF00FFFFFF00FFFFFF00D4CECE00997F
      7F00A17F7D00826564004341410000000000000000004D4A4A00D7D5D500C0C0
      C000B1AFAF00A3A3A3009998980091919100AAAAAA00FFFFFF00F0EFEF009281
      8100987F7F007B6664004341410000000000000000004D4A4A00D7D5D500C0C0
      C000B1AFAF00A3A3A300D7D7D700FFFFFF00E1E1E100FFFFFF00BEBABA009281
      8100987F7F007B6664004341410000000000000000004D4A4A00D7D5D500C0C0
      C000D4D3D300FFFFFF00E5E5E500919191008989890086838300898181009281
      8100987F7F007B6664004341410000000000000000004D4A4A00D7D5D500C0C0
      C000B1AFAF00DBDBDB00FFFFFF00D4D4D4008989890086838300898181009281
      8100987F7F007B6664004341410000000000000000004D4A4A00DCDADA00CAC9
      C900BDBDBD00E2E1E100CECECE009D9C9C00B3B3B300FFFFFF00FFFFFF008981
      810090818100766666004341410000000000000000004D4A4A00DCDADA00CAC9
      C900BDBDBD00B4B1B100A6A6A600E6E6E600FFFFFF00FFFFFF00BDBCBC008981
      810090818100766666004341410000000000000000004D4A4A00DCDADA00CAC9
      C900DBDBDB00FFFFFF00E8E8E8009D9C9C00959595008C8A8A00878484008981
      810090818100766666004341410000000000000000004D4A4A00DCDADA00CAC9
      C900BDBDBD00B4B1B100FFFFFF00FFFFFF00959595008C8A8A00878484008981
      810090818100766666004341410000000000000000004D4A4A00E0E0E000D1D0
      D000C5C4C400E6E5E500FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0C0008787
      870088818100706766004341410000000000000000004D4A4A00E0E0E000D1D0
      D000C5C4C400BFBDBD00B4B2B200ABAAAA00FFFFFF00FFFFFF00C0C0C0008787
      870088818100706766004341410000000000000000004D4A4A00E0E0E000D1D0
      D000DFDFDF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008C8C8C008787
      870088818100706766004341410000000000000000004D4A4A00E0E0E000D1D0
      D000C5C4C400BFBDBD00B4B2B200FFFFFF00FFFFFF00FFFFFF00E2E2E2008787
      870088818100706766004341410000000000000000004D4A4A00E1E1E100DEDE
      DE00D8D7D700D3D1D100CACACA00BFBFBF00B4B4B400A4A4A400979797008E8E
      8E00878787006B6767004341410000000000000000004D4A4A00E1E1E100DEDE
      DE00D8D7D700D3D1D100CACACA00BFBFBF00B4B4B400A4A4A400979797008E8E
      8E00878787006B6767004341410000000000000000004D4A4A00E1E1E100DEDE
      DE00D8D7D700D3D1D100CACACA00BFBFBF00B4B4B400A4A4A400979797008E8E
      8E00878787006B6767004341410000000000000000004D4A4A00E1E1E100DEDE
      DE00D8D7D700D3D1D100CACACA00BFBFBF00B4B4B400A4A4A400979797008E8E
      8E00878787006B6767004341410000000000000000004D4A4A00D8D7D700E1E1
      E100E2E2E200E0E0E000DADADA00D0CFCF00C0BFBF00B0ADAD009F9F9F009695
      95008E8E8E006B6B6B004341410000000000000000004D4A4A00D8D7D700E1E1
      E100E2E2E200E0E0E000DADADA00D0CFCF00C0BFBF00B0ADAD009F9F9F009695
      95008E8E8E006B6B6B004341410000000000000000004D4A4A00D8D7D700E1E1
      E100E2E2E200E0E0E000DADADA00D0CFCF00C0BFBF00B0ADAD009F9F9F009695
      95008E8E8E006B6B6B004341410000000000000000004D4A4A00D8D7D700E1E1
      E100E2E2E200E0E0E000DADADA00D0CFCF00C0BFBF00B0ADAD009F9F9F009695
      95008E8E8E006B6B6B00434141000000000000000000000000005B5A5A006A69
      69006C6B6B006C6B6B0068676700636262005B5A5A00535353004F4E4E004E4D
      4D004D4C4C004D4C4C00000000000000000000000000000000005B5A5A006A69
      69006C6B6B006C6B6B0068676700636262005B5A5A00535353004F4E4E004E4D
      4D004D4C4C004D4C4C00000000000000000000000000000000005B5A5A006A69
      69006C6B6B006C6B6B0068676700636262005B5A5A00535353004F4E4E004E4D
      4D004D4C4C004D4C4C00000000000000000000000000000000005B5A5A006A69
      69006C6B6B006C6B6B0068676700636262005B5A5A00535353004F4E4E004E4D
      4D004D4C4C004D4C4C0000000000000000000000000000000000000000000000
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
      0000000000000000000000000000000000000000000000000000000000000C48
      9800000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000434141004341
      4100434141004341410043414100434141004341410043414100434141004341
      4100434141004341410000000000000000000000000000000000434141004341
      4100434141004341410043414100434141004341410043414100434141004341
      4100434141004341410000000000000000000000000000000000434141004341
      4100434141004341410043414100434141004341410043414100434141004341
      41004341410043414100000000000000000000000000000000000C4898001F81
      FF000C4898000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000004D4A4A006D6767007367
      6700776666007D66640081646400866464008A6462008C6462008C6462008C64
      62008C6462008C6462004341410000000000000000004D4A4A006D6767007367
      6700776666007D66640081646400866464008A6462008C6462008C6462008C64
      62008C6462008C6462004341410000000000000000004D4A4A006D6767007367
      6700776666007D66640081646400866464008A6462008C6462008C6462008C64
      62008C6462008C6462004341410000000000000000000C4898002284FF002082
      FF001F81FF000C48980000000000000000000969100009691000000000000000
      000000000000000000000000000000000000000000004D4A4A00878484008981
      810090818100987F7F00A0807D00A77E7D00B07B7B00B77B7900BB7B7900BB7B
      7900BB7B79008C6462004341410000000000000000004D4A4A00878484008981
      810090818100987F7F00A0807D00A77E7D00B07B7B00B77B7900BB7B7900BB7B
      7900BB7B79008C6462004341410000000000000000004D4A4A00878484008981
      810090818100987F7F00A0807D00A77E7D00B07B7B00B77B7900BB7B7900BB7B
      7900BB7B79008C64620043414100000000000C4898000C4898000C489800288B
      FF000C4898000C4898000C489800000000000969100009691000000000000000
      000000000000000000000000000000000000000000004D4A4A008C8C8C008886
      86008982820090818000E5DFDF00FFFFFF00FFFFFF00FFFFFF00B67B7A00BB7B
      7900BB7B79008C6462004341410000000000000000004D4A4A008C8C8C008886
      860089828200C2BABA00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BB7B
      7900BB7B79008C6462004341410000000000000000004D4A4A008C8C8C008886
      860089828200D4CECD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E4CB
      CB00BB7B79008C646200434141000000000000000000000000000C4898003598
      FF000C4898000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000004D4A4A009A9A9A009090
      900089888800D1CECE00FFFFFF00D6CDCD00B9A2A200FFFFFF00F4EEEE00B57B
      7A00BB7B79008C6462004341410000000000000000004D4A4A009A9A9A009090
      900089888800888181008F818000E5DFDF00FFFFFF00DCCDCC00AD7B7B00B57B
      7A00BB7B79008C6462004341410000000000000000004D4A4A009A9A9A009090
      900089888800D1CECE00FFFFFF00FFFFFF00D9CDCD00A57E7D00AD7B7B00B57B
      7A00BB7B79008C646200434141000000000000000000000000000C48980044A6
      FF000C4898000000000000000000000000000969100009691000096910000969
      100000000000000000000000000000000000000000004D4A4A00ADADAD009D9D
      9D0092919100F0F0F000FFFFFF00AEA4A40096808000F2EFEF00FFFFFF00C3A0
      9F00B47B7A008C6462004341410000000000000000004D4A4A00ADADAD009D9D
      9D00929191008888880087818100E2DFDF00FFFFFF00D9CDCD00A47E7D00AC7B
      7A00B47B7A008C6462004341410000000000000000004D4A4A00ADADAD009D9D
      9D009291910088888800E1DFDF00FFFFFF00FFFFFF00E6DFDF00A47E7D00AC7B
      7A00B47B7A008C646200434141000000000000000000000000000C48980055B6
      FF000C4898000000000000000000000000000969100009691000096910000969
      100000000000000000000000000000000000000000004D4A4A00C1C0C000ABAA
      AA009C9C9C00F1F1F100FFFFFF00A9A4A4008C828100F1EFEF00FFFFFF00BDA3
      A200AB7E7D00876463004341410000000000000000004D4A4A00C1C0C000ABAA
      AA009C9C9C00918F8F0087878700E1DFDF00FFFFFF00D6CDCD009C7F7F00A37F
      7D00AB7E7D00876463004341410000000000000000004D4A4A00C1C0C000ABAA
      AA009C9C9C00918F8F0087878700D0CECE00FFFFFF00FFFFFF00D8CDCD00A37F
      7D00AB7E7D0087646300434141000000000000000000000000000C48980066C7
      FF000C4898000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000004D4A4A00CECECE00B7B6
      B600A5A5A500F2F2F200FFFFFF00A9A9A90087828200F0EFEF00FFFFFF00B6A3
      A300A17F7D00826564004341410000000000000000004D4A4A00CECECE00B7B6
      B600A5A5A5009A99990090909000E1E1E100FFFFFF00D2CECE0092818100997F
      7F00A17F7D00826564004341410000000000000000004D4A4A00CECECE00B7B6
      B600A5A5A5009A9999009090900088888800D0CECE00FFFFFF00F1EFEF00997F
      7F00A17F7D0082656400434141000000000000000000000000000C48980078D7
      FF000C4898000000000000000000000000000969100009691000096910000969
      100009691000096910000000000000000000000000004D4A4A00D7D5D500C0C0
      C000B1AFAF00F3F3F300FFFFFF00B0B0B00089898900EFEFEF00FFFFFF00B1A4
      A400987F7F007B6664004341410000000000000000004D4A4A00D7D5D500C0C0
      C000B1AFAF00A3A3A30099989800E3E3E300FFFFFF00D0CFCF00898181009281
      8100987F7F007B6664004341410000000000000000004D4A4A00D7D5D500C0C0
      C000B1AFAF00A3A3A300999898009191910089898900FFFFFF00FFFFFF009281
      8100987F7F007B666400434141000000000000000000000000000C48980088E3
      FF000C4898000000000000000000000000000969100009691000096910000969
      100009691000096910000000000000000000000000004D4A4A00DCDADA00CAC9
      C900BDBDBD00E2E1E100FFFFFF00D9D8D800B3B3B300FFFFFF00F0EFEF008981
      810090818100766666004341410000000000000000004D4A4A00DCDADA00CAC9
      C900BDBDBD00D6D4D400FFFFFF00FFFFFF00FFFFFF00D2D1D100878484008981
      810090818100766666004341410000000000000000004D4A4A00DCDADA00CAC9
      C900BDBDBD00D6D4D400CECECE009D9C9C00B3B3B300FFFFFF00F0EFEF008981
      81009081810076666600434141000000000000000000000000000C48980093EF
      FF000C4898000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000004D4A4A00E0E0E000D1D0
      D000C5C4C400BFBDBD00ECEBEB00FFFFFF00FFFFFF00FFFFFF008C8C8C008787
      870088818100706766004341410000000000000000004D4A4A00E0E0E000D1D0
      D000C5C4C400BFBDBD00B4B2B200DEDEDE00FFFFFF00D6D6D6008C8C8C008787
      870088818100706766004341410000000000000000004D4A4A00E0E0E000D1D0
      D000C5C4C400DCDBDB00FFFFFF00FFFFFF00FFFFFF00FFFFFF00ACACAC008787
      87008881810070676600434141000000000000000000000000000C48980096F0
      FF000C4898000000000000000000000000000969100009691000096910000969
      100009691000096910000969100009691000000000004D4A4A00E1E1E100DEDE
      DE00D8D7D700D3D1D100CACACA00BFBFBF00B4B4B400A4A4A400979797008E8E
      8E00878787006B6767004341410000000000000000004D4A4A00E1E1E100DEDE
      DE00D8D7D700D3D1D100CACACA00BFBFBF00B4B4B400A4A4A400979797008E8E
      8E00878787006B6767004341410000000000000000004D4A4A00E1E1E100DEDE
      DE00D8D7D700D3D1D100CACACA00BFBFBF00B4B4B400A4A4A400979797008E8E
      8E00878787006B676700434141000000000000000000000000000C48980096F0
      FF000C4898000000000000000000000000000969100009691000096910000969
      100009691000096910000969100009691000000000004D4A4A00D8D7D700E1E1
      E100E2E2E200E0E0E000DADADA00D0CFCF00C0BFBF00B0ADAD009F9F9F009695
      95008E8E8E006B6B6B004341410000000000000000004D4A4A00D8D7D700E1E1
      E100E2E2E200E0E0E000DADADA00D0CFCF00C0BFBF00B0ADAD009F9F9F009695
      95008E8E8E006B6B6B004341410000000000000000004D4A4A00D8D7D700E1E1
      E100E2E2E200E0E0E000DADADA00D0CFCF00C0BFBF00B0ADAD009F9F9F009695
      95008E8E8E006B6B6B00434141000000000000000000000000000C4898000C48
      98000C4898000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000005B5A5A006A69
      69006C6B6B006C6B6B0068676700636262005B5A5A00535353004F4E4E004E4D
      4D004D4C4C004D4C4C00000000000000000000000000000000005B5A5A006A69
      69006C6B6B006C6B6B0068676700636262005B5A5A00535353004F4E4E004E4D
      4D004D4C4C004D4C4C00000000000000000000000000000000005B5A5A006A69
      69006C6B6B006C6B6B0068676700636262005B5A5A00535353004F4E4E004E4D
      4D004D4C4C004D4C4C0000000000000000000000000000000000000000000000
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
      0000000000000000000000000000000000000969100009691000096910000969
      1000096910000969100009691000096910000969100009691000096910000969
      1000000000000000000000000000000000000969100009691000096910000969
      1000096910000969100009691000096910000969100009691000096910000969
      1000000000000000000000000000000000000000000000000000CA680000CA68
      0000CA680000CA680000CA680000CA680000CA680000CA680000CA680000CA68
      0000CA680000CA680000000000000000000000000000000000000C4898000C48
      98000C4898000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000969100009691000096910000969
      1000096910000969100009691000096910000969100009691000096910000969
      1000000000000000000000000000000000000969100009691000096910000969
      1000096910000969100009691000096910000969100009691000096910000969
      10000000000000000000000000000000000000000000CA680000FFE9CF00FFE5
      C900FEE2C100FEDEBC00FEDAB500FED9B000FED5AA00FFD3A500FED0A000FECF
      9D00FECC9900FECB9600CA6800000000000000000000000000000C4898001F81
      FF000C4898000000000000000000000000000969100009691000096910000969
      1000096910000969100009691000096910000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CA680000FFEBD700FEE7
      CF00FFE5C900FEE2C200FEDEBB00FEDCB500FED9B000FED5AB00FED3A500FED0
      A000FECF9D00FECC9800CA6800000000000000000000000000000C4898001F81
      FF000C4898000000000000000000000000000969100009691000096910000969
      1000096910000969100009691000096910000000000000000000000000000C48
      9800000000000000000000000000004B0000004B0000004B0000004B0000004B
      0000004B000000000000000000000000000000000000000000000C4898000000
      0000000000000000000000000000004B0000004B0000004B0000004B0000004B
      0000004B000000000000000000000000000000000000CA680000FFEEDC00FEEB
      D700FEE7CF00FEE5C900FEE2C100FFDEBB00FEDCB600FED9B000FED5AB00FED3
      A500FED1A000FECE9C00CA6800000000000000000000000000000C4898001F81
      FF000C4898000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000C4898000C48
      9800000000000000000000000000004B000026AD440018992D000D8A1900057D
      0C00004B000000000000000000000000000000000000000000000C4898000C48
      9800000000000000000000000000004B000026AD440018992D000D8A1900057D
      0C00004B000000000000000000000000000000000000CA680000FEF2E300BC4B
      0000BC4B0000BC4B0000BC4B0000FEE2C100FEDEBC0000008200000082000000
      8200FED3A500FED0A000CA6800000000000000000000000000000C4898001F81
      FF000C4898000000000000000000000000000969100009691000096910000969
      100009691000096910000000000000000000000000000C48980041B1FE002F91
      E9000C4898000C48980000000000004B0000004B0000004B0000004B0000004B
      0000004B00000000000000000000000000000C4898000C489800258AE9002890
      FE000C4898000000000000000000004B0000004B0000004B0000004B0000004B
      0000004B000000000000000000000000000000000000CA680000FFF4E900BC4B
      0000FEEFDD00FEEBD700FFE7CF00BC4B0000FEE2C20000008200FFDCB600FED9
      AF0000008200FED3A500CA6800000000000000000000000000000C4898001F81
      FF000C4898000000000000000000000000000969100009691000096910000969
      1000096910000969100000000000000000000C489800ACDAF60062C9FF003FB4
      FF003CB0FF000C48980000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000C48980096F0FF0063C5FF003BA4
      FF00207FED000C48980000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CA680000FFF7EE00BC4B
      0000FEF2E200FFEFDD00FFEBD700BC4B0000FFE5C90000008200FEDEBB00FEDC
      B60000008200FED5AA00CA6800000000000000000000000000000C4898002386
      FF000C4898000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000C489800B1DEF800398A
      D0000C4898000C48980000000000004B0000004B0000004B0000004B0000004B
      0000004B0000004B0000004B0000004B00000C4898000C489800609CD00057AD
      F2000C4898000000000000000000004B0000004B0000004B0000004B0000004B
      0000004B0000004B0000004B0000004B000000000000CA680000FFFAF400BC4B
      0000BC4B0000BC4B0000BC4B0000BC4B0000FFE9CF0000008200FFE1C100FEDE
      BC0000008200FED8AF00CA6800000000000000000000000000000C4898002D91
      FF000C4898000000000000000000000000000969100009691000096910000969
      10000000000000000000000000000000000000000000000000000C4898000C48
      9800000000000000000000000000004B00002CB44E0029AF480025AA42001EA1
      3600169728000F8E1C0009881300015A030000000000000000000C4898000C48
      9800000000000000000000000000004B00002CB44E0029AF480025AA42001EA1
      3600169728000F8E1C0009881300015A030000000000CA680000FFFBF800BC4B
      0000FFF7EF00FFF4E700FEF0E200BC4B0000FFEBD70000008200000082000000
      8200FEDEBC00FEDCB600CA6800000000000000000000000000000C4898003B9E
      FF000C4898000000000000000000000000000969100009691000096910000969
      1000000000000000000000000000000000000000000000000000000000000C48
      9800000000000000000000000000004B0000004B0000004B0000004B0000004B
      0000004B0000004B0000004B0000004B000000000000000000000C4898000000
      0000000000000000000000000000004B0000004B0000004B0000004B0000004B
      0000004B0000004B0000004B0000004B000000000000CA680000FFFCFB00BC4B
      0000FFFAF300FFF6EE00FEF3E900BC4B0000FFEFDD0000008200FEE7D000FEE5
      C900FFE1C200FFDEBB00CA6800000000000000000000000000000C4898004BAF
      FF000C4898000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CA680000FFFFFF00BC4B
      0000BC4B0000BC4B0000BC4B0000FFF4E900FFF2E20000008200FFEAD700FEE9
      D000FEE5C900FEE1C200CA680000000000000C4898000C4898000C4898005EBF
      FF000C4898000C4898000C489800000000000969100009691000000000000000
      0000000000000000000000000000000000000969100009691000096910000969
      1000096910000969100009691000096910000969100009691000096910000969
      1000000000000000000000000000000000000969100009691000096910000969
      1000096910000969100009691000096910000969100009691000096910000969
      10000000000000000000000000000000000000000000CA680000FFFFFF00FFFF
      FF00FFFEFB00FFFBF800FEFAF300FEF7EE00FEF4E700FEF2E200FFEEDD00FFEB
      D500FEE9CF00FFE5C900CA68000000000000000000000C4898007FDCFF0070D0
      FF0063C2FF000C48980000000000000000000969100009691000000000000000
      0000000000000000000000000000000000000969100009691000096910000969
      1000096910000969100009691000096910000969100009691000096910000969
      1000000000000000000000000000000000000969100009691000096910000969
      1000096910000969100009691000096910000969100009691000096910000969
      10000000000000000000000000000000000000000000CA680000FFFFFF00FFFF
      FF00FFFFFF00FFFCFC00FFFCF700FFFAF300FFF7EE00FFF4E900FFF2E200FFEF
      DD00FFEBD500FEE9CF00CA6800000000000000000000000000000C48980081E0
      FF000C4898000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000CA680000CA68
      0000CA680000CA680000CA680000CA680000CA680000CA680000CA680000CA68
      0000CA680000CA68000000000000000000000000000000000000000000000C48
      9800000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000092635D00A4676900A4676900A4676900A4676900A467
      6900A4676900A4676900A4676900A46769000000000000000000811E00000000
      000000000000811E000000000000811E0000811E0000811E0000000000000000
      000000000000811E0000811E00000000000000000000000000006F6F6F00FFFF
      FF00FBFBFB00FBFBFB00FBFBFB00B9B9B9005353530000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000051627E0053626D000000000000000000000000000000
      0000000000000000000096655E00FFFBD100FADEB400F8D9A600F4D19700F3CB
      8A00F0C78100F0C78100FCD586009F6F60000000000000000000811E00000000
      000000000000811E000000000000811E00000000000000000000811E00000000
      0000811E00000000000000000000811E00000000000000000000000000005353
      5300FFFFFF00EAEAEA00EAEAEA00EAEAEA00B9B9B90053535300535353005353
      5300535353000000000000000000000000000000000000000000056695000566
      9500056695000566950005669500056695000000000000000000000000000000
      0000000000005B667E000F6FD7004093D3000000000000000000000000000000
      000000000000000000009A685E00FFF3D900F2D9BB00F2D4AF00EECCA1000155
      0300EAC08900E7BC8000F3C982009F6F60000000000000000000811E0000811E
      0000811E0000811E000000000000811E0000811E0000811E0000811E00000000
      0000811E00000000000000000000000000000000000000000000000000000000
      000053535300FFFFFF00EAEAEA0053535300EAEAEA00B9B9B900B9B9B900B9B9
      B900B9B9B900535353000000000000000000000000000274A90030C9E90012CB
      FE0020CEFE0054DEFF0074E0F8002CA7D3000566950000000000000000000000
      00005F697E00106CD30035A3FF003C9AF0000000000000000000000000000000
      000000000000000000009F6C5F00FFFBE900F4E0C600F3DABA00015503002CC5
      580001550300EAC18700F3CA81009F6F60000000000000000000811E00000000
      000000000000811E00001280FF002567B8000000000000000000811E00000000
      0000811E00000000000000000000811E00000000000000000000000000000000
      00000000000053535300FFFFFF00DADADA00DADADA00DADADA00DADADA00FFFF
      FF00FFFFFF00DADADA0053535300000000000274A90073FAFE003FE3FE0012CB
      FE0020CEFE0054DEFF0074DEF70032AFD8000484BF000566950000000000706C
      7D001165C100309FFF003C9AF000000000000000000000000000000000000000
      00000000000000000000A5706000FFFFF800F7E5D4000155030030BD570041E0
      750022B63E0001550300F4CE8A009F6F6000000000000000000000000000811E
      0000811E00001773D7001673E9000F74E9000B74E7003F425400000000000000
      000000000000811E0000811E0000000000000000000000000000000000000000
      000000000000000000006F6F6F00FFFFFF00DADADA00DADADA00B9B9B9005353
      530053535300FFFFFF0053535300000000000274A90073FAFE003FE3FE0012CB
      FE0020CEFE005BC7E1009E7F7A00B08F8100B6998A00986D6300735050004579
      AB0035A3FF00309FFF0000000000000000000000000000000000000000000000
      00000000000000000000AC756200FFFFFF0001550300067F14001A922F0027BB
      4500149A26000C881600015503009F6F60000000000000000000000000000000
      00001370C7002287DE002B93EF002084E200116CCE000768CC000367C7000363
      BC00000000000000000000000000000000000000000000000000000000000000
      000000000000000000006F6F6F00FFFFFF00DADADA00B9B9B900535353000000
      0000C9C9C9005353530053535300000000000274A90073FAFE003FE3FE0012CB
      FE002DB6DD009E7F7A00E5D4C000FEFBCF00FFFFDC00F4EECB00C4A58A00986D
      6300309FFF000000000000000000000000000000000000000000000000000000
      00000000000000000000B47A6300FFFFFF00FCF7F200FAEEE3000155030015A5
      280001550300F2D3AC00FBDCA7009F6F60000000000000000000000000000000
      00002288D70039A7ED003CA7EF004ABAFA003DAAF3001F83D7000D67B8000559
      A5000455980000569D00000000000000000000000000E3E3E3005F5F5F00E3E3
      E30000000000000000006F6F6F00FFFFFF00DADADA0053535300000000000000
      0000000000000000000053535300000000000274A9009FFBFE00A3F3FF00B6F2
      FF00A3898700E1D3CA00FFFFEE00FEFBCF00FEFBCF00FFFAC700FFEEAB00BB8A
      7200000000000000000000000000000000000000000000000000000000000000
      00000000820000000000744E3E00FFFFFF00FFFEFE00FEF7F200036007000996
      130001550300FBE6C400EEDCB2009F6F60000000000000000000000000001448
      C1002884D9002982DC001C72CB003AA3ED003AA5F00046B5FF00359FF0002C92
      E6001574BF00035493000000000000000000E3E3E3005F5F5F005F5F5F005F5F
      5F00E3E3E300000000006F6F6F00FFFFFF00DADADA0053535300000000000000
      0000000000000000000000000000000000000274A900A7E9F3001CAAD3000791
      C50084787600FCFBD700FEFBCF00FEFBCF00FCFBD700FBF0BF00F6C28300E9C5
      9600986C6B000000000000000000000000000000000000000000000000000000
      82003858F3000000820077513F009E9E9E00FFFFFF00036E070004780A00058C
      0D0001550300CBA69300AC8E8400A16B6D000000000000000000050997000E28
      B1002981E7002277D700206ACC002478D5001E6DCF002D8FE700349DF4003CA6
      FF003EA9FF000000000000000000000000005F5F5F005F5F5F00000000005F5F
      5F005F5F5F00E3E3E300000000006F6F6F00FFFFFF00DADADA0053535300B9B9
      B900000000000000000000000000000000000274A90031B5D3003FE3FE0012CB
      FE008F878200FFFFDC00FEFBCF00FEFBCF00FCFBD700F3CF9600EFAD6A00F2D6
      A000986C6B000000000000000000000000000000000000000000000082003858
      F300001DDA00000C96000000820001350200013502000177070005840C000266
      0600DAC1BB00A96A5400D98A40009F675B000000000005099700192FCB002A4F
      EE001A40DE001547E0001F6BE500195DCC001E67D1001A64CB00277DE20039A4
      FF00000000000000000000000000000000000000000000000000000000000000
      00005F5F5F005F5F5F00E3E3E300000000006F6F6F006F6F6F006F6F6F005353
      5300000000000000000000000000000000000274A90073FAFE003FE3FE0012CB
      FE007F7B7A00F7F3CA00FEFBCF00FFFAC700F6D89E00EEBB8100FEE3A600DCBD
      9600986C6B0000000000000000000000000000000000000082003858F300001B
      F800001FEB000022E300000C9600000082009E9E9E009E9E9E00FFFFFF00FFFF
      FF00D8C5C7009F675B00E09A5B00000000000000000005099700284BE9002A5A
      FF00163EFF000525FF000122F3000D44EA001650CF00103EB500000000000000
      00000000000000000000000000000000000000000000E3E3E3005F5F5F00E3E3
      E300FFFFFF005F5F5F005F5F5F00E3E3E3000000000000000000000000000000
      0000000000000000000000000000000000000274A90073FAFE003FE3FE0012CB
      FE004392AB00C6A98C00FFF6B500F6C28300F0B87500FFF4D700F7F3EE00986C
      6B00000000000000000000000000000000000000820093A6F700072FFF000425
      FF00001EFA00001EF2000020E300000C960000008200CF8E6800CF8E6800CF8E
      6800CF8E68009F675B00000000000000000000000000000000000711A400133D
      F4000D35FF00011DEB000227EA000A40E70005169F0000000000000000000000
      000000000000000000000000000000000000E3E3E3005F5F5F005F5F5F005F5F
      5F00E3E3E300FFFFFF005F5F5F00000000000000000000000000000000000000
      0000000000000000000000000000000000000274A90073FAFE003FE3FE0012CB
      FE0020CEFE00708E9800BD967D00E9C59600F2D6A000CCB4A100986C6B00986C
      6B0000000000000000000000000000000000000000000000820093A6F7000D35
      FF00062AFF000123FF000514A900000082000000000000000000000000000000
      00000000000000000000000000000000000000000000000181000321CC00113C
      FA000818C4000106950003047D00000000000000000000000000000000000000
      0000000000000000000000000000000000005F5F5F005F5F5F00000000005F5F
      5F005F5F5F00E3E3E300F0F0F000000000000000000000000000000000000000
      0000000000000000000000000000000000000274A90078FBFE0068F6FF0055F6
      FE005FFEFF0078FBFE0088B5B600767F83006C6A6E006E555500000000000000
      00000000000000000000000000000000000000000000000000000000820093A6
      F7001340FF001730CC0001028600000000000000000000000000000000000000
      00000000000000000000000000000000000000007E000523C4000E3FFF000C19
      AD00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00005F5F5F005F5F5F00E3E3E300000000000000000000000000000000000000
      0000000000000000000000000000000000000274A900FBFFFF00F0FFFF00C6FF
      FF00A0FFFF009FFBFE009FFBFE0092FFFF0055F6FE0005669500000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      820093A6F70003068B0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000316AD000C43FF000815B0000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000005F5F5F005F5F5F00E3E3E3000000000000000000000000000000
      000000000000000000000000000000000000000000000479AF00EDFAFC00DCFF
      FF00B7FFFF009FFBFE0092FFFF0078FBFE00086B9A0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000082000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000010CA100040FAF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000005F5F5F00000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000274A9000274
      A9000274A9000274A9000274A9000274A9000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000056695000566
      9500056695000566950005669500000000000000000066666600666666006666
      6600666666006666660066666600666666006666660066666600666666006666
      6600666666006666660066666600000000000000000066666600666666006666
      6600666666006666660066666600666666006666660066666600666666006666
      6600666666006666660066666600000000000000000000000000000000000000
      0000000000000000000080808000808080008080800080808000808080008080
      8000808080008080800080808000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000566950046D3E9001CD9
      FF002EDAFF007AEDFF0023A4D3000566950066666600FFFFFF009CECFF009CEC
      FF009CECFF009CECFF009CECFF009CECFF009CECFF009CECFF009CECFF009CEC
      FF009CECFF009CECFF009CECFF0066666600666666009CECFF009CECFF009CEC
      FF009CECFF009CECFF009CECFF009CECFF009CECFF009CECFF009CECFF009CEC
      FF009CECFF009CECFF00FFFFFF00666666000000000000000000000000000000
      00000000000000000000FFFFFF00C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C00080808000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000563910062F1FA0012CC
      FC0021CFFF0069E1FB001DA4D6000566950066666600FFFFFF00C3FAFF00C3FA
      FF00C3FAFF00C3FAFF00C3FAFF0001550300C3FAFF00C3FAFF00C3FAFF00C3FA
      FF00C3FAFF00C3FAFF009CECFF0066666600666666009CECFF00C3FAFF00C3FA
      FF00C3FAFF00C3FAFF00C3FAFF00C3FAFF0001550300C3FAFF00C3FAFF00C3FA
      FF00C3FAFF00C3FAFF00FFFFFF00666666000000000000000000000000008080
      80008080800080808000FFFFFF00C0C0C000C0C0C00000000000000000000000
      0000C0C0C000C0C0C00080808000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000045B850099E8EC009AE4
      F400BFEFFC00C9F2FB007FCFEA000566950066666600FFFFFF00C3FAFF00C3FA
      FF00C3FAFF00C3FAFF00015503000C881600C3FAFF00C3FAFF00C3FAFF00C3FA
      FF00C3FAFF00C3FAFF009CECFF0066666600666666009CECFF00C3FAFF00C3FA
      FF00C3FAFF00C3FAFF00C3FAFF00C3FAFF000C88160001550300C3FAFF00C3FA
      FF00C3FAFF00C3FAFF00FFFFFF0066666600000000000000000000000000FFFF
      FF00C0C0C000C0C0C000FFFFFF00C0C0C00000000000C0C0C000C0C0C000C0C0
      C00000000000C0C0C00080808000000000000000000000000000000000000000
      00000000000000000000005CFF000000000000000000005CFF00509BB0001888
      AF001180AF002D95BC00499FC5000566950066666600FFFFFF00C3FAFF00C3FA
      FF00C3FAFF000155030022B63E00149A2600015503000155030001550300C3FA
      FF00C3FAFF00C3FAFF009CECFF0066666600666666009CECFF00C3FAFF00C3FA
      FF00C3FAFF00015503000155030001550300149A260022B63E0001550300C3FA
      FF00C3FAFF00C3FAFF00FFFFFF0066666600808080008080800080808000FFFF
      FF00C0C0C00000000000FFFFFF00C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C00000000000C0C0C00080808000000000000000000000000000000000000000
      00000000000000000000005CFF00005CFF00005CFF00005CFF002885960015A6
      C7002AC8EE0068D9EF001B97C2000566950066666600FFFFFF00C3FAFF00C3FA
      FF00015503002CC5580041E0750027BB450015A528000996130001550300C3FA
      FF00C3FAFF00C3FAFF009CECFF0066666600666666009CECFF00C3FAFF00C3FA
      FF00C3FAFF00015503000996130015A5280027BB450041E075002CC558000155
      0300C3FAFF00C3FAFF00FFFFFF0066666600FFFFFF00C0C0C000C0C0C000FFFF
      FF00C0C0C00000000000FFFFFF00C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C00000000000C0C0C0008080800000000000000000000566950005639100045B
      8500005CFF00005CFF00005CFF00005CFF00005CFF00005CFF00005CFF00005C
      FF001DB8E3006BDAF4001DA4D6000566950066666600FFFFFF00C3FAFF00C3FA
      FF00C3FAFF000155030030BD57001A922F00015503000360070001550300C3FA
      FF00C3FAFF00C3FAFF009CECFF0066666600666666009CECFF00C3FAFF00C3FA
      FF00C3FAFF000155030003600700015503001A922F0030BD570001550300C3FA
      FF00C3FAFF00C3FAFF00FFFFFF0066666600FFFFFF00C0C0C00000000000FFFF
      FF00C0C0C000C0C0C000FFFFFF00C0C0C000C0C0C000C0C0C000000000000000
      0000C0C0C000C0C0C00080808000000000000566950046D3E9001BD3F80028BE
      DE0054A3AF00005CFF00005CFF000000000000000000005CFF00005CFF0038AC
      AF005ADEDE0091F5F80036C4EF000566950066666600FFFFFF00C3FAFF00C3FA
      FF00C3FAFF00C3FAFF0001550300067F1400C3FAFF00C3FAFF00C3FAFF00C3FA
      FF00C3FAFF00C3FAFF009CECFF0066666600666666009CECFF00C3FAFF00C3FA
      FF00C3FAFF00C3FAFF00C3FAFF00C3FAFF00067F140001550300C3FAFF00C3FA
      FF00C3FAFF00C3FAFF00FFFFFF0066666600FFFFFF00C0C0C000C0C0C000FFFF
      FF00C0C0C000C0C0C000FFFFFF00C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C00000000000C0C0C00080808000000000000566950064F5FE0012C8F7001DB4
      DE00489AAC00005CFF00005CFF000000000000000000005CFF00005CFF00AEAF
      AE00B3DEDE00B8F8F80088F8FB000566950066666600FFFFFF00C3FAFF00C3FA
      FF00C3FAFF00C3FAFF00C3FAFF0001550300C3FAFF00C3FAFF00C3FAFF00C3FA
      FF00C3FAFF00C3FAFF009CECFF0066666600666666009CECFF00C3FAFF00C3FA
      FF00C3FAFF00C3FAFF00C3FAFF00C3FAFF0001550300C3FAFF00C3FAFF00C3FA
      FF00C3FAFF00C3FAFF00FFFFFF0066666600FFFFFF00C0C0C000C0C0C000FFFF
      FF00C0C0C000C0C0C000FFFFFF00C0C0C00000000000C0C0C000C0C0C000C0C0
      C00000000000C0C0C000808080000000000005669500A3F7FC009AE4F400AAD5
      E000005CFF00005CFF00005CFF00005CFF00005CFF00005CFF00005CFF00005C
      FF00045B850005639100056695000000000066666600FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00C3FAFF00C3FAFF00C3FAFF00C3FAFF00C3FA
      FF00C3FAFF00C3FAFF009CECFF0066666600666666009CECFF00C3FAFF00C3FA
      FF00C3FAFF00C3FAFF00C3FAFF00C3FAFF00C3FAFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0066666600FFFFFF00C0C0C000C0C0C000FFFF
      FF00C0C0C000C0C0C000FFFFFF00C0C0C000C0C0C00000000000000000000000
      0000C0C0C000C0C0C00080808000000000000566950062BDD7001B95BF00107C
      A900257B9B00326D8700005CFF00005CFF00005CFF00005CFF00000000000000
      00000000000000000000000000000000000066666600FFFFFF00666666006666
      6600666666006666660066666600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF006666660066666600FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0066666600666666006666
      66006666660066666600FFFFFF0066666600FFFFFF00C0C0C000C0C0C000FFFF
      FF00C0C0C000C0C0C000FFFFFF00C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C0008080800000000000056695003BC2DA001AC8F1002CCF
      F70060C6DB00167C9F00005CFF000000000000000000005CFF00000000000000
      0000000000000000000000000000000000006666660066666600669999006699
      9900669999006699990066999900666666006666660066666600666666006666
      6600666666006666660066666600666666006666660066666600666666006666
      6600666666006666660066666600666666006666660066999900669999006699
      990066999900669999006666660066666600FFFFFF00C0C0C00000000000FFFF
      FF00C0C0C000C0C0C000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0080808000000000000566950064F5FE0012CEFE0021CF
      FF006BDAF4001B9AC900045B8500000000000000000000000000000000000000
      000000000000000000000000000000000000666666006699990099CCCC0099CC
      CC0099CCCC0099CCCC0099CCCC00669999006666660099CCCC0099CCCC0099CC
      CC0099CCCC0099CCCC0099CCCC00666666006666660099CCCC0099CCCC0099CC
      CC0099CCCC0099CCCC0099CCCC00666666006699990099CCCC0099CCCC0099CC
      CC0099CCCC0099CCCC006699990066666600FFFFFF00C0C0C000C0C0C000FFFF
      FF00C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C0008080
      8000000000000000000000000000000000000566950081FCFF0052FAFF0067FF
      FF0094FAFD0035C1EB0005639100000000000000000000000000000000000000
      0000000000000000000000000000000000006666660099FFFF0033CCFF0033CC
      FF0033CCFF0033CCFF0033CCFF0033CCFF0066666600CCFFFF00CCFFFF00CCFF
      FF00CCFFFF00CCFFFF00CCFFFF006666660066666600CCFFFF00CCFFFF00CCFF
      FF00CCFFFF00CCFFFF00CCFFFF006666660033CCFF0033CCFF0033CCFF0033CC
      FF0033CCFF0033CCFF0099FFFF0066666600FFFFFF00C0C0C000C0C0C000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008080
      80000000000000000000000000000000000005669500C2EBF400FEFFFE00CEFF
      FF00BDFFFF0088F8FB0005669500000000000000000000000000000000000000
      000000000000000000000000000000000000000000006666660099FFFF0099FF
      FF0099FFFF0099FFFF0033CCFF00666666000000000066666600CCFFFF00CCFF
      FF00CCFFFF00CCFFFF0066666600000000000000000066666600CCFFFF00CCFF
      FF00CCFFFF00CCFFFF0066666600000000006666660033CCFF0099FFFF0099FF
      FF0099FFFF0099FFFF006666660000000000FFFFFF00C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C0008080800000000000000000000000
      0000000000000000000000000000000000000000000005669500056695000566
      9500056695000566950000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000099999900666666006666
      6600666666006666660066666600999999000000000099999900666666006666
      6600666666006666660099999900000000000000000099999900666666006666
      6600666666006666660099999900000000009999990066666600666666006666
      660066666600666666009999990000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008080800000000000000000000000
      0000000000000000000000000000000000000000FF000000FF00C2A6A400C2A6
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
      0000000000000000000000000000000000000000000000000000000000000157
      0300015703000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000015703001FA0
      350023A536000157030000000000000000000000000000000000CA680000CA68
      0000CA680000CA680000CA680000CA680000CA680000CA680000CA680000CA68
      0000CA680000CA68000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000001570300168B230041E0
      730035D15D0010861600015703000000000000000000CA680000FFF4E700FFE7
      CF00FFE5C900FFE2C200FFE0BD00FFDDB600FFDAB100FFD7AD00FFD5A900FFD4
      A5000527FF00FFD9B100CA680000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000015703000E7813003CD56A002FC6
      550022B63F0016AA2900056D00000157030000000000CA680000FFEEDE003F3F
      3F003F3F3F00FEDDBA003F3F3F003F3F3F003F3F3F003F3F3F00FFD0A0000527
      FF000527FF000527FF00CA680000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000157030001570300015703001FAF
      370013A1230001570300015703000157030000000000CA680000FFF2E5003F3F
      3F00FFE3C600FEE0C000FEDDBA00FEDAB400FED8AF00FED5A900FFD3A400FED0
      A0000527FF00FFD4A600CA680000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000157030011A0
      2200088E0C0001570300000000000000000000000000CA680000FFF6EB00FEEA
      D100FEE6CB00D1987400983D1600A0472000C1784E0090310C00E3AB7E00FED3
      A500FED0A100FFD7AA00CA680000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000015703000793
      11000378040001570300000000000000000000000000CA680000FFFAF2003F3F
      3F00FFE9D100A0492300DAA68300FFE1C000C1795000A0471F00FED8B000FED5
      AA003F3F3F00FFD8AD00CA680000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008E5D59008E5D59008E5D59008E5D
      59008E5D59008E5D59008E5D59008E5D59008E5D59008E5D5900015703000698
      0F000157030000000000000000000000000000000000CA680000FFFCF8003F3F
      3F00FEEDD900D39C7A0091330E00C17D5600C17B5300A0472000FEDCB500FED9
      AF003F3F3F00FFDAB400CA680000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000096655C00FCF7EE00FCF4E900FAF2
      E300FAEEDC00F8EBD500F7E7CF00F6E3C700F6E0C10005730A00047F0A000157
      030080504B0000000000000000000000000000000000CA680000FFFFFE003F3F
      3F00FFEFE000EDCCB400E5BA9E00DAA98800C17D5600A0482100FFDEBB00FEDC
      B5003F3F3F00FFDDBA00CA680000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A36F6200FCFBF600FEF8F000FCF4
      EB00FBF2E500FAEFDE00F8EDD80001570300015703000157030001570300F2DA
      B60080504B0000000000000000000000000000000000CA680000FFFFFF003F3F
      3F00FFF3E500E5BFA600A04B2600DCAB8C00B8704A00B0633B00FFE2C200FEDE
      BB003F3F3F00FFE0C000CA680000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B17D6700FFFEFB00FEFBF700D5AC
      9700811E0000D4AA8F00FAF0E100FAEEDA00811E0000F6E6CC00F4E3C700F4E0
      C00080504B0000000000000000000000000000000000CA680000FFFFFF00FFF8
      F000FFF4EB00FFF2E500DAB09300C1815E00CA8E6B00FEE7CE00FFE5C700FEE1
      C200FFDEBB00FFE3C500CA680000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C1896B00FFFFFF00FEFEFC00811E
      0000FEFAF400811E0000FBF4E900FBF2E300811E0000F8EBD700F7E7CF00F6E3
      C90080504B0000000000000000000000000000000000CA680000FFFFFF003F3F
      3F00FFF7F000FFF4EB00FEF3E600FEF0E000FFEEDA00FFEAD500FEE7CE00FEE5
      C7003F3F3F00FFE6CB00CA680000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D1977000FFFFFF00FFFFFF00811E
      0000FEFCFA00811E0000FEF8F000811E0000811E0000FAF0E000F8EBD900F7E9
      D30080504B0000000000000000000000000000000000CA680000FFFFFF003F3F
      3F003F3F3F00FFF8F0003F3F3F003F3F3F003F3F3F003F3F3F00FEEBD4003F3F
      3F003F3F3F00FFEAD300CA680000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000DEA47600FFFFFF00FFFFFF00D7B0
      9E00811E0000D7AF9C00FEFBF700FCF8F300811E0000FBF3E900FAF0E100F8ED
      DC0080504B0000000000000000000000000000000000CA680000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFEFB00FFFBF400FFF7EF00FFF4
      E700FFF0E100FFF7EE00CA680000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E7AB7900FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFEFC00FFFCFA00FEFAF400FCF7F000FBF4EA00FBF2
      E50080504B000000000000000000000000000000000000000000CA680000CA68
      0000CA680000CA680000CA680000CA680000CA680000CA680000CA680000CA68
      0000CA680000CA68000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E7AB7900CF8E6800CF8E6800CF8E
      6800CF8E6800CF8E6800CF8E6800CF8E6800CF8E6800CF8E6800CF8E6800CF8E
      680080504B000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000002640600013C0300013C
      0300013C03000262060000000000000000000000000000000000000000000000
      000000000000B433070000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008E5D
      59008E5D59008E5D59008E5D59008E5D59008E5D59008E5D59008E5D59008E5D
      59008E5D59008E5D59008E5D59008E5D59000000000000000000000000000566
      9500056695000566950005669500056695000267060005870F00019808000097
      070003890A0002630700013C0300000000000000000000000000000000000000
      000005669500304B5000B4330700354141000566950005669500000000000000
      00000000000000000000000000000000000000000000BC4E0300BC4E0300BC4E
      0300BC4E0300BC4E0300BC4E0300BC4E0300BC4E0300BC4E0300BC4E0300BC4E
      0300BC4E0300BC4E0300BC4E0300000000000000000000000000000000009665
      5C00FCF7EE00FCF4E900FAF2E300FAEEDC00F8EBD500F7E7CF00F6E3C700F6E0
      C100F4DDBA00F2D9B200F2D5AC0080504B0000000000000000000274A90030C9
      E90012CBFE0020CEFE0054DEFF00117E2D000FA92D0007AB1D0083D88E0023B0
      2D00009C040003A60C0002660700026506000000000000000000000000000274
      A90030C9E90013CAFB0072462A00B4330700797666002CA7D300056695000000
      00000000000000000000000000000000000000000000BC4D0200FFFFFF00FFFF
      FF00FFFFFF0068BA5B00FFEACF00FFEACF00FFEACF00B47B4100726A1E00FFCF
      A000FFCFA000FFCFA000BC4C010000000000000000000000000000000000A36F
      6200FCFBF600FEF8F000FCF4EB00FBF2E500FAEFDE00F8EDD800F8E7D000F7E6
      CA00F6E1C400F4DEBD00F2DAB60080504B00000000000274A90073FAFE003FE3
      FE0012CBFE0020CEFE0054DEFF00098E140018B5480007A52700FFFFFF00FFFF
      FF0047BF5000009E0700039A0C000267060000000000000000000274A90073FA
      FE003FE3FE0013CAFB002DAFCC00863E1B00AC400600506664000386C1000566
      95000000000000000000000000000000000000000000BC4E0300FFFFFF00FFFF
      FF00FFFFFF0068BA5B00FFEACF00FFEBD300FFE9C5007D706D000E485F007368
      5B00D4AC8300FFCFA000BD4D020000000000000000000000000000000000B17D
      6700FFFEFB00FEFBF700D5AC9700811E0000D4AA8F00FAF0E100FAEEDA00811E
      0000F6E6CC00F4E3C700F4E0C00080504B00000000000274A90073FAFE003FE3
      FE0012CBFE0020CEFE0054DEFF00098E140025B85B000DAB3B00FFFFFF00FFFF
      FF00FFFFFF0034B63F0003AA0C000267060000000000000000000274A90073FA
      FE003FE3FE0013CAFB0020CEFE0067827A0093411800B43307003E4340000566
      95000000000000000000000000000000000000000000BA4C010070B7600067B6
      590067B65B003D9F2D0063AF4B0067AF4B0067AF48004E9941003C636F009F67
      6D005A4A360052773200BA4D010000000000000000000000000000000000C189
      6B00FFFFFF00FEFEFC00811E0000FEFAF400811E0000FBF4E900FBF2E300811E
      0000F8EBD700F7E7CF00F6E3C90080504B00000000000274A90073FAFE003FE3
      FE0012CBFE0020CEFE0054DEFF00098E140052CB82000DAB4000FFFFFF00FFFF
      FF0046C1620005A1180005AA11000267060000000000000000000274A90073FA
      FE003FE3FE0013CAFB0020CEFE0055D8F600874F3100B8663000A62902002D41
      48000000000000000000000000000000000000000000BC4D0200EDF3E500EDF7
      EB00EDF7EB0062B55500DAE5C400EDE6C900EDE0BB00E1D8A6005A7D3F00E595
      9A00A068690060483800C149000000000000000000000000000000000000D197
      7000FFFFFF00FFFFFF00811E0000FEFCFA00811E0000FEF8F000811E0000811E
      0000FAF0E000F8EBD900F7E9D30080504B00000000000274A9009FFBFE00A3F3
      FF00B6F2FF00DAF8FF00E5FAFF0020A73D0077D093004DC77B008FDDAC002CBA
      5A000EAB370011AF3300099D1C00046B0B0000000000000000000274A9009FFB
      FE00A3F3FF00B6F2FF00DAF8FF00E5FAFF00C5C2BA0093411800E7B47900A629
      02000000000000000000000000000000000000000000BC4D0200FFFFF800FCFC
      FF00F7F7FF0063B46000F0F4E100FFFCEE00FFF2E600FAE6C70067AC4700DE9D
      9A00D9939900B16462006B5B330000000000000000000000000000000000DEA4
      7600FFFFFF00FFFFFF00D7B09E00811E0000D7AF9C00FEFBF700FCF8F300811E
      0000FBF3E900FAF0E100F8EDDC0080504B00000000000274A900A7E9F3001CAA
      D3000791C5000788BC00108BBC00168F8000098E140084D79E0078D79E0050C9
      7E0041C5730018A938000B8420000000000000000000000000000274A900A7E9
      F3001CAAD3000791C5000788BC00B0410000B0410000AC400600CE8C5900FEE0
      A700A629020000000000000000000000000000000000C64E00008B8AF2004445
      EE003232E300222BC7006363F700A7BACE00A6D4880096C57B004EA739009FC4
      780084834F00758089000897C9000018A000000000000000000000000000E7AB
      7900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00093D8300FFFCFA00FEFA
      F400FCF7F000FBF4EA00FBF2E50080504B00000000000274A90031B5D3003FE3
      FE0012CBFE0020CEFE0054DEFF0074E0F80023A79E000E973800098E1400098E
      1400098E14000D862500000000000000000000000000000000000274A90031B5
      D3003FE3FE0013CAFB0020CEFE00B0410000BF734000FCD39600EEB77A00A92D
      0300A6290200A629020000000000000000000000000066479D004647CC009790
      B600A099B400A7A1C1005B59C1001B2BBB006E9D9A009ED387004DA73C00A0CE
      8C00AFC27D006EADA7000559E000040CA500000000000000000000000000093D
      8300093D8300CF8E6800CF8E6800CF8E6800CF8E6800093D8300CF8E6800CF8E
      6800CF8E6800CF8E6800CF8E680080504B00000000000274A90073FAFE003FE3
      FE0012CBFE0020CEFE0054DEFF0074E0F80030B0DA000386C100056695000000
      00000000000000000000000000000000000000000000000000000274A90073FA
      FE003FE3FE0013CAFB0020CEFE0054DEFF00B0410000BC693300F3B56A00DC8F
      4700A62902000000000000000000000000004141FA00545AF000D4D4C500FFEF
      AC00F4BF8100FBC78800FFFAD1006D6BBD005952FF00EDEDF2006DBA5900FFFC
      FF00FFEFDD00FFE5B8005D446C00000000000000000000000000093D83000A56
      BF00093D83000000000000000000000000000A4DAA00093D8300000000000000
      000000000000000000000000000000000000000000000274A90073FAFE003FE3
      FE0012CBFE0020CEFE0054DEFF0074E0F80030B0DA000386C100056695000000
      00000000000000000000000000000000000000000000000000000274A90073FA
      FE003FE3FE0013CAFB0020CEFE0054DEFF0074E0F800B0410000B2541700D877
      1D00C65D0C00A92D030000000000000000004141FA009F9ED700FFFFD400FEFC
      CA00FBF4C400F4D19600EEBB7D00D5C4B100393ACE00B4B8E90079C15B00FFF8
      F000FEEBD400FEE1BA00B0490A000000000000000000093D83000B64E000409C
      FF00093D8300093D8300093D8300093D83000A51B400093D8300000000000000
      000000000000000000000000000000000000000000000274A90073FAFE003FE3
      FE0012CBFE0020CEFE0054DEFF0074E0F80030B0DA000386C100056695000000
      00000000000000000000000000000000000000000000000000000274A90073FA
      FE003FE3FE0013CAFB0020CEFE0054DEFF0074E0F80030B0DA00B0410000B041
      0000B0410000A6290200A6290200000000004D4CF400AFBAE300FFFFF600FFFF
      D9008687750031343400544B3E00A39696004145D40092463700CE580100C756
      0200C7560200C75602000000000000000000093D83000C73FF004AA3FF002B8E
      FF001079FF000B6AEE000A5CCE000B5DD000093D830000000000000000000000
      000000000000000000000000000000000000000000000274A90078FBFE0068F6
      FF0054F6FF005FFEFF007FFEFF0089FBFE0048CFF200058BC700056695000000
      00000000000000000000000000000000000000000000000000000274A90078FB
      FE0068F6FF0055F6FE005FFEFF0078FBFE0089FBFE0048CFF200058BC7000566
      9500000000000000000000000000000000004545F800B2B2E000FFFFFF00FFFF
      F300D8D8B7005F605300B2976B00E7CBA900353EE5008E403000000000000000
      000000000000000000000000000000000000093D83000F78FF003696FF00167F
      FF000B6CF3000A5AC9000A4DAA00093D83000000000000000000000000000000
      000000000000000000000000000000000000000000000274A900FBFFFF00F0FF
      FF00C6FFFF00A0FFFF0098FFFF0098FFFF0093FFFF0057F7FE00056695000000
      00000000000000000000000000000000000000000000000000000274A900FBFF
      FF00F0FFFF00C6FFFF00A0FFFF009FFBFE009FFBFE0092FFFF0055F6FE000566
      9500000000000000000000000000000000004545F8007E79E300F8F4EB00FFFF
      FF00FFFFFF00F2F2DE00A7A17900938FB5002D30FF0000000000000000000000
      00000000000000000000000000000000000000000000093D83000B5DD0000C70
      FE00093D8300093D8300093D8300000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000479AF00EDFA
      FC00DCFFFF00B7FFFF0099FFFF0092FFFF0083FAFB00086B9A00000000000000
      0000000000000000000000000000000000000000000000000000000000000479
      AF00EDFAFC00DAF8FF00B7FFFF009FFBFE0089FBFE0083FAFB00086B9A000000
      000000000000000000000000000000000000000000004647FB00827FE000DDD8
      E500EAF4F000EEF3F600A6A5DC003839E9000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000093D83000A45
      9600093D83000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000274
      A9000274A9000274A9000274A9000274A9000274A90000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000274A9000274A9000274A9000274A9000274A9000274A900000000000000
      00000000000000000000000000000000000000000000000000003536FE00403E
      F0004A49E9003C3CED002828FA00000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000093D
      8300093D83000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000056695000566950005669500056695000566950005669500000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000056695000566950005669500056695000566950000008200000082000000
      0000000000000000820000008200000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C2A6A400C2A6
      A400C2A6A400C2A6A400C2A6A400C2A6A400C2A6A400C2A6A400C2A6A400C2A6
      A400C2A6A400C2A6A40000000000000000000000000000000000000000000274
      A90030C9E90012CBFE0020CEFE0054DEFF0074E0F80030B0DA000268A3000000
      0000000000000000000000000000000000000000000000000000000000000274
      A90030C9E90012CBFE0020CEFE0054DEFF00000082003A66FF00010EBF000000
      9D0000009D000115F6000013EA00000082000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C2A6A400FEFC
      FB00FEFCFB00FEFCFB00FEFCFB00FEFCFB00FEFCFB00FEFCFB00FEFCFB00FEFC
      FB00FEFCFB00C2A6A400000000000000000000000000000000000274A90073FA
      FE003FE3FE0012CBFE0020CEFE0054DEFF0074E0F80030B0DA000386C1000566
      95000000000000000000000000000000000000000000000000000274A90073FA
      FE003FE3FE0012CBFE0020CEFE0054DEFF00000082002C4FFF00204AFF00000C
      AA000112D7000320FF00010EBF00000082000000000000000000000000000070
      0000000000000000000000000000007000000070000000700000000000000000
      0000000000000000000000000000000000000000000000000000C2A6A400FEFC
      FB00FEFCFB00FEFCFB00FEFCFB00FEFCFB00FEFCFB00FEFCFB00FEFCFB00FEFC
      FB00FEFCFB00C2A6A400000000000000000000000000000000000274A90073FA
      FE003FE3FE0012CBFE0020CEFE0054DEFF0074E0F80030B0DA000386C1000566
      95000000000000000000000000000000000000000000000000000274A90073FA
      FE003FE3FE0012CBFE0020CEFE0054DEFF0074E0F800000082003153FF002351
      FF00031FFF00000DA40000008200000000000000000000000000000000000070
      0000047503000000000000700000000000000000000000000000007000000000
      0000000000000000000000000000000000000000000000000000C2A6A400FEFA
      F500FEFCFB00FEFAF500FEFAF500FEFCFB00FEFAF500FEFAF500FEFCFB00FEFA
      F500FEFAF500C2A6A400000000000000000000000000000000000274A90073FA
      FE003FE3FE0012CBFE0020CEFE0054DEFF0074E0F80030B0DA000386C1000566
      95000000000000000000000000000000000000000000000000000274A90073FA
      FE003FE3FE0012CBFE0020CEFE0054DEFF0074E0F800000082003153FF005790
      FF00204AFF00000CAA0000008200000000000000000000000000000000000070
      0000007000000070000000000000000000000000000000000000000000000070
      0000000000000000000000000000000000000000000000000000C2A6A400FEFA
      F500FEFAF500FEFAF500FEFAF500FEFAF500FEFAF500FEFAF500FEFAF500FEFA
      F500FEFAF500C2A6A400000000000000000000000000000000000274A90078FB
      FE0068F6FF0055F6FE005FFEFF0078FBFE0089FBFE0048CFF200058BC7000566
      95000000000000000000000000000000000000000000000000000274A90078FB
      FE0068F6FF0055F6FE005FFEFF0078FBFE00000082003153FF004579FF002842
      F3003153FF00204AFF000110B600000082000000000000000000000000000070
      0000007000000070000000700000000000000000000000000000000000000070
      0000000000000000000000000000000000000000000000000000C2A6A400FEF7
      F000FEF7F000FEF7F000FEF7F000FEF7F000FEF7F000FEF7F000FEF7F000FEF7
      F000FEF7F000C2A6A400000000000000000000000000000000000274A900A7E9
      F3001CAAD3000791C5000787BB00108BBC001F91BF001479AD0079C0DC000566
      95000000000000000000000000000000000000000000000000000274A900A7E9
      F3001CAAD3000791C5000787BB00108BBC0000008200699CFF003153FF000000
      8200000082002E51FF00204AFF00000082000000000000000000000000000070
      0000007000000070000000700000007000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C2A6A400FEF7
      F000FEF7F000FEF7F000FEF7F000FEF3E900FEF7F000FEF7F000FEF3E900FEF7
      F000FEF7F000C2A6A400000000000000000000000000000000000274A90031B5
      D3003FE3FE0012CBFE0020CEFE0054DEFF0074E0F80030B0DA000268A3000368
      9A000000000000000000000000000000000000000000000000000274A90031B5
      D3003FE3FE0012CBFE0020CEFE0054DEFF0074E0F80000008200000082000368
      9A00000000000000820000008200000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C2A6A400FEF3
      E900FEF3E900FEF3E900FEF3E900FEF3E900FEF3E900FEF3E900FEF3E900FEF3
      E900FEF3E900C2A6A400000000000000000000000000000000000274A90073FA
      FE003FE3FE0012CBFE0020CEFE0054DEFF0074E0F80030B0DA000386C1000566
      95000000000000000000000000000000000000000000000000000274A90073FA
      FE003FE3FE0012CBFE0020CEFE0054DEFF0074E0F80030B0DA000386C1000566
      9500000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000007000000070000000700000007000000070
      0000000000000000000000000000000000000000000000000000C2A6A400FFF0
      E200FFF0E200FEF3E900FFEEDE00FEF3E900FFEEDE00FEF3E900FFEEDE00FEF3
      E900FFEEDE00C2A6A400000000000000000000000000000000000274A90073FA
      FE003FE3FE0012CBFE0020CEFE0054DEFF0074E0F80030B0DA000386C1000566
      95000000000000000000000000000000000000000000000000000274A90073FA
      FE003FE3FE0012CBFE0020CEFE0054DEFF0074E0F80030B0DA000386C1000566
      9500000000000000000000000000000000000000000000000000000000000070
      0000000000000000000000000000000000000070000000700000007000000070
      0000000000000000000000000000000000000000000000000000C2A6A400FEF3
      E900FFEEDE00FFF0E200FEF3E900FFEEDE00FFF0E200DDCFC200DDCFC200DDCF
      C200DDCFC200C2A6A400000000000000000000000000000000000274A90073FA
      FE003FE3FE0012CBFE0020CEFE0054DEFF0074E0F80030B0DA000386C1000566
      95000000000000000000000000000000000000000000000000000274A90073FA
      FE003FE3FE0012CBFE0020CEFE0054DEFF0074E0F80030B0DA000386C1000566
      9500000000000000000000000000000000000000000000000000000000000070
      0000000000000000000000000000000000000000000000700000007000000070
      0000000000000000000000000000000000000000000000000000C2A6A400FFEE
      DE00FFEEDE00FFEEDE00FFEEDE00FFEEDE00FFEEDE00C3B4A800C3B4A800C3B4
      A800C3B4A800C2A6A400000000000000000000000000000000000274A90078FB
      FE0068F6FF0055F6FE005FFEFF0078FBFE0089FBFE0048CFF200058BC7000566
      95000000000000000000000000000000000000000000000000000274A90078FB
      FE0068F6FF0055F6FE005FFEFF0078FBFE0089FBFE0048CFF200058BC7000566
      9500000000000000000000000000000000000000000000000000000000000000
      0000007000000000000000000000000000000070000000000000047503000070
      0000000000000000000000000000000000000000000000000000C2A6A400FFEE
      DE00FFEAD700FFEEDE00FFEAD700FFEAD700FFEEDE00B0A29600B0A29600B0A2
      9600B0A29600C2A6A400000000000000000000000000000000000274A900FBFF
      FF00F0FFFF00C6FFFF00A0FFFF0098FFFF0098FFFF0092FFFF0055F6FE000566
      95000000000000000000000000000000000000000000000000000274A900FBFF
      FF00F0FFFF00C6FFFF00A0FFFF0098FFFF0098FFFF0092FFFF0055F6FE000566
      9500000000000000000000000000000000000000000000000000000000000000
      0000000000000070000000700000007000000000000000000000000000000070
      0000000000000000000000000000000000000000000000000000C2A6A400FFEA
      D700FFEAD700FFEAD700FFEAD700FFEAD700C9B9AC00FEFAF500FEF7F000E6DA
      D900C2A6A4000000000000000000000000000000000000000000000000000479
      AF00EDFAFC00DCFFFF00B7FFFF0098FFFF0092FFFF0083FAFB00086B9A000000
      0000000000000000000000000000000000000000000000000000000000000479
      AF00EDFAFC00DCFFFF00B7FFFF0098FFFF0092FFFF0083FAFB00086B9A000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C2A6A400FFEA
      D700FFE6D000FFEAD700FFE6D000FFEAD700C5B5A900FEFAF500DDCFC200C2A6
      A400000000000000000000000000000000000000000000000000000000000000
      00000274A9000274A9000274A9000274A9000274A9000274A900000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000274A9000274A9000274A9000274A9000274A9000274A900000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C2A6A400FFE6
      D000FFE6D000FFE6D000FFE6D000FFE6D000C9B9AC00DDCFC200C2A6A4000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C2A6A400C2A6
      A400C2A6A400C2A6A400C2A6A400C2A6A400C2A6A400C2A6A400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000020A1C9002CAACF001082AC00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000A3666800A3666800A3666800A3666800A467
      6900A4676900A4676900A4676900A46769000000000000000000000000000000
      0000000000008F8E8D009D9C9B009D9C9B000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000DFBCAD00CCB6AD00C4ABA200D5B2A400000000000000
      0000000000000000000000000000000000000000000000000000000000002BA3
      C90024A5CC000F84AE00149AC30024AED60033B1D500188BB4001787AF0043AB
      CC003DA8CB000000000000000000000000000000000000000000000000000000
      00000000000000000000000000009F646600F7E5C600F2D9B100EED1A100EECC
      9300F0C78700EFC58000F7D08300A46769000000000000000000000000000000
      0000918F8F00BDBCBC00EBEBEB00D2D2D1009D9C9B009D9C9B009D9C9B000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000E1BCAC00D9CDCA00C7CACE00B2B0B400B3A39D00E1BCAC000000
      00000000000000000000000000000000000000000000000000000000000032A5
      C90037B8DC0014AED90011A1CB001DC7F00048D7F80034A6CA005CC1DD0067C4
      DE003FA4C6000000000000000000000000000000000000000000000000000000
      00000000000000000000000000008E595B00D8CAB700D3C0A700D1B89A00DCBD
      9700E6C29200E7BF8400F0C68100A46769000000000000000000000000009796
      9500C4C4C400FFFFFF00FAFAFA00EDEDED00F2EDEA008DB2C500116895003F73
      8E007F8B8F009D9C9B0000000000000000000000000000000000000000000000
      0000E1C0AF00E8DCD900E3E5E800D0A79600C49B8A00B4AFB100B4A49F00D4B2
      A3000000000000000000000000000000000000000000208CB4002C98BD004EB5
      D50085DBEF0051C0DE0039C8EC001ED7FF003ADBFF005FD4F10075C6DF00B0E1
      EC0090CEE1001B8BB50000000000000000000000000000000000000000000000
      000000000000000000000000000076575100A19C93009E928400A0917F00C0A9
      8C00DABC9500E6C19000F0C98700A4676900000000000000000099989700D1D0
      D000FFFFFF00FFFFFF00FBFBFB00F0F0F000F7F1EE0091B6C900006298000060
      980088ADBE00C7C3C1009D9C9B0079797800000000000000000000000000E1BC
      AC00EFE6E200F5FEFF00D3957800BA3C0800BC3D0A00C27F6300B6B3B600B2A1
      9E00E1BCAC000000000000000000000000000000000060BAD70048B0D20053BE
      E00095EDFF008DEFFF005AE5FF0027DAFF001CD8FF0052E2FF0079E8FF007DEB
      FF003FCBEE0031B1D9002CA4CE00000000000000000000000000000000000000
      00000000000000000000005CFF0056413B006B696800005CFF00736A5F009688
      7600C0A98C00DDBD9600EECC9300A4676900000000009D9C9B00E0E0E000FFFF
      FF00FFFFFF00FFFFFF00FDFDFD00F6F6F600FDF7F40096BBCE00006398000061
      970091B2C200DBD8D600C3C3C300777776000000000000000000E1BCAC00F3E8
      E200FEFFFF00D99E8400C55C2E00E5B39A00E5B29900C85D2E00C1795A00B5B2
      B600B2A29E00D3B1A2000000000000000000000000001391C00022A6D7004EC3
      EA0081DFF70092EFFF0071D3E8005CB8CC0050B2C9002AC7EB0007D1FF0004CF
      FE0009D0FE0008C9F5000EB4E10000000000A5686A00A6696A00A4686900A066
      67008F5B5B006D454500005CFF00005CFF00005CFF00005CFF005B5652007269
      5F00A0927F00D1B69800F2D3A300A3666800000000009D9C9B00FDFDFD00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FCFCFC00FFFEFB009ABFD200006398000060
      970095B6C700DEDBDA00C4C4C3007777760000000000E1BCAC00F5E9E500FFFF
      FF00DFA58B00BA421000BF502000F8EBE400F7E8E000BF502000BE461300C27C
      5E00B6B2B500B2A19E00E1BCAC0000000000000000001C8EB80028ADDE003FBB
      E7006DD7F60091C7D3009796960097969600979696009796960045BCD80002D2
      FF0014D3FE001ED2FB000C9ECB0000000000A4676900FCE6C100EECFA600E7C5
      9600005CFF00005CFF00005CFF00005CFF00005CFF00005CFF00005CFF00005C
      FF009F928400DAC9AD00EAD8B200A3666800000000009D9C9B00FFFEFE00FFFF
      FF00B3C2CC00819CAE00D2DBE000FFFFFF00FFFFFF0097BFD30000599200005A
      920097BACA00E5E2E100C8C8C9007A787600E1BCAB00F5E8E300FFFFFF00E8B9
      9F00C4552000C14F1F00C0501F00F5E1D800F4DED400BF4C1D00BE4A1B00BF46
      1300C1795A00B4ADB000AE9F9C00D4B2A200000000001E92BC0027ADDF0031B4
      E3005ACFF40097969600E9E3E200B2B3B300ACA2A200E1B7B5009796960059DC
      FA009CF0FF00B5EFFC003D9BBD0000000000A5686A00FEEED300F0D5B500EACB
      A300CEAD8300005CFF00005CFF005541330077777700005CFF00005CFF006B69
      6700A19990008C5B51009D665B00A3666800000000009D9C9B00EBEDEE006A8C
      A000015B8800005B8E00195D8200CBD5DA00FFFFFF00E1ECF20094BCD2005495
      B700ADC7D400E9E7E600D7D3D10054656E00E7C9BC00FFFFFF00F6E2D200D378
      3E00CE6F3800CA653000C65C2A00F6E4DA00F4DFD500BF4D1E00BE4B1C00BF4E
      1E00BF441200C4978400B3B2B500C2AAA20000000000148CB8001F9DCD0027AC
      DD0047C5EF0097969600E9E2E000B1B2B200ACA2A200DCB5B400979696007CE4
      FB00ACECF9008ACBE00048A5C40000000000A7756B00FFF7E300F3DDC400EAD1
      B100D0B59100005CFF00005CFF005441320060606000005CFF00005CFF007676
      7600A4A19F008C5B5100DA904400BD724700000000009D9C9B002A628300006D
      A0000097CC000092C60000679E001B5A7E00CCD5DA00FFFFFF00FFFFFF00F9F8
      F700EEEEEF00F2F0EF00CFCFCF0029536900E7C9BC00FFFFFF00F8E6D700DD8F
      5000D8834800D3784000CE6F3800F8EAE100F5E3D900C0512000BE4B1B00BE4B
      1C00BD471500D0AC9E00C8CACE00CFB6AD0000000000000000000E80AA0020A2
      D30036BCEB0097969600E9E2E000B1B2B200ACA2A200DDB6B4009796960065E1
      FD0068CAE6000579A4000000000000000000A7756B00FFFEF700F7E7D400EFD9
      C100005CFF00005CFF00005CFF00005CFF00005CFF00005CFF00005CFF00005C
      FF00C0BABA0095605600C58460000000000000000000126287000086BB00009D
      D0000097CA000095C800008DC10000669A001A587900CBD5DA00FFFFFF00FDFD
      FD00FFFFFF00C5CDD1002F64800000528000E1BCAB00F5E8E200FFFFFF00F3D7
      BA00DF955500D9894A00DD946100F5DECD00EDC9B300C8602D00C1511F00BC46
      1400D69F8700E3E8EB00DACBC600DFBAA9000000000000000000000000001389
      B4000D8FBE0097969600ECE5E200B1B2B200ACA2A200E0B8B600979696001E9A
      C1002293BA00000000000000000000000000BC826800FFFFFF00FBEFE500F6E5
      D300EED9C000DDC4A600005CFF00005CFF00005CFF00005CFF00D1926D00D192
      6D00D1926D009D665B00000000000000000000000000006EA200009FD3000099
      CC000097CA000094C7000091C400008BBE00006499001B577A00CED7DC00FFFF
      FF0099ACB8000B4B6E00005A8D000000000000000000E1BCAC00F3E5DF00FFFF
      FF00F6DEC300E4A16000DF965800E1A07000DB926300CE6F3700CA622B00E0AF
      9700F4FEFF00E7DAD500E1BCAC00000000000000000000000000000000000000
      00000000000097969600E5E3E200AEAFAF00ABA1A100D8B6B600979696000000
      000000000000000000000000000000000000BC826800FFFFFF00FFFBF700FAF0
      E500F6E5D100EFD9C000005CFF00CFB692008C585A00005CFF00000000000000
      00000000000000000000000000000000000000000000006EA200008FC300009B
      CE000097CA000094C7000090C300008DC0000087BB0000669A00215E7F005B7C
      8E00004870000063970000000000000000000000000000000000E0BAA900F2E5
      DE00FFFFFF00F8E0C600E7A86500FBEFE300F9E7DB00D57E4000E8B79A00FEFF
      FF00EEE4E000E0BCAC0000000000000000000000000000000000000000000000
      00000000000097969600B2B2B200A0A0A00099969600ABA0A000979696000000
      000000000000000000000000000000000000D1926D00FFFFFF00FFFFFF00FEFB
      F700FBEFE500F7E5D100A1695D00A0685C009E63650000000000000000000000
      0000000000000000000000000000000000000000000000000000006DA1000095
      C8000098CB000094C7000190C3000B96CA001FA9DF000084B80000679A00004E
      7C0000659900000000000000000000000000000000000000000000000000E1BC
      AC00F2E3DB00FFFFFF00F8E4CA00F4D2A500EFC19200F0CBA900FFFFFF00F4E9
      E300E1BCAC000000000000000000000000000000000000000000000000000000
      00000000000097969600E1E0E000C6C7C700A5A3A300B3A5A500979696000000
      000000000000000000000000000000000000DA9D7500FFFFFF00FFFFFF00FFFF
      FF00FFFEFC00E5D3CC00A56B5F00CF834300AF6A540000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000075
      A9000092C5000096C9000291C4001FA9DE001FA9DF000087BB000071A5000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000E0B9A700F2E2DB00FFFFFF00FBEFDD00F8E7D300FFFFFF00F7EBE600E1BF
      AE00000000000000000000000000000000000000000000000000000000000000
      00000000000097969600E5E4E400EAE9E900BCBCBC00A39E9E00979696000000
      000000000000000000000000000000000000E7AB7900FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00E1D5D900A56B5F00D48E5A000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000073A600008FC2000294C8000073A600058AB8000081B3000073A6000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000E1BCAC00F2E2DA00FFFFFF00FFFFFF00F6ECE700E1BCAC000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000097969600979696009796960097969600000000000000
      000000000000000000000000000000000000E7AB7900D1926D00D1926D00D192
      6D00D1926D00D1926D00A56B5F00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000074A7000073A600000000000073A6000073A600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000E1BCAB00E7C9BC00E7C9BC00E1BCAB00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000D6820000D682
      0000D6820000D6820000D6820000D6820000D6820000D6820000D6820000D682
      0000D6820000D6820000000000000000000000000000811E0000811E00000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000993300009933000000000000993300009933
      0000000000000000000000000000000000000000000000000000D6820000D682
      0000D6820000D6820000D6820000D6820000D6820000D6820000D6820000D682
      0000D6820000D6820000000000000000000000000000D6820000FFEEDA00FFEB
      D500FEE9CF00FEE6CB00FEE3C500FEE2C100FEDFBC00FFDDB800FEDBB400FEDA
      B100FED8AE00FED7AB00D682000000000000000000000000000000000000811E
      0000000000000969100009691000096910000969100009691000096910000969
      1000096910000969100009691000000000000000000000000000000000000000
      0000000000000000000000000000993300009933000000000000993300009933
      00000000000000000000000000000000000000000000D6820000FFEEDA00FFEB
      D500FEE9CF00FEE6CB00FEE3C500FEE2C100FEDFBC00FFDDB800FEDBB400FEDA
      B100FED8AE00FED7AB00D68200000000000000000000D6820000FFF0E000FEED
      DA00FFEBD500FEE9D000FEE6CA00FEE4C500FEE2C100FEDFBD00FEDDB800FEDB
      B400FEDAB100FED8AD00D6820000000000000000000000000000811E00000000
      0000000000000969100009691000096910000969100009691000096910000969
      1000096910000969100009691000000000000000000000000000000000000000
      0000000000000000000000000000993300009933000000000000993300009933
      00000000000000000000000000000000000000000000D6820000FFF0E000FEED
      DA00FFEBD500FEE9D000FEE6CA00FEE4C500FEE2C100FEDFBD00FEDDB800FEDB
      B400FEDAB100FED8AD00D68200000000000000000000D6820000FFF2E4000099
      0000009900000099000000990000009900000099000000990000009900000099
      000000990000FED9B000D68200000000000000000000811E0000811E0000811E
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000993300009933000000000000993300009933
      00000000000000000000000000000000000000000000D6820000FFF2E4000099
      0000009900000099000000990000FFE6CA00FEE4C60000990000009900000099
      000000990000FED9B000D68200000000000000000000D6820000FEF5EA00FEF2
      E500FEF0DF00FFEEDA00FFEBD500FEE9CF00FEE6CB00FEE3C600FEE1C000FEDF
      BC00FEDDB800FEDBB400D6820000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000993300009933000000000000993300009933
      00000000000000000000000000000000000000000000D6820000FEF5EA00FEF2
      E500FEF0DF00FFEEDA00FFEBD500FEE9CF00FEE6CB00FEE3C600FEE1C000FEDF
      BC00FEDDB800FEDBB400D68200000000000000000000D6820000FFF7EE000099
      0000009900000099000000990000009900000099000000990000009900000099
      000000990000FEDDB800D68200000000000000000000811E0000811E0000811E
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000993303009A340200993300009832000000000000993300009933
      00000000000000000000000000000000000000000000D6820000FFF7EE000099
      0000009900000099000000990000FEEBD500FEE9D00000990000009900000099
      000000990000FEDDB800D68200000000000000000000D6820000FFF9F200FFF7
      EE00FEF5E900FFF3E500FFF0E000FFEEDB00FFEBD500FFE8D000FEE6CA00FEE4
      C600FFE1C000FEDFBC00D6820000000000000000000000000000811E00000000
      0000000000000969100009691000096910000969100009691000096910000969
      1000096910000969100009691000000000000000000000000000000000009F3A
      0700A8430700BA570700C561040099330000952F000000000000993300009933
      00000000000000000000000000000000000000000000D6820000FFF9F200FFF7
      EE00FEF5E900FFF3E500FFF0E000FFEEDB00FFEBD500FFE8D000FEE6CA00FEE4
      C600FFE1C000FEDFBC00D68200000000000000000000D6820000FFFBF7000099
      0000009900000099000000990000009900000099000000990000009900000099
      000000990000FEE1C000D6820000000000000000000000000000000000008E1B
      0000000000000969100009691000096910000969100009691000096910000969
      100009691000096910000969100000000000000000000000000000000000B14F
      0C00D7791600DB7A1100DB790C0099330000942D000000000000993300009933
      00000000000000000000000000000000000000000000D6820000FFFBF7000099
      0000009900000099000000990000FEF0E000FFEEDA0000990000009900000099
      000000990000FEE1C000D68200000000000000000000D6820000FFFCFA00FFFB
      F600FFF9F300FFF7ED00FEF4E900FFF2E400FFF0E000FEEEDB00FEEBD500FEE8
      CF00FEE6CB00FEE4C600D68200000000000000000000811E0000811E00000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000A13A0400D277
      1D00E8902600DD811D00E184190099330000932C000000000000993300009933
      00000000000000000000000000000000000000000000D6820000FFFCFA00FFFB
      F600FFF9F300FFF7ED00FEF4E900FFF2E400FFF0E000FEEEDB00FEEBD500FEE8
      CF00FEE6CB00FEE4C600D68200000000000000000000D6820000FFFDFC000099
      0000009900000099000000990000009900000099000000990000009900000099
      000000990000FFE6CA00D6820000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000A53F0700E18A
      2C00EE983100E58C2900E990260099330000932B000000000000993300009933
      00000000000000000000000000000000000000000000D6820000FFFDFC000099
      0000009900000099000000990000FFF5E900FFF3E50000990000009900000099
      000000990000FFE6CA00D68200000000000000000000D6820000FFFFFF00FFFE
      FD00FFFDF900FFFBF600FFF9F200FFF7EE00FFF5E900FFF3E500FFEFE000FEEE
      DB00FEEBD500FEE8D000D6820000000000000000000000000000811E00000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000A33E0700E18D
      3300F9A94000EC983400F19D330099330000922A000000000000993300009933
      00000000000000000000000000000000000000000000D6820000FFFFFF00FFFE
      FD00FFFDF900FFFBF600FFF9F200FFF7EE00FFF5E900FFF3E500FFEFE000FEEE
      DB00FEEBD500FEE8D000D68200000000000000000000D6820000FFFFFF000099
      0000009900000099000000990000009900000099000000990000009900000099
      000000990000FFEBD500D6820000000000000000000000000000811E00000000
      0000000000000969100009691000096910000969100009691000096910000969
      100009691000096910000969100000000000000000000000000000000000C66B
      2200FEB34C00FBAE4700FCAF4300993300009029000000000000993300009933
      00000000000000000000000000000000000000000000D6820000FFFFFF000099
      0000009900000099000000990000FEF9F200FEF7ED0000990000009900000099
      000000990000FFEBD500D68200000000000000000000D6820000FFFFFF00FFFF
      FF00FFFFFF00FFFDFD00FFFDF900FFFBF600FFF9F200FFF7EE00FFF5E900FFF3
      E500FFF0DF00FEEEDA00D68200000000000000000000811E0000811E00000000
      0000000000000969100009691000096910000969100009691000096910000969
      1000096910000969100009691000000000000000000000000000000000009933
      0000C2682100E99A3F00F4AE4900993300009933000099330000993300009933
      00009933000099330000000000000000000000000000D6820000FFFFFF00FFFF
      FF00FFFFFF00FFFDFD00FFFDF900FFFBF600FFF9F200FFF7EE00FFF5E900FFF3
      E500FFF0DF00FEEEDA00D6820000000000000000000000000000D6820000D682
      0000D6820000D6820000D6820000D6820000D6820000D6820000D6820000D682
      0000D6820000D682000000000000000000000000000000000000811E00000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000009933000099330000993300009933000099330000993300009933
      0000993300009933000000000000000000000000000000000000D6820000D682
      0000D6820000D6820000D6820000D6820000D6820000D6820000D6820000D682
      0000D6820000D682000000000000000000000000000000000000000000000000
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
      0000000000000000000000000000000000000000000000000000056695000566
      9500056695000566950005669500000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000008750D000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000001B7D000000
      0000000000000000000000000000000000000000000000000000056695000566
      9500056695000566950005669500056695000000000000000000000000000000
      000000000000000000000000000000000000A4676900A4676900A4676900A467
      6900A4676900A4676900A4676900A4676900A46769000274A90046D3E9001CD9
      FF002EDAFF007AEDFF0023A4D300056695000000000000000000056695000566
      9500056695000566950005669500056695000000000000000000000000000875
      0D0008750D000000000000000000000000000000000000000000056695000566
      9500056695000566950005669500056695000000000000000000001B7D00001B
      7D0000000000000000000000000000000000000000000274A90030C9E90012CA
      FD0020CDFD0054DEFF0074E0F8002CA7D3000566950000000000000000000000
      000000000000000000000000000000000000B7918700FCEACE00F3DABC00F2D5
      B100F0D0A700EECB9E00EDC79300EDC28B00E9BD81000274A90064F5FE0012CE
      FE0021CFFF0069E1FB001DA4D60005669500000000000274A90030C9E90012CB
      FE0020CEFE0054DEFF0074E0F80030B0DA000268A3000000000008750D004FDC
      7B0008750D00000000000000000000000000000000000274A90030C9E90012CB
      FE0020CEFE0054DEFF0074E0F80030B0DA000268A30000000000001B7D00362C
      FF00001B7D000000000000000000000000000274A90073FAFE003FE3FE0012CA
      FD0020CDFD0051D7F60000008200000082000000820000008200000082000000
      820000008200000082000000820000000000B7938A00FEEFDA00F6E0C600F2DA
      BC00F2D5B200EFD0A900EECB9E00EDC79600EBC28C000274A900A3F7FC009EEA
      FB00BFEFFC00C9F2FB007FCFEA00056695000274A90073FAFE003FE3FE0012CB
      FE0020CEFE0054DEFF0074E0F80030B0DA000386C10008750D004FDC7B004CDA
      770008750D0008750D0008750D0008750D000274A90073FAFE003FE3FE0012CB
      FE0020CEFE0054DEFF0074E0F800001B7D00001B7D00001B7D00001B7D002F27
      FF00362CFF00001B7D0000000000000000000274A90073FAFE003FE3FE0012CA
      FD0020CDFD0051D7F600000082002753FF001641FF00072FFF000020FF000016
      F7000016F700000EE6000000820000000000BA978F00FFF4E500F7E5CF00F4E0
      C500F3DABB00F2D5B100F0D0A600EECB9E00EDC795000274A90062BDD7001B97
      C2001184B4002D96BD00499FC500056695000274A90073FAFE003FE3FE0012CB
      FE0020CEFE0054DEFF0074E0F80030B0DA0008750D004FDC7B004FDC7B0048D7
      710038CB590027BF410027BF410008750D000274A90073FAFE003FE3FE0012CB
      FE0020CEFE0054DEFF0074E0F800001B7D000016E6000016E600040FFF002420
      FF00362CFF00362CFF00001B7D00000000000274A90073FAFE003FE3FE0012CA
      FD0020CDFD0051D8F700000082002C59FF001D49FF000D36FF000020FF00001A
      FB000011ED000011ED000000820000000000C09E9500FFFBF000F8EADC00F6E3
      CF00F4E0C600F2D9BC00F2D5B100F0D0A900EDCB9E000274A9003BC2DA001ACA
      F3002DD5FE006ADCF3001B97C200056695000274A90073FAFE003FE3FE0012CB
      FE0020CEFE0054DEFF0074E0F80008750D004FDC7B004FDC7B004FDC7B0043D3
      690032C7510023BC3B0027BF410008750D000274A90073FAFE003FE3FE0012CB
      FE0020CEFE0054DEFF0074E0F800001B7D000016E6000018DF00000FF9001718
      FF00362CFF00362CFF00362CFF00001B7D000274A9009FFBFE00A3F3FF00B6F2
      FF00DAF8FF00E2F7FC0000008200000082000000820000008200000082000000
      820000008200000082000000820000000000C6A49A00FFFFFC00FAF0E600F8EA
      DA00F7E5CF00F4E0C500F2DABA00F2D5B100F0D0A7000274A90064F5FE0012CE
      FE0021CFFF006EE0FB001DA4D600056695000274A90078FBFE0068F6FF0055F6
      FE005FFEFF0078FBFE0089FBFE0048CFF20008750D004FDC7B004CDA76003ECF
      61002CC3480020BA370027BF410008750D000274A90078FBFE0068F6FF0055F6
      FE005FFEFF0078FBFE0089FBFE00001B7D000016E600001ADA000014EF000E14
      FF002D27FF00362CFF00001B7D00000000000274A900A7E9F3001CAAD3000791
      C5000787BB00108BBC001F91BF001479AD0079C0DC0005669500000000000000
      000000000000000000000000000000000000CBA99E00FFFFFF00FEF7F200FAEF
      E600F8EAD900F7E3CF00F6E0C500F2DABB00F2D4B1000373A60081FCFF0052FA
      FF0067FFFF0095FCFF0036C4EF00056695000274A900A7E9F3001CAAD3000791
      C5000787BB00108BBC001F91BF001479AD0079C0DC0008750D0048D7710037CB
      590008750D0008750D0008750D0008750D000274A900A7E9F3001CAAD3000791
      C5000787BB00108BBC001F91BF00001B7D00001B7D00001B7D00001B7D00030C
      FF002420FF00001B7D0000000000000000000274A90031B5D3003FE3FE0012CA
      FD0020CEFE0054DEFF0074E0F80030B0DA000268A30003689A00000000000000
      000000000000000000000000000000000000CFAC9F00FFFFFF00FFFEFC00FCF6
      F000FAEFE600F7EADA00F6E3CF00F4E0C500F3D9BB000274A900C2EBF400FEFE
      FE00CEFFFF00BDFFFF0088F8FB00056695000274A90031B5D3003FE3FE0012CB
      FE0020CEFE0054DEFF0074E0F80030B0DA000268A30003689A0008750D0032C7
      510008750D000000000000000000000000000274A90031B5D3003FE3FE0012CB
      FE0020CEFE0054DEFF0074E0F80030B0DA000268A30003689A00001B7D00000F
      F900001B7D000000000000000000000000000274A90073FAFE003FE3FE0012CA
      FD0020CEFE0054DEFF0074E0F80030B0DA000386C10005669500000000000000
      000000000000000000000000000000000000D4B0A100FFFFFF00FFFFFF00FFFE
      FC00FEF7F000FAEFE500F8EAD900F7E5CE00F6DEC400F3D9B8000274A9000274
      A9000274A9000274A9000274A900000000000274A90073FAFE003FE3FE0012CB
      FE0020CEFE0054DEFF0074E0F80030B0DA000386C10005669500000000000875
      0D0008750D000000000000000000000000000274A90073FAFE003FE3FE0012CB
      FE0020CEFE0054DEFF0074E0F80030B0DA000386C10005669500001B7D00001B
      7D00000000000000000000000000000000000274A90073FAFE003FE3FE0012CA
      FD0020CEFE0054DEFF0074E0F80030B0DA000386C10005669500000000000000
      000000000000000000000000000000000000D9B5A100FFFFFF00FFFFFF00FFFF
      FF00FFFEFC00FCF7F000FAEFE500F8E9D900F8E7D100FBEACE00DECEB400B6AA
      9300A46769000000000000000000000000000274A90073FAFE003FE3FE0012CB
      FE0020CEFE0054DEFF0074E0F80030B0DA000386C10005669500000000000000
      000008750D000000000000000000000000000274A90073FAFE003FE3FE0012CB
      FE0020CEFE0054DEFF0074E0F80030B0DA000386C10005669500001B7D000000
      0000000000000000000000000000000000000274A90073FAFE003FE3FE0012CA
      FD0020CEFE0054DEFF0074E0F80030B0DA000386C10005669500000000000000
      000000000000000000000000000000000000DDB7A400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFEFC00FCF6EF00FCF3E600EDD8C900B68A7B00A17B6F009C76
      6700A46769000000000000000000000000000274A90073FAFE003FE3FE0012CB
      FE0020CEFE0054DEFF0074E0F80030B0DA000386C10005669500000000000000
      0000000000000000000000000000000000000274A90073FAFE003FE3FE0012CB
      FE0020CEFE0054DEFF0074E0F80030B0DA000386C10005669500000000000000
      0000000000000000000000000000000000000274A90078FBFE0068F6FF0055F6
      FE005FFEFF0078FBFE0089FBFE0048CFF200058BC70005669500000000000000
      000000000000000000000000000000000000E2BCA500FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFEFB00FFFEF700DAC1BA00AD735B00E19E5500E68F
      3100B56D4D000000000000000000000000000274A90078FBFE0068F6FF0055F6
      FE005FFEFF0078FBFE0089FBFE0048CFF200058BC70005669500000000000000
      0000000000000000000000000000000000000274A90078FBFE0068F6FF0055F6
      FE005FFEFF0078FBFE0089FBFE0048CFF200058BC70005669500000000000000
      0000000000000000000000000000000000000274A900FBFFFF00F0FFFF00C6FF
      FF00A0FFFF009FFBFE009FFBFE0092FFFF0055F6FE0005669500000000000000
      000000000000000000000000000000000000E6BFA700FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00DCC7C500B8826500F8B55C00BF7A
      5C00000000000000000000000000000000000274A900FBFFFF00F0FFFF00C6FF
      FF00A0FFFF0098FFFF0098FFFF0092FFFF0055F6FE0005669500000000000000
      0000000000000000000000000000000000000274A900FBFFFF00F0FFFF00C6FF
      FF00A0FFFF0098FFFF0098FFFF0092FFFF0055F6FE0005669500000000000000
      000000000000000000000000000000000000000000000479AF00EDFAFC00DCFF
      FF00B7FFFF009FFBFE0089FBFE0083FAFB00086B9A0000000000000000000000
      000000000000000000000000000000000000E4BCA400FBF4F000FBF4EF00FAF3
      EF00FAF3EF00F8F2EF00F7F2EF00F7F2EF00D8C2C000B77F6200C1836C000000
      000000000000000000000000000000000000000000000479AF00EDFAFC00DCFF
      FF00B7FFFF0098FFFF0092FFFF0083FAFB00086B9A0000000000000000000000
      000000000000000000000000000000000000000000000479AF00EDFAFC00DCFF
      FF00B7FFFF0098FFFF0092FFFF0083FAFB00086B9A0000000000000000000000
      00000000000000000000000000000000000000000000000000000274A9000274
      A9000274A9000274A9000274A9000274A9000000000000000000000000000000
      000000000000000000000000000000000000E8C4AD00EBCBB700EBCBB700EACB
      B700EACAB600EACAB600EACAB600EACAB600E3C2B100A56B5F00000000000000
      00000000000000000000000000000000000000000000000000000274A9000274
      A9000274A9000274A9000274A9000274A9000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000274A9000274
      A9000274A9000274A9000274A9000274A9000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000006600000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000066000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000035A0500035A0500035A
      0500035A05000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000006600000066000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000066000000660000000000000000000031AED90043B8DF0031B1DC0017A1
      D300000000000000000000000000000000000000000000000000000000000000
      0000CDB8B60068758B0000000000000000000000000000000000056695000566
      95000566950005669500056695000566950000000000035A0500089511000690
      0E00035A05000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000006600000066
      00004DD777002ABA430000660000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000066
      00004DD777002ABA430000660000006600003BB0DA00B9F2F90086F0FA0078E2
      F40065D4ED0053C8E70036B4DE001FA7D6001FA7D5000000000000000000CDB8
      B60072809B00238FE90056A7E40000000000000000000274A90030C9E90012CB
      FE0020CDFD0054DEFF0074E0F8002CA7D30005669500035A05000C9D19000A99
      1500035A05000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000066000058E0
      870058E087003CC95E0019AC2C00006600000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000066000058E0
      870058E087003CC95E0019AC2C00006600001AA3D400AEE5F300A2FFFF0098FD
      FF009AFCFF0097FBFF0092F6FF007FE8F90069D9F10056C9E7008EA7B4007680
      9900218AE1004CB5FF0042AFFE00000000000274A90073FAFE003FE3FE0012CB
      FE0020CDFD0051D7F600035A0500035A0500035A0500035A050011A624000DA0
      1C00035A0500035A0500035A0500035A05000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000006600000066
      000058E087004DD7760000660000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000066
      000058E087004DD77600006600000066000023ABD80074C9E600B3FEFF008EF9
      FF0091F8FF0090F5FD00A0E2E7009EE0E60094E9EF00A7CBCE006C82A000258A
      DF004AB4FF004AB2FC0000000000000000000274A90073FAFE003FE3FE0012CB
      FE0020CDFD0051D7F600035A050025C7470025C747001BB735001BB7350013AB
      270011A624000DA01C000A991500035A050000000000000000006E757C007F7A
      8800000000000000000000000000000000000000000000000000000000000000
      00000066000000660000000000000000000000000000000000006E757C007F7A
      8800000000000000000000000000000000000000000000000000000000000000
      0000006600000066000000000000000000003DB8DE0063CFEC00B3F3FA0092F8
      FC009EE1E400C9D6CB00E3CBB800DBC5B200C0AFA30099938C005B92C0004BB6
      FF0057BEFE002FB0DE0000000000000000000274A90073FAFE003FE3FE0012CB
      FE0020CDFD0051D8F700035A05002CD3550027CB4B0025C747001CBA38001BB7
      350017B02E0013AB270011A62400035A0500000000000000000059A3DC002D87
      D5009C8993000000000000000000000000000000000000000000000000000000
      000000660000000000000000000000000000000000000000000059A3DC002D87
      D5009C8993000000000000000000000000000000000000000000000000000000
      0000000000000066000000000000000000003EC0E600A2ACB5009FDAE900A2DC
      DD00D7C4BF00F9F4E500FFFFE100FFFFE200FBFAD200DAC1A300D1BBB60068CF
      FD0070DBFC005BCFEA0000000000000000000274A9009FFBFE00A3F3FF00B6F2
      FF00DAF8FF00E2F7FC00035A0500035A0500035A0500035A050027CB4B0025C7
      4700035A0500035A0500035A0500035A05000000000000000000000000004AB3
      FF002B84D100A18A920000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000004AB3
      FF002B84D100A18A920000000000000000000000000000000000000000000000
      0000000000000000000000000000000000003CC0E800BF8A850078CBE500C5B9
      B200F9F7F200FFFFFF00FFFFEA00FFFFDE00FFF9CF00FFECB800E1B49A0089DE
      F00074E0FC0082E9FA001DA6D500000000000274A900A7E9F3001CAAD3000791
      C5000788BC00108ABB001F91BF001479AD0079C0DC00035A05002CD3550029CF
      5200035A05000000000000000000000000000000000000000000000000000000
      000046B2FF002984D0009186900000000000A8787500D5B6A700D0A59F000000
      0000000000000000000000000000000000000000000000000000000000000000
      000046B2FF002984D0009186900000000000A8787500D5B6A700D0A59F000000
      0000000000000000000000000000000000003DC0E800C5908700B7DAE200D9C6
      B200FFFFEF00FFFFF600FFFFEF00FFFFE000F9E4BB00F8D59D00E8C8A700A7CE
      D4006EDDFC0096F6FF003FBCE100000000000274A90031B5D3003FE3FE0012CB
      FE0020CDFD0054DEFF0074E0F80030B0DA000268A300035A050034DE650030D9
      5E00035A05000000000000000000000000000000000000000000000000000000
      0000000000006AC1FF008F8B9000CAB09A00FEFDDA00FEFDD900FFFFEF00B48D
      8900000000000000000000000000000000000000000000000000000000000000
      0000000000006AC1FF008F8B9000CAB09A00FEFDDA00FEFDD900FFFFEF00B48D
      89000000000000000000000000000000000040C1E700CB978800FFF7F000DFCB
      B500FFFFE500FFFFE500FFFFE700FFFBD600F3CC9900F7CC9000EDD1AF00A9CE
      D1006ADDFC0095F7FF0071DFF300000000000274A90073FAFE003FE3FE0012CB
      FE0020CDFD0054DEFF0074E0F80030B0DA000385C000035A0500035A0500035A
      0500035A05000000000000000000000000000000000000000000000000000000
      000000000000A2ADC200EBC6A800FFF7CA00FFFFDE00FFFFE300FFFFF700FAF9
      E300C79C96000000000000000000000000000000000000000000000000000000
      000000000000A2ADC200EBC6A800FFF7CA00FFFFDE00FFFFE300FFFFF700FAF9
      E300C79C96000000000000000000000000003FC0E800D29F8A00FFFDFA00D6BC
      AE00FEFFD900FFFFD500FAE8BF00F4D4A300F6D6AB00FFF0C500DFC0AA00AFD5
      DD0093E7FE00B1FCFF00ABFAFF0039B5DD000274A90073FAFE003FE3FE0012CB
      FE0020CDFD0054DEFF0074E0F80030B0DA000385C00005669500000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C6978F00F4D7A800F9E0B300FFFFDD00FFFFEF00FFFFFE00FAF9
      E300C79C96000000000000000000000000000000000000000000000000000000
      000000000000C6978F00F4D7A800F9E0B300FFFFDD00FFFFEF00FFFFFE00FAF9
      E300C79C96000000000000000000000000003FC1E800D9A78C00FFFBF900E1D1
      CC00E4D2B200FDEBBA00FBD49A00FCDBA200FFF9E700EDE4D900A3B8BC0085D5
      EC007ACBE7007BCAE60086D1EA0041B5DC000274A90073FAFE003FE3FE0012CB
      FE0020CDFD0054DEFF0074E0F80030B0DA000385C00005669500000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000E4C9B200F6D6A400F2C69100FEFBD300FFFFE500FFFFE700FFFF
      DE00C6AC9A000000000000000000000000000000000000000000000000000000
      000000000000E4C9B200F6D6A400F2C69100FEFBD300FFFFE500FFFFE700FFFF
      DE00C6AC9A0000000000000000000000000046C3E900DFAE8E00FFFAF600FDFC
      FB00EBDCD500EED6B900EDD2AE00E8D0AD00D8C5B300C2A29F008EEDFA0087F1
      FE002AB1DC000000000000000000000000000274A90078FBFE0068F6FF0055F6
      FE005FFEFF0078FBFE0089FBFE0048CFF200058BC70005669500000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000CAA09800F6E2BA00F7D7AA00F5D6A600FCF0C900FFFFD800F8F5
      D100C8A298000000000000000000000000000000000000000000000000000000
      000000000000CAA09800F6E2BA00F7D7AA00F5D6A600FCF0C900FFFFD800F8F5
      D100C8A2980000000000000000000000000035B5E200E5B49000FFFCF800FFFF
      FF00FFFFFF00FFFFFE00FCF7F000C49B9200CD916400C2896E006BCEEB006BD1
      ED0031B1DB000000000000000000000000000274A900FBFFFF00F0FFFF00C6FF
      FF00A0FFFF009FFBFE009FFBFE0092FFFF0055F6FE0005669500000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000DCC4B400F8F6F200FBDDAC00F8D29B00FBE8B900BE9D
      8F00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000DCC4B400F8F6F200FBDDAC00F8D29B00FBE8B900BE9D
      8F000000000000000000000000000000000000000000E9B99100FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FAFBFD00C69E9300E9AE700000000000000000000000
      000000000000000000000000000000000000000000000479AF00EDFAFC00DAF8
      FF00B7FFFF009FFBFE0089FBFE0083FAFB00086B9A0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000CAAD9600DDBFA900DCB8A800CAAD96000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000CAAD9600DDBFA900DCB8A800CAAD96000000
      00000000000000000000000000000000000000000000EDBD9200DCA88700DCA8
      8700DCA88700DCA88700DCA88700C49689000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000274A9000274
      A9000274A9000274A9000274A9000274A9000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000A4787400A4787400A4787400A4787400A4787400A4787400A478
      7400A4787400A47874008C5D5C0000000000000000000000000000669A000066
      9A0000669A00A4787400A4787400A4787400A4787400A4787400A4787400A478
      7400A4787400A47874008C5D5C0000000000000000004A667C00BE9596000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A1300000000000000000
      0000A1300000000000000000000000000000006D0300006D0300000000000000
      0000993300009933000099330000000000000000000000000000000000000000
      000000000000A87C7500FEE5CB00FFE2C400FFDFBE00FFDCB800FFD9B100FED6
      AC00FFD4A600FFD1A2008C5D5C00000000000000000000669A003CBEE30036BA
      E10030B6DF00B7818300FCEDDD00FAF2E400F8F1E000F7EEDD00F7EEDB00F7ED
      DB00F7ECDA00F8EDD9008C5D5C00000000006B9CC3001E89E8004B7AA300C896
      9300000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A1300000000000000000
      0000A130000000000000006D0300006D0300006D030029BA4400006D03000000
      0000993300000000000000000000993300000000000000000000000000000000
      000000000000AD807800FFEAD400E5A65700E5A65700E5A65700E5A65700E5A6
      5700E5A65700FFD4A8008C5D5C00000000000000000000669A0045C4E6003FC0
      E40038BCE200B7818300F6E4DA00E4A85C00E4A75900E3A75900E3A75900E3A6
      5800E3A75900F0E3D0008C5D5C00000000004BB4FE0051B5FF002089E9004B7A
      A200C69592000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A1300000A1300000A130
      0000A130000000000000006D030058E0870058E087003CC95F001AAD2C00006D
      0300993300009933000099330000993300000000000000000000000000000000
      000000000000B4867A00FEEEDD00FFEBD600FFE8CF00FFE4C900FEE1C200FEDD
      BB00FFDBB500FFD8AF008C5D5C00000000000000000000669A004DC9E90047C4
      E70041C0E500B9848400F8E8DF00F9E4CE00F9DBBD00F9DBBD00F9DBBD00F8D9
      B800F5DDC200F0E4D2008C5D5C00000000000000000051B7FE0051B3FF001D87
      E6004E7AA000CA97920000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A1300000000000000000
      0000A130000000000000006D0300006D0300006D03004CD77600006D03000000
      000099330000000000000000000099330000A4787400A4787400A4787400A478
      7400A4787400BA8D7D00FEF2E500E5A65700E5A65700E5A65700E5A65700E5A6
      5700E5A65700FEDCB7008C5D5C00000000000000000000669A0056CDED0050C9
      EA004AC5E800BC878500F9EBE400E4A85C00E4A75800E4A75800E4A75800E4A6
      5700E3A75900F2E6D6008C5D5C0000000000000000000000000051B7FE004EB2
      FF001F89E6004E7BA200B9949700000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000A1300000A130
      000000000000000000000000000000000000006D0300006D0300000000000000
      000099330000993300009933000000000000A87C7500FEE5CB00FFE2C400FFDF
      BE00FFDCB800C2958100FEF6EC00FEF3E600FEEFE100FFEDDA00FEE9D400FEE6
      CC00FFE2C600FEDFBF008C5D5C00000000000000000000669A005ED2F00058CF
      ED0052CBEB00C08B8500FAEFE900FAEDDE00FAE5D000F9E5CF00F9E3CD00F8E1
      CA00F5E4D000F3E8DB008C5D5C000000000000000000000000000000000052B8
      FE004BB1FF002787D9005F6A760000000000B0857F00C09F9400C09F9600BC98
      8E00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000AD807800FFEAD400E5A65700E5A6
      5700E5A65700CA9B8300FFF9F300E5A65700E5A65700E5A65700E5A65700E5A6
      5700E5A65700FEE3C8008C5D5C00000000000000000000669A0066D7F30060D4
      F1005AD0EE00C4908600FCF4F000E5A95C00E5A65700E5A65700E4A65700E4A6
      5600E4A75A00F7EEE3008C5D5C00000000000000000000000000000000000000
      000055BDFF00B5D6ED00BF9D9200BB9B8C00E7DAC200FFFFE300FFFFE500FDFA
      DA00D8C3B300B58D850000000000000000000000000000000000000000004A66
      7C009C8993000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B4867A00FEEEDD00FFEBD600FFE8
      CF00FFE4C900D1A28600FEFBF900FEF9F400FEF7EF00FEF5EA00FEF1E400FEEE
      DE00FEEBD700FEE8D0008C5D5C00000000000000000000669A006DDBF60067D8
      F30062D4F200C8948800FEF7F400FEF7F000FBF0E500FBEFE300FAEDE000FAEE
      E100F9F0E500E8E3DD008C5D5C00000000000000000000000000000000000000
      00000000000000000000CEA79500FDEEBE00FFFFD800FFFFDA00FFFFDB00FFFF
      E600FFFFFB00EADDDC00AE837F00000000000000000000000000000000004AB3
      FF002B84D100A18A920000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BA8D7D00FEF2E500E5A65700E5A6
      5700E5A65700D8A98A00FEFEFD00FEFCFA00FEFAF600FEF8F100FEF5EC00EBDF
      DB00D3C2C000BAA9AA008C5D5C00000000000000000000669A0074DFF8006FDC
      F6006ADAF400CC998900FEF8F500FFFFFF00FEFFFE00FCFAF900FBFBF900B481
      7600B4817600B4817600B4817600000000000000000000000000000000000000
      00000000000000000000C1A09100FBDCA800FEF7D000FFFFDB00FFFFE300FFFF
      F800FFFFFD00FFFFFD00C6A99C00000000000000000000000000000000000000
      000046B2FF002984D0009186900000000000A8787500D5B6A700D0A59F000000
      000000000000000000000000000000000000C2958100FEF6EC00FEF3E600FEEF
      E100FFEDDA00DFB08D00FEFEFE00FEFEFE00FEFCFB00FEFBF700FEF8F200B481
      7600B4817600B4817600B17F7400000000000000000000669A007AE3FA0076E1
      F80070DDF600D09C8900FFFAF800FFFFFF00FFFFFF00FFFFFF00FFFFFF00B481
      7600E0A87000F7935B00FF00FE00000000000000000000000000000000000000
      000000000000C1A09100FEE3AC00F1C49100FCF2CA00FFFFDD00FFFFE400FFFF
      F700FFFFF700FFFFE900EEE5CB00B9948C000000000000000000000000000000
      0000000000006AC1FF008F8B9000CAB09A00FEFDDA00FEFDD900FFFFEF00B48D
      890000000000000000000000000000000000CA9B8300FFF9F300E5A65700E5A6
      5700E5A65700E4B58E00FEFEFE00FEFEFE00FEFEFE00FEFDFC00FEFBF800B481
      7600EBB56F00E49B420000000000000000000000000000669A007FE6FC007BE4
      FA0077E1F900D29F8A00DCA88700DCA88700DCA88700DCA88700DCA88700B481
      7600C7AF890000669A0000000000000000000000000000000000000000000000
      000000000000C2A19100FFE6AE00EEB58100F7DCAE00FEFDD800FFFFDF00FFFF
      E300FFFFE400FFFFE000F3ECD200BB968E000000000000000000000000000000
      000000000000A2ADC200EBC6A800FFF7CA00FFFFDE00FFFFE300FFFFF700FAF9
      E300C79C9600000000000000000000000000D1A28600FEFBF900FEF9F400FEF7
      EF00FEF5EA00E8B89000DCA88700DCA88700DCA88700DCA88700DCA88700B481
      7600F0B25E000000000000000000000000000000000000669A0083E8FE0080E6
      FC007DE5FC007DE5FC0078E2FA0072DFF8006BDAF50064D5F2005DD0EF0056CD
      ED0052CAEB0000669A0000000000000000000000000000000000000000000000
      000000000000BC978C00FBE7B700F4C79100F2C99400F8E5B900FEFCD800FFFF
      DD00FFFFDC00FFFFE000E2D2BA00B68E86000000000000000000000000000000
      000000000000C6978F00F4D7A800F9E0B300FFFFDD00FFFFEF00FFFFFE00FAF9
      E300C79C9600000000000000000000000000D8A98A00FEFEFD00FEFCFA00FEFA
      F600FEF8F100FEF5EC00EBDFDB00D3C2C000BAA9AA008C5D5C00000000000000
      0000000000000000000000000000000000000000000000669A0084E9FE0084E9
      FE007373730073737300737373007373730073737300737373007373730060D4
      F0005ACFEE0000669A0000000000000000000000000000000000000000000000
      00000000000000000000D9C3A900FFFEE500F7DCB800F2C99400F5D4A500FAE8
      BD00FDF4C900FDFBD600B6908900000000000000000000000000000000000000
      000000000000E4C9B200F6D6A400F2C69100FEFBD300FFFFE500FFFFE700FFFF
      DE00C6AC9A00000000000000000000000000DFB08D00FEFEFE00FEFEFE00FEFC
      FB00FEFBF700FEF8F200B4817600B4817600B4817600B17F7400000000000000
      0000000000000000000000000000000000000000000000669A0084E9FE0084E9
      FE0073737300CFC1BC00CFC1BB00CFC1BB00CFC1BB00CEBEB7007373730068D8
      F40062D4F10000669A0000000000000000000000000000000000000000000000
      00000000000000000000B58D8500E8DEDD00FFFEF200F9D8A300F4C48C00F9D4
      9F00FDEAB800D0B49F00B8908600000000000000000000000000000000000000
      000000000000CAA09800F6E2BA00F7D7AA00F5D6A600FCF0C900FFFFD800F8F5
      D100C8A29800000000000000000000000000E4B58E00FEFEFE00FEFEFE00FEFE
      FE00FEFDFC00FEFBF800B4817600EBB56F00E49B420000000000000000000000
      000000000000000000000000000000000000000000000000000000669A000066
      9A0073737300E2D8D300FAF9F800F9F8F700F9F8F700D0C5BF00737373000066
      9A0000669A000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000AD827F00C9AA9E00EFE0B700EFDFB200E7CE
      AC00B8908600B890860000000000000000000000000000000000000000000000
      00000000000000000000DCC4B400F8F6F200FBDDAC00F8D29B00FBE8B900BE9D
      8F0000000000000000000000000000000000E8B89000DCA88700DCA88700DCA8
      8700DCA88700DCA88700B4817600F0B25E000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000007373730073737300737373007373730073737300000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000BA968A00BB988C00B791
      8800000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000CAAD9600DDBFA900DCB8A800CAAD96000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000824B4B004E1E1F0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000007F40260081412500814125008141250081412500814125000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000007F40260081412500814125008141250081412500814125000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000A5420800A7440700A23F080000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000824B4B00824B4B00A64B4B00A94D4D004E1E1F0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008241
      250081412500CB660000CB660000CB660000CB660000CB660000CB6600008141
      2500814125000000000000000000000000000000000000000000000000008241
      250081412500CB660000CB660000CB660000CB660000CB660000CB6600008141
      2500814125000000000000000000000000000000000000000000000000000000
      000000000000A23F0800A5420800A23F0800A542080000000000000000000000
      0000000000000000000000000000000000000000000000000000824B4B00824B
      4B00B64F5000C24F5000C54D4E00B24D4E004E1E1F00824B4B00824B4B00824B
      4B00824B4B00824B4B00824B4B000000000000000000000000009B4E1800C562
      0300CA650000CA650000CA650000CA650000CA650000CB660000CB660000CB66
      0000C563030081412500000000000000000000000000000000009B4E1800C562
      0300CA650000CA650000CA650000CA650000CA650000CB660000CB660000CB66
      0000C56303008141250000000000000000000000000000000000000000000000
      000000000000A74407000000000000000000A23F0800A23F080000000000A23F
      0800A74407000000000000000000000000000000000000000000824B4B00D458
      5900CB555600C9545500C9525300B74F52004E1E1F00FE8B8C00FB9A9C00F8AA
      AB00F7B5B600F7B5B600824B4B000000000000000000994D1900C4620200C863
      0000C6610000C6610000C6610000C6610000C8630000C9640000CB660000CB66
      0000CB660000C5630300814125000000000000000000994D1900C4620200C863
      0000C6610000C6610000C6610000C6610000C8630000C9640000CB660000CB66
      0000CB660000C563030081412500000000000000000000000000000000000000
      000000000000A74407000000000000000000A23F080000000000A23F0800A23F
      0800A23F0800A542080000000000000000000000000000000000824B4B00D75C
      5D00D05A5B00CF595A00CF575800BD5356004E1E1F0023B54A0013C1480016BD
      48000CBC4100F7B5B600824B4B000000000000000000BB5D0600C6620100C460
      0200C25E0200BF5B0200CE833F00D6955A00D8975B00D68F4B00D0772000CB66
      0000CB660000CB660000824125000000000000000000BB5D0600C6620100C460
      0200C25E0200C76F2200D18A4B00D6955B00D8965A00D4883F00C9640000CB66
      0000CB660000CB66000082412500000000000000000000000000000000000000
      000000000000A5420800A23F0800A23F0800A23F080000000000A23F08000000
      000000000000A643070000000000000000000000000000000000824B4B00DD63
      6400D75F6000D55E5F00D55C5D00C2575A004E1E1F002AB44D001CBF4C001EBC
      4C0013BC4500F7B5B600824B4B0000000000A8541100C9670700C7680A00C568
      0900C2660800C1640500E7C3A000FEFEFE00FEFEFE00FEFEFE00FEFEFE00DB99
      5700CB660000CB660000CB6600007F402600A8541100C9670700C7680A00C568
      0900D69A5C00FEFEFE00FEFEFE00FEFEFE00FEFEFE00E7C29F00C6610000C964
      0000CB660000CB660000CB6600007F4026000000000000000000000000000000
      00000000000000000000A23F0800A7440700A5420800A23F0800A54208000000
      000000000000A23F080000000000000000000000000000000000824B4B00E368
      6900DD656600DA636400DE666700C6595B004E1E1F0026B1490016BC48001BBB
      490010BB4300F7B5B600824B4B0000000000AC570F00CD711400CA721800C872
      1A00C7711A00C56F1700C56F1800C6711C00C46E1A00C56D1E00E4B78D00FEFE
      FE00CA650000CB660000CB66000082412500AC570F00CD711400CA721800C872
      1A00FEFEFE00E5BF9800CA7C2C00C7732000C36B1600C05F0800C35E0000C863
      0000CA650000CB660000CB660000824125000000000000000000000000000000
      00000000000000000000000000009E410D00A14E2200A23F0800A7440700A542
      0800A5420800A23F080000000000000000000000000000000000824B4B00EB6D
      6E00E2676800E67E7F00FAD3D400CC6E70004E1E1F00A5D8970050D16F0042C9
      66002DC75800F7B5B600824B4B0000000000AB581200D4843400CF7F2E00CD7E
      2D00CD7F2F00CC7D2C00EACCAC00C6701900C2680C00BF600300C6691500FEFE
      FE00CA650000CB660000CB66000082412500AB581200D4843400CF7F2E00CD7E
      2D00FEFEFE00D0873C00CA782500C6701900C2680C00E6C3A000C15C0100C661
      0000CA650000CB660000CB660000824125000000000000000000000000000000
      0000000000000000000000000000957D75008D766C00A55E3900A23F0800A23F
      0800A23F08000000000000000000000000000000000000000000824B4B00F273
      7400E96C6D00EB818200FCD1D300CF6E70004E1E1F00FFF2CC00FFFFD700FFFF
      D400E6FCC700F7B5B600824B4B0000000000AC591500DEA26400D7934D00D38B
      4100D48D4400ECCFB100FEFEFE00CB7B2A00C6701900C3670B00D7985D00FEFE
      FE00CA650000CB660000CB66000082412500AC591500DEA26400D7934D00D38B
      4100FEFEFE00E2B48400D0853700CB7B2A00C6701900FEFEFE00E5BE9800C560
      0000CA650000CB660000CB660000824125000000000000000000000000000000
      000000000000000000008E7C7200AC928E008E7C72008E7C7200000000000000
      0000000000000000000000000000000000000000000000000000824B4B00F878
      7900F0757600EE727300F0737400D16566004E1E1F00FCEFC700FFFFD500FFFF
      D300FFFFD700F7B5B600824B4B0000000000AA571100E6B48200E3B17C00DA98
      5400F4E0CC00FEFEFE00FEFEFE00F8EEE300F3E1CF00F2DFCC00FEFEFE00E5B8
      8D00CA650000CB660000CB66000082412500AA571100E6B48200E3B17C00DA98
      5400EFD2B500FEFEFE00F5E6D700F4E4D300F7ECE100FEFEFE00FEFEFE00EDCF
      B200CA650000CB660000CB660000824125000000000000000000000000000000
      0000000000008E7C7200D3BDBD008E7C7200AD938F008E7C7200000000000000
      0000000000000000000000000000000000000000000000000000824B4B00FE7F
      8000F77A7B00F6797A00F7777900D76B6B004E1E1F00FCEFC700FFFFD500FFFF
      D300FFFFD500F7B5B600824B4B0000000000AA550E00E7B27D00F0D3B500E5B0
      7900F5E1CC00FEFEFE00FEFEFE00F4E2D000EBCBAB00E9C7A400DB9E6000C763
      0300CA650000CB660000CB6600007F402600AA550E00E7B27D00F0D3B500E5B0
      7900E3AA6F00EAC39A00F0D6BB00EDD0B300F2DFCB00FEFEFE00FEFEFE00EBC8
      A600CA650000CB660000CB6600007F4026000000000000000000000000000000
      00008E7C7200E9DEDE008E7C7200A9958F00D2BABA008E7C7200000000000000
      0000000000000000000000000000000000000000000000000000824B4B00FF83
      8400FC7F8000FB7E7F00FE7F8000DA6E6F004E1E1F00FCEFC700FFFFD500FFFF
      D300FFFFD500F7B5B600824B4B000000000000000000AF622100F3D9BF00F4D9
      BE00EABB8B00F2D8BD00FEFEFE00D58E4500D0823200CD772000CB6F1100CA66
      0400CA650000CB660000824125000000000000000000AF622100F3D9BF00F4D9
      BE00EABB8B00E3AA6F00DC9B5A00D58E4500D0823200FEFEFE00E7BD9200CA66
      0400CA650000CB66000082412500000000000000000000000000000000008E7C
      7200FCFAFA008E7C7200000000008E7C7200DFCECE008E7C7200000000000000
      0000000000000000000000000000000000000000000000000000824B4B00FF88
      8900FF828300FF818200FF828300E07374004E1E1F00FCEFC700FFFFD500FFFF
      D300FFFFD500F7B5B600824B4B000000000000000000AA550E00E9B78200F8E7
      D500F6DFC800E9BB8B00EFCFAE00D78F4500D3843300D07A2200CF741700CB68
      0800CB660000C56303007D3F27000000000000000000AA550E00E9B78200F8E7
      D500F6DFC800E9BB8B00DE9F5E00D78F4500D3843300E7BC9000CF741700CB68
      0800CB660000C56303007D3F2700000000000000000000000000000000008E7C
      72008E7C720000000000000000008E7C7200ECE2E2008E7C7200000000000000
      0000000000000000000000000000000000000000000000000000824B4B00824B
      4B00E2757600FE818200FF868700E57677004E1E1F00FAEBC500FCFBD100FCFB
      CF00FCFBD100F7B5B600824B4B00000000000000000000000000AB561000EBB9
      8600F6E0CA00F7E6D400F0D1B100E8B98A00E3AA7100DFA06000D98F4400CE71
      1100C56303008F481E0000000000000000000000000000000000AB561000EBB9
      8600F6E0CA00F7E6D400F0D1B100E8B98A00E3AA7100DFA06000D98F4400CE71
      1100C56303008F481E0000000000000000000000000000000000000000008E7C
      72000000000000000000000000008E7C7200F9F5F5008E7C7200000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000824B4B009C565700CB6C6D00CF6E6E004E1E1F00824B4B00824B4B00824B
      4B00824B4B00824B4B00824B4B0000000000000000000000000000000000AC57
      0F00B3672800ECBC8B00F0CBA600EECAA400EABC8E00E1A26300D47E2800B05C
      150089452100000000000000000000000000000000000000000000000000AC57
      0F00B3672800ECBC8B00F0CBA600EECAA400EABC8E00E1A26300D47E2800B05C
      1500894521000000000000000000000000000000000000000000000000000000
      00000000000000000000000000008E7C72008E7C720000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000824B4B00824B4B004E1E1F0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000AE591100B05D1700B2611D00B1601A00B05B14009C5019000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000AE591100B05D1700B2611D00B1601A00B05B14009C5019000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000008E7C72000000000000000000000000000000
      00000000000000000000000000000000000000000000C0585900A5787800CBBE
      BC00F1EDEB00E5E6E500A3575600A53F3F000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C0585900A5787800CBBEBC00F1EE
      EB00E5E6E500A3575600A53F3F00000000000000000000000000000000000000
      0000868484008684840000000000000000008684840086848400000000000000
      0000000000000000000000000000000000000000000000000000B7818300B781
      8300B7818300B7818300B7818300B7818300B7818300B7818300B7818300B781
      8300B7818300B7818300B781830000000000C4716D00CD646400A46868009D45
      4400E5D9D800FEFEFE00A9585700A53F3F00B55C5D0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000C4716D00CD646400A46868009D454400E5D9
      D800FFFFFF00A9585700A63B3A00B55C5D000000000000000000000000008684
      8400BCBABA00B5B3B300868484008684840086848400EBEAEA00868484008684
      8400868484000000000000000000000000000000000000000000636E7B00FEEE
      D400F7E3C500F6DFBC00F5DBB400F3D7AB00F3D3A200F1CF9A00F0CF9700F0CF
      9800F0CF9800F5D49A00B781830000000000C4716D00CD646400B57A7A009F55
      5400B1A1A000F1EDEB0005720A0005720A00087F0F0005720A00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000C3726E00CB606100B57A7A009F555400B1A1
      A000F1EDEB00AD585900A6393A00B55C5D00000000000000000086848400E3E2
      E200B5B3B300B5B3B300B5B3B300515050004F4F4F0086878700CDCDCD00E8E9
      E900C7C6C600868484008684840086848400000000005E98C7003489D0007F85
      9D00F6E3CB00F5DFC200F4DBBA00F2D7B200F1D4A900F1D0A200EECC9900EECC
      9700EECC9700F3D19900B781830000000000C16F6B00C0585900C8717100CB80
      7F00C3727200CA787800C16F6B00CD64640005720A000C9918000A9114000572
      0A00000000000000000000000000000000000000000000000000000000000000
      0000C0585900A5787800CBBEBC00C16F6B00C5595A00C8717100CB807F00C372
      7200CA787800C76D6D00C8656500B25859000000000086848400DEDDDD00D6D6
      D600A4A3A300A4A3A300A4A3A300565555001615160012121200181818001212
      120093939300CACACA00868484000000000000000000000000004BB6FF00288B
      E00085849800F5E3CB00F5DFC300F3DBBB00F2D7B200F1D4AB00F0D0A300EECC
      9A00EECC9700F3D19900B781830000000000B7645E00D09C9A00EEDCDC00EEDC
      DC00EEDCDC00EED8D700EFE3E100D28E8D00AD4C4D0005720A000FA31B000A91
      140005720A00000000000000000000000000000000000000000000000000C471
      6D00CD646400A46868009D454400B6635E00D09C9A00EEDCDC00EEDCDA00EFDA
      D800EED8D700EFE3E100D38D8C00AE4E4F0086848400D6D6D600D6D6D600A4A3
      A300E0DEDE00D9D7D700CDCBCB00C2C0C000B6B4B4009F9D9D00797677001212
      12001414140013131300868484008F8C8C000000000000000000B48176004DB5
      FF00278BDE0079819A00F6E3CA00F5DFC200F4DBB900F2D7B200F1D4AA00F0D0
      A100EFCD9900F3D19800B781830000000000B7645E00E6CCCA00F3F8F700EAE9
      E900EAE9E900EAE9E900F2F6F500D28E8D00AD4C4D00B781830005720A0011A9
      200005720A00B7818300B7818300B7818300000000000000000000000000C372
      6E00CB606100B57A7A009F555400B6635D00E6CCCA00F3F8F700EAE8E800EBEA
      E900EBEBEA00F2F6F500D28F8E00AD4C4D0086848400D6D6D600A4A3A300F3F2
      F200FFFEFE00FCFBFB00EAE7E800E6E6E600E6E5E500DAD9D900CCCBCB00BFBD
      BD00A2A0A00073717100939191008E8C8C000000000000000000BA8E8500FFFC
      F4004CB9FF005A91BF00A4817900BE978E00AC7E7900BE958900D6B49B00F1D3
      AA00F0D0A100F3D29B00B781830000000000B7645E00E5C6C500E5E6E500DBD7
      D700DDD9D900DDD9D900EAE9E900D28E8D00AD4C4D00FAE7C60005720A001FB6
      350005720A00F3D29800F9DB9B00B7818300000000000000000000000000C16F
      6B00C5595A00C8717100CB807F00B6635E00E4C5C400E6E7E600DBD7D700DDD9
      D900DBD9D800E8E9E900D28E8E00AD4C4D0086848400A4A3A300FFFFFF00FEFD
      FD00FBFBFB00DFDEDF00ADA7A900B4ADAE00C3BDBE00D1CECF00E0E0E000E1E1
      E100D4D3D300C7C6C600A7A5A500868383000000000000000000BA8E8500FFFF
      FD00FBF4EC00BFA19F00C7A59C00E1C9B800F2DFC600E0C3AD00C59F9000D7B4
      9B00F0D4A900F5D5A300B781830000000000B7645E00E5C6C500EAE9E900E5E6
      E500E5E6E500E5E6E500EFE3E100D5918F0005720A0005720A0005720A0033C5
      520005720A0005720A0005720A00B781830000000000C0585900A5787800B663
      5E00D09C9A00EEDCDC00EEDCDA00B7645E00E6C7C700EFEFEE00E4E1E000E6E2
      E100E5E2E100F0EFEE00D5918F00AD4C4D00000000008684840086848400F1F0
      F000C2B9BA0093898B00A19B9F00ABA8AA00ABA6A700B1ACAD00AFA9AA00B2AD
      AE00CAC9C900DCDCDC00D0D0D000868484000000000000000000CB9A8200FFFF
      FF00FEF9F500C09C9700E3CEC400F9EADA00F8E7D200FFFFF700E0C2AD00BE95
      8900F2D8B200F6D9AC00B78183000000000000000000D2B6B500EAE9E900E5D9
      D800E5D9D800E5D9D800EAE9E900C285840005720A0034B3510053DB800046D1
      6C002BBB45001EA5300005720A00B7818300C4716D00CD646400A4686800B663
      5D00E6CCCA00F3F8F700EAE8E800EBEAE900D2B6B500E6E7E700E2DCDC00E2DD
      DD00E2DDDE00E5E5E400C2858400000000000000000000000000000000008684
      8400CAA09700BA9E8700A2897E0095817B00897C7F00928C9200A5A2A400BBB6
      B700D7D6D600CFCFCF0086848400000000000000000000000000CB9A8200FFFF
      FF00FFFEFD00AC7F7B00F8EEE700F9EFE300F8EADA00FFFFF000F3DEC700AC7E
      7900F4DBB900F8DDB400B7818300000000000000000000000000000000000000
      0000000000000000000000000000CAA39800FDF9F50005720A0048CB700060ED
      940030B34B0005720A00F6DBAC00B7818300C3726E00CB606100B57A7A00B663
      5E00E4C5C400E6E7E600DBD7D700DDD9D900DBD9D800E8E9E900D28E8E00AD4C
      4D00000000000000000000000000000000000000000000000000000000000000
      0000CC9A9900FFEAC400FFDDB300EEC39900D5AE8C00C9A78600CC9A99009895
      9600868484008684840000000000000000000000000000000000DCA88700FFFF
      FF00FFFFFF00C19F9C00E6D6D100FBF3EB00FAEFE200FFFFDE00E2C8B800BE97
      8D00F7E1C200F0DAB700B7818300000000000000000000000000000000000000
      0000000000000000000000000000D1A69300FEFEFE00FDF9F50005720A003CBB
      5D0005720A00F5DDC100FBE2BA00B7818300C16F6B00C5595A00C8717100B764
      5E00E6C7C700EFEFEE00E4E1E000E6E2E100E5E2E100F0EFEE00D5918F00AD4C
      4D00000000000000000000000000000000000000000000000000000000000000
      0000CC9A9900FFE7C800FFDDBA00FFDBB100FFD9A600FFD39F00CC9A99000000
      0000000000000000000000000000000000000000000000000000DCA88700FFFF
      FF00FFFFFF00DFCDCB00C9ACA900E6D6D100F8EEE600E3CEC400C7A59C00C3A3
      9400E6D9C400C6BCA900B7818300000000000000000000000000000000000000
      0000000000000000000000000000E2B89800FEFEFE00FEFEFE00FDF9F5000572
      0A00F9EAD900FDEDD500F4E6C700B7818300B6635E00D09C9A00EEDCDC00EEDC
      DA00D2B6B500E6E7E700E2DCDC00E2DDDD00E2DDDE00E5E5E400C28584000000
      000000000000000000000000000000000000000000000000000000000000CE9D
      9B00FFEDDA00FFE7CE00FFE2C300FFDDB800FFDBAE00CC9A9900000000000000
      0000000000000000000000000000000000000000000000000000E3B18E00FFFF
      FF00FFFFFF00FFFFFF00DFCDCB00C19F9C00AC7F7B00C09D9700D6BAB100B885
      7A00B8857A00B8857A00B7818300000000000000000000000000000000000000
      0000000000000000000000000000E2B89800FEFEFE00FEFEFE00FEFEFE00FDF9
      F500FCF3E800B5837800B5837800B7818300B6635D00E6CCCA00F3F8F700EAE8
      E800EBEAE900EBEBEA00F2F6F500D28F8E00AD4C4D0000000000000000000000
      000000000000000000000000000000000000000000000000000000000000CC9A
      9900FEF0E100FFECD800FFE6CC00FFE1C200FEDDB700CC9A9900000000000000
      0000000000000000000000000000000000000000000000000000E3B18E00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFEFC00FFFEF900E3CFC900B885
      7A00E8B27000ECA54A00C5876800000000000000000000000000000000000000
      0000000000000000000000000000EBC39F00FEFEFE00FEFEFE00FEFEFE00FEFE
      FE00FAF7F400B5837800E8AA6100CD8C6200B6635E00E4C5C400E6E7E600DBD7
      D700DDD9D900DBD9D800E8E9E900D28E8E00AD4C4D0000000000000000000000
      0000000000000000000000000000000000000000000000000000CC9A9900FFFF
      F500FFFFF500FFF0E100FFEBD600FFE8CC00F6D4BA00CC9A9900000000000000
      0000000000000000000000000000000000000000000000000000EDBD9200FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E4D4D200B885
      7A00FAC57700CD93770000000000000000000000000000000000000000000000
      0000000000000000000000000000F0C8A100FAF7F400FAF7F400FAF7F400FDF9
      F500F6F0EF00B5837800D59E7D0000000000B7645E00E6C7C700EFEFEE00E4E1
      E000E6E2E100E5E2E100F0EFEE00D5918F00AD4C4D0000000000000000000000
      0000000000000000000000000000000000000000000000000000CC9A9900CC9A
      9900CC9A9900FCF3E900FCEADA00FCE5D000CC9A990000000000000000000000
      0000000000000000000000000000000000000000000000000000EDBD9200FCF7
      F400FCF7F300FBF6F300FBF6F300FAF5F300F9F5F300F9F5F300E1D0CE00B885
      7A00CF9B86000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000EBC39F00DDAE9400E0B39600DCA88700DCA8
      8700DCA88700B5837800000000000000000000000000D2B6B500E6E7E700E2DC
      DC00E2DDDD00E2DDDE00E5E5E400C28584000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000CC9A9900CC9A9900CC9A99000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000EDBD9200DCA8
      8700DCA88700DCA88700DCA88700DCA88700DCA88700DCA88700DCA88700B885
      7A0000000000000000000000000000000000000000000274AC000274AC000274
      AC000274AC000274AC000274AC000274AC000274AC000274AC000274AC00046B
      0B000274AC0000000000000000000000000000000000078DBE00078DBE00078D
      BE00078DBE00078DBE00078DBE00078DBE00078DBE00078DBE00078DBE00078D
      BE00078DBE00078DBE00000000000000000000000000078DBE00078DBE00078D
      BE00078DBE00078DBE00078DBE00078DBE00078DBE00078DBE00078DBE00078D
      BE00078DBE00078DBE0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000274AC000579B1005BB5D90083D5
      F8004CC0F6004CC0F6004CC0F6004CC0F6004CC0F6004CC0F600046B0B0025AA
      4200046B0B000C81BA000000000000000000078DBE0063CBF800078DBE00A3E1
      FB0063CBF80063CBF80063CBF80063CBF80063CBF80063CBF80063CBF80063CB
      F8003AADD800ACE7F500078DBE0000000000078DBE0063CBF800078DBE00A3E1
      FB0066CDF90065CDF80065CDF90065CDF90065CDF80065CDF90065CDF80066CD
      F8003AADD800ACE7F500078DBE000000000000000000000000007F2B28007F2B
      2800A1828300A1828300A1828300A1828300A1828300A1828300A18283007A1C
      1C007F2B28000000000000000000000000000274AC001C93CB001E8EBF00ACE6
      FB0058CCF80058CBF70058CCF80058CBF70058CCF800046B0B0038CE650047E7
      7F0029B44A00046B0B000274AC0000000000078DBE006AD1F900078DBE00A8E5
      FC0072D6FA0072D6FA0072D6FA0072D6FA0072D6FA0005710A0072D6FA006AD1
      F9003EB1D900B1EAF500078DBE0000000000078DBE006AD1F900078DBE00A8E5
      FC006FD4FA006FD4F9006ED4FA006FD4F9006FD4FA006FD4FA006FD4FA006ED4
      F9003EB1D900B1EAF500078DBE0000000000000000007F2B2800CA4D4D00B645
      4500DDD4D5007916170079161700DCE0E000D7DADE00CED5D700BDBABD007610
      0F009A2D2D007F2B280000000000000000000274AC0057CAF8000274AC00C6E0
      E7007DA7B4007DA9B4007DA9B4007DA7B400046B0B002DC051003FDC6E003FDC
      6E0047E77F0029B44A00046B0B0000000000078DBE0072D6FA00078DBE00AEEA
      FC0079DCFA0079DCFA0079DCFA0079DCFA0079DCFA0079DCFA0005710A0079DC
      FA003EB1D900BBF2F600078DBE0000000000078DBE0072D6FA00078DBE00AEEA
      FC0079DCFB0079DCFB0079DCFB0079DCFB0079DCFB007ADCFB0079DCFA0079DC
      FA0044B5D900B6EEF600078DBE0000000000000000007F2B2800C24A4B00B144
      4400E2D9D9007916170079161700D9D8DA00D9DEE100D3D9DC00C1BDC1007611
      1100982D2D007F2B280000000000000000000274AC005ED3FA000274AC009ED8
      E500C0EEE700A3D7CF009ED1C700046B0B00046B0B00046B0B00046B0B003FDC
      6E002EBF5300046B0B00046B0B00046B0B00078DBE0079DCFA00078DBE00B5EE
      FD0083E4FB0083E4FB0083E4FB0083E4FB0083E4FB0083E4FB00289B4C000571
      0A004CBBDA00BBF2F600078DBE0000000000078DBE0079DDFB00078DBE00B5EE
      FD0083E4FB0084E4FB0083E4FC0083E4FC0084E4FC0083E4FC0083E4FB0084E5
      FC0048B9DA00BBF2F600078DBE0000000000000000007F2B2800C24A4A00B042
      4200E6DCDC007916170079161700D5D3D500D8DEE100D7DDE000C6C2C500700F
      0F00962C2C007F2B280000000000000000000274AC0068DAFB0013709D0047A7
      CB00D4F7EF004CBBD10047B6C5004CBBD1004CBBD1009ECEBD00046B0B0035D3
      5E0020A73A00046B0B00BAEBEF000274AC00078DBE0083E4FB00078DBE00BAF3
      FD008DEBFC008DEBFC008DEBFC008DEBFC008DEBFC008DEBFC001E9435000571
      0A004CBBDA00BBF2F600078DBE0000000000078DBE0082E3FC00078DBE00BAF3
      FD008DEBFC008DEBFC008DEBFC008DEBFD008DEBFD008DEBFC008DEBFD008DEB
      FC004CBBDA00BEF4F700078DBE0000000000000000007F2B2800C24A4A00B041
      4100EADEDE00E7DDDD00DDD4D500D7D3D500D5D7D900D7D8DA00CAC2C5007E17
      17009E3131007F2B280000000000000000000274AC0070E3FB005B6B76000D80
      B500FEFEFD00D5FCFE00CFFAFE00D8FBFE00D3F7FB00CCF0F400046B0B0028C2
      4A00046B0B00E3FEFE00C5EFF6000274AC00078DBE008DEBFC00078DBE00FEFE
      FE00C8F7FE00C8F7FE0005710A00C8F7FE00C8F7FE00C8F7FE001D9F2F000571
      0A009BD5E700DEF9FB00078DBE0000000000078DBE008AEAFC00078DBE00FFFF
      FF00C9F7FE00C8F7FE00C9F7FE00C9F7FE00C9F7FE00C8F7FE00C9F7FE00C8F7
      FE009BD5E700DEF9FB00078DBE0000000000000000007F2B2800BF474800B845
      4500BA4C4C00BD575700BB575600B64E4E00B4494900BD525100BB4B4C00B542
      4200BF4A4A007F2B280000000000000000000274AC007AEBFE00A06C5F000274
      AC000274AC000274AC000274AC000274AC000274AC00046B0B0017A42B0019A7
      3000046B0B000274AC000274AC000274AC00078DBE0093F0FE00078DBE00078D
      BE00078BB30005710A0005710A000789A700078DBE0005710A003CC95E001188
      3E00078DBE00078DBE00078DBE0000000000078DBE0093F0FE00078DBE00078D
      BE00078DBE00078DBE00078DBE00078DBE00078DBE00078DBE00078DBE00078D
      BE00078DBE00078DBE00078DBE0000000000000000007F2B2800A33B3900B160
      5D00C6868400CB918F00CC919000CC908F00CB898800C9898800CB939100CC96
      9600BD4B4C007F2B280000000000000000000274AC0083F2FE00A7746300FEF7
      EE000274AC0075EDFE007BE5FF00ACF0FF006ACAE700046B0B0011A12200046B
      0B0073424100000000000000000000000000078DBE009AF5FE009AF5FE009AF5
      FE0005710A0014A2230017A0280005710A0005710A0043CF680005710A009AF5
      FE00078DBE00000000000000000000000000078DBE009BF5FE009AF6FE009AF6
      FE009BF5FD009BF6FE009AF6FE009BF5FE009AF6FD009BF5FE009AF6FE009AF6
      FE000989BA00000000000000000000000000000000007F2B2800BD4B4C00F7F7
      F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7
      F700BD4B4C007F2B280000000000000000000274AC00FEFEFD00B17D6700FEFA
      F6000274AC0035C2DE00279EC0002BA0C000046B0B00046B0B00046B0B00FED5
      AD0073424100000000000000000000000000078DBE00FEFEFE00A0FBFF000571
      0A00149A220022B338002DBD48003CC95E004AD5730005710A00A0FBFF00A0FB
      FF00078DBE00000000000000000000000000078DBE00FEFEFE00A0FBFF00A0FB
      FE00A0FBFE00A1FAFE00A1FBFE00A0FAFE00A1FBFE00A1FBFF00A0FBFF00A1FB
      FF000989BA00000000000000000000000000000000007F2B2800BD4B4C00F7F7
      F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7
      F700BD4B4C007F2B28000000000000000000000000000274AC00BB836900FEFE
      FD000274AC003CD3EE00046B0B00046B0B00046B0B0005669500C5B09800FEDA
      B8007342410000000000000000000000000000000000078DBE00FEFEFE00A0FB
      FF0005710A002DB7480042CE660005710A0005710A00078DBE00078DBE00078D
      BE000000000000000000000000000000000000000000078DBE00FEFEFE00A5FE
      FF00A5FEFF00A5FEFF00078DBE00078DBE00078DBE00078DBE00078DBE00078D
      BE0000000000000000000000000000000000000000007F2B2800BD4B4C00F7F7
      F700BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00F7F7
      F700BD4B4C007F2B280000000000000000000000000000000000C48B6C00FEFE
      FD000274AC004FF0FE0034F0FF0084FAFF0041C4EB00056695009A8A8800A793
      9500734241000000000000000000000000000000000000000000078DBE00078D
      BE00078BB30005710A0005710A00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000078DBE00078D
      BE00078DBE00078DBE0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000007F2B2800BD4B4C00F7F7
      F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7
      F700BD4B4C007F2B280000000000000000000000000000000000CC937000FEFE
      FD000274AC00EBFFFF00B6FFFF009DFFFF0088FEFE000566950084554B00A067
      5B009D6559000000000000000000000000000000000000000000000000000000
      0000000000000000000005710A00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000007F2B2800BD4B4C00F7F7
      F700BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00F7F7
      F700BD4B4C007F2B280000000000000000000000000000000000D59C7400FEFE
      FD00FEFEFD000274AC000274AC000274AC000274AC0070484100D9995000DC83
      2A00DC832A000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000007F2B2800BD4B4C00F7F7
      F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7
      F700BD4B4C007F2B280000000000000000000000000000000000DCA17500FEFE
      FD00FEFEFD00FEFEFD00FEFEFD00FEFAF600FEFAF60098625600E5A15400DC83
      2A00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007F2B2800F7F7
      F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7F700F7F7
      F7007F2B28000000000000000000000000000000000000000000E1A57700D192
      6D00D1926D00D1926D00D1926D00D1926D00D1926D00A0675B00EB9E43000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000700100000100010000000000800B00000000000000000000
      000000000000000000000000FFFFFF00FFFF000000000000DFFF000000000000
      9FFF0000000000009FFF0000000000009FFF0000000000008FBF000000000000
      8F9F000000000000878F000000000000C007000000000000C003000000000000
      E001000000000000F003000000000000FC07000000000000FF8F000000000000
      FF9F000000000000FFBF000000000000FF87FF87FF87FF870007FF87FF870007
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
      FFFFFFFF8003FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0301FFFFFFFFC3C003
      01FF007FF801800301FF007FE001000301FF007FC003000301FF007F80000003
      FF40000B80000003FE40000900000001FC4000080000003CFE4000090000003E
      FF40000B0000003F01FF007F8001003F01FF007F8007003F01FF007FC00F003F
      01FF007FE01F807F01FFFFFFF87FC0FFFFFFFFFFFFFFFFFFC003C003C003C003
      8001800180018001800180018001800180018001800180008001800180018000
      8001800180018001800180018001800180018001800180018001800180018001
      8001800180018001800180018001800180018001800180018001800180010001
      C003C003C0030003FFFFFFFFFFFF3FFFFFFFFFFFFFFFFFFFC003C003C003C003
      8001800180018001800180018001800180018001800180018001800180018001
      8001800180018001800180018001800180018001800180018001800180018001
      8001800180018001800180018001800180018001800180018001800180018001
      C003C003C003C003FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFC003C003C003
      C7FF800180018001833F800180018001013F800180018001C7FF800180018001
      C70F800180018001C70F800180018001C7FF800180018001C703800180018001
      C703800180018001C7FF800180018001C700800180018001C700800180018001
      C7FFC003C003C003FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000F000FC003C7FF
      000F000F8001C700FFFFFFFF8001C700EE07DE078001C7FFCE07CE078001C703
      820706078001C70303FF03FF8001C7FF820006008001C70FCE00CE008001C70F
      EE00DE008001C7FFFFFFFFFF8001013F000F000F8001833F000F000F8001C7FF
      FFFFFFFFC003EFFFFFFFFFFFFFFFFFFFFC00DA39C07FFFFCFC00DAD6E007C0F8
      FC00C217F0038070FC00D8D6F8010021FC00E039FC010003FC00F00FFC110007
      FC00F0038C3D000FF400E003043F0007E000C007220F0007C000800FF10F0007
      8001803F80FF000F0003C07F01FF000F80FF81FF21FF003FC1FF0FFFF1FF003F
      E3FF1FFFF8FF807FF7FF3FFFFDFFC0FFFFC180018001FC01FF8000000000FC01
      FF8000000000E001FF8000000000E001FD80000000000001FC00000000000001
      8000000000000001018000000000000101800000000000010001000000000001
      003F00000000000101BF00000000000101FF00000000000F01FF00000000000F
      01FF80818101007F83FF80818101007F00000000F81FFC0040024002E007FC00
      40004000C003FC00400140018001FC00000000008001FC00C003C0030000FC00
      C003C00300008000C003C00300000000C003C00300000000C003C00300000000
      C003C00300000001C003C00380010003C007C007800101FFC00FC00FC00301FF
      C01FC01FE00701FFC03FC03FF81F83FFFFE7FFFFFFFFFFFFFFC3C003FFFFFFFF
      FF818001FFFFFFFFFF008001FE3FFFFFFF008001FE3FFFFFFFC38001FE3FFFFF
      FFC38001F007E00700078001F007E00700078001F007E00700078001FE3FFFFF
      00078001FE3FFFFF00078001FE3FFFFF00078001FFFFFFFF00078001FFFFFFFF
      0007C003FFFFFFFF0007FFFFFFFFFFFFFF83FBFFFFFFE000E001F03F8001E000
      C000E01F8001E0008000C00F8001E0008000C00F8001E0008000C00F8001E000
      8000C00F8001E0008001C0078000E0008003C0038000E000801FC0070001C73F
      801FC0030001803F801FC0010003007F801FC00F003F00FF801FC00F007F81FF
      C03FE01F80FFC7FFE07FF03FC1FFE7FFF03FF019FFFFC003E01FE000FFFFC003
      C00FC000EE3FC003C00FC001E5DFC003C00FC001E3EFC003C00FC000E1EFC003
      C00FC000E0FFC003C00FC009FFFFC003C00FC00FFE0FC003C00FC00FEF0FC003
      C00FC00FEF8FC003C00FC00FF74FC003C00FC00FF8EFC007E01FE01FFFFFC00F
      F03FF03FFFFFC01FFFFFFFFFFFFFC03FFE3FFE00F8FFFC3FE007FE00F01FF81F
      E007FE00E003F00F8003FE00C000E0078001FC008000C0038001000080008001
      800100008000000080010000800000008001000080000000C003000180000000
      E007000380018001F81F003F8003C003F81F007FC007E007F81F007FE01FF00F
      F81F00FFF01FF81FFC3F01FFF93FFC3FFFFFFFFFFFFFFFFFC0039FFFFE4FC003
      8001E801FE4F80018001D801FE4F800180018FFFFE4F80018001FFFFFE4F8001
      80018FFFF84F80018001D801E04F80018001E801E04F800180019FFFC04F8001
      8001FFFFC04F80018001DFFFC04F80018001D801E04F800180019801E0038001
      C003DFFFF803C003FFFFFFFFFFFFFFFFFFFFFFC1FFF7FFDFC0FF0000C0E7C0CF
      807F000080478047000100000000000300010000000000010001000000000000
      0001000000000001003F000000000003003F000000070007003F00010027000F
      003F00070037001F003F0007003F003F003F0007003F003F003F000F003F003F
      807F001F807F807FC0FF003FC0FFC0FFFFF7FFFBFFFFFF87FFF3FFF30FF3C087
      FFC1FFE000618007FFC0FFC000010000FFC1FFE000030000CFF3CFF300030000
      C7F7C7FB00030000E3FFE3FF00010007F11FF11F00010007F80FF80F00010007
      F807F8070000003FF807F8070000003FF807F8070007003FF807F8070007003F
      FC0FFC0F807F807FFE1FFE1F80FFC0FFF801C0019FFFB731F80180010FFFB416
      F801800107FF8400F801800183FFB41600018001C1FFCF3100018001E10FFFFF
      00018001F003E7FF00018001FC01E3FF00018001FC01F11F00018001F800F80F
      00038003F800F80700078003F800F807003F8003FC01F807003F8003FC01F807
      007FC007FE03FC0F00FFF83FFF8FFE1FFE7FF81FF81FFC7FF07FE007E007F87F
      C001C003C003FB27C00180018001FB43C00180018001F85BC00100000000FC1B
      C00100000000FE03C00100000000FE07C00100000000FC3FC00100000000F83F
      C00100000000F03FC00180018001E23FC00180018001E63FC001C003C003EE3F
      F001E007E007FE7FFC7FF81FF81FFEFF80FFFF01F33FC001007FFE00E007C001
      003FFE00C0008001000FF0008001C0010007E0000000C0010000E0000000C001
      0000E0000000C001000080008000C00180000001E001C001FE00000FF003C001
      FE00000FF01FC001FE00001FE03FC001FE00007FE03FC001FE00007FC03FC003
      FE01007FC07FC007FE0380FFF8FFC00F800780038003FFFF000300010001C007
      0001000100018003000100010001800300000001000180030000000100018003
      0000000100018003000000010001800300070007000780030007000700078003
      8007800F800F8003C007C1FFC3FF8003C007FDFFFFFF8003C007FFFFFFFF8003
      C00FFFFFFFFFC007C01FFFFFFFFFFFFF00000000000000000000000000000000
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
