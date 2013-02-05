unit Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms,
  Vcl.Dialogs, ActnList, PlatformDefaultStyleActnCtrls, ActnMan, ActnCtrls, ToolWin, SQLHistory,
  ActnMenus, ComCtrls, JvExComCtrls, JvComCtrls, Vcl.ExtCtrls, StdActns, Vcl.ImgList, Types, BCPageControl,
  AppEvnts, JvExExtCtrls, JvSplitter, Menus, SQLEditor, SchemaBrowser, BCPopupMenu,
  ActnPopup, JvToolBar, BCImageList, Vcl.Themes, JvComponentBase, JvDragDrop;

const
  WM_AFTER_SHOW = WM_USER + 345; // custom message
  VIEW_MENU_ITEMINDEX = 4;
  STYLE_MENU_ITEMINDEX = 10;

type
  TMainForm = class(TForm)
    ActionMainMenuBar: TActionMainMenuBar;
    ActionManager: TActionManager;
    ActionToolBar: TActionToolBar;
    ApplicationEvents: TApplicationEvents;
    ClearBookmarksAction: TAction;
    CloseAllOtherPages1: TMenuItem;
    DatabaseCloseAllOtherTabsAction: TAction;
    DatabaseCloseAllTabAction: TAction;
    DatabaseCloseTabAction: TAction;
    DatabaseCommitAction: TAction;
    DatabaseCreateConstraintAction: TAction;
    DatabaseCreateDBLinkAction: TAction;
    DatabaseCreateFunctionAction: TAction;
    DatabaseCreateIndexAction: TAction;
    DatabaseCreatePackageAction: TAction;
    DatabaseCreateProcedureAction: TAction;
    DatabaseCreateSequenceAction: TAction;
    DatabaseCreateSynonymAction: TAction;
    DatabaseCreateTableAction: TAction;
    DatabaseCreateTriggerAction: TAction;
    DatabaseCreateUserAction: TAction;
    DatabaseCreateViewAction: TAction;
    DatabaseEditorMenuAction: TAction;
    DatabaseEndConnectionMenuAction: TAction;
    DatabaseExportTableDataAction: TAction;
    DatabaseImportTableDataAction: TAction;
    DatabaseNewConnectionMenuAction: TAction;
    DatabaseObjectSearchAction: TAction;
    DatabaseRefreshAction: TAction;
    DatabaseRollbackAction: TAction;
    DBMSOutputAction: TAction;
    DocumentPopupMenu: TBCPopupMenu;
    DragDrop: TJvDragDrop;
    EditCopyAction: TAction;
    EditCutAction: TAction;
    EditDecreaseIndentAction: TAction;
    EditDeleteEOLAction: TAction;
    EditDeleteLineAction: TAction;
    EditDeleteWordAction: TAction;
    EditIncreaseIndentAction: TAction;
    EditInsertLineAction: TAction;
    EditPasteAction: TAction;
    EditRedoAction: TAction;
    EditSelectAllAction: TAction;
    EditSortAscAction: TAction;
    EditSortDescAction: TAction;
    EditToggleCaseAction: TAction;
    EditUndoAction: TAction;
    ExecuteScriptAction: TAction;
    ExecuteStatementAction: TAction;
    ExplainPlanAction: TAction;
    FileCloseAction: TAction;
    FileCloseAllAction: TAction;
    FileCloseAllMenuItem: TMenuItem;
    FileCloseAllOtherPagesAction: TAction;
    FileCloseMenuItem: TMenuItem;
    FileExitAction: TAction;
    FileNewAction: TAction;
    FileOpenAction: TAction;
    FilePrintAction: TAction;
    FilePrintPreviewAction: TAction;
    FileSaveAction: TAction;
    FileSaveAllAction: TAction;
    FileSaveAsAction: TAction;
    FormatSQLAction: TAction;
    HelpAboutMenuAction: TAction;
    HelpCheckForUpdateMenuAction: TAction;
    HelpHomeAction: TAction;
    InsertObjectAction: TAction;
    MainMenuPanel: TPanel;
    MainPanel: TPanel;
    MenuImageList: TBCImageList;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    N1: TMenuItem;
    PageControl: TBCPageControl;
    PageControlPopupMenu: TBCPopupMenu;
    PrintMenuItem: TMenuItem;
    PrintPreviewMenuItem: TMenuItem;
    SaveAsMenuItem: TMenuItem;
    SaveMenuItem: TMenuItem;
    SchemaDocumentAction: TAction;
    SearchAction: TAction;
    SearchFindInFilesAction: TAction;
    SearchFindNextAction: TAction;
    SearchFindPreviousAction: TAction;
    SearchReplaceAction: TAction;
    SearchToggleBookmarkAction: TAction;
    SelectforCompareMenuItem: TMenuItem;
    SelectStyleAction: TAction;
    Separator1MenuItem: TMenuItem;
    Separator2MenuItem: TMenuItem;
    Separator3MenuItem: TMenuItem;
    SQLHistoryAction: TAction;
    StatusBar: TStatusBar;
    TNSNamesEditorAction: TAction;
    ToolBarPanel: TPanel;
    ToolsCompareFilesAction: TAction;
    ToolsCompareSchemasAction: TAction;
    ToolsOptionsAction: TAction;
    ToolsSelectForCompareAction: TAction;
    ViewLineNumbersAction: TAction;
    ViewNextPageAction: TAction;
    ViewOutputAction: TAction;
    ViewPreviousPageAction: TAction;
    ViewSelectionModeAction: TAction;
    ViewSpecialCharsAction: TAction;
    ViewToolbarAction: TAction;
    ViewWordWrapAction: TAction;
    procedure ApplicationEventsActivate(Sender: TObject);
    procedure ApplicationEventsHint(Sender: TObject);
    procedure ApplicationEventsMessage(var Msg: tagMSG; var Handled: Boolean);
    procedure ClearBookmarksActionExecute(Sender: TObject);
    procedure DatabaseCloseAllOtherTabsActionExecute(Sender: TObject);
    procedure DatabaseCloseAllTabActionExecute(Sender: TObject);
    procedure DatabaseCloseTabActionExecute(Sender: TObject);
    procedure DatabaseCommitActionExecute(Sender: TObject);
    procedure DatabaseCreateConstraintActionExecute(Sender: TObject);
    procedure DatabaseCreateDBLinkActionExecute(Sender: TObject);
    procedure DatabaseCreateFunctionActionExecute(Sender: TObject);
    procedure DatabaseCreateIndexActionExecute(Sender: TObject);
    procedure DatabaseCreatePackageActionExecute(Sender: TObject);
    procedure DatabaseCreateProcedureActionExecute(Sender: TObject);
    procedure DatabaseCreateSequenceActionExecute(Sender: TObject);
    procedure DatabaseCreateSynonymActionExecute(Sender: TObject);
    procedure DatabaseCreateTableActionExecute(Sender: TObject);
    procedure DatabaseCreateTriggerActionExecute(Sender: TObject);
    procedure DatabaseCreateUserActionExecute(Sender: TObject);
    procedure DatabaseCreateViewActionExecute(Sender: TObject);
    procedure DatabaseEditorMenuActionExecute(Sender: TObject);
    procedure DatabaseEndConnectionMenuActionExecute(Sender: TObject);
    procedure DatabaseExportTableDataActionExecute(Sender: TObject);
    procedure DatabaseImportTableDataActionExecute(Sender: TObject);
    procedure DatabaseNewConnectionMenuActionExecute(Sender: TObject);
    procedure DatabaseObjectSearchActionExecute(Sender: TObject);
    procedure DatabaseRefreshActionExecute(Sender: TObject);
    procedure DatabaseRollbackActionExecute(Sender: TObject);
    procedure DBMSOutputActionExecute(Sender: TObject);
    procedure DragDropDrop(Sender: TObject; Pos: TPoint; Value: TStrings);
    procedure EditCopyActionExecute(Sender: TObject);
    procedure EditCutActionExecute(Sender: TObject);
    procedure EditDecreaseIndentActionExecute(Sender: TObject);
    procedure EditDeleteEOLActionExecute(Sender: TObject);
    procedure EditDeleteLineActionExecute(Sender: TObject);
    procedure EditDeleteWordActionExecute(Sender: TObject);
    procedure EditIncreaseIndentActionExecute(Sender: TObject);
    procedure EditInsertLineActionExecute(Sender: TObject);
    procedure EditPasteActionExecute(Sender: TObject);
    procedure EditRedoActionExecute(Sender: TObject);
    procedure EditSelectAllActionExecute(Sender: TObject);
    procedure EditSortAscActionExecute(Sender: TObject);
    procedure EditSortDescActionExecute(Sender: TObject);
    procedure EditToggleCaseActionExecute(Sender: TObject);
    procedure EditUndoActionExecute(Sender: TObject);
    procedure ExecuteScriptActionExecute(Sender: TObject);
    procedure ExecuteStatementActionExecute(Sender: TObject);
    procedure ExplainPlanActionExecute(Sender: TObject);
    procedure FileCloseActionExecute(Sender: TObject);
    procedure FileCloseAllActionExecute(Sender: TObject);
    procedure FileCloseAllOtherPagesActionExecute(Sender: TObject);
    procedure FileExitActionExecute(Sender: TObject);
    procedure FileNewActionExecute(Sender: TObject);
    procedure FileOpenActionExecute(Sender: TObject);
    procedure FilePrintActionExecute(Sender: TObject);
    procedure FilePrintPreviewActionExecute(Sender: TObject);
    procedure FileSaveActionExecute(Sender: TObject);
    procedure FileSaveAllActionExecute(Sender: TObject);
    procedure FileSaveAsActionExecute(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormatSQLActionExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormResize(Sender: TObject);
    procedure Formshow(Sender: TObject);
    procedure HelpAboutMenuActionExecute(Sender: TObject);
    procedure HelpCheckForUpdateMenuActionExecute(Sender: TObject);
    procedure HelpHomeActionExecute(Sender: TObject);
    procedure InsertObjectActionExecute(Sender: TObject);
    procedure PageControlChange(Sender: TObject);
    procedure SchemaDocumentActionExecute(Sender: TObject);
    procedure SearchActionExecute(Sender: TObject);
    procedure SearchFindInFilesActionExecute(Sender: TObject);
    procedure SearchFindNextActionExecute(Sender: TObject);
    procedure SearchFindPreviousActionExecute(Sender: TObject);
    procedure SearchReplaceActionExecute(Sender: TObject);
    procedure SearchToggleBookmarkActionExecute(Sender: TObject);
    procedure SelectStyleActionExecute(Sender: TObject);
    procedure SQLHistoryActionExecute(Sender: TObject);
    procedure TNSNamesEditorActionExecute(Sender: TObject);
    procedure ToolsCompareFilesActionExecute(Sender: TObject);
    procedure ToolsCompareSchemasActionExecute(Sender: TObject);
    procedure ToolsOptionsActionExecute(Sender: TObject);
    procedure ToolsSelectForCompareActionExecute(Sender: TObject);
    procedure ViewLineNumbersActionExecute(Sender: TObject);
    procedure ViewNextPageActionExecute(Sender: TObject);
    procedure ViewPreviousPageActionExecute(Sender: TObject);
    procedure ViewSelectionModeActionExecute(Sender: TObject);
    procedure ViewSpecialCharsActionExecute(Sender: TObject);
    procedure ViewToolbarActionExecute(Sender: TObject);
    procedure ViewWordWrapActionExecute(Sender: TObject);
  private
    { Private declarations }
    FConnecting: Boolean;
    FOnProgress: Boolean;
    FOnStartUp: Boolean;
    function EndConnection(Confirm: Boolean): Integer;
    function GetActiveSchemaBrowser: TSchemaBrowserFrame;
    function GetActiveSQLEditor: TSQLEditorFrame;
    function GetActiveSQLHistory: TSQLHistoryFrame;
    function GetSessionList: TList;
    function OpenSQLEditor(Schema: string; AddNewDocument: Boolean): TSQLEditorFrame;
    procedure CloseTab(Confirm: Boolean);
    procedure CreateStyleMenu;
    procedure FindInFiles(SQLEditorFrame: TSQLEditorFrame; FindWhatText, FileTypeText, FolderText: string; SearchCaseSensitive, LookInSubfolders: Boolean);
    procedure NewConnection(ConnectString: string = ''; SchemaParam: string = '');
    procedure NextPage;
    procedure OpenSQLHistory;
    procedure PreviousPage;
    procedure ReadIniFile;
    procedure ReadOptions;
    procedure RecreateStatusBar;
    procedure SetFields;
    procedure UpdateGuttersAndControls;
    procedure WMAfterShow(var Msg: TMessage); message WM_AFTER_SHOW;
    procedure WriteIniFile;
  public
    { Public declarations }
    procedure LoadSQLIntoEditor(Schema: string; SQLText: WideString);
    procedure SetSQLEditorFields;
    property OnProgress: Boolean write FOnProgress;
  end;

var
  MainForm: TMainForm;

implementation

uses
  About, Common, Lib, Options, BigIni, FindInFiles, Clipbrd, Parameters, SynEdit, OraCall,
  DataFilter, BCDBGrid, ExportTableData, Progress, DataSort, ImportTableData, StyleHooks,
  SchemaDocument, VirtualTrees, Ora, ObjectSearch, SchemaCompare, DownloadURL, TNSNamesEditor,
  System.IOUtils, SQLFormatter;

{$R *.dfm}

const
  MAIN_CAPTION = 'OraBone';
  MAIN_CAPTION_HYPHEN = ' - ';
  MAIN_CAPTION_TAB = MAIN_CAPTION_HYPHEN + '[%s';
  MAIN_CAPTION_CLOSE = ']';
  MAIN_CAPTION_VERSION = 'Oracle Version ';

procedure TMainForm.HelpAboutMenuActionExecute(Sender: TObject);
begin
  AboutDialog.Open;
end;

procedure TMainForm.RecreateStatusBar;
var
  StatusPanel: TStatusPanel;
begin
  if Assigned(StatusBar) then
  begin
    StatusBar.Free;
    StatusBar := nil;
  end;
  StatusBar := TStatusBar.Create(Self);
  with StatusBar do
  begin
    Parent := Self;
    { 1st panel }
    StatusPanel := Panels.Add;
    StatusPanel.Width := 99;
    StatusPanel.Alignment := taCenter;
    { 2nd panel }
    StatusPanel := Panels.Add;
    StatusPanel.Width := 99;
    { 3rd panel }
    StatusPanel := Panels.Add;
    StatusPanel.Width := 99;
    { 4th panel }
    StatusPanel := Panels.Add;
    StatusPanel.Width := 50;
  end;
end;

procedure TMainForm.UpdateGuttersAndControls;
var
  i: Integer;
  SQLEditorFrame: TSQLEditorFrame;
  SchemaBrowserFrame: TSchemaBrowserFrame;
begin
  PageControl.DoubleBuffered := TStyleManager.ActiveStyle.Name = STYLENAME_WINDOWS;
  for i := 0 to PageControl.PageCount - 1 do
  begin
    if PageControl.Pages[i].ImageIndex = IMAGE_INDEX_SCHEMA_BROWSER then
    begin
      SchemaBrowserFrame := TSchemaBrowserFrame(PageControl.Pages[i].Components[0]);
      if Assigned(SchemaBrowserFrame) then
        SchemaBrowserFrame.UpdateGuttersAndControls(PageControl.DoubleBuffered);
    end
    else
    if PageControl.Pages[i].ImageIndex = IMAGE_INDEX_SQL_EDITOR then
    begin
      SQLEditorFrame := TSQLEditorFrame(PageControl.Pages[i].Components[0]);
      if Assigned(SQLEditorFrame) then
        SQLEditorFrame.UpdateGuttersAndControls(PageControl.DoubleBuffered);
    end
  end;
end;

procedure TMainForm.HelpCheckForUpdateMenuActionExecute(Sender: TObject);
begin
  Common.CheckForUpdates(Application.Title, AboutDialog.Version);
end;

procedure TMainForm.HelpHomeActionExecute(Sender: TObject);
begin
  BrowseURL(BONECODE_URL);
end;

procedure TMainForm.ApplicationEventsActivate(Sender: TObject);
var
  SynEdit: TBCSynEdit;
begin
  if PageControl.PageCount > 0 then
    if Assigned(PageControl.ActivePage) then
      if PageControl.ActivePage.ImageIndex = IMAGE_INDEX_SQL_EDITOR then
        if PageControl.ActivePage.Components[0] is TSQLEditorFrame then
        begin
          SynEdit := TSQLEditorFrame(PageControl.ActivePage.Components[0]).ActiveSynEdit;
          if Assigned(SynEdit) then
            SynEdit.SetFocus;
        end;
end;

procedure TMainForm.ApplicationEventsHint(Sender: TObject);
begin
  StatusBar.Panels[3].Text := Application.Hint;
end;

procedure TMainForm.ApplicationEventsMessage(var Msg: tagMSG;
  var Handled: Boolean);
begin
  SetFields;
end;

procedure TMainForm.ClearBookmarksActionExecute(Sender: TObject);
var
  SQLEditorFrame: TSQLEditorFrame;
begin
  SQLEditorFrame := GetActiveSQLEditor;
  if Assigned(SQLEditorFrame) then
    SQLEditorFrame.ClearBookmarks;
end;

function TMainForm.GetSessionList: TList;
var
  i: Integer;
  SchemaBrowserFrame: TSchemaBrowserFrame;
begin
  Result := TList.Create;
  for i := 0 to PageControl.PageCount - 1 do
    if PageControl.Pages[i].ImageIndex = IMAGE_INDEX_SCHEMA_BROWSER then
    begin
      SchemaBrowserFrame := TSchemaBrowserFrame(PageControl.Pages[i].Components[0]);
      if Assigned(SchemaBrowserFrame) then
        Result.Add(SchemaBrowserFrame.ObjectTreeFrame.Session);
    end;
end;

procedure TMainForm.ToolsCompareSchemasActionExecute(Sender: TObject);
begin
  SchemaCompareForm.Open(GetSessionList);
end;

function TMainForm.GetActiveSQLEditor: TSQLEditorFrame;
begin
  Result := nil;
  if PageControl.PageCount > 0 then
    if Assigned(PageControl.ActivePage) then
      if PageControl.ActivePage.ImageIndex = IMAGE_INDEX_SQL_EDITOR then
        if PageControl.ActivePage.Components[0] is TSQLEditorFrame then
          Result := TSQLEditorFrame(PageControl.ActivePage.Components[0]);
end;

function TMainForm.GetActiveSQLHistory: TSQLHistoryFrame;
begin
  Result := nil;
  if PageControl.PageCount > 0 then
    if Assigned(PageControl.ActivePage) then
      if PageControl.ActivePage.ImageIndex = IMAGE_INDEX_SQL_HISTORY then
        if PageControl.ActivePage.Components[0] is TSQLHistoryFrame then
          Result := TSQLHistoryFrame(PageControl.ActivePage.Components[0]);
end;

function TMainForm.GetActiveSchemaBrowser: TSchemaBrowserFrame;
begin
  Result := nil;
  if PageControl.PageCount > 0 then
    if Assigned(PageControl.ActivePage) then
      if PageControl.ActivePage.ImageIndex = IMAGE_INDEX_SCHEMA_BROWSER then
        if PageControl.ActivePage.Components[0] is TSchemaBrowserFrame then
          Result := TSchemaBrowserFrame(PageControl.ActivePage.Components[0]);
end;

procedure TMainForm.SchemaDocumentActionExecute(Sender: TObject);
var
  SchemaBrowserFrame: TSchemaBrowserFrame;
begin
  SchemaBrowserFrame := GetActiveSchemaBrowser;
  if Assigned(SchemaBrowserFrame) then
    SchemaDocumentForm.Open(SchemaBrowserFrame.ObjectTreeFrame.Session, SchemaBrowserFrame.ObjectTreeFrame.SchemaParam);
end;

procedure TMainForm.SearchActionExecute(Sender: TObject);
var
  SQLEditorFrame: TSQLEditorFrame;
begin
  SQLEditorFrame := GetActiveSQLEditor;
  if Assigned(SQLEditorFrame) then
    SQLEditorFrame.Search;
end;

{ Recursive method to find files. }
procedure TMainForm.FindInFiles(SQLEditorFrame: TSQLEditorFrame; FindWhatText, FileTypeText, FolderText: string; SearchCaseSensitive, LookInSubfolders: Boolean);
var
  shFindFile: THandle;
  sWin32FD: TWin32FindData;
  S, Line: string;
  FName: string;
  Ln, Ch, ChPos: Integer;
  Found: Boolean;
  SynEdit: TSynEdit;
  Root: PVirtualNode;

  function IsDirectory(dWin32FD: TWin32FindData): Boolean;
  var
    TmpAttr: DWORD;
  begin
    with dWin32FD do
    begin
      TmpAttr := dwFileAttributes and (FILE_ATTRIBUTE_READONLY or FILE_ATTRIBUTE_HIDDEN or FILE_ATTRIBUTE_SYSTEM or FILE_ATTRIBUTE_ARCHIVE or FILE_ATTRIBUTE_NORMAL or FILE_ATTRIBUTE_DIRECTORY);

      Result := (TmpAttr and FILE_ATTRIBUTE_DIRECTORY = FILE_ATTRIBUTE_DIRECTORY);
    end;
  end;
begin
  shFindFile := FindFirstFile(PChar(AddSlash(FolderText) + '*.*'), sWin32FD);
  if shFindFile <> INVALID_HANDLE_VALUE then
  try
    repeat
      StatusBar.Panels[3].Text := 'Search in progress...';
      Application.ProcessMessages;
      Screen.Cursor := crHourGlass;
      FName := StrPas(sWin32FD.cFileName);
      if (FName <> '.') and (FName <> '..') then
      begin
        if LookInSubfolders and IsDirectory(sWin32FD) then
          FindInFiles(SQLEditorFrame, FindWhatText, FileTypeText, AddSlash(FolderText) + FName, SearchCaseSensitive, LookInSubfolders)
        else
        begin
          //if SupportedFileExt(UpperCase(ExtractFileExt(FName))) then
            if (FileTypeText = '*.*') or (Pos(UpperCase(ExtractFileExt(FName)), UpperCase(FileTypeText)) <> 0) then
            try
              SynEdit := TBCSynEdit.Create(nil);
              SynEdit.Lines.LoadFromFile(AddSlash(FolderText) + FName);
              try
                Root := nil;
                if Trim(SynEdit.Text) <> '' then
                for Ln := 0 to SynEdit.Lines.Count - 1 do
                begin
                  Found := True;
                  Line := SynEdit.Lines[Ln];
                  S := Line;
                  ChPos := 0;
                  while Found do
                  begin
                    if SearchCaseSensitive then
                      Ch := Pos(FindWhatText, S)
                    else
                      Ch := Pos(UpperCase(FindWhatText), UpperCase(S));
                    if Ch <> 0 then
                    begin
                      Found := True;
                      ChPos := ChPos + Ch;
                      SQLEditorFrame.OutputFrame.AddTreeViewLine(Root, AddSlash(FolderText) + FName, Ln + 1, ChPos, Line, ShortString(FindWhatText));
                      S := Copy(S, Ch + Length(FindWhatText), Length(S));
                      ChPos := ChPos + Length(FindWhatText) - 1;
                    end
                    else
                      Found := False;
                  end;
                end
              finally
                SynEdit.Free;
              end;
            except
              Common.ShowWarningMessage(Format('File %s access error.', [AddSlash(FolderText) + FName]));
            end;
        end;
      end;
    until not FindNextFile(shFindFile, sWin32FD);
  finally
    Winapi.Windows.FindClose(shFindFile);
  end;
end;

procedure TMainForm.SearchFindInFilesActionExecute(Sender: TObject);
var
  T1, T2: TTime;
  SynEdit: TBCSynEdit;
  SQLEditorFrame: TSQLEditorFrame;
  Min, Secs: Integer;
  TimeDifference: string;
begin
  with FindInFilesDialog do
  begin
    Extensions := '*.*|*.sql|';
    SQLEditorFrame := GetActiveSQLEditor;
    SynEdit := SQLEditorFrame.ActiveSynEdit;
    if Assigned(SynEdit) then
      if SynEdit.SelAvail then
        FindWhatComboBox.Text := SynEdit.SelText;
    if ShowModal = mrOk then
    begin
      T1 := Now;
      Screen.Cursor := crHourGlass;
      try
        SQLEditorFrame.OutputPanel.Visible := True;
        SQLEditorFrame.OutputFrame.AddTreeView(Format('Search for ''%s''', [FindWhatText]));
        SQLEditorFrame.OutputFrame.ProcessingTabSheet := True;
        Application.ProcessMessages;
        Screen.Cursor := crHourGlass;
        FindInFiles(SQLEditorFrame, FindWhatText, FileTypeText, FolderText, SearchCaseSensitive, LookInSubfolders);
      finally
        T2 := Now;
        if not SQLEditorFrame.OutputFrame.IsEmpty then
        begin
          Min := StrToInt(FormatDateTime('n', T2 - T1));
          Secs := Min * 60 + StrToInt(FormatDateTime('s', T2 - T1));
          if Secs < 60 then
            TimeDifference := FormatDateTime('s.zzz "s"', T2 - T1)
          else
            TimeDifference := FormatDateTime('n "min" s.zzz "s"', T2 - T1);
          StatusBar.Panels[3].Text := Format('%d occurence(s) have been found in %s', [SQLEditorFrame.OutputFrame.Count, TimeDifference])
        end
        else
        begin
          Common.ShowMessage(Format('Cannot find the string ''%s''', [FindWhatText]));
          SQLEditorFrame.OutputFrame.CloseTabSheet;
          StatusBar.Panels[3].Text := '';
        end;
        SQLEditorFrame.OutputFrame.ProcessingTabSheet := False;
        Screen.Cursor := crDefault;
      end;
    end;
  end;
end;

procedure TMainForm.SearchFindNextActionExecute(Sender: TObject);
var
  SQLEditorFrame: TSQLEditorFrame;
begin
  SQLEditorFrame := GetActiveSQLEditor;
  if Assigned(SQLEditorFrame) then
    SQLEditorFrame.FindNext;
end;

procedure TMainForm.SearchFindPreviousActionExecute(Sender: TObject);
var
  SQLEditorFrame: TSQLEditorFrame;
begin
  SQLEditorFrame := GetActiveSQLEditor;
  if Assigned(SQLEditorFrame) then
    SQLEditorFrame.FindPrevious;
end;

procedure TMainForm.SearchReplaceActionExecute(Sender: TObject);
var
  SQLEditorFrame: TSQLEditorFrame;
begin
  SQLEditorFrame := GetActiveSQLEditor;
  if Assigned(SQLEditorFrame) then
    SQLEditorFrame.Replace;
end;

procedure TMainForm.SearchToggleBookmarkActionExecute(Sender: TObject);
var
  SQLEditorFrame: TSQLEditorFrame;
begin
  SQLEditorFrame := GetActiveSQLEditor;
  if Assigned(SQLEditorFrame) then
    SQLEditorFrame.ToggleBookMark;
end;

procedure TMainForm.SelectStyleActionExecute(Sender: TObject);
var
  i: Integer;
  Action: TAction;
  ActionClientItem: TActionClientItem;
  StyleInfo: TStyleInfo;
begin
  Action := Sender as TAction;

  if Action.Caption = STYLENAME_WINDOWS then
    TStyleManager.TrySetStyle(Action.Caption)
  else
  if TStyleManager.IsValidStyle(Action.Caption, StyleInfo) then
  begin
    if Assigned(TStyleManager.Style[StyleInfo.Name]) then
      TStyleManager.TrySetStyle(StyleInfo.Name)
    else
      TStyleManager.SetStyle(TStyleManager.LoadFromFile(Action.Caption));
  end;

  with TBigIniFile.Create(Common.GetINIFilename) do
  try
    WriteString('Options', 'StyleFilename', ExtractFilename(Action.Caption));
  finally
    Free;
  end;

  ActionClientItem := ActionMainMenuBar.ActionClient.Items[VIEW_MENU_ITEMINDEX];
  ActionClientItem := ActionClientItem.Items[STYLE_MENU_ITEMINDEX];
  for i := 0 to ActionClientItem.Items.Count - 1 do
    TAction(ActionClientItem.Items[i].Action).Checked := False;
  Action.Checked := True;
  UpdateGuttersAndControls;
  RecreateStatusBar;
end;

procedure TMainForm.CreateStyleMenu;
var
  FilePath, FileName: string;
  StyleInfo: TStyleInfo;
  ActionClientItem: TActionClientItem;
  Action: TAction;
begin
  FilePath := IncludeTrailingPathDelimiter(Format('%s%s', [ExtractFilePath(ParamStr(0)), 'Styles']));
  if not DirectoryExists(FilePath) then
    Exit;

  for FileName in TDirectory.GetFiles(FilePath, '*.vsf') do
  begin
    if TStyleManager.IsValidStyle(FileName, StyleInfo) then
    begin
      // TODO: Think better solution to find the Style menuitem.
      // This is poor solution. If the menu changes, then you should also remember to fix the item numbers.
      ActionClientItem := ActionMainMenuBar.ActionClient.Items[VIEW_MENU_ITEMINDEX];
      ActionClientItem := ActionClientItem.Items[STYLE_MENU_ITEMINDEX];
      // ---
      ActionClientItem := ActionClientItem.Items.Add;

      Action := TAction.Create(ActionManager);
      Action.Name := StringReplace(StyleInfo.Name, ' ', '', [rfReplaceAll]) + 'StyleSelectAction';
      //Action.GroupIndex := 1;
      Action.Caption := FileName;
      Action.OnExecute := SelectStyleActionExecute;
      Action.Checked :=  TStyleManager.ActiveStyle.Name = StyleInfo.Name;
      //Action.GroupIndex := 1;
      ActionClientItem.Action := Action;
      ActionClientItem.Caption := StyleInfo.Name;
    end;
  end;
  { Windows }
  ActionClientItem := ActionMainMenuBar.ActionClient.Items[VIEW_MENU_ITEMINDEX];
  ActionClientItem := ActionClientItem.Items[STYLE_MENU_ITEMINDEX];
  ActionClientItem := ActionClientItem.Items.Add;
  Action := TAction.Create(ActionManager);
  Action.Name := 'WindowsStyleSelectAction';
  //Action.GroupIndex := 1;
  Action.Caption := STYLENAME_WINDOWS;
  Action.OnExecute := SelectStyleActionExecute;
  Action.Checked :=  TStyleManager.ActiveStyle.Name = STYLENAME_WINDOWS;
  //Action.GroupIndex := 1;
  ActionClientItem.Action := Action;
end;

procedure TMainForm.SetSQLEditorFields;
var
  InfoText: string;
  SQLEditorFrame: TSQLEditorFrame;
  ActiveSQLDocumentFound, OutputGridHasFocus, ModifiedDocuments, SQLEditorSelectionFound: Boolean;
begin
  if FOnProgress then
    Exit;
  try
    SQLEditorFrame := GetActiveSQLEditor;
    ActiveSQLDocumentFound := Assigned(SQLEditorFrame) and SQLEditorFrame.ActiveDocumentFound;
    SQLEditorSelectionFound := Assigned(SQLEditorFrame) and SQLEditorFrame.SelectionFound;
    OutputGridHasFocus := Assigned(SQLEditorFrame) and SQLEditorFrame.OutputGridHasFocus;
    ModifiedDocuments := Assigned(SQLEditorFrame) and SQLEditorFrame.ModifiedDocuments;
    { file }
    FileNewAction.Enabled := Assigned(SQLEditorFrame);
    FileOpenAction.Enabled := FileNewAction.Enabled;
    FileCloseAction.Enabled := Assigned(SQLEditorFrame) and SQLEditorFrame.OpenTabSheets;
    FileCloseAllAction.Enabled := FileCloseAction.Enabled;
    FileSaveAsAction.Enabled := FileCloseAction.Enabled and ActiveSQLDocumentFound;
    if ActiveSQLDocumentFound then
      FileSaveAction.ShortCut :=  Menus.ShortCut(Word('S'), [ssCtrl])
    else
      FileSaveAction.ShortCut :=  scNone;
    FileSaveAction.Enabled := ActiveSQLDocumentFound and ModifiedDocuments;
    FileSaveAllAction.Enabled := FileSaveAction.Enabled and ActiveSQLDocumentFound;
    FilePrintAction.Enabled := FileCloseAction.Enabled and ActiveSQLDocumentFound;
    FilePrintPreviewAction.Enabled := FileCloseAction.Enabled and ActiveSQLDocumentFound;
    { Edit }
    EditUndoAction.Enabled := FileCloseAction.Enabled and Assigned(SQLEditorFrame) and SQLEditorFrame.CanUndo and ActiveSQLDocumentFound;
    EditRedoAction.Enabled := FileCloseAction.Enabled and Assigned(SQLEditorFrame) and SQLEditorFrame.CanRedo and ActiveSQLDocumentFound;
    EditCutAction.Enabled := SQLEditorSelectionFound and ActiveSQLDocumentFound;
    EditCopyAction.Enabled := EditCutAction.Enabled or OutputGridHasFocus;
    EditIncreaseIndentAction.Enabled := SQLEditorSelectionFound;
    EditDecreaseIndentAction.Enabled := SQLEditorSelectionFound;
    EditSortAscAction.Enabled := SQLEditorSelectionFound;
    EditSortDescAction.Enabled := SQLEditorSelectionFound;
    EditToggleCaseAction.Enabled := SQLEditorSelectionFound;
    EditInsertLineAction.Enabled := ActiveSQLDocumentFound;
    EditDeleteWordAction.Enabled := ActiveSQLDocumentFound;
    EditDeleteLineAction.Enabled := ActiveSQLDocumentFound;
    EditDeleteEOLAction.Enabled := ActiveSQLDocumentFound;
    {$IFDEF DEBUG}
    FormatSQLAction.Enabled := ActiveSQLDocumentFound;
    {$ENDIF}
    try
      EditPasteAction.Enabled := Clipboard.HasFormat(CF_TEXT) and ActiveSQLDocumentFound and not OutputGridHasFocus; //ClipBoard.AsText <> '';
    except
      // silent
    end;
    { Search }
    if ActiveSQLDocumentFound then
      SearchAction.ShortCut := Menus.ShortCut(Word('F'), [ssCtrl])
    else
      SearchAction.ShortCut := scNone;
    SearchAction.Enabled := ActiveSQLDocumentFound;
    SearchReplaceAction.Enabled := ActiveSQLDocumentFound;
    SearchFindNextAction.Enabled := ActiveSQLDocumentFound;
    SearchFindPreviousAction.Enabled := ActiveSQLDocumentFound;
    SearchFindInFilesAction.Enabled := Assigned(SQLEditorFrame);
    SearchToggleBookmarkAction.Enabled := ActiveSQLDocumentFound;
    { database }
    DatabaseNewConnectionMenuAction.Enabled := not FConnecting;
    DatabaseCommitAction.Enabled := ActiveSQLDocumentFound and SQLEditorFrame.InTransaction;
    DatabaseRollbackAction.Enabled := DatabaseCommitAction.Enabled;
    DatabaseCloseTabAction.Enabled := (not FConnecting) and (PageControl.PageCount > 0) and ((not Assigned(SQLEditorFrame)) or (Assigned(SQLEditorFrame) and not SQLEditorFrame.OutputFrame.ProcessingTabSheet ));
    { view }
    ViewOutputAction.Enabled := Assigned(SQLEditorFrame) and SQLEditorFrame.OutputFrame.IsAnyOutput;
    if Assigned(SQLEditorFrame) then
    begin
      if not ViewOutputAction.Enabled then { if there's no output then hide panel }
        SQLEditorFrame.OutputPanel.Visible := False;
      SQLEditorFrame.HorizontalSplitter.Visible := SQLEditorFrame.OutputPanel.Visible;
    end;
    ViewWordWrapAction.Enabled := ActiveSQLDocumentFound;
    ViewLineNumbersAction.Enabled := ActiveSQLDocumentFound;
    ViewSpecialCharsAction.Enabled := ActiveSQLDocumentFound;
    ViewSelectionModeAction.Enabled := ActiveSQLDocumentFound;
    ViewSelectionModeAction.Checked := ActiveSQLDocumentFound and SQLEditorFrame.SelectionMode;
    { Database Export }
    //DatabaseExportTableDataAction.Enabled :=
    //  (ActiveSQLDocumentFound and SQLEditorFrame.DataQueryOpened) or ActiveSQLDocumentFound or
    //  (Assigned(SchemaBrowserFrame) and SchemaBrowserFrame.DataQueryOpened);
    { SQL Editor }
    ExecuteStatementAction.Enabled := ActiveSQLDocumentFound and (SQLEditorFrame.ActiveSynEdit.Text <> '');
    ExecuteScriptAction.Enabled := ExecuteStatementAction.Enabled;
    ExplainPlanAction.Enabled := ExecuteStatementAction.Enabled;
    { Edit }
   // EditSelectAllAction.Enabled := DatabaseExportTableDataAction.Enabled;

    if ActiveSQLDocumentFound then
    begin
      InfoText := SQLEditorFrame.GetCaretInfo;
      if StatusBar.Panels[0].Text <> InfoText then
        StatusBar.Panels[0].Text := InfoText;
      InfoText := SQLEditorFrame.GetModifiedInfo;
      if StatusBar.Panels[2].Text <> InfoText then
        StatusBar.Panels[2].Text := InfoText;
    end
    else
    begin
      StatusBar.Panels[0].Text := '';
      StatusBar.Panels[2].Text := '';
    end;
  finally

  end;
end;

procedure TMainForm.SetFields;
var
  CaptionText: string;
  SQLEditorFrame: TSQLEditorFrame;
  SchemaBrowserFrame: TSchemaBrowserFrame;
  KeyState: TKeyboardState;
  BrowserSelectionFound: Boolean;
begin
  if FOnProgress then
    Exit;
  try
    SQLEditorFrame := GetActiveSQLEditor;
    SetSQLEditorFields;
    { File }
    SchemaBrowserFrame := GetActiveSchemaBrowser;

    BrowserSelectionFound := Assigned(SchemaBrowserFrame) and SchemaBrowserFrame.SelectionFound;
    EditCopyAction.Enabled := EditCopyAction.Enabled or BrowserSelectionFound;


    { Database }
    DatabaseEndConnectionMenuAction.Enabled := (PageControl.PageCount > 0) and Assigned(PageControl.ActivePage) and (PageControl.ActivePage.ImageIndex = IMAGE_INDEX_SCHEMA_BROWSER);
    DatabaseEditorMenuAction.Enabled := DatabaseEndConnectionMenuAction.Enabled;
    DatabaseRefreshAction.Enabled := DatabaseEndConnectionMenuAction.Enabled;
    DatabaseCloseAllTabAction.Enabled := DatabaseCloseTabAction.Enabled;
    DatabaseCloseAllOtherTabsAction.Enabled := DatabaseCloseTabAction.Enabled;

    DatabaseImportTableDataAction.Enabled := DatabaseEndConnectionMenuAction.Enabled;

    DatabaseCreateConstraintAction.Enabled := Assigned(SchemaBrowserFrame);
    DatabaseCreateDBLinkAction.Enabled := DatabaseCreateConstraintAction.Enabled;
    DatabaseCreateFunctionAction.Enabled := DatabaseCreateConstraintAction.Enabled;
    DatabaseCreateIndexAction.Enabled := DatabaseCreateConstraintAction.Enabled;
    DatabaseCreatePackageAction.Enabled := DatabaseCreateConstraintAction.Enabled;
    DatabaseCreateProcedureAction.Enabled := DatabaseCreateConstraintAction.Enabled;
    DatabaseCreateSequenceAction.Enabled := DatabaseCreateConstraintAction.Enabled;
    DatabaseCreateSynonymAction.Enabled := DatabaseCreateConstraintAction.Enabled;
    DatabaseCreateTableAction.Enabled := DatabaseCreateConstraintAction.Enabled;
    DatabaseCreateTriggerAction.Enabled := DatabaseCreateConstraintAction.Enabled;
    DatabaseCreateUserAction.Enabled := DatabaseCreateConstraintAction.Enabled;
    DatabaseCreateViewAction.Enabled := DatabaseCreateConstraintAction.Enabled;
    { View }
    ViewToolbarAction.Checked := ActionToolBar.Visible;

    ViewNextPageAction.Enabled := PageControl.PageCount > 1; //FileCloseAction.Enabled or DatabaseEndConnectionMenuAction.Enabled;
    ViewPreviousPageAction.Enabled := ViewNextPageAction.Enabled;

    { Database Export }
    DatabaseExportTableDataAction.Enabled :=
      ( Assigned(SQLEditorFrame) and SQLEditorFrame.ActiveDocumentFound and SQLEditorFrame.DataQueryOpened) or
      //SQLEditorFrame.ActiveDocumentFound or
      (Assigned(SchemaBrowserFrame) and SchemaBrowserFrame.DataQueryOpened);

    { Mainform caption }
    if (PageControl.PageCount > 0) and (PageControl.ActivePage.Caption <> '') then
    begin
      CaptionText := Format(MAIN_CAPTION + MAIN_CAPTION_TAB, [PageControl.ActivePage.Caption]);

      if Assigned(SchemaBrowserFrame) then
      begin
        EditCopyAction.Enabled := EditCopyAction.Enabled or DatabaseExportTableDataAction.Enabled;
        if Assigned(SchemaBrowserFrame.ObjectTreeFrame) then
          if Assigned(SchemaBrowserFrame.ObjectTreeFrame.VirtualDrawTree) then
            if SchemaBrowserFrame.ObjectTreeFrame.VirtualDrawTree.SelectedCount > 0 then
              if SchemaBrowserFrame.ObjectTreeFrame.GetSelectedLevel = 1 then
                CaptionText := CaptionText + MAIN_CAPTION_HYPHEN + SchemaBrowserFrame.ObjectTreeFrame.SchemaParam + '.' + SchemaBrowserFrame.ObjectTreeFrame.GetSelectedObjectText;
      end;
      if Assigned(SQLEditorFrame) then
        CaptionText := CaptionText + MAIN_CAPTION_HYPHEN + SQLEditorFrame.ActiveTabSheetCaption;

      CaptionText := CaptionText + MAIN_CAPTION_CLOSE;



      if Assigned(SchemaBrowserFrame) then
        if Assigned(SchemaBrowserFrame.ObjectTreeFrame) then
          if SchemaBrowserFrame.ObjectTreeFrame.Session.Connected then
            CaptionText := CaptionText + MAIN_CAPTION_HYPHEN + MAIN_CAPTION_VERSION + SchemaBrowserFrame.ObjectTreeFrame.Session.OracleVersion;

      if Caption <> CaptionText then
        Caption := CaptionText;
    end
    else
      Caption := MAIN_CAPTION;


    //DatabaseExportTableDataAction.Enabled := DatabaseExportTableDataAction.Enabled or
    //  (Assigned(SchemaBrowserFrame) and SchemaBrowserFrame.DataQueryOpened);
    { Tools }
    ToolsCompareFilesAction.Enabled := Assigned(SQLEditorFrame);
    ToolsCompareSchemasAction.Enabled := (not FConnecting) and (PageControl.PageCount > 0);
    ToolsOptionsAction.Enabled := (not FConnecting) and (PageControl.PageCount > 0) and (Assigned(SchemaBrowserFrame) or
      Assigned(SQLEditorFrame));
    ToolsSelectForCompareAction.Enabled := Assigned(SQLEditorFrame) and (not SQLEditorFrame.ActiveDocumentModified);
    DatabaseObjectSearchAction.Enabled := ToolsOptionsAction.Enabled;

    SchemaDocumentAction.Enabled := (not FConnecting) and Assigned(SchemaBrowserFrame);

    GetKeyboardState(KeyState);
    if KeyState[VK_INSERT] = 0 then
      if StatusBar.Panels[1].Text <> 'Insert' then
        StatusBar.Panels[1].Text := 'Insert';
    if KeyState[VK_INSERT] = 1 then
      if StatusBar.Panels[1].Text <> 'Overwrite' then
        StatusBar.Panels[1].Text := 'Overwrite'
  except
    // silent
  end;
end;

procedure TMainForm.InsertObjectActionExecute(Sender: TObject);
var
  SQLEditorFrame: TSQLEditorFrame;
begin
  SQLEditorFrame := GetActiveSQLEditor;
  if Assigned(SQLEditorFrame) then
    SQLEditorFrame.ShowObjects;
end;

procedure TMainForm.FileCloseActionExecute(Sender: TObject);
var
  SQLEditorFrame: TSQLEditorFrame;
begin
  SQLEditorFrame := GetActiveSQLEditor;
  if Assigned(SQLEditorFrame) then
    SQLEditorFrame.Close;
  Repaint;
end;

procedure TMainForm.FileCloseAllActionExecute(Sender: TObject);
var
  SQLEditorFrame: TSQLEditorFrame;
begin
  SQLEditorFrame := GetActiveSQLEditor;
  if Assigned(SQLEditorFrame) then
    SQLEditorFrame.CloseAll;
  Repaint;
end;

procedure TMainForm.FileCloseAllOtherPagesActionExecute(Sender: TObject);
var
  SQLEditorFrame: TSQLEditorFrame;
begin
  SQLEditorFrame := GetActiveSQLEditor;
  if Assigned(SQLEditorFrame) then
    SQLEditorFrame.CloseAllOtherPages;
  Repaint;
end;

procedure TMainForm.FileExitActionExecute(Sender: TObject);
begin
  Close;
end;

procedure TMainForm.FileNewActionExecute(Sender: TObject);
var
  SQLEditorFrame: TSQLEditorFrame;
begin
  SQLEditorFrame := GetActiveSQLEditor;
  if Assigned(SQLEditorFrame) then
    SQLEditorFrame.New;
end;

procedure TMainForm.FileOpenActionExecute(Sender: TObject);
var
  SQLEditorFrame: TSQLEditorFrame;
begin
  SQLEditorFrame := GetActiveSQLEditor;
  if Assigned(SQLEditorFrame) then
    SQLEditorFrame.Open;
end;

procedure TMainForm.FilePrintActionExecute(Sender: TObject);
var
  SQLEditorFrame: TSQLEditorFrame;
begin
  SQLEditorFrame := GetActiveSQLEditor;
  if Assigned(SQLEditorFrame) then
    SQLEditorFrame.Print;
end;

procedure TMainForm.FilePrintPreviewActionExecute(Sender: TObject);
var
  SQLEditorFrame: TSQLEditorFrame;
begin
  SQLEditorFrame := GetActiveSQLEditor;
  if Assigned(SQLEditorFrame) then
    SQLEditorFrame.PrintPreview;
end;

procedure TMainForm.FileSaveActionExecute(Sender: TObject);
var
  SQLEditorFrame: TSQLEditorFrame;
begin
  SQLEditorFrame := GetActiveSQLEditor;
  if Assigned(SQLEditorFrame) then
    SQLEditorFrame.Save;
end;

procedure TMainForm.FileSaveAllActionExecute(Sender: TObject);
var
  SQLEditorFrame: TSQLEditorFrame;
begin
  SQLEditorFrame := GetActiveSQLEditor;
  if Assigned(SQLEditorFrame) then
    SQLEditorFrame.SaveAll;
end;

procedure TMainForm.FileSaveAsActionExecute(Sender: TObject);
var
  SQLEditorFrame: TSQLEditorFrame;
begin
  SQLEditorFrame := GetActiveSQLEditor;
  if Assigned(SQLEditorFrame) then
    SQLEditorFrame.SaveAs;
  Repaint;
end;

procedure TMainForm.ReadOptions;
begin
  with TBigIniFile.Create(Common.GetINIFilename) do
  try
    { Options }
    OptionsContainer.FontName := ReadString('Options', 'FontName', 'Courier New');
    OptionsContainer.FontSize := ReadInteger('Options', 'FontSize', 10);
    OptionsContainer.RightEdge := ReadInteger('Options', 'RightEdge', 100);
    OptionsContainer.ExtraLineSpacing := ReadInteger('Options', 'ExtraLineSpacing', 0);
    OptionsContainer.TabWidth := ReadInteger('Options', 'TabWidth', 8);
    OptionsContainer.GutterVisible := ReadBool('Options', 'GutterVisible', True);
    OptionsContainer.GutterLineNumbers := ReadBool('Options', 'GutterLineNumbers', True);
    OptionsContainer.MultiLine := ReadBool('Options', 'MultiLine', False);
    OptionsContainer.PollingInterval := ReadInteger('Options', 'PollingInterval', 1);
    OptionsContainer.DateFormat := ReadString('Options', 'DateFormat', 'DD.MM.YYYY');
    OptionsContainer.TimeFormat := ReadString('Options', 'TimeFormat', 'HH24:MI:SS');
    OptionsContainer.SchemaBrowserAlign := ReadString('Options', 'SchemaBrowserAlign', 'Bottom');
    OptionsContainer.ObjectFrameAlign := ReadString('Options', 'ObjectFrameAlign', 'Bottom');

    ActionToolBar.Visible := ReadBool('Options', 'ShowToolBar', True);
    { Size }
    Width := ReadInteger('Size', 'Width', Round(Screen.Width * 0.8));
    Height := ReadInteger('Size', 'Height', Round(Screen.Height * 0.8));
    { Position }
    Left := ReadInteger('Position', 'Left', (Screen.Width - Width) div 2);
    Top := ReadInteger('Position', 'Top', (Screen.Height - Height) div 2);
  finally
    Free;
  end;
end;

procedure TMainForm.ReadIniFile;
var
  i, j: Integer;
  Connections, SQLParameters, SQLFilters, SQLSorts: TStrings;
  ConnectString, SchemaParam {Version,} : string;
begin
  FOnProgress := True;
  Screen.Cursor := crHourglass;
  Connections := TStringList.Create;
  SQLParameters := TStringList.Create;
  SQLFilters := TStringList.Create;
  SQLSorts := TStringList.Create;

  PageControl.Enabled := False;

  with TBigIniFile.Create(Common.GetINIFilename) do
  try
    ReadSectionValues('OpenConnections', Connections);
    j := Connections.Count;
    if j > 0 then
      ProgressDialog(Self).Open(0, 1, False, True);
    for i := 0 to j - 1 do
    begin
      ConnectString := Common.DecryptString(System.Copy(Connections.Strings[i], Pos('=', Connections.Strings[i]) + 1, Length(Connections.Strings[i])));

      SchemaParam := '';
      if Pos('||', ConnectString) <> 0 then
      begin
        SchemaParam := Copy(ConnectString, Pos('||', ConnectString) + 2, Length(ConnectString));
        ConnectString := Copy(ConnectString, 0, Pos('||', ConnectString) - 1);
      end;
      ProgressDialog(Self).InformationText := Format('Opening a saved connection (%d/%d)...', [i+1, j]);
      NewConnection(ConnectString, SchemaParam);
    end;

    ReadSectionValues('SQLParameters', SQLParameters);
    j := SQLParameters.Count;
    for i := 0 to j - 1 do
      ParametersDialog.ValuesList.Strings.Add(SQLParameters.Strings[i]);

    ReadSectionValues('SQLFilters', SQLFilters);
    j := SQLFilters.Count;
    for i := 0 to j - 1 do
      DataFilterDialog.ValuesList.Strings.Add(SQLFilters.Strings[i]);

    ReadSectionValues('SQLSorts', SQLSorts);
    j := SQLSorts.Count;
    for i := 0 to j - 1 do
      DataSortDialog.ValuesList.Strings.Add(SQLSorts.Strings[i]);
  finally
    Connections.Free;
    SQLParameters.Free;
    SQLFilters.Free;
    SQLSorts.Free;
    Free;
    ProgressDialog(Self).Destroy;
    PageControl.Enabled := True;
    Screen.Cursor := crDefault;
    FConnecting := False;
    FOnProgress := False;
  end;
end;

procedure TMainForm.TNSNamesEditorActionExecute(Sender: TObject);
begin
  TNSNamesEditorForm.Open;
end;

procedure TMainForm.ToolsCompareFilesActionExecute(Sender: TObject);
var
  SQLEditorFrame: TSQLEditorFrame;
begin
  SQLEditorFrame := GetActiveSQLEditor;
  if Assigned(SQLEditorFrame) then
    SQLEditorFrame.CompareFiles;
end;

procedure TMainForm.ToolsOptionsActionExecute(Sender: TObject);
var
  i: Integer;
  SQLEditorFrame: TSQLEditorFrame;
  OraSession: TOraSession;
  SchemaBrowserFrame: TSchemaBrowserFrame;
  SQLHistoryFrame: TSQLHistoryFrame;
begin
  OraSession := nil;
  SchemaBrowserFrame := GetActiveSchemaBrowser;
  if Assigned(SchemaBrowserFrame) then
    OraSession := SchemaBrowserFrame.ObjectTreeFrame.Session
  else
  begin
    SQLEditorFrame := GetActiveSQLEditor;
    if Assigned(SQLEditorFrame) then
      OraSession := SQLEditorFrame.Session;
  end;
  if Assigned(OraSession) then
    { open Options }
    if OptionsDialog.Execute(OraSession, OptionsContainer) then
    begin
      for i := 0 to PageControl.PageCount - 1 do
      begin
        if PageControl.Pages[i].ImageIndex = IMAGE_INDEX_SCHEMA_BROWSER then
        begin
          SchemaBrowserFrame := TSchemaBrowserFrame(PageControl.Pages[i].Components[0]);
          if Assigned(SchemaBrowserFrame) then
            SchemaBrowserFrame.AssignOptions;
        end
        else
        if PageControl.Pages[i].ImageIndex = IMAGE_INDEX_SQL_EDITOR then
        begin
          SQLEditorFrame := TSQLEditorFrame(PageControl.Pages[i].Components[0]);
          if Assigned(SQLEditorFrame) then
            SQLEditorFrame.AssignOptions;
        end
        else
        if PageControl.Pages[i].ImageIndex = IMAGE_INDEX_SQL_HISTORY then
        begin
          SQLHistoryFrame := TSQLHistoryFrame(PageControl.Pages[i].Components[0]);
          if Assigned(SQLHistoryFrame) then
            SQLHistoryFrame.AssignOptions;
        end

      end;
    end;
end;

procedure TMainForm.ToolsSelectForCompareActionExecute(Sender: TObject);
var
  SQLEditorFrame: TSQLEditorFrame;
begin
  SQLEditorFrame := GetActiveSQLEditor;
  if Assigned(SQLEditorFrame) then
    SQLEditorFrame.SelectForCompare;
  Repaint;
end;

procedure TMainForm.ViewSelectionModeActionExecute(Sender: TObject);
var
  SQLEditorFrame: TSQLEditorFrame;
begin
  SQLEditorFrame := GetActiveSQLEditor;
  if Assigned(SQLEditorFrame) then
    SQLEditorFrame.ToggleSelectionMode;
end;

procedure TMainForm.ViewLineNumbersActionExecute(Sender: TObject);
var
  SQLEditorFrame: TSQLEditorFrame;
begin
  SQLEditorFrame := GetActiveSQLEditor;
  if Assigned(SQLEditorFrame) then
    ViewLineNumbersAction.Checked := SQLEditorFrame.ToggleLineNumbers;
end;

procedure TMainForm.ViewNextPageActionExecute(Sender: TObject);
var
  SQLEditorFrame: TSQLEditorFrame;
begin
  SQLEditorFrame := GetActiveSQLEditor;
  if Assigned(SQLEditorFrame) then
  begin
    if SQLEditorFrame.ActiveSynEdit.Focused then
    begin
      SQLEditorFrame.NextPage;
      SQLEditorFrame.ActiveSynEdit.SetFocus;
    end
    else
      NextPage;
  end
  else
    NextPage;
end;

procedure TMainForm.ViewPreviousPageActionExecute(Sender: TObject);
var
  SQLEditorFrame: TSQLEditorFrame;
begin
  SQLEditorFrame := GetActiveSQLEditor;
  if Assigned(SQLEditorFrame) then
  begin
    if SQLEditorFrame.ActiveSynEdit.Focused then
    begin
      SQLEditorFrame.PreviousPage;
      SQLEditorFrame.ActiveSynEdit.SetFocus;
    end
    else
      PreviousPage;
  end
  else
    PreviousPage;
end;

procedure TMainForm.NextPage;
var
  i: Integer;
begin
  if Assigned(PageControl) then
  begin
    i := PageControl.ActivePageIndex + 1;
    if i >= PageControl.PageCount then
      i := 0;
    PageControl.ActivePage := PageControl.Pages[i];
  end;
end;

procedure TMainForm.PreviousPage;
var
  i: Integer;
begin
  if Assigned(PageControl) then
  begin
    i := PageControl.ActivePageIndex - 1;
    if i < 0 then
      i := PageControl.PageCount - 1;
    PageControl.ActivePage := PageControl.Pages[i];
  end;
end;

procedure TMainForm.ViewSpecialCharsActionExecute(Sender: TObject);
var
  SQLEditorFrame: TSQLEditorFrame;
begin
  SQLEditorFrame := GetActiveSQLEditor;
  if Assigned(SQLEditorFrame) then
    ViewSpecialCharsAction.Checked := SQLEditorFrame.ToggleSpecialChars;
end;

procedure TMainForm.ViewToolbarActionExecute(Sender: TObject);
begin
  with ActionToolBar do
  Visible := not Visible;
end;

procedure TMainForm.ViewWordWrapActionExecute(Sender: TObject);
var
  SQLEditorFrame: TSQLEditorFrame;
begin
  SQLEditorFrame := GetActiveSQLEditor;
  if Assigned(SQLEditorFrame) then
    ViewWordWrapAction.Checked := SQLEditorFrame.ToggleWordWrap;
end;

procedure TMainForm.WriteIniFile;
var
  i: Integer;
  SchemaBrowserFrame: TSchemaBrowserFrame;
begin
  with TBigIniFile.Create(Common.GetINIFilename) do
  try
    try
      WriteString('OraBone', 'Version', AboutDialog.Version);
      { Options }
      WriteString('Options', 'FontName', OptionsContainer.FontName);
      WriteString('Options', 'FontSize', IntToStr(OptionsContainer.FontSize));
      WriteString('Options', 'RightEdge', IntToStr(OptionsContainer.RightEdge));
      WriteString('Options', 'ExtraLineSpacing', IntToStr(OptionsContainer.ExtraLineSpacing));
      WriteString('Options', 'TabWidth', IntToStr(OptionsContainer.TabWidth));
      WriteBool('Options', 'GutterVisible', OptionsContainer.GutterVisible);
      WriteBool('Options', 'GutterLineNumbers', OptionsContainer.GutterLineNumbers);
      WriteBool('Options', 'MultiLine', OptionsContainer.MultiLine);
      WriteString('Options', 'PollingInterval', IntToStr(OptionsContainer.PollingInterval));
      WriteString('Options', 'DateFormat', OptionsContainer.DateFormat);
      WriteString('Options', 'TimeFormat', OptionsContainer.TimeFormat);
      WriteString('Options', 'SchemaBrowserAlign', OptionsContainer.SchemaBrowserAlign);
      WriteString('Options', 'ObjectFrameAlign', OptionsContainer.ObjectFrameAlign);
      WriteBool('Options', 'ShowToolBar', ActionToolBar.Visible);
      if Assigned(TStyleManager.ActiveStyle) then
        WriteString('Options', 'StyleName', TStyleManager.ActiveStyle.Name);

      if Windowstate = wsNormal then
      begin
        { Position }
        WriteInteger('Position', 'Left', Left);
        WriteInteger('Position', 'Top', Top);
        { Size }
        WriteInteger('Size', 'Width', Width);
        WriteInteger('Size', 'Height', Height);
      end;
      { Open connections }
      EraseSection('OpenConnections');
      for i := 0 to PageControl.PageCount - 1 do
      begin
        if PageControl.Pages[i].ImageIndex = IMAGE_INDEX_SCHEMA_BROWSER then
        begin
          SchemaBrowserFrame := TSchemaBrowserFrame(PageControl.Pages[i].Components[0]);
          if Assigned(SchemaBrowserFrame) then
            WriteString('OpenConnections', IntToStr(i), Common.EncryptString(SchemaBrowserFrame.ObjectTreeFrame.GetConnectString + '||' + SchemaBrowserFrame.ObjectTreeFrame.SchemaParam));
        end;
      end;
      { Parameters }
      EraseSection('SQLParameters');
      for i := 1 to ParametersDialog.ValuesList.RowCount - 1 do
        if ParametersDialog.ValuesList.Keys[i] <> '' then
          WriteString('SQLParameters', ParametersDialog.ValuesList.Keys[i],
            ParametersDialog.ValuesList.Values[ParametersDialog.ValuesList.Keys[i]]);
      { Filters }
      EraseSection('SQLFilters');
      for i := 1 to DataFilterDialog.ValuesList.RowCount - 1 do
        if DataFilterDialog.ValuesList.Keys[i] <> '' then
          WriteString('SQLFilters', DataFilterDialog.ValuesList.Keys[i],
            DataFilterDialog.ValuesList.Values[DataFilterDialog.ValuesList.Keys[i]]);
      { Sorts }
      EraseSection('SQLSorts');
      for i := 1 to DataSortDialog.ValuesList.RowCount - 1 do
        if DataSortDialog.ValuesList.Keys[i] <> '' then
          WriteString('SQLSorts', DataSortDialog.ValuesList.Keys[i],
            DataSortDialog.ValuesList.Values[DataSortDialog.ValuesList.Keys[i]]);
    except
      { silent }
    end;
  finally
    Free
  end;
end;

procedure TMainForm.WMAfterShow(var Msg: TMessage);
begin
  if FOnStartUp then
  begin
    Repaint;
    Application.ProcessMessages;
    ReadIniFile;
    CreateStyleMenu;
    UpdateGuttersAndControls;
    FOnStartUp := False;
    Repaint;
  end;
end;

procedure TMainForm.FormActivate(Sender: TObject);
begin
  Repaint;
end;

procedure TMainForm.FormatSQLActionExecute(Sender: TObject);
var
  SQLEditorFrame: TSQLEditorFrame;
  SynEdit: TBCSynEdit;
begin
  SQLEditorFrame := GetActiveSQLEditor;
  if Assigned(SQLEditorFrame) then
  begin
    SynEdit := SQLEditorFrame.ActiveSynEdit;
    SynEdit.Text := SQLFormatter.FormatSQL(SynEdit.Text);
  end;
end;

procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
var
  i, j: Integer;
  //SchemaBrowserFrame: TSchemaBrowserFrame;
  //SQLEditorFrame: TSQLEditorFrame;
begin
  try
    WriteIniFile;
    ApplicationEvents.Destroy;
  (*  { Disconnect all connections }
    while PageControl.PageCount > 0 do
    begin
      i := PageControl.PageCount - 1;
      PageControl.ActivePageIndex := i;
      if PageControl.Pages[i].ImageIndex = IMAGE_INDEX_SCHEMA_BROWSER then
      begin
        SchemaBrowserFrame := TSchemaBrowserFrame(PageControl.Pages[i].Components[0]);
        if Assigned(SchemaBrowserFrame) then
        begin
          try
            SchemaBrowserFrame.ObjectTreeFrame.Disconnect;
          except
            { no need to show message }
          end;
          SchemaBrowserFrame.Destroy;
        end;
      end
      else
      if PageControl.Pages[i].ImageIndex = IMAGE_INDEX_SQL_EDITOR then
      begin
        SQLEditorFrame := TSQLEditorFrame(PageControl.Pages[i].Components[0]);
        if Assigned(SQLEditorFrame) then
          SQLEditorFrame.CloseAll(True, False);
      end;
      PageControl.Pages[i].Destroy;
      Application.ProcessMessages;
    end;
  except
    { silent }
  end;        *)
    j := PageControl.PageCount - 1;
    for i := j downto 0 do
    begin
      PageControl.ActivePage := PageControl.Pages[i];
      CloseTab(False);
    end;
  except
    { silent }
  end;
  Action := caFree;
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  FOnProgress := False;
  FOnStartUp := True;
  FConnecting := True;
  ActionMainMenuBar.Font.Name := 'Tahoma'; // IDE is losing this for some reason... :/
  ActionMainMenuBar.Font.Size := 8;
  StatusBar.Font.Name := 'Tahoma';
  StatusBar.Font.Size := 8;
  OraCall.OCIUnicode := True;
  ReadOptions;
end;

procedure TMainForm.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  //if (Shift = [ssCtrl]) and (Key = 9) then
  //  NextPage;
end;

procedure TMainForm.FormResize(Sender: TObject);
begin
  ActionMainMenuBar.Width := Width;
  Repaint;
end;

procedure TMainForm.Formshow(Sender: TObject);
begin
  // Post the custom message WM_AFTER_SHOW to our form
  if FOnStartUp then
    PostMessage(Self.Handle, WM_AFTER_SHOW, 0, 0);
  Repaint;
end;

procedure TMainForm.DatabaseCloseAllOtherTabsActionExecute(Sender: TObject);
var
  i, j: Integer;
  ActivePage: TTabSheet;
begin
  ActivePage := PageControl.ActivePage;
  j := PageControl.PageCount - 1;
  for i := j downto 0 do
  begin
    PageControl.ActivePage := PageControl.Pages[i];
    if ActivePage <> PageControl.ActivePage then
      CloseTab(True);
  end;
end;

procedure TMainForm.DatabaseCloseAllTabActionExecute(Sender: TObject);
var
  i, j: Integer;
begin
  j := PageControl.PageCount - 1;
  for i := j downto 0 do
  begin
    PageControl.ActivePage := PageControl.Pages[i];
    CloseTab(True);
  end;
end;

procedure TMainForm.DatabaseCloseTabActionExecute(Sender: TObject);
begin
  CloseTab(True);
end;

procedure TMainForm.CloseTab(Confirm: Boolean);
var
  PageIndex: Integer;
  i, Rslt: Integer;
  SQLEditorFrame: TSQLEditorFrame;
begin
  Rslt := mrNone;
  PageIndex := PageControl.ActivePage.PageIndex;
  if PageControl.ActivePage.ImageIndex = IMAGE_INDEX_SCHEMA_BROWSER then
    Rslt := EndConnection(Confirm)
  else
  if PageControl.ActivePage.ImageIndex = IMAGE_INDEX_SQL_EDITOR then
  begin
    SQLEditorFrame := GetActiveSQLEditor;
    with TBigIniFile.Create(Common.GetINIFilename) do
    try
      WriteBool('Options', 'EnableWordWrap', ViewWordWrapAction.Checked);
      WriteBool('Options', 'EnableLineNumbers', ViewLineNumbersAction.Checked);
      WriteBool('Options', 'EnableSpecialChars', ViewSpecialCharsAction.Checked);
      WriteBool('Options', 'EnableSelectionMode', ViewSelectionModeAction.Checked);
       { Toolbar action visibility }
      EraseSection('ActionToolBar');
      for i := 0 to SQLEditorFrame.ToolbarPopupMenu.Items.Count - 1 do
        WriteBool('ActionToolBar', SQLEditorFrame.ToolbarPopupMenu.Items[i].Caption, SQLEditorFrame.ToolbarPopupMenu.Items[i].Checked);
    finally
      Free;
    end;
    if Assigned(SQLEditorFrame) then
    begin
      Rslt := SQLEditorFrame.CloseAll(True, Confirm);
      if Rslt <> mrCancel then
      begin
        if SQLEditorFrame.InTransaction then
        begin
          if Lib.AskCommit(PageControl.ActivePage.Caption) then
            SQLEditorFrame.Session.Commit
          else
            SQLEditorFrame.Session.Rollback
        end;
        PageControl.ActivePage.Destroy;
      end;
    end;
  end
  else
  if PageControl.ActivePage.ImageIndex = IMAGE_INDEX_SQL_HISTORY then
  begin
    PageControl.ActivePage.Destroy;
    Rslt := mrYes;
  end;
  if Rslt = mrYes then
    if PageIndex > 1 then
      PageControl.ActivePageIndex := PageIndex - 1;
  PageControl.Repaint;
end;

procedure TMainForm.DatabaseCommitActionExecute(Sender: TObject);
var
  SQLEditorFrame: TSQLEditorFrame;
begin
  SQLEditorFrame := GetActiveSQLEditor;
  if Assigned(SQLEditorFrame) then
    if SQLEditorFrame.InTransaction then
    begin
      SQLEditorFrame.InTransaction := False;
      SQLEditorFrame.Session.Commit;
    end;
end;

procedure TMainForm.DatabaseCreateConstraintActionExecute(Sender: TObject);
var
  SchemaBrowserFrame: TSchemaBrowserFrame;
begin
  if PageControl.ActivePage.ImageIndex = IMAGE_INDEX_SCHEMA_BROWSER then
  begin
    SchemaBrowserFrame := TSchemaBrowserFrame(PageControl.ActivePage.Components[0]);
    if Assigned(SchemaBrowserFrame) then
      SchemaBrowserFrame.CreateConstraintAction.Execute;
  end;
end;

procedure TMainForm.DatabaseCreateDBLinkActionExecute(Sender: TObject);
var
  SchemaBrowserFrame: TSchemaBrowserFrame;
begin
  if PageControl.ActivePage.ImageIndex = IMAGE_INDEX_SCHEMA_BROWSER then
  begin
    SchemaBrowserFrame := TSchemaBrowserFrame(PageControl.ActivePage.Components[0]);
    if Assigned(SchemaBrowserFrame) then
      SchemaBrowserFrame.CreateDBLinkAction.Execute;
  end;
end;

procedure TMainForm.DatabaseCreateFunctionActionExecute(Sender: TObject);
var
  SchemaBrowserFrame: TSchemaBrowserFrame;
begin
  if PageControl.ActivePage.ImageIndex = IMAGE_INDEX_SCHEMA_BROWSER then
  begin
    SchemaBrowserFrame := TSchemaBrowserFrame(PageControl.ActivePage.Components[0]);
    if Assigned(SchemaBrowserFrame) then
      SchemaBrowserFrame.CreateFunctionAction.Execute;
  end;
end;

procedure TMainForm.DatabaseCreateIndexActionExecute(Sender: TObject);
var
  SchemaBrowserFrame: TSchemaBrowserFrame;
begin
  if PageControl.ActivePage.ImageIndex = IMAGE_INDEX_SCHEMA_BROWSER then
  begin
    SchemaBrowserFrame := TSchemaBrowserFrame(PageControl.ActivePage.Components[0]);
    if Assigned(SchemaBrowserFrame) then
      SchemaBrowserFrame.CreateIndexAction.Execute;
  end;
end;

procedure TMainForm.DatabaseCreatePackageActionExecute(Sender: TObject);
var
  SchemaBrowserFrame: TSchemaBrowserFrame;
begin
  if PageControl.ActivePage.ImageIndex = IMAGE_INDEX_SCHEMA_BROWSER then
  begin
    SchemaBrowserFrame := TSchemaBrowserFrame(PageControl.ActivePage.Components[0]);
    if Assigned(SchemaBrowserFrame) then
      SchemaBrowserFrame.CreatePackageAction.Execute;
  end;
end;

procedure TMainForm.DatabaseCreateProcedureActionExecute(Sender: TObject);
var
  SchemaBrowserFrame: TSchemaBrowserFrame;
begin
  if PageControl.ActivePage.ImageIndex = IMAGE_INDEX_SCHEMA_BROWSER then
  begin
    SchemaBrowserFrame := TSchemaBrowserFrame(PageControl.ActivePage.Components[0]);
    if Assigned(SchemaBrowserFrame) then
      SchemaBrowserFrame.CreateProcedureAction.Execute;
  end;
end;

procedure TMainForm.DatabaseCreateSequenceActionExecute(Sender: TObject);
var
  SchemaBrowserFrame: TSchemaBrowserFrame;
begin
  if PageControl.ActivePage.ImageIndex = IMAGE_INDEX_SCHEMA_BROWSER then
  begin
    SchemaBrowserFrame := TSchemaBrowserFrame(PageControl.ActivePage.Components[0]);
    if Assigned(SchemaBrowserFrame) then
      SchemaBrowserFrame.CreateSequenceAction.Execute;
  end;
end;

procedure TMainForm.DatabaseCreateSynonymActionExecute(Sender: TObject);
var
  SchemaBrowserFrame: TSchemaBrowserFrame;
begin
  if PageControl.ActivePage.ImageIndex = IMAGE_INDEX_SCHEMA_BROWSER then
  begin
    SchemaBrowserFrame := TSchemaBrowserFrame(PageControl.ActivePage.Components[0]);
    if Assigned(SchemaBrowserFrame) then
      SchemaBrowserFrame.CreateSynonymAction.Execute;
  end;
end;

procedure TMainForm.DatabaseCreateTableActionExecute(Sender: TObject);
var
  SchemaBrowserFrame: TSchemaBrowserFrame;
begin
  if PageControl.ActivePage.ImageIndex = IMAGE_INDEX_SCHEMA_BROWSER then
  begin
    SchemaBrowserFrame := TSchemaBrowserFrame(PageControl.ActivePage.Components[0]);
    if Assigned(SchemaBrowserFrame) then
      SchemaBrowserFrame.CreateTableAction.Execute;
  end;
end;
procedure TMainForm.DatabaseCreateTriggerActionExecute(Sender: TObject);
var
  SchemaBrowserFrame: TSchemaBrowserFrame;
begin
  if PageControl.ActivePage.ImageIndex = IMAGE_INDEX_SCHEMA_BROWSER then
  begin
    SchemaBrowserFrame := TSchemaBrowserFrame(PageControl.ActivePage.Components[0]);
    if Assigned(SchemaBrowserFrame) then
      SchemaBrowserFrame.CreateTriggerAction.Execute;
  end;
end;

procedure TMainForm.DatabaseCreateUserActionExecute(Sender: TObject);
var
  SchemaBrowserFrame: TSchemaBrowserFrame;
begin
  if PageControl.ActivePage.ImageIndex = IMAGE_INDEX_SCHEMA_BROWSER then
  begin
    SchemaBrowserFrame := TSchemaBrowserFrame(PageControl.ActivePage.Components[0]);
    if Assigned(SchemaBrowserFrame) then
      SchemaBrowserFrame.CreateUserAction.Execute;
  end;
end;

procedure TMainForm.DatabaseCreateViewActionExecute(Sender: TObject);
var
  SchemaBrowserFrame: TSchemaBrowserFrame;
begin
  if PageControl.ActivePage.ImageIndex = IMAGE_INDEX_SCHEMA_BROWSER then
  begin
    SchemaBrowserFrame := TSchemaBrowserFrame(PageControl.ActivePage.Components[0]);
    if Assigned(SchemaBrowserFrame) then
      SchemaBrowserFrame.CreateViewAction.Execute;
  end;
end;

procedure TMainForm.LoadSQLIntoEditor(Schema: string; SQLText: WideString);
var
  SQLEditorFrame: TSQLEditorFrame;
  SynEdit: TBCSynEdit;
begin
  SQLEditorFrame := OpenSQLEditor(Schema, False); { open editor }
  //SQLEditorFrame := GetActiveSQLEditor;
  if Assigned(SQLEditorFrame) then
  begin
    SQLEditorFrame.New;

    SynEdit := SQLEditorFrame.ActiveSynEdit;
    SynEdit.Lines.BeginUpdate;
    SynEdit.Lines.Text := SQLText;
    SynEdit.Lines.EndUpdate;
    SQLEditorFrame.SynEditChange(nil);

    PageControlChange(nil);
  end;
end;

procedure TMainForm.DatabaseEditorMenuActionExecute(Sender: TObject);
var
  i: Integer;
  ActionToolBarStrings: TStrings;
  SQLEditorFrame: TSQLEditorFrame;
begin
  with TBigIniFile.Create(Common.GetINIFilename) do
  try
    SQLEditorFrame := OpenSQLEditor(PageControl.ActivePage.Caption, True);
    SetFields;
    PageControlChange(Sender);
    ViewWordWrapAction.Checked := ReadBool('Options', 'EnableWordWrap', False);
    if ViewWordWrapAction.Checked then
      ViewWordWrapAction.Execute;
    ViewLineNumbersAction.Checked := ReadBool('Options', 'EnableLineNumbers', True);
    if not ViewLineNumbersAction.Checked then
      ViewLineNumbersAction.Execute;
    ViewSpecialCharsAction.Checked := ReadBool('Options', 'EnableSpecialChars', False);
    if ViewSpecialCharsAction.Checked then
      ViewSpecialCharsAction.Execute;
    ViewSelectionModeAction.Checked := ReadBool('Options', 'EnableSelectionMode', False);
    if ViewSelectionModeAction.Checked then
      ViewSelectionModeAction.Execute;
    ActionToolBarStrings := TStringList.Create;
    { Toolbar action visibility }
    ReadSectionValues('ActionToolBar', ActionToolBarStrings);
    for i := 0 to ActionToolBarStrings.Count - 1 do
      if not StrToBool(System.Copy(ActionToolBarStrings.Strings[i],
        Pos('=', ActionToolBarStrings.Strings[i]) + 1, Length(ActionToolBarStrings.Strings[i]))) then
           SQLEditorFrame.ToolbarPopupMenu.Items[i].Action.Execute;
  finally
    Free;
  end;
end;

procedure TMainForm.DatabaseObjectSearchActionExecute(Sender: TObject);
var
  SQLEditorFrame: TSQLEditorFrame;
  OraSession: TOraSession;
  SchemaBrowserFrame: TSchemaBrowserFrame;
begin
  OraSession := nil;
  SchemaBrowserFrame := GetActiveSchemaBrowser;
  if Assigned(SchemaBrowserFrame) then
    OraSession := SchemaBrowserFrame.ObjectTreeFrame.Session
  else
  begin
    SQLEditorFrame := GetActiveSQLEditor;
    if Assigned(SQLEditorFrame) then
      OraSession := SQLEditorFrame.Session;
  end;
  if Assigned(OraSession) then
    ObjectSearhForm.Open(OraSession);
end;

function TMainForm.OpenSQLEditor(Schema: string; AddNewDocument: Boolean): TSQLEditorFrame;
var
  i: Integer;
  FormattedSchema: string;
  TabSheet: TTabSheet;
  SchemaBrowserFrame: TSchemaBrowserFrame;
begin
  FormattedSchema := Lib.FormatSchema(Schema);
  { check if sql editor tab already exists }
  for i := 0 to PageControl.PageCount - 1 do
    if (PageControl.Pages[i].ImageIndex = IMAGE_INDEX_SQL_EDITOR) and
       (PageControl.Pages[i].Caption = FormattedSchema) then
    begin
      PageControl.ActivePage := PageControl.Pages[i];
      Result := TSQLEditorFrame(PageControl.ActivePage.Components[0]);
      Exit;
    end;

  SchemaBrowserFrame := nil;
  { check if connection exists }
  for i := 0 to PageControl.PageCount - 1 do
    if (PageControl.Pages[i].ImageIndex = IMAGE_INDEX_SCHEMA_BROWSER) and
       (PageControl.Pages[i].Caption = FormattedSchema) then
      SchemaBrowserFrame := TSchemaBrowserFrame(PageControl.Pages[i].Components[0]);

  if not Assigned(SchemaBrowserFrame) then
  begin
    Common.ShowMessage(Format('Connection for the schema ''%s'' not found.', [Schema]));
    Result := nil;
    Exit;
  end
  else
  begin
    { Create new tab }
    TabSheet := TTabSheet.Create(PageControl);
    //TabSheet.TabVisible := False;
    TabSheet.PageControl := PageControl;
    TabSheet.ImageIndex := IMAGE_INDEX_SQL_EDITOR;
    TabSheet.Caption := FormattedSchema;
    Result := TSQLEditorFrame.Create(TabSheet);
    Result.Parent := TabSheet;
    Result.PopupMenu := DocumentPopupMenu;

    Result.HighlighterTableNames := Lib.SessionObjectNames(SchemaBrowserFrame.ObjectTreeFrame.Session,
      SchemaBrowserFrame.ObjectTreeFrame.SchemaParam);
    Result.ObjectNames := Lib.SessionObjectNames(SchemaBrowserFrame.ObjectTreeFrame.Session,
      SchemaBrowserFrame.ObjectTreeFrame.SchemaParam, True);
    Result.Session := SchemaBrowserFrame.ObjectTreeFrame.Session;
    Result.SchemaParam := SchemaBrowserFrame.ObjectTreeFrame.SchemaParam;
    Result.UpdateGuttersAndControls(PageControl.DoubleBuffered);
    PageControl.ActivePage := TabSheet;
    if AddNewDocument then
      Result.New;
  end;
end;

procedure TMainForm.DatabaseEndConnectionMenuActionExecute(Sender: TObject);
begin
  EndConnection(True);
end;

function TMainForm.EndConnection(Confirm: Boolean): Integer;
var
  i: Integer;
  s: string;
  SchemaBrowserFrame: TSchemaBrowserFrame;
begin
  Result := mrNo;
  try
    if PageControl.ActivePage.ImageIndex = IMAGE_INDEX_SCHEMA_BROWSER then
      if not Confirm or Common.AskYesOrNo(Format('End connection %s, are you sure?', [PageControl.ActivePage.Caption])) then
      begin
        Result := mrYes;
        s := PageControl.ActivePage.Caption;
        SchemaBrowserFrame := GetActiveSchemaBrowser;
        if Assigned(SchemaBrowserFrame) then
        begin
          if SchemaBrowserFrame.ObjectTreeFrame.Session.InTransaction then
          begin
            if Lib.AskCommit(s) then
              SchemaBrowserFrame.ObjectTreeFrame.Session.Commit
            else
              SchemaBrowserFrame.ObjectTreeFrame.Session.Rollback
          end;
          SchemaBrowserFrame.ObjectTreeFrame.Disconnect;
          PageControl.ActivePage.Destroy;
          { destroy editor }
          i := 0;
          while i < PageControl.PageCount do
          begin
            if PageControl.Pages[i].Caption = s then
              PageControl.Pages[i].Destroy;
            Inc(i);
          end;
        end;
      end;
  except

  end;
  PageControl.Repaint;
end;

procedure TMainForm.DatabaseExportTableDataActionExecute(Sender: TObject);
var
  SchemaBrowserFrame: TSchemaBrowserFrame;
  SQLEditorFrame: TSQLEditorFrame;
begin
  SchemaBrowserFrame := GetActiveSchemaBrowser;

  if Assigned(SchemaBrowserFrame) then
  begin
    { table tai view }
    if SchemaBrowserFrame.TableBrowserFrame.Visible then
      ExportTableDataDialog.Open(SchemaBrowserFrame.TableBrowserFrame.DataDBGrid)
    else
      ExportTableDataDialog.Open(SchemaBrowserFrame.ViewBrowserFrame.DataDBGrid)
  end
  else
  begin
    { sql data }
    SQLEditorFrame := GetActiveSQLEditor;
    if Assigned(SQLEditorFrame) then
      if Assigned(SQLEditorFrame.OutputFrame) then
        ExportTableDataDialog.Open(SQLEditorFrame.OutputFrame.GetActiveGrid);
  end;
end;

procedure TMainForm.DatabaseImportTableDataActionExecute(Sender: TObject);
var
  SchemaBrowserFrame: TSchemaBrowserFrame;
begin
  SchemaBrowserFrame := GetActiveSchemaBrowser;
  if Assigned(SchemaBrowserFrame) then
    ImportTableDataDialog.Open(SchemaBrowserFrame.ObjectTreeFrame.Session);
end;

procedure TMainForm.DatabaseNewConnectionMenuActionExecute(Sender: TObject);
begin
  NewConnection;
  UpdateGuttersAndControls;
  PageControl.Repaint;
end;

procedure TMainForm.DatabaseRefreshActionExecute(Sender: TObject);
var
  SchemaBrowserFrame: TSchemaBrowserFrame;
begin
  SchemaBrowserFrame := GetActiveSchemaBrowser;
  if Assigned(SchemaBrowserFrame) then
    SchemaBrowserFrame.ObjectTreeFrame.Refresh;
end;

procedure TMainForm.DatabaseRollbackActionExecute(Sender: TObject);
var
  SQLEditorFrame: TSQLEditorFrame;
begin
  SQLEditorFrame := GetActiveSQLEditor;
  if Assigned(SQLEditorFrame) then
    if SQLEditorFrame.InTransaction then
    begin
      SQLEditorFrame.InTransaction := False;
      SQLEditorFrame.Session.Rollback;
    end;
end;

procedure TMainForm.DBMSOutputActionExecute(Sender: TObject);
begin
  DBMSOutputAction.Checked := not DBMSOutputAction.Checked;
  if DBMSOutputAction.Checked then
    DBMSOutputAction.ImageIndex := IMAGE_INDEX_DBMS_OUTPUT_DOWN
  else
    DBMSOutputAction.ImageIndex := IMAGE_INDEX_DBMS_OUTPUT_UP
end;

procedure TMainForm.DragDropDrop(Sender: TObject; Pos: TPoint; Value: TStrings);
var
  SQLEditorFrame: TSQLEditorFrame;
  i: Integer;
begin
  SQLEditorFrame := GetActiveSQLEditor;
  if Assigned(SQLEditorFrame) then
  begin
    if SQLEditorFrame.IsCompareFilesActivePage then
      for i := 0 to Value.Count - 1 do
        SQLEditorFrame.CompareFiles(Value.Strings[i])
    else
    for i := 0 to Value.Count - 1 do
      SQLEditorFrame.Open(Value.Strings[i]);
  end;
end;

procedure TMainForm.EditCopyActionExecute(Sender: TObject);
var
  SQLEditorFrame: TSQLEditorFrame;
  SchemaBrowserFrame: TSchemaBrowserFrame;
begin
  SchemaBrowserFrame := GetActiveSchemaBrowser;

  if Assigned(SchemaBrowserFrame) then
  begin
    { table tai view }
    if SchemaBrowserFrame.TableBrowserFrame.Visible then
      SchemaBrowserFrame.TableBrowserFrame.CopyToClipboard
    else
    if SchemaBrowserFrame.ViewBrowserFrame.Visible then
      SchemaBrowserFrame.ViewBrowserFrame.CopyToClipboard
    else
    if SchemaBrowserFrame.FuncProcBrowserFrame.Visible then
      SchemaBrowserFrame.FuncProcBrowserFrame.CopyToClipboard
    else
    if SchemaBrowserFrame.PackageBrowserFrame.Visible then
      SchemaBrowserFrame.PackageBrowserFrame.CopyToClipboard
    else
    if SchemaBrowserFrame.TriggerBrowserFrame.Visible then
      SchemaBrowserFrame.TriggerBrowserFrame.CopyToClipboard
    else
    if SchemaBrowserFrame.SequenceBrowserFrame.Visible then
      SchemaBrowserFrame.SequenceBrowserFrame.CopyToClipboard
    else
    if SchemaBrowserFrame.DBLinkBrowserFrame.Visible then
      SchemaBrowserFrame.DBLinkBrowserFrame.CopyToClipboard
    else
    if SchemaBrowserFrame.UserBrowserFrame.Visible then
      SchemaBrowserFrame.UserBrowserFrame.CopyToClipboard
  end
  else
  begin
    { sql data }
    SQLEditorFrame := GetActiveSQLEditor;
    {if Assigned(SQLEditorFrame) then
    begin
      Grid := nil;
      if Assigned(SQLEditorFrame.OutputFrame) then
        Grid := SQLEditorFrame.OutputFrame.GetActiveGrid;
      if Assigned(Grid) and Grid.Focused then
        SQLEditorFrame.OutputFrame.CopyToClipboard
      else
        SQLEditorFrame.Copy
    end;              }
    if Assigned(SQLEditorFrame) then
      SQLEditorFrame.CopyToClipboard;
  end;
end;

procedure TMainForm.EditCutActionExecute(Sender: TObject);
var
  SQLEditorFrame: TSQLEditorFrame;
begin
  SQLEditorFrame := GetActiveSQLEditor;
  if Assigned(SQLEditorFrame) then
    SQLEditorFrame.Cut;
end;

procedure TMainForm.EditDecreaseIndentActionExecute(Sender: TObject);
var
  SQLEditorFrame: TSQLEditorFrame;
begin
  SQLEditorFrame := GetActiveSQLEditor;
  if Assigned(SQLEditorFrame) then
    SQLEditorFrame.DecreaseIndent;
end;


procedure TMainForm.EditDeleteEOLActionExecute(Sender: TObject);
var
  SQLEditorFrame: TSQLEditorFrame;
begin
  SQLEditorFrame := GetActiveSQLEditor;
  if Assigned(SQLEditorFrame) then
    SQLEditorFrame.DeleteEOL;
end;

procedure TMainForm.EditDeleteLineActionExecute(Sender: TObject);
var
  SQLEditorFrame: TSQLEditorFrame;
begin
  SQLEditorFrame := GetActiveSQLEditor;
  if Assigned(SQLEditorFrame) then
    SQLEditorFrame.DeleteLine;
end;

procedure TMainForm.EditDeleteWordActionExecute(Sender: TObject);
var
  SQLEditorFrame: TSQLEditorFrame;
begin
  SQLEditorFrame := GetActiveSQLEditor;
  if Assigned(SQLEditorFrame) then
    SQLEditorFrame.DeleteWord;
end;

procedure TMainForm.EditIncreaseIndentActionExecute(Sender: TObject);
var
  SQLEditorFrame: TSQLEditorFrame;
begin
  SQLEditorFrame := GetActiveSQLEditor;
  if Assigned(SQLEditorFrame) then
    SQLEditorFrame.IncreaseIndent;
end;

procedure TMainForm.EditInsertLineActionExecute(Sender: TObject);
var
  SQLEditorFrame: TSQLEditorFrame;
begin
  SQLEditorFrame := GetActiveSQLEditor;
  if Assigned(SQLEditorFrame) then
    SQLEditorFrame.InsertLine;
end;

procedure TMainForm.EditPasteActionExecute(Sender: TObject);
var
  SQLEditorFrame: TSQLEditorFrame;
begin
  SQLEditorFrame := GetActiveSQLEditor;
  if Assigned(SQLEditorFrame) then
    SQLEditorFrame.Paste;
end;

procedure TMainForm.EditRedoActionExecute(Sender: TObject);
var
  SQLEditorFrame: TSQLEditorFrame;
begin
  SQLEditorFrame := GetActiveSQLEditor;
  if Assigned(SQLEditorFrame) then
    SQLEditorFrame.Redo;
end;

procedure TMainForm.EditSelectAllActionExecute(Sender: TObject);
var
  SchemaBrowserFrame: TSchemaBrowserFrame;
  SQLEditorFrame: TSQLEditorFrame;
  SQLHistoryFrame: TSQLHistoryFrame;
  Grid: TBCDBGrid;
begin
  SchemaBrowserFrame := GetActiveSchemaBrowser;
  SQLEditorFrame := GetActiveSQLEditor;

  if Assigned(SchemaBrowserFrame) then
  begin
    { table }
    if SchemaBrowserFrame.TableBrowserFrame.Visible then
    begin
      if SchemaBrowserFrame.TableBrowserFrame.TablePageControl.ActivePage.Caption = 'Source' then
        SchemaBrowserFrame.TableBrowserFrame.SourceSynEdit.SelectAll
      else
      if SchemaBrowserFrame.TableBrowserFrame.TablePageControl.ActivePage.Caption = 'Data' then
      begin
        SchemaBrowserFrame.TableBrowserFrame.DataDBGrid.SelectedRows.SelectAll; //Selection.SelectAll;
        SchemaBrowserFrame.TableBrowserFrame.DataQueryAfterScroll(SchemaBrowserFrame.TableBrowserFrame.DataDBGrid.DataSource.DataSet);
      end;
    end
    else
    { view }
    if SchemaBrowserFrame.ViewBrowserFrame.Visible then
    begin
      if SchemaBrowserFrame.ViewBrowserFrame.ViewPageControl.ActivePage.Caption = 'Source' then
        SchemaBrowserFrame.ViewBrowserFrame.SourceSynEdit.SelectAll
      else
      if SchemaBrowserFrame.ViewBrowserFrame.ViewPageControl.ActivePage.Caption = 'Data' then
      begin
        SchemaBrowserFrame.ViewBrowserFrame.DataDBGrid.SelectedRows.SelectAll; //Selection.SelectAll;
        SchemaBrowserFrame.ViewBrowserFrame.DataQueryAfterScroll(SchemaBrowserFrame.ViewBrowserFrame.DataDBGrid.DataSource.DataSet);
      end;
    end
    else
    { function & procedure }
    if SchemaBrowserFrame.FuncProcBrowserFrame.Visible then
    begin
      if SchemaBrowserFrame.FuncProcBrowserFrame.FuncProcPageControl.ActivePage.Caption = 'Source' then
        SchemaBrowserFrame.FuncProcBrowserFrame.SourceSynEdit.SelectAll
    end
    else
    { package }
    if SchemaBrowserFrame.PackageBrowserFrame.Visible then
    begin
      if SchemaBrowserFrame.PackageBrowserFrame.PackagePageControl.ActivePage.Caption = 'Specification' then
        SchemaBrowserFrame.PackageBrowserFrame.SpecSynEdit.SelectAll;
      if SchemaBrowserFrame.PackageBrowserFrame.PackagePageControl.ActivePage.Caption = 'Body' then
        SchemaBrowserFrame.PackageBrowserFrame.BodySynEdit.SelectAll
    end
    else
    { trigger }
    if SchemaBrowserFrame.TriggerBrowserFrame.Visible then
    begin
      if SchemaBrowserFrame.TriggerBrowserFrame.TriggerPageControl.ActivePage.Caption = 'Source' then
        SchemaBrowserFrame.TriggerBrowserFrame.SourceSynEdit.SelectAll
    end
    else
    { sequence }
    if SchemaBrowserFrame.SequenceBrowserFrame.Visible then
    begin
      if SchemaBrowserFrame.SequenceBrowserFrame.SequencePageControl.ActivePage.Caption = 'Source' then
        SchemaBrowserFrame.SequenceBrowserFrame.SourceSynEdit.SelectAll
    end
    else
    { db link }
    if SchemaBrowserFrame.DBLinkBrowserFrame.Visible then
    begin
      if SchemaBrowserFrame.DBLinkBrowserFrame.DBLinkPageControl.ActivePage.Caption = 'Source' then
        SchemaBrowserFrame.DBLinkBrowserFrame.SourceSynEdit.SelectAll
    end
    else
    { user }
    if SchemaBrowserFrame.UserBrowserFrame.Visible then
    begin
      if SchemaBrowserFrame.UserBrowserFrame.UserPageControl.ActivePage.Caption = 'Source' then
        SchemaBrowserFrame.UserBrowserFrame.SourceSynEdit.SelectAll
    end
  end
  else
  { sql data }
  if Assigned(SQLEditorFrame) then
  begin
    Grid := nil;
    if Assigned(SQLEditorFrame.OutputFrame) then
      Grid := SQLEditorFrame.OutputFrame.GetActiveGrid;
    if Assigned(Grid) and Grid.Focused then
      Grid.SelectedRows.SelectAll //Selection.SelectAll
    else
      SQLEditorFrame.ActiveSynEdit.SelectAll
  end
  else
  begin
    SQLHistoryFrame := GetActiveSQLHistory;
    if Assigned(SQLHistoryFrame) then
      SQLHistoryFrame.SelectAll;
  end;
end;

procedure TMainForm.EditSortAscActionExecute(Sender: TObject);
var
  SQLEditorFrame: TSQLEditorFrame;
begin
  SQLEditorFrame := GetActiveSQLEditor;
  if Assigned(SQLEditorFrame) then
    SQLEditorFrame.SortAsc;
end;


procedure TMainForm.EditSortDescActionExecute(Sender: TObject);
var
  SQLEditorFrame: TSQLEditorFrame;
begin
  SQLEditorFrame := GetActiveSQLEditor;
  if Assigned(SQLEditorFrame) then
    SQLEditorFrame.SortDesc;
end;


procedure TMainForm.EditToggleCaseActionExecute(Sender: TObject);
var
  SQLEditorFrame: TSQLEditorFrame;
begin
  SQLEditorFrame := GetActiveSQLEditor;
  if Assigned(SQLEditorFrame) then
    SQLEditorFrame.ToggleCase;
end;


procedure TMainForm.EditUndoActionExecute(Sender: TObject);
var
  SQLEditorFrame: TSQLEditorFrame;
begin
  SQLEditorFrame := GetActiveSQLEditor;
  if Assigned(SQLEditorFrame) then
    SQLEditorFrame.Undo;
end;

procedure TMainForm.ExecuteScriptActionExecute(Sender: TObject);
var
  SQLEditorFrame: TSQLEditorFrame;
begin
  SQLEditorFrame := GetActiveSQLEditor;
  if Assigned(SQLEditorFrame) then
    SQLEditorFrame.ExecuteScript;
end;

procedure TMainForm.ExecuteStatementActionExecute(Sender: TObject);
var
  SQLEditorFrame: TSQLEditorFrame;
begin
  SQLEditorFrame := GetActiveSQLEditor;
  if Assigned(SQLEditorFrame) then
    SQLEditorFrame.ExecuteStatement;
end;

procedure TMainForm.ExplainPlanActionExecute(Sender: TObject);
var
  SQLEditorFrame: TSQLEditorFrame;
begin
  SQLEditorFrame := GetActiveSQLEditor;
  if Assigned(SQLEditorFrame) then
    SQLEditorFrame.ExplainPlan;
end;

procedure TMainForm.NewConnection(ConnectString: string; SchemaParam: string);
var
  i, ActivePageIndex: Integer;
  Found: Integer;
  Schema: string;
  TabSheet: TTabSheet;
  SchemaBrowserFrame: TSchemaBrowserFrame;
begin
  FConnecting := True;
  Application.ProcessMessages;
  ActivePageIndex := PageControl.ActivePageIndex;
  { Create new tab }
  TabSheet := TTabSheet.Create(PageControl);
  TabSheet.TabVisible := False;
  TabSheet.PageControl := PageControl;
  TabSheet.ImageIndex := IMAGE_INDEX_SCHEMA_BROWSER;
  { Create new SchemaBrowser }
  SchemaBrowserFrame := TSchemaBrowserFrame.Create(TabSheet);
  SchemaBrowserFrame.Parent := TabSheet;
  try
    Screen.Cursor := crHourglass;
    if SchemaBrowserFrame.ObjectTreeFrame.Connect(ConnectString) then
    begin
      Schema := SchemaBrowserFrame.ObjectTreeFrame.GetSchemaName;
      if SchemaParam = '' then
        SchemaParam := Copy(Schema, 0, Pos('@', Schema) - 1);
      SchemaBrowserFrame.ObjectTreeFrame.SchemaParam := SchemaParam;
      SchemaBrowserFrame.CreateFrames;

      Found := 0;
      for i := 0 to PageControl.PageCount - 1 do
        if (PageControl.Pages[i].ImageIndex = IMAGE_INDEX_SCHEMA_BROWSER) and
           (Schema = PageControl.Pages[i].Caption) then
          Inc(Found);

      TabSheet.Caption := Schema;
      { check if connection exists }
      if Found > 0 then
        TabSheet.Caption := TabSheet.Caption + ' (' + IntToStr(Found + 1) + ')';
      TabSheet.TabVisible := True;
      PageControl.ActivePage := TabSheet;
      PageControl.ActivePage.Repaint;
      PageControl.Repaint;
    end
    else
    begin
      SchemaBrowserFrame.Free;
      TabSheet.Free;
      PageControl.ActivePageIndex := ActivePageIndex;
      if Assigned(PageControl.ActivePage) then
        PageControl.ActivePage.Repaint;
      PageControl.Repaint;
    end;
  except
    { silent }
    on E: Exception do
      Common.ShowErrorMessage(E.Message);
  end;
  Screen.Cursor := crDefault;
  FConnecting := False;
  Application.ProcessMessages;
end;

procedure TMainForm.PageControlChange(Sender: TObject);
var
  i: Integer;
  ActiveSQLDocumentFound: Boolean;
  SQLEditorFrame: TSQLEditorFrame;
  SchemaBrowserFrame: TSchemaBrowserFrame;
begin
  SQLEditorFrame := GetActiveSQLEditor;
  ActiveSQLDocumentFound := Assigned(SQLEditorFrame) and SQLEditorFrame.ActiveDocumentFound;
  if ActiveSQLDocumentFound then
  begin
    ViewWordWrapAction.Checked := SQLEditorFrame.WordWrap;
    ViewLineNumbersAction.Checked := SQLEditorFrame.LineNumbers;
    ViewSpecialCharsAction.Checked := SQLEditorFrame.SpecialChars;
    ViewSelectionModeAction.Checked := SQLEditorFrame.SelectionMode;
  end;
  if PageControl.PageCount > 0 then
  for i := 0 to PageControl.PageCount - 1 do
    if PageControl.Pages[i].ImageIndex = IMAGE_INDEX_SCHEMA_BROWSER then
      if PageControl.Pages[i].Components[0] is TSchemaBrowserFrame then
      begin
        if ActiveSQLDocumentFound then
          TSchemaBrowserFrame(PageControl.Pages[i].Components[0]).SetShortCuts(True)
        else
          TSchemaBrowserFrame(PageControl.Pages[i].Components[0]).SetShortCuts(PageControl.ActivePageIndex <> i)
      end;
  { This fixes the session drop when using multiple sessions with different homes }
  SchemaBrowserFrame := GetActiveSchemaBrowser;
  if Assigned(SchemaBrowserFrame) then
  begin
    if not SchemaBrowserFrame.ObjectTreeFrame.Session.Connected then
    begin
      SchemaBrowserFrame.ObjectTreeFrame.Session.ConnectPrompt := False;
      SchemaBrowserFrame.ObjectTreeFrame.Session.Connect;
      SchemaBrowserFrame.ObjectTreeFrame.Session.ConnectPrompt := True;
      SchemaBrowserFrame.SetFrames(False);
    end;
  end;
  if Assigned(SQLEditorFrame) then
    SQLEditorFrame.RepaintToolButtons;

  if Assigned(PageControl.ActivePage) then
    PageControl.ActivePage.Repaint;
  PageControl.Repaint;
end;

procedure TMainForm.OpenSQLHistory;
var
  i: Integer;
  TabSheet: TTabSheet;
  SQLHistoryFrame: TSQLHistoryFrame;
begin
  { check if sql editor tab already exists }
  for i := 0 to PageControl.PageCount - 1 do
    if PageControl.Pages[i].ImageIndex = IMAGE_INDEX_SQL_HISTORY then
    begin
      PageControl.ActivePage := PageControl.Pages[i];
      Exit;
    end;
  { Create new tab }
  TabSheet := TTabSheet.Create(PageControl);
  //TabSheet.TabVisible := False;
  TabSheet.PageControl := PageControl;
  TabSheet.ImageIndex := IMAGE_INDEX_SQL_HISTORY;
  TabSheet.Caption := 'SQL History';
  SQLHistoryFrame := TSQLHistoryFrame.Create(TabSheet);
  SQLHistoryFrame.Parent := TabSheet;
  SQLHistoryFrame.DoInit;
  { style repaint fix }
  PageControl.ActivePage := TabSheet;
  PageControl.ActivePage.Repaint;
  PageControl.Repaint;
  SQLHistoryFrame.ToolBar.Repaint;
  SQLHistoryFrame.ToolBar2.Repaint;
  SQLHistoryFrame.ToolBar3.Repaint;
end;

procedure TMainForm.SQLHistoryActionExecute(Sender: TObject);
begin
  OpenSQLHistory;
end;

end.
