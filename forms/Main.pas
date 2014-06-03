unit Main;

interface

uses
  Winapi.Windows, System.SysUtils, System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ActnList,
  PlatformDefaultStyleActnCtrls, ActnMan, ActnCtrls, ToolWin, SQLHistory, VirtualTrees, ActnMenus, ComCtrls,
  JvExComCtrls, JvComCtrls, Vcl.ExtCtrls, StdActns, Vcl.ImgList, Types, BCControls.PageControl, AppEvnts, Menus,
  SQLEditor, SchemaBrowser, ActnPopup, BCControls.ImageList, Vcl.Themes, JvComponentBase,
  JvDragDrop, System.Actions, BCControls.ProgressBar, BCCommon.Images, System.Win.TaskbarCore, Vcl.Taskbar;

const
  { Main menu item indexes }
  FILE_MENU_ITEMINDEX = 0;
  FILE_REOPEN_MENU_ITEMINDEX = 2;
  VIEW_MENU_ITEMINDEX = 3;
  VIEW_STYLE_MENU_ITEMINDEX = 12;

type
  TMainForm = class(TForm)
    ActionMainMenuBar: TActionMainMenuBar;
    ActionManager: TActionManager;
    ActionToolBar: TActionToolBar;
    ApplicationEvents: TApplicationEvents;
    SearchClearBookmarksAction: TAction;
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
    DocumentPopupActionBar: TPopupActionBar;
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
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    N1: TMenuItem;
    PageControl: TBCPageControl;
    PageControlPopupActionBar: TPopupActionBar;
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
    SearchGotoLineAction: TAction;
    GotoBookmarks1Action: TAction;
    GotoBookmarks2Action: TAction;
    GotoBookmarks3Action: TAction;
    GotoBookmarks4Action: TAction;
    GotoBookmarks5Action: TAction;
    GotoBookmarks6Action: TAction;
    GotoBookmarks7Action: TAction;
    GotoBookmarks8Action: TAction;
    GotoBookmarks9Action: TAction;
    ToggleBookmarks1Action: TAction;
    ToggleBookmarks2Action: TAction;
    ToggleBookmarks3Action: TAction;
    ToggleBookmarks4Action: TAction;
    ToggleBookmarks5Action: TAction;
    ToggleBookmarks6Action: TAction;
    ToggleBookmarks7Action: TAction;
    ToggleBookmarks8Action: TAction;
    ToggleBookmarks9Action: TAction;
    FileReopenClearAction: TAction;
    SelectReopenFileAction: TAction;
    FileReopenAction: TAction;
    StatusBarAction: TAction;
    ExecuteCurrentStatementAction: TAction;
    SearchToggleBookmarksAction: TAction;
    SearchGotoBookmarksAction: TAction;
    EditInsertAction: TAction;
    EditDeleteAction: TAction;
    EditIndentAction: TAction;
    EditSortAction: TAction;
    DatabaseCreateAction: TAction;
    DatabaseExportAction: TAction;
    DatabaseImportAction: TAction;
    ViewStyleAction: TAction;
    ViewMiniMapAction: TAction;
    Taskbar: TTaskbar;
    procedure ApplicationEventsActivate(Sender: TObject);
    procedure ApplicationEventsHint(Sender: TObject);
    procedure ApplicationEventsMessage(var Msg: tagMSG; var Handled: Boolean);
    procedure SearchClearBookmarksActionExecute(Sender: TObject);
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
    procedure GotoBookmarks0ActionExecute(Sender: TObject);
    procedure ToggleBookmarks0ActionExecute(Sender: TObject);
    procedure PageControlCloseButtonClick(Sender: TObject);
    procedure SearchGotoLineActionExecute(Sender: TObject);
    procedure FileReopenClearActionExecute(Sender: TObject);
    procedure SelectReopenFileActionExecute(Sender: TObject);
    procedure DummyActionExecute(Sender: TObject);
    procedure StatusBarActionExecute(Sender: TObject);
    procedure ExecuteCurrentStatementActionExecute(Sender: TObject);
    procedure PageControlDblClick(Sender: TObject);
    procedure PageControlMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure ViewMiniMapActionExecute(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure TaskBarStepChange(Sender: TObject);
    procedure TaskBarShow(Sender: TObject);
    procedure TaskBarHide(Sender: TObject);
    procedure ActionToolBarGetControlClass(Sender: TCustomActionBar; AnItem: TActionClient;
      var ControlClass: TCustomActionControlClass);
  private
    { Private declarations }
    FNoIni: Boolean;
    FConnecting: Boolean;
    FOnProgress: Boolean;
    FOnStartUp: Boolean;
    FProcessingEventHandler: Boolean;
    FImageListCount: Integer;
    FEncoding: TEncoding;
    FProgressBar: TBCProgressBar;
    FSQLFormatterDLLFound: Boolean;
    FSaveMenuFont: TFont; { will hold initial main menu bar's font settings }
    FSaveColormap: TCustomActionBarColorMap;
    function GetActionClientItem(MenuItemIndex, SubMenuItemIndex: Integer): TActionClientItem;
    function EndConnection(Confirm: Boolean): Integer;
    function GetActiveSchemaBrowser: TSchemaBrowserFrame;
    function GetActiveSQLEditor: TSQLEditorFrame;
    function GetActiveSQLHistory: TSQLHistoryFrame;
    function GetSessionList: TList;
    function GetStringList(Filename: string): TStringList;
    function OpenSQLEditor(Schema: string; AddNewDocument: Boolean): TSQLEditorFrame;
    procedure CreateProgressBar;
    procedure CloseTab(Confirm: Boolean);
    procedure CreateStyleMenu;
    procedure FindInFiles(SQLEditorFrame: TSQLEditorFrame; OutputTreeView: TVirtualDrawTree; FindWhatText, FileTypeText, FolderText: string; SearchCaseSensitive, LookInSubfolders: Boolean);
    procedure NewConnection(ConnectString: string = ''; SchemaParam: string = '');
    procedure NextPage;
    procedure OpenSQLHistory;
    procedure PreviousPage;
    procedure ReadIniOptions;
    procedure ReadIniSizePositionAndState;
    procedure RecreateDragDrop;
    procedure ResizeProgressBar;
    procedure SetFields;
    procedure SetPageControlOptions;
    procedure UpdateMainMenuBar;
    procedure UpdateStatusBar;
    procedure UpdateMarginsAndControls;
    procedure WriteIniFile;
  public
    { Public declarations }
    procedure CreateFileReopenList;
    procedure LoadSQLIntoEditor(Schema: string; SQLText: WideString);
    procedure SetSQLEditorFields;
    property OnProgress: Boolean write FOnProgress;
    property ProgressBar: TBCProgressBar read FProgressBar write FProgressBar;
  end;

  procedure OutputOpenAllEvent(var FileNames: TStrings);

var
  MainForm: TMainForm;

implementation

uses
  About, Lib, Options, BigIni, BCDialogs.FindInFiles, Vcl.Clipbrd, Parameters, SynEdit, OraCall, BCCommon.Lib,
  DataFilter, BCControls.DBGrid, ExportTableData, Progress, DataSort, ImportTableData, BCCommon.StyleUtils,
  SchemaDocument, Ora, ObjectSearch, SchemaCompare, TNSNamesEditor, Winapi.ShellAPI, SynUnicode, BCCommon.OptionsContainer,
  System.IOUtils, BCControls.OraSynEdit, BCControls.ToolBar, System.Math, BCCommon.Encoding, BCSQL.Formatter,
  BCCommon.LanguageStrings, BCCommon.StringUtils, BCCommon.Messages, BCCommon.FileUtils, Winapi.CommCtrl,
  SynEditTextBuffer, System.Generics.Collections, System.UITypes, BCDialogs.DownloadURL;

{$R *.dfm}

const
  MAIN_CAPTION = 'OraBone';
  MAIN_CAPTION_HYPHEN = ' - ';
  MAIN_CAPTION_TAB = MAIN_CAPTION_HYPHEN + '[%s';
  MAIN_CAPTION_CLOSE = ']';
  MAIN_CAPTION_VERSION = 'Oracle Version ';

procedure OutputOpenAllEvent(var FileNames: TStrings);
var
  i, j: Integer;
  SQLEditorFrame: TSQLEditorFrame;
begin
  SQLEditorFrame := MainForm.GetActiveSQLEditor;
  if Assigned(SQLEditorFrame) then
  Screen.Cursor := crHourGlass;
  try
    j := FileNames.Count;
    MainForm.ProgressBar.Count := j;
    MainForm.ProgressBar.Show;
    for i := 0 to j - 1 do
    begin
      MainForm.ProgressBar.StepIt;
      SQLEditorFrame.Open(FileNames.Strings[i]);
    end;
    MainForm.ProgressBar.Hide;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TMainForm.HelpAboutMenuActionExecute(Sender: TObject);
begin
  AboutDialog.Open;
end;

procedure TMainForm.RecreateDragDrop;
begin
  if Assigned(DragDrop) then
  begin
    DragDrop.Free;
    DragDrop := nil
  end;
  DragDrop := TJvDragDrop.Create(MainForm);
  DragDrop.DropTarget := MainForm;
  DragDrop.OnDrop := DragDropDrop;
  DragDrop.AcceptDrag := True;
end;

procedure TMainForm.SetPageControlOptions;
begin
  PageControl.DoubleBuffered := TStyleManager.ActiveStyle.Name = STYLENAME_WINDOWS;
  PageControl.MultiLine := OptionsContainer.ConnectionMultiLine;
  PageControl.DoubleBuffered := OptionsContainer.ConnectionDoubleBuffered;
  PageControl.ShowCloseButton := OptionsContainer.ConnectionShowCloseButton;
  PageControl.RightClickSelect := OptionsContainer.ConnectionRightClickSelect;
  if OptionsContainer.ConnectionShowImage then
    PageControl.Images := ImagesDataModule.ImageList
  else
    PageControl.Images := nil;
end;

procedure TMainForm.UpdateMarginsAndControls;
var
  i: Integer;
  SQLEditorFrame: TSQLEditorFrame;
  SchemaBrowserFrame: TSchemaBrowserFrame;
begin
  SetPageControlOptions;
  for i := 0 to PageControl.PageCount - 1 do
  begin
    if PageControl.Pages[i].ImageIndex = IMAGE_INDEX_SCHEMA_BROWSER then
    begin
      SchemaBrowserFrame := TSchemaBrowserFrame(PageControl.Pages[i].Components[0]);
      if Assigned(SchemaBrowserFrame) then
        SchemaBrowserFrame.UpdateMarginsAndControls(PageControl.DoubleBuffered);
    end
    else
    if PageControl.Pages[i].ImageIndex = IMAGE_INDEX_SQL_EDITOR then
    begin
      SQLEditorFrame := TSQLEditorFrame(PageControl.Pages[i].Components[0]);
      if Assigned(SQLEditorFrame) then
        SQLEditorFrame.UpdateMarginsAndControls;
    end
  end;
end;

function TMainForm.GetActionClientItem(MenuItemIndex, SubMenuItemIndex: Integer): TActionClientItem;
begin
  Result := ActionMainMenuBar.ActionClient.Items[MenuItemIndex];
  Result := Result.Items[SubMenuItemIndex];
end;

procedure TMainForm.HelpCheckForUpdateMenuActionExecute(Sender: TObject);
begin
  CheckForUpdates(Application.Title, AboutDialog.Version);
end;

procedure TMainForm.HelpHomeActionExecute(Sender: TObject);
begin
  BrowseURL(BONECODE_URL);
end;

procedure TMainForm.ActionToolBarGetControlClass(Sender: TCustomActionBar; AnItem: TActionClient;
  var ControlClass: TCustomActionControlClass);
begin
  ActionToolBar.ColorMap.Assign(FSaveColormap);
end;

procedure TMainForm.ApplicationEventsActivate(Sender: TObject);
var
  SynEdit: TBCOraSynEdit;
begin
  if PageControl.PageCount > 0 then
    if Assigned(PageControl.ActivePage) then
      if PageControl.ActivePage.ImageIndex = IMAGE_INDEX_SQL_EDITOR then
        if PageControl.ActivePage.Components[0] is TSQLEditorFrame then
        begin
          SynEdit := TSQLEditorFrame(PageControl.ActivePage.Components[0]).GetActiveSynEdit;
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
var
  SQLEditorFrame: TSQLEditorFrame;
begin
  if FProcessingEventHandler then
    Exit;
  SQLEditorFrame := GetActiveSQLEditor;
  if Assigned(SQLEditorFrame) then
    if SQLEditorFrame.Processing then
      Exit;
  SetFields;
end;

procedure TMainForm.SearchClearBookmarksActionExecute(Sender: TObject);
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

procedure TMainForm.GotoBookmarks0ActionExecute(Sender: TObject);
var
  Action: TAction;
begin
  Action := Sender as TAction;
  if PageControl.PageCount > 0 then
    if Assigned(PageControl.ActivePage) then
      if PageControl.ActivePage.ImageIndex = IMAGE_INDEX_SQL_EDITOR then
        if PageControl.ActivePage.Components[0] is TSQLEditorFrame then
          (PageControl.ActivePage.Components[0] as TSQLEditorFrame).GotoBookmarks(Action.Tag);
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
          Result := PageControl.ActivePage.Components[0] as TSQLEditorFrame;
end;

function TMainForm.GetActiveSQLHistory: TSQLHistoryFrame;
begin
  Result := nil;
  if PageControl.PageCount > 0 then
    if Assigned(PageControl.ActivePage) then
      if PageControl.ActivePage.ImageIndex = IMAGE_INDEX_SQL_HISTORY then
        if PageControl.ActivePage.Components[0] is TSQLHistoryFrame then
          Result := PageControl.ActivePage.Components[0] as TSQLHistoryFrame;
end;

function TMainForm.GetActiveSchemaBrowser: TSchemaBrowserFrame;
begin
  Result := nil;
  if PageControl.PageCount > 0 then
    if Assigned(PageControl.ActivePage) then
      if PageControl.ActivePage.ImageIndex = IMAGE_INDEX_SCHEMA_BROWSER then
        if PageControl.ActivePage.Components[0] is TSchemaBrowserFrame then
          Result := PageControl.ActivePage.Components[0] as TSchemaBrowserFrame;
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

function TMainForm.GetStringList(Filename: string): TStringList;
var
  LFileStream: TFileStream;
  LBuffer: TBytes;
  WithBom: Boolean;
begin
  Result := TStringList.Create;
  FEncoding := nil;
  LFileStream := TFileStream.Create(FileName, fmOpenRead);
  try
    // Identify encoding
    if SynUnicode.IsUTF8(LFileStream, WithBom) then
    begin
      if WithBom then
        FEncoding := TEncoding.UTF8
      else
        FEncoding := TEncoding.UTF8WithoutBOM;
    end
    else
    begin
      // Read file into buffer
      SetLength(LBuffer, LFileStream.Size);
      LFileStream.ReadBuffer(Pointer(LBuffer)^, Length(LBuffer));
      TEncoding.GetBufferEncoding(LBuffer, FEncoding);
    end;
  finally
    LFileStream.Free;
  end;
  Result.LoadFromFile(FileName, FEncoding);
end;

{ Recursive method to find files. }
procedure TMainForm.FindInFiles(SQLEditorFrame: TSQLEditorFrame; OutputTreeView: TVirtualDrawTree; FindWhatText, FileTypeText, FolderText: string; SearchCaseSensitive, LookInSubfolders: Boolean);
var
  shFindFile: THandle;
  sWin32FD: TWin32FindData;
  S, Line: WideString;
  FName: string;
  Ln, Ch, ChPos: LongWord;
  Found: Boolean;
  StringList: TStringList;
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
  {$WARNINGS OFF} { IncludeTrailingBackslash is specific to a platform }
  shFindFile := FindFirstFile(PChar(IncludeTrailingBackslash(FolderText) + '*.*'), sWin32FD);
  {$WARNINGS ON}
  if shFindFile <> INVALID_HANDLE_VALUE then
  try
    repeat
      if SQLEditorFrame.OutputFrame.CancelSearch then
        Exit;
      FName := StrPas(sWin32FD.cFileName);
      if (FName <> '.') and (FName <> '..') then
      begin
        if LookInSubfolders and IsDirectory(sWin32FD) then
          {$WARNINGS OFF} { IncludeTrailingBackslash is specific to a platform }
          FindInFiles(SQLEditorFrame, OutputTreeView, FindWhatText, FileTypeText, IncludeTrailingBackslash(FolderText) + FName, SearchCaseSensitive, LookInSubfolders)
          {$WARNINGS ON}
        else
        begin
          ProgressBar.StepIt;
          Application.ProcessMessages;
          if (FileTypeText = '*.*') or IsExtInFileType(ExtractFileExt(FName), FileTypeText) then
          try
            {$WARNINGS OFF} { IncludeTrailingBackslash is specific to a platform }
            StringList := GetStringList(IncludeTrailingBackslash(String(FolderText)) + FName);
            {$WARNINGS ON}
            try
              Root := nil;
              if Trim(StringList.Text) <> '' then
              for Ln := 0 to StringList.Count - 1 do
              begin
                Found := True;
                Line := StringList.Strings[Ln];
                S := Line;
                ChPos := 0;
                while Found do
                begin
                  if SearchCaseSensitive then
                    Ch := Pos(WideString(FindWhatText), S)
                  else
                    Ch := Pos(WideUpperCase(WideString(FindWhatText)), WideUpperCase(S));
                  if Ch <> 0 then
                  begin
                    Found := True;
                    ChPos := ChPos + Ch;
                    if SQLEditorFrame.OutputFrame.CancelSearch then
                      Break;
                    {$WARNINGS OFF} { IncludeTrailingBackslash is specific to a platform }
                    SQLEditorFrame.OutputFrame.AddTreeViewLine(OutputTreeView, Root, IncludeTrailingBackslash(FolderText) + FName, Ln + 1, ChPos, Line, ShortString(FindWhatText));
                    {$WARNINGS ON}
                    S := Copy(S, Ch + LongWord(Length(FindWhatText)), Length(S));
                    ChPos := ChPos + LongWord(Length(FindWhatText)) - 1;
                  end
                  else
                    Found := False;
                end;
              end
            finally
              StringList.Free;
            end;
          except
            {$WARNINGS OFF} { IncludeTrailingBackslash is specific to a platform }
            SQLEditorFrame.OutputFrame.AddTreeViewLine(OutputTreeView, Root, '', -1, 0,
              Format(LanguageDataModule.GetWarningMessage('FileAccessError'), [IncludeTrailingBackslash(FolderText) + FName]), '');
            {$WARNINGS ON}
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
  SynEdit: TBCOraSynEdit;
  SQLEditorFrame: TSQLEditorFrame;
  Min, Secs: Integer;
  TimeDifference: string;
  OutputTreeView: TVirtualDrawTree;
  Root: PVirtualNode;
begin
  OutputTreeView := nil;
  with FindInFilesDialog do
  begin
    Extensions := '*.*|*.sql|';
    SQLEditorFrame := GetActiveSQLEditor;
    SynEdit := SQLEditorFrame.GetActiveSynEdit;
    if Assigned(SynEdit) then
      if SynEdit.SelAvail then
        FindWhatComboBox.Text := SynEdit.SelText;
    if ShowModal = mrOk then
    begin
      Screen.Cursor := crHourGlass;
      try
        StatusBar.Panels[3].Text := LanguageDataModule.GetConstant('CountingFiles');
        Application.ProcessMessages;
        ProgressBar.Count := CountFilesInFolder(FolderText);
      finally
        Screen.Cursor := crDefault;
        StatusBar.Panels[3].Text := '';
      end;
      ProgressBar.Show;
      T1 := Now;
      try
        SQLEditorFrame.OutputPanel.Visible := True;
        OutputTreeView := SQLEditorFrame.OutputFrame.AddTreeView(Format(LanguageDataModule.GetConstant('SearchFor'), [FindWhatText]));
        SQLEditorFrame.OutputFrame.ProcessingTabSheet := True;
        Application.ProcessMessages;
        FindInFiles(SQLEditorFrame, OutputTreeView, FindWhatText, FileTypeText, FolderText, SearchCaseSensitive, LookInSubfolders);
      finally
        ProgressBar.Hide;
        T2 := Now;
        if not SQLEditorFrame.OutputFrame.CancelSearch then
        begin
          if SQLEditorFrame.OutputFrame.IsEmpty then
          begin
            Root := nil;
            SQLEditorFrame.OutputFrame.AddTreeViewLine(OutputTreeView, Root, '', -1, 0,
              Format(LanguageDataModule.GetMessage('CannotFindString'), [FindWhatText]));
            StatusBar.Panels[3].Text := '';
          end;
          Min := StrToInt(FormatDateTime('n', T2 - T1));
          Secs := Min * 60 + StrToInt(FormatDateTime('s', T2 - T1));
          if Secs < 60 then
            TimeDifference := FormatDateTime(Format('s.zzz "%s"', [LanguageDataModule.GetConstant('Second')]), T2 - T1)
          else
            TimeDifference := FormatDateTime(Format('n "%s" s.zzz "%s"', [LanguageDataModule.GetConstant('Minute'), LanguageDataModule.GetConstant('Second')]), T2 - T1);
          StatusBar.Panels[3].Text := Format(LanguageDataModule.GetConstant('OccurencesFound'), [SQLEditorFrame.OutputFrame.Count, TimeDifference])
        end;
        SQLEditorFrame.OutputFrame.PageControl.EndDrag(False); { if close button pressed and search canceled, dragging will stay... }
        SQLEditorFrame.OutputFrame.ProcessingTabSheet := False;
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
  OraSynEdit: TBCOraSynEdit;
begin
  SQLEditorFrame := GetActiveSQLEditor;
  if Assigned(SQLEditorFrame) then
  begin
    OraSynEdit := SQLEditorFrame.GetActiveSynEdit;
    if Assigned(OraSynEdit) then
      OraSynEdit.ToggleBookMark
  end;
end;

procedure TMainForm.SelectReopenFileActionExecute(Sender: TObject);
var
  FileName: string;
  Action: TAction;
  SQLEditorFrame: TSQLEditorFrame;
begin
  Action := Sender as TAction;
  FileName := System.Copy(Action.Caption, Pos(' ', Action.Caption) + 1, Length(Action.Caption));
  SQLEditorFrame := GetActiveSQLEditor;
  if Assigned(SQLEditorFrame) then
    SQLEditorFrame.Open(FileName);
end;

procedure TMainForm.SelectStyleActionExecute(Sender: TObject);
var
  i, j: Integer;
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

  with TBigIniFile.Create(GetINIFilename) do
  try
    WriteString('Options', 'StyleFilename', ExtractFilename(Action.Caption));
  finally
    Free;
  end;

  ActionClientItem := GetActionClientItem(VIEW_MENU_ITEMINDEX, VIEW_STYLE_MENU_ITEMINDEX);
  for i := 0 to ActionClientItem.Items.Count - 1 do
    for j := 0 to ActionClientItem.Items[i].Items.Count - 1 do
      TAction(ActionClientItem.Items[i].Items[j].Action).Checked := False;
  Action.Checked := True;
  UpdateMarginsAndControls;
  UpdateStatusBar;
  RecreateDragDrop;
end;

procedure TMainForm.CreateStyleMenu;
var
  FilePath, FileName, StyleName, ActionCaption: string;
  StyleInfo: TStyleInfo;
  ActionClientItem: TActionClientItem;
  Action: TAction;

  procedure SetMenuItem;
  var
    i: Integer;
  begin
    ActionClientItem := GetActionClientItem(VIEW_MENU_ITEMINDEX, VIEW_STYLE_MENU_ITEMINDEX);
    { alphabet submenu }
    for i := 0 to ActionClientItem.Items.Count - 1 do
    begin
      ActionCaption := StringReplace(ActionClientItem.Items[i].Caption, '&', '', [rfReplaceAll]);
      if ActionCaption = StyleName[1] then
      begin
        ActionClientItem := ActionClientItem.Items[i];
        Break;
      end;
    end;
    ActionCaption := StringReplace(ActionClientItem.Caption, '&', '', [rfReplaceAll]);
    if ActionCaption <> StyleName[1] then
    begin
      ActionClientItem := ActionClientItem.Items.Add;
      ActionClientItem.Caption := StyleName[1];
    end;
    ActionClientItem := ActionClientItem.Items.Add;
  end;
begin
  FilePath := IncludeTrailingPathDelimiter(Format('%s%s', [ExtractFilePath(ParamStr(0)), 'Styles']));
  if not DirectoryExists(FilePath) then
    Exit;

  for FileName in TDirectory.GetFiles(FilePath, '*.vsf') do
  begin
    if TStyleManager.IsValidStyle(FileName, StyleInfo) then
    begin
      StyleName := ExtractFileName(FileName);
      { Style menu item }
      SetMenuItem;
      Action := TAction.Create(ActionManager);
      Action.Name := StringReplace(StyleInfo.Name, ' ', '', [rfReplaceAll]) + 'StyleSelectAction';
      Action.Caption := FileName;
      Action.OnExecute := SelectStyleActionExecute;
      Action.Checked :=  TStyleManager.ActiveStyle.Name = StyleInfo.Name;
      ActionClientItem.Action := Action;
      ActionClientItem.Caption := StyleInfo.Name;
    end;
  end;
  { Windows }
  StyleName := 'Windows.vsf';
  SetMenuItem;
  Action := TAction.Create(ActionManager);
  Action.Name := 'WindowsStyleSelectAction';
  Action.Caption := STYLENAME_WINDOWS;
  Action.OnExecute := SelectStyleActionExecute;
  Action.Checked :=  TStyleManager.ActiveStyle.Name = STYLENAME_WINDOWS;
  ActionClientItem.Action := Action;
end;

procedure TMainForm.SetSQLEditorFields;
var
  i: Integer;
  InfoText: string;
  SQLEditorFrame: TSQLEditorFrame;
  ActiveSQLDocumentFound, OutputGridHasFocus, ModifiedDocuments, SQLEditorSelectionFound,
  ActiveDocumentModified: Boolean;
  ReopenActionClientItem: TActionClientItem;
  BookmarkList: TSynEditMarkList;
  GotoBookmarksAction, ToggleBookmarksAction: TAction;
begin
  if FOnProgress then
    Exit;
  try
    SQLEditorFrame := GetActiveSQLEditor;
    ActiveSQLDocumentFound := Assigned(SQLEditorFrame) and SQLEditorFrame.ActiveDocumentFound;
    SQLEditorSelectionFound := Assigned(SQLEditorFrame) and SQLEditorFrame.SelectionFound;
    OutputGridHasFocus := Assigned(SQLEditorFrame) and SQLEditorFrame.OutputGridHasFocus;
    ModifiedDocuments := Assigned(SQLEditorFrame) and SQLEditorFrame.ModifiedDocuments;
    ActiveDocumentModified := Assigned(SQLEditorFrame) and SQLEditorFrame.ActiveDocumentModified;
    BookmarkList := nil;
    if Assigned(SQLEditorFrame) then
      BookmarkList := SQLEditorFrame.GetActiveBookmarkList;

    DBMSOutputAction.Enabled := ActiveSQLDocumentFound;
    { file }
    FileNewAction.Enabled := Assigned(SQLEditorFrame);
    FileOpenAction.Enabled := FileNewAction.Enabled;
    ReopenActionClientItem := GetActionClientItem(FILE_MENU_ITEMINDEX, FILE_REOPEN_MENU_ITEMINDEX);
    FileReopenAction.Enabled := ActiveSQLDocumentFound and (ReopenActionClientItem.Items.Count > 0);
    FileCloseAction.Enabled := Assigned(SQLEditorFrame) and SQLEditorFrame.OpenTabSheets;
    FileCloseAllAction.Enabled := FileCloseAction.Enabled;
    FileCloseAllOtherPagesAction.Enabled := FileCloseAction.Enabled;
    FileSaveAsAction.Enabled := FileCloseAction.Enabled and ActiveSQLDocumentFound;
    if ActiveSQLDocumentFound then
      FileSaveAction.ShortCut :=  Menus.ShortCut(Word('S'), [ssCtrl])
    else
      FileSaveAction.ShortCut :=  scNone;
    FileSaveAction.Enabled := ActiveSQLDocumentFound and ActiveDocumentModified;
    FileSaveAllAction.Enabled := ModifiedDocuments and ActiveSQLDocumentFound;
    FilePrintAction.Enabled := FileCloseAction.Enabled and ActiveSQLDocumentFound;
    FilePrintPreviewAction.Enabled := FileCloseAction.Enabled and ActiveSQLDocumentFound;
    { Edit }
    EditUndoAction.Enabled := FileCloseAction.Enabled and Assigned(SQLEditorFrame) and SQLEditorFrame.CanUndo and ActiveSQLDocumentFound;
    EditRedoAction.Enabled := FileCloseAction.Enabled and Assigned(SQLEditorFrame) and SQLEditorFrame.CanRedo and ActiveSQLDocumentFound;
    EditCutAction.Enabled := SQLEditorSelectionFound and ActiveSQLDocumentFound;
    EditCopyAction.Enabled := EditCutAction.Enabled or OutputGridHasFocus;
   // EditSelectAllAction.Enabled := ActiveSQLDocumentFound;
    EditIncreaseIndentAction.Enabled := SQLEditorSelectionFound;
    EditDecreaseIndentAction.Enabled := SQLEditorSelectionFound;
    EditSortAscAction.Enabled := SQLEditorSelectionFound;
    EditSortDescAction.Enabled := SQLEditorSelectionFound;
    EditToggleCaseAction.Enabled := SQLEditorSelectionFound;
    EditInsertLineAction.Enabled := ActiveSQLDocumentFound;
    EditDeleteWordAction.Enabled := ActiveSQLDocumentFound;
    EditDeleteLineAction.Enabled := ActiveSQLDocumentFound;
    EditDeleteEOLAction.Enabled := ActiveSQLDocumentFound;
    FormatSQLAction.Enabled := ActiveSQLDocumentFound and FSQLFormatterDLLFound;
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
    SearchGotoLineAction.Enabled := ActiveSQLDocumentFound;
    SearchReplaceAction.Enabled := ActiveSQLDocumentFound;
    SearchFindNextAction.Enabled := ActiveSQLDocumentFound;
    SearchFindPreviousAction.Enabled := ActiveSQLDocumentFound;
    SearchFindInFilesAction.Enabled := Assigned(SQLEditorFrame) and not SQLEditorFrame.OutputFrame.ProcessingTabSheet;
    SearchToggleBookmarkAction.Enabled := OptionsContainer.MarginShowBookmarks and ActiveSQLDocumentFound;
    SearchToggleBookmarksAction.Enabled := SearchToggleBookmarkAction.Enabled;
    SearchGotoBookmarksAction.Enabled := SearchToggleBookmarkAction.Enabled;
    SearchClearBookmarksAction.Enabled := SearchToggleBookmarkAction.Enabled;
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
    ViewLineNumbersAction.Enabled := Assigned(SQLEditorFrame) and (SQLEditorFrame.OpenTabSheetCount > 0);
    ViewSpecialCharsAction.Enabled := ViewLineNumbersAction.Enabled;
    ViewSelectionModeAction.Enabled := ActiveSQLDocumentFound;
    ViewSelectionModeAction.Checked := ActiveSQLDocumentFound and SQLEditorFrame.SelectionMode;
    ViewMinimapAction.Enabled := ActiveSQLDocumentFound;
    ViewMinimapAction.Checked := ActiveSQLDocumentFound and SQLEditorFrame.MinimapChecked;
    { Database Export }
    //DatabaseExportTableDataAction.Enabled :=
    //  (ActiveSQLDocumentFound and SQLEditorFrame.DataQueryOpened) or ActiveSQLDocumentFound or
    //  (Assigned(SchemaBrowserFrame) and SchemaBrowserFrame.DataQueryOpened);
    { SQL Editor }
    ExecuteStatementAction.Enabled := ActiveSQLDocumentFound and (SQLEditorFrame.GetActiveSynEdit.Text <> '');
    ExecuteCurrentStatementAction.Enabled := ExecuteStatementAction.Enabled;
    ExecuteScriptAction.Enabled := ExecuteStatementAction.Enabled;
    ExplainPlanAction.Enabled := ExecuteStatementAction.Enabled;
    if OptionsContainer.MarginShowBookmarks then
    begin
      { Bookmarks }
      for i := 1 to 9 do
      begin
        GotoBookmarksAction := TAction(FindComponent(Format('GotoBookmarks%dAction', [i])));
        GotoBookmarksAction.Enabled := False;
        GotoBookmarksAction.Caption := Format('%s &%d', [LanguageDataModule.GetConstant('Bookmark'), i]);
        ToggleBookmarksAction := TAction(FindComponent(Format('ToggleBookmarks%dAction', [i])));
        ToggleBookmarksAction.Caption := Format('%s &%d', [LanguageDataModule.GetConstant('Bookmark'), i]);
      end;
      if Assigned(BookmarkList) then
      for i := 0 to BookmarkList.Count - 1 do
      begin
        GotoBookmarksAction := TAction(FindComponent(Format('GotoBookmarks%dAction', [BookmarkList.Items[i].BookmarkNumber])));
        GotoBookmarksAction.Enabled := True;
        GotoBookmarksAction.Caption := Format('%s &%d: %s %d', [LanguageDataModule.GetConstant('Bookmark'),
          BookmarkList.Items[i].BookmarkNumber, LanguageDataModule.GetConstant('Line'), BookmarkList.Items[i].Line]);
        ToggleBookmarksAction := TAction(FindComponent(Format('ToggleBookmarks%dAction', [BookmarkList.Items[i].BookmarkNumber])));
        ToggleBookmarksAction.Caption := Format('%s &%d: %s %d', [LanguageDataModule.GetConstant('Bookmark'),
          BookmarkList.Items[i].BookmarkNumber, LanguageDataModule.GetConstant('Line'), BookmarkList.Items[i].Line]);
      end;
    end;
    { Edit }
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
  FProcessingEventHandler := True;
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
    StatusBarAction.Checked := StatusBar.Visible;

    ViewNextPageAction.Enabled := PageControl.PageCount > 1; //FileCloseAction.Enabled or DatabaseEndConnectionMenuAction.Enabled;
    ViewPreviousPageAction.Enabled := ViewNextPageAction.Enabled;

    { Database Export }
    DatabaseExportTableDataAction.Enabled :=
      ( Assigned(SQLEditorFrame) and SQLEditorFrame.ActiveDocumentFound and SQLEditorFrame.DataQueryOpened) or
      //SQLEditorFrame.ActiveDocumentFound or
      (Assigned(SchemaBrowserFrame) and SchemaBrowserFrame.DataQueryOpened);

    { Mainform caption }
    if (PageControl.PageCount > 0) and (PageControl.ActivePageCaption <> '') then
    begin
      CaptionText := Format(MAIN_CAPTION + MAIN_CAPTION_TAB, [PageControl.ActivePageCaption]);

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

    { Tools }
    ToolsCompareFilesAction.Enabled := Assigned(SQLEditorFrame);
    ToolsCompareSchemasAction.Enabled := (not FConnecting) and (PageControl.PageCount > 0);
    ToolsOptionsAction.Enabled := (not FConnecting) and (PageControl.PageCount > 0) and (Assigned(SchemaBrowserFrame) or
      Assigned(SQLEditorFrame));
    ToolsSelectForCompareAction.Enabled := Assigned(SQLEditorFrame) and SQLEditorFrame.ActiveDocumentFound and
      (not SQLEditorFrame.ActiveDocumentModified);
    DatabaseObjectSearchAction.Enabled := ToolsOptionsAction.Enabled;

    SchemaDocumentAction.Enabled := (not FConnecting) and Assigned(SchemaBrowserFrame);

    GetKeyboardState(KeyState);
    if KeyState[VK_INSERT] = 0 then
      if StatusBar.Panels[1].Text <> LanguageDataModule.GetConstant('Insert') then
        StatusBar.Panels[1].Text := LanguageDataModule.GetConstant('Insert');
    if KeyState[VK_INSERT] = 1 then
      if StatusBar.Panels[1].Text <> LanguageDataModule.GetConstant('Overwrite') then
        StatusBar.Panels[1].Text := LanguageDataModule.GetConstant('Overwrite');
  except
    // silent
  end;
  FProcessingEventHandler := False;
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

procedure TMainForm.CreateFileReopenList;
var
  i, j, ImageIndex: Integer;
  s: string;
  ReopenActionClientItem, ActionClientItem: TActionClientItem;
  Files: TStrings;
  Action: TAction;
  SystemImageList: TBCImageList;
  SysImageList: THandle;
  Icon: TIcon;
begin
  SystemImageList := TBCImageList.Create(nil);
  try
    SysImageList := GetSysImageList; //SHGetFileInfo(PChar(PathInfo), 0, SHFileInfo, SizeOf(SHFileInfo), SHGFI_SYSICONINDEX or SHGFI_SMALLICON);
    if SysImageList <> 0 then
      SystemImageList.Handle := SysImageList;
    { Remove added images from imagelist }
    while FImageListCount < ImagesDataModule.ImageList.Count do
      ImageList_Remove(ImagesDataModule.ImageList.Handle, FImageListCount);

    ReopenActionClientItem := GetActionClientItem(FILE_MENU_ITEMINDEX, FILE_REOPEN_MENU_ITEMINDEX);
    { Destroy actions }
    for i := ReopenActionClientItem.Items.Count - 1 downto 0 do
      if Assigned(ReopenActionClientItem.Items[i].Action) then
        if ReopenActionClientItem.Items[i].Action.Tag = 1 then
          ReopenActionClientItem.Items[i].Action.Free;
    ReopenActionClientItem.Items.Clear;

    Files := TStringList.Create;
    with TBigIniFile.Create(GetIniFilename) do
    try
      ReadSectionValues('FileReopenFiles', Files);
      { Files }
      j := 0;
      for i := 0 to Files.Count - 1 do
      begin
        s := System.Copy(Files.Strings[i], Pos('=', Files.Strings[i]) + 1, Length(Files.Strings[i]));
        if FileExists(s) then
        begin
          ActionClientItem := ReopenActionClientItem.Items.Add;
          Action := TAction.Create(ActionManager);
          Action.Name := Format('ReopenFile%dSelectAction', [j]);
          Action.Caption := Format('%d %s', [j, s]);
          Action.OnExecute := SelectReopenFileActionExecute;
          Action.Tag := 1;
          { Add image to imagelist }
          Icon := TIcon.Create;
          try
            ImageIndex := GetIconIndex(s);
            SystemImageList.GetIcon(ImageIndex, Icon);
            ImageIndex := ImageList_AddIcon(ImagesDataModule.ImageList.Handle, Icon.Handle);
          finally
            Icon.Free;
          end;
          Action.ImageIndex := ImageIndex;
          ActionClientItem.Action := Action;
          Inc(j);
        end;
      end;
      { Divider }
      if Files.Count > 0 then
      begin
        ActionClientItem := ReopenActionClientItem.Items.Add;
        ActionClientItem.Caption := '-';
        { Clear }
        ActionClientItem := ReopenActionClientItem.Items.Add;
        ActionClientItem.Action := FileReopenClearAction;
      end;
    finally
      Free;
      Files.Free;
    end;
  finally
    SystemImageList.Free;
  end;
end;

procedure TMainForm.DummyActionExecute(Sender: TObject);
begin
  { dummy }
end;

procedure TMainForm.FileReopenClearActionExecute(Sender: TObject);
begin
  with TBigIniFile.Create(GetINIFilename) do
  try
    EraseSection('FileReopenFiles');
  finally
    Free;
  end;
  CreateFileReopenList;
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

procedure TMainForm.ReadIniOptions;
var
  i, j: Integer;
  Connections, SQLParameters, SQLFilters, SQLSorts: TStrings;
  ConnectString, SchemaParam: string;
begin
  OptionsContainer.ReadIniFile;
  SQLFormatterOptions.ReadIniFile;

  FOnProgress := True;
  Screen.Cursor := crHourglass;
  Connections := TStringList.Create;
  SQLParameters := TStringList.Create;
  SQLFilters := TStringList.Create;
  SQLSorts := TStringList.Create;

  PageControl.Enabled := False;

  with TBigIniFile.Create(GetINIFilename) do
  try
    { if items doesn't exist in ini, create them }
    if not SectionExists('ToolBarItems') then
    begin
      i := 0;
      WriteString('ToolBarItems', IntToStr(PostInc(i)), 'ExecuteStatementAction');
      WriteString('ToolBarItems', IntToStr(PostInc(i)), 'ExecuteCurrentStatementAction');
      WriteString('ToolBarItems', IntToStr(PostInc(i)), 'ExecuteScriptAction');
      WriteString('ToolBarItems', IntToStr(PostInc(i)), '-');
      WriteString('ToolBarItems', IntToStr(PostInc(i)), 'DatabaseCommitAction');
      WriteString('ToolBarItems', IntToStr(PostInc(i)), 'DatabaseRollbackAction');
      WriteString('ToolBarItems', IntToStr(PostInc(i)), '-');
      WriteString('ToolBarItems', IntToStr(PostInc(i)), 'DBMSOutputAction');
      WriteString('ToolBarItems', IntToStr(PostInc(i)), '-');
      WriteString('ToolBarItems', IntToStr(PostInc(i)), 'ExplainPlanAction');
      WriteString('ToolBarItems', IntToStr(PostInc(i)), '-');
      WriteString('ToolBarItems', IntToStr(PostInc(i)), 'FileNewAction');
      WriteString('ToolBarItems', IntToStr(PostInc(i)), 'FileOpenAction');
      WriteString('ToolBarItems', IntToStr(PostInc(i)), '-');
      WriteString('ToolBarItems', IntToStr(PostInc(i)), 'FileSaveAction');
      WriteString('ToolBarItems', IntToStr(PostInc(i)), 'FileSaveAsAction');
      WriteString('ToolBarItems', IntToStr(PostInc(i)), 'FileSaveAllAction');
      WriteString('ToolBarItems', IntToStr(PostInc(i)), 'FileCloseAction');
      WriteString('ToolBarItems', IntToStr(PostInc(i)), 'FileCloseAllAction');
      WriteString('ToolBarItems', IntToStr(PostInc(i)), '-');
      WriteString('ToolBarItems', IntToStr(PostInc(i)), 'FilePrintAction');
      WriteString('ToolBarItems', IntToStr(PostInc(i)), 'FilePrintPreviewAction');
      WriteString('ToolBarItems', IntToStr(PostInc(i)), '-');
      WriteString('ToolBarItems', IntToStr(PostInc(i)), 'EditIncreaseIndentAction');
      WriteString('ToolBarItems', IntToStr(PostInc(i)), 'EditDecreaseIndentAction');
      WriteString('ToolBarItems', IntToStr(PostInc(i)), '-');
      WriteString('ToolBarItems', IntToStr(PostInc(i)), 'EditSortAscAction');
      WriteString('ToolBarItems', IntToStr(PostInc(i)), 'EditSortDescAction');
      WriteString('ToolBarItems', IntToStr(PostInc(i)), '-');
      WriteString('ToolBarItems', IntToStr(PostInc(i)), 'EditToggleCaseAction');
      WriteString('ToolBarItems', IntToStr(PostInc(i)), '-');
      WriteString('ToolBarItems', IntToStr(PostInc(i)), 'EditUndoAction');
      WriteString('ToolBarItems', IntToStr(PostInc(i)), 'EditRedoAction');
      WriteString('ToolBarItems', IntToStr(PostInc(i)), '-');
      WriteString('ToolBarItems', IntToStr(PostInc(i)), 'SearchAction');
      WriteString('ToolBarItems', IntToStr(PostInc(i)), 'SearchReplaceAction');
      WriteString('ToolBarItems', IntToStr(PostInc(i)), 'SearchFindInFilesAction');
      WriteString('ToolBarItems', IntToStr(PostInc(i)), '-');
      WriteString('ToolBarItems', IntToStr(PostInc(i)), 'ViewWordWrapAction');
      WriteString('ToolBarItems', IntToStr(PostInc(i)), 'ViewLineNumbersAction');
      WriteString('ToolBarItems', IntToStr(PostInc(i)), 'ViewSpecialCharsAction');
      WriteString('ToolBarItems', IntToStr(PostInc(i)), 'ViewSelectionModeAction');
      WriteString('ToolBarItems', IntToStr(PostInc(i)), '-');
      WriteString('ToolBarItems', IntToStr(PostInc(i)), 'ToolsCompareFilesAction');
    end;

    ReadSectionValues('OpenConnections', Connections);
    j := Connections.Count;
    if j > 0 then
      ProgressDialog(Self).Open(0, 1, False, True);
    for i := 0 to j - 1 do
    begin
      ConnectString := DecryptString(System.Copy(Connections.Strings[i], Pos('=', Connections.Strings[i]) + 1, Length(Connections.Strings[i])));

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
    ProgressDialog(Self).Free;
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

procedure TMainForm.ToggleBookmarks0ActionExecute(Sender: TObject);
var
  Action: TAction;
begin
  Action := Sender as TAction;
  if PageControl.PageCount > 0 then
    if Assigned(PageControl.ActivePage) then
      if PageControl.ActivePage.ImageIndex = IMAGE_INDEX_SQL_EDITOR then
        if PageControl.ActivePage.Components[0] is TSQLEditorFrame then
          TSQLEditorFrame(PageControl.ActivePage.Components[0]).ToggleBookmarks(Action.Tag);
end;

procedure TMainForm.ToolsCompareFilesActionExecute(Sender: TObject);
var
  SQLEditorFrame: TSQLEditorFrame;
begin
  SQLEditorFrame := GetActiveSQLEditor;
  if Assigned(SQLEditorFrame) then
    SQLEditorFrame.CompareFiles;
end;

procedure TMainForm.UpdateMainMenuBar;
begin
  OptionsContainer.AssignTo(ActionMainMenuBar);
end;

procedure TMainForm.ToolsOptionsActionExecute(Sender: TObject);
var
  i: Integer;
  SQLEditorFrame: TSQLEditorFrame;
  OraSession: TOraSession;
  SchemaBrowserFrame: TSchemaBrowserFrame;
  SQLHistoryFrame: TSQLHistoryFrame;

  ActionList: TObjectList<TAction>;

  function GetActionList: TObjectList<TAction>;
  var
    i: Integer;
    Action: TAction;
  begin
    Result := TObjectList<TAction>.Create;
    for i := 0 to ActionManager.ActionCount - 1 do
      if (ActionManager.Actions[i].ImageIndex <> -1) and
        (ActionManager.Actions[i].Hint <> '') then
      begin
        Action := TAction.Create(nil);
        Action.Name := ActionManager.Actions[i].Name;
        Action.Caption := StringReplace(ActionManager.Actions[i].Caption, '&', '', []);
        Action.ImageIndex := ActionManager.Actions[i].ImageIndex;
        Result.Add(Action);
      end;
  end;
begin
  FOnProgress := True;
  OraSession := nil;

  ActionList := GetActionList;
  try
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
      if OptionsForm.Execute(OraSession, ActionList) then
      begin
        UpdateMainMenuBar;
        UpdateStatusBar;
        SetPageControlOptions;
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
            begin
              SQLEditorFrame.AssignOptions;
              SQLEditorFrame.CreateActionToolBar;
            end;
          end
          else
          if PageControl.Pages[i].ImageIndex = IMAGE_INDEX_SQL_HISTORY then
          begin
            SQLHistoryFrame := TSQLHistoryFrame(PageControl.Pages[i].Components[0]);
            if Assigned(SQLHistoryFrame) then
              SQLHistoryFrame.AssignOptions;
          end
        end;
        Repaint;
      end;
  finally
    if Assigned(ActionList) then
      ActionList.Free;
  end;
  FOnProgress := False;
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

procedure TMainForm.SearchGotoLineActionExecute(Sender: TObject);
var
  SQLEditorFrame: TSQLEditorFrame;
begin
  SQLEditorFrame := GetActiveSQLEditor;
  if Assigned(SQLEditorFrame) then
    SQLEditorFrame.GotoLine;
end;

procedure TMainForm.ViewLineNumbersActionExecute(Sender: TObject);
var
  SQLEditorFrame: TSQLEditorFrame;
begin
  SQLEditorFrame := GetActiveSQLEditor;
  if Assigned(SQLEditorFrame) then
    ViewLineNumbersAction.Checked := SQLEditorFrame.ToggleLineNumbers;
end;

procedure TMainForm.ViewMiniMapActionExecute(Sender: TObject);
var
  SQLEditorFrame: TSQLEditorFrame;
begin
  SQLEditorFrame := GetActiveSQLEditor;
  if Assigned(SQLEditorFrame) then
    SQLEditorFrame.ToggleMiniMap;
end;

procedure TMainForm.ViewNextPageActionExecute(Sender: TObject);
var
  SQLEditorFrame: TSQLEditorFrame;
begin
  SQLEditorFrame := GetActiveSQLEditor;
  if Assigned(SQLEditorFrame) then
  begin
    if SQLEditorFrame.GetActiveSynEdit.Focused then
    begin
      SQLEditorFrame.NextPage;
      SQLEditorFrame.GetActiveSynEdit.SetFocus;
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
    if SQLEditorFrame.GetActiveSynEdit.Focused then
    begin
      SQLEditorFrame.PreviousPage;
      SQLEditorFrame.GetActiveSynEdit.SetFocus;
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
  with TBigIniFile.Create(GetINIFilename) do
  try
    try
      WriteString('OraBone', 'Version', AboutDialog.Version);

      WriteBool('Options', 'ShowToolBar', ActionToolBar.Visible);
      WriteBool('Options', 'ShowStatusBar', StatusBar.Visible);

      WriteBool('Options', 'EnableWordWrap', ViewWordWrapAction.Checked);
      WriteBool('Options', 'EnableLineNumbers', ViewLineNumbersAction.Checked);
      WriteBool('Options', 'EnableSpecialChars', ViewSpecialCharsAction.Checked);
      WriteBool('Options', 'EnableSelectionMode', ViewSelectionModeAction.Checked);

      if Assigned(TStyleManager.ActiveStyle) then
        WriteString('Options', 'StyleName', TStyleManager.ActiveStyle.Name);

      { Position }
      WriteInteger('Position', 'Left', Left);
      WriteInteger('Position', 'Top', Top);
      { Size }
      WriteInteger('Size', 'Width', Width);
      WriteInteger('Size', 'Height', Height);
      { Open connections }
      EraseSection('OpenConnections');
      for i := 0 to PageControl.PageCount - 1 do
      begin
        if PageControl.Pages[i].ImageIndex = IMAGE_INDEX_SCHEMA_BROWSER then
        begin
          SchemaBrowserFrame := TSchemaBrowserFrame(PageControl.Pages[i].Components[0]);
          if Assigned(SchemaBrowserFrame) then
            WriteString('OpenConnections', IntToStr(i), EncryptString(SchemaBrowserFrame.ObjectTreeFrame.GetConnectString + '||' + SchemaBrowserFrame.ObjectTreeFrame.SchemaParam));
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

procedure TMainForm.FormActivate(Sender: TObject);
begin
  UpdateMainMenuBar;
  Repaint;
end;

procedure TMainForm.FormatSQLActionExecute(Sender: TObject);
var
  SQLEditorFrame: TSQLEditorFrame;
  SynEdit: TBCOraSynEdit;
begin
  SQLEditorFrame := GetActiveSQLEditor;
  if Assigned(SQLEditorFrame) then
  begin
    SynEdit := SQLEditorFrame.GetActiveSynEdit;
    if Assigned(SynEdit) then
      if Trim(Synedit.Text) <> '' then
        Synedit.Text := FormatSQL(Synedit.Text, dbOracle);
  end;
end;

procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
var
  i, j: Integer;
  SQLEditorFrame: TSQLEditorFrame;
begin
  { close files search if processing it }
  for i := 0 to PageControl.PageCount - 1 do
  begin
    if PageControl.Pages[i].ImageIndex = IMAGE_INDEX_SQL_EDITOR then
    begin
      SQLEditorFrame := TSQLEditorFrame(PageControl.Pages[i].Components[0]);
      if Assigned(SQLEditorFrame) then
        if SQLEditorFrame.OutputFrame.ProcessingTabSheet then
          SQLEditorFrame.OutputFrame.CloseTabSheet;
    end
  end;
  try
    if not FNoIni then
    begin
      OptionsContainer.WriteIniFile;
      WriteIniFile;
    end;

    ApplicationEvents.Free;

    j := PageControl.PageCount - 1;
    for i := j downto 0 do
    begin
      PageControl.ActivePage := PageControl.Pages[i];
      CloseTab(False);
    end;
  except
    { silent exception, connection might have lost and we are closing, no need to inform about it }
  end;
  SQLFormatterOptions.Free;
  OptionsContainer.Free;
end;

procedure TMainForm.UpdateStatusBar;
begin
  OptionsContainer.AssignTo(StatusBar);
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  FOnProgress := False;
  FOnStartUp := True;
  FConnecting := True;
  OraCall.OCIUnicode := True;
  FImageListCount := ImagesDataModule.ImageList.Count; { System images are inserted after }
  FSQLFormatterDLLFound := FileExists(GetSQLFormatterDLLFilename);
  CreateProgressBar;
  ReadIniSizePositionAndState;

  FSaveMenuFont := TFont.Create;
  FSaveMenuFont.Assign(ActionMainMenuBar.Font);
  FSaveColormap := TCustomActionBarColorMap.Create(Self);
  FSaveColormap.Assign(ActionMainMenuBar.Colormap);
  FSaveColormap.Color := clWindow;
end;

procedure TMainForm.FormDestroy(Sender: TObject);
begin
  FProgressBar.Free;
  FSaveMenuFont.Destroy;
  FSaveColormap.Destroy;
end;

procedure TMainForm.FormResize(Sender: TObject);
begin
  ResizeProgressBar;
  ActionMainMenuBar.Width := Width;
  ActionMainMenuBar.Refresh;
  Repaint;
end;

procedure TMainForm.ReadIniSizePositionAndState;
var
  State: Integer;
begin
  with TBigIniFile.Create(GetINIFilename) do
  try
    ActionToolBar.Visible := ReadBool('Options', 'ShowToolBar', True);
    StatusBar.Visible := ReadBool('Options', 'ShowStatusBar', True);

    ViewWordWrapAction.Checked := ReadBool('Options', 'EnableWordWrap', False); //OptionsContainer.EnableWordWrap;
    ViewLineNumbersAction.Checked := ReadBool('Options', 'EnableLineNumbers', True); //OptionsContainer.EnableLineNumbers;
    ViewSpecialCharsAction.Checked := ReadBool('Options', 'EnableSpecialChars', False);  //OptionsContainer.EnableSpecialChars;
    ViewSelectionModeAction.Checked := ReadBool('Options', 'EnableSelectionMode', False); //OptionsContainer.EnableSelectionMode;
    { Size }
    Width := ReadInteger('Size', 'Width', Round(Screen.Width * 0.8));
    Height := ReadInteger('Size', 'Height', Round(Screen.Height * 0.8));
    { Position }
    Left := ReadInteger('Position', 'Left', (Screen.Width - Width) div 2);
    Top := ReadInteger('Position', 'Top', (Screen.Height - Height) div 2);
    { Check if the form is outside the workarea }
    Left := SetFormInsideWorkArea(Left, Width);
    { State }
    State := ReadInteger('Size', 'State', 0);
    case State of
      0: WindowState := wsNormal;
      1: WindowState := wsMinimized;
      2: WindowState := wsMaximized;
    end;
  finally
    Free;
  end;
end;

procedure TMainForm.Formshow(Sender: TObject);
begin
  if FOnStartUp then
  begin
    FNoIni := (ParamCount > 0) and (ParamStr(1) = PARAM_NO_INI);
    ReadIniOptions;
    CreateStyleMenu;
    CreateFileReopenList;
    CreateProgressBar;
    UpdateMarginsAndControls;
    UpdateStatusBar;
    FOnStartUp := False;
  end;
end;

procedure TMainForm.ResizeProgressBar;
var
  R: TRect;
begin
  if Assigned(FProgressBar) then
  begin
    Statusbar.Perform(SB_GETRECT, 3, Integer(@R));
    FProgressBar.Top    := R.Top;
    FProgressBar.Left   := R.Left;
    FProgressBar.Width  := R.Right - R.Left;
    FProgressBar.Height := R.Bottom - R.Top;
  end;
end;

procedure TMainForm.TaskBarStepChange(Sender: TObject);
begin
  Taskbar.ProgressValue := FProgressBar.Position;
end;

procedure TMainForm.TaskBarShow(Sender: TObject);
begin
  Taskbar.ProgressState := TTaskBarProgressState.Normal;
end;

procedure TMainForm.TaskBarHide(Sender: TObject);
begin
  Taskbar.ProgressState := TTaskBarProgressState.None;
end;

procedure TMainForm.CreateProgressBar;
begin
  FProgressBar := TBCProgressBar.Create(StatusBar);
  FProgressBar.OnStepChange := TaskBarStepChange;
  FProgressBar.OnShow := TaskBarShow;
  FProgressBar.OnHide := TaskBarHide;
  FProgressBar.Hide;
  ResizeProgressBar;
  FProgressBar.Parent := Statusbar;
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
  ActivePageIndex: Integer;
  Rslt: Integer;
  SQLEditorFrame: TSQLEditorFrame;
begin
  ActivePageIndex := PageControl.ActivePageIndex;
  if PageControl.ActivePage.ImageIndex = IMAGE_INDEX_SCHEMA_BROWSER then
    EndConnection(Confirm)
  else
  if PageControl.ActivePage.ImageIndex = IMAGE_INDEX_SQL_EDITOR then
  begin
    SQLEditorFrame := GetActiveSQLEditor;
    with TBigIniFile.Create(GetINIFilename) do
    try
      { Toolbar }
      EraseSection('ActionToolBar'); { deprecated }
    finally
      Free;
    end;
    if Assigned(SQLEditorFrame) then
    begin
      Rslt := SQLEditorFrame.CloseAll(True, Confirm);
      if Rslt <> mrCancel then
      begin
        PageControl.TabClosed := True;
        if SQLEditorFrame.InTransaction then
        begin
          if Lib.AskCommit(PageControl.ActivePageCaption) then
            SQLEditorFrame.Session.Commit
          else
            SQLEditorFrame.Session.Rollback
        end;
        { Fixed Delphi Bug: http://qc.embarcadero.com/wc/qcmain.aspx?d=5473 }
        if (ActivePageIndex = PageControl.PageCount - 1) and (PageControl.PageCount > 1) then
        begin
          Dec(ActivePageIndex);
          PageControl.ActivePage.PageIndex := ActivePageIndex;
        end;
        if PageControl.PageCount > 0 then
          PageControl.Pages[ActivePageIndex].Free;
      end;
    end;
  end
  else
  if PageControl.ActivePage.ImageIndex = IMAGE_INDEX_SQL_HISTORY then
  begin
    PageControl.TabClosed := True;
    { Fixed Delphi Bug: http://qc.embarcadero.com/wc/qcmain.aspx?d=5473 }
    if (ActivePageIndex = PageControl.PageCount - 1) and (PageControl.PageCount > 1) then
    begin
      Dec(ActivePageIndex);
      PageControl.ActivePage.PageIndex := ActivePageIndex;
    end;
    if PageControl.PageCount > 0 then
      PageControl.Pages[ActivePageIndex].Free;
  end;
  PageControl.Repaint;
end;

procedure TMainForm.DatabaseCommitActionExecute(Sender: TObject);
var
  SQLEditorFrame: TSQLEditorFrame;
begin
  SQLEditorFrame := GetActiveSQLEditor;
  if Assigned(SQLEditorFrame) then
    if SQLEditorFrame.InTransaction then
      SQLEditorFrame.Session.Commit;
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
  i: Integer;
  SQLEditorFrame: TSQLEditorFrame;
  SynEdit: TBCOraSynEdit;
begin
  SQLEditorFrame := OpenSQLEditor(Schema, False); { open editor }
  if Assigned(SQLEditorFrame) then
  begin
    SQLEditorFrame.New;
    SynEdit := SQLEditorFrame.GetActiveSynEdit;
    SynEdit.Lines.BeginUpdate;
    SynEdit.Lines.Text := SQLText;
    SynEdit.Lines.EndUpdate;
    for i := 0 to SynEdit.ExpandLines.Count - 1 do
      SynEdit.ExpandLines.Attributes[i].aLineState := lsNone;
    SQLEditorFrame.SynEditOnChange(nil);

    PageControlChange(nil);
  end;
end;

procedure TMainForm.DatabaseEditorMenuActionExecute(Sender: TObject);
begin
  with TBigIniFile.Create(GetINIFilename) do
  try
    OpenSQLEditor(PageControl.ActivePageCaption, True);
    SetFields;
    PageControlChange(Sender);
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
  TableNames: TStringList;
begin
  FormattedSchema := Lib.FormatSchema(Schema);
  { check if sql editor tab already exists }
  for i := 0 to PageControl.PageCount - 1 do
    if (PageControl.Pages[i].ImageIndex = IMAGE_INDEX_SQL_EDITOR) and
       (Trim(PageControl.Pages[i].Caption) = FormattedSchema) then
    begin
      PageControl.ActivePage := PageControl.Pages[i];
      Exit(TSQLEditorFrame(PageControl.ActivePage.Components[0]));
    end;

  SchemaBrowserFrame := nil;
  { check if connection exists }
  for i := 0 to PageControl.PageCount - 1 do
    if (PageControl.Pages[i].ImageIndex = IMAGE_INDEX_SCHEMA_BROWSER) and
       (Trim(PageControl.Pages[i].Caption) = FormattedSchema) then
      SchemaBrowserFrame := TSchemaBrowserFrame(PageControl.Pages[i].Components[0]);

  if not Assigned(SchemaBrowserFrame) then
  begin
    ShowMessage(Format('Connection for the schema ''%s'' not found.', [Schema]));
    Exit(nil);
  end
  else
  begin
    { Create new tab }
    TabSheet := TTabSheet.Create(PageControl);
    TabSheet.PageControl := PageControl;
    TabSheet.ImageIndex := IMAGE_INDEX_SQL_EDITOR;
    TabSheet.Caption := FormattedSchema;

    Result := TSQLEditorFrame.Create(TabSheet);
    Result.Parent := TabSheet;
    Result.PopupMenu := DocumentPopupActionBar;
    TableNames := Lib.SessionObjectNames(SchemaBrowserFrame.ObjectTreeFrame.Session, SchemaBrowserFrame.ObjectTreeFrame.SchemaParam);
    try
      Result.HighlighterTableNames := TableNames;
    finally
      TableNames.Free;
    end;
    Result.ObjectNames := Lib.SessionObjectNames(SchemaBrowserFrame.ObjectTreeFrame.Session,
      SchemaBrowserFrame.ObjectTreeFrame.SchemaParam, True);
    Result.Session := SchemaBrowserFrame.ObjectTreeFrame.Session;
    Result.SchemaParam := SchemaBrowserFrame.ObjectTreeFrame.SchemaParam;
    Result.UpdateMarginsAndControls;
    SetPageControlOptions;
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
      if not Confirm or AskYesOrNo(Format('End connection %s, are you sure?', [PageControl.ActivePageCaption])) then
      begin
        Result := mrYes;
        s := PageControl.ActivePageCaption;
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
          PageControl.ActivePage.Free;
          { destroy editor }
          i := 0;
          while i < PageControl.PageCount do
          begin
            if Trim(PageControl.Pages[i].Caption) = s then
              PageControl.Pages[i].Free;
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
  UpdateMarginsAndControls;
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
      SQLEditorFrame.Session.Rollback;
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
  i, j: Integer;
begin
  Screen.Cursor := crHourGlass;
  try
    j := Value.Count;
    ProgressBar.Count := j;
    ProgressBar.Show;
    SQLEditorFrame := GetActiveSQLEditor;
    if Assigned(SQLEditorFrame) then
    begin
      if SQLEditorFrame.IsCompareFilesActivePage then
      if j > 1 then
        for i := 0 to j - 1 do
        begin
          ProgressBar.StepIt;
          SQLEditorFrame.CompareFiles(Value.Strings[i]);
        end
      else
        SQLEditorFrame.CompareFiles(Value.Strings[0], True)
      else
      for i := 0 to j - 1 do
      begin
        ProgressBar.StepIt;
        SQLEditorFrame.Open(Value.Strings[i]);
      end;
    end;
  finally
    ProgressBar.Hide;
    Screen.Cursor := crDefault;
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
      if SchemaBrowserFrame.TableBrowserFrame.TablePageControl.ActivePageCaption = 'Source' then
        SchemaBrowserFrame.TableBrowserFrame.SourceSynEdit.SelectAll
      else
      if SchemaBrowserFrame.TableBrowserFrame.TablePageControl.ActivePageCaption = 'Data' then
      begin
        SchemaBrowserFrame.TableBrowserFrame.DataDBGrid.SelectedRows.SelectAll; //Selection.SelectAll;
        SchemaBrowserFrame.TableBrowserFrame.DataQueryAfterScroll(SchemaBrowserFrame.TableBrowserFrame.DataDBGrid.DataSource.DataSet);
      end;
    end
    else
    { view }
    if SchemaBrowserFrame.ViewBrowserFrame.Visible then
    begin
      if SchemaBrowserFrame.ViewBrowserFrame.ViewPageControl.ActivePageCaption = 'Source' then
        SchemaBrowserFrame.ViewBrowserFrame.SourceSynEdit.SelectAll
      else
      if SchemaBrowserFrame.ViewBrowserFrame.ViewPageControl.ActivePageCaption = 'Data' then
      begin
        SchemaBrowserFrame.ViewBrowserFrame.DataDBGrid.SelectedRows.SelectAll; //Selection.SelectAll;
        SchemaBrowserFrame.ViewBrowserFrame.DataQueryAfterScroll(SchemaBrowserFrame.ViewBrowserFrame.DataDBGrid.DataSource.DataSet);
      end;
    end
    else
    { function & procedure }
    if SchemaBrowserFrame.FuncProcBrowserFrame.Visible then
    begin
      if SchemaBrowserFrame.FuncProcBrowserFrame.FuncProcPageControl.ActivePageCaption = 'Source' then
        SchemaBrowserFrame.FuncProcBrowserFrame.SourceSynEdit.SelectAll
    end
    else
    { package }
    if SchemaBrowserFrame.PackageBrowserFrame.Visible then
    begin
      if SchemaBrowserFrame.PackageBrowserFrame.PackagePageControl.ActivePageCaption = 'Specification' then
        SchemaBrowserFrame.PackageBrowserFrame.SpecSynEdit.SelectAll;
      if SchemaBrowserFrame.PackageBrowserFrame.PackagePageControl.ActivePageCaption = 'Body' then
        SchemaBrowserFrame.PackageBrowserFrame.BodySynEdit.SelectAll
    end
    else
    { trigger }
    if SchemaBrowserFrame.TriggerBrowserFrame.Visible then
    begin
      if SchemaBrowserFrame.TriggerBrowserFrame.TriggerPageControl.ActivePageCaption = 'Source' then
        SchemaBrowserFrame.TriggerBrowserFrame.SourceSynEdit.SelectAll
    end
    else
    { sequence }
    if SchemaBrowserFrame.SequenceBrowserFrame.Visible then
    begin
      if SchemaBrowserFrame.SequenceBrowserFrame.SequencePageControl.ActivePageCaption = 'Source' then
        SchemaBrowserFrame.SequenceBrowserFrame.SourceSynEdit.SelectAll
    end
    else
    { db link }
    if SchemaBrowserFrame.DBLinkBrowserFrame.Visible then
    begin
      if SchemaBrowserFrame.DBLinkBrowserFrame.DBLinkPageControl.ActivePageCaption = 'Source' then
        SchemaBrowserFrame.DBLinkBrowserFrame.SourceSynEdit.SelectAll
    end
    else
    { user }
    if SchemaBrowserFrame.UserBrowserFrame.Visible then
    begin
      if SchemaBrowserFrame.UserBrowserFrame.UserPageControl.ActivePageCaption = 'Source' then
        SchemaBrowserFrame.UserBrowserFrame.SourceSynEdit.SelectAll
    end
  end
  else
  { sql data }
  if Assigned(SQLEditorFrame) then
  begin
    Grid := nil;
    if SQLEditorFrame.SearchForEdit.Focused then
      SQLEditorFrame.SearchForEdit.SelectAll
    else
    if SQLEditorFrame.GotoLineNumberEdit.Focused then
      SQLEditorFrame.GotoLineNumberEdit.SelectAll
    else
    if Assigned(SQLEditorFrame.OutputFrame) then
      Grid := SQLEditorFrame.OutputFrame.GetActiveGrid;
    if Assigned(Grid) and Grid.Focused then
      Grid.SelectedRows.SelectAll
    else
      SQLEditorFrame.GetActiveSynEdit.SelectAll
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

procedure TMainForm.ExecuteCurrentStatementActionExecute(Sender: TObject);
var
  SQLEditorFrame: TSQLEditorFrame;
begin
  SQLEditorFrame := GetActiveSQLEditor;
  if Assigned(SQLEditorFrame) then
    SQLEditorFrame.ExecuteCurrentStatement;
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
          (Pos(Schema, Trim(PageControl.Pages[i].Caption)) = 1) then
          Inc(Found);

      TabSheet.Caption := Schema;
      { check if connection exists }
      if Found > 0 then
        TabSheet.Caption := TabSheet.Caption + ' (' + IntToStr(Found + 1) + ')';
      TabSheet.TabVisible := True;
      PageControl.ActivePage := TabSheet;
      //PageControl.ActivePage.Repaint;
      //PageControl.Repaint;
    end
    else
    begin
      SchemaBrowserFrame.Free;
      TabSheet.Free;
      PageControl.ActivePageIndex := ActivePageIndex;
      //if Assigned(PageControl.ActivePage) then
      //  PageControl.ActivePage.Repaint;
      //PageControl.Repaint;
    end;
  except
    on E: Exception do
    begin
      ShowErrorMessage(E.Message);
      SchemaBrowserFrame.Free;
      TabSheet.Free;
    end;
  end;
  Screen.Cursor := crDefault;
  FConnecting := False;
  //Application.ProcessMessages;
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
  {if ActiveSQLDocumentFound then
  begin
    ViewWordWrapAction.Checked := SQLEditorFrame.WordWrap;
    ViewLineNumbersAction.Checked := SQLEditorFrame.LineNumbers;
    ViewSpecialCharsAction.Checked := SQLEditorFrame.SpecialChars;
    ViewSelectionModeAction.Checked := SQLEditorFrame.SelectionMode;
  end; }
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

procedure TMainForm.PageControlCloseButtonClick(Sender: TObject);
begin
  CloseTab(True);
end;

procedure TMainForm.PageControlDblClick(Sender: TObject);
begin
  if OptionsContainer.ConnectionCloseTabByDblClick then
    CloseTab(True);
end;

procedure TMainForm.PageControlMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if (Button = mbMiddle) and OptionsContainer.ConnectionCloseTabByMiddleClick then
    CloseTab(True);
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
  for i := 0 to SQLHistoryFrame.ComponentCount - 1 do
    if SQLHistoryFrame.Components[i] is TBCToolBar then
      TBCToolBar(SQLHistoryFrame.Components[i]).Repaint;
end;

procedure TMainForm.SQLHistoryActionExecute(Sender: TObject);
begin
  OpenSQLHistory;
end;

procedure TMainForm.StatusBarActionExecute(Sender: TObject);
begin
  with StatusBar do
  Visible := not Visible;
end;

end.
