object SchemaBrowserFrame: TSchemaBrowserFrame
  Left = 0
  Top = 0
  Width = 831
  Height = 595
  Margins.Left = 0
  Margins.Top = 0
  Margins.Right = 0
  Margins.Bottom = 0
  Align = alClient
  Padding.Right = 1
  Padding.Bottom = 1
  TabOrder = 0
  ExplicitWidth = 451
  ExplicitHeight = 302
  object Splitter: TJvSplitter
    Left = 289
    Top = 0
    Height = 594
    Hint = ' '
    ExplicitLeft = 240
    ExplicitTop = 176
    ExplicitHeight = 100
  end
  object LeftPanel: TPanel
    Left = 0
    Top = 0
    Width = 289
    Height = 594
    Hint = ' '
    Align = alLeft
    BevelOuter = bvNone
    Padding.Left = 1
    Padding.Bottom = 1
    ParentShowHint = False
    ShowHint = False
    TabOrder = 0
    ExplicitHeight = 301
    inline ObjectTreeFrame: TObjectTreeFrame
      Left = 1
      Top = 0
      Width = 288
      Height = 593
      Align = alClient
      Ctl3D = True
      ParentCtl3D = False
      TabOrder = 0
      ExplicitLeft = 1
      ExplicitWidth = 288
      ExplicitHeight = 300
      inherited BottomPanel: TPanel
        Top = 567
        Width = 288
        ParentShowHint = False
        ExplicitTop = 274
        ExplicitWidth = 288
        inherited ButtonPanel: TPanel
          Left = 261
          ExplicitLeft = 261
          inherited JvToolBar1: TBCToolBar
            inherited FilterToolButton: TToolButton
              ParentShowHint = False
            end
          end
        end
        inherited ComboPanel: TPanel
          Width = 261
          Hint = ' '
          ParentShowHint = False
          ExplicitWidth = 261
          inherited SchemaComboBox: TBCComboBox
            Width = 260
            Hint = 'Schema name'
            ExplicitWidth = 260
          end
        end
      end
      inherited VirtualDrawTree: TVirtualDrawTree
        Width = 288
        Height = 567
        Hint = ' '
        ParentShowHint = False
        PopupMenu = PopupMenu
        OnClick = ObjectTreeFrameVirtualDrawTreeClick
        OnEditing = ObjectTreeFrameVirtualDrawTreeEditing
        OnKeyUp = ObjectTreeFrameVirtualDrawTreeKeyUp
        OnMouseDown = ObjectTreeFrameVirtualDrawTreeMouseDown
        ExplicitWidth = 288
        ExplicitHeight = 274
      end
      inherited UsersQuery: TOraQuery
        Left = 234
        Top = 230
      end
    end
  end
  object RightPanel: TPanel
    Left = 292
    Top = 0
    Width = 538
    Height = 594
    Hint = ' '
    Align = alClient
    BevelOuter = bvNone
    Caption = 'Select an object from the tree on the left'
    ParentShowHint = False
    ShowHint = False
    TabOrder = 1
    ExplicitWidth = 158
    ExplicitHeight = 301
  end
  object SchemaActionList: TActionList
    Images = ObjectTreeFrame.TreeImageList
    Left = 108
    Top = 244
    object AlterTableAction: TAction
      Caption = 'Alter or Recreate Table...'
      Hint = 'Alter/recreate a table'
      ImageIndex = 31
      OnExecute = AlterTableActionExecute
    end
    object AlterViewAction: TAction
      Caption = 'Alter View...'
      Hint = 'Alter a view'
      ImageIndex = 69
      OnExecute = AlterViewActionExecute
    end
    object AnalyzeTableAction: TAction
      Caption = 'AnalyzeTableAction'
      Hint = 'Analyze a table'
      ImageIndex = 37
      OnExecute = AnalyzeTableActionExecute
    end
    object CompileAllInvalidObjectsAction: TAction
      Caption = 'Compile All Invalid Objects'
      ImageIndex = 33
      OnExecute = CompileAllInvalidObjectsActionExecute
    end
    object CompileInvalidObjectAction: TAction
      Caption = 'Compile Invalid Object'
      ImageIndex = 34
      OnExecute = CompileInvalidObjectActionExecute
    end
    object CreateConstraintAction: TAction
      Caption = 'CreateConstraintAction'
      Hint = 'Create a constraint'
      ImageIndex = 62
      OnExecute = CreateConstraintActionExecute
    end
    object CreateConstraintForObjectAction: TAction
      Caption = 'CreateConstraintForObjectAction'
      Hint = 'Create a constraint for an object'
      ImageIndex = 62
      OnExecute = CreateConstraintForObjectActionExecute
    end
    object CreateDBLinkAction: TAction
      Caption = 'CreateDBLinkAction'
      Hint = 'Create a database Link'
      ImageIndex = 66
      OnExecute = CreateDBLinkActionExecute
    end
    object CreateIndexAction: TAction
      Caption = 'CreateIndexAction'
      Hint = 'Create an index'
      ImageIndex = 63
      OnExecute = CreateIndexActionExecute
    end
    object CreateIndexForObjectAction: TAction
      Caption = 'CreateIndexForObjectAction'
      Hint = 'Create an index'
      ImageIndex = 63
      OnExecute = CreateIndexForObjectActionExecute
    end
    object CreatePackageAction: TAction
      Caption = 'CreatePackageAction'
      Hint = 'Create a package'
      ImageIndex = 60
      OnExecute = CreatePackageActionExecute
    end
    object CreateProcedureAction: TAction
      Caption = 'CreateProcedureAction'
      Hint = 'Create a procedure'
      ImageIndex = 59
      OnExecute = CreateProcedureActionExecute
    end
    object CreateSequenceAction: TAction
      Caption = 'CreateSequenceAction'
      Hint = 'Create a sequence'
      ImageIndex = 64
      OnExecute = CreateSequenceActionExecute
    end
    object CreateSynonymAction: TAction
      Caption = 'Create Synonym For %s...'
      Hint = 'Create a synonym'
      ImageIndex = 65
      OnExecute = CreateSynonymActionExecute
    end
    object CreateSynonymForObjectAction: TAction
      Caption = 'Create Synonym For %s...'
      Hint = 'Create a synonym for an object'
      ImageIndex = 65
      OnExecute = CreateSynonymForObjectActionExecute
    end
    object CreateTableAction: TAction
      Caption = 'CreateTableAction'
      Hint = 'Create table'
      ImageIndex = 56
      OnExecute = CreateTableActionExecute
    end
    object CreateFunctionAction: TAction
      Caption = 'CreateFunctionAction'
      Hint = 'Create a function'
      ImageIndex = 58
      OnExecute = CreateFunctionActionExecute
    end
    object CreateTriggerAction: TAction
      Caption = 'CreateTriggerAction'
      Hint = 'Create a trigger'
      ImageIndex = 61
      OnExecute = CreateTriggerActionExecute
    end
    object CreateTriggerForObjectAction: TAction
      Caption = 'CreateTriggerForObjectAction'
      Hint = 'Create a trigger for an object'
      ImageIndex = 61
      OnExecute = CreateTriggerForObjectActionExecute
    end
    object CreateUserAction: TAction
      Caption = 'Create %s %s'
      Hint = 'Create user'
      ImageIndex = 67
      OnExecute = CreateUserActionExecute
    end
    object CreateViewAction: TAction
      Caption = 'CreateViewAction'
      Hint = 'Create view'
      ImageIndex = 57
      OnExecute = CreateViewActionExecute
    end
    object CustomizeObjectBrowserAction: TAction
      Caption = 'Customize Object Browser...'
      Hint = 'Customize object browser'
      ImageIndex = 68
      OnExecute = CustomizeObjectBrowserActionExecute
    end
    object DisableAllConstraintsAction: TAction
      Caption = 'Disable All Constraints'
      Hint = 'Disable all constraints'
      ImageIndex = 39
      OnExecute = DisableAllConstraintsActionExecute
    end
    object DisableAllTriggersAction: TAction
      Caption = 'Disable All Triggers'
      Hint = 'Disable all triggers'
      ImageIndex = 39
      OnExecute = DisableAllTriggersActionExecute
    end
    object DisableObjectConstraintsAction: TAction
      Caption = 'DisableObjectConstraintsAction'
      Hint = 'Disable all constraints'
      ImageIndex = 39
      OnExecute = DisableObjectConstraintsActionExecute
    end
    object DisableObjectTriggersAction: TAction
      Caption = 'DisableObjectTriggersAction'
      ImageIndex = 39
      OnExecute = DisableObjectTriggersActionExecute
    end
    object DropAction: TAction
      Caption = 'Drop %s %s'
      ImageIndex = 82
      OnExecute = DropActionExecute
    end
    object EnableAllConstraintsAction: TAction
      Caption = 'Enable All Constraints'
      Hint = 'Enable all constraints'
      ImageIndex = 38
      OnExecute = EnableAllConstraintsActionExecute
    end
    object EnableAllTriggersAction: TAction
      Caption = 'Enable All Triggers'
      Hint = 'Enable all triggers'
      ImageIndex = 38
      OnExecute = EnableAllTriggersActionExecute
    end
    object EnableObjectConstraintsAction: TAction
      Caption = 'EnableObjectConstraintsAction'
      Hint = 'Enable all constraints'
      ImageIndex = 38
      OnExecute = EnableObjectConstraintsActionExecute
    end
    object FlashbackTableAction: TAction
      Caption = 'Flashback %s'
      Hint = 'Flashback a table'
      ImageIndex = 35
      OnExecute = FlashbackTableActionExecute
    end
    object EnableObjectTriggersAction: TAction
      Caption = 'EnableObjectTriggersAction'
      ImageIndex = 38
      OnExecute = EnableObjectTriggersActionExecute
    end
    object GenerateTableSelectStatementAction: TAction
      Caption = 'Select'
      Hint = 'Generate Select Statement To Clipboard'
      OnExecute = GenerateTableSelectStatementActionExecute
    end
    object GenerateViewSelectStatementAction: TAction
      Caption = 'Select'
      Hint = 'Generate Select Statement To Clipboard'
      OnExecute = GenerateViewSelectStatementActionExecute
    end
    object GenerateInsertStatementAction: TAction
      Caption = 'Insert'
      Hint = 'Generate Insert Statement To Clipboard'
      OnExecute = GenerateInsertStatementActionExecute
    end
    object GenerateUpdateStatementAction: TAction
      Caption = 'Update'
      Hint = 'Generate Update Statement To Clipboard'
      OnExecute = GenerateUpdateStatementActionExecute
    end
    object GenerateDeleteStatementAction: TAction
      Caption = 'Delete'
      Hint = 'Generate Delete Statement To Clipboard'
      OnExecute = GenerateDeleteStatementActionExecute
    end
    object GrantPrivilegesForObjectAction: TAction
      Caption = 'GrantPrivilegesForObjectAction'
      Hint = 'Grant privieleges for an object'
      ImageIndex = 70
      OnExecute = GrantPrivilegesForObjectActionExecute
    end
    object PurgeAllObjectsAction: TAction
      Caption = 'Purge All Objects'
      Hint = 'Purge all objects'
      ImageIndex = 36
      OnExecute = PurgeAllObjectsActionExecute
    end
    object PurgeObjectAction: TAction
      Caption = 'Purge %s'
      Hint = 'Purge an object'
      ImageIndex = 36
      OnExecute = PurgeObjectActionExecute
    end
    object RenameObjectAction: TAction
      Caption = 'Rename %s'
      ImageIndex = 32
      OnExecute = RenameObjectActionExecute
    end
    object ChangeUserPasswordAction: TAction
      Caption = 'ChangeUserPasswordAction'
      Hint = 'Change user'#39's password'
      OnExecute = ChangeUserPasswordActionExecute
    end
    object CustomizeObjectFiltersAction: TAction
      Caption = '&Customize...'
      OnExecute = CustomizeObjectFiltersActionExecute
    end
  end
  object PopupMenu: TBCPopupMenu
    Images = ObjectTreeFrame.TreeImageList
    Left = 148
    Top = 64
  end
end
