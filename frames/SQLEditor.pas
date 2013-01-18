{
  Following change must be made to SynEdit.pas to get the enter working correctly.

  (*if SpaceCount2 > 0 then
  begin
  SpaceBuffer := Copy(Lines[BackCounter], 1, SpaceCount2);
  InternalCaretXY := BufferCoord(1, CaretY +1);
  for i := 1 to Length(SpaceBuffer) do
  if SpaceBuffer[i] = #9 then
  CommandProcessor(ecTab, #0, nil)
  else
  CommandProcessor(ecChar, SpaceBuffer[i], nil);
  end;*)

  =>

  if SpaceCount2 > 0 then
  Lines[CaretY] := Copy(Lines[BackCounter], 1, SpaceCount2);
  InternalCaretXY := BufferCoord(SpaceCount2 +1, CaretY +1);

  Next line must be commented:

  SynHighlighterPas, 1231: //ReadDelphiSetting(iVersionTag, tmpCommentAttri,'Comment') and

  Following change must be made (SynEdit, line 2305):

  if (eoAltSetsColumnMode in Options) and (fActiveSelectionMode <> smLine) then
  begin
  if ssAlt in Shift then
  SelectionMode := smColumn
  else
  SelectionMode := smNormal;
  end;
  =>
  if (eoAltSetsColumnMode in Options) then
  SelectionMode := smColumn
  else
  SelectionMode := smNormal;

  Added SynHighlighterWebData: Line 116: TSynWebHtmlVersion - shvUndefined (last)
  138: 'Undefined'

  Added SynHighlighterSQL: NOPARALLEL, BUILD, NONUNIQUE for Oracle



}
unit SQLEditor;

interface

uses
  Winapi.Windows, Winapi.CommDlg, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, SynEdit, Vcl.ComCtrls, Vcl.ExtCtrls, Vcl.ImgList,
  JvExComCtrls, JvComCtrls, Vcl.Menus, SynHighlighterSQL, Output, SynEditHighlighter, SynEditPrint,
  OraError, SynEditMiscClasses, SynEditSearch, SynEditTypes, SynEditPlugins, Vcl.Buttons,
  Vcl.StdCtrls, Vcl.ActnList, JvExControls, JvSpeedButton, JvExExtCtrls, JvSplitter, DAScript,
  OraScript, MemDS, DBAccess, Ora, ToolWin, JvToolBar, SynCompletionProposal, JvStringHolder,
  BCPageControl, BCPopupMenu, BCEdit, JvExStdCtrls, JvEdit, Vcl.PlatformDefaultStyleActnCtrls,
  Vcl.ActnPopup, Vcl.ActnMan, Vcl.ActnCtrls, BCToolBar, BCImageList, BCButtonedEdit, BCDBGrid,
  Vcl.Themes, Data.DB, BCCheckBox, SynEditRegexSearch;

type
  TBCSynEdit = class(TSynEdit)
  private
    FDocumentName: string;
    FFileDateTime: TDateTime;
    FOraQuery: TOraQuery;
    FPlanQuery: TOraQuery;
    FOraSQL: TOraSQL;
    FStartTime: TDateTime;
    FObjectCompletionProposal: TSynCompletionProposal;
    FObjectFieldCompletionProposal: TSynCompletionProposal;
    FInThread: Boolean;
    function GetQueryOpened: Boolean;
  protected
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
  public
    constructor Create(AOwner: TComponent); override;
    property InThread: Boolean read FInThread write FInThread;
    property DocumentName: string read FDocumentName write FDocumentName;
    property FileDateTime: TDateTime read FFileDateTime write FFileDateTime;
    property StartTime: TDateTime read FStartTime write FStartTime;
    property QueryOpened: Boolean read GetQueryOpened;
    property ObjectCompletionProposal: TSynCompletionProposal read FObjectCompletionProposal write FObjectCompletionProposal;
  end;

  TSQLEditorFrame = class(TFrame)
    SynEditPrint: TSynEditPrint;
    SynEditSearch: TSynEditSearch;
    SearchPanel: TPanel;
    SearchActionList: TActionList;
    SearchCloseAction: TAction;
    SearchFindNextAction: TAction;
    SearchFindPreviousAction: TAction;
    DocumentPanel: TPanel;
    PageControl: TBCPageControl;
    OutputPanel: TPanel;
    HorizontalSplitter: TJvSplitter;
    ToolbarPanel: TPanel;
    SynSQLSyn: TSynSQLSyn;
    OraScript: TOraScript;
    EditorPopupMenu: TBCPopupMenu;
    InsertObjectMenuItem: TMenuItem;
    ColumnsQuery: TOraQuery;
    SQLStringHolder: TJvMultiStringHolder;
    ScriptQuery: TOraQuery;
    Separator7MenuItem: TMenuItem;
    FormatSQLMenuItem: TMenuItem;
    ErrorsQuery: TOraQuery;
    ImageList: TImageList;
    BookmarkImagesList: TBCImageList;
    CutMenuItem: TMenuItem;
    CopyMenuItem: TMenuItem;
    PasteMenuItem: TMenuItem;
    Separator1MenuItem: TMenuItem;
    IncreaseIndentMenuItem: TMenuItem;
    DecreaseIndentMenuItem: TMenuItem;
    Separator4MenuItem: TMenuItem;
    SortAscendingMenuItem: TMenuItem;
    SortDescendingMenuItem: TMenuItem;
    Separator6MenuItem: TMenuItem;
    UndoMenuItem: TMenuItem;
    RedoMenuItem: TMenuItem;
    Separator2MenuItem: TMenuItem;
    SelectAllMenuItem: TMenuItem;
    Separator5MenuItem: TMenuItem;
    ToggleCaseMenuItem: TMenuItem;
    ToggleBookmarksMenuItem: TMenuItem;
    GotoBookmarksMenuItem: TMenuItem;
    Separator3MenuItem: TMenuItem;
    ClearBookmarksMenuItem: TMenuItem;
    ToggleBookmark0MenuItem: TMenuItem;
    ToggleBookmark1MenuItem: TMenuItem;
    ToggleBookmark2MenuItem: TMenuItem;
    ToggleBookmark3MenuItem: TMenuItem;
    ToggleBookmark4MenuItem: TMenuItem;
    ToggleBookmark5MenuItem: TMenuItem;
    ToggleBookmark6MenuItem: TMenuItem;
    ToggleBookmark7MenuItem: TMenuItem;
    ToggleBookmark8MenuItem: TMenuItem;
    ToggleBookmark9MenuItem: TMenuItem;
    GotoBookmark0MenuItem: TMenuItem;
    GotoBookmark1MenuItem: TMenuItem;
    GotoBookmark2MenuItem: TMenuItem;
    GotoBookmark3MenuItem: TMenuItem;
    GotoBookmark4MenuItem: TMenuItem;
    GotoBookmark5MenuItem: TMenuItem;
    GotoBookmark6MenuItem: TMenuItem;
    GotoBookmark7MenuItem: TMenuItem;
    GotoBookmark8MenuItem: TMenuItem;
    GotoBookmark9MenuItem: TMenuItem;
    SearchClearAction: TAction;
    ToolbarPopupMenu: TBCPopupMenu;
    NewOpen1: TMenuItem;
    Print1: TMenuItem;
    Directory1: TMenuItem;
    Indent1: TMenuItem;
    Sort1: TMenuItem;
    Case1: TMenuItem;
    UndoandRedo1: TMenuItem;
    Search1: TMenuItem;
    Mode1: TMenuItem;
    ools1: TMenuItem;
    Macro1: TMenuItem;
    Document1: TMenuItem;
    ToolbarPopupMenuActionList: TActionList;
    PopupMenuExecuteAction: TAction;
    PopupMenuTransactionAction: TAction;
    PopupMenuDBMSAction: TAction;
    PopupMenuExplainPlanAction: TAction;
    PopupMenuStandardAction: TAction;
    PopupMenuPrintAction: TAction;
    PopupMenuIndentAction: TAction;
    PopupMenuSortAction: TAction;
    PopupMenuCaseAction: TAction;
    PopupMenuCommandAction: TAction;
    PopupMenuSearchAction: TAction;
    PopupMenuModeAction: TAction;
    PopupMenuToolsAction: TAction;
    ools2: TMenuItem;
    ExecuteToolbarPanel: TPanel;
    ExecuteToolBar: TBCToolBar;
    ExecuteToolButton: TToolButton;
    ExecuteScriptToolButton: TToolButton;
    Toolbar1Bevel: TBevel;
    TransactionToolbarPanel: TPanel;
    CommitRollbackToolBar: TBCToolBar;
    CommitToolButton: TToolButton;
    RollbackToolButton: TToolButton;
    Bevel1: TBevel;
    DBMSToolbarPanel: TPanel;
    DBMSToolBar: TBCToolBar;
    DBMSOutputToolButton: TToolButton;
    Bevel3: TBevel;
    ExplainPlanToolbarPanel: TPanel;
    PlanToolBar: TBCToolBar;
    ExplainPlanToolButton: TToolButton;
    Bevel4: TBevel;
    StandardToolbarPanel: TPanel;
    StandardToolBar: TBCToolBar;
    FileNewToolButton: TToolButton;
    FileOpenToolButton: TToolButton;
    FileCloseToolButton: TToolButton;
    FileCloseAllToolButton: TToolButton;
    Bevel5: TBevel;
    PrintToolbarPanel: TPanel;
    PrintToolBar: TBCToolBar;
    FilePrintToolButton: TToolButton;
    FilePrintPreviewToolButton: TToolButton;
    Bevel7: TBevel;
    IndentToolbarPanel: TPanel;
    IncreaseToolBar: TBCToolBar;
    EditIncreaseIndentToolButton: TToolButton;
    EditDecreaseIndentToolButton: TToolButton;
    Bevel8: TBevel;
    SortToolbarPanel: TPanel;
    SortToolBar: TBCToolBar;
    EditSortAscToolButton: TToolButton;
    EditSortDescToolButton: TToolButton;
    Bevel9: TBevel;
    CaseToolbarPanel: TPanel;
    CaseToolBar: TBCToolBar;
    EditToggleCaseToolButton: TToolButton;
    Bevel10: TBevel;
    CommandToolbarPanel: TPanel;
    UndoRedoToolBar: TBCToolBar;
    EditUndoToolButton: TToolButton;
    EditRedoToolButton: TToolButton;
    Bevel11: TBevel;
    SearchToolbarPanel: TPanel;
    SearchToolBar: TBCToolBar;
    SearchToolButton: TToolButton;
    SearchReplaceToolButton: TToolButton;
    SearchFindInFilesToolButton: TToolButton;
    Bevel13: TBevel;
    ModeToolbarPanel: TPanel;
    ViewToolBar: TBCToolBar;
    ViewWordWrapToolButton: TToolButton;
    ViewLineNumbersToolButton: TToolButton;
    ViewSpecialCharsToolButton: TToolButton;
    ViewSelectionModeToolButton: TToolButton;
    Bevel14: TBevel;
    ToolsToolBarPanel: TPanel;
    CompareToolBar: TBCToolBar;
    ToolsCompareFilesToolButton: TToolButton;
    SaveToolBar: TBCToolBar;
    FileSaveToolButton: TToolButton;
    FileSaveAsToolButton: TToolButton;
    FileSaveAllToolButton: TToolButton;
    Bevel6: TBevel;
    ToggleBookmarkMenuItem: TMenuItem;
    ImageList25: TBCImageList;
    ImageList50: TBCImageList;
    SearchPanel2: TPanel;
    SearchForLabel: TLabel;
    SearchPanel3: TPanel;
    SearchForEdit: TBCEdit;
    SearchPanel1: TPanel;
    JvSpeedButton1: TSpeedButton;
    SearchPanel4: TPanel;
    JvSpeedButton2: TSpeedButton;
    SearchPanel5: TPanel;
    SpeedButton1: TSpeedButton;
    SearchPanel6: TPanel;
    SpeedButton2: TSpeedButton;
    SearchPanel7: TPanel;
    CaseSensitiveCheckBox: TBCCheckBox;
    CaseSensitiveLabel: TLabel;
    Panel1: TPanel;
    WholeWordsCheckBox: TBCCheckBox;
    WholeWordsOnlyLabel: TLabel;
    Panel2: TPanel;
    RegularExpressionCheckBox: TBCCheckBox;
    RegularExpressionLabel: TLabel;
    SynEditRegexSearch: TSynEditRegexSearch;
    procedure SynEditChange(Sender: TObject);
    procedure SynEditorReplaceText(Sender: TObject; const ASearch,
      AReplace: UnicodeString; Line, Column: Integer;
      var Action: TSynReplaceAction);
    procedure PageControlChange(Sender: TObject);
    procedure SearchForEditChange(Sender: TObject);
    procedure SearchCloseActionExecute(Sender: TObject);
    procedure SearchFindNextActionExecute(Sender: TObject);
    procedure SearchFindPreviousActionExecute(Sender: TObject);
    procedure OutputDblClickActionExecute(Sender: TObject);
    procedure OraScriptError(Sender: TObject; E: Exception; SQL: string; var Action: TErrorAction);
    procedure OraSQLAfterExecuteEvent(Sender: TObject; Result: Boolean);
    procedure OraScriptAfterExecuteEvent(Sender: TObject; SQL: string);
    procedure ObjectFieldCompletionProposalExecute(Kind: SynCompletionType; Sender: TObject;
      var CurrentInput: UnicodeString; var x, y: Integer; var CanExecute: Boolean);
    procedure DBMSOutputTimer(Sender: TObject);
    procedure OraSessionError(Sender: TObject; E: EDAError; var Fail: Boolean);
    procedure SynEditPaintTransient(Sender: TObject; Canvas: TCanvas; TransientType: TTransientType);
    procedure ToggleBookmark0MenuItemClick(Sender: TObject);
    procedure GotoBookmark0MenuItemClick(Sender: TObject);
    procedure SearchClearActionExecute(Sender: TObject);
    procedure PopupMenuExecuteActionExecute(Sender: TObject);
    procedure PopupMenuTransactionActionExecute(Sender: TObject);
    procedure PopupMenuDBMSActionExecute(Sender: TObject);
    procedure PopupMenuExplainPlanActionExecute(Sender: TObject);
    procedure PopupMenuStandardActionExecute(Sender: TObject);
    procedure PopupMenuPrintActionExecute(Sender: TObject);
    procedure PopupMenuIndentActionExecute(Sender: TObject);
    procedure PopupMenuSortActionExecute(Sender: TObject);
    procedure PopupMenuCaseActionExecute(Sender: TObject);
    procedure PopupMenuCommandActionExecute(Sender: TObject);
    procedure PopupMenuSearchActionExecute(Sender: TObject);
    procedure PopupMenuModeActionExecute(Sender: TObject);
    procedure PopupMenuToolsActionExecute(Sender: TObject);
    procedure SynEditSpecialLineColors(Sender: TObject; Line: Integer; var Special: Boolean;
      var FG, BG: TColor);
  private
    { Private declarations }
    FInTransaction: Boolean;
    FNumberOfNewDocument: Integer;
    FOutputFrame: TOutputFrame;
    FSession: TOraSession;
    FObjectNames: TStrings;
    FSchemaParam: string;
    FDBMSTimer: TTimer;
    FSynEditsList: TList;
    FCompareImageIndex, FNewImageIndex: Integer;
    function CreateNewTabSheet(FileName: string = ''): TBCSynEdit;
    function GetActiveTabSheetCaption: string;
    function GetActiveDocumentName: string;
    function GetActiveDocumentFound: Boolean;
    function GetSynEdit(TabSheet: TTabSheet): TBCSynEdit;
    function Save(TabSheet: TTabSheet; ShowDialog: Boolean = False): string;
      overload;
    procedure InitializeSynEditPrint;
    function GetOpenTabSheets: Boolean;
    function GetSelectionFound: Boolean;
    function GetCanUndo: Boolean;
    function GetCanRedo: Boolean;
    function CanFindNextPrevious: Boolean;
    function SearchOptions(IncludeBackwards: Boolean): TSynSearchOptions;
    function FindOpenFile(FileName: string): TBCSynEdit;
    procedure SetBookmarks(SynEdit: TBCSynEdit; Bookmarks: TStrings);
    procedure DoSearch;
    function GetFileDateTime(FileName: string): TDateTime;
    procedure SetHighlighterTableNames(Value: TStrings);
    procedure ExecuteStatement(SynEdit: TBCSynEdit); overload;
    procedure ExecuteNoRowsStatement(SynEdit: TBCSynEdit);
    procedure SetSession(Value: TOraSession);
    procedure EnableDBMSOutput;
    procedure GetDBMSOutput;
    procedure WriteHistory(OraSession: TOraSession; SQL: WideString);
    function GetDataQueryOpened: Boolean;
    function CreateSession(OraSession: TOraSession): TOraSession;
    procedure GetUserErrors;
    function RemoveComments(s: WideString): WideString; //SynEdit: TBCSynEdit): WideString;
    function RemoveParenthesisFromBegin(Text: WideString): WideString;
    function GetOutputGridHasFocus: Boolean;
    function GetActivePageCaption: string;
    procedure GetText(Sender: TField; var Text: String; DisplayText: Boolean);
    procedure SetClobAndTimestampFields(OraQuery: TOraQuery);
    function GetActiveDocumentModified: Boolean;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure New;
    procedure Open(FileName: string = ''; Bookmarks: TStrings = nil;
      Ln: Integer = 0; Ch: Integer = 0);
    procedure Close(IncludeCancel: Boolean = True);
    function CloseAll(CloseDocuments: Boolean = True; IncludeCancel: Boolean = True): Integer;
    procedure CloseAllOtherPages;
    procedure Save; overload;
    function SaveAs: string;
    procedure SaveAll;
    procedure Undo;
    procedure Redo;
    procedure Cut;
    procedure CopyToClipboard;
    procedure Paste;
    procedure Print;
    procedure PrintPreview;
    procedure Search;
    procedure FindNext;
    procedure FindPrevious;
    procedure Replace;
    procedure ToggleBookMark;
    procedure NextPage;
    procedure PreviousPage;
    procedure CheckFileDateTimes;
    procedure Refresh(Page: Integer);
    function WordWrap: Boolean;
    function ToggleWordWrap: Boolean;
    function ToggleLineNumbers: Boolean;
    function LineNumbers: Boolean;
    function ToggleSpecialChars: Boolean;
    function SpecialChars: Boolean;
    function ToggleSelectionMode: Boolean;
    function SelectionMode: Boolean;
    procedure CompareFiles(FileName: string = '');
    procedure SelectForCompare;
    function ActiveSynEdit: TBCSynEdit;
    function GetCaretInfo: string;
    function GetModifiedInfo: string;
    function ModifiedDocuments(CheckActive: Boolean = True): Boolean;
    procedure AssignOptions;
    property ActiveTabSheetCaption: string read GetActiveTabSheetCaption;
    property ActiveDocumentName: string read GetActiveDocumentName;
    property ActiveDocumentFound: Boolean read GetActiveDocumentFound;
    property ActiveDocumentModified: Boolean read GetActiveDocumentModified;
    property OpenTabSheets: Boolean read GetOpenTabSheets;
    // property ModifiedDocuments: Boolean read GetModifiedDocuments;
    property SelectionFound: Boolean read GetSelectionFound;
    property CanUndo: Boolean read GetCanUndo;
    property CanRedo: Boolean read GetCanRedo;
    property HighlighterTableNames: TStrings write SetHighlighterTableNames;
    property OutputFrame: TOutputFrame read FOutputFrame write FOutputFrame;
    property Session: TOraSession read FSession write SetSession;
    property ObjectNames: TStrings write FObjectNames;
    property SchemaParam: string read FSchemaParam write FSchemaParam;
    property DataQueryOpened: Boolean read GetDataQueryOpened;
    property OutputGridHasFocus: Boolean read GetOutputGridHasFocus;
    property InTransaction: Boolean read FInTransaction write FInTransaction;
    procedure ExecuteStatement; overload;
    procedure ExecuteScript;
    procedure ShowObjects;
    procedure ExplainPlan;
    procedure DecreaseIndent;
    procedure IncreaseIndent;
    procedure ToggleCase;
    procedure SortAsc;
    procedure SortDesc;
    procedure ClearBookmarks;
    procedure InsertLine;
    procedure DeleteWord;
    procedure DeleteLine;
    procedure DeleteEOL;
    procedure UpdateGuttersAndControls(DoubleBuffered: Boolean);
    procedure RepaintToolButtons;
    function IsCompareFilesActivePage: Boolean;
  end;

implementation

{$R *.dfm}

uses
  SynEditKeyCmds, PrintPreview, Replace, ConfirmReplace, Lib, StyleHooks,
  Options, SynTokenMatch, SynHighlighterWebMisc, SynHighlighterWebData,
  Compare, Types, Parameters, SQLTokenizer, SQLProgress, QueryProgress, Main,
  AnsiStrings, ShellAPI, WideStrings, Common, Vcl.GraphUtil, CommonDialogs, Language;

const
  DEFAULT_FILENAME = 'Sql';

{ TBCSynEdit }

constructor TBCSynEdit.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Width := 0;
  Height := 0;
end;

function TBCSynEdit.GetQueryOpened: Boolean;
begin
  Result := (not InThread) and Assigned(FOraQuery) and FOraQuery.Session.Connected and FOraQuery.Active;
end;

{ TDocumentFrame }

function TSQLEditorFrame.GetDataQueryOpened: Boolean;
begin
  Result := ActiveSynEdit.QueryOpened and Assigned(FOutputFrame) and (FOutputFrame.PageControl.PageCount > 0) and (FOutputFrame.PageControl.ActivePage.ImageIndex = IMAGE_INDEX_GRID);
end;

function TSQLEditorFrame.GetOutputGridHasFocus: Boolean;
var
  Grid: TBCDBGrid;
begin
  Result := False;
  if Assigned(FOutputFrame) then
  begin
    Grid := FOutputFrame.GetActiveGrid;
    Result := Assigned(Grid) and Grid.Focused;
  end;
end;

procedure TSQLEditorFrame.SetSession(Value: TOraSession);
begin
  FSession := Value;
  ColumnsQuery.Session := Value;
  ErrorsQuery.Session := Value;
end;

constructor TSQLEditorFrame.Create(AOwner: TComponent);
var
  SysImageList: THandle;
  SHFileInfo: TSHFileInfo;
  PathInfo: String;
  Icon: TIcon;
begin
  inherited Create(AOwner);
  FNumberOfNewDocument := 0;
  FInTransaction := False;
  FOutputFrame := TOutputFrame.Create(OutputPanel);
  FOutputFrame.Parent := OutputPanel;
  FOutputFrame.OnTabsheetDblClick := OutputDblClickActionExecute;
  { IDE can lose these, if the main form is not open }
  EditorPopupMenu.Images := MainForm.MenuImageList;
  CutMenuItem.Action := MainForm.EditCutAction;
  CopyMenuItem.Action := MainForm.EditCopyAction;
  PasteMenuItem.Action := MainForm.EditPasteAction;
  SelectAllMenuItem.Action := MainForm.EditSelectAllAction;
  UndoMenuItem.Action := MainForm.EditUndoAction;
  RedoMenuItem.Action := MainForm.EditRedoAction;
  IncreaseIndentMenuItem.Action := MainForm.EditIncreaseIndentAction;
  DecreaseIndentMenuItem.Action := MainForm.EditDecreaseIndentAction;
  SortAscendingMenuItem.Action := MainForm.EditSortAscAction;
  SortDescendingMenuItem.Action := MainForm.EditSortDescAction;
  ToggleCaseMenuItem.Action := MainForm.EditToggleCaseAction;
  InsertObjectMenuItem.Action := MainForm.InsertObjectAction;
  FormatSQLMenuItem.Action := MainForm.FormatSQLAction;
  ExecuteToolBar.Images := MainForm.MenuImageList;
  CommitRollbackToolBar.Images := MainForm.MenuImageList;
  DBMSToolBar.Images := MainForm.MenuImageList;
  PlanToolBar.Images := MainForm.MenuImageList;
  StandardToolBar.Images := MainForm.MenuImageList;
  SaveToolBar.Images := MainForm.MenuImageList;
  PrintToolBar.Images := MainForm.MenuImageList;
  IncreaseToolBar.Images := MainForm.MenuImageList;
  SortToolBar.Images := MainForm.MenuImageList;
  CaseToolBar.Images := MainForm.MenuImageList;
  UndoRedoToolBar.Images := MainForm.MenuImageList;
  SearchToolBar.Images := MainForm.MenuImageList;
  ViewToolBar.Images := MainForm.MenuImageList;
  CompareToolBar.Images := MainForm.MenuImageList;

  ExecuteToolButton.Action := MainForm.ExecuteStatementAction;
  ExecuteScriptToolButton.Action := MainForm.ExecuteScriptAction;
  CommitToolButton.Action := MainForm.DatabaseCommitAction;
  RollbackToolButton.Action := MainForm.DatabaseRollbackAction;
  DBMSOutputToolButton.Action := MainForm.DBMSOutputAction;
  ExplainPlanToolButton.Action := MainForm.ExplainPlanAction;
  FileNewToolButton.Action := MainForm.FileNewAction;
  FileOpenToolButton.Action := MainForm.FileOpenAction;
  FileCloseToolButton.Action := MainForm.FileCloseAction;
  FileCloseAllToolButton.Action := MainForm.FileCloseAllAction;
  FileSaveToolButton.Action := MainForm.FileSaveAction;
  FileSaveAsToolButton.Action := MainForm.FileSaveAsAction;
  FileSaveAllToolButton.Action := MainForm.FileSaveAllAction;
  FilePrintToolButton.Action := MainForm.FilePrintAction;
  FilePrintPreviewToolButton.Action := MainForm.FilePrintPreviewAction;
  EditIncreaseIndentToolButton.Action := MainForm.EditIncreaseIndentAction;
  EditDecreaseIndentToolButton.Action := MainForm.EditDecreaseIndentAction;
  EditSortAscToolButton.Action := MainForm.EditSortAscAction;
  EditSortDescToolButton.Action := MainForm.EditSortDescAction;
  EditToggleCaseToolButton.Action := MainForm.EditToggleCaseAction;
  EditUndoToolButton.Action := MainForm.EditUndoAction;
  EditRedoToolButton.Action := MainForm.EditRedoAction;
  ViewSelectionModeToolButton.Action := MainForm.ViewSelectionModeAction;
  SearchToolButton.Action := MainForm.SearchAction;
  SearchReplaceToolButton.Action := MainForm.SearchReplaceAction;
  SearchFindInFilesToolButton.Action := MainForm.SearchFindInFilesAction;
  ViewWordWrapToolButton.Action := MainForm.ViewWordWrapAction;
  ViewLineNumbersToolButton.Action := MainForm.ViewLineNumbersAction;
  ViewSpecialCharsToolButton.Action := MainForm.ViewSpecialCharsAction;
  ToolsCompareFilesToolButton.Action := MainForm.ToolsCompareFilesAction;
  ToggleBookmarkMenuItem.Action := MainForm.SearchToggleBookmarkAction;

  FSynEditsList := TList.Create;

  PageControl.Images := TImageList.Create(Self);
  SysImageList := SHGetFileInfo(PChar(PathInfo), 0, SHFileInfo, SizeOf(TSHFileInfo), SHGFI_SYSICONINDEX or SHGFI_SMALLICON);
  if SysImageList <> 0 then
  begin
    PageControl.Images.Handle := SysImageList;
    PageControl.Images.BkColor := ClNone;
    PageControl.Images.ShareImages := True;
  end;

  { compare and new image index }
  Icon := TIcon.Create;
  try
    { windows font size causing problems here!
      Icon size will be smaller than PageControl.Images size }
    try
      { smaller }
      ImageList.GetIcon(0, Icon);
      FCompareImageIndex := PageControl.Images.AddIcon(Icon);
      ImageList.GetIcon(1, Icon);
      FNewImageIndex := PageControl.Images.AddIcon(Icon);
    except
      try
        { medium }
        ImageList25.GetIcon(0, Icon);
        FCompareImageIndex := PageControl.Images.AddIcon(Icon);
        ImageList25.GetIcon(1, Icon);
        FNewImageIndex := PageControl.Images.AddIcon(Icon);
      except
        try
          { larger }
          ImageList50.GetIcon(0, Icon);
          FCompareImageIndex := PageControl.Images.AddIcon(Icon);
          ImageList50.GetIcon(1, Icon);
          FNewImageIndex := PageControl.Images.AddIcon(Icon);
        except

        end;
      end;
    end;
  finally
    Icon.Free;
  end;
end;

destructor TSQLEditorFrame.Destroy;
begin
  FreeAndNil(FSynEditsList);

  PageControl.Images.Free;

  inherited Destroy;
end;

function GetIconIndex(Name: string; Flags: Cardinal): Integer;
var
  SFI: TSHFileInfo;
begin
  if SHGetFileInfo(PChar(Name), 0, SFI, SizeOf(TSHFileInfo), Flags) = 0 then
    Result := -1
  else
    Result := SFI.iIcon;
end;

function GetImageIndex(Path: string): integer;
begin
  Result := GetIconIndex(Path, SHGFI_SYSICONINDEX or SHGFI_SMALLICON);
end;

function TSQLEditorFrame.CreateNewTabSheet(FileName: string = ''): TBCSynEdit;
var
  TabSheet: TTabSheet;
  Panel: TPanel;
  SynEdit: TBCSynEdit;
begin
  { create a TabSheet }
  TabSheet := TTabSheet.Create(PageControl);
  TabSheet.PageControl := PageControl;
    if FileName <> '' then
    TabSheet.ImageIndex := GetImageIndex(FileName) // SAVED_IMAGEINDEX;
  else
    TabSheet.ImageIndex := FNewImageIndex;
  // TabSheet.DoubleBuffered := True;
  { set the Caption property }
  if FileName = '' then
    TabSheet.Caption := DEFAULT_FILENAME + IntToStr(FNumberOfNewDocument)
  else
    TabSheet.Caption := ExtractFileName(FileName);
  PageControl.ActivePage := TabSheet;
  { create a Panel }
  Panel := TPanel.Create(TabSheet);
  with Panel do
  begin
    Parent := TabSheet;
    Align := alClient;
    BevelOuter := bvNone;
    Caption := '';
    DoubleBuffered := False;
    Padding.Left := 1;
    Padding.Top := 1;
    if TStyleManager.ActiveStyle.Name = 'Windows' then
      Padding.Right := 3
    else
      Padding.Right := 1;
    Padding.Bottom := 2;
    ParentColor := True;
    ParentDoubleBuffered := False;
  end;
  { create a SynEdit }
  SynEdit := TBCSynEdit.Create(Panel);
  with SynEdit do
  begin
    Visible := False;
    Align := alClient;
    Parent := Panel;
    DocumentName := FileName;
    FileDateTime := GetFileDateTime(FileName);
    Font.Charset := DEFAULT_CHARSET;
    Font.Color := clWindowText;
    Font.Height := -13;
    Font.Name := 'Courier New';
    Font.Style := [];
    Gutter.AutoSize := True;
    Gutter.Font.Charset := DEFAULT_CHARSET;
    Gutter.Font.Color := clWindowText;
    Gutter.Font.Height := -11;
    Gutter.Font.Name := 'Courier New';
    Gutter.Font.Style := [];
    Gutter.ShowLineNumbers := True;
    Gutter.Gradient := False;
    WantTabs := True;
    Options := [eoAutoIndent, eoDragDropEditing, eoEnhanceEndKey, eoGroupUndo,
      eoShowScrollHint, eoSmartTabDelete, eoSmartTabs, eoTabsToSpaces,
      eoTrimTrailingSpaces, eoScrollPastEol, eoSpecialLineDefaultFg];
    OnChange := SynEditChange;
    OnReplaceText := SynEditorReplaceText;
    OnSpecialLineColors := SynEditSpecialLineColors;
    SearchEngine := SynEditSearch;
    ActiveLineColor := clSkyBlue;
    Highlighter := SynSQLSyn;
    PopupMenu := EditorPopupMenu;
    OnPaintTransient := SynEditPaintTransient;
    BookMarkOptions.BookmarkImages := BookmarkImagesList;
  end;
  UpdateGutter(SynEdit);
  TStyleManager.Engine.RegisterStyleHook(TCustomSynEdit, TSynEditStyleHook); //TMemoStyleHook);
  FSynEditsList.Add(SynEdit);
  OptionsContainer.AssignTo(SynEdit);
  PageControl.MultiLine := OptionsContainer.MultiLine;

  SynEdit.FObjectCompletionProposal := TSynCompletionProposal.Create(nil);
  with SynEdit.FObjectCompletionProposal do
  begin
    Editor := SynEdit;
    ShortCut := TextToShortCut('Ctrl+O');
    Options := Options + [scoUseInsertList, scoCompleteWithTab, scoCompleteWithEnter, scoLimitToMatchedText];
    InsertList.Assign(SynSQLSyn.TableNames);
    ItemList.Assign(FObjectNames);
  end;

  SynEdit.FObjectFieldCompletionProposal := TSynCompletionProposal.Create(nil);
  with SynEdit.FObjectFieldCompletionProposal do
  begin
    Editor := SynEdit;
    Options := Options + [scoUseInsertList, scoUseBuiltInTimer, scoCompleteWithTab, scoCompleteWithEnter, scoLimitToMatchedText];
    TimerInterval := 500;
    TriggerChars := '.';
    //InsertList.Assign(SynSQLSyn.TableNames);
    //ItemList.Assign(SynSQLSyn.TableNames);
    OnExecute := ObjectFieldCompletionProposalExecute
  end;

  if Filename <> '' then
    SynEdit.Lines.LoadFromFile(FileName);
  Application.ProcessMessages;
  SynEdit.Visible := True;
  try
    SynEdit.SetFocus;
  except
    { not possible if tab is not visible }
  end;

  Result := SynEdit;
end;

procedure TSQLEditorFrame.UpdateGuttersAndControls(DoubleBuffered: Boolean);
var
  i, j: Integer;
begin
  PageControl.DoubleBuffered := DoubleBuffered;

  FOutputFrame.UpdateControls;
  for i := 0 to FSynEditsList.Count - 1 do
    UpdateGutter(TBCSynEdit(FSynEditsList.Items[i]));
  for i := 0 to PageControl.PageCount - 1 do
    for j := 0 to PageControl.Pages[i].ComponentCount - 1 do
      if PageControl.Pages[i].Components[j] is TPanel then
      begin
        if TStyleManager.ActiveStyle.Name = 'Windows' then
          TPanel(PageControl.Pages[i].Components[j]).Padding.Right := 3
        else
          TPanel(PageControl.Pages[i].Components[j]).Padding.Right := 1;
      end;

  UpdateSQLSynColors(SynSQLSyn);
end;

procedure TSQLEditorFrame.SynEditSpecialLineColors(Sender: TObject; Line: Integer;
  var Special: Boolean; var FG, BG: TColor);
begin
  if not TBCSynEdit(Sender).SelAvail then
    if TBCSynEdit(Sender).CaretY = Line then
    begin
      Special := True;
      if StyleServices.Enabled then
        BG := LightenColor(TBCSynEdit(Sender).Color);
    end;
end;

procedure TSQLEditorFrame.SynEditPaintTransient(Sender: TObject; Canvas: TCanvas; TransientType: TTransientType);
var Editor : TSynEdit;
    OpenChars: array [0..0] of WideChar;
    CloseChars: array [0..0] of WideChar;

  function IsCharBracket(AChar: WideChar): Boolean;
  begin
    case AChar of
     '(', ')':
        Result := True;
      else
        Result := False;
    end;
  end;

  function CharToPixels(P: TBufferCoord): TPoint;
  begin
    Result := Editor.RowColumnToPixels(Editor.BufferToDisplayPos(P));
  end;

var
  P, PM: TBufferCoord;
  Pix: TPoint;
  D : TDisplayCoord;
  S: UnicodeString;
  I: Integer;
  Attri: TSynHighlighterAttributes;
  ArrayLength: Integer;
  start: Integer;
  TmpCharA, TmpCharB: WideChar;
begin
  if TSynEdit(Sender).SelAvail then
    Exit;
  Editor := TSynEdit(Sender);

  ArrayLength:= 1;

  for i := 0 to ArrayLength - 1 do
    Case i of
      0: begin OpenChars[i] := '('; CloseChars[i] := ')'; end;
    end;

  P := Editor.CaretXY;
  D := Editor.DisplayXY;

  Start := Editor.SelStart;

  if (Start > 0) and (Start <= length(Editor.Text)) then
    TmpCharA := Editor.Text[Start]
  else
    TmpCharA := #0;

  if (Start < length(Editor.Text)) then
    TmpCharB := Editor.Text[Start + 1]
  else
    TmpCharB := #0;

  if not IsCharBracket(TmpCharA) and not IsCharBracket(TmpCharB) then
    Exit;

  S := TmpCharB;
  if not IsCharBracket(TmpCharB) then
  begin
    P.Char := P.Char - 1;
    S := TmpCharA;
  end;
  Editor.GetHighlighterAttriAtRowCol(P, S, Attri);

  PM := Editor.GetMatchingBracketEx(P);

  if TransientType = SynEdit.ttBefore then
  begin
    Editor.InvalidateLines(P.Line, PM.Line);
    Exit;
  end;

  if (Editor.Highlighter.SymbolAttribute = Attri) then
  begin
    for i := low(OpenChars) to High(OpenChars) do
    begin
      if (S = OpenChars[i]) or (S = CloseChars[i]) then
      begin
        Pix := CharToPixels(P);

        Canvas.Font.Assign(Editor.Font);
        Canvas.Font.Style := Attri.Style;

        if (TransientType = SynEdit.ttAfter) then
        begin
          Canvas.Font.Color := clNone;
          Canvas.Brush.Color := clAqua;
        end;

        Canvas.TextOut(Pix.X, Pix.Y, S);


        if (PM.Char > 0) and (PM.Line > 0) then
        begin
          Pix := CharToPixels(PM);
          if Pix.X > Editor.Gutter.Width then
          begin
            if S = OpenChars[i] then
              Canvas.TextOut(Pix.X, Pix.Y, CloseChars[i])
            else
              Canvas.TextOut(Pix.X, Pix.Y, OpenChars[i]);
          end;
        end;
      end; //if
    end;//for i :=
  end;
end;

procedure TSQLEditorFrame.ObjectFieldCompletionProposalExecute(Kind: SynCompletionType; Sender: TObject;
  var CurrentInput: UnicodeString; var x, y: Integer; var CanExecute: Boolean);
var
//  Line: Integer;
  Proposal: TSynCompletionProposal;
  Tablename: string;
  Input: string;
  SQLTokenizer: TSQLTokenizer;
begin
  CanExecute := False;
  Proposal := Sender as TSynCompletionProposal;

  SQLTokenizer := TSQLTokenizer.Create;
  try
    Input := System.Copy(Proposal.Editor.LineText, 0, Proposal.Editor.CaretX - 2);
    while Pos(' ', Input) <> 0 do
      Input := System.Copy(Input, Pos(' ', Input) + 1, Length(Input));

    while Pos('(', Input) <> 0 do  // example function(alias.
      Input := System.Copy(Input, Pos('(', Input) + 1, Length(Input));

    SQLTokenizer.SetText(Proposal.Editor.Text);
    while (not SQLTokenizer.Eof) and not SQLTokenizer.TokenStrIs('FROM') do
      SQLTokenizer.Next;
    SQLTokenizer.Next; // FROM
    while not SQLTokenizer.Eof do
    begin
      if (Trim(SQLTokenizer.TokenStr) = '') or SQLTokenizer.TokenStrIs('AS') then
        SQLTokenizer.Next
      else
      begin
        Tablename := String(SQLTokenizer.TokenStr);
        SQLTokenizer.Next;
        while (not SQLTokenizer.Eof) and ((Trim(SQLTokenizer.TokenStr) = '') or SQLTokenizer.TokenStrIs('AS')) do
          SQLTokenizer.Next;
        if Input = String(SQLTokenizer.TokenStr) then
        begin
          with ColumnsQuery do
          begin
            if not Session.Connected then
            begin
              Session.ConnectPrompt := False;
              Session.Connect;
              Session.ConnectPrompt := True;
            end;
            ParamByName('P_OBJECT_NAME').AsString := UpperCase(Tablename);
            ParamByName('P_OWNER').AsWideString := FSchemaParam;
            Prepare;
            Open;
            Proposal.InsertList.Clear;
            Proposal.ItemList.Clear;
            while not Eof do
            begin
              Proposal.InsertList.Add(FieldByName('COLUMN_NAME').AsWideString);
              Proposal.ItemList.Add(FieldByName('ITEM').AsWideString);
              Next;
            end;
            Close;
            UnPrepare;
          end;
          CanExecute := True;
          Break;
        end;
      end;
     end;
  finally
    SQLTokenizer.Free;
  end;
end;

procedure TSQLEditorFrame.CompareFiles(FileName: string);
var
  i: Integer;
  TabSheet: TTabSheet;
  Frame: TCompareFrame;
  TempList: TStringList;
  SynEdit: TBCSynEdit;
  Panel: TPanel;
begin
  { create list of open documents }
  TempList := TStringList.Create;
  for i := 0 to PageControl.PageCount - 1 do
  begin
    SynEdit := GetSynEdit(PageControl.Pages[i]);
    if Assigned(SynEdit) then
      TempList.Add(SynEdit.DocumentName);
  end;
  if Filename <> '' then
  begin
    { find compare tab }
    for i := 0 to PageControl.PageCount - 1 do
      if PageControl.Pages[i].ImageIndex = FCompareImageIndex then
      begin
        Frame := TCompareFrame(PageControl.Pages[i].Components[0].Components[0]);
        { if there already are two files to compare then continue }
        if Frame.ComparedFilesSet then
          Continue
        else
        begin
          { else set file and exit}
          PageControl.ActivePageIndex := i;
          Frame.SetCompareFile(Filename);
          Exit;
        end;
      end;
  end;
  { create a TabSheet }
  TabSheet := TTabSheet.Create(PageControl);
  TabSheet.PageControl := PageControl;
  TabSheet.ImageIndex := FCompareImageIndex;
  TabSheet.Caption := 'Compare Files';
  PageControl.ActivePage := TabSheet;
  Panel := TPanel.Create(TabSheet);
  with Panel do
  begin
    Parent := TabSheet;
    Align := alClient;
    BevelOuter := bvNone;
    Caption := '';
    DoubleBuffered := False;
    Padding.Left := 1;
    Padding.Top := 1;
    Padding.Right := 3;
    Padding.Bottom := 2;
    ParentColor := True;
    ParentDoubleBuffered := False;
  end;
  { create a compare frame }
  Frame := TCompareFrame.Create(Panel);
  with Frame do
  begin
    Parent := TabSheet;
    Align := alClient;
    OpenDocumentsList := TempList;
    SetCompareFile(Filename);
  end;
  PageControl.ActivePage.Repaint;
  PageControl.Repaint;
end;

procedure TSQLEditorFrame.SelectForCompare;
begin
  CompareFiles(ActiveSynEdit.DocumentName);
end;

procedure TBCSynEdit.KeyDown(var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Shift = [ssAlt] then
  begin
    if SelectionMode = smNormal then
      SelectionMode := smColumn
    else
      SelectionMode := smNormal
  end;
end;

function TSQLEditorFrame.FindOpenFile(FileName: string): TBCSynEdit;
var
  i: Integer;
  SynEdit: TBCSynEdit;
begin
  Result := nil;
  for i := 0 to PageControl.PageCount - 1 do
  begin
    SynEdit := GetSynEdit(PageControl.Pages[i]);
    if Assigned(SynEdit) then
      if CompareText(UpperCase(SynEdit.DocumentName), UpperCase(FileName))
        = 0 then
      begin
        PageControl.ActivePage := PageControl.Pages[i];
        Result := SynEdit;
        Break;
      end;
  end;
end;

procedure TSQLEditorFrame.New;
begin
  Inc(FNumberOfNewDocument);
  CreateNewTabSheet;
end;

procedure TSQLEditorFrame.SetBookmarks(SynEdit: TBCSynEdit; Bookmarks: TStrings);
var
  i: Integer;
  Temp: string;
  BookmarkNumber, Ln, Ch: Integer;
begin
  if Assigned(Bookmarks) then
  begin
    for i := 0 to Bookmarks.Count - 1 do
    begin
      Temp := Bookmarks.Strings[i];
      if Pos(SynEdit.DocumentName, Temp) <> 0 then
      begin
        Temp := System.Copy(Temp, Pos('=', Temp) + 1, Length(Temp));
        BookmarkNumber := StrToInt(System.Copy(Temp, 1, Pos(';', Temp) - 1));
        Temp := System.Copy(Temp, Pos(';', Temp) + 1, Length(Temp));
        Ln := StrToInt(System.Copy(Temp, 1, Pos(';', Temp) - 1));
        Temp := System.Copy(Temp, Pos(';', Temp) + 1, Length(Temp));
        Ch := StrToInt(Temp);

        SynEdit.SetBookMark(BookmarkNumber, Ch, Ln);
      end;
    end;
  end;
end;

procedure TSQLEditorFrame.Open(FileName: string = ''; Bookmarks: TStrings = nil;
  Ln: Integer = 0; Ch: Integer = 0);
var
  i: Integer;
  SynEdit: TBCSynEdit;
begin
  if FileName = '' then
  begin
    if CommonDialogs.OpenFiles(Handle, '',
      Format('%s'#0'*.*'#0, [LanguageDataModule.GetConstant('AllFiles')]) + 'SQL files (*.sql)'#0'*.sql'#0#0, LanguageDataModule.GetConstant('Open')) then
    begin
      Application.ProcessMessages; { style fix }
      for i := 0 to CommonDialogs.Files.Count - 1 do
        Open(CommonDialogs.Files[i])
    end;
  end
  else
  begin
    if FileExists(FileName) then
    begin
      SynEdit := FindOpenFile(FileName);
      if not Assigned(SynEdit) then
        SynEdit := CreateNewTabSheet(FileName);
      SynEdit.CaretXY := BufferCoord(Ch, Ln);
      SetBookmarks(SynEdit, Bookmarks);
      try
        PageControl.ActivePage.Repaint;
        PageControl.Repaint;
        SynEdit.SetFocus;
      except
        { It is not always possible to focus... }
      end;
    end;
  end;
end;

function TSQLEditorFrame.GetActivePageCaption: string;
begin
  Result := PageControl.ActivePage.Caption;
  if Pos('~', PageControl.ActivePage.Caption) = Length(PageControl.ActivePage.Caption) then
    Result := System.Copy(PageControl.ActivePage.Caption, 0, Length(PageControl.ActivePage.Caption) - 1);
end;

procedure TSQLEditorFrame.OraScriptError(Sender: TObject; E: Exception; SQL: string;
  var Action: TErrorAction);
begin
  FOutputFrame.AddErrors('Errors: ' + GetActivePageCaption, E.Message);
  Action := eaFail;
end;

procedure TSQLEditorFrame.Close(IncludeCancel: Boolean);
var
  i, Rslt: Integer;
  SynEdit: TBCSynEdit;
begin
  Rslt := mrNone;

  SynEdit := ActiveSynEdit;
  if Assigned(SynEdit) and SynEdit.Modified then
  begin
    Rslt := Common.SaveChanges(IncludeCancel);
    if Rslt = mrYes then
      Save;
  end;

  if Rslt <> mrCancel then
  begin
    i := FSynEditsList.IndexOf(SynEdit);
    if i <> -1 then
      FSynEditsList.Delete(i);
    if PageControl.PageCount > 0 then
      PageControl.ActivePage.Destroy;
    if PageControl.PageCount > 0 then
      PageControl.ActivePageIndex := PageControl.PageCount - 1;
    if PageControl.PageCount = 0 then
      FNumberOfNewDocument := 0;
  end;
  if Assigned(PageControl.ActivePage) then
    PageControl.ActivePage.Repaint;
  PageControl.Repaint;
end;

function TSQLEditorFrame.CloseAll(CloseDocuments: Boolean; IncludeCancel: Boolean): Integer;
begin
  Result := mrNone;

  if ModifiedDocuments then
  begin
    Result := SaveChanges(IncludeCancel);
    if Result = mrYes then
      SaveAll;
  end;
  if CloseDocuments and (Result <> mrCancel) then
  begin
    FSynEditsList.Clear;
    while PageControl.PageCount > 0 do
      PageControl.ActivePage.Destroy;
    FNumberOfNewDocument := 0;
    Result := mrYes;
  end;
  PageControl.Repaint;
end;

procedure TSQLEditorFrame.CloseAllOtherPages;
var
  i: Integer;
  Temp: Integer;
  Rslt: Integer;
  SynEdit: TBCSynEdit;
begin
  Temp := PageControl.ActivePageIndex;
  PageControl.ActivePage.Tag := 1;

  Rslt := mrNone;

  if ModifiedDocuments(False) then
  begin
    Rslt := SaveChanges(True);

    if Rslt = mrYes then
      for i := 0 to PageControl.PageCount - 1 do
      begin
        PageControl.ActivePage := PageControl.Pages[i];
        SynEdit := ActiveSynEdit;
        if Assigned(SynEdit) and (SynEdit.Modified) and (i <> Temp) then
          Save(PageControl.Pages[i]);
      end;

  end;

  if Rslt <> mrCancel then
  begin
    PageControl.ActivePageIndex := 0;
    while PageControl.PageCount > 1 do
      if PageControl.ActivePage.Tag = 1 then
        PageControl.ActivePage := PageControl.Pages[PageControl.ActivePageIndex + 1]
      else
      begin
        SynEdit := ActiveSynEdit;
        if Assigned(SynEdit) then
          FSynEditsList.Delete(FSynEditsList.IndexOf(SynEdit));
        PageControl.ActivePage.Destroy;
      end;

    PageControl.ActivePage.Tag := 0; { important! }

    if ActiveSynEdit.DocumentName = '' then
      FNumberOfNewDocument := 1
    else
      FNumberOfNewDocument := 0
  end;
end;

function TSQLEditorFrame.Save(TabSheet: TTabSheet; ShowDialog: Boolean): string;
var
  SynEdit: TBCSynEdit;
  AFileName: string;
begin
  Result := '';
  PageControl.ActivePage := TabSheet;
  SynEdit := GetSynEdit(TabSheet);
  if Assigned(SynEdit) then
  begin
    if (SynEdit.DocumentName = '') or ShowDialog then
    begin
      AFileName := TabSheet.Caption;
      if Pos('~', TabSheet.Caption) = Length(TabSheet.Caption) then
        AFileName := System.Copy(TabSheet.Caption, 0, Length(TabSheet.Caption) - 1);

      if CommonDialogs.SaveFile(Handle, '',
        Format('%s'#0'*.*'#0, [LanguageDataModule.GetConstant('AllFiles')]) + 'SQL files (*.sql)'#0'*.sql'#0#0, LanguageDataModule.GetConstant('SaveAs'), AFileName, 'sql') then
      begin
        Application.ProcessMessages; { style fix }
        PageControl.ActivePage.Caption := ExtractFileName(CommonDialogs.Files[0]);
        SynEdit.DocumentName := CommonDialogs.Files[0];
        Result := CommonDialogs.Files[0];
      end
      else
      begin
        if SynEdit.CanFocus then
          SynEdit.SetFocus;
        Exit;
      end;
    end;
    SynEdit.Lines.SaveToFile(SynEdit.DocumentName);
    SynEdit.UndoList.Clear;
    SynEdit.FileDateTime := GetFileDateTime(SynEdit.DocumentName);
    SynEdit.Modified := False;
    if Pos('~', TabSheet.Caption) = Length(TabSheet.Caption) then
      TabSheet.Caption := System.Copy(TabSheet.Caption, 0, Length(TabSheet.Caption) - 1);
  end;
  PageControl.ActivePage.Repaint;
  PageControl.Repaint;
end;

procedure TSQLEditorFrame.Save;
begin
  Save(PageControl.ActivePage);
end;

function TSQLEditorFrame.SaveAs: string;
begin
  Result := Save(PageControl.ActivePage, True);
end;

procedure TSQLEditorFrame.SaveAll;
var
  i: Integer;
  Temp: Integer;
  SynEdit: TBCSynEdit;
begin
  Temp := PageControl.ActivePageIndex;
  for i := 0 to PageControl.PageCount - 1 do
  begin
    PageControl.ActivePage := PageControl.Pages[i];
    SynEdit := ActiveSynEdit;
    if Assigned(SynEdit) and SynEdit.Modified then
      Save(PageControl.Pages[i]);
  end;
  if Assigned(PageControl.Pages[Temp]) then
    PageControl.ActivePage := PageControl.Pages[Temp];
end;

procedure TSQLEditorFrame.Undo;
var
  SynEdit: TBCSynEdit;
begin
  SynEdit := ActiveSynEdit;
  SynEdit.Undo;
  if SynEdit.UndoList.ItemCount = 0 then
  begin
    SynEdit.Modified := False; //PageControl.ActivePage.ImageIndex := SAVED_IMAGEINDEX
    PageControl.ActivePage.Caption := GetActivePageCaption;
  end;
  PageControl.ActivePage.Repaint;
  PageControl.Repaint;
end;

procedure TSQLEditorFrame.Redo;
var
  SynEdit: TBCSynEdit;
begin
  SynEdit := ActiveSynEdit;
  if Assigned(SynEdit) then
    SynEdit.Redo;
  PageControl.ActivePage.Repaint;
  PageControl.Repaint;
end;

procedure TSQLEditorFrame.Cut;
var
  SynEdit: TBCSynEdit;
begin
  SynEdit := ActiveSynEdit;
  if Assigned(SynEdit) then
    SynEdit.CutToClipboard;
  PageControl.ActivePage.Repaint;
end;

procedure TSQLEditorFrame.CopyToClipboard;
var
  SynEdit: TBCSynEdit;
begin
  SynEdit := ActiveSynEdit;
  if SynEdit.Focused then
    SynEdit.CopyToClipboard
  else
    FOutputFrame.CopyToClipboard;
  PageControl.ActivePage.Repaint;
  PageControl.Repaint;
end;

procedure TSQLEditorFrame.PageControlChange(Sender: TObject);
begin
  CheckFileDateTimes; { compare can change file datetime }
  PageControl.ActivePage.Repaint;
  PageControl.Repaint;
end;

procedure TSQLEditorFrame.Paste;
var
  SynEdit: TBCSynEdit;
begin
  SynEdit := ActiveSynEdit;
  if SynEdit.Focused then
  begin
    if SynEdit.SelAvail then
      SynEdit.ClearSelection;
    SynEdit.SetFocus;
    SynEdit.PasteFromClipboard
  end
  else
    SearchForEdit.PasteFromClipboard;
  PageControl.ActivePage.Repaint;
  PageControl.Repaint;
end;

procedure TSQLEditorFrame.PopupMenuCaseActionExecute(Sender: TObject);
begin
  PopupMenuCaseAction.Checked := not PopupMenuCaseAction.Checked;
  CaseToolbarPanel.Visible := PopupMenuCaseAction.Checked;
end;

procedure TSQLEditorFrame.PopupMenuCommandActionExecute(Sender: TObject);
begin
  PopupMenuCommandAction.Checked := not PopupMenuCommandAction.Checked;
  CommandToolbarPanel.Visible := PopupMenuCommandAction.Checked;
end;

procedure TSQLEditorFrame.PopupMenuDBMSActionExecute(Sender: TObject);
begin
  PopupMenuDBMSAction.Checked := not PopupMenuDBMSAction.Checked;
  DBMSToolbarPanel.Visible := PopupMenuDBMSAction.Checked;
end;

procedure TSQLEditorFrame.PopupMenuExecuteActionExecute(Sender: TObject);
begin
  PopupMenuExecuteAction.Checked := not PopupMenuExecuteAction.Checked;
  ExecuteToolbarPanel.Visible := PopupMenuExecuteAction.Checked;
end;

procedure TSQLEditorFrame.PopupMenuExplainPlanActionExecute(Sender: TObject);
begin
  PopupMenuExplainPlanAction.Checked := not PopupMenuExplainPlanAction.Checked;
  ExplainPlanToolbarPanel.Visible := PopupMenuExplainPlanAction.Checked;
end;

procedure TSQLEditorFrame.PopupMenuIndentActionExecute(Sender: TObject);
begin
  PopupMenuIndentAction.Checked := not PopupMenuIndentAction.Checked;
  IndentToolbarPanel.Visible := PopupMenuIndentAction.Checked;
end;

procedure TSQLEditorFrame.PopupMenuModeActionExecute(Sender: TObject);
begin
  PopupMenuModeAction.Checked := not PopupMenuModeAction.Checked;
  ModeToolbarPanel.Visible := PopupMenuModeAction.Checked;
end;

procedure TSQLEditorFrame.PopupMenuPrintActionExecute(Sender: TObject);
begin
  PopupMenuPrintAction.Checked := not PopupMenuPrintAction.Checked;
  PrintToolbarPanel.Visible := PopupMenuPrintAction.Checked;
end;

procedure TSQLEditorFrame.PopupMenuSearchActionExecute(Sender: TObject);
begin
  PopupMenuSearchAction.Checked := not PopupMenuSearchAction.Checked;
  SearchToolbarPanel.Visible := PopupMenuSearchAction.Checked;
end;

procedure TSQLEditorFrame.PopupMenuSortActionExecute(Sender: TObject);
begin
  PopupMenuSortAction.Checked := not PopupMenuSortAction.Checked;
  SortToolbarPanel.Visible := PopupMenuSortAction.Checked;
end;

procedure TSQLEditorFrame.PopupMenuStandardActionExecute(Sender: TObject);
begin
  PopupMenuStandardAction.Checked := not PopupMenuStandardAction.Checked;
  StandardToolbarPanel.Visible := PopupMenuStandardAction.Checked;
end;

procedure TSQLEditorFrame.PopupMenuToolsActionExecute(Sender: TObject);
begin
  PopupMenuToolsAction.Checked := not PopupMenuToolsAction.Checked;
  ToolsToolbarPanel.Visible := PopupMenuToolsAction.Checked;
end;

procedure TSQLEditorFrame.PopupMenuTransactionActionExecute(Sender: TObject);
begin
  PopupMenuTransactionAction.Checked := not PopupMenuTransactionAction.Checked;
  TransactionToolbarPanel.Visible := PopupMenuTransactionAction.Checked;
end;

procedure TSQLEditorFrame.InitializeSynEditPrint;
var
  SynEdit: TBCSynEdit;
begin
  SynEdit := ActiveSynEdit;
  with SynEditPrint.Header do
  begin
    Clear;
    Add(SynEdit.DocumentName, nil, taLeftJustify, 1);
    Add('Page: $PAGENUM$ of $PAGECOUNT$', nil, taRightJustify, 1);
  end;
  with SynEditPrint.Footer do
  begin
    Clear;
    Add('Printed by OraBone', nil, taLeftJustify, 1);
    Add('$DATE$ $TIME$', nil, taRightJustify, 1);
  end;
  SynEditPrint.SynEdit := SynEdit;
  SynEditPrint.Title := ExtractFileName(SynEdit.DocumentName);
end;

procedure TSQLEditorFrame.Print;
var
  PrintDlgRec: TPrintDlg;
begin
  if CommonDialogs.Print(Handle, PrintDlgRec) then
  begin
    Application.ProcessMessages; { style fix }
    SynEditPrint.Copies := PrintDlgRec.nCopies;
    SynEditPrint.SelectedOnly := PrintDlgRec.Flags and PD_SELECTION <> 0;
    if PrintDlgRec.Flags and PD_PAGENUMS <> 0 then
      SynEditPrint.PrintRange(PrintDlgRec.nFromPage, PrintDlgRec.nToPage);
    InitializeSynEditPrint;
    SynEditPrint.Print;
  end;
end;

procedure TSQLEditorFrame.PrintPreview;
begin
  InitializeSynEditPrint;
  with PrintPreviewDialog do
  begin
    SynEditPrintPreview.SynEditPrint := SynEditPrint;
    ShowModal;
  end;
end;

function TSQLEditorFrame.SearchOptions(IncludeBackwards: Boolean): TSynSearchOptions;
begin
  Result := [];
  if IncludeBackwards then
    Include(Result, ssoBackwards);
  if CaseSensitiveCheckBox.Checked then
    Include(Result, ssoMatchCase);
  if WholeWordsCheckBox.Checked then
    Include(Result, ssoWholeWord);
end;

procedure TSQLEditorFrame.Search;
begin
  SearchPanel.Visible := not SearchPanel.Visible;
  if SearchPanel.Visible then
  begin
    if ActiveSynEdit.SelAvail then
      SearchForEdit.Text := ActiveSynEdit.SelText;
    SearchForEdit.SetFocus;
    ActiveSynEdit.CaretXY := BufferCoord(0, 0);
    DoSearch;
  end;
end;

procedure TSQLEditorFrame.DoSearch;
var
  SynSearchOptions: TSynSearchOptions;
  SynEdit: TBCSynEdit;
begin
  if Trim(SearchForEdit.Text) = '' then
    Exit;

  SynEdit := ActiveSynEdit;
  if RegularExpressionCheckBox.Checked then
    SynEdit.SearchEngine := SynEditRegexSearch
  else
    SynEdit.SearchEngine := SynEditSearch;
  SynSearchOptions := SearchOptions(False);

  try
    if SynEdit.SearchReplace(SearchForEdit.Text, '', SynSearchOptions) = 0 then
    begin
      MessageBeep(MB_ICONASTERISK);
      SynEdit.BlockBegin := SynEdit.BlockEnd;
      SynEdit.CaretXY := SynEdit.BlockBegin;
    end;
  except
    { silent }
  end;
end;

procedure TSQLEditorFrame.SearchClearActionExecute(Sender: TObject);
begin
  SearchForEdit.Clear;
end;

procedure TSQLEditorFrame.SearchCloseActionExecute(Sender: TObject);
begin
  SearchPanel.Hide;
end;

procedure TSQLEditorFrame.SearchFindNextActionExecute(Sender: TObject);
begin
  FindNext;
end;

procedure TSQLEditorFrame.SearchFindPreviousActionExecute(Sender: TObject);
begin
  FindPrevious;
end;

procedure TSQLEditorFrame.SearchForEditChange(Sender: TObject);
begin
  ActiveSynEdit.CaretXY := BufferCoord(0, 0);
  SearchFindNextAction.Enabled := CanFindNextPrevious;
  SearchFindPreviousAction.Enabled := SearchFindNextAction.Enabled;
  DoSearch;
end;

procedure TSQLEditorFrame.FindNext;
var
  SynSearchOptions: TSynSearchOptions;
  SynEdit: TBCSynEdit;
begin
  if Trim(SearchForEdit.Text) = '' then
    Exit;
  SynSearchOptions := SearchOptions(False);
  SynEdit := ActiveSynEdit;

  if SynEdit.SearchReplace(SearchForEdit.Text, '', SynSearchOptions) = 0 then
  begin
    MessageBeep(MB_ICONASTERISK);
    SynEdit.BlockBegin := SynEdit.BlockEnd;
    SynEdit.CaretXY := SynEdit.BlockBegin;
  end;
end;

procedure TSQLEditorFrame.FindPrevious;
var
  SynSearchOptions: TSynSearchOptions;
  SynEdit: TBCSynEdit;
begin
  if Trim(SearchForEdit.Text) = '' then
    Exit;
  SynSearchOptions := SearchOptions(True);
  SynEdit := ActiveSynEdit;
  if SynEdit.SearchReplace(SearchForEdit.Text, '', SynSearchOptions) = 0 then
  begin
    MessageBeep(MB_ICONASTERISK);
    SynEdit.BlockEnd := SynEdit.BlockBegin;
    SynEdit.CaretXY := SynEdit.BlockBegin;
  end;
end;

procedure TSQLEditorFrame.Replace;
var
  SynSearchOptions: TSynSearchOptions;
  SynEdit: TBCSynEdit;
  i, page, MResult: Integer;
begin
  with ReplaceDialog do
  begin
    if ActiveSynEdit.SelAvail then
      SearchForComboBox.Text := ActiveSynEdit.SelText;
    MResult := ShowModal;
    if (MResult = mrOK) or (MResult = mrYes) then
    begin
      SynSearchOptions := SearchOptions(False);
      if MResult = mrOK then
        Include(SynSearchOptions, ssoPrompt);
      Include(SynSearchOptions, ssoReplace);
      Include(SynSearchOptions, ssoReplaceAll);
      if ReplaceInWholeFile then
      begin
        SynEdit := ActiveSynEdit;
        SynEdit.CaretXY := BufferCoord(0, 0);
        SynEdit.SearchReplace(SearchText, ReplaceText, SynSearchOptions);
      end
      else
      begin
        page := PageControl.ActivePageIndex;
        for i := 0 to PageControl.PageCount - 1 do
        begin
          PageControl.ActivePageIndex := i;
          SynEdit := ActiveSynEdit;
         // SynEdit := GetSynEdit(PageControl.Pages[i]);
          if Assigned(SynEdit) then
          begin
            SynEdit.CaretXY := BufferCoord(0, 0);
            SynEdit.SearchReplace(SearchText, ReplaceText, SynSearchOptions);
          end;
        end;
        PageControl.ActivePageIndex := page;
      end;
    end;
  end;
  PageControl.ActivePage.Repaint;
  PageControl.Repaint;
end;

function TSQLEditorFrame.CanFindNextPrevious: Boolean;
begin
  Result := SearchForEdit.Text <> '';
end;

function TSQLEditorFrame.WordWrap: Boolean;
var
  SynEdit: TBCSynEdit;
begin
  Result := False;
  SynEdit := ActiveSynEdit;
  if Assigned(SynEdit) then
    Result := SynEdit.WordWrap;
end;

function TSQLEditorFrame.ToggleWordWrap: Boolean;
var
  i: Integer;
  SynEdit: TSynEdit;
begin
  Result := False;

  for i := 0 to PageControl.PageCount - 1 do
  begin
    SynEdit := GetSynEdit(PageControl.Pages[i]);
    if Assigned(SynEdit) then
    begin
      SynEdit.WordWrap := not SynEdit.WordWrap;
       Result := SynEdit.WordWrap;
    end;
  end;
  PageControl.ActivePage.Repaint;
  PageControl.Repaint;
end;

function TSQLEditorFrame.SpecialChars: Boolean;
var
  SynEdit: TBCSynEdit;
begin
  Result := False;
  SynEdit := ActiveSynEdit;
  if Assigned(SynEdit) then
    Result := eoShowSpecialChars in SynEdit.Options;
end;

function TSQLEditorFrame.ToggleSpecialChars: Boolean;
var
  i: Integer;
  SynEdit: TSynEdit;
begin
  Result := False;

  for i := 0 to PageControl.PageCount - 1 do
  begin
    SynEdit := GetSynEdit(PageControl.Pages[i]);
    if Assigned(SynEdit) then
    begin
      if eoShowSpecialChars in SynEdit.Options then
        SynEdit.Options := SynEdit.Options - [eoShowSpecialChars]
      else
        SynEdit.Options := SynEdit.Options + [eoShowSpecialChars];
      Result := eoShowSpecialChars in SynEdit.Options;
    end;
  end;
  PageControl.ActivePage.Repaint;
  PageControl.Repaint;
end;

function TSQLEditorFrame.SelectionMode: Boolean;
var
  SynEdit: TBCSynEdit;
begin
  Result := False;
  SynEdit := ActiveSynEdit;
  if Assigned(SynEdit) then
    Result := SynEdit.SelectionMode = smColumn;
end;

function TSQLEditorFrame.ToggleSelectionMode: Boolean;
var
  i: Integer;
  SynEdit: TBCSynEdit;
begin
  Result := False;

  for i := 0 to PageControl.PageCount - 1 do
  begin
    SynEdit := GetSynEdit(PageControl.Pages[i]);
    if Assigned(SynEdit) then
    begin
      if SynEdit.SelectionMode = smColumn then
        SynEdit.SelectionMode := smNormal
      else
        SynEdit.SelectionMode := smColumn;
      Result := SynEdit.SelectionMode = smColumn;
    end;
  end;
  PageControl.ActivePage.Repaint;
  PageControl.Repaint;
end;

function TSQLEditorFrame.LineNumbers: Boolean;
var
  SynEdit: TBCSynEdit;
begin
  Result := False;
  SynEdit := ActiveSynEdit;
  if Assigned(SynEdit) then
    Result := SynEdit.Gutter.ShowLineNumbers;
end;

function TSQLEditorFrame.ToggleLineNumbers: Boolean;
var
  i: Integer;
  SynEdit: TSynEdit;
begin
  Result := False;

  for i := 0 to PageControl.PageCount - 1 do
  begin
    SynEdit := GetSynEdit(PageControl.Pages[i]);
    if Assigned(SynEdit) then
    begin
      SynEdit.Gutter.ShowLineNumbers := not SynEdit.Gutter.ShowLineNumbers;
      Result := SynEdit.Gutter.ShowLineNumbers;
    end;
  end;
  PageControl.ActivePage.Repaint;
  PageControl.Repaint;
end;

function TSQLEditorFrame.GetSynEdit(TabSheet: TTabSheet): TBCSynEdit;
var
  Panel: TPanel;
begin
  Result := nil;
  if TabSheet.ComponentCount <> 0 then
  begin
    if TabSheet.Components[0] is TPanel then
    begin
      Panel := TPanel(TabSheet.Components[0]);
      if Panel.ComponentCount <> 0 then
        if Panel.Components[0] is TBCSynEdit then
          Result := TBCSynEdit(Panel.Components[0]);
    end;
  end;
end;

function TSQLEditorFrame.ActiveSynEdit: TBCSynEdit;
begin
  if Assigned(PageControl.ActivePage) then
    Result := GetSynEdit(PageControl.ActivePage)
  else
    Result := nil;
end;

procedure TSQLEditorFrame.RepaintToolButtons;
var
  i: Integer;
begin
  MainForm.SetSQLEditorFields;
  for i := 0 to ComponentCount - 1 do
    if Components[i] is TToolButton then
      TToolButton(Components[i]).Repaint;
end;

procedure TSQLEditorFrame.SynEditChange(Sender: TObject);
begin
  ActiveSynEdit.Modified := True;
  if Pos('~', PageControl.ActivePage.Caption) = 0 then
  begin
    PageControl.ActivePage.Caption := PageControl.ActivePage.Caption + '~';
    PageControl.ActivePage.Repaint;
    PageControl.Repaint;
  end;
  RepaintToolButtons;
end;

function TSQLEditorFrame.GetActiveTabSheetCaption: string;
begin
  Result := '';
  if Assigned(PageControl.ActivePage) then
    Result := PageControl.ActivePage.Caption;
end;

function TSQLEditorFrame.GetActiveDocumentFound: Boolean;
var
  SynEdit: TBCSynEdit;
begin
  Result := False;

  if Assigned(PageControl.ActivePage) then
  begin
    SynEdit := ActiveSynEdit;
    if Assigned(SynEdit) then
      Result := True;
  end;
end;

function TSQLEditorFrame.GetActiveDocumentName: string;
var
  SynEdit: TBCSynEdit;
begin
  Result := '';
  if Assigned(PageControl.ActivePage) then
  begin
    SynEdit := ActiveSynEdit;
    if Assigned(SynEdit) then
      if SynEdit.DocumentName <> '' then
      begin
        Result := SynEdit.DocumentName;
        if SynEdit.Modified then
          Result := Result + ' - Modified';
      end
  end;
end;

function TSQLEditorFrame.GetOpenTabSheets: Boolean;
begin
  Result := PageControl.PageCount > 0;
end;

function TSQLEditorFrame.ModifiedDocuments(CheckActive: Boolean): Boolean;
var
  i: Integer;
  SynEdit: TBCSynEdit;
begin
  Result := False;

  SynEdit := ActiveSynEdit;
  for i := 0 to FSynEditsList.Count - 1 do
    if Assigned(FSynEditsList.Items[i]) and ( ((TBCSynEdit(FSynEditsList.Items[i]) <> SynEdit) and not CheckActive) or CheckActive) then
      if TBCSynEdit(FSynEditsList.Items[i]).Modified then
      begin
        Result := True;
        Exit;
      end;
end;

function TSQLEditorFrame.GetSelectionFound: Boolean;
var
  SynEdit: TBCSynEdit;
begin
  Result := False;
  SynEdit := ActiveSynEdit;
  if Assigned(SynEdit) then
    Result := SynEdit.SelAvail;
end;

function TSQLEditorFrame.GetCanUndo: Boolean;
var
  SynEdit: TBCSynEdit;
begin
  Result := False;
  SynEdit := ActiveSynEdit;
  if Assigned(SynEdit) then
    Result := SynEdit.UndoList.ItemCount > 0;
end;

function TSQLEditorFrame.GetCanRedo: Boolean;
var
  SynEdit: TBCSynEdit;
begin
  Result := False;
  SynEdit := ActiveSynEdit;
  if Assigned(SynEdit) then
    Result := SynEdit.RedoList.ItemCount > 0;
end;

procedure TSQLEditorFrame.SynEditorReplaceText(Sender: TObject; const ASearch,
  AReplace: UnicodeString; Line, Column: Integer;
  var Action: TSynReplaceAction);
var
  APos: TPoint;
  EditRect: TRect;
  SynEdit: TBCSynEdit;
begin
  if ASearch = AReplace then
    Action := raSkip
  else
  begin
    SynEdit := ActiveSynEdit;
    APos := SynEdit.ClientToScreen(SynEdit.RowColumnToPixels
        (SynEdit.BufferToDisplayPos(BufferCoord(Column, Line))));

    EditRect := ClientRect;
    EditRect.TopLeft := ClientToScreen(EditRect.TopLeft);
    EditRect.BottomRight := ClientToScreen(EditRect.BottomRight);

    ConfirmReplaceDialog.PrepareShow(EditRect, APos.X, APos.Y, APos.Y + SynEdit.LineHeight,
      ASearch);
    try
      case ConfirmReplaceDialog.ShowModal of
        mrYes:
          Action := raReplace;
        mrYesToAll:
          Action := raReplaceAll;
        mrNo:
          Action := raSkip;
      else
        Action := raCancel;
      end;
    finally
      ConfirmReplaceDialog.Release;
    end;
  end;
end;

procedure TSQLEditorFrame.ToggleBookMark;
var
  i: Integer;
  SynEdit: TBCSynEdit;
  CaretX, CaretY: Integer;
begin
  SynEdit := ActiveSynEdit;
  for i := 0 to SynEdit.Marks.Count - 1 do
    if SynEdit.CaretY = SynEdit.Marks[i].Line then
    begin
      SynEdit.ClearBookmark(SynEdit.Marks[i].BookmarkNumber);
      Exit;
    end;
  CaretX := SynEdit.CaretX;
  CaretY := SynEdit.CaretY;
  for i := 0 to 9 do
    if not SynEdit.GetBookMark(i, CaretX, CaretY) then
    begin
      SynEdit.SetBookMark(i, SynEdit.CaretX, SynEdit.CaretY);
      Exit;
    end;
end;

procedure TSQLEditorFrame.ToggleBookmark0MenuItemClick(Sender: TObject);
var
  SynEdit: TBCSynEdit;
  Item: TMenuItem;
  SynEditorCommand: TSynEditorCommand;
begin
  Item := Sender as TMenuItem;
  SynEditorCommand := ecNone;
  case Item.Tag of
    0: SynEditorCommand := ecSetMarker0;
    1: SynEditorCommand := ecSetMarker1;
    2: SynEditorCommand := ecSetMarker2;
    3: SynEditorCommand := ecSetMarker3;
    4: SynEditorCommand := ecSetMarker4;
    5: SynEditorCommand := ecSetMarker5;
    6: SynEditorCommand := ecSetMarker6;
    7: SynEditorCommand := ecSetMarker7;
    8: SynEditorCommand := ecSetMarker8;
    9: SynEditorCommand := ecSetMarker9;
  end;
  SynEdit := ActiveSynEdit;
  if Assigned(SynEdit) then
    SynEdit.ExecuteCommand(SynEditorCommand, Char(Item.Tag), nil);
end;

procedure TSQLEditorFrame.NextPage;
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

procedure TSQLEditorFrame.PreviousPage;
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

procedure TSQLEditorFrame.CheckFileDateTimes;
var
  i: Integer;
  SynEdit: TBCSynEdit;
  FileDateTime: TDateTime;
begin
  for i := 0 to PageControl.PageCount - 1 do
  begin
    SynEdit := GetSynEdit(PageControl.Pages[i]);
    if Assigned(SynEdit) then
      if SynEdit.DocumentName <> '' then
      begin
        FileDateTime := GetFileDateTime(SynEdit.DocumentName);
        if (FileDateTime <> 0) and (FileDateTime <> SynEdit.FileDateTime) then
        begin
          if FileExists(SynEdit.DocumentName) then
          begin
            if AskYesOrNo(Format('Document %s''s time/date changed. Reload?', [SynEdit.DocumentName])) then
            begin
              Refresh(i);
              PageControl.ActivePage.Repaint;
              PageControl.Repaint;
            end;
          end
          else
          begin
            SynEdit.Modified := True; //  PageControl.Pages[i].ImageIndex := CHANGED_IMAGEINDEX
            if Pos('~', PageControl.Pages[i].Caption) = 0 then
            begin
              PageControl.Pages[i].Caption := PageControl.Pages[i].Caption + '~';
              PageControl.ActivePage.Repaint;
              PageControl.Repaint;
            end;
          end;
        end;
      end;
  end;
end;

function TSQLEditorFrame.GetFileDateTime(FileName: string): TDateTime;
var
  SearchRec: TSearchRec;
begin
  FindFirst(FileName, faAnyFile, SearchRec);
  Result := SearchRec.TimeStamp;
end;

procedure TSQLEditorFrame.Refresh(Page: Integer);
var
  SynEdit: TBCSynEdit;
begin
  SynEdit := GetSynEdit(PageControl.Pages[Page]);
  if Assigned(SynEdit) then
  begin
    SynEdit.Lines.LoadFromFile(SynEdit.DocumentName);
    SynEdit.FileDateTime := GetFileDateTime(SynEdit.DocumentName);
  end;
end;

procedure TSQLEditorFrame.AssignOptions;
var
  i: Integer;
  SynEdit: TBCSynEdit;
begin
  { assign to every synedit }
  for i := 0 to PageControl.PageCount - 1 do
  begin
    SynEdit := GetSynEdit(PageControl.Pages[i]);
    if Assigned(SynEdit) then
      OptionsContainer.AssignTo(SynEdit);
  end;
  PageControl.MultiLine := OptionsContainer.MultiLine;
end;

procedure TSQLEditorFrame.SetHighlighterTableNames(Value: TStrings);
begin
  SynSQLSyn.TableNames.Text := LowerCase(Value.Text);
end;

procedure TSQLEditorFrame.ShowObjects;
var
  SynEdit: TBCSynEdit;
begin
  SynEdit := ActiveSynEdit;
  SynEdit.FObjectCompletionProposal.ActivateCompletion;
end;

procedure TSQLEditorFrame.OutputDblClickActionExecute(Sender: TObject);
var
  Filename: string;
  Ln, Ch: LongWord;
begin
  if FOutputFrame.SelectedLine(Filename, Ln, Ch) then
    Open(Filename, nil, Ln, Ch);
end;

function GetOraScriptErrorPos(Msg: string; var Row, Col: Integer): Boolean;
var
  Error: string;
begin
  Result := False;
  Row := 1;
  Col := 1;
  Error := Msg;
  if Pos(' ', Error) <> 0 then
    Error := System.Copy(Error, 1, Pos(' ', Error) - 1);
  if Pos('/', Error) <> 0 then
  begin
    try
      Row := StrToInt(System.Copy(Error, 1, Pos('/', Error) - 1));
      Error := System.Copy(Error, Pos('/', Error) + 1, Length(Error));
      Col := StrToInt(Error);
      Result := True;
    except

    end;
  end
end;

procedure TSQLEditorFrame.ExecuteScript;
var
  Row, Col: Integer;
  SynEdit: TBCSynEdit;
  CreateStatement: Boolean;
  s: WideString;
begin
  SynEdit := ActiveSynEdit;

  if SynEdit.SelAvail then
    s := SynEdit.SelText
  else
    s := Trim(SynEdit.Text);

  CreateStatement := Pos(ShortString('CREATE'), UpperCase(Trim(RemoveParenthesisFromBegin(RemoveComments(s))))) = 1;

  OraScript.SQL.Text := s;
  ScriptQuery.SQL.Text := s;
  try
    OraScript.Session := FSession;
    ScriptQuery.Session := FSession;
    OraScript.AfterExecute := OraScriptAfterExecuteEvent;
    FOutputFrame.ClearStrings('Output: ' + GetActivePageCaption);
    SynEdit.StartTime := Now;
    if DBMSOutputToolButton.Down then
      EnableDBMSOutput;
    { parameters }

    if ScriptQuery.ParamCount > 0 then
      if not ParametersDialog.Open(ScriptQuery) then
        Exit;

    if not CreateStatement then
      if not FInTransaction then
      begin
        FInTransaction := True;
        Session.StartTransaction;
      end;
    OraScript.Execute;
    if DBMSOutputToolButton.Down then
      GetDBMSOutput;
    OutputPanel.Visible := True;
  except
    on E: EOraError do
    begin
      if not GetOraScriptErrorPos(E.Message, Row, Col) then
        OraScript.DataSet.GetErrorPos(Row, Col);
      OutputPanel.Visible := True;
      SynEdit.SetFocus;
      SynEdit.CaretY := Row;
      SynEdit.CaretX := Col;
    end;
  end;
end;

function TSQLEditorFrame.RemoveComments(s: WideString): WideString; //SynEdit: TBCSynEdit): WideString;
var
  Line, Temp: string;
  i: Integer;
  InComment: Boolean;
  SQLSynEdit: TSynEdit;
begin
  Result := '';
  // remove comments
  InComment := False;
  SQLSynEdit := TSynEdit.Create(nil);
  try
    SQLSynEdit.Text := s;
    for i := 0 to SQLSynEdit.Lines.Count - 1 do
    begin
      Line := SQLSynEdit.Lines[i];

      if not InComment then
      begin
        Temp := Line;
        if Pos('--', Line) <> 0 then
          Temp := System.Copy(Line, 0, Pos('--', Line) - 1);

        if Pos('/*', Line) <> 0 then
        begin
          InComment := True;
          Temp := System.Copy(Temp, 0, Pos('/*', Temp) - 1)
        end;
        if Pos('*/', Line) <> 0 then
        begin
          InComment := False;
          Temp := Temp + System.Copy(Line, Pos('*/', Line) + 2, Length(Line))
        end;
        Result := Result + Temp + CHR_ENTER;
      end
      else
      if InComment and (Pos('*/', Line) <> 0) then
      begin
        InComment := False;
        Result := Result + System.Copy(Line, Pos('*/', Line) + 2, Length(Line))
      end
    end;
  finally
    SQLSynEdit.Free;
  end;
end;

function TSQLEditorFrame.RemoveParenthesisFromBegin(Text: WideString): WideString;
begin
  Result := Text;
  while Pos('(', Result) = 1 do
    Result := Trim(System.Copy(Result, 2, Length(Result)));
end;

procedure TSQLEditorFrame.ExecuteStatement;
var
  SynEdit: TBCSynEdit;
  s: WideString;
begin
  SynEdit := ActiveSynEdit;

  if SynEdit.SelAvail then
    s := SynEdit.SelText
  else
    s := Trim(SynEdit.Text);

  s := Trim(UpperCase(RemoveParenthesisFromBegin(RemoveComments(s))));

  if (Pos(WideString('SELECT'), s) = 1) or (Pos(WideString('DESC'), s) = 1) then
    ExecuteStatement(SynEdit)
  else
  if s[Length(s)] = ';' then
    ExecuteScript
  else
    ExecuteNoRowsStatement(SynEdit);
end;

procedure TSQLEditorFrame.ExplainPlan;
var
  SynEdit: TBCSynEdit;
begin
  SynEdit := ActiveSynEdit;
  if Trim(SynEdit.Text) = '' then
    Exit;
  if not Assigned(SynEdit.FPlanQuery) then
  begin
    SynEdit.FPlanQuery := TOraQuery.Create(nil);
    SynEdit.FPlanQuery.Session := FSession;
    SynEdit.FPlanQuery.ReadOnly := True;
    SynEdit.FPlanQuery.SQL.Clear;
    SynEdit.FPlanQuery.SQL.Add(SQLStringHolder.StringsByName['ExplainPlanSQL'].Text);
  end;
  FSession.ExecSQL('DELETE plan_table', ['',0]);
  try
    FSession.ExecSQL('EXPLAIN PLAN FOR ' + SynEdit.Text, ['',0]);
  except
    on E: EOraError do
    begin
      FOutputFrame.AddErrors('Errors: ' + GetActivePageCaption, E.Message);
      OutputPanel.Visible := True;
      Exit;
    end;
  end;
  SynEdit.FPlanQuery.Close;
  SynEdit.FPlanQuery.UnPrepare;
  SynEdit.FPlanQuery.Prepare;
  SynEdit.FPlanQuery.Open;
  FOutputFrame.AddPlan('Plan: ' + GetActivePageCaption, SynEdit.FPlanQuery);
  OutputPanel.Visible := True;
end;

function TSQLEditorFrame.CreateSession(OraSession: TOraSession): TOraSession;
begin
  Result := TOraSession.Create(Self);
  Result.ConnectString := OraSession.ConnectString;
  Result.Options.Direct := OraSession.Options.Direct;
  Result.Options.DateFormat := OptionsContainer.DateFormat; // 'DD.MM.YYYY';
  Result.Options.UseUnicode := True;
  //
  Result.AutoCommit := False;
  Result.ThreadSafety := True;
  Result.ConnectPrompt := False;
  Result.OnError := OraSessionError;
  Result.Connect;
end;

procedure TSQLEditorFrame.GetUserErrors;
var
  s: string;
  ObjectName: string;
  SQLTokenizer: TSQLTokenizer;
  SynEdit: TBCSynEdit;
begin
  { Get objectname }
  SQLTokenizer := TSQLTokenizer.Create;
  SynEdit := ActiveSynEdit;
  try
    SQLTokenizer.SetText(SynEdit.Text);
    while not SQLTokenizer.Eof do
    begin
      if SQLTokenizer.TokenStrIs('PROCEDURE') or
         SQLTokenizer.TokenStrIs('FUNCTION') or
         SQLTokenizer.TokenStrIs('PACKAGE') or
         SQLTokenizer.TokenStrIs('TRIGGER') or
         SQLTokenizer.TokenStrIs('FROM') then
      begin
        SQLTokenizer.Next;
        while not SQLTokenizer.Eof do
          if (UpperCase(Trim(SQLTokenizer.TokenStr)) <> '') and not SQLTokenizer.TokenStrIs('BODY') then
            Break
          else
            SQLTokenizer.Next;
        ObjectName := UpperCase(SQLTokenizer.TokenStr);
        SQLTokenizer.Next;
        if SQLTokenizer.TokenType = ttPeriod then
        begin
          SQLTokenizer.Next;
          ObjectName := UpperCase(SQLTokenizer.TokenStr);
        end;
        Break;
      end;
      SQLTokenizer.Next;
    end;
  finally
    SQLTokenizer.Free;
  end;
  { Get errors from user_errors }
  with ErrorsQuery do
  begin
    if not Session.Connected then
    begin
      Session.ConnectPrompt := False;
      Session.Connect;
      Session.ConnectPrompt := True;
    end;
    ParamByName('P_NAME').AsString := ObjectName;
    Open;
    while not Eof do
    begin
      s := Format('(%d, %d): %s', [FieldByName('LINE').AsInteger, FieldByName('POSITION').AsInteger,
        FieldByName('TEXT').AsWideString]);
      SynEdit.CaretX := FieldByName('POSITION').AsInteger;
      SynEdit.CaretY := FieldByName('LINE').AsInteger;
      FOutputFrame.AddErrors('Errors: ' + GetActivePageCaption, s);
      Next;
    end;
    Close;
  end;
end;

procedure TSQLEditorFrame.GotoBookmark0MenuItemClick(Sender: TObject);
var
  SynEdit: TBCSynEdit;
  Item: TMenuItem;
  SynEditorCommand: TSynEditorCommand;
begin
  Item := Sender as TMenuItem;
  SynEditorCommand := ecNone;
  case Item.Tag of
    0: SynEditorCommand := ecGotoMarker0;
    1: SynEditorCommand := ecGotoMarker1;
    2: SynEditorCommand := ecGotoMarker2;
    3: SynEditorCommand := ecGotoMarker3;
    4: SynEditorCommand := ecGotoMarker4;
    5: SynEditorCommand := ecGotoMarker5;
    6: SynEditorCommand := ecGotoMarker6;
    7: SynEditorCommand := ecGotoMarker7;
    8: SynEditorCommand := ecGotoMarker8;
    9: SynEditorCommand := ecGotoMarker9;
  end;
  SynEdit := ActiveSynEdit;
  if Assigned(SynEdit) then
    SynEdit.ExecuteCommand(SynEditorCommand, Char(Item.Tag), nil);
end;

procedure TSQLEditorFrame.OraSessionError(Sender: TObject; E: EDAError; var Fail: Boolean);
begin
  FOutputFrame.AddErrors('Errors: ' + GetActivePageCaption, E.Message);
  GetUserErrors;
  Application.ProcessMessages;
  Fail := True;
end;

procedure TSQLEditorFrame.GetText(Sender: TField; var Text: String; DisplayText: Boolean);
begin
  Text := Copy(Sender.AsString, 1, 50);
end;

procedure TSQLEditorFrame.SetClobAndTimestampFields(OraQuery: TOraQuery);
var
  i: Integer;
begin
  for i := 0 to OraQuery.Fields.Count - 1 do
  begin
    if OraQuery.Fields[i].DataType = ftOraClob then
      OraQuery.Fields[i].OnGetText := GetText
    else
    if OraQuery.Fields[i].DataType = ftTimestamp then
      TOraTimeStampField (OraQuery.Fields[i]).Format := OptionsContainer.DateFormat + ' ' + OptionsContainer.TimeFormat;
  end
end;

procedure TSQLEditorFrame.ExecuteStatement(SynEdit: TBCSynEdit);
var
  s, Owner, TableName: string;
  T1, T2: TTime;
  QuerySuccess: Boolean;
  Row, Col: Integer;
begin
  if not Assigned(SynEdit.FOraQuery) then
  begin
    SynEdit.FOraQuery := TOraQuery.Create(nil);
    SynEdit.FOraQuery.Session := CreateSession(FSession);
    SynEdit.FOraQuery.AutoCommit := False;
    SynEdit.FOraQuery.FetchRows := 500;
    SynEdit.FOraQuery.Options.StrictUpdate := False;
    SynEdit.FOraQuery.Options.RequiredFields := False;
    SynEdit.FOraQuery.Options.RawAsString := True;
    SynEdit.FOraQuery.LocalUpdate := True;
    SynEdit.FOraQuery.NonBlocking := True;

    SynEdit.FOraQuery.Options.CacheLobs := False;
    SynEdit.FOraQuery.Options.DeferredLobRead := True;
  end;

  SynEdit.FOraQuery.SQL.Clear;

  if SynEdit.SelAvail then
    s := SynEdit.SelText
  else
    s := Trim(SynEdit.Text);

  if s[Length(s)] = ';' then // remove ; at the end, if exists
    s[Length(s)] := ' ';

  if System.Pos('DESC', UpperCase(s)) = 1 then
  begin
    Owner := SchemaParam;
    TableName := UpperCase(Trim(System.Copy(s, 5, Length(s))));
    if Pos('.', TableName) <> 0 then
    begin
      Owner := Copy(TableName, 1, Pos('.', TableName) - 1);
      TableName := Copy(TableName, Pos('.', TableName) + 1, Length(TableName));
    end;
    s := Format(SQLStringHolder.StringsByName['ColumnsSQL'].Text, [Owner, TableName, Owner, TableName]);
  end;
  SynEdit.FOraQuery.SQL.Add(s);
  { parameters }

  if SynEdit.FOraQuery.ParamCount > 0 then
    if not ParametersDialog.Open(SynEdit.FOraQuery) then
      Exit;

  T1 := Now;
  QuerySuccess := False;
  try
    SynEdit.InThread := True;
    SynEdit.FOraQuery.Prepare;
    AddAllFields(SynEdit.FOraQuery);              { these are important to do after prepare because if there is }
    SetClobAndTimestampFields(SynEdit.FOraQuery); { problem with fields it may cause OCI_INVALID_HANDLE }
    SynEdit.FOraQuery.Open;
    QuerySuccess := QueryProgressDialog.Open(SynEdit.FOraQuery, T1);
    if not QuerySuccess then
      SynEdit.FOraQuery.Active := False;
    SynEdit.InThread := False;
  except

  end;
  if QuerySuccess then
  begin
    T2 := Now;
    FOutputFrame.AddGrid('Data: ' + GetActivePageCaption, SynEdit.FOraQuery, System.SysUtils.FormatDateTime('hh:nn:ss.zzz', T2 - T1));
    WriteHistory(SynEdit.FOraQuery.Session, SynEdit.Text);
  end
  else
  begin
    SynEdit.FOraQuery.GetErrorPos(Row, Col);
    SynEdit.SetFocus;
    SynEdit.CaretY := Row;
    SynEdit.CaretX := Col;
  end;
  OutputPanel.Visible := True;
end;

procedure TSQLEditorFrame.EnableDBMSOutput;
var
  SynEdit: TBCSynEdit;
  OraSession: TOraSession;
begin
  SynEdit := ActiveSynEdit;
  OraSession := nil;
  if Assigned(SynEdit) and Assigned(SynEdit.FOraSQL) then
    OraSession := SynEdit.FOraSQL.Session
  else
  if Assigned(OraScript.Session) then
    OraSession := OraScript.Session;

  if Assigned(OraSession) then
    OraSession.ExecSQL('BEGIN dbms_output.enable(1000000); END;', []);
end;

procedure TSQLEditorFrame.ExecuteNoRowsStatement(SynEdit: TBCSynEdit);
var
  s: WideString;
  QuerySuccess: Boolean;
  CreateNewSession: Boolean;
begin
  { if update, insert or delete statement then use FSession and transaction otherwise create new session
    and no transaction }
  if SynEdit.SelAvail then
    s := SynEdit.SelText
  else
    s := Trim(SynEdit.Text);
  s := UpperCase(s);
  // remove ('s
  while Pos('(', s) = 1 do
    s := Trim(System.Copy(s, 2, Length(s)));
  CreateNewSession := (Pos(WideString('UPDATE'), s) <> 1) and (Pos(WideString('INSERT'), s) <> 1) and
    (Pos(WideString('DELETE'), s) <> 1);

  SynEdit.FOraSQL := TOraSQL.Create(nil);
  if CreateNewSession then
    SynEdit.FOraSQL.Session := CreateSession(FSession)
  else
    SynEdit.FOraSQL.Session := FSession;
  SynEdit.FOraSQL.AutoCommit := False;
  SynEdit.FOraSQL.AfterExecute := OraSQLAfterExecuteEvent;
  SynEdit.FOraSQL.NonBlocking := CreateNewSession;
  //end;
  try
    SynEdit.FOraSQL.SQL.Clear;
    if SynEdit.SelAvail then
      s := SynEdit.SelText
    else
      s := Trim(SynEdit.Text);
    if System.Pos('EXECUTE', UpperCase(s)) = 1 then
      s := 'BEGIN ' + System.Copy(s, 8, Length(s)) + ' END;';
    if System.Pos('EXEC', UpperCase(s)) = 1 then
      s := 'BEGIN ' + System.Copy(s, 5, Length(s)) + ' END;';
    SynEdit.FOraSQL.SQL.Add(s);
    { parameters }
    if SynEdit.FOraSQL.ParamCount > 0 then
      if not ParametersDialog.Open(SynEdit.FOraSQL) then
        Exit;

    SynEdit.StartTime := Now;
    try
      if DBMSOutputToolButton.Down then
        EnableDBMSOutput;
      if not CreateNewSession then
        if not FInTransaction then
        begin
          FInTransaction := True;
          FSession.StartTransaction;
        end;
      SynEdit.InThread := True;
      QuerySuccess := True;
      SynEdit.FOraSQL.Prepare;
      SynEdit.FOraSQL.Execute;

      if CreateNewSession then
      begin
        QuerySuccess := SQLProgressDialog.Open(SynEdit.FOraSQL, SynEdit.StartTime);
        if not QuerySuccess then
          SynEdit.FOraSQL.BreakExec;
      end;
      SynEdit.InThread := False;
      if QuerySuccess then
        if DBMSOutputToolButton.Down then
          GetDBMSOutput;
    except
      QuerySuccess := SynEdit.FOraSQL.ErrorOffset = 0;
    end;
    if not QuerySuccess then
    begin
      SynEdit.SetFocus;
      SynEdit.SelStart := SynEdit.FOraSQL.ErrorOffset + 2;
    end;

    OutputPanel.Visible := True;
  finally
    SynEdit.FOraSQL.Destroy;
  end;
end;

procedure TSQLEditorFrame.OraScriptAfterExecuteEvent(Sender: TObject; SQL: string);
var
  i: Integer;
  StringList: TStringList;
  s: string;
  SynEdit: TBCSynEdit;
//  T2: TTime;
//  Min, Secs: Integer;
begin
  SynEdit := ActiveSynEdit;

  StringList := TStringList.Create;
  StringList.Clear;
  try
    for i := 0 to OraScript.Params.Count-1 do
      StringList.Add(OraScript.Params[i].Name + ' = ' +
       OraScript.Params[i].AsWideString);

    if OraScript.DataSet.RowsProcessed <> 0 then
      s := IntToStr(OraScript.DataSet.RowsProcessed) + ' row(s) processed.'
    else
      s := 'Success.';
    StringList.Add(s + ' ' + Format('Time Elapsed: %s', [System.SysUtils.FormatDateTime('hh:nn:ss.zzz', Now - SynEdit.StartTime)]));

    FOutputFrame.AddStrings('Output: ' + GetActivePageCaption, Trim(StringList.Text));
  finally
    WriteHistory(OraScript.Session, SynEdit.Text);
    StringList.Free;
  end;
end;

procedure TSQLEditorFrame.OraSQLAfterExecuteEvent(Sender: TObject; Result: Boolean);
var
  i:integer;
  SynEdit: TBCSynEdit;
  StringList: TStringList;
//  T2: TTime;
  s: string;
  //Min, Secs: Integer;
begin
  SynEdit := ActiveSynEdit;
  if Result then
  begin
    StringList := TStringList.Create;
    try
      for i := 0 to SynEdit.FOraSQL.Params.Count-1 do
        StringList.Add(SynEdit.FOraSQL.Params[i].Name + ' = ' +
         SynEdit.FOraSQL.Params[i].AsWideString);

      if SynEdit.FOraSQL.RowsProcessed <> 0 then
        s := IntToStr(SynEdit.FOraSQL.RowsProcessed) + ' row(s) processed in '
      else
        s := 'Success.';

      StringList.Add(s + ' ' + Format('Time Elapsed: %s', [System.SysUtils.FormatDateTime('hh:nn:ss.zzz', Now - SynEdit.StartTime)]));

      FOutputFrame.AddStrings('Output: ' + GetActivePageCaption, Trim(StringList.Text));
    finally
      WriteHistory(SynEdit.FOraSQL.Session, SynEdit.Text);
      StringList.Free;
    end;
  end
end;

procedure TSQLEditorFrame.GetDBMSOutput;
begin
  { start timer }
  if not Assigned(FDBMSTimer) then
  begin
    FDBMSTimer := TTimer.Create(nil);
    FDBMSTimer.Interval := OptionsContainer.PollingInterval * 1000; // milliseconds
    FDBMSTimer.OnTimer := DBMSOutputTimer;
  end;
  FDBMSTimer.Enabled := True;
end;

procedure TSQLEditorFrame.DBMSOutputTimer(Sender: TObject);
var
  Found: Boolean;
  SynEdit: TBCSynEdit;
  OraSession: TOraSession;
begin
  Found := False;
  SynEdit := ActiveSynEdit;
  OraSession := nil;
  if Assigned(SynEdit) and Assigned(SynEdit.FOraSQL) then
    OraSession := SynEdit.FOraSQL.Session
  else
  if Assigned(OraScript.Session) then
    OraSession := OraScript.Session;
  try
    if Assigned(OraSession) then
    begin
      OraSession.ExecSQL('BEGIN dbms_output.get_line(:buffer,:status); END;', ['',0]);
      while OraSession.ParamByName('STATUS').AsFloat = 0 do
      begin
        Found := True;
        FOutputFrame.AddDBMSOutput('DBMS output: ' + GetActivePageCaption, OraSession.ParamByName('BUFFER').AsWideString);
        OraSession.ExecSQL('BEGIN dbms_output.get_line(:buffer,:status); END;', ['',0]);
      end;
      if Found or not DBMSOutputToolButton.Down then
      begin
        OraSession.ExecSQL('BEGIN dbms_output.disable; END;', []);
        FDBMSTimer.Enabled := False;
        FDBMSTimer.Free;
        FDBMSTimer := nil;
      end;
    end;
  except

  end;
end;

procedure TSQLEditorFrame.WriteHistory(OraSession: TOraSession; SQL: WideString);
var
  History: TStrings;
begin
  History := TStringList.Create;
  try
    if FileExists(GetHistoryFile) then
      History.LoadFromFile(GetHistoryFile);

    // date;schema;sql#!ENDSQL!#
    History.Insert(0, Common.EncryptString(DateTimeToStr(Now) + ';' +
                Lib.FormatSchema(OraSession.Schema + '@' + OraSession.Server) + ';' +
                SQL + END_OF_SQL_STATEMENT));
    History.SaveToFile(GetHistoryFile);
  finally
    History.Free;
  end;
end;

function TSQLEditorFrame.GetCaretInfo: string;
var
  SynEdit: TBCSynEdit;
begin
  SynEdit := ActiveSynEdit;
  Result := Format('%d: %d', [SynEdit.CaretY, SynEdit.CaretX]);
end;

function TSQLEditorFrame.GetModifiedInfo: string;
var
  SynEdit: TBCSynEdit;
begin
  Result := '';
  SynEdit := ActiveSynEdit;
  if Assigned(SynEdit) and SynEdit.Modified then
    Result := 'Modified';
end;

procedure TSQLEditorFrame.DecreaseIndent;
var
  SynEdit: TBCSynEdit;
begin
  SynEdit := ActiveSynEdit;
  if Assigned(SynEdit) then
    SynEdit.ExecuteCommand(ecBlockUnindent, 'U', nil);
  PageControl.ActivePage.Repaint;
  PageControl.Repaint;
end;

procedure TSQLEditorFrame.IncreaseIndent;
var
  SynEdit: TBCSynEdit;
begin
  SynEdit := ActiveSynEdit;
  if Assigned(SynEdit) then
    SynEdit.ExecuteCommand(ecBlockIndent, 'I', nil);
  PageControl.ActivePage.Repaint;
  PageControl.Repaint;
end;

procedure TSQLEditorFrame.ToggleCase;
var
  SynEdit: TBCSynEdit;
begin
  SynEdit := ActiveSynEdit;
  if Assigned(SynEdit) then
    SynEdit.ExecuteCommand(ecToggleCaseBlock, 'C', nil);
  PageControl.ActivePage.Repaint;
  PageControl.Repaint;
end;

procedure TSQLEditorFrame.SortAsc;
var
  SynEdit: TBCSynEdit;
  Strings: TWideStringList;
begin
  SynEdit := ActiveSynEdit;
  if Assigned(SynEdit) then
  begin
    Strings := TWideStringList.Create;
    Strings.Text := SynEdit.SelText;
    Strings.Sort;
    SynEdit.SelText := Trim(Strings.Text);
    Strings.Free;
  end;
  PageControl.ActivePage.Repaint;
  PageControl.Repaint;
end;

procedure TSQLEditorFrame.SortDesc;
var
  i: Integer;
  SynEdit: TBCSynEdit;
  s: WideString;
  Strings: TWideStringList;
begin
  SynEdit := ActiveSynEdit;
  if Assigned(SynEdit) then
  begin
    Strings := TWideStringList.Create;
    Strings.Text := SynEdit.SelText;
    Strings.Sort;
    for i := Strings.Count - 1 downto 0 do
      s := s + Strings.Strings[i] + Chr(13) + Chr(10);
    SynEdit.SelText := Trim(s);
    Strings.Free;
  end;
  PageControl.ActivePage.Repaint;
  PageControl.Repaint;
end;

procedure TSQLEditorFrame.ClearBookmarks;
var
  i: Integer;
  SynEdit: TBCSynEdit;
begin
  SynEdit := ActiveSynEdit;
  if Assigned(SynEdit) then
    for i := 0 to 9 do
      SynEdit.ClearBookMark(i);
  PageControl.ActivePage.Repaint;
  PageControl.Repaint;
end;

procedure TSQLEditorFrame.InsertLine;
var
  SynEdit: TBCSynEdit;
begin
  SynEdit := ActiveSynEdit;
  if Assigned(SynEdit) then
    SynEdit.ExecuteCommand(ecInsertLine, 'N', nil);
  PageControl.ActivePage.Repaint;
  PageControl.Repaint;
end;

procedure TSQLEditorFrame.DeleteWord;
var
  SynEdit: TBCSynEdit;
begin
  SynEdit := ActiveSynEdit;
  if Assigned(SynEdit) then
    SynEdit.ExecuteCommand(ecDeleteWord, 'T', nil);
  PageControl.ActivePage.Repaint;
  PageControl.Repaint;
end;

procedure TSQLEditorFrame.DeleteLine;
var
  SynEdit: TBCSynEdit;
begin
  SynEdit := ActiveSynEdit;
  if Assigned(SynEdit) then
    SynEdit.ExecuteCommand(ecDeleteLine, 'Y', nil);
  PageControl.ActivePage.Repaint;
  PageControl.Repaint;
end;

procedure TSQLEditorFrame.DeleteEOL;
var
  SynEdit: TBCSynEdit;
begin
  SynEdit := ActiveSynEdit;
  if Assigned(SynEdit) then
    SynEdit.ExecuteCommand(ecDeleteEOL, 'Y', nil);
  PageControl.ActivePage.Repaint;
  PageControl.Repaint;
end;

function TSQLEditorFrame.GetActiveDocumentModified: Boolean;
var
  SynEdit: TBCSynEdit;
begin
  SynEdit := ActiveSynEdit;
  Result := Assigned(SynEdit) and SynEdit.Modified;
end;

function TSQLEditorFrame.IsCompareFilesActivePage: Boolean;
begin
  Result := Assigned(PageControl.ActivePage) and (PageControl.ActivePage.ImageIndex = FCompareImageIndex);
end;

end.
