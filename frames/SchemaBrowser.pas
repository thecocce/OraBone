unit SchemaBrowser;

interface

uses
  System.SysUtils, System.Variants, System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, TableBrowser, ViewBrowser,
  Vcl.Dialogs, ObjectTree, Vcl.ExtCtrls, JvExExtCtrls, JvSplitter, Vcl.ComCtrls, FuncProcBrowser, PackageBrowser,
  TriggerBrowser, ConstraintBrowser, IndexBrowser, SequenceBrowser, SynonymBrowser, DBLinkBrowser, RecycleBinBrowser,
  UserBrowser, DBAccess, Ora, Vcl.Menus, Vcl.ActnList, VirtualTrees,
  Vcl.PlatformDefaultStyleActnCtrls, Vcl.ActnPopup, System.Actions, BCCommon.Images, OraCall, Data.DB;

type
  TSchemaBrowserFrame = class(TFrame)
    LeftPanel: TPanel;
    Splitter: TJvSplitter;
    ObjectTreeFrame: TObjectTreeFrame;
    RightPanel: TPanel;
    SchemaActionList: TActionList;
    PurgeAllObjectsAction: TAction;
    FlashbackTableAction: TAction;
    PurgeObjectAction: TAction;
    DropAction: TAction;
    GenerateInsertStatementAction: TAction;
    GenerateTableSelectStatementAction: TAction;
    GenerateUpdateStatementAction: TAction;
    GenerateDeleteStatementAction: TAction;
    AlterTableAction: TAction;
    CompileAllInvalidObjectsAction: TAction;
    CompileInvalidObjectAction: TAction;
    RenameObjectAction: TAction;
    CreateSynonymAction: TAction;
    AnalyzeTableAction: TAction;
    EnableAllConstraintsAction: TAction;
    DisableAllConstraintsAction: TAction;
    EnableAllTriggersAction: TAction;
    DisableAllTriggersAction: TAction;
    CreateUserAction: TAction;
    PopupActionBar: TPopupActionBar;
    CustomizeObjectBrowserAction: TAction;
    CreatePackageAction: TAction;
    CreateTableAction: TAction;
    CreateViewAction: TAction;
    CreateSequenceAction: TAction;
    CreateIndexAction: TAction;
    CreateConstraintAction: TAction;
    CreateTriggerAction: TAction;
    CreateDBLinkAction: TAction;
    CreateFunctionAction: TAction;
    CreateProcedureAction: TAction;
    EnableObjectConstraintsAction: TAction;
    DisableObjectConstraintsAction: TAction;
    EnableObjectTriggersAction: TAction;
    DisableObjectTriggersAction: TAction;
    AlterViewAction: TAction;
    CreateConstraintForObjectAction: TAction;
    CreateTriggerForObjectAction: TAction;
    CreateSynonymForObjectAction: TAction;
    GrantPrivilegesForObjectAction: TAction;
    CreateIndexForObjectAction: TAction;
    ChangeUserPasswordAction: TAction;
    CustomizeObjectFiltersAction: TAction;
    GenerateViewSelectStatementAction: TAction;
    procedure PurgeAllObjectsActionExecute(Sender: TObject);
    procedure PurgeObjectActionExecute(Sender: TObject);
    procedure FlashbackTableActionExecute(Sender: TObject);
    procedure DropActionExecute(Sender: TObject);
    procedure GenerateTableSelectStatementActionExecute(Sender: TObject);
    procedure GenerateInsertStatementActionExecute(Sender: TObject);
    procedure GenerateUpdateStatementActionExecute(Sender: TObject);
    procedure GenerateDeleteStatementActionExecute(Sender: TObject);
    procedure CompileInvalidObjectActionExecute(Sender: TObject);
    procedure CompileAllInvalidObjectsActionExecute(Sender: TObject);
    procedure RenameObjectActionExecute(Sender: TObject);
    procedure CreateSynonymActionExecute(Sender: TObject);
    procedure AnalyzeTableActionExecute(Sender: TObject);
    procedure EnableAllConstraintsActionExecute(Sender: TObject);
    procedure DisableAllConstraintsActionExecute(Sender: TObject);
    procedure EnableAllTriggersActionExecute(Sender: TObject);
    procedure DisableAllTriggersActionExecute(Sender: TObject);
    procedure CustomizeObjectBrowserActionExecute(Sender: TObject);
    procedure ObjectTreeFrameVirtualDrawTreeClick(Sender: TObject);
    procedure ObjectTreeFrameVirtualDrawTreeEditing(Sender: TBaseVirtualTree; Node: PVirtualNode;
      Column: TColumnIndex; var Allowed: Boolean);
    procedure ObjectTreeFrameVirtualDrawTreeKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ObjectTreeFrameVirtualDrawTreeMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure CreateUserActionExecute(Sender: TObject);
    procedure CreateTableActionExecute(Sender: TObject);
    procedure CreateViewActionExecute(Sender: TObject);
    procedure CreateSequenceActionExecute(Sender: TObject);
    procedure CreateIndexActionExecute(Sender: TObject);
    procedure CreateConstraintActionExecute(Sender: TObject);
    procedure CreateTriggerActionExecute(Sender: TObject);
    procedure CreateDBLinkActionExecute(Sender: TObject);
    procedure CreateFunctionActionExecute(Sender: TObject);
    procedure CreateProcedureActionExecute(Sender: TObject);
    procedure CreatePackageActionExecute(Sender: TObject);
    procedure AlterTableActionExecute(Sender: TObject);
    procedure EnableObjectConstraintsActionExecute(Sender: TObject);
    procedure DisableObjectConstraintsActionExecute(Sender: TObject);
    procedure EnableObjectTriggersActionExecute(Sender: TObject);
    procedure DisableObjectTriggersActionExecute(Sender: TObject);
    procedure AlterViewActionExecute(Sender: TObject);
    procedure CreateConstraintForObjectActionExecute(Sender: TObject);
    procedure CreateTriggerForObjectActionExecute(Sender: TObject);
    procedure CreateSynonymForObjectActionExecute(Sender: TObject);
    procedure CreateIndexForObjectActionExecute(Sender: TObject);
    procedure GrantPrivilegesForObjectActionExecute(Sender: TObject);
    procedure ChangeUserPasswordActionExecute(Sender: TObject);
    procedure CustomizeObjectFiltersActionExecute(Sender: TObject);
    procedure CustomizeObjectFiltersMenuClick(Sender: TObject);
    procedure GenerateViewSelectStatementActionExecute(Sender: TObject);
  private
    { Private declarations }
    FObjectFrameAlign: TAlign;
    FTableBrowserFrame: TTableBrowserFrame;
    FViewBrowserFrame: TViewBrowserFrame;
    FFuncProcBrowserFrame: TFuncProcBrowserFrame;
    FPackageBrowserFrame: TPackageBrowserFrame;
    FTriggerBrowserFrame: TTriggerBrowserFrame;
    FConstraintBrowserFrame: TConstraintBrowserFrame;
    FIndexBrowserFrame: TIndexBrowserFrame;
    FSequenceBrowserFrame: TSequenceBrowserFrame;
    FSynonymBrowserFrame: TSynonymBrowserFrame;
    FDBLinkBrowserFrame: TDBLinkBrowserFrame;
    FRecycleBinBrowserFrame: TRecycleBinBrowserFrame;
    FUserBrowserFrame: TUserBrowserFrame;

    procedure FillPopupActionBar;
    function GetDataQueryOpened: Boolean;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    procedure CreateFrames;
    procedure SetFrames(Refresh: Boolean);
    procedure SetShortCuts(Clear: Boolean = False);
    property DataQueryOpened: Boolean read GetDataQueryOpened;
    property TableBrowserFrame: TTableBrowserFrame read FTableBrowserFrame;
    property ViewBrowserFrame: TViewBrowserFrame read FViewBrowserFrame;
    property FuncProcBrowserFrame: TFuncProcBrowserFrame read FFuncProcBrowserFrame;
    property PackageBrowserFrame: TPackageBrowserFrame read FPackageBrowserFrame;
    property TriggerBrowserFrame: TTriggerBrowserFrame read FTriggerBrowserFrame;
    property ConstraintBrowserFrame: TConstraintBrowserFrame read FConstraintBrowserFrame;
    property IndexBrowserFrame: TIndexBrowserFrame read FIndexBrowserFrame;
    property SequenceBrowserFrame: TSequenceBrowserFrame read FSequenceBrowserFrame;
    property SynonymBrowserFrame: TSynonymBrowserFrame read FSynonymBrowserFrame;
    property DBLinkBrowserFrame: TDBLinkBrowserFrame read FDBLinkBrowserFrame;
    property UserBrowserFrame: TUserBrowserFrame read FUserBrowserFrame;
    procedure AssignOptions;
    function SelectionFound: Boolean;
    procedure UpdateMarginsAndControls(DoubleBuffered: Boolean);
  end;

implementation

{$R *.dfm}

uses
  Vcl.ClipBrd, BCCommon.OptionsContainer, CustomizePages, CreateSynonym, OraError, DropTable,
  DropUser, CustomizeObjectBrowser, CreateUser, CreateTable, CreateView, CreateSequence,
  CreateIndex, CreateConstraint, CreateTrigger, CreateDBLink, CreateFunction, CreateProcedure,
  CreatePackage, DataModule, AlterTable, AlterView, GrantPrivileges, ChangeUserPassword, BCCommon.Lib,
  SynEdit, CustomizeObjectFilters, Lib, BCCommon.StyleUtils,
  BCCommon.Messages, BCCommon.StringUtils;

const
  CAPTION_PURGE = 'Purge %s';
  CAPTION_FLASHBACK = 'Flashback Table %s';
  CAPTION_DROP = 'Drop %s %s';
  CAPTION_CREATE = 'Create %s...';
  CAPTION_RENAME = 'Rename %s %s';
  CAPTION_CONSTRAINT = 'Constraint For %s...';
  CAPTION_INDEX = 'Index For %s...';
  CAPTION_SYNONYM = 'Synonym For %s...';
  CAPTION_TRIGGER = 'Trigger For %s...';
  CAPTION_ANALYZE = 'Analyze Table %s...';
  CAPTION_ALTER_TABLE = 'Alter or Recreate Table %s...';
  CAPTION_ALTER_VIEW = 'Alter View %s...';
  CAPTION_GRANT = 'Grant Privileges For %s...';
  CAPTION_CHANGE_PASSWORD = 'Change Password of %s';

  COLUMN_NAME = 'Column Name';
  PRIMARY_KEY = 'Pk';

constructor TSchemaBrowserFrame.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  PopupActionBar.Images := ImagesDataModule.ImageList;
  SchemaActionList.Images := ImagesDataModule.ImageList;
  AssignOptions;
end;

procedure TSchemaBrowserFrame.AssignOptions;
begin
  ObjectTreeFrame.VirtualDrawTree.Indent := OptionsContainer.SchemaBrowserIndent;
  if OptionsContainer.SchemaBrowserShowTreeLines then
    ObjectTreeFrame.VirtualDrawTree.TreeOptions.PaintOptions := ObjectTreeFrame.VirtualDrawTree.TreeOptions.PaintOptions + [toShowTreeLines]
  else
    ObjectTreeFrame.VirtualDrawTree.TreeOptions.PaintOptions := ObjectTreeFrame.VirtualDrawTree.TreeOptions.PaintOptions - [toShowTreeLines];

  with ObjectTreeFrame do
  if OptionsContainer.SchemaBrowserAlign = 'Bottom' then
  begin
    BottomPanel.Align := alBottom;

    ComboPanel.Padding.Top := 2;
    BottomPanel.Padding.Bottom := 1;
    BottomPanel.Height := 26;
  end
  else
  begin
    BottomPanel.Align := alTop;

    ComboPanel.Padding.Top := 0;
    BottomPanel.Padding.Bottom := 0;
    BottomPanel.Height := 24;
  end;

  if OptionsContainer.ObjectFrameAlign = 'Bottom' then
    FObjectFrameAlign := alBottom
  else
    FObjectFrameAlign := alTop;
  if Assigned(ObjectTreeFrame.Session) then
    ObjectTreeFrame.VirtualDrawTree.OnClick(nil);
end;

procedure TSchemaBrowserFrame.GenerateViewSelectStatementActionExecute(Sender: TObject);
var
  s: string;
  RightMargin: Integer;
begin
  RightMargin := OptionsContainer.MarginRightMargin;
  s := 'SELECT ';
  Clipboard.Clear;
  ViewBrowserFrame.OpenQuery(FViewBrowserFrame.ColumnsQuery);
  with FViewBrowserFrame.ColumnsQuery do
  begin
    DisableControls;
    First;
    while not Eof do
    begin
      s := s + LowerCase(Trim(FieldByName(COLUMN_NAME).AsWideString));
      Next;
      if not Eof then
        s := s + ', ';

      if Length(s) + Length(Trim(FieldByName(COLUMN_NAME).AsWideString)) > RightMargin then
      begin
        Clipboard.AsText := Clipboard.AsText + s;
        if not Eof then
          Clipboard.AsText := Clipboard.AsText + CHR_ENTER;
        s := '       ';
      end;
    end;
    if s <> '' then
      Clipboard.AsText := Clipboard.AsText + s;
    First;
    EnableControls;
  end;
  Clipboard.AsText := Clipboard.AsText + CHR_ENTER + '  FROM ' + LowerCase(ObjectTreeFrame.SchemaParam) + '.' + LowerCase(ObjectTreeFrame.ObjectName);
end;

procedure TSchemaBrowserFrame.AlterTableActionExecute(Sender: TObject);
begin
  with AlterTableDialog do
  try
    if Open(ObjectTreeFrame.Session, ObjectTreeFrame.SchemaParam, ObjectTreeFrame.ObjectName) then
      if ExecuteSQL then
      begin
        ObjectTreeFrame.VirtualDrawTree.OnClick(nil);
        if AlterTableRadioButton.Checked then
          ShowMessage('Table altered.')
        else
          ShowMessage('Table recreated.');
      end;
  finally
    Free;
  end;
end;

procedure TSchemaBrowserFrame.AlterViewActionExecute(Sender: TObject);
begin
  with AlterViewDialog do
  try
    if Open(ObjectTreeFrame.Session, ObjectTreeFrame.SchemaParam, ObjectTreeFrame.ObjectName) then
      if ExecuteSQL then
      begin
        ObjectTreeFrame.VirtualDrawTree.OnClick(nil);
        ShowMessage('View altered.');
      end;
  finally
    Free;
  end;
end;

procedure TSchemaBrowserFrame.AnalyzeTableActionExecute(Sender: TObject);
var
  OraSQL: TOraSQL;
begin
  try
    OraSQL := TOraSQL.Create(nil);
    try
      OraSQL.Session := ObjectTreeFrame.Session;
      OraSQL.Text := 'BEGIN SYS.DBMS_STATS.GATHER_TABLE_STATS(:schema, :table, CASCADE => TRUE); END;';
      OraSQL.ParamByName('SCHEMA').AsString := ObjectTreeFrame.SchemaParam;
      OraSQL.ParamByName('TABLE').AsString := ObjectTreeFrame.ObjectName;
      OraSQL.Prepare;
      OraSQL.Execute;
    finally
      ShowMessage('Table analyzed.');
      OraSQL.Free;
    end;
  except
    on E: EOraError do
      ShowErrorMessage(E.Message);
  end;
end;

procedure TSchemaBrowserFrame.ChangeUserPasswordActionExecute(Sender: TObject);
begin
  try
    if ChangeUserPasswordDialog.Open(ObjectTreeFrame.ObjectName) then
    begin
      ObjectTreeFrame.Session.ExecSQL(ChangeUserPasswordDialog.GetSQL, []);
      ShowMessage('Password changed.');
    end;
  except
    on E: EOraError do
      ShowErrorMessage(E.Message);
  end;
end;

procedure TSchemaBrowserFrame.CompileAllInvalidObjectsActionExecute(Sender: TObject);
//var
//  ObjectName: string;
begin
  with ObjectTreeFrame.InvalidObjectsQuery do
  try
    ParamByName('P_SCHEMA').AsWideString := ObjectTreeFrame.SchemaParam;
    Prepare;
    Open;
    while Executing do
      Application.ProcessMessages;
    while not Eof do
    begin
      //ObjectName := Copy(FieldByName('NAME').AsWideString, Pos(' ', FieldByName('NAME').AsWideString) + 1, Length(FieldByName('NAME').AsWideString));
      try
        ObjectTreeFrame.Session.ExecSQL(Format('ALTER %s COMPILE', [FieldByName('NAME').AsWideString]), []);
      except
        on E: Exception do
          ShowErrorMessage(E.Message);
      end;
      Next;
    end;
  finally
    Close;
    ObjectTreeFrame.Refresh;
  end;
end;

procedure TSchemaBrowserFrame.CompileInvalidObjectActionExecute(Sender: TObject);
var
  ObjectText, ObjectType: string;
begin
  ObjectText := ObjectTreeFrame.GetSelectedObjectText;
  ObjectType := ObjectTreeFrame.GetSelectedObjectType;
  //if TRootNodeData(ObjectTreeFrame.ObjectTreeView.Selected.Parent.Data).RootType = OBJECT_TYPE_INVALID_OBJECT then
  if Pos('PACKAGE', ObjectText) = 1 then
    ObjectText := StringReplace(ObjectText, 'BODY', '', []);

  if ObjectType = OBJECT_TYPE_INVALID_OBJECT then
    ObjectTreeFrame.Session.ExecSQL(Format('ALTER %s COMPILE', [ObjectText]), [])
  else
    ObjectTreeFrame.Session.ExecSQL(Format('ALTER %s %s COMPILE', [ObjectType, ObjectText]), []);
  ObjectTreeFrame.Refresh;
end;

procedure TSchemaBrowserFrame.CreateUserActionExecute(Sender: TObject);
begin
  with CreateUserDialog do
  try
    if Open(ObjectTreeFrame.Session, ObjectTreeFrame.SchemaParam) then
      if ExecuteSQL then
      begin
        ObjectTreeFrame.Refresh;
        ShowMessage('User created.');
      end;
  finally
    Free;
  end;
end;

procedure TSchemaBrowserFrame.CreateViewActionExecute(Sender: TObject);
begin
  with CreateViewDialog do
  try
    if Open(ObjectTreeFrame.Session, ObjectTreeFrame.SchemaParam) then
      if ExecuteSQL then
      begin
        ObjectTreeFrame.Refresh;
        ShowMessage('View created.');
      end;
  finally
    Free;
  end;
end;

procedure TSchemaBrowserFrame.CreateConstraintActionExecute(Sender: TObject);
begin
  with CreateConstraintDialog do
  try
    if Open(ObjectTreeFrame.Session, ObjectTreeFrame.SchemaParam, ObjectTreeFrame.ObjectName) then
      if ExecuteSQL then
      begin
        ObjectTreeFrame.Refresh;
        ShowMessage('Constraint created.');
      end;
  finally
    Free;
  end;
end;

procedure TSchemaBrowserFrame.CreateConstraintForObjectActionExecute(Sender: TObject);
begin
  CreateConstraintAction.Execute;
end;

procedure TSchemaBrowserFrame.CreateDBLinkActionExecute(Sender: TObject);
begin
  with CreateDBLinkDialog do
  try
    if Open(ObjectTreeFrame.Session, ObjectTreeFrame.SchemaParam) then
    begin
      if ExecuteSQL then
      begin
        ObjectTreeFrame.Refresh;
        ShowMessage('Database link created.');
      end;
    end;
  finally
    Free;
  end;
end;

procedure TSchemaBrowserFrame.CreateFrames;
var
  TableNames: TStringList;
begin
  inherited;
  { Get object names for the highlighter }
  TableNames := Lib.SessionObjectNames(ObjectTreeFrame.Session, ObjectTreeFrame.SchemaParam);
  try
    { Table }
    FTableBrowserFrame := TTableBrowserFrame.Create(Self, RightPanel, ObjectTreeFrame.Session,
      ObjectTreeFrame.SchemaParam);
    FTableBrowserFrame.HighlighterTableNames := TableNames;
    CustomizePageControlDialog.SetActivePage(FTableBrowserFrame.TablePageControl);
    { View }
    FViewBrowserFrame := TViewBrowserFrame.Create(Self, RightPanel, ObjectTreeFrame.Session,
      ObjectTreeFrame.SchemaParam);
    FViewBrowserFrame.HighlighterTableNames := TableNames;
    CustomizePageControlDialog.SetActivePage(FViewBrowserFrame.ViewPageControl);
    { Function and procedures }
    FFuncProcBrowserFrame := TFuncProcBrowserFrame.Create(Self, RightPanel, ObjectTreeFrame.Session,
      ObjectTreeFrame.SchemaParam);
    FFuncProcBrowserFrame.HighlighterTableNames := TableNames;
    CustomizePageControlDialog.SetActivePage(FFuncProcBrowserFrame.FuncProcPageControl);
    { Packages }
    FPackageBrowserFrame := TPackageBrowserFrame.Create(Self, RightPanel, ObjectTreeFrame.Session,
      ObjectTreeFrame.SchemaParam);
    FPackageBrowserFrame.HighlighterTableNames := TableNames;
    CustomizePageControlDialog.SetActivePage(FPackageBrowserFrame.PackagePageControl);
    { Triggers }
    FTriggerBrowserFrame := TTriggerBrowserFrame.Create(Self, RightPanel, ObjectTreeFrame.Session,
      ObjectTreeFrame.SchemaParam);
    FTriggerBrowserFrame.HighlighterTableNames := TableNames;
    CustomizePageControlDialog.SetActivePage(FTriggerBrowserFrame.TriggerPageControl);
    { Constraints }
    FConstraintBrowserFrame := TConstraintBrowserFrame.Create(Self, RightPanel, ObjectTreeFrame.Session,
      ObjectTreeFrame.SchemaParam);
    CustomizePageControlDialog.SetActivePage(FConstraintBrowserFrame.ConstraintPageControl);
    { Indexes }
    FIndexBrowserFrame := TIndexBrowserFrame.Create(Self, RightPanel, ObjectTreeFrame.Session,
      ObjectTreeFrame.SchemaParam);
    CustomizePageControlDialog.SetActivePage(FIndexBrowserFrame.IndexPageControl);
    { Sequences }
    FSequenceBrowserFrame := TSequenceBrowserFrame.Create(Self, RightPanel, ObjectTreeFrame.Session,
      ObjectTreeFrame.SchemaParam);
    CustomizePageControlDialog.SetActivePage(FSequenceBrowserFrame.SequencePageControl);
    { Synonyms }
    FSynonymBrowserFrame := TSynonymBrowserFrame.Create(Self, RightPanel, ObjectTreeFrame.Session,
      ObjectTreeFrame.SchemaParam);
    CustomizePageControlDialog.SetActivePage(FSynonymBrowserFrame.SynonymPageControl);
    { DB Links }
    FDBLinkBrowserFrame := TDBLinkBrowserFrame.Create(Self, RightPanel, ObjectTreeFrame.Session,
      ObjectTreeFrame.SchemaParam);
    CustomizePageControlDialog.SetActivePage(FDBLinkBrowserFrame.DBLinkPageControl);
    { Recycle bin }
    FRecycleBinBrowserFrame := TRecycleBinBrowserFrame.Create(Self, RightPanel, ObjectTreeFrame.Session);
    CustomizePageControlDialog.SetActivePage(FRecycleBinBrowserFrame.RecycleBinPageControl);
    { Users }
    FUserBrowserFrame := TUserBrowserFrame.Create(Self, RightPanel, ObjectTreeFrame.Session,
      ObjectTreeFrame.SchemaParam);
    CustomizePageControlDialog.SetActivePage(FUserBrowserFrame.UserPageControl);
  finally
    TableNames.Free;
  end;
end;

procedure TSchemaBrowserFrame.CreateFunctionActionExecute(Sender: TObject);
begin
  with CreateFunctionDialog do
  try
    if Open(ObjectTreeFrame.Session, ObjectTreeFrame.SchemaParam) then
      if ExecuteSQL then
      begin
        ObjectTreeFrame.Refresh;
        ShowMessage('Function created.');
      end;
  finally
    Free;
  end;
end;

procedure TSchemaBrowserFrame.CreateIndexActionExecute(Sender: TObject);
begin
  with CreateIndexDialog do
  try
    if Open(ObjectTreeFrame.Session, ObjectTreeFrame.SchemaParam, ObjectTreeFrame.ObjectName) then
      if ExecuteSQL then
      begin
        ObjectTreeFrame.Refresh;
        ShowMessage('Index created.');
      end;
  finally
    Free;
  end;
end;

procedure TSchemaBrowserFrame.CreateIndexForObjectActionExecute(Sender: TObject);
begin
  CreateIndexAction.Execute;
end;

procedure TSchemaBrowserFrame.CreatePackageActionExecute(Sender: TObject);
begin
  with CreatePackageDialog do
  try
    if Open(ObjectTreeFrame.Session, ObjectTreeFrame.SchemaParam) then
      if ExecuteSQL then
      begin
        ObjectTreeFrame.Refresh;
        ShowMessage('Package created.');
      end;
  finally
    Free;
  end;
end;

procedure TSchemaBrowserFrame.CreateProcedureActionExecute(Sender: TObject);
begin
  with CreateProcedureDialog do
  try
    if Open(ObjectTreeFrame.Session, ObjectTreeFrame.SchemaParam) then
      if ExecuteSQL then
      begin
        ObjectTreeFrame.Refresh;
        ShowMessage('Procedure created.');
      end;
  finally
    Free;
  end;
end;

procedure TSchemaBrowserFrame.CreateSequenceActionExecute(Sender: TObject);
begin
  with CreateSequenceDialog do
  try
    if Open(ObjectTreeFrame.Session, ObjectTreeFrame.SchemaParam) then
      if ExecuteSQL then
      begin
        ObjectTreeFrame.Refresh;
        ShowMessage('Sequence created.');
      end;
  finally
    Free;
  end;
end;

procedure TSchemaBrowserFrame.CreateSynonymActionExecute(Sender: TObject);
begin
  with CreateSynonymDialog do
  try
    if Open(ObjectTreeFrame.Session, ObjectTreeFrame.SchemaParam, ObjectTreeFrame.ObjectName) then
      if ExecuteSQL then
      begin
        ObjectTreeFrame.Refresh;
        ShowMessage('Synonym created.');
      end;
  finally
    Free;
  end;
end;

procedure TSchemaBrowserFrame.CreateSynonymForObjectActionExecute(Sender: TObject);
begin
  CreateSynonymAction.Execute;
end;

procedure TSchemaBrowserFrame.CreateTableActionExecute(Sender: TObject);
begin
  with CreateTableDialog do
  try
    if Open(ObjectTreeFrame.Session, ObjectTreeFrame.SchemaParam) then
      if ExecuteSQL then
      begin
        ObjectTreeFrame.Refresh;
        ShowMessage('Table created.');
      end;
  finally
    Free;
  end;
end;

procedure TSchemaBrowserFrame.CreateTriggerActionExecute(Sender: TObject);
begin
  with CreateTriggerDialog do
  try
    if Open(ObjectTreeFrame.Session, ObjectTreeFrame.SchemaParam, ObjectTreeFrame.ObjectName) then
      if ExecuteSQL then
      begin
        ObjectTreeFrame.Refresh;
        ShowMessage('Trigger created.');
      end;
  finally
    Free;
  end;
end;

procedure TSchemaBrowserFrame.CreateTriggerForObjectActionExecute(Sender: TObject);
begin
  CreateTriggerAction.Execute;
end;

procedure TSchemaBrowserFrame.CustomizeObjectFiltersActionExecute(Sender: TObject);
begin
  with CustomizeObjectFiltersDialog do
  try
    if Open(ObjectTreeFrame.Session, ObjectTreeFrame.SchemaParam,
      ObjectTreeFrame.GetSelectedObjectType, ObjectTreeFrame.GetSchemaName) then
      begin
        ObjectTreeFrame.SetCurrentFilter(FilterName, ObjectTreeFrame.GetSelectedObjectType);
        ObjectTreeFrame.SetObjectFilter(FilterName, ObjectTreeFrame.GetSelectedObjectType);
        ObjectTreeFrame.Refresh;
      end;
  finally
    Free;
  end;
end;

procedure TSchemaBrowserFrame.CustomizeObjectFiltersMenuClick(Sender: TObject);
var
  Item: TMenuItem;
  ItemName, ObjectType: string;
begin
  Item := Sender as TMenuItem;
  Item.Checked := True;
  ItemName := StringReplace(Item.Caption, '&', '', []);
  ObjectType := GetFilterObjectType(Item.Tag);
  ObjectTreeFrame.SetCurrentFilter(ItemName, ObjectType);
  ObjectTreeFrame.SetObjectFilter(ItemName, ObjectType);
  ObjectTreeFrame.Refresh;
end;

procedure TSchemaBrowserFrame.CustomizeObjectBrowserActionExecute(Sender: TObject);
begin
 if CustomizeObjectBrowserDialog.Open then
   ObjectTreeFrame.Refresh;
end;

function TSchemaBrowserFrame.GetDataQueryOpened: Boolean;
begin
  Result := Assigned(FTableBrowserFrame) and FTableBrowserFrame.QueryOpened or
    Assigned(FViewBrowserFrame) and FViewBrowserFrame.QueryOpened;
end;

procedure TSchemaBrowserFrame.GrantPrivilegesForObjectActionExecute(Sender: TObject);
begin
  with GrantPrivilegesDialog do
  try
    if Open(ObjectTreeFrame.Session, ObjectTreeFrame.SchemaParam, ObjectTreeFrame.ObjectName) then
      if ExecuteSQL then
      begin
        ObjectTreeFrame.VirtualDrawTree.OnClick(nil);
        ShowMessage('Privileges granted.');
      end;
  finally
    Free;
  end;
end;

procedure TSchemaBrowserFrame.ObjectTreeFrameVirtualDrawTreeClick(Sender: TObject);
var
  Refresh: Boolean;
begin
  if ObjectTreeFrame.Session.Username = '' then
    Exit;
  try
    Screen.Cursor := crHourglass;
    { check session }
    if not ObjectTreeFrame.Session.Connected then
    begin
      ObjectTreeFrame.Session.ConnectPrompt := False;
      ObjectTreeFrame.Session.Connect;
      ObjectTreeFrame.Session.ConnectPrompt := True;
    end;
    Refresh := ObjectTreeFrame.SetObjectTypeAndName; //(Sender);
    SetFrames(Refresh);
    //FillPopupActionBar;
  finally
    ObjectTreeFrame.VirtualDrawTree.Repaint;
    Screen.Cursor := crDefault;
  end;
end;

procedure TSchemaBrowserFrame.ObjectTreeFrameVirtualDrawTreeEditing(Sender: TBaseVirtualTree;
  Node: PVirtualNode; Column: TColumnIndex; var Allowed: Boolean);
var
  ParentText: string;
begin
  ParentText := ObjectTreeFrame.GetSelectedObjectParentText;
  Allowed :=
    (ObjectTreeFrame.GetSelectedLevel = 1) and { allow edit of renamable objects only }
    (Pos(TEXT_RECYCLE_BIN, ParentText) = 0) and
    (Pos(TEXT_INVALID_OBJECTS, ParentText) = 0) and
    (Pos(TEXT_FUNCTIONS, ParentText) = 0) and
    (Pos(TEXT_PROCEDURES, ParentText) = 0) and
    (Pos(TEXT_PACKAGES, ParentText) = 0) and
    (Pos(TEXT_DBLINKS, ParentText) = 0);
end;

procedure TSchemaBrowserFrame.ObjectTreeFrameVirtualDrawTreeKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key in [38, 40] then // up & down arrows
    ObjectTreeFrameVirtualDrawTreeClick(Sender);
end;

procedure TSchemaBrowserFrame.ObjectTreeFrameVirtualDrawTreeMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  FillPopupActionBar;
end;

procedure TSchemaBrowserFrame.FillPopupActionBar;
var
  i, Index: Integer;
  InvalidObject: Boolean;
  MenuItem, SubMenuItem: TMenuItem;
  ObjectType, ObjectText, ObjectParentText: string;
  Level: Byte;
  ObjectFilters: TStrings;
begin
  { Actions }
  {
  CompileAllInvalidObjectsAction.Visible := False;
  CompileInvalidObjectAction.Visible := False;}

  { PopupActionBar is filled because setting item visibility won't resize the menu.
    So, long menu items will set the menu width long and it looks very stupid when
    those items are not visible. This is problem in Winapi.Windows 7. }
  PopupActionBar.Items.Clear;

  if not Assigned(ObjectTreeFrame) then
    Exit;
  if not Assigned(ObjectTreeFrame.VirtualDrawTree) then
    Exit;

  Level := ObjectTreeFrame.GetSelectedLevel;
  ObjectText := ObjectTreeFrame.GetSelectedObjectText;
  ObjectParentText := ObjectTreeFrame.GetSelectedObjectParentText;
  InvalidObject := (Level = 1) and
    (Pos(TEXT_INVALID_OBJECTS, ObjectParentText) <> 0);
  ObjectType := ObjectTreeFrame.GetSelectedObjectType;


 // if ObjectTreeFrame.VirtualDrawTree.SelectedCount = 0 then
 //   Exit;

  //else
  //if Level = 1 then
  //  ObjectType := TRootNodeData(ObjectTreeFrame.ObjectTreeView.Selected.Parent.Data).RootType;

  { Add }
  if (Level = 0) and (ObjectType <> '') then
    if (Pos(TEXT_RECYCLE_BIN, ObjectText) = 0) and
       (Pos(TEXT_INVALID_OBJECTS, ObjectText) = 0) then
    begin
      MenuItem := TMenuItem.Create(PopupActionBar);

      if Pos(TEXT_TABLES, ObjectText) <> 0 then
      begin
        MenuItem.Action := CreateTableAction;
        MenuItem.ImageIndex := IMG_IDX_TABLE_CREATE;
      end
      else
      if Pos(TEXT_VIEWS, ObjectText) <> 0 then
      begin
        MenuItem.Action := CreateViewAction;
        MenuItem.ImageIndex := IMG_IDX_VIEW_CREATE
      end
      else
      if Pos(TEXT_FUNCTIONS, ObjectText) <> 0 then
      begin
        MenuItem.Action := CreateFunctionAction;
        MenuItem.ImageIndex := IMG_IDX_FUNCTION_CREATE
      end
      else
      if Pos(TEXT_PROCEDURES, ObjectText) <> 0 then
      begin
        MenuItem.Action := CreateProcedureAction;
        MenuItem.ImageIndex := IMG_IDX_PROCEDURE_CREATE
      end
      else
      if Pos(TEXT_PACKAGES, ObjectText) <> 0 then
      begin
        MenuItem.Action := CreatePackageAction;
        MenuItem.ImageIndex := IMG_IDX_PACKAGE_CREATE
      end
      else
      if Pos(TEXT_TRIGGERS, ObjectText) <> 0 then
      begin
        MenuItem.Action := CreateTriggerAction;
        MenuItem.ImageIndex := IMG_IDX_TRIGGER_CREATE
      end
      else
      if Pos(TEXT_CONSTRAINTS, ObjectText) <> 0 then
      begin
        MenuItem.Action := CreateConstraintAction;
        MenuItem.ImageIndex := IMG_IDX_CONSTRAINT_CREATE
      end
      else
      if Pos(TEXT_INDEXES, ObjectText) <> 0 then
      begin
        MenuItem.Action := CreateIndexAction;
        MenuItem.ImageIndex := IMG_IDX_INDEX_CREATE
      end
      else
      if Pos(TEXT_SEQUENCES, ObjectText) <> 0 then
      begin
        MenuItem.Action := CreateSequenceAction;
        MenuItem.ImageIndex := IMG_IDX_SEQUENCE_CREATE
      end
      else
      if Pos(TEXT_SYNONYMS, ObjectText) <> 0 then
      begin
        MenuItem.Action := CreateSynonymAction;
        MenuItem.ImageIndex := IMG_IDX_SYNONYM_CREATE
      end
      else
      if Pos(TEXT_DBLINKS, ObjectText) <> 0 then
      begin
        MenuItem.Action := CreateDBLinkAction;
        MenuItem.ImageIndex := IMG_IDX_DBLINK_CREATE
      end
      else
      if Pos(TEXT_USERS, ObjectText) <> 0 then
      begin
        MenuItem.Action := CreateUserAction;
        MenuItem.ImageIndex := IMG_IDX_USER_CREATE;
      end;
      MenuItem.Caption := Format(CAPTION_CREATE, [AnsiInitCap(ObjectType)]);
      PopupActionBar.Items.Add(MenuItem);
    end;

  if Level = 0 then
  begin
   // ObjectType := ObjectTreeFrame.GetSelectedObjectType // TRootNodeData(ObjectTreeFrame.ObjectTreeView.Selected.Data).RootType;
    MenuItem := TMenuItem.Create(PopupActionBar);
    MenuItem.Action := CustomizeObjectBrowserAction;
    PopupActionBar.Items.Add(MenuItem);
  end;

  { Alter Table/View }
  if not InvalidObject then
    if Level = 1 then
    begin
      if Pos(TEXT_TABLES, ObjectParentText) <> 0 then
      begin
        { Alter Table }
        MenuItem := TMenuItem.Create(PopupActionBar);
        MenuItem.Action := AlterTableAction;
        MenuItem.Caption := Format(CAPTION_ALTER_TABLE, [ObjectText]);
        MenuItem.Hint := 'Alter/recreate table';
        MenuItem.ImageIndex := IMG_IDX_ALTER_TABLE;
        PopupActionBar.Items.Add(MenuItem);
        { Analyze table }
        MenuItem := TMenuItem.Create(PopupActionBar);
        MenuItem.Action := AnalyzeTableAction;
        MenuItem.Caption := Format(CAPTION_ANALYZE, [ObjectText]);
        MenuItem.Hint := 'Analyze table';
        MenuItem.ImageIndex := IMG_IDX_ANALYZE_TABLE;
        PopupActionBar.Items.Add(MenuItem);
      end
      else
      if Pos(TEXT_VIEWS, ObjectParentText) <> 0 then
      begin
        { Alter Table }
        MenuItem := TMenuItem.Create(PopupActionBar);
        MenuItem.Action := AlterViewAction;
        MenuItem.Caption := Format(CAPTION_ALTER_VIEW, [ObjectText]);
        MenuItem.Hint := 'Alter view';
        MenuItem.ImageIndex := IMG_IDX_ALTER_VIEW;
        PopupActionBar.Items.Add(MenuItem);
      end
    end;
  { Enable/Disable All Constraints }
  if Level = 0 then
    if (Pos(TEXT_CONSTRAINTS, ObjectText) <> 0) then
      if Pos(TEXT_ZERO_OBJECTS, ObjectText) = 0 then
      begin
        { Enable }
        MenuItem := TMenuItem.Create(PopupActionBar);
        MenuItem.Action := EnableAllConstraintsAction;
        MenuItem.ImageIndex := IMG_IDX_ENABLE;
        PopupActionBar.Items.Add(MenuItem);
        { Disable }
        MenuItem := TMenuItem.Create(PopupActionBar);
        MenuItem.Action := DisableAllConstraintsAction;
        MenuItem.ImageIndex := IMG_IDX_DISABLE;
        PopupActionBar.Items.Add(MenuItem);
      end;

  { Enable/Disable All Triggers }
  if Level = 0 then
    if (Pos(TEXT_TRIGGERS, ObjectText) <> 0) then
      if Pos(TEXT_ZERO_OBJECTS, ObjectText) = 0 then
      begin
        { Enable }
        MenuItem := TMenuItem.Create(PopupActionBar);
        MenuItem.Action := EnableAllTriggersAction;
        MenuItem.ImageIndex := IMG_IDX_ENABLE;
        PopupActionBar.Items.Add(MenuItem);
        { Disable }
        MenuItem := TMenuItem.Create(PopupActionBar);
        MenuItem.Action := DisableAllTriggersAction;
        MenuItem.ImageIndex := IMG_IDX_DISABLE;
        PopupActionBar.Items.Add(MenuItem);
      end;

  { Change user's password }
  if not InvalidObject then
    if Level = 1 then
      if Pos(TEXT_USERS, ObjectParentText) <> 0 then
      begin
        MenuItem := TMenuItem.Create(PopupActionBar);
        MenuItem.Action := ChangeUserPasswordAction;
        MenuItem.ImageIndex := IMG_IDX_KEY;
        MenuItem.Caption := Format(CAPTION_CHANGE_PASSWORD, [ObjectText]);
        PopupActionBar.Items.Add(MenuItem);
      end;

  if not InvalidObject then
    if Level = 1 then
      if ObjectTreeFrame.GetSelectedObjectStateIndex = 2 then
      begin
        { Compile Invalid Object }
        MenuItem := TMenuItem.Create(PopupActionBar);
        MenuItem.Action := CompileInvalidObjectAction;
        //MenuItem.Caption := 'Compile Invalid Object';
        //MenuItem.Hint := 'Compile invalid object';
        MenuItem.ImageIndex := IMG_IDX_COMPILE;
        PopupActionBar.Items.Add(MenuItem);
      end;

  { Constraints }
  if not InvalidObject then
    if Level = 1 then
      if (Pos(TEXT_TABLES, ObjectParentText) <> 0) or
         (Pos(TEXT_VIEWS, ObjectParentText) <> 0)then
      begin
        MenuItem := TMenuItem.Create(PopupActionBar);
        MenuItem.Caption := 'Constraints of ' + ObjectText;
        MenuItem.ImageIndex := IMG_IDX_CONSTRAINT_CHILD;
        PopupActionBar.Items.Add(MenuItem);
        { Enable }
        SubMenuItem := TMenuItem.Create(PopupActionBar);
        SubMenuItem.Action := EnableObjectConstraintsAction;
        SubMenuItem.ImageIndex := IMG_IDX_ENABLE;
        SubMenuItem.Caption := 'Enable All';
        SubMenuItem.Hint := 'Enable all constraints';
        MenuItem.Add(SubMenuItem);
        { Disable }
        SubMenuItem := TMenuItem.Create(PopupActionBar);
        SubMenuItem.Action := DisableObjectConstraintsAction;
        SubMenuItem.ImageIndex := IMG_IDX_DISABLE;
        SubMenuItem.Caption := 'Disable All';
        SubMenuItem.Hint := 'Disable all constraints';
        MenuItem.Add(SubMenuItem);
      end;


  if not InvalidObject then
    if Level = 1 then
      if (Pos(TEXT_TABLES, ObjectParentText) <> 0) or
         (Pos(TEXT_VIEWS, ObjectParentText) <> 0) or
         (Pos(TEXT_FUNCTIONS, ObjectParentText) <> 0) or
         (Pos(TEXT_PROCEDURES, ObjectParentText) <> 0) or
         (Pos(TEXT_PACKAGES, ObjectParentText) <> 0) or
         (Pos(TEXT_SEQUENCES, ObjectParentText) <> 0) then
    begin
      MenuItem := TMenuItem.Create(PopupActionBar);
      MenuItem.Caption := 'Create';
      MenuItem.ImageIndex := IMG_IDX_ADD;
      PopupActionBar.Items.Add(MenuItem);

      { Create a constraint for an object }
      if Pos(TEXT_TABLES, ObjectParentText) <> 0 then
       begin
        SubMenuItem := TMenuItem.Create(PopupActionBar);
        SubMenuItem.Action := CreateConstraintForObjectAction;
        SubMenuItem.Caption := Format(CAPTION_CONSTRAINT, [ObjectText]);
        MenuItem.Add(SubMenuItem);
      end;

      { Create an index for an object }
      if Pos(TEXT_TABLES, ObjectParentText) <> 0 then
       begin
        SubMenuItem := TMenuItem.Create(PopupActionBar);
        SubMenuItem.Action := CreateIndexForObjectAction;
        SubMenuItem.Caption := Format(CAPTION_INDEX, [ObjectText]);
        MenuItem.Add(SubMenuItem);
      end;

      { Create a synonym for an object }
      if (Pos(TEXT_TABLES, ObjectParentText) <> 0) or
         (Pos(TEXT_VIEWS, ObjectParentText) <> 0) or
         (Pos(TEXT_FUNCTIONS, ObjectParentText) <> 0) or
         (Pos(TEXT_PROCEDURES, ObjectParentText) <> 0) or
         (Pos(TEXT_PACKAGES, ObjectParentText) <> 0) or
         (Pos(TEXT_SEQUENCES, ObjectParentText) <> 0) then
       begin
        SubMenuItem := TMenuItem.Create(PopupActionBar);
        SubMenuItem.Action := CreateSynonymForObjectAction;
        SubMenuItem.Caption := Format(CAPTION_SYNONYM, [ObjectText]);
        MenuItem.Add(SubMenuItem);
      end;

      { Create a trigger for an object }
      if (Pos(TEXT_TABLES, ObjectParentText) <> 0) or
         (Pos(TEXT_VIEWS, ObjectParentText) <> 0) then
       begin
        SubMenuItem := TMenuItem.Create(PopupActionBar);
        SubMenuItem.Action := CreateTriggerForObjectAction;
        SubMenuItem.Caption := Format(CAPTION_TRIGGER, [ObjectText]);
        MenuItem.Add(SubMenuItem);
      end;
  end;

  { Drop }
  if Level = 1 then
    if (Pos(TEXT_RECYCLE_BIN, ObjectParentText) = 0) and
       (Pos(TEXT_INVALID_OBJECTS,ObjectParentText) = 0) then
    begin
      MenuItem := TMenuItem.Create(PopupActionBar);
      MenuItem.Action := DropAction;
      MenuItem.Caption := Format(CAPTION_DROP, [AnsiInitCap(ObjectType), ObjectText]);
      MenuItem.Hint := 'Drop' + LowerCase(ObjectType);
      if Pos(TEXT_TABLES, ObjectParentText) <> 0 then
        MenuItem.ImageIndex := IMG_IDX_TABLE_DROP
      else
      if Pos(TEXT_VIEWS, ObjectParentText) <> 0 then
        MenuItem.ImageIndex := IMG_IDX_VIEW_DROP
      else
      if Pos(TEXT_FUNCTIONS, ObjectParentText) <> 0 then
        MenuItem.ImageIndex := IMG_IDX_FUNCTION_DROP
      else
      if Pos(TEXT_PROCEDURES, ObjectParentText) <> 0 then
        MenuItem.ImageIndex := IMG_IDX_PROCEDURE_DROP
      else
      if Pos(TEXT_PACKAGES, ObjectParentText) <> 0 then
        MenuItem.ImageIndex := IMG_IDX_PACKAGE_DROP
      else
      if Pos(TEXT_TRIGGERS, ObjectParentText) <> 0 then
        MenuItem.ImageIndex := IMG_IDX_TRIGGER_DROP
      else
      if Pos(TEXT_CONSTRAINTS, ObjectParentText) <> 0 then
        MenuItem.ImageIndex := IMG_IDX_CONSTRAINT_DROP
      else
      if Pos(TEXT_INDEXES, ObjectParentText) <> 0 then
        MenuItem.ImageIndex := IMG_IDX_INDEX_DROP
      else
      if Pos(TEXT_SEQUENCES, ObjectParentText) <> 0 then
        MenuItem.ImageIndex := IMG_IDX_SEQUENCE_DROP
      else
      if Pos(TEXT_SYNONYMS, ObjectParentText) <> 0 then
        MenuItem.ImageIndex := IMG_IDX_SYNONYM_DROP
      else
      if Pos(TEXT_DBLINKS, ObjectParentText) <> 0 then
        MenuItem.ImageIndex := IMG_IDX_DBLINK_DROP
      else
      if Pos(TEXT_USERS, ObjectParentText) <> 0 then
        MenuItem.ImageIndex := IMG_IDX_USER_DROP;
      PopupActionBar.Items.Add(MenuItem);
    end;

  { Generate Statement }
  if not InvalidObject then
    if Level = 1 then
      if (Pos(TEXT_TABLES, ObjectParentText) <> 0) then
      begin
        MenuItem := TMenuItem.Create(PopupActionBar);
        MenuItem.Caption := 'Generate Statement';
        PopupActionBar.Items.Add(MenuItem);
        { Select }
        SubMenuItem := TMenuItem.Create(PopupActionBar);
        SubMenuItem.Action := GenerateTableSelectStatementAction;
        MenuItem.Add(SubMenuItem);
        { Insert }
        SubMenuItem := TMenuItem.Create(PopupActionBar);
        SubMenuItem.Action := GenerateInsertStatementAction;
        MenuItem.Add(SubMenuItem);
        { Update }
        SubMenuItem := TMenuItem.Create(PopupActionBar);
        SubMenuItem.Action := GenerateUpdateStatementAction;
        MenuItem.Add(SubMenuItem);
        { Delete }
        SubMenuItem := TMenuItem.Create(PopupActionBar);
        SubMenuItem.Action := GenerateDeleteStatementAction;
        MenuItem.Add(SubMenuItem);
      end;
  { Generate Statement }
  if not InvalidObject then
    if Level = 1 then
      if (Pos(TEXT_VIEWS, ObjectParentText) <> 0) then
      begin
        MenuItem := TMenuItem.Create(PopupActionBar);
        MenuItem.Caption := 'Generate Statement';
        PopupActionBar.Items.Add(MenuItem);
        { Select }
        SubMenuItem := TMenuItem.Create(PopupActionBar);
        SubMenuItem.Action := GenerateViewSelectStatementAction;
        MenuItem.Add(SubMenuItem);
      end;

  { Grant privileges for an object }
  if not InvalidObject then
    if Level = 1 then
      if (Pos(TEXT_TABLES, ObjectParentText) <> 0) or
         (Pos(TEXT_VIEWS, ObjectParentText) <> 0) or
         (Pos(TEXT_FUNCTIONS, ObjectParentText) <> 0) or
         (Pos(TEXT_PROCEDURES, ObjectParentText) <> 0) or
         (Pos(TEXT_PACKAGES, ObjectParentText) <> 0) or
         (Pos(TEXT_SEQUENCES, ObjectParentText) <> 0) then
       begin
        MenuItem := TMenuItem.Create(PopupActionBar);
        MenuItem.Action := GrantPrivilegesForObjectAction;
        MenuItem.Caption := Format(CAPTION_GRANT, [ObjectText]);
        PopupActionBar.Items.Add(MenuItem);
      end;

  { Rename }
  if not InvalidObject then
    if Level = 1 then
      if (Pos(TEXT_TABLES, ObjectParentText) <> 0) or
         (Pos(TEXT_VIEWS, ObjectParentText) <> 0) or
         (Pos(TEXT_TRIGGERS, ObjectParentText) <> 0) or
         (Pos(TEXT_CONSTRAINTS, ObjectParentText) <> 0) or
         (Pos(TEXT_INDEXES, ObjectParentText) <> 0) or
         (Pos(TEXT_SEQUENCES, ObjectParentText) <> 0) or
         (Pos(TEXT_SYNONYMS, ObjectParentText) <> 0) then
       begin
        MenuItem := TMenuItem.Create(PopupActionBar);
        MenuItem.Action := RenameObjectAction;
        MenuItem.Caption := Format(CAPTION_RENAME, [AnsiInitCap(ObjectType), ObjectText]);
        MenuItem.Hint := 'Rename an object';
        MenuItem.ImageIndex := IMG_IDX_RENAME;
        PopupActionBar.Items.Add(MenuItem);
      end;
   { Purge All Objects }
   if Level = 0 then
    if Pos(TEXT_RECYCLE_BIN, ObjectText) <> 0 then
      if Pos(TEXT_ZERO_OBJECTS, ObjectText) = 0 then
      begin
        MenuItem := TMenuItem.Create(PopupActionBar);
        MenuItem.Action := PurgeAllObjectsAction;
        MenuItem.Caption := 'Purge All Objects';
        MenuItem.Hint := 'Purge all objects';
        PopupActionBar.Items.Add(MenuItem);
      end;
   if Level = 1 then
      if (Pos(TEXT_RECYCLE_BIN, ObjectParentText) <> 0) then
      begin
        { Purge All Objects }
        MenuItem := TMenuItem.Create(PopupActionBar);
        MenuItem.Action := PurgeAllObjectsAction;
        MenuItem.Caption := 'Purge All Objects';
        MenuItem.Hint := 'Purge all objects';
        MenuItem.ImageIndex := IMG_IDX_PURGE;
        PopupActionBar.Items.Add(MenuItem);
        { Purge }
        MenuItem := TMenuItem.Create(PopupActionBar);
        MenuItem.Action := PurgeObjectAction;
        MenuItem.Caption := Format(CAPTION_PURGE, [ObjectText]);
        MenuItem.Hint := 'Purge object';
        MenuItem.ImageIndex := IMG_IDX_PURGE;
        PopupActionBar.Items.Add(MenuItem);
        if FRecycleBinBrowserFrame.ObjectType = OBJECT_TYPE_TABLE then
        begin
          { Flashback }
          MenuItem := TMenuItem.Create(PopupActionBar);
          MenuItem.Action := FlashbackTableAction;
          MenuItem.Caption := Format(CAPTION_FLASHBACK, [ObjectText]);
          MenuItem.Hint := 'Flashback table';
          MenuItem.ImageIndex := IMG_IDX_FLASHBACK;
          PopupActionBar.Items.Add(MenuItem);
        end;
      end;

  { Object Filters }

  if (Level = 0) and (ObjectType <> '') then
    if (Pos(TEXT_RECYCLE_BIN, ObjectText) = 0) and
       (Pos(TEXT_INVALID_OBJECTS, ObjectText) = 0) then
    begin
      MenuItem := TMenuItem.Create(PopupActionBar);
      MenuItem.Caption := Format('%s Filter', [AnsiInitCap(ObjectType)]);
      PopupActionBar.Items.Add(MenuItem);
      { Customize }
      SubMenuItem := TMenuItem.Create(PopupActionBar);
      SubMenuItem.Action := CustomizeObjectFiltersAction;
      SubMenuItem.Caption := Format('Customize %s Filters...', [AnsiInitCap(ObjectType)]);
      SubMenuItem.Hint := Format('Customize %s filters', [LowerCase(ObjectType)]);
      MenuItem.Add(SubMenuItem);
      { - }
      SubMenuItem := TMenuItem.Create(PopupActionBar);
      SubMenuItem.Caption := '-';
      MenuItem.Add(SubMenuItem);
      { No filter - default }
      SubMenuItem := TMenuItem.Create(PopupActionBar);
      SubMenuItem.OnClick := CustomizeObjectFiltersMenuClick;
      SubMenuItem.Caption := '<no filter>';
      SubMenuItem.Hint := 'No filter';
      //SubMenuItem.Default := True;
      SubMenuItem.RadioItem := True;
      SubMenuItem.GroupIndex := 1;

      Index := GetFilterObjectIndex(ObjectType);
      SubMenuItem.Checked := (ObjectTreeFrame.CurrentFilters[Index] = SubMenuItem.Caption) or
        (ObjectTreeFrame.CurrentFilters[Index] = '');
      SubMenuItem.Tag := Index;

      MenuItem.Add(SubMenuItem);
      {  }
      ObjectFilters := Lib.GetObjectFilterNames(ObjectType, ObjectTreeFrame.GetSchemaName);
      try
        for i := 0 to ObjectFilters.Count - 1 do
        begin
          SubMenuItem := TMenuItem.Create(PopupActionBar);
          SubMenuItem.OnClick := CustomizeObjectFiltersMenuClick;
          SubMenuItem.Caption := ObjectFilters.Strings[i];
          SubMenuItem.Hint := Format('Show customized %ss', [LowerCase(ObjectType)]);
          SubMenuItem.RadioItem := True;
          SubMenuItem.GroupIndex := 1;
          SubMenuItem.Checked := ObjectTreeFrame.CurrentFilters[Index] = SubMenuItem.Caption;
          SubMenuItem.Tag := Index;
          MenuItem.Add(SubMenuItem);
        end;
      finally
        ObjectFilters.Free;
      end;
    end;

  { Triggers }
  if not InvalidObject then
    if Level = 1 then
      if (Pos(TEXT_TABLES, ObjectParentText) <> 0) or
         (Pos(TEXT_VIEWS, ObjectParentText) <> 0)then
      begin
        MenuItem := TMenuItem.Create(PopupActionBar);
        MenuItem.Caption := 'Triggers of ' + ObjectText;
        MenuItem.ImageIndex := IMG_IDX_TRIGGER_CHILD;
        PopupActionBar.Items.Add(MenuItem);
        { Enable }
        SubMenuItem := TMenuItem.Create(PopupActionBar);
        SubMenuItem.Action := EnableObjectTriggersAction;
        SubMenuItem.ImageIndex := IMG_IDX_ENABLE;
        SubMenuItem.Caption := 'Enable All';
        SubMenuItem.Hint := 'Enable all triggers';
        MenuItem.Add(SubMenuItem);
        { Disable }
        SubMenuItem := TMenuItem.Create(PopupActionBar);
        SubMenuItem.Action := DisableObjectTriggersAction;
        SubMenuItem.ImageIndex := IMG_IDX_DISABLE;
        SubMenuItem.Caption := 'Disable All';
        SubMenuItem.Hint := 'Disable all triggers';
        MenuItem.Add(SubMenuItem);
      end;
  { Compile All Invalid Objects }
  if Level = 0 then
    if Pos(TEXT_INVALID_OBJECTS, ObjectText) <> 0 then
      if Pos(TEXT_ZERO_OBJECTS, ObjectText) = 0 then
      begin
        MenuItem := TMenuItem.Create(PopupActionBar);
        MenuItem.Action := CompileAllInvalidObjectsAction;
        //MenuItem.Caption := 'Compile All Invalid Objects';
        //MenuItem.Hint := 'Compile all invalid objects';
        MenuItem.ImageIndex := IMG_IDX_COMPILE_ALL;
        PopupActionBar.Items.Add(MenuItem);
      end;
  { Compile Invalid Object }
  if Level = 1 then
    if Pos(TEXT_INVALID_OBJECTS, ObjectParentText) <> 0 then
    begin
      { Compile All Invalid Objects }
      MenuItem := TMenuItem.Create(PopupActionBar);
      MenuItem.Action := CompileAllInvalidObjectsAction;
      //MenuItem.Caption := 'Compile All Invalid Objects';
      //MenuItem.Hint := 'Compile all invalid objects';
      MenuItem.ImageIndex := IMG_IDX_COMPILE_ALL;
      PopupActionBar.Items.Add(MenuItem);
      { Compile Invalid Object }
      MenuItem := TMenuItem.Create(PopupActionBar);
      MenuItem.Action := CompileInvalidObjectAction;
      //MenuItem.Caption := 'Compile Invalid Object';
      //MenuItem.Hint := 'Compile invalid object';
      MenuItem.ImageIndex := IMG_IDX_COMPILE;
      PopupActionBar.Items.Add(MenuItem);
    end;
end;

procedure TSchemaBrowserFrame.PurgeAllObjectsActionExecute(Sender: TObject);
begin
  ObjectTreeFrame.Session.ExecSQL('PURGE RECYCLEBIN', []);
  ObjectTreeFrame.Refresh;
end;

procedure TSchemaBrowserFrame.PurgeObjectActionExecute(Sender: TObject);
begin
  ObjectTreeFrame.Session.ExecSQL(Format('PURGE %s %s', [FRecycleBinBrowserFrame.ObjectType, FRecycleBinBrowserFrame.ObjectName]), []);
  ObjectTreeFrame.Refresh;
end;

procedure TSchemaBrowserFrame.RenameObjectActionExecute(Sender: TObject);
begin
  ObjectTreeFrame.VirtualDrawTree.EditNode(ObjectTreeFrame.VirtualDrawTree.GetFirstSelected, -1); //  Selected.EditText;
end;

procedure TSchemaBrowserFrame.DisableAllConstraintsActionExecute(Sender: TObject);
begin
  AlterAllConstraints(ObjectTreeFrame.Session, ObjectTreeFrame.SchemaParam, False);
  ObjectTreeFrame.Refresh;
end;

procedure TSchemaBrowserFrame.DisableAllTriggersActionExecute(Sender: TObject);
begin
  AlterAllTriggers(ObjectTreeFrame.Session, ObjectTreeFrame.SchemaParam, False);
  ObjectTreeFrame.Refresh;
end;

procedure TSchemaBrowserFrame.DisableObjectConstraintsActionExecute(Sender: TObject);
begin
  AlterObjectConstraints(ObjectTreeFrame.Session, ObjectTreeFrame.SchemaParam, ObjectTreeFrame.ObjectName, False);
  ObjectTreeFrame.Refresh;
end;

procedure TSchemaBrowserFrame.DisableObjectTriggersActionExecute(Sender: TObject);
begin
  AlterObjectTriggers(ObjectTreeFrame.Session, ObjectTreeFrame.SchemaParam, ObjectTreeFrame.ObjectName, False);
  ObjectTreeFrame.Refresh;
end;

procedure TSchemaBrowserFrame.DropActionExecute(Sender: TObject);
var
  Alter, Options, SynonymAvailability: string;
  Drop: Boolean;
  OraQuery: TOraQuery;
begin
  Drop := False;
  Options := '';
  Alter := '';
  if (Pos(TEXT_TABLES, ObjectTreeFrame.GetSelectedObjectParentText) <> 0) then
  begin
    with DropTableDialog do
    try
      if Open(ObjectTreeFrame.GetSelectedObjectText) then
      begin
        if CascadeConstraints then
          Options := ' CASCADE CONSTRAINTS';
        if Purge then
          Options := Options + ' PURGE';
        Drop := True;
      end;
    finally
      Free;
    end;
  end
  else
  if (Pos(TEXT_USERS, ObjectTreeFrame.GetSelectedObjectParentText) <> 0) then
  begin
    with DropUserDialog do
    try
      if Open(ObjectTreeFrame.GetSelectedObjectText) then
      begin
        if CascadeObjects then
          Options := ' CASCADE';
        Drop := True;
      end;
    finally
      Free;
    end;
  end
  else
  if AskYesOrNo(Format('Drop %s %s, are you sure?', [LowerCase(ObjectTreeFrame.GetSelectedObjectType), ObjectTreeFrame.GetSelectedObjectText])) then
    Drop := True;

  { constraints need ALTER TABLE }
  if (Pos(TEXT_CONSTRAINTS, ObjectTreeFrame.GetSelectedObjectParentText) <> 0) then
  begin
    OraQuery := TOraQuery.Create(nil);
    OraQuery.Session := ObjectTreeFrame.Session;
    OraQuery.SQL.Add(DM.StringHolder.StringsByName['ConstraintTableNameSQL'].Text);
    with OraQuery do
    try
      ParamByName('P_OBJECT_NAME').AsWideString := ObjectTreeFrame.ObjectName;
      ParamByName('P_OWNER').AsWideString := ObjectTreeFrame.SchemaParam;
      Prepare;
      Open;
      Alter := Format('ALTER TABLE %s ', [FieldByName('TABLE_NAME').AsString]);
    finally
      Close;
      UnPrepare;
      FreeAndNil(OraQuery);
    end;
  end;

  { public synonyms need PUBLIC }
  if (Pos(TEXT_SYNONYMS, ObjectTreeFrame.GetSelectedObjectParentText) <> 0) then
  begin
    OraQuery := TOraQuery.Create(nil);
    OraQuery.Session := ObjectTreeFrame.Session;
    OraQuery.SQL.Add(DM.StringHolder.StringsByName['SynonymOwnerSQL'].Text);
    with OraQuery do
    try
      ParamByName('P_OBJECT_NAME').AsWideString := ObjectTreeFrame.ObjectName;
      ParamByName('P_OWNER').AsWideString := ObjectTreeFrame.SchemaParam;
      Prepare;
      Open;
      SynonymAvailability := '';
      if FieldByName('OWNER').AsString = 'PUBLIC' then
        SynonymAvailability := 'PUBLIC ';
    finally
      Close;
      UnPrepare;
      FreeAndNil(OraQuery);
    end;
  end;

  if Drop then
  begin
    ObjectTreeFrame.Session.ExecSQL(Format(Alter + 'DROP %s %s' + Options, [SynonymAvailability + ObjectTreeFrame.GetSelectedObjectType, ObjectTreeFrame.GetSelectedObjectText]), []);
    ObjectTreeFrame.Refresh;
  end;
end;

procedure TSchemaBrowserFrame.EnableAllConstraintsActionExecute(Sender: TObject);
begin
  AlterAllConstraints(ObjectTreeFrame.Session, ObjectTreeFrame.SchemaParam, True);
  ObjectTreeFrame.Refresh;
end;

procedure TSchemaBrowserFrame.EnableAllTriggersActionExecute(Sender: TObject);
begin
  AlterAllTriggers(ObjectTreeFrame.Session, ObjectTreeFrame.SchemaParam, True);
  ObjectTreeFrame.Refresh;
end;

procedure TSchemaBrowserFrame.EnableObjectConstraintsActionExecute(Sender: TObject);
begin
  AlterObjectConstraints(ObjectTreeFrame.Session, ObjectTreeFrame.SchemaParam, ObjectTreeFrame.ObjectName, True);
  ObjectTreeFrame.Refresh;
end;

procedure TSchemaBrowserFrame.EnableObjectTriggersActionExecute(Sender: TObject);
begin
  AlterObjectTriggers(ObjectTreeFrame.Session, ObjectTreeFrame.SchemaParam, ObjectTreeFrame.ObjectName, True);
  ObjectTreeFrame.Refresh;
end;

procedure TSchemaBrowserFrame.FlashbackTableActionExecute(Sender: TObject);
begin
  ObjectTreeFrame.Session.ExecSQL(Format('FLASHBACK TABLE %s TO BEFORE DROP', [FRecycleBinBrowserFrame.ObjectName]), []);
  ObjectTreeFrame.Refresh;
end;

procedure TSchemaBrowserFrame.GenerateDeleteStatementActionExecute(Sender: TObject);
var
  s: string;
begin
  Clipboard.Clear;
  Clipboard.AsText := Clipboard.AsText + 'DELETE ' + LowerCase(ObjectTreeFrame.SchemaParam) + '.' + LowerCase(ObjectTreeFrame.ObjectName) + CHR_ENTER;
  s := ' WHERE ';
  TableBrowserFrame.OpenQuery(FTableBrowserFrame.ColumnsQuery);
  with FTableBrowserFrame.ColumnsQuery do
  begin
    DisableControls;
    First;
    while not Eof do
    begin
      if not FieldByName(PRIMARY_KEY).IsNull then
      begin
        Clipboard.AsText := Clipboard.AsText + s + LowerCase(Trim(FieldByName(COLUMN_NAME).AsWideString)) + ' = :old_' + LowerCase(Trim(FieldByName(COLUMN_NAME).AsWideString));
        s := CHR_ENTER + '   AND ';
      end;
      Next;
    end;
    First;
    EnableControls;
  end;
end;

procedure TSchemaBrowserFrame.GenerateInsertStatementActionExecute(Sender: TObject);
var
  s: string;
  RightMargin: Integer;
begin
  RightMargin := OptionsContainer.MarginRightMargin;
  Clipboard.Clear;
  Clipboard.AsText := Clipboard.AsText + 'INSERT INTO ' + LowerCase(ObjectTreeFrame.SchemaParam) + '.' + LowerCase(ObjectTreeFrame.ObjectName) + CHR_ENTER;
  s := '            (';
  TableBrowserFrame.OpenQuery(FTableBrowserFrame.ColumnsQuery);
  with FTableBrowserFrame.ColumnsQuery do
  begin
    DisableControls;
    First;
    while not Eof do
    begin
      s := s + LowerCase(Trim(FieldByName(COLUMN_NAME).AsWideString));
      Next;
      if not Eof then
        s := s + ', ';

      if Length(s) + Length(Trim(FieldByName(COLUMN_NAME).AsWideString)) > RightMargin then
      begin
        Clipboard.AsText := Clipboard.AsText + s + CHR_ENTER;
        s := '             ';
      end;
    end;
    if s <> '' then
      Clipboard.AsText := Clipboard.AsText + s;
    First;
    EnableControls;
  end;
  Clipboard.AsText := Clipboard.AsText + ')' + CHR_ENTER;
  s := '     VALUES (';
  with FTableBrowserFrame.ColumnsQuery do
  begin
    DisableControls;
    First;
    while not Eof do
    begin
      s := s + ':' + LowerCase(Trim(FieldByName(COLUMN_NAME).AsWideString));
      Next;
      if not Eof then
        s := s + ', ';

      if Length(s) + Length(Trim(FieldByName(COLUMN_NAME).AsWideString)) > RightMargin then
      begin
        Clipboard.AsText := Clipboard.AsText + s + CHR_ENTER;
        s := '             ';
      end;
    end;
    if s <> '' then
      Clipboard.AsText := Clipboard.AsText + s;
    First;
    EnableControls;
  end;
  Clipboard.AsText := Clipboard.AsText + ')';
end;

procedure TSchemaBrowserFrame.GenerateTableSelectStatementActionExecute(Sender: TObject);
var
  s: string;
  RightMargin: Integer;
begin
  RightMargin := OptionsContainer.MarginRightMargin;
  s := 'SELECT ';
  Clipboard.Clear;
  TableBrowserFrame.OpenQuery(FTableBrowserFrame.ColumnsQuery);
  with FTableBrowserFrame.ColumnsQuery do
  begin
    DisableControls;
    First;
    while not Eof do
    begin
      s := s + LowerCase(Trim(FieldByName(COLUMN_NAME).AsWideString));
      Next;
      if not Eof then
        s := s + ', ';

      if Length(s) + Length(Trim(FieldByName(COLUMN_NAME).AsWideString)) > RightMargin then
      begin
        Clipboard.AsText := Clipboard.AsText + s;
        if not Eof then
          Clipboard.AsText := Clipboard.AsText + CHR_ENTER;
        s := '       ';
      end;
    end;
    if s <> '' then
      Clipboard.AsText := Clipboard.AsText + s;
    First;
    EnableControls;
  end;
  Clipboard.AsText := Clipboard.AsText + CHR_ENTER + '  FROM ' + LowerCase(ObjectTreeFrame.SchemaParam) + '.' + LowerCase(ObjectTreeFrame.ObjectName);
end;

procedure TSchemaBrowserFrame.GenerateUpdateStatementActionExecute(Sender: TObject);
var
  s: string;
begin
  Clipboard.Clear;
  Clipboard.AsText := Clipboard.AsText + 'UPDATE ' + LowerCase(ObjectTreeFrame.SchemaParam) + '.' + LowerCase(ObjectTreeFrame.ObjectName) + CHR_ENTER;
  Clipboard.AsText := Clipboard.AsText + '   SET ';
  TableBrowserFrame.OpenQuery(FTableBrowserFrame.ColumnsQuery);
  with FTableBrowserFrame.ColumnsQuery do
  begin
    DisableControls;
    First;
    while not Eof do
    begin
      Clipboard.AsText := Clipboard.AsText + LowerCase(Trim(FieldByName(COLUMN_NAME).AsWideString)) + ' = :' + LowerCase(Trim(FieldByName(COLUMN_NAME).AsWideString));
      Next;
      if not Eof then
        Clipboard.AsText := Clipboard.AsText + ', ' + CHR_ENTER + '       ';
    end;
    First;
    EnableControls;
  end;
  Clipboard.AsText := Clipboard.AsText + CHR_ENTER;
  s := ' WHERE ';
  with FTableBrowserFrame.ColumnsQuery do
  begin
    DisableControls;
    First;
    while not Eof do
    begin
      if not FieldByName(PRIMARY_KEY).IsNull then
      begin
        Clipboard.AsText := Clipboard.AsText + s + LowerCase(Trim(FieldByName(COLUMN_NAME).AsWideString)) + ' = :old_' + LowerCase(Trim(FieldByName(COLUMN_NAME).AsWideString));
        s := CHR_ENTER + '   AND ';
      end;
      Next;
    end;
    First;
    EnableControls;
  end;
end;

procedure TSchemaBrowserFrame.SetShortCuts(Clear: Boolean);
begin
  FTableBrowserFrame.FilterAction.ShortCut := scNone;
  FTableBrowserFrame.SortAction.ShortCut :=  scNone;
  FViewBrowserFrame.FilterAction.ShortCut := scNone;
  FViewBrowserFrame.SortAction.ShortCut := scNone;
  if not Clear then
  begin
    if ObjectTreeFrame.ObjectType = OBJECT_TYPE_TABLE then
    begin
      FTableBrowserFrame.FilterAction.ShortCut := Vcl.Menus.ShortCut(Word('F'), [ssCtrl]);
      FTableBrowserFrame.SortAction.ShortCut :=  Vcl.Menus.ShortCut(Word('S'), [ssCtrl]);
    end;
    if ObjectTreeFrame.ObjectType = OBJECT_TYPE_VIEW then
    begin
      FViewBrowserFrame.FilterAction.ShortCut :=  Vcl.Menus.ShortCut(Word('F'), [ssCtrl]);
      FViewBrowserFrame.SortAction.ShortCut := Vcl.Menus.ShortCut(Word('S'), [ssCtrl]);
    end;
  end;
end;

procedure TSchemaBrowserFrame.SetFrames(Refresh: Boolean);
var
  i: Integer;
  s, NodeText, SourceType: string;
  Node: PVirtualNode;
  Data, ParentData: PObjectNodeRec;
  SynEdit: TSynEdit;
  InsideComment: Boolean;
label
  DoSearch;
begin
  SetShortCuts;
  { Tables }
  if ObjectTreeFrame.ObjectType = OBJECT_TYPE_TABLE then
  begin
    FTableBrowserFrame.ObjectName := ObjectTreeFrame.ObjectName;
    FTableBrowserFrame.SchemaParam := ObjectTreeFrame.SchemaParam;
    FTableBrowserFrame.SchemaActionList := SchemaActionList;
    FTableBrowserFrame.GetTableComments;
    FTableBrowserFrame.UpdateFilterDropDownMenu;
    FTableBrowserFrame.UpdateSortDropDownMenu;
    FTableBrowserFrame.ObjectFrameAlign := FObjectFrameAlign;
    FTableBrowserFrame.ShowDataSearchPanel := OptionsContainer.ShowDataSearchPanel;
    FTableBrowserFrame.OpenQuery(nil, Refresh);
    CustomizePageControlDialog.CustomizePageControl(FTableBrowserFrame.TablePageControl);
    FTableBrowserFrame.Visible := True;
    Application.ProcessMessages;
  end
  else
    TableBrowserFrame.Visible := False;
  { Views }
  if ObjectTreeFrame.ObjectType = OBJECT_TYPE_VIEW then
  begin
    FViewBrowserFrame.ObjectName := ObjectTreeFrame.ObjectName;
    FViewBrowserFrame.SchemaParam := ObjectTreeFrame.SchemaParam;
    FViewBrowserFrame.SchemaActionList := SchemaActionList;
    FViewBrowserFrame.GetViewComments;
    FViewBrowserFrame.UpdateFilterDropDownMenu;
    FViewBrowserFrame.UpdateSortDropDownMenu;
    FViewBrowserFrame.ObjectFrameAlign := FObjectFrameAlign;
    FViewBrowserFrame.OpenQuery(nil, Refresh);
    CustomizePageControlDialog.CustomizePageControl(FViewBrowserFrame.ViewPageControl);
    FViewBrowserFrame.Visible := True;
    Application.ProcessMessages;
  end
  else
    FViewBrowserFrame.Visible := False;
  { Func proc }
  if (ObjectTreeFrame.ObjectType = OBJECT_TYPE_FUNCTION) or (ObjectTreeFrame.ObjectType = OBJECT_TYPE_PROCEDURE) then
  begin
    FFuncProcBrowserFrame.ObjectName := ObjectTreeFrame.ObjectName;
    FFuncProcBrowserFrame.SchemaParam := ObjectTreeFrame.SchemaParam;
    FFuncProcBrowserFrame.SchemaActionList := SchemaActionList;
    FFuncProcBrowserFrame.ObjectFrameAlign := FObjectFrameAlign;
    FFuncProcBrowserFrame.OpenQuery(Refresh);
    CustomizePageControlDialog.CustomizePageControl(FFuncProcBrowserFrame.FuncProcPageControl);
    FFuncProcBrowserFrame.Visible := True;
    Application.ProcessMessages;
  end
  else
    FFuncProcBrowserFrame.Visible := False;
  { Packages }
  if ObjectTreeFrame.ObjectType = OBJECT_TYPE_PACKAGE then
  begin
    FPackageBrowserFrame.ObjectName := ObjectTreeFrame.ObjectName;
    FPackageBrowserFrame.SchemaParam := ObjectTreeFrame.SchemaParam;
    FPackageBrowserFrame.SchemaActionList := SchemaActionList;
    FPackageBrowserFrame.ObjectFrameAlign := FObjectFrameAlign;
    FPackageBrowserFrame.OpenQuery(Refresh);
    CustomizePageControlDialog.CustomizePageControl(FPackageBrowserFrame.PackagePageControl);
    FPackageBrowserFrame.Visible := True;
    { specification and body clicks }
    Node := ObjectTreeFrame.VirtualDrawTree.GetFirstSelected;
    if Assigned(Node) then
    begin
      Data := ObjectTreeFrame.VirtualDrawTree.GetNodeData(Node);
      NodeText := string(Data.NodeText);
      SourceType := string(Data.SourceType);
      { remove function return type }
      if Pos(':', NodeText) <> 0 then
        NodeText := Copy(NodeText, 1, Pos(':', NodeText) - 1);

      if Data.Level = 2 then
      begin
        if Data.StateIndex = 10 then
          FPackageBrowserFrame.PackagePageControl.ActivePageIndex := 0
        else
          FPackageBrowserFrame.PackagePageControl.ActivePageIndex := 1;
        FPackageBrowserFrame.PackagePageControlChange(nil);
      end
      else
      if (Data.Level = 3) or (Data.Level = 4) then
      begin
        ParentData := ObjectTreeFrame.VirtualDrawTree.GetNodeData(Node.Parent);
        if Data.Level = 4 then
        begin
          NodeText := string(ParentData.NodeText);
          { remove function return type }
          if Pos(':', NodeText) <> 0 then
            NodeText := Copy(NodeText, 1, Pos(':', NodeText) - 1);
          SourceType := string(ParentData.SourceType);
        end;
        if ParentData.StateIndex = 10 then
        begin
          FPackageBrowserFrame.PackagePageControl.ActivePageIndex := 0;
          FPackageBrowserFrame.PackagePageControlChange(nil);
          SynEdit := FPackageBrowserFrame.SpecSynEdit;
          if Data.Level = 3 then
          begin
            SynEdit.CaretX := Data.CaretX;
            SynEdit.CaretY := Data.CaretY;
            SynEdit.SelLength := Length(NodeText);
          end
          else
          begin
            SynEdit.CaretX := ParentData.CaretX;
            SynEdit.CaretY := ParentData.CaretY;
            SynEdit.SelLength := Length(NodeText);
          end;
        end
        else
        begin
          FPackageBrowserFrame.PackagePageControl.ActivePageIndex := 1;
          FPackageBrowserFrame.PackagePageControlChange(nil);
          SynEdit := FPackageBrowserFrame.BodySynEdit;

          InsideComment := False;
          for i := 0 to SynEdit.Lines.Count - 1 do
          begin
            s := SynEdit.Lines[i];
            if InsideComment and (Pos('*/', s) <> 0) then
            begin
              s := Copy(s, Pos('*/', s) + 2, Length(s));
              InsideComment := False;
            end;
            if Pos('--', s) <> 0 then
              s := Copy(s, 1, Pos('--', s) - 1);
            if Pos('/*', s) <> 0 then
            begin
              if Pos('*/', s) = 0 then
                InsideComment := True;
              s := Copy(s, 1, Pos('/*', s) - 1);
            end;

            if not InsideComment and (System.Pos(NodeText, s) <> 0) and
              (System.Pos(string(SourceType), UpperCase(s)) <> 0) then
            begin
              SynEdit.CaretX := System.Pos(NodeText, s);
              SynEdit.CaretY := i + 1;
              SynEdit.SelLength := Length(NodeText);
              Break;
            end;
          end;
        end;
      end;
    end;
    Application.ProcessMessages;
  end
  else
    FPackageBrowserFrame.Visible := False;
  { Triggers }
  if ObjectTreeFrame.ObjectType = OBJECT_TYPE_TRIGGER then
  begin
    FTriggerBrowserFrame.ObjectName := ObjectTreeFrame.ObjectName;
    FTriggerBrowserFrame.SchemaParam := ObjectTreeFrame.SchemaParam;
    FTriggerBrowserFrame.ObjectFrameAlign := FObjectFrameAlign;
    FTriggerBrowserFrame.OpenQuery(Refresh);
    CustomizePageControlDialog.CustomizePageControl(FTriggerBrowserFrame.TriggerPageControl);
    FTriggerBrowserFrame.Visible := True;
    Application.ProcessMessages;
  end
  else
    FTriggerBrowserFrame.Visible := False;
  { Constraints }
  if ObjectTreeFrame.ObjectType = OBJECT_TYPE_CONSTRAINT then
  begin
    FConstraintBrowserFrame.ObjectName := ObjectTreeFrame.ObjectName;
    FConstraintBrowserFrame.SchemaParam := ObjectTreeFrame.SchemaParam;
    FConstraintBrowserFrame.ObjectFrameAlign := FObjectFrameAlign;
    FConstraintBrowserFrame.OpenQuery(Refresh);
    CustomizePageControlDialog.CustomizePageControl(FConstraintBrowserFrame.ConstraintPageControl);
    FConstraintBrowserFrame.Visible := True;
    Application.ProcessMessages;
  end
  else
    FConstraintBrowserFrame.Visible := False;
  { Indexes }
  if ObjectTreeFrame.ObjectType = OBJECT_TYPE_INDEX then
  begin
    FIndexBrowserFrame.ObjectName := ObjectTreeFrame.ObjectName;
    FIndexBrowserFrame.SchemaParam := ObjectTreeFrame.SchemaParam;
    FIndexBrowserFrame.ObjectFrameAlign := FObjectFrameAlign;
    FIndexBrowserFrame.OpenQuery(Refresh);
    CustomizePageControlDialog.CustomizePageControl(FIndexBrowserFrame.IndexPageControl);
    FIndexBrowserFrame.Visible := True;
    Application.ProcessMessages;
  end
  else
    FIndexBrowserFrame.Visible := False;
  { Sequences }
  if ObjectTreeFrame.ObjectType = OBJECT_TYPE_SEQUENCE then
  begin
    FSequenceBrowserFrame.ObjectName := ObjectTreeFrame.ObjectName;
    FSequenceBrowserFrame.SchemaParam := ObjectTreeFrame.SchemaParam;
    FSequenceBrowserFrame.SchemaActionList := SchemaActionList;
    FSequenceBrowserFrame.ObjectFrameAlign := FObjectFrameAlign;
    FSequenceBrowserFrame.OpenQuery(nil, Refresh);
    CustomizePageControlDialog.CustomizePageControl(FSequenceBrowserFrame.SequencePageControl);
    FSequenceBrowserFrame.Visible := True;
    Application.ProcessMessages;
  end
  else
    FSequenceBrowserFrame.Visible := False;
  { Synonyms }
  if ObjectTreeFrame.ObjectType = OBJECT_TYPE_SYNONYM then
  begin
    FSynonymBrowserFrame.ObjectName := ObjectTreeFrame.ObjectName;
    FSynonymBrowserFrame.SchemaParam := ObjectTreeFrame.SchemaParam;
    FSynonymBrowserFrame.ObjectFrameAlign := FObjectFrameAlign;
    FSynonymBrowserFrame.OpenQuery(Refresh);
    CustomizePageControlDialog.CustomizePageControl(FSynonymBrowserFrame.SynonymPageControl);
    FSynonymBrowserFrame.Visible := True;
    Application.ProcessMessages;
  end
  else
    FSynonymBrowserFrame.Visible := False;
  { DB Links }
  if ObjectTreeFrame.ObjectType = OBJECT_TYPE_DATABASE_LINK then
  begin
    FDBLinkBrowserFrame.ObjectName := ObjectTreeFrame.ObjectName;
    FDBLinkBrowserFrame.SchemaParam := ObjectTreeFrame.SchemaParam;
    FDBLinkBrowserFrame.ObjectFrameAlign := FObjectFrameAlign;
    FDBLinkBrowserFrame.OpenQuery(Refresh);
    CustomizePageControlDialog.CustomizePageControl(FDBLinkBrowserFrame.DBLinkPageControl);
    FDBLinkBrowserFrame.Visible := True;
    Application.ProcessMessages;
  end
  else
    FDBLinkBrowserFrame.Visible := False;
  { Indexes }
  if ObjectTreeFrame.ObjectType = OBJECT_TYPE_USER then
  begin
    FUserBrowserFrame.ObjectName := ObjectTreeFrame.ObjectName;
    FUserBrowserFrame.SchemaParam := ObjectTreeFrame.SchemaParam;
    FUserBrowserFrame.ObjectFrameAlign := FObjectFrameAlign;
    FUserBrowserFrame.OpenQuery(Refresh);
    CustomizePageControlDialog.CustomizePageControl(FUserBrowserFrame.UserPageControl);
    FUserBrowserFrame.Visible := True;
    Application.ProcessMessages;
  end
  else
    FUserBrowserFrame.Visible := False;
  { Invalid objects }
  if ObjectTreeFrame.ObjectType = OBJECT_TYPE_INVALID_OBJECT then
  begin
    //ObjectTreeFrame.ObjectType := ObjectTypeToText(Copy(ObjectTreeFrame.ObjectName, 0, Pos(' ', ObjectTreeFrame.ObjectName) - 1));
    ObjectTreeFrame.ObjectType := Copy(ObjectTreeFrame.ObjectName, 0, Pos(' ', ObjectTreeFrame.ObjectName) - 1);
    ObjectTreeFrame.ObjectName := Copy(ObjectTreeFrame.ObjectName, Pos(' ', ObjectTreeFrame.ObjectName) + 1, Length(ObjectTreeFrame.ObjectName));
    if Pos(' ', ObjectTreeFrame.ObjectName) <> 0 then
      ObjectTreeFrame.ObjectName := Copy(ObjectTreeFrame.ObjectName, Pos(' ', ObjectTreeFrame.ObjectName) + 1, Length(ObjectTreeFrame.ObjectName));
    if Pos('.', ObjectTreeFrame.ObjectName) <> 0 then
      ObjectTreeFrame.ObjectName := Copy(ObjectTreeFrame.ObjectName, Pos('.', ObjectTreeFrame.ObjectName) + 1, Length(ObjectTreeFrame.ObjectName));

    SetFrames(Refresh);
    Application.ProcessMessages;
  end;
  { Recycle bin }
  if ObjectTreeFrame.ObjectType = OBJECT_TYPE_RECYCLE_BIN then
  begin
    FRecycleBinBrowserFrame.ObjectName := ObjectTreeFrame.ObjectName;
    FRecycleBinBrowserFrame.ObjectFrameAlign := FObjectFrameAlign;
    FRecycleBinBrowserFrame.OpenQuery(Refresh);
    CustomizePageControlDialog.CustomizePageControl(FRecycleBinBrowserFrame.RecycleBinPageControl);
    FRecycleBinBrowserFrame.Visible := True;
    Application.ProcessMessages;
  end
  else
    FRecycleBinBrowserFrame.Visible := False;
end;

function TSchemaBrowserFrame.SelectionFound: Boolean;
begin
  Result := False;
  { Tables }
  if ObjectTreeFrame.ObjectType = OBJECT_TYPE_TABLE then
    Result := FTableBrowserFrame.SourceSynEdit.SelAvail
  else
  { Views }
  if ObjectTreeFrame.ObjectType = OBJECT_TYPE_VIEW then
    Result := FViewBrowserFrame.SourceSynEdit.SelAvail
  else
  { Func proc }
  if (ObjectTreeFrame.ObjectType = OBJECT_TYPE_FUNCTION) or (ObjectTreeFrame.ObjectType = OBJECT_TYPE_PROCEDURE) then
    Result := FFuncProcBrowserFrame.SourceSynEdit.SelAvail
  else
  { Packages }
  if ObjectTreeFrame.ObjectType = OBJECT_TYPE_PACKAGE then
    Result := FPackageBrowserFrame.SpecSynEdit.SelAvail or FPackageBrowserFrame.BodySynEdit.SelAvail
  else
  { Triggers }
  if ObjectTreeFrame.ObjectType = OBJECT_TYPE_TRIGGER then
    Result := FTriggerBrowserFrame.SourceSynEdit.SelAvail
  else
  { Sequences }
  if ObjectTreeFrame.ObjectType = OBJECT_TYPE_SEQUENCE then
    Result := FSequenceBrowserFrame.SourceSynEdit.SelAvail
  else
  { DB Links }
  if ObjectTreeFrame.ObjectType = OBJECT_TYPE_DATABASE_LINK then
    Result := FDBLinkBrowserFrame.SourceSynEdit.SelAvail
end;

procedure TSchemaBrowserFrame.UpdateMarginsAndControls(DoubleBuffered: Boolean);
begin
  AssignOptions;
  FTableBrowserFrame.TablePageControl.DoubleBuffered := DoubleBuffered;
  FViewBrowserFrame.ViewPageControl.DoubleBuffered := DoubleBuffered;
  FFuncProcBrowserFrame.FuncProcPageControl.DoubleBuffered := DoubleBuffered;
  FPackageBrowserFrame.PackagePageControl.DoubleBuffered := DoubleBuffered;
  FTriggerBrowserFrame.TriggerPageControl.DoubleBuffered := DoubleBuffered;
  FConstraintBrowserFrame.ConstraintPageControl.DoubleBuffered := DoubleBuffered;
  FIndexBrowserFrame.IndexPageControl.DoubleBuffered := DoubleBuffered;
  FSequenceBrowserFrame.SequencePageControl.DoubleBuffered := DoubleBuffered;
  FSynonymBrowserFrame.SynonymPageControl.DoubleBuffered := DoubleBuffered;
  FDBLinkBrowserFrame.DBLinkPageControl.DoubleBuffered := DoubleBuffered;
  FRecycleBinBrowserFrame.RecycleBinPageControl.DoubleBuffered := DoubleBuffered;
  FUserBrowserFrame.UserPageControl.DoubleBuffered := DoubleBuffered;
  UpdateMargin(FTableBrowserFrame.TriggerSynEdit);
  UpdateMargin(FTableBrowserFrame.SourceSynEdit);
  UpdateSQLSynColors(FTableBrowserFrame.SynSQLSyn);
  UpdateMargin(FViewBrowserFrame.TriggerSynEdit);
  UpdateMargin(FViewBrowserFrame.SourceSynEdit);
  UpdateSQLSynColors(FViewBrowserFrame.SynSQLSyn);
  UpdateMargin(FFuncProcBrowserFrame.SourceSynEdit);
  UpdateSQLSynColors(FFuncProcBrowserFrame.SynSQLSyn);
  UpdateMargin(FPackageBrowserFrame.SpecSynEdit);
  UpdateMargin(FPackageBrowserFrame.BodySynEdit);
  UpdateSQLSynColors(FPackageBrowserFrame.SynSQLSyn);
  UpdateMargin(FTriggerBrowserFrame.SourceSynEdit);
  UpdateSQLSynColors(FTriggerBrowserFrame.SynSQLSyn);
  UpdateMargin(FSequenceBrowserFrame.SourceSynEdit);
  UpdateSQLSynColors(FSequenceBrowserFrame.SynSQLSyn);
  UpdateMargin(FDBLinkBrowserFrame.SourceSynEdit);
  UpdateSQLSynColors(FDBLinkBrowserFrame.SynSQLSyn);
  UpdateMargin(FUserBrowserFrame.SourceSynEdit);
  UpdateSQLSynColors(FUserBrowserFrame.SynSQLSyn);
end;

end.
