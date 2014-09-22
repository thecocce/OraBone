object MainForm: TMainForm
  Left = 0
  Top = 0
  Caption = 'OraBone'
  ClientHeight = 521
  ClientWidth = 861
  Color = clWindow
  DoubleBuffered = True
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDefault
  ShowHint = True
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
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
      ParentBackground = True
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
    DoubleBuffered = True
    Padding.Left = 2
    Padding.Top = 2
    Padding.Right = 2
    ParentColor = True
    ParentDoubleBuffered = False
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
      OnGetControlClass = ActionToolBarGetControlClass
    end
  end
  object MainPanel: TPanel
    Left = 0
    Top = 53
    Width = 861
    Height = 449
    Align = alClient
    BevelOuter = bvNone
    Color = clWindow
    DoubleBuffered = True
    Padding.Left = 3
    Padding.Top = 2
    Padding.Right = 1
    Padding.Bottom = 2
    ParentBackground = False
    ParentDoubleBuffered = False
    TabOrder = 1
    object PageControl: TBCPageControl
      Left = 3
      Top = 2
      Width = 857
      Height = 445
      Align = alClient
      DoubleBuffered = False
      ParentDoubleBuffered = False
      ParentShowHint = False
      PopupMenu = PageControlPopupActionBar
      ShowHint = False
      TabOrder = 0
      OnChange = PageControlChange
      OnMouseDown = PageControlMouseDown
      ParentColor = False
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
                ImageIndex = 66
                ShortCut = 16462
              end
              item
                Action = FileOpenAction
                Caption = '&Open...'
                ImageIndex = 135
                ShortCut = 16463
              end
              item
                Items = <
                  item
                    Action = FileReopenClearAction
                    ImageIndex = 58
                  end>
                Action = FileReopenAction
                ImageIndex = 162
                UsageCount = 1
              end
              item
                Caption = '-'
              end
              item
                Action = FileSaveAction
                Caption = '&Save'
                ImageIndex = 167
                ShortCut = 16467
              end
              item
                Action = FileSaveAsAction
                Caption = 'S&ave As...'
                ImageIndex = 169
                ShortCut = 49235
              end
              item
                Action = FileSaveAllAction
                Caption = 'Sa&ve All'
                ImageIndex = 168
              end
              item
                Action = FileCloseAction
                Caption = '&Close'
                ImageIndex = 85
                ShortCut = 16499
              end
              item
                Action = FileCloseAllAction
                Caption = 'C&lose All'
                ImageIndex = 86
              end
              item
                Action = FileCloseAllOtherPagesAction
                Caption = 'Close All O&ther Pages'
                ImageIndex = 87
                ShortCut = 24691
              end
              item
                Caption = '-'
              end
              item
                Action = FilePrintAction
                Caption = '&Print...'
                ImageIndex = 150
                ShortCut = 16464
              end
              item
                Action = FilePrintPreviewAction
                Caption = 'Pr&int Preview...'
                ImageIndex = 148
              end
              item
                Caption = '-'
              end
              item
                Action = FileExitAction
                ImageIndex = 76
                ShortCut = 32883
              end>
            Caption = '&File'
          end
          item
            Items = <
              item
                Action = EditUndoAction
                ImageIndex = 223
                ShortCut = 16474
              end
              item
                Action = EditRedoAction
                ImageIndex = 160
                ShortCut = 24666
              end
              item
                Caption = '-'
              end
              item
                Action = EditCutAction
                ImageIndex = 43
                ShortCut = 16472
              end
              item
                Action = EditCopyAction
                Caption = 'Cop&y'
                ImageIndex = 40
                ShortCut = 16451
              end
              item
                Action = EditPasteAction
                ImageIndex = 142
                ShortCut = 16470
              end
              item
                Action = EditSelectAllAction
                ImageIndex = 172
                ShortCut = 16449
              end
              item
                Caption = '-'
              end
              item
                Items = <
                  item
                    Action = EditInsertLineAction
                    ImageIndex = 109
                    ShortCut = 16462
                  end>
                Action = EditInsertAction
                ImageIndex = 0
                UsageCount = 1
              end
              item
                Items = <
                  item
                    Action = EditDeleteLineAction
                    ImageIndex = 61
                    ShortCut = 16473
                  end
                  item
                    Action = EditDeleteEOLAction
                    Caption = '&End of Line'
                    ImageIndex = 60
                    ShortCut = 24665
                  end
                  item
                    Action = EditDeleteWordAction
                    ImageIndex = 63
                    ShortCut = 16468
                  end>
                Action = EditDeleteAction
                ImageIndex = 58
                UsageCount = 1
              end
              item
                Caption = '-'
              end
              item
                Items = <
                  item
                    Action = EditIncreaseIndentAction
                    ImageIndex = 100
                    ShortCut = 24649
                  end
                  item
                    Action = EditDecreaseIndentAction
                    ImageIndex = 101
                    ShortCut = 24661
                  end>
                Action = EditIndentAction
                ImageIndex = 99
                UsageCount = 1
              end
              item
                Items = <
                  item
                    Action = EditSortAscAction
                    ImageIndex = 180
                    ShortCut = 24641
                  end
                  item
                    Action = EditSortDescAction
                    ImageIndex = 181
                    ShortCut = 24644
                  end>
                Action = EditSortAction
                Caption = 'S&ort'
                ImageIndex = 178
                UsageCount = 1
              end
              item
                Caption = '-'
              end
              item
                Action = EditToggleCaseAction
                ImageIndex = 25
                ShortCut = 24643
              end>
            Caption = '&Edit'
          end
          item
            Items = <
              item
                Action = SearchAction
                ImageIndex = 81
                ShortCut = 16454
              end
              item
                Action = SearchReplaceAction
                ImageIndex = 163
                ShortCut = 16466
              end
              item
                Action = SearchFindInFilesAction
                ImageIndex = 82
              end
              item
                Caption = '-'
              end
              item
                Action = SearchFindNextAction
                ImageIndex = 84
                ShortCut = 114
              end
              item
                Action = SearchFindPreviousAction
                ImageIndex = 83
                ShortCut = 8306
              end
              item
                Caption = '-'
              end
              item
                Action = SearchToggleBookmarkAction
                Caption = '&Toggle Bookmark'
                ImageIndex = 21
                ShortCut = 16497
              end
              item
                Items = <
                  item
                    Action = ToggleBookmarks1Action
                    ImageIndex = 12
                    ShortCut = 24625
                  end
                  item
                    Action = ToggleBookmarks2Action
                    ImageIndex = 13
                    ShortCut = 24626
                  end
                  item
                    Action = ToggleBookmarks3Action
                    ImageIndex = 14
                    ShortCut = 24627
                  end
                  item
                    Action = ToggleBookmarks4Action
                    ImageIndex = 15
                    ShortCut = 24628
                  end
                  item
                    Action = ToggleBookmarks5Action
                    ImageIndex = 16
                    ShortCut = 24629
                  end
                  item
                    Action = ToggleBookmarks6Action
                    ImageIndex = 17
                    ShortCut = 24630
                  end
                  item
                    Action = ToggleBookmarks7Action
                    ImageIndex = 18
                    ShortCut = 24631
                  end
                  item
                    Action = ToggleBookmarks8Action
                    ImageIndex = 19
                    ShortCut = 24632
                  end
                  item
                    Action = ToggleBookmarks9Action
                    ImageIndex = 20
                    ShortCut = 24633
                  end>
                Action = SearchToggleBookmarksAction
                Caption = 'T&oggle Bookmarks'
                ImageIndex = 24
                UsageCount = 1
              end
              item
                Items = <
                  item
                    Action = GotoBookmarks1Action
                    ImageIndex = 12
                    ShortCut = 16433
                  end
                  item
                    Action = GotoBookmarks2Action
                    ImageIndex = 13
                    ShortCut = 16434
                  end
                  item
                    Action = GotoBookmarks3Action
                    ImageIndex = 14
                    ShortCut = 16435
                  end
                  item
                    Action = GotoBookmarks4Action
                    ImageIndex = 15
                    ShortCut = 16436
                  end
                  item
                    Action = GotoBookmarks5Action
                    ImageIndex = 16
                    ShortCut = 16437
                  end
                  item
                    Action = GotoBookmarks6Action
                    ImageIndex = 17
                    ShortCut = 16438
                  end
                  item
                    Action = GotoBookmarks7Action
                    ImageIndex = 18
                    ShortCut = 16439
                  end
                  item
                    Action = GotoBookmarks8Action
                    ImageIndex = 19
                    ShortCut = 16440
                  end
                  item
                    Action = GotoBookmarks9Action
                    ImageIndex = 20
                    ShortCut = 16441
                  end>
                Action = SearchGotoBookmarksAction
                Caption = '&Go to Bookmarks'
                ImageIndex = 23
                UsageCount = 1
              end
              item
                Action = SearchClearBookmarksAction
                ImageIndex = 22
              end
              item
                Caption = '-'
              end
              item
                Action = SearchGotoLineAction
                Caption = 'Go to &Line'
                ImageIndex = 97
                ShortCut = 16455
              end>
            Caption = '&Search'
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
                Action = ViewMiniMapAction
                Caption = '&Minimap'
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
                ImageIndex = 28
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
                ImageIndex = 90
                UsageCount = 1
              end
              item
                Caption = '-'
              end
              item
                Action = ViewNextPageAction
                ImageIndex = 194
                ShortCut = 16393
              end
              item
                Action = ViewPreviousPageAction
                Caption = 'P&revious Page'
                ImageIndex = 193
                ShortCut = 24585
              end>
            Caption = '&View'
          end
          item
            Items = <
              item
                Action = DatabaseNewConnectionMenuAction
                ImageIndex = 45
              end
              item
                Action = DatabaseEndConnectionMenuAction
                ImageIndex = 47
              end
              item
                Caption = '-'
              end
              item
                Action = DatabaseEditorMenuAction
                ImageIndex = 67
              end
              item
                Caption = '-'
              end
              item
                Action = DatabaseObjectSearchAction
                ImageIndex = 51
              end
              item
                Caption = '-'
              end
              item
                Items = <
                  item
                    Action = DatabaseCreateConstraintAction
                    ImageIndex = 35
                  end
                  item
                    Action = DatabaseCreateDBLinkAction
                    ImageIndex = 121
                  end
                  item
                    Action = DatabaseCreateFunctionAction
                    ImageIndex = 93
                  end
                  item
                    Action = DatabaseCreateIndexAction
                    ImageIndex = 103
                  end
                  item
                    Action = DatabaseCreatePackageAction
                    ImageIndex = 138
                  end
                  item
                    Action = DatabaseCreateProcedureAction
                    ImageIndex = 153
                  end
                  item
                    Action = DatabaseCreateSequenceAction
                    ImageIndex = 174
                  end
                  item
                    Action = DatabaseCreateSynonymAction
                    ImageIndex = 188
                  end
                  item
                    Action = DatabaseCreateTableAction
                    ImageIndex = 196
                  end
                  item
                    Action = DatabaseCreateTriggerAction
                    ImageIndex = 219
                  end
                  item
                    Action = DatabaseCreateUserAction
                    ImageIndex = 225
                  end
                  item
                    Action = DatabaseCreateViewAction
                    ImageIndex = 231
                  end>
                Action = DatabaseCreateAction
                ImageIndex = 0
                UsageCount = 1
              end
              item
                Caption = '-'
              end
              item
                Items = <
                  item
                    Action = DatabaseExportTableDataAction
                    ImageIndex = 201
                  end>
                Action = DatabaseExportAction
                ImageIndex = 201
                UsageCount = 1
              end
              item
                Items = <
                  item
                    Action = DatabaseImportTableDataAction
                    ImageIndex = 202
                  end>
                Action = DatabaseImportAction
                ImageIndex = 202
                UsageCount = 1
              end
              item
                Caption = '-'
              end
              item
                Action = DatabaseRefreshAction
                ImageIndex = 53
                ShortCut = 116
              end>
            Caption = '&Database'
          end
          item
            Items = <
              item
                Action = ToolsOptionsAction
                ImageIndex = 136
              end
              item
                Caption = '-'
              end
              item
                Action = ToolsCompareFilesAction
                ImageIndex = 31
              end
              item
                Action = ToolsCompareSchemasAction
                ImageIndex = 46
              end
              item
                Action = SchemaDocumentAction
                Caption = 'Sc&hema Document...'
                ImageIndex = 69
              end
              item
                Caption = '-'
              end
              item
                Action = TNSNamesEditorAction
                ImageIndex = 52
              end>
            Caption = '&Tools'
          end
          item
            Items = <
              item
                Action = HelpCheckForUpdateMenuAction
                Caption = '&Check for Updates'
                ImageIndex = 72
              end
              item
                Caption = '-'
              end
              item
                Action = HelpHomeAction
                Caption = '&Visit Homepage'
                ImageIndex = 98
              end
              item
                Caption = '-'
              end
              item
                Action = HelpAboutMenuAction
                Caption = '&About OraBone'
                ImageIndex = 107
              end>
            Caption = '&Help'
          end>
        ActionBar = ActionMainMenuBar
      end
      item
        Items = <
          item
            Action = DatabaseNewConnectionMenuAction
            ImageIndex = 45
            ShowCaption = False
          end
          item
            Action = DatabaseEndConnectionMenuAction
            ImageIndex = 47
            ShowCaption = False
          end
          item
            Caption = '-'
          end
          item
            Action = DatabaseEditorMenuAction
            ImageIndex = 67
            ShowCaption = False
          end
          item
            Caption = '-'
          end
          item
            Action = DatabaseObjectSearchAction
            ImageIndex = 51
            ShowCaption = False
          end
          item
            Caption = '-'
          end
          item
            Action = DatabaseExportTableDataAction
            ImageIndex = 201
            ShowCaption = False
          end
          item
            Action = DatabaseImportTableDataAction
            Caption = 'T&able Data...'
            ImageIndex = 202
            ShowCaption = False
          end
          item
            Caption = '-'
          end
          item
            Action = DatabaseRefreshAction
            ImageIndex = 53
            ShowCaption = False
            ShortCut = 116
          end
          item
            Caption = '-'
          end
          item
            Action = SQLHistoryAction
            ImageIndex = 28
            ShowCaption = False
            ShortCut = 122
          end
          item
            Caption = '-'
          end
          item
            Action = ToolsCompareSchemasAction
            Caption = '&Compare Schemas...'
            ImageIndex = 46
            ShowCaption = False
          end
          item
            Action = SchemaDocumentAction
            Caption = 'Sc&hema Document...'
            ImageIndex = 69
            ShowCaption = False
          end
          item
            Caption = '-'
          end
          item
            Action = ToolsOptionsAction
            Caption = 'O&ptions...'
            ImageIndex = 136
            ShowCaption = False
          end
          item
            Action = TNSNamesEditorAction
            Caption = 'TNSNa&mes Editor...'
            ImageIndex = 52
            ShowCaption = False
          end>
        ActionBar = ActionToolBar
      end
      item
      end>
    Images = ImagesDataModule.ImageList
    Left = 62
    Top = 92
    StyleName = 'Platform Default'
    object DatabaseNewConnectionMenuAction: TAction
      Category = '&Database'
      Caption = '&New Connection...'
      Hint = 'Add a new connection'
      ImageIndex = 45
      OnExecute = DatabaseNewConnectionMenuActionExecute
    end
    object DatabaseEndConnectionMenuAction: TAction
      Category = '&Database'
      Caption = '&End Connection...'
      Hint = 'End the active connection'
      ImageIndex = 47
      OnExecute = DatabaseEndConnectionMenuActionExecute
    end
    object DatabaseEditorMenuAction: TAction
      Category = '&Database'
      Caption = 'E&ditor...'
      Hint = 'Open SQL Editor'
      ImageIndex = 67
      OnExecute = DatabaseEditorMenuActionExecute
    end
    object SearchAction: TAction
      Category = '&Search'
      Caption = '&Search...'
      Hint = 'Search the specified text'
      ImageIndex = 81
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
      ImageIndex = 136
      OnExecute = ToolsOptionsActionExecute
    end
    object ToolsCompareFilesAction: TAction
      Category = '&Tools'
      Caption = '&Compare Files...'
      Hint = 'Compare files'
      ImageIndex = 31
      OnExecute = ToolsCompareFilesActionExecute
    end
    object HelpCheckForUpdateMenuAction: TAction
      Category = '&Help'
      Caption = 'Check for Updates'
      ImageIndex = 72
      OnExecute = HelpCheckForUpdateMenuActionExecute
    end
    object HelpHomeAction: TAction
      Category = '&Help'
      Caption = 'Visit Homepage'
      Hint = 'Visit OraBone homepage - http://www.bonecode.com/'
      ImageIndex = 98
      OnExecute = HelpHomeActionExecute
    end
    object HelpAboutMenuAction: TAction
      Category = '&Help'
      Caption = 'About OraBone'
      Hint = 'Display OraBone information'
      ImageIndex = 107
      OnExecute = HelpAboutMenuActionExecute
    end
    object FileNewAction: TAction
      Category = '&File'
      Caption = '&New'
      Hint = 'Create a new document'
      ImageIndex = 66
      ShortCut = 16462
      OnExecute = FileNewActionExecute
    end
    object FileOpenAction: TAction
      Category = '&File'
      Caption = 'Open...'
      Hint = 'Open an existing SQL file'
      ImageIndex = 135
      ShortCut = 16463
      OnExecute = FileOpenActionExecute
    end
    object FileReopenAction: TAction
      Category = '&Reopen'
      Caption = '&Reopen'
      ImageIndex = 162
      OnExecute = DummyActionExecute
    end
    object FileSaveAction: TAction
      Category = '&File'
      Caption = 'Save'
      Hint = 'Save the active SQL document'
      ImageIndex = 167
      ShortCut = 16467
      OnExecute = FileSaveActionExecute
    end
    object FileSaveAsAction: TAction
      Category = '&File'
      Caption = 'Save As...'
      Hint = 'Save the active SQL document with a new name'
      ImageIndex = 169
      ShortCut = 49235
      OnExecute = FileSaveAsActionExecute
    end
    object FileSaveAllAction: TAction
      Category = '&File'
      Caption = 'Save All'
      Hint = 'Save all active SQL documents'
      ImageIndex = 168
      OnExecute = FileSaveAllActionExecute
    end
    object FileCloseAction: TAction
      Category = '&File'
      Caption = 'Close'
      Hint = 'Close the active SQL document'
      ImageIndex = 85
      ShortCut = 16499
      OnExecute = FileCloseActionExecute
    end
    object FileCloseAllAction: TAction
      Category = '&File'
      Caption = 'Close All'
      Hint = 'Close all open SQL documents'
      ImageIndex = 86
      OnExecute = FileCloseAllActionExecute
    end
    object FileCloseAllOtherPagesAction: TAction
      Category = '&File'
      Caption = 'Close All Other Pages'
      Hint = 'Close All Other SQL Documents'
      ImageIndex = 87
      ShortCut = 24691
      OnExecute = FileCloseAllOtherPagesActionExecute
    end
    object FilePrintAction: TAction
      Category = '&File'
      Caption = 'Print...'
      Hint = 'Print the active SQL document'
      ImageIndex = 150
      ShortCut = 16464
      OnExecute = FilePrintActionExecute
    end
    object FilePrintPreviewAction: TAction
      Category = '&File'
      Caption = 'Print Preview...'
      Hint = 'Preview the active SQL document'
      ImageIndex = 148
      OnExecute = FilePrintPreviewActionExecute
    end
    object FileExitAction: TAction
      Category = '&File'
      Caption = '&Exit'
      Hint = 'Quit the application'
      ImageIndex = 76
      ShortCut = 32883
      OnExecute = FileExitActionExecute
    end
    object EditUndoAction: TAction
      Category = '&Edit'
      Caption = '&Undo'
      Hint = 'Undo the last action'
      ImageIndex = 223
      ShortCut = 16474
      OnExecute = EditUndoActionExecute
    end
    object EditRedoAction: TAction
      Category = '&Edit'
      Caption = '&Redo'
      Hint = 'Redo the previously undone action'
      ImageIndex = 160
      ShortCut = 24666
      OnExecute = EditRedoActionExecute
    end
    object EditCutAction: TAction
      Category = '&Edit'
      Caption = '&Cut'
      Hint = 'Cut the selection and put it on the Clipboard'
      ImageIndex = 43
      ShortCut = 16472
      OnExecute = EditCutActionExecute
    end
    object EditCopyAction: TAction
      Category = '&Edit'
      Caption = '&Copy'
      Hint = 'Copy the selection and put it on the Clipboard'
      ImageIndex = 40
      ShortCut = 16451
      OnExecute = EditCopyActionExecute
    end
    object EditPasteAction: TAction
      Category = '&Edit'
      Caption = '&Paste'
      Hint = 'Insert Clipboard contents'
      ImageIndex = 142
      ShortCut = 16470
      OnExecute = EditPasteActionExecute
    end
    object SearchReplaceAction: TAction
      Category = '&Search'
      Caption = '&Replace...'
      Hint = 'Replace the specified text with different text'
      ImageIndex = 163
      ShortCut = 16466
      OnExecute = SearchReplaceActionExecute
    end
    object SearchFindInFilesAction: TAction
      Category = '&Search'
      Caption = '&Find in Files...'
      Hint = 'Search for a string in multiple files'
      ImageIndex = 82
      OnExecute = SearchFindInFilesActionExecute
    end
    object SearchFindNextAction: TAction
      Category = '&Search'
      Caption = 'Find &Next'
      Hint = 'Find the next matching text'
      ImageIndex = 84
      ShortCut = 114
      OnExecute = SearchFindNextActionExecute
    end
    object SearchFindPreviousAction: TAction
      Category = '&Search'
      Caption = 'Find &Previous'
      Hint = 'Find the previous matching text'
      ImageIndex = 83
      ShortCut = 8306
      OnExecute = SearchFindPreviousActionExecute
    end
    object SearchToggleBookmarkAction: TAction
      Category = '&Search'
      Caption = 'Toggle Bookmark'
      Hint = 
        'Set or clear bookmark at current line. Bookmarks can be also set' +
        ' by using Ctrl+Shift+0..9. Go to bookmark by using Ctrl+0..9.'
      ImageIndex = 21
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
    object ViewMiniMapAction: TAction
      Category = '&View'
      Caption = 'Minimap'
      Hint = 'Show or hide the minimap'
      OnExecute = ViewMiniMapActionExecute
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
      ImageIndex = 28
      ShortCut = 122
      OnExecute = SQLHistoryActionExecute
    end
    object ViewWordWrapAction: TAction
      Tag = 99
      Category = '&View'
      Caption = '&Word Wrap'
      Hint = 'Toggle word wrap'
      ImageIndex = 237
      OnExecute = ViewWordWrapActionExecute
    end
    object ViewLineNumbersAction: TAction
      Tag = 99
      Category = '&View'
      Caption = '&Line Numbers'
      Hint = 'Toggle line numbers'
      ImageIndex = 119
      OnExecute = ViewLineNumbersActionExecute
    end
    object ViewSpecialCharsAction: TAction
      Tag = 99
      Category = '&View'
      Caption = '&Special Chars'
      Hint = 'Toggle special characters'
      ImageIndex = 144
      OnExecute = ViewSpecialCharsActionExecute
    end
    object ViewSelectionModeAction: TAction
      Tag = 99
      Category = '&View'
      Caption = '&Selection Mode'
      Hint = 
        'Toggle selection mode. Also pressing Alt on editor will toggle s' +
        'election mode.'
      ImageIndex = 29
      OnExecute = ViewSelectionModeActionExecute
    end
    object ViewStyleAction: TAction
      Category = '&View'
      Caption = 'St&yle'
      ImageIndex = 90
      OnExecute = DummyActionExecute
    end
    object ViewNextPageAction: TAction
      Category = '&View'
      Caption = '&Next Page'
      Hint = 'Go next page'
      ImageIndex = 194
      ShortCut = 16393
      OnExecute = ViewNextPageActionExecute
    end
    object DatabaseObjectSearchAction: TAction
      Category = '&Database'
      Caption = '&Object Search...'
      Hint = 'Object search'
      ImageIndex = 51
      OnExecute = DatabaseObjectSearchActionExecute
    end
    object DatabaseRefreshAction: TAction
      Category = '&Database'
      Caption = '&Refresh'
      Hint = 'Refresh active schema browser'
      ImageIndex = 53
      ShortCut = 116
      OnExecute = DatabaseRefreshActionExecute
    end
    object DatabaseCloseTabAction: TAction
      Category = 'SQLEditor'
      Caption = '&Close'
      Hint = 'Close the active page'
      ImageIndex = 85
      ShortCut = 16499
      OnExecute = DatabaseCloseTabActionExecute
    end
    object DatabaseCloseAllTabAction: TAction
      Category = 'SQLEditor'
      Caption = 'Close &All'
      Hint = 'Close all pages'
      ImageIndex = 86
      OnExecute = DatabaseCloseAllTabActionExecute
    end
    object DatabaseCloseAllOtherTabsAction: TAction
      Category = 'SQLEditor'
      Caption = 'Close All Other Pages'
      Hint = 'Close all other pages than active page'
      ImageIndex = 87
      ShortCut = 24691
      OnExecute = DatabaseCloseAllOtherTabsActionExecute
    end
    object DatabaseCommitAction: TAction
      Category = 'SQLEditor'
      Caption = 'Commit'
      Hint = 'Commit'
      ImageIndex = 30
      OnExecute = DatabaseCommitActionExecute
    end
    object DatabaseRollbackAction: TAction
      Category = 'SQLEditor'
      Caption = 'Rollback'
      Hint = 'Rollback'
      ImageIndex = 166
      OnExecute = DatabaseRollbackActionExecute
    end
    object ExecuteStatementAction: TAction
      Category = 'SQLEditor'
      Caption = 'Execute Statement'
      Hint = 
        'Execute statement. Execute current statement by using Ctrl+Enter' +
        '.'
      ImageIndex = 48
      ShortCut = 120
      OnExecute = ExecuteStatementActionExecute
    end
    object ExecuteCurrentStatementAction: TAction
      Category = 'SQLEditor'
      Caption = 'Execute Current Statement'
      Hint = 'Execute current statement'
      ImageIndex = 49
      ShortCut = 16397
      OnExecute = ExecuteCurrentStatementActionExecute
    end
    object ExecuteScriptAction: TAction
      Category = 'SQLEditor'
      Caption = 'Execute Script'
      Hint = 'Execute as script'
      ImageIndex = 50
      ShortCut = 116
      OnExecute = ExecuteScriptActionExecute
    end
    object InsertObjectAction: TAction
      Category = 'SQLEditor'
      Caption = 'Insert Object'
      Hint = 'Insert object'
      ImageIndex = 108
      ShortCut = 16463
      OnExecute = InsertObjectActionExecute
    end
    object DBMSOutputAction: TAction
      Tag = 99
      Category = 'SQLEditor'
      Caption = 'DBMS Output'
      Hint = 'Toggle DBMS output'
      ImageIndex = 57
      OnExecute = DBMSOutputActionExecute
    end
    object ExplainPlanAction: TAction
      Category = 'SQLEditor'
      Caption = 'Explain Plan'
      Hint = 'Run explain plan for current statement'
      ImageIndex = 145
      OnExecute = ExplainPlanActionExecute
    end
    object DatabaseExportAction: TAction
      Category = 'E&xport'
      Caption = 'Ex&port'
      ImageIndex = 201
      OnExecute = DummyActionExecute
    end
    object DatabaseExportTableDataAction: TAction
      Category = 'E&xport'
      Caption = '&Table Data...'
      Hint = 'Export table data'
      ImageIndex = 201
      OnExecute = DatabaseExportTableDataActionExecute
    end
    object DatabaseImportAction: TAction
      Category = '&Import'
      Caption = '&Import'
      ImageIndex = 202
      OnExecute = DummyActionExecute
    end
    object DatabaseImportTableDataAction: TAction
      Category = '&Import'
      Caption = '&Table Data...'
      Hint = 'Import table data'
      ImageIndex = 202
      OnExecute = DatabaseImportTableDataActionExecute
    end
    object FormatSQLAction: TAction
      Category = 'SQLEditor'
      Caption = 'Format SQL'
      Enabled = False
      Hint = 'Format SQL'
      ImageIndex = 91
      ShortCut = 24646
      OnExecute = FormatSQLActionExecute
    end
    object EditSelectAllAction: TAction
      Category = '&Edit'
      Caption = '&Select All'
      Hint = 'Select all'
      ImageIndex = 172
      ShortCut = 16449
      OnExecute = EditSelectAllActionExecute
    end
    object ToolsSelectForCompareAction: TAction
      Category = '&Tools'
      Caption = 'Select for Compare...'
      Hint = 'Select for compare'
      ImageIndex = 31
      OnExecute = ToolsSelectForCompareActionExecute
    end
    object ToolsCompareSchemasAction: TAction
      Category = '&Tools'
      Caption = 'Compare &Schemas...'
      Hint = 'Compare schemas'
      ImageIndex = 46
      OnExecute = ToolsCompareSchemasActionExecute
    end
    object SchemaDocumentAction: TAction
      Category = '&Tools'
      Caption = 'Schema Document...'
      Hint = 'Schema document'
      ImageIndex = 69
      OnExecute = SchemaDocumentActionExecute
    end
    object ViewPreviousPageAction: TAction
      Category = '&View'
      Caption = '&Previous Page'
      ImageIndex = 193
      ShortCut = 24585
      OnExecute = ViewPreviousPageActionExecute
    end
    object EditIndentAction: TAction
      Category = '&Indent'
      Caption = 'I&ndent'
      ImageIndex = 99
      OnExecute = DummyActionExecute
    end
    object EditIncreaseIndentAction: TAction
      Category = '&Indent'
      Caption = '&Increase'
      Hint = 'Increase indent'
      ImageIndex = 100
      SecondaryShortCuts.Strings = (
        'Tab')
      ShortCut = 24649
      OnExecute = EditIncreaseIndentActionExecute
    end
    object EditDecreaseIndentAction: TAction
      Category = '&Indent'
      Caption = '&Decrease'
      Hint = 'Decrease indent'
      ImageIndex = 101
      SecondaryShortCuts.Strings = (
        'Shift+Tab')
      ShortCut = 24661
      OnExecute = EditDecreaseIndentActionExecute
    end
    object EditSortAction: TAction
      Category = '&Sort'
      Caption = 'Sort'
      ImageIndex = 178
      OnExecute = DummyActionExecute
    end
    object EditSortAscAction: TAction
      Category = '&Sort'
      Caption = '&Ascending'
      Hint = 'Sort ascending'
      ImageIndex = 180
      ShortCut = 24641
      OnExecute = EditSortAscActionExecute
    end
    object EditSortDescAction: TAction
      Category = '&Sort'
      Caption = '&Descending'
      Hint = 'Sort descending'
      ImageIndex = 181
      ShortCut = 24644
      OnExecute = EditSortDescActionExecute
    end
    object EditToggleCaseAction: TAction
      Category = '&Edit'
      Caption = '&Toggle Case'
      Hint = 'Toggle case'
      ImageIndex = 25
      ShortCut = 24643
      OnExecute = EditToggleCaseActionExecute
    end
    object EditInsertAction: TAction
      Category = '&Insert'
      Caption = '&Insert'
      ImageIndex = 0
      OnExecute = DummyActionExecute
    end
    object EditInsertLineAction: TAction
      Category = '&Insert'
      Caption = '&Line'
      Hint = 'Insert line'
      ImageIndex = 109
      ShortCut = 16462
      OnExecute = EditInsertLineActionExecute
    end
    object EditDeleteAction: TAction
      Category = '&Delete'
      Caption = '&Delete'
      ImageIndex = 58
      OnExecute = DummyActionExecute
    end
    object EditDeleteLineAction: TAction
      Category = '&Delete'
      Caption = '&Line'
      Hint = 'Delete line'
      ImageIndex = 61
      ShortCut = 16473
      OnExecute = EditDeleteLineActionExecute
    end
    object EditDeleteEOLAction: TAction
      Category = '&Delete'
      Caption = 'End of Line'
      Hint = 'Delete end of line'
      ImageIndex = 60
      ShortCut = 24665
      OnExecute = EditDeleteEOLActionExecute
    end
    object EditDeleteWordAction: TAction
      Category = '&Delete'
      Caption = '&Word'
      Hint = 'Delete word'
      ImageIndex = 63
      ShortCut = 16468
      OnExecute = EditDeleteWordActionExecute
    end
    object TNSNamesEditorAction: TAction
      Category = '&Tools'
      Caption = '&TNSNames Editor...'
      Hint = 'Configuration file (tnsnames.ora) editor'
      ImageIndex = 52
      OnExecute = TNSNamesEditorActionExecute
    end
    object DatabaseCreateAction: TAction
      Category = '&Create'
      Caption = '&Create'
      ImageIndex = 0
      OnExecute = DummyActionExecute
    end
    object DatabaseCreateConstraintAction: TAction
      Category = '&Create'
      Caption = '&Constraint...'
      ImageIndex = 35
      OnExecute = DatabaseCreateConstraintActionExecute
    end
    object DatabaseCreateDBLinkAction: TAction
      Category = '&Create'
      Caption = '&DB Link...'
      ImageIndex = 121
      OnExecute = DatabaseCreateDBLinkActionExecute
    end
    object DatabaseCreateFunctionAction: TAction
      Category = '&Create'
      Caption = '&Function...'
      ImageIndex = 93
      OnExecute = DatabaseCreateFunctionActionExecute
    end
    object DatabaseCreateIndexAction: TAction
      Category = '&Create'
      Caption = '&Index...'
      ImageIndex = 103
      OnExecute = DatabaseCreateIndexActionExecute
    end
    object DatabaseCreatePackageAction: TAction
      Category = '&Create'
      Caption = '&Package...'
      ImageIndex = 138
      OnExecute = DatabaseCreatePackageActionExecute
    end
    object DatabaseCreateProcedureAction: TAction
      Category = '&Create'
      Caption = 'P&rocedure...'
      ImageIndex = 153
      OnExecute = DatabaseCreateProcedureActionExecute
    end
    object DatabaseCreateSequenceAction: TAction
      Category = '&Create'
      Caption = '&Sequence...'
      ImageIndex = 174
      OnExecute = DatabaseCreateSequenceActionExecute
    end
    object DatabaseCreateSynonymAction: TAction
      Category = '&Create'
      Caption = 'S&ynonym...'
      ImageIndex = 188
      OnExecute = DatabaseCreateSynonymActionExecute
    end
    object DatabaseCreateTableAction: TAction
      Category = '&Create'
      Caption = '&Table...'
      ImageIndex = 196
      OnExecute = DatabaseCreateTableActionExecute
    end
    object DatabaseCreateTriggerAction: TAction
      Category = '&Create'
      Caption = 'Tri&gger...'
      ImageIndex = 219
      OnExecute = DatabaseCreateTriggerActionExecute
    end
    object DatabaseCreateUserAction: TAction
      Category = '&Create'
      Caption = '&User...'
      ImageIndex = 225
      OnExecute = DatabaseCreateUserActionExecute
    end
    object DatabaseCreateViewAction: TAction
      Category = '&Create'
      Caption = '&View...'
      ImageIndex = 231
      OnExecute = DatabaseCreateViewActionExecute
    end
    object SelectStyleAction: TAction
      Caption = 'SelectStyleAction'
      OnExecute = SelectStyleActionExecute
    end
    object SearchClearBookmarksAction: TAction
      Category = '&Search'
      Caption = 'Clear &Bookmarks'
      Hint = 'Clear all bookmarks'
      ImageIndex = 22
      OnExecute = SearchClearBookmarksActionExecute
    end
    object SearchGotoLineAction: TAction
      Category = '&Search'
      Caption = 'Go to Line'
      ImageIndex = 97
      ShortCut = 16455
      OnExecute = SearchGotoLineActionExecute
    end
    object SearchGotoBookmarksAction: TAction
      Category = 'Go to Bookmarks'
      Caption = 'Go to Bookmarks'
      ImageIndex = 23
      OnExecute = DummyActionExecute
    end
    object GotoBookmarks1Action: TAction
      Category = 'Go to Bookmarks'
      Caption = 'Bookmark &1'
      ImageIndex = 12
      ShortCut = 16433
      OnExecute = GotoBookmarks0ActionExecute
    end
    object GotoBookmarks2Action: TAction
      Category = 'Go to Bookmarks'
      Caption = 'Bookmark &2'
      ImageIndex = 13
      ShortCut = 16434
      OnExecute = GotoBookmarks0ActionExecute
    end
    object GotoBookmarks3Action: TAction
      Category = 'Go to Bookmarks'
      Caption = 'Bookmark &3'
      ImageIndex = 14
      ShortCut = 16435
      OnExecute = GotoBookmarks0ActionExecute
    end
    object GotoBookmarks4Action: TAction
      Category = 'Go to Bookmarks'
      Caption = 'Bookmark &4'
      ImageIndex = 15
      ShortCut = 16436
      OnExecute = GotoBookmarks0ActionExecute
    end
    object GotoBookmarks5Action: TAction
      Category = 'Go to Bookmarks'
      Caption = 'Bookmark &5'
      ImageIndex = 16
      ShortCut = 16437
      OnExecute = GotoBookmarks0ActionExecute
    end
    object GotoBookmarks6Action: TAction
      Category = 'Go to Bookmarks'
      Caption = 'Bookmark &6'
      ImageIndex = 17
      ShortCut = 16438
      OnExecute = GotoBookmarks0ActionExecute
    end
    object GotoBookmarks7Action: TAction
      Category = 'Go to Bookmarks'
      Caption = 'Bookmark &7'
      ImageIndex = 18
      ShortCut = 16439
      OnExecute = GotoBookmarks0ActionExecute
    end
    object GotoBookmarks8Action: TAction
      Category = 'Go to Bookmarks'
      Caption = 'Bookmark &8'
      ImageIndex = 19
      ShortCut = 16440
      OnExecute = GotoBookmarks0ActionExecute
    end
    object GotoBookmarks9Action: TAction
      Category = 'Go to Bookmarks'
      Caption = 'Bookmark &9'
      ImageIndex = 20
      ShortCut = 16441
      OnExecute = GotoBookmarks0ActionExecute
    end
    object SearchToggleBookmarksAction: TAction
      Category = 'T&oggle Bookmarks'
      Caption = 'Toggle Bookmarks'
      ImageIndex = 24
      OnExecute = DummyActionExecute
    end
    object ToggleBookmarks1Action: TAction
      Category = 'T&oggle Bookmarks'
      Caption = 'Bookmark &1'
      ImageIndex = 12
      ShortCut = 24625
      OnExecute = ToggleBookmarks0ActionExecute
    end
    object ToggleBookmarks2Action: TAction
      Category = 'T&oggle Bookmarks'
      Caption = 'Bookmark &2'
      ImageIndex = 13
      ShortCut = 24626
      OnExecute = ToggleBookmarks0ActionExecute
    end
    object ToggleBookmarks3Action: TAction
      Category = 'T&oggle Bookmarks'
      Caption = 'Bookmark &3'
      ImageIndex = 14
      ShortCut = 24627
      OnExecute = ToggleBookmarks0ActionExecute
    end
    object ToggleBookmarks4Action: TAction
      Category = 'T&oggle Bookmarks'
      Caption = 'Bookmark &4'
      ImageIndex = 15
      ShortCut = 24628
      OnExecute = ToggleBookmarks0ActionExecute
    end
    object ToggleBookmarks5Action: TAction
      Category = 'T&oggle Bookmarks'
      Caption = 'Bookmark &5'
      ImageIndex = 16
      ShortCut = 24629
      OnExecute = ToggleBookmarks0ActionExecute
    end
    object ToggleBookmarks6Action: TAction
      Category = 'T&oggle Bookmarks'
      Caption = 'Bookmark &6'
      ImageIndex = 17
      ShortCut = 24630
      OnExecute = ToggleBookmarks0ActionExecute
    end
    object ToggleBookmarks7Action: TAction
      Category = 'T&oggle Bookmarks'
      Caption = 'Bookmark &7'
      ImageIndex = 18
      ShortCut = 24631
      OnExecute = ToggleBookmarks0ActionExecute
    end
    object ToggleBookmarks8Action: TAction
      Category = 'T&oggle Bookmarks'
      Caption = 'Bookmark &8'
      ImageIndex = 19
      ShortCut = 24632
      OnExecute = ToggleBookmarks0ActionExecute
    end
    object ToggleBookmarks9Action: TAction
      Category = 'T&oggle Bookmarks'
      Caption = 'Bookmark &9'
      ImageIndex = 20
      ShortCut = 24633
      OnExecute = ToggleBookmarks0ActionExecute
    end
    object FileReopenClearAction: TAction
      Category = '&Reopen'
      Caption = '&Clear'
      ImageIndex = 58
      OnExecute = FileReopenClearActionExecute
    end
    object SelectReopenFileAction: TAction
      OnExecute = SelectReopenFileActionExecute
    end
  end
  object ApplicationEvents: TApplicationEvents
    OnActivate = ApplicationEventsActivate
    OnHint = ApplicationEventsHint
    OnMessage = ApplicationEventsMessage
    Left = 62
    Top = 148
  end
  object PageControlPopupActionBar: TPopupActionBar
    Images = ImagesDataModule.ImageList
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
  object DocumentPopupActionBar: TPopupActionBar
    Images = ImagesDataModule.ImageList
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
  object Taskbar: TTaskbar
    TaskBarButtons = <>
    ProgressMaxValue = 100
    TabProperties = []
    Left = 408
    Top = 235
  end
end
