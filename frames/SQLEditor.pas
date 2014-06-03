unit SQLEditor;

interface

uses
  Winapi.Windows, Winapi.CommDlg, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics, Vcl.Controls,
  Vcl.Forms, Vcl.Dialogs, SynEdit, Vcl.ComCtrls, Vcl.ExtCtrls, Vcl.ImgList, JvExComCtrls, JvComCtrls, Vcl.Menus,
  SynHighlighterSQL, Output, SynEditHighlighter, SynEditPrint, OraError, SynEditMiscClasses, SynEditSearch,
  SynEditTypes, Vcl.Buttons, Vcl.StdCtrls, Vcl.ActnList, JvExExtCtrls, JvSplitter, DAScript, OraScript, MemDS, DBAccess,
  Ora, ToolWin, SynCompletionProposal, JvStringHolder, BCControls.PageControl,
  Vcl.PlatformDefaultStyleActnCtrls, Vcl.ActnPopup, Vcl.ActnMan, BCControls.ToolBar, BCControls.ImageList,
  BCControls.DBGrid, Vcl.Themes, Data.DB, BCControls.CheckBox, SynEditRegexSearch, BCControls.OraSynEdit,
  SQLEditorTabSheet, BCFrames.Compare, SynEditWildcardSearch, System.Actions, Vcl.ActnCtrls, BCControls.ButtonedEdit,
  System.Contnrs, JvExStdCtrls, JvCheckBox;

type
  TSQLEditorFrame = class(TFrame)
    SynEditPrint: TSynEditPrint;
    SynEditSearch: TSynEditSearch;
    SearchPanel: TPanel;
    ActionList: TActionList;
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
    EditorPopupActionBar: TPopupActionBar;
    InsertObjectMenuItem: TMenuItem;
    ColumnsQuery: TOraQuery;
    SQLStringHolder: TJvMultiStringHolder;
    ScriptQuery: TOraQuery;
    Separator7MenuItem: TMenuItem;
    FormatSQLMenuItem: TMenuItem;
    ErrorsQuery: TOraQuery;
    ImageList16: TImageList;
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
    ToggleBookmark1MenuItem: TMenuItem;
    ToggleBookmark2MenuItem: TMenuItem;
    ToggleBookmark3MenuItem: TMenuItem;
    ToggleBookmark4MenuItem: TMenuItem;
    ToggleBookmark5MenuItem: TMenuItem;
    ToggleBookmark6MenuItem: TMenuItem;
    ToggleBookmark7MenuItem: TMenuItem;
    ToggleBookmark8MenuItem: TMenuItem;
    ToggleBookmark9MenuItem: TMenuItem;
    GotoBookmark1MenuItem: TMenuItem;
    GotoBookmark2MenuItem: TMenuItem;
    GotoBookmark3MenuItem: TMenuItem;
    GotoBookmark4MenuItem: TMenuItem;
    GotoBookmark5MenuItem: TMenuItem;
    GotoBookmark6MenuItem: TMenuItem;
    GotoBookmark7MenuItem: TMenuItem;
    GotoBookmark8MenuItem: TMenuItem;
    GotoBookmark9MenuItem: TMenuItem;
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
    CommandToolBar: TBCToolBar;
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
    ImageList20: TBCImageList;
    ImageList24: TBCImageList;
    SearchPanel2: TPanel;
    SearchForLabel: TLabel;
    SearchPanel3: TPanel;
    SearchForEdit: TBCButtonedEdit;
    SearchPanel1: TPanel;
    JvSpeedButton1: TSpeedButton;
    SearchPanel5: TPanel;
    SpeedButton1: TSpeedButton;
    SearchPanel6: TPanel;
    SpeedButton2: TSpeedButton;
    SearchPanel7: TPanel;
    CaseSensitiveCheckBox: TBCCheckBox;
    Panel1: TPanel;
    WholeWordsCheckBox: TBCCheckBox;
    Panel2: TPanel;
    RegularExpressionCheckBox: TBCCheckBox;
    SynEditRegexSearch: TSynEditRegexSearch;
    GotoLinePanel: TPanel;
    GotoLineClosePanel: TPanel;
    GotoLineCloseSpeedButton: TSpeedButton;
    GotoLineLabelPanel: TPanel;
    GotoLineLabel: TLabel;
    LineNumberPanel: TPanel;
    GotoLineNumberEdit: TBCButtonedEdit;
    GotoLineButtonPanel: TPanel;
    GotoLineGoSpeedButton: TSpeedButton;
    GotoLineAction: TAction;
    GotoLineCloseAction: TAction;
    FileCloseToolButton: TToolButton;
    FileCloseAllToolButton: TToolButton;
    SynEditWildcardSearch: TSynEditWildcardSearch;
    ExecuteCurrentToolButton: TToolButton;
    SearchClearAction: TAction;
    GotoLineClearAction: TAction;
    AfterRegularExpressionPanel: TPanel;
    WildCardCheckBox: TBCCheckBox;
    BoxDownAction: TAction;
    BoxLeftAction: TAction;
    BoxRightAction: TAction;
    BoxUpAction: TAction;
    procedure SynEditOnChange(Sender: TObject);
    procedure SynEditorReplaceText(Sender: TObject; const ASearch,
      AReplace: UnicodeString; Line, Column: Integer; DeleteLine: Boolean;
      var Action: TSynReplaceAction);
    procedure PageControlChange(Sender: TObject);
    procedure SearchForEditChange(Sender: TObject);
    procedure SearchCloseActionExecute(Sender: TObject);
    procedure SearchFindNextActionExecute(Sender: TObject);
    procedure SearchFindPreviousActionExecute(Sender: TObject);
    procedure OutputDblClickActionExecute(Sender: TObject);
    procedure OraScriptError(Sender: TObject; E: Exception; SQL: string; var Action: TErrorAction);
    procedure OraSQLAfterExecuteEvent(Sender: TObject; Result: Boolean);
    //procedure OraScriptAfterExecuteEvent(Sender: TObject; SQL: string);
    procedure OraScriptQueryAfterExecuteEvent(Sender: TObject; Result: Boolean);
    procedure ObjectFieldCompletionProposalExecute(Kind: SynCompletionType; Sender: TObject;
      var CurrentInput: UnicodeString; var x, y: Integer; var CanExecute: Boolean);
    procedure DBMSOutputTimer(Sender: TObject);
    procedure OraSessionError(Sender: TObject; E: EDAError; var Fail: Boolean);
    procedure SynEditPaintTransient(Sender: TObject; Canvas: TCanvas; TransientType: TTransientType);
    procedure GotoLineActionExecute(Sender: TObject);
    procedure GotoLineCloseActionExecute(Sender: TObject);
    procedure GotoLineNumberEditKeyPress(Sender: TObject; var Key: Char);
    procedure PageControlCloseButtonClick(Sender: TObject);
    procedure PageControlDblClick(Sender: TObject);
    procedure PageControlMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure SearchClearActionExecute(Sender: TObject);
    procedure GotoLineClearActionExecute(Sender: TObject);
    procedure GotoLineNumberEditChange(Sender: TObject);
    procedure BoxDownActionExecute(Sender: TObject);
    procedure BoxLeftActionExecute(Sender: TObject);
    procedure BoxRightActionExecute(Sender: TObject);
    procedure BoxUpActionExecute(Sender: TObject);
  private
    { Private declarations }
    FCaseCycle: Byte;
    FSelectedText: UnicodeString;
    FNumberOfNewDocument: Integer;
    FOutputFrame: TOutputFrame;
    FSession: TOraSession;
    FObjectNames: TStrings;
    FSchemaParam: string;
    FDBMSTimer: TTimer;
    FCompareImageIndex, FNewImageIndex: Integer;
    FImages: TImageList;
    FProcessing: Boolean;
    FModifiedDocuments: Boolean;
    FFoundSearchItems: TObjectList;
    function CreateNewTabSheet(FileName: string = ''): TBCOraSynEdit;
    function GetActiveTabSheetCaption: string;
    function GetActiveDocumentName: string;
    function GetActiveDocumentFound: Boolean;
    function GetSynEdit(TabSheet: TTabSheet): TBCOraSynEdit;
    function GetSQLEditorTabSheetFrame(TabSheet: TTabSheet): TSQLEditorTabSheetFrame;
    function Save(TabSheet: TTabSheet; ShowDialog: Boolean = False): string; overload;
    procedure InitializeSynEditPrint;
    function GetOpenTabSheets: Boolean;
    function GetSelectionFound: Boolean;
    function GetOpenTabSheetCount: Integer;
    function GetCanUndo: Boolean;
    function GetCanRedo: Boolean;
    function CanFindNextPrevious: Boolean;
    function SearchOptions(IncludeBackwards: Boolean): TSynSearchOptions;
    function FindOpenFile(FileName: string): TBCOraSynEdit;
    procedure SetBookmarks(SynEdit: TBCOraSynEdit; Bookmarks: TStrings);
    procedure DoSearch(SearchOnly: Boolean = False);
    procedure DoSearch2;
    procedure FreePage(TabSheet: TTabSheet);
    procedure AddToReopenFiles(FileName: string);
    procedure SetHighlighterTableNames(Value: TStrings);
    procedure ExecuteStatement(SynEdit: TBCOraSynEdit; SQL: string = ''); overload;
    procedure ExecuteNoRowsStatement(SynEdit: TBCOraSynEdit);
    procedure SetSession(Value: TOraSession);
    procedure EnableDBMSOutput;
    procedure GetDBMSOutput;
    procedure WriteHistory(OraSession: TOraSession; SQL: WideString);
    function GetDataQueryOpened: Boolean;
    function CreateSession(OraSession: TOraSession): TOraSession;
    procedure CheckModifiedDocuments;
    procedure GetUserErrors;
    function RemoveComments(s: WideString): WideString; //SynEdit: TBCOraSynEdit): WideString;
    function RemoveParenthesisFromBegin(Text: WideString): WideString;
    function GetOutputGridHasFocus: Boolean;
    function GetActivePageCaption: string;
    procedure GetText(Sender: TField; var Text: String; DisplayText: Boolean);
    procedure SetClobAndTimestampFields(OraQuery: TOraQuery);
    function GetActiveDocumentModified: Boolean;
    procedure SetActivePageCaptionModified;
    function GetCompareFrame(TabSheet: TTabSheet): TCompareFrame;
    function GetModifiedDocuments(CheckActive: Boolean = True): Boolean;
    function GetInTransAction: Boolean;
    function GetMinimapChecked: Boolean;
    procedure SetSearchMapVisible(Value: Boolean);
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
    procedure CompareFiles(FileName: string = ''; AFileDragDrop: Boolean = False);
    procedure SelectForCompare;
    function GetActiveSynEdit: TBCOraSynEdit;
    function GetCaretInfo: string;
    function GetModifiedInfo: string;
    function GetActiveBookmarkList: TSynEditMarkList;
    procedure AssignOptions;
    procedure CreateActionToolBar(CreateToolBar: Boolean = False);
    property ActiveTabSheetCaption: string read GetActiveTabSheetCaption;
    property ActiveDocumentName: string read GetActiveDocumentName;
    property ActiveDocumentFound: Boolean read GetActiveDocumentFound;
    property ActiveDocumentModified: Boolean read GetActiveDocumentModified;
    property OpenTabSheets: Boolean read GetOpenTabSheets;
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
    property InTransaction: Boolean read GetInTransaction;
    property OpenTabSheetCount: Integer read GetOpenTabSheetCount;
    property Processing: Boolean read FProcessing;
    property ModifiedDocuments: Boolean Read FModifiedDocuments write FModifiedDocuments;
    property MinimapChecked: Boolean read GetMinimapChecked;
    procedure ExecuteStatement(Current: Boolean = False); overload;
    procedure ExecuteCurrentStatement;
    procedure ExecuteScript(Current: Boolean = False);
    procedure ShowObjects;
    procedure ExplainPlan;
    procedure DecreaseIndent;
    procedure IncreaseIndent;
    procedure ToggleCase;
    procedure SortAsc;
    procedure SortDesc;
    procedure ToggleMiniMap;
    procedure ClearBookmarks;
    procedure InsertLine;
    procedure DeleteWord;
    procedure DeleteLine;
    procedure DeleteEOL;
    procedure UpdateMarginsAndControls;
    procedure UpdateMarginAndColors(SQLEditorTabSheetFrame: TSQLEditorTabSheetFrame);
    procedure RepaintToolButtons;
    function IsCompareFilesActivePage: Boolean;
    procedure GotoBookmarks(ItemIndex: Integer);
    procedure ToggleBookmarks(ItemIndex: Integer);
    procedure GotoLine;
  end;

implementation

{$R *.dfm}

uses
  SynEditKeyCmds, BCForms.PrintPreview, BCDialogs.Replace, BCDialogs.ConfirmReplace, Lib, BCCommon.StyleUtils, SynUnicode,
  BCCommon.OptionsContainer, System.Math, BCCommon.FileUtils, BCCommon.Messages, BCCommon.Images,
  Types, Parameters, BCSQL.Tokenizer, SQLProgress, QueryProgress, Main, BigIni, BCCommon.Lib, BCCommon.StringUtils,
  AnsiStrings, ShellAPI, WideStrings, Vcl.GraphUtil, BCCommon.Dialogs, BCCommon.LanguageStrings, SynEditPrintTypes,
  SynEditSearchHighlighter;

const
  DEFAULT_FILENAME = 'Sql';

{ TSQLEditorFrame }

function TSQLEditorFrame.GetDataQueryOpened: Boolean;
begin
  Result := GetActiveSynEdit.QueryOpened and Assigned(FOutputFrame) and (FOutputFrame.PageControl.PageCount > 0) and (FOutputFrame.PageControl.ActivePage.ImageIndex = IMAGE_INDEX_GRID);
end;

function TSQLEditorFrame.GetSQLEditorTabSheetFrame(TabSheet: TTabSheet): TSQLEditorTabSheetFrame;
begin
  Result := nil;
  if Assigned(TabSheet) then
    if TabSheet.ComponentCount <> 0 then
      if TabSheet.Components[0] is TSQLEditorTabSheetFrame then
        Result := TSQLEditorTabSheetFrame(TabSheet.Components[0]);
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
  Icon: TIcon;
begin
  inherited Create(AOwner);
  FNumberOfNewDocument := 0;
  FCaseCycle := 0;
  FSelectedText := '';
  FProcessing := False;
  FModifiedDocuments := False;
  FOutputFrame := TOutputFrame.Create(OutputPanel);
  FOutputFrame.Parent := OutputPanel;
  FOutputFrame.OnTabsheetDblClick := OutputDblClickActionExecute;
  FOutputFrame.OnOpenAll := OutputOpenAllEvent;
  FFoundSearchItems := TObjectList.Create;
  { IDE can lose these, if the main form is not open }
  EditorPopupActionBar.Images := ImagesDataModule.ImageList;
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
  
  ToggleBookmarkMenuItem.Action := MainForm.SearchToggleBookmarkAction;
  ToggleBookmarksMenuItem.Action := MainForm.SearchToggleBookmarksAction;
  ToggleBookmark1MenuItem.Action := MainForm.ToggleBookmarks1Action;
  ToggleBookmark2MenuItem.Action := MainForm.ToggleBookmarks2Action;
  ToggleBookmark3MenuItem.Action := MainForm.ToggleBookmarks3Action;
  ToggleBookmark4MenuItem.Action := MainForm.ToggleBookmarks4Action;
  ToggleBookmark5MenuItem.Action := MainForm.ToggleBookmarks5Action;
  ToggleBookmark6MenuItem.Action := MainForm.ToggleBookmarks6Action;
  ToggleBookmark7MenuItem.Action := MainForm.ToggleBookmarks7Action;
  ToggleBookmark8MenuItem.Action := MainForm.ToggleBookmarks8Action;
  ToggleBookmark9MenuItem.Action := MainForm.ToggleBookmarks9Action;
  GotoBookmarksMenuItem.Action := MainForm.SearchGotoBookmarksAction;
  ClearBookmarksMenuItem.Action := MainForm.SearchClearBookmarksAction;
  GotoBookmark1MenuItem.Action := MainForm.GotoBookmarks1Action;
  GotoBookmark2MenuItem.Action := MainForm.GotoBookmarks2Action;
  GotoBookmark3MenuItem.Action := MainForm.GotoBookmarks3Action;
  GotoBookmark4MenuItem.Action := MainForm.GotoBookmarks4Action;
  GotoBookmark5MenuItem.Action := MainForm.GotoBookmarks5Action;
  GotoBookmark6MenuItem.Action := MainForm.GotoBookmarks6Action;
  GotoBookmark7MenuItem.Action := MainForm.GotoBookmarks7Action;
  GotoBookmark8MenuItem.Action := MainForm.GotoBookmarks8Action;
  GotoBookmark9MenuItem.Action := MainForm.GotoBookmarks9Action;

  FImages := TImageList.Create(Self);
  SysImageList := GetSysImageList;
  if SysImageList <> 0 then
  begin
    FImages.Handle := SysImageList;
    FImages.BkColor := ClNone;
    FImages.ShareImages := True;
  end;
  PageControl.Images := FImages;
  { compare and new image index }
  Icon := TIcon.Create;
  try
    { Windows font size causing a problem: Icon size will be smaller than PageControl.Images size }
    case PageControl.Images.Height of
      16:
      begin
        { smaller }
        ImageList16.GetIcon(0, Icon);
        FCompareImageIndex := PageControl.Images.AddIcon(Icon);
        ImageList16.GetIcon(1, Icon);
        FNewImageIndex := PageControl.Images.AddIcon(Icon);
      end;
      20:
      begin
        { medium }
        ImageList20.GetIcon(0, Icon);
        FCompareImageIndex := PageControl.Images.AddIcon(Icon);
        ImageList20.GetIcon(1, Icon);
        FNewImageIndex := PageControl.Images.AddIcon(Icon);
      end;
      24:
      begin
        { larger }
        ImageList24.GetIcon(0, Icon);
        FCompareImageIndex := PageControl.Images.AddIcon(Icon);
        ImageList24.GetIcon(1, Icon);
        FNewImageIndex := PageControl.Images.AddIcon(Icon);
      end;
    end;
  finally
    Icon.Free;
  end;
  CreateActionToolBar(True);
end;

procedure TSQLEditorFrame.FreePage(TabSheet: TTabSheet);
var
  SQLEditorTabSheetFrame: TSQLEditorTabSheetFrame;
  SynEdit: TBCOraSynEdit;
begin
  SQLEditorTabSheetFrame := GetSQLEditorTabSheetFrame(TabSheet);
  if Assigned(SQLEditorTabSheetFrame) then
  begin
    SynEdit := SQLEditorTabSheetFrame.OraSynEdit;
    if Assigned(SynEdit) then
    begin
      if Assigned(SynEdit.OraQuery) then
        SynEdit.OraQuery.Free;
      if Assigned(SynEdit.PlanQuery) then
        SynEdit.PlanQuery.Free;
      if Assigned(SynEdit.ObjectCompletionProposal) then
        SynEdit.ObjectCompletionProposal.Free;
      if Assigned(SynEdit.ObjectFieldCompletionProposal) then
        SynEdit.ObjectFieldCompletionProposal.Free;
    end;
    SQLEditorTabSheetFrame.Free;
    TabSheet.Free;
  end;
end;

destructor TSQLEditorFrame.Destroy;
begin
  FFoundSearchItems.Free;
  if Assigned(FObjectNames) then
    FObjectNames.Free;
  PageControl.Images.Free;

  inherited Destroy;
end;

function TSQLEditorFrame.CreateNewTabSheet(FileName: string = ''): TBCOraSynEdit;
var
  TabSheet: TTabSheet;
  SQLEditorTabSheetFrame: TSQLEditorTabSheetFrame;
begin
  { create a TabSheet }
  TabSheet := TTabSheet.Create(PageControl);
  TabSheet.PageControl := PageControl;
  if FileName <> '' then
    TabSheet.ImageIndex := GetIconIndex(FileName)
  else
    TabSheet.ImageIndex := FNewImageIndex;

  PageControl.ActivePage := TabSheet;

  SetSearchMapVisible(SearchPanel.Visible);
  if SearchPanel.Visible then
    if OptionsContainer.DocumentSpecificSearch then
      SearchForEdit.Text := '';

  { set the Caption property }
  if FileName = '' then
    PageControl.ActivePageCaption := DEFAULT_FILENAME + IntToStr(FNumberOfNewDocument)
  else
    PageControl.ActivePageCaption := ExtractFileName(FileName);

  { create a SynEdit }
  SQLEditorTabSheetFrame := TSQLEditorTabSheetFrame.Create(TabSheet);
  with SQLEditorTabSheetFrame do
  begin
    OraSynEdit.Visible := False;
    Parent := TabSheet;
    with OraSynEdit do
    begin
      DocumentName := FileName;
      FileDateTime := GetFileDateTime(FileName);
      OnChange := SynEditOnChange;
      OnReplaceText := SynEditorReplaceText;
      SearchEngine := SynEditSearch;
      Highlighter := SynSQLSyn;
      PopupMenu := EditorPopupActionBar;
      OnPaintTransient := SynEditPaintTransient;
      BookMarkOptions.BookmarkImages := BookmarkImagesList;
    end;
    { Search highlighter plugin }
    THighlightSearchPlugin.Create(OraSynEdit, FFoundSearchItems);

    OptionsContainer.AssignTo(OraSynEdit);
    UpdateMarginAndColors(SQLEditorTabSheetFrame);

    OraSynEdit.ObjectCompletionProposal := TSynCompletionProposal.Create(nil);
    with OraSynEdit.ObjectCompletionProposal do
    begin
      Editor := OraSynEdit;
      ShortCut := TextToShortCut('Ctrl+O');
      Options := Options + [scoUseInsertList, scoCompleteWithTab, scoCompleteWithEnter, scoLimitToMatchedText];
      InsertList.Assign(SynSQLSyn.TableNames);
      ItemList.Assign(FObjectNames);
    end;

    OraSynEdit.ObjectFieldCompletionProposal := TSynCompletionProposal.Create(nil);
    with OraSynEdit.ObjectFieldCompletionProposal do
    begin
      Editor := OraSynEdit;
      ShortCut := TextToShortCut('');
      Options := Options + [scoUseInsertList, scoUseBuiltInTimer, scoCompleteWithTab, scoCompleteWithEnter, scoLimitToMatchedText];
      TimerInterval := 500;
      TriggerChars := '.';
      OnExecute := ObjectFieldCompletionProposalExecute
    end;

    if Filename <> '' then
      OraSynEdit.Lines.LoadFromFile(FileName);

    Application.ProcessMessages;
    OraSynEdit.Visible := True;
    if Visible and OraSynEdit.CanFocus then
      OraSynEdit.SetFocus;
    Result := OraSynEdit;
  end;
end;

procedure TSQLEditorFrame.UpdateMarginsAndControls;
var
  i, Right: Integer;
  SQLEditorTabSheetFrame: TSQLEditorTabSheetFrame;
  CompareFrame: TCompareFrame;
begin
  PageControl.DoubleBuffered := OptionsContainer.EditorDoubleBuffered;
  PageControl.MultiLine := OptionsContainer.EditorMultiLine;
  PageControl.ShowCloseButton := OptionsContainer.EditorShowCloseButton;
  PageControl.RightClickSelect := OptionsContainer.EditorRightClickSelect;
  if OptionsContainer.EditorShowImage then
    PageControl.Images := FImages
  else
    PageControl.Images := nil;
  FOutputFrame.UpdateControls;
  Application.ProcessMessages;
  Right := GetRightPadding;
  for i := 0 to PageControl.PageCount - 1 do
  begin
    SQLEditorTabSheetFrame := GetSQLEditorTabSheetFrame(PageControl.Pages[i]);
    if Assigned(SQLEditorTabSheetFrame) then
    begin
      UpdateMarginAndColors(SQLEditorTabSheetFrame);
      SQLEditorTabSheetFrame.UpdateOptionsAndStyles(Right);
    end;
    CompareFrame := GetCompareFrame(PageControl.Pages[i]);
    if Assigned(CompareFrame) then
      CompareFrame.Panel.Padding.Right := Right
  end;
  UpdateSQLSynColors(SynSQLSyn);
end;

procedure TSQLEditorFrame.UpdateMarginAndColors(SQLEditorTabSheetFrame: TSQLEditorTabSheetFrame);
begin
  BCCommon.StyleUtils.UpdateMargin(SQLEditorTabSheetFrame.OraSynEdit);
  SQLEditorTabSheetFrame.OraSynEdit.ActiveLineColor := LightenColor(SQLEditorTabSheetFrame.OraSynEdit.Color, 1 - (10 - OptionsContainer.ColorBrightness)/10);
end;

procedure TSQLEditorFrame.SynEditPaintTransient(Sender: TObject; Canvas: TCanvas; TransientType: TTransientType);
var
  Editor : TSynEdit;
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
  Editor := TSynEdit(Sender);

  if Editor.SelAvail then
    Exit;
  if Length(Editor.Text) = 0 then
    Exit;

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

  if Start < Length(Editor.Text) then
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

function TSQLEditorFrame.GetCompareFrame(TabSheet: TTabSheet): TCompareFrame;
begin
  Result := nil;
  if Assigned(TabSheet) then
    if TabSheet.ComponentCount <> 0 then
      if TabSheet.Components[0] is TCompareFrame then
        Result := TCompareFrame(TabSheet.Components[0]);
end;

procedure TSQLEditorFrame.CompareFiles(FileName: string; AFileDragDrop: Boolean);
var
  i: Integer;
  TabSheet: TTabSheet;
  Frame: TCompareFrame;
  TempList: TStringList;
  SynEdit: TBCOraSynEdit;
begin
  SearchPanel.Visible := False;
  GotoLinePanel.Visible := False;
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
        Frame := GetCompareFrame(PageControl.Pages[i]);
        { if there already are two files to compare then continue }
        if Frame.ComparedFilesSet then
          Continue
        else
        begin
          { else set file and exit}
          PageControl.ActivePageIndex := i;
          Frame.SetCompareFile(Filename, AFileDragDrop);
          Exit;
        end;
      end;
  end;
  { create a TabSheet }
  TabSheet := TTabSheet.Create(PageControl);
  TabSheet.PageControl := PageControl;
  TabSheet.ImageIndex := FCompareImageIndex;
  TabSheet.Caption := LanguageDataModule.GetConstant('CompareFiles');
  PageControl.UpdatePageCaption(TabSheet);
  PageControl.ActivePage := TabSheet;
  { create a compare frame }
  Frame := TCompareFrame.Create(TabSheet);
  with Frame do
  begin
    Parent := TabSheet;
    Align := alClient;
    OpenDocumentsList := TempList;
    SetCompareFile(Filename);
    SpecialChars := OptionsContainer.EnableSpecialChars;
    LineNumbers := OptionsContainer.EnableLineNumbers;
  end;
end;

procedure TSQLEditorFrame.SelectForCompare;
begin
  CompareFiles(GetActiveSynEdit.DocumentName);
end;

function TSQLEditorFrame.FindOpenFile(FileName: string): TBCOraSynEdit;
var
  i: Integer;
  SynEdit: TBCOraSynEdit;
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

procedure TSQLEditorFrame.SetBookmarks(SynEdit: TBCOraSynEdit; Bookmarks: TStrings);
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

procedure TSQLEditorFrame.AddToReopenFiles(FileName: string);
var
  i: Integer;
  Files: TStrings;
begin
  Files := TStringList.Create;
  { Read section }
  with TBigIniFile.Create(GetINIFilename) do
  try
    ReadSectionValues('FileReopenFiles', Files);
  finally
    Free;
  end;
  { Insert filename }
  for i := 0 to Files.Count - 1 do
    Files[i] := System.Copy(Files[i], Pos('=', Files[i]) + 1, Length(Files[i]));
  for i := Files.Count - 1 downto 0 do
    if Files[i] = FileName then
      Files.Delete(i);
  Files.Insert(0, FileName);
  while Files.Count > 10 do
    Files.Delete(Files.Count - 1);
  { write section }
  with TBigIniFile.Create(GetINIFilename) do
  try
    EraseSection('FileReopenFiles');
    for i := 0 to Files.Count - 1 do
      WriteString('FileReopenFiles', IntToStr(i), Files.Strings[i]);
  finally
    Free;
  end;
end;

procedure TSQLEditorFrame.Open(FileName: string = ''; Bookmarks: TStrings = nil;
  Ln: Integer = 0; Ch: Integer = 0);
var
  i: Integer;
  SynEdit: TBCOraSynEdit;
begin
  FProcessing := True;
  try
    if FileName = '' then
    begin
      if BCCommon.Dialogs.OpenFiles(Handle, '',
        Format('%s'#0'*.*'#0, [LanguageDataModule.GetConstant('AllFiles')]) + 'SQL files (*.sql)'#0'*.sql'#0#0, LanguageDataModule.GetConstant('Open')) then
      begin
        Application.ProcessMessages; { style fix }
        for i := 0 to BCCommon.Dialogs.Files.Count - 1 do
          Open(BCCommon.Dialogs.Files[i])
      end;
    end
    else
    begin
      if FileExists(FileName) then
      begin
        SynEdit := FindOpenFile(FileName);
        if not Assigned(SynEdit) then
          SynEdit := CreateNewTabSheet(FileName);
        DoSearch2;
        SynEdit.CaretXY := BufferCoord(Ch, Ln);
        SynEdit.GotoLineAndCenter(Ln);
        SetBookmarks(SynEdit, Bookmarks);
        if SynEdit.CanFocus then
          SynEdit.SetFocus;
        AddToReopenFiles(FileName);
        MainForm.CreateFileReopenList;
      end
      else
      if ExtractFileName(FileName) <> '' then
        ShowErrorMessage(Format(LanguageDataModule.GetErrorMessage('FileNotFound'), [Filename]))
    end;
  finally
    FProcessing := False;
  end;
end;

function TSQLEditorFrame.GetActivePageCaption: string;
begin
  Result := PageControl.ActivePageCaption;
  if Pos('~', Result) = Length(Result) then
    Result := System.Copy(Result, 0, Length(Result) - 1);
end;

procedure TSQLEditorFrame.OraScriptError(Sender: TObject; E: Exception; SQL: string;
  var Action: TErrorAction);
begin
  FOutputFrame.AddErrors('Errors: ' + GetActivePageCaption, E.Message);
  Action := eaFail;
end;

procedure TSQLEditorFrame.Close(IncludeCancel: Boolean);
var
  ActivePageIndex: Integer;
  Rslt: Integer;
  SynEdit: TBCOraSynEdit;
begin
  Rslt := mrNone;

  SynEdit := GetActiveSynEdit;
  if Assigned(SynEdit) and SynEdit.Modified then
  begin
    Rslt := SaveChanges(IncludeCancel);
    if Rslt = mrYes then
      Save;
  end;

  if Rslt <> mrCancel then
  begin
    PageControl.TabClosed := True;
    ActivePageIndex := PageControl.ActivePageIndex;
    { Fixed Delphi Bug: http://qc.embarcadero.com/wc/qcmain.aspx?d=5473 }
    if (ActivePageIndex = PageControl.PageCount - 1) and (PageControl.PageCount > 1) then
    begin
      Dec(ActivePageIndex);
      PageControl.ActivePage.PageIndex := ActivePageIndex;
    end;
    if PageControl.PageCount > 0 then
      FreePage(PageControl.Pages[ActivePageIndex]);
    if PageControl.PageCount = 0 then
      FNumberOfNewDocument := 0;
  end;
  DoSearch2;
  CheckModifiedDocuments;
end;

function TSQLEditorFrame.CloseAll(CloseDocuments: Boolean; IncludeCancel: Boolean): Integer;
var
  i, j: Integer;
begin
  Result := mrNone;

  if FModifiedDocuments then
  begin
    Result := SaveChanges(IncludeCancel);
    if Result = mrYes then
      SaveAll;
  end;
  if CloseDocuments and (Result <> mrCancel) then
  begin
    j := PageControl.PageCount - 1;
    for i := j downto 0 do
      FreePage(PageControl.Pages[i]);
    FNumberOfNewDocument := 0;
    Result := mrYes;
  end;
  CheckModifiedDocuments;
end;

procedure TSQLEditorFrame.CloseAllOtherPages;
var
  i, j: Integer;
  Rslt: Integer;
  ActiveSynEdit, SynEdit: TBCOraSynEdit;
begin
  FProcessing := True;
  Application.ProcessMessages;
  Rslt := mrNone;

  ActiveSynEdit := GetActiveSynEdit;

  if GetModifiedDocuments(False) then
  begin
    Rslt := SaveChanges(True);

    if Rslt = mrYes then
      for i := 0 to PageControl.PageCount - 1 do
      begin
        SynEdit := GetSynEdit(PageControl.Pages[i]);
        if Assigned(SynEdit) and SynEdit.Modified and (Synedit <> ActiveSynEdit) then
          Save(PageControl.Pages[i]);
      end;
  end;

  if Rslt <> mrCancel then
  begin
    PageControl.ActivePage.PageIndex := 0; { move the page first }

    j := PageControl.PageCount - 1;
    for i := j downto 1 do
      FreePage(PageControl.Pages[i]);

    if GetActiveSynEdit.DocumentName = '' then
      FNumberOfNewDocument := 1
    else
      FNumberOfNewDocument := 0
  end;
  DoSearch2;
  CheckModifiedDocuments;
  FProcessing := False;
end;

procedure TSQLEditorFrame.CheckModifiedDocuments;
begin
  FModifiedDocuments := GetModifiedDocuments;
end;

function TSQLEditorFrame.Save(TabSheet: TTabSheet; ShowDialog: Boolean): string;
var
  OraSynEdit: TBCOraSynEdit;
  AFileName: string;
  FilterIndex: Cardinal;
begin
  Result := '';
  OraSynEdit := GetSynEdit(TabSheet);
  Screen.Cursor := crHourGlass;
  try
    if Assigned(OraSynEdit) then
    begin
      if (OraSynEdit.DocumentName = '') or ShowDialog then
      begin
        AFileName := Trim(TabSheet.Caption);
        if Pos('~', AFileName) = Length(AFileName) then
          AFileName := System.Copy(AFileName, 0, Length(AFileName) - 1);

        if BCCommon.Dialogs.SaveFile(Handle, '',
          Format('%s'#0'*.*'#0, [LanguageDataModule.GetConstant('AllFiles')]) + 'SQL files (*.sql)'#0'*.sql'#0#0, LanguageDataModule.GetConstant('SaveAs'), FilterIndex, AFileName, 'sql') then
        begin
          Application.ProcessMessages; { style fix }
          Result := BCCommon.Dialogs.Files[0];
          PageControl.ActivePageCaption := ExtractFileName(Result);
          OraSynEdit.DocumentName := Result;
        end
        else
        begin
          if OraSynEdit.CanFocus then
            OraSynEdit.SetFocus;
          Exit;
        end;
      end;
      with OraSynEdit do
      begin
        Lines.SaveToFile(DocumentName);
        if not OptionsContainer.UndoAfterSave then
          UndoList.Clear;
        FileDateTime := GetFileDateTime(DocumentName);
        TabSheet.ImageIndex := GetIconIndex(DocumentName);
        Modified := False;
        AFileName := Trim(TabSheet.Caption);
        if Pos('~', AFileName) = Length(AFileName) then
          TabSheet.Caption := System.Copy(AFileName, 0, Length(AFileName) - 1);
        PageControl.UpdatePageCaption(TabSheet);
      end;
      CheckModifiedDocuments;
    end;
  finally
    Screen.Cursor := crDefault;
  end;
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
  SynEdit: TBCOraSynEdit;
begin
  for i := 0 to PageControl.PageCount - 1 do
  begin
    SynEdit := GetSynEdit(PageControl.Pages[i]);
    if Assigned(SynEdit) and SynEdit.Modified then
      Save(PageControl.Pages[i]);
  end;
end;

procedure TSQLEditorFrame.Undo;
var
  SynEdit: TBCOraSynEdit;
begin
  SynEdit := GetActiveSynEdit;
  SynEdit.Undo;
  if SynEdit.UndoList.ItemCount = 0 then
    PageControl.ActivePageCaption := GetActivePageCaption;
  CheckModifiedDocuments;
end;

procedure TSQLEditorFrame.Redo;
var
  SynEdit: TBCOraSynEdit;
begin
  SynEdit := GetActiveSynEdit;
  if Assigned(SynEdit) then
    SynEdit.Redo;
  CheckModifiedDocuments;
end;

procedure TSQLEditorFrame.Cut;
var
  SynEdit: TBCOraSynEdit;
begin
  SynEdit := GetActiveSynEdit;
  if Assigned(SynEdit) then
    SynEdit.CutToClipboard;
end;

procedure TSQLEditorFrame.CopyToClipboard;
var
  SynEdit: TBCOraSynEdit;
begin
  SynEdit := GetActiveSynEdit;
  if SynEdit.Focused then
    SynEdit.CopyToClipboard
  else
    FOutputFrame.CopyToClipboard;
end;

procedure TSQLEditorFrame.PageControlChange(Sender: TObject);
var
  BufferCoord: TBufferCoord;
  SynEdit: TBCOraSynEdit;

  procedure PositionAndSearch;
  begin
    SynEdit.RightEdge.Position := OptionsContainer.MarginRightMargin;
    if SearchPanel.Visible then
    begin
      if OptionsContainer.DocumentSpecificSearch and (SearchForEdit.Text <> SynEdit.SearchString) then
        SearchForEdit.Text := SynEdit.SearchString
      else
        DoSearch(True);
    end;
  end;

begin
  if FProcessing then
    Exit;
  SynEdit := GetActiveSynEdit;
  if Assigned(SynEdit) then
  begin
    BufferCoord := SynEdit.CaretXY;
    PositionAndSearch;
    SynEdit.CaretXY := BufferCoord;
  end
  else
  begin
    SearchCloseAction.Execute;
    GotoLineCloseAction.Execute;
  end;
  CheckFileDateTimes; { compare can change file datetime }
  PageControl.Repaint;
end;

procedure TSQLEditorFrame.PageControlCloseButtonClick(Sender: TObject);
begin
  Close;
end;

procedure TSQLEditorFrame.PageControlDblClick(Sender: TObject);
begin
  if OptionsContainer.EditorCloseTabByDblClick then
    Close;
end;

procedure TSQLEditorFrame.PageControlMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X,
  Y: Integer);
begin
  if (Button = mbMiddle) and OptionsContainer.EditorCloseTabByMiddleClick then
    Close
end;

procedure TSQLEditorFrame.Paste;
var
  SynEdit: TBCOraSynEdit;
begin
  SynEdit := GetActiveSynEdit;
  if Assigned(SynEdit) and SynEdit.Focused then
    SynEdit.PasteFromClipboard
  else
  if SearchPanel.Visible then
    SearchForEdit.PasteFromClipboard;
end;

procedure TSQLEditorFrame.InitializeSynEditPrint;
var
  SynEdit: TBCOraSynEdit;
  Alignment: TAlignment;

  procedure SetHeaderFooter(Option: Integer; Value: string);
  begin
    case Option of
    0, 1:
      with SynEditPrint.Footer do
      begin
        case Option of
          0: Alignment := taLeftJustify;
          1: Alignment := taRightJustify;
        end;
        Add(Value, nil, Alignment, 1);
      end;
    2, 3:
      with SynEditPrint.Header do
      begin
        case Option of
          2: Alignment := taLeftJustify;
          3: Alignment := taRightJustify;
        end;
        Add(Value, nil, Alignment, 1);
      end;
    end;
  end;

begin
  SynEdit := GetActiveSynEdit;
  SynEditPrint.Header.Clear;
  SynEditPrint.Footer.Clear;

  SetHeaderFooter(OptionsContainer.PrintDocumentName, SynEdit.DocumentName);
  SetHeaderFooter(OptionsContainer.PrintPageNumber, LanguageDataModule.GetConstant('PreviewDocumentPage'));
  SetHeaderFooter(OptionsContainer.PrintPrintedBy, Format(LanguageDataModule.GetConstant('PrintedBy'), [Application.Title]));
  SetHeaderFooter(OptionsContainer.PrintDateTime, '$DATE$ $TIME$');

  if OptionsContainer.PrintShowHeaderLine then
    SynEditPrint.Header.FrameTypes := [ftLine]
  else
    SynEditPrint.Header.FrameTypes := [];

  if OptionsContainer.PrintShowFooterLine then
    SynEditPrint.Footer.FrameTypes := [ftLine]
  else
    SynEditPrint.Footer.FrameTypes := [];
  SynEditPrint.LineNumbers := OptionsContainer.PrintShowLineNumbers;
  SynEditPrint.Wrap := OptionsContainer.PrintWordWrapLine;

  SynEditPrint.SynEdit := SynEdit;
  SynEditPrint.Title := SynEdit.DocumentName;
end;

procedure TSQLEditorFrame.Print;
var
  PrintDlgRec: TPrintDlg;
begin
  if BCCommon.Dialogs.Print(Handle, PrintDlgRec) then
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
var
  SynEdit: TBCOraSynEdit;
begin
  SearchPanel.Show;
  SetSearchMapVisible(True);

  SynEdit := GetActiveSynEdit;
  if Assigned(SynEdit) then
  begin
    SearchPanel.Height := SearchForEdit.Height;
    if SynEdit.SelAvail then
      SearchForEdit.Text := SynEdit.SelText
    else
    if OptionsContainer.DocumentSpecificSearch then
      SearchForEdit.Text := SynEdit.SearchString;
    if SearchForEdit.CanFocus then
      SearchForEdit.SetFocus;
    SynEdit.CaretXY := BufferCoord(0, 0);
    DoSearch;
  end;
end;

procedure TSQLEditorFrame.DoSearch(SearchOnly: Boolean = False);
var
  SynSearchOptions: TSynSearchOptions;
  SynEdit: TBCOraSynEdit;
begin
  if not SearchPanel.Visible then
    Exit;

  SynEdit := GetActiveSynEdit;
  if not Assigned(SynEdit) then
    Exit;

  SynEdit.SearchString := SearchForEdit.Text;

  if RegularExpressionCheckBox.Checked then
    SynEdit.SearchEngine := SynEditRegexSearch
  else
  if WildCardCheckBox.Checked then
    SynEdit.SearchEngine := SynEditWildCardSearch
  else
    SynEdit.SearchEngine := SynEditSearch;
  SynSearchOptions := SearchOptions(False);

  try
    FFoundSearchItems.Clear;
    if not SynEdit.FindSearchTerm(SearchForEdit.Text, FFoundSearchItems, SynSearchOptions) then
    begin
      if not SearchOnly then
      begin
        if OptionsContainer.BeepIfSearchStringNotFound then
          MessageBeep;
        SynEdit.BlockBegin := SynEdit.BlockEnd;
        SynEdit.CaretXY := SynEdit.BlockBegin;
        if OptionsContainer.ShowSearchStringNotFound then
          ShowMessage(Format(LanguageDataModule.GetYesOrNoMessage('SearchStringNotFound'), [SearchForEdit.Text]));
        PageControl.TabClosed := True; { just to avoid begin drag }
      end;
    end
    else
    if not SearchOnly then
      FindNext;
    SynEdit.Invalidate;
  except
    { silent }
  end;
end;

procedure TSQLEditorFrame.DoSearch2;
var
  SynEdit: TBCOraSynEdit;
begin
  SynEdit := GetActiveSynEdit;
  if not Assigned(SynEdit) then
    Exit;
  SetSearchMapVisible(SearchPanel.Visible);
  if SearchPanel.Visible then
  begin
    if OptionsContainer.DocumentSpecificSearch then
      SearchForEdit.Text := SynEdit.SearchString;
    DoSearch(True);
  end;
  if SynEdit.CanFocus then
    SynEdit.SetFocus;
end;

procedure TSQLEditorFrame.SearchClearActionExecute(Sender: TObject);
begin
  SearchForEdit.Text := '';
end;

procedure TSQLEditorFrame.SearchCloseActionExecute(Sender: TObject);
begin
  SearchForEdit.Text := '';
  SearchPanel.Hide;
  SetSearchMapVisible(False);
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
var
  SynEdit: TBCOraSynEdit;
  CaretXY: TBufferCoord;
begin
  SearchForEdit.RightButton.Visible := Trim(SearchForEdit.Text) <> '';
  SynEdit := GetActiveSynEdit;
  if Assigned(SynEdit) then
  begin
    CaretXY := SynEdit.CaretXY;
    SynEdit.CaretXY := BufferCoord(0, 0);
    SearchFindNextAction.Enabled := CanFindNextPrevious;
    SearchFindPreviousAction.Enabled := SearchFindNextAction.Enabled;
    DoSearch;
    if Trim(SearchForEdit.Text) = '' then
    begin
      SynEdit.GotoLineAndCenter(CaretXY.Line);
      SynEdit.CaretXY := CaretXY;
    end;
  end;
end;

procedure TSQLEditorFrame.FindNext;
var
  SynSearchOptions: TSynSearchOptions;
  SynEdit: TBCOraSynEdit;
begin
  if SearchForEdit.Text = '' then
    Exit;
  SynSearchOptions := SearchOptions(False);
  SynEdit := GetActiveSynEdit;

  if SynEdit.SearchReplace(SearchForEdit.Text, '', SynSearchOptions) = 0 then
  begin
    if OptionsContainer.BeepIfSearchStringNotFound then
      MessageBeep;
    SynEdit.BlockBegin := SynEdit.BlockEnd;
    SynEdit.CaretXY := SynEdit.BlockBegin;
    if (SynEdit.CaretX = 1) and (SynEdit.CaretY = 1) then
    begin
      if OptionsContainer.ShowSearchStringNotFound then
        ShowMessage(Format(LanguageDataModule.GetYesOrNoMessage('SearchStringNotFound'), [SearchForEdit.Text]))
    end
    else
    if AskYesOrNo(Format(LanguageDataModule.GetYesOrNoMessage('SearchMatchNotFound'), [CHR_DOUBLE_ENTER])) then
    begin
      SynEdit.CaretX := 0;
      SynEdit.CaretY := 0;
      FindNext;
    end;
  end;
end;

procedure TSQLEditorFrame.FindPrevious;
var
  SynSearchOptions: TSynSearchOptions;
  SynEdit: TBCOraSynEdit;
begin
  if SearchForEdit.Text = '' then
    Exit;
  SynSearchOptions := SearchOptions(True);
  SynEdit := GetActiveSynEdit;
  if SynEdit.SearchReplace(SearchForEdit.Text, '', SynSearchOptions) = 0 then
  begin
    MessageBeep;
    SynEdit.BlockEnd := SynEdit.BlockBegin;
    SynEdit.CaretXY := SynEdit.BlockBegin;
  end;
end;

procedure TSQLEditorFrame.Replace;
var
  SynSearchOptions: TSynSearchOptions;
  SynEdit: TBCOraSynEdit;
  i, MResult: Integer;
begin
  with ReplaceDialog do
  begin
    SynEdit := GetActiveSynEdit;
    if SynEdit.SelAvail then
      SearchForComboBox.Text := SynEdit.SelText;
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
        SynEdit.CaretXY := BufferCoord(0, 0);
        SynEdit.SearchReplace(SearchText, ReplaceText, SynSearchOptions);
      end
      else
      begin
        FProcessing := True;
        Screen.Cursor := crHourGlass;
        for i := 0 to PageControl.PageCount - 1 do
        begin
          PageControl.ActivePageIndex := i;
          SynEdit := GetActiveSynEdit;
          if Assigned(SynEdit) then
          begin
            SynEdit.CaretXY := BufferCoord(0, 0);
            SynEdit.SearchReplace(SearchText, ReplaceText, SynSearchOptions);

            PageControl.Pages[i].Caption := FormatFileName(PageControl.Pages[i].Caption, SynEdit.Modified);
            PageControl.UpdatePageCaption(PageControl.Pages[i]);
          end;
        end;
        Screen.Cursor := crDefault;
        FProcessing := False;
      end;
    end;
  end;
end;

function TSQLEditorFrame.CanFindNextPrevious: Boolean;
begin
  Result := SearchForEdit.Text <> '';
end;

function TSQLEditorFrame.WordWrap: Boolean;
var
  SynEdit: TBCOraSynEdit;
begin
  Result := False;
  SynEdit := GetActiveSynEdit;
  if Assigned(SynEdit) then
    Result := SynEdit.WordWrap.Enabled;
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
      SynEdit.WordWrap.Enabled := not SynEdit.WordWrap.Enabled;
      Result := SynEdit.WordWrap.Enabled;
    end;
  end;
end;

function TSQLEditorFrame.SpecialChars: Boolean;
var
  SynEdit: TBCOraSynEdit;
begin
  Result := False;
  SynEdit := GetActiveSynEdit;
  if Assigned(SynEdit) then
    Result := eoShowSpecialChars in SynEdit.Options;
end;

function TSQLEditorFrame.GetOpenTabSheetCount: Integer;
begin
  Result := PageControl.PageCount;
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
    if PageControl.Pages[i].Components[0] is TCompareFrame then
      Result := TCompareFrame(PageControl.Pages[i].Components[0]).ToggleSpecialChars
  end;
end;

function TSQLEditorFrame.SelectionMode: Boolean;
var
  SynEdit: TBCOraSynEdit;
begin
  Result := False;
  SynEdit := GetActiveSynEdit;
  if Assigned(SynEdit) then
    Result := SynEdit.SelectionMode = smColumn;
end;

function TSQLEditorFrame.ToggleSelectionMode: Boolean;
var
  i: Integer;
  SynEdit: TBCOraSynEdit;
begin
  Result := False;

  for i := 0 to PageControl.PageCount - 1 do
  begin
    SynEdit := GetSynEdit(PageControl.Pages[i]);
    if Assigned(SynEdit) then
    begin
      if SynEdit.SelectionMode = smColumn then
        begin
          SynEdit.Options := SynEdit.Options + [eoAltSetsColumnMode];
          SynEdit.SelectionMode := smNormal
        end
        else
        begin
          SynEdit.Options := SynEdit.Options - [eoAltSetsColumnMode];
          SynEdit.SelectionMode := smColumn;
        end;
      Result := SynEdit.SelectionMode = smColumn;
    end;
  end;
end;

function TSQLEditorFrame.LineNumbers: Boolean;
var
  SynEdit: TBCOraSynEdit;
begin
  Result := False;
  SynEdit := GetActiveSynEdit;
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
    if PageControl.Pages[i].Components[0] is TCompareFrame then
      Result := TCompareFrame(PageControl.Pages[i].Components[0]).ToggleLineNumbers
  end;
end;

function TSQLEditorFrame.GetSynEdit(TabSheet: TTabSheet): TBCOraSynEdit;
var
  SQLEditorTabSheetFrame: TSQLEditorTabSheetFrame;
begin
  Result := nil;
  SQLEditorTabSheetFrame := GetSQLEditorTabSheetFrame(TabSheet);
  if Assigned(SQLEditorTabSheetFrame) then
    Result := SQLEditorTabSheetFrame.OraSynEdit;
end;

function TSQLEditorFrame.GetActiveSynEdit: TBCOraSynEdit;
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

procedure TSQLEditorFrame.SetActivePageCaptionModified;
begin
  if Pos('~', PageControl.ActivePageCaption) = 0 then
  begin
    PageControl.ActivePageCaption := Format('%s~', [PageControl.ActivePageCaption]);
    PageControl.Invalidate;
  end;
end;

procedure TSQLEditorFrame.SynEditOnChange(Sender: TObject);
begin
  FModifiedDocuments := True;
  if OptionsContainer.AutoSave then
    Save
  else
  if not FProcessing then
    SetActivePageCaptionModified;

  DoSearch(True);
  RepaintToolButtons;
end;

function TSQLEditorFrame.GetActiveTabSheetCaption: string;
begin
  Result := '';
  if Assigned(PageControl.ActivePage) then
    Result := PageControl.ActivePageCaption;
end;

function TSQLEditorFrame.GetActiveDocumentFound: Boolean;
var
  SynEdit: TBCOraSynEdit;
begin
  Result := False;

  if Assigned(PageControl.ActivePage) then
  begin
    SynEdit := GetActiveSynEdit;
    if Assigned(SynEdit) then
      Result := True;
  end;
end;

function TSQLEditorFrame.GetActiveDocumentName: string;
var
  SynEdit: TBCOraSynEdit;
begin
  Result := '';
  if Assigned(PageControl.ActivePage) then
  begin
    SynEdit := GetActiveSynEdit;
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

function TSQLEditorFrame.GetModifiedDocuments(CheckActive: Boolean): Boolean;
var
  i: Integer;
  SynEdit: TBCOraSynEdit;
begin
  Result := True;

  for i := 0 to PageControl.PageCount - 1 do
  begin
    if CheckActive or ((PageControl.ActivePageIndex = i) and not CheckActive) then
    begin
      SynEdit := GetSynEdit(PageControl.Pages[i]);
      if Assigned(SynEdit) then
        if SynEdit.Modified then
          Exit;
    end;
  end;
  Result := False;
end;

function TSQLEditorFrame.GetSelectionFound: Boolean;
var
  SynEdit: TBCOraSynEdit;
begin
  Result := False;
  SynEdit := GetActiveSynEdit;
  if Assigned(SynEdit) then
    Result := SynEdit.SelAvail;
end;

function TSQLEditorFrame.GetCanUndo: Boolean;
var
  SynEdit: TBCOraSynEdit;
begin
  Result := False;
  SynEdit := GetActiveSynEdit;
  if Assigned(SynEdit) then
    Result := SynEdit.UndoList.ItemCount > 0;
end;

function TSQLEditorFrame.GetCanRedo: Boolean;
var
  SynEdit: TBCOraSynEdit;
begin
  Result := False;
  SynEdit := GetActiveSynEdit;
  if Assigned(SynEdit) then
    Result := SynEdit.RedoList.ItemCount > 0;
end;

procedure TSQLEditorFrame.SynEditorReplaceText(Sender: TObject; const ASearch,
  AReplace: UnicodeString; Line, Column: Integer; DeleteLine: Boolean;
  var Action: TSynReplaceAction);
var
  APos: TPoint;
  EditRect: TRect;
  SynEdit: TBCOraSynEdit;
  ConfirmText: string;
begin
  if ASearch = AReplace then
    Action := raSkip
  else
  begin
    SynEdit := GetActiveSynEdit;
    APos := SynEdit.ClientToScreen(SynEdit.RowColumnToPixels(SynEdit.BufferToDisplayPos(BufferCoord(Column, Line))));

    EditRect := ClientRect;
    EditRect.TopLeft := ClientToScreen(EditRect.TopLeft);
    EditRect.BottomRight := ClientToScreen(EditRect.BottomRight);

    if DeleteLine then
      ConfirmText := LanguageDataModule.GetYesOrNoMessage('DeleteLine')
    else
      ConfirmText := Format(LanguageDataModule.GetYesOrNoMessage('ReplaceOccurence'), [ASearch]);

    ConfirmReplaceDialog.Initialize(EditRect, APos.X, APos.Y, APos.Y + SynEdit.LineHeight,
      ConfirmText);
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
      ConfirmReplaceDialog.Free;
    end;
  end;
end;

procedure TSQLEditorFrame.ToggleBookmarks(ItemIndex: Integer);
var
  SynEdit: TBCOraSynEdit;
  SynEditorCommand: TSynEditorCommand;
begin
  SynEditorCommand := ecNone;
  case ItemIndex of
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
  SynEdit := GetActiveSynEdit;
  if Assigned(SynEdit) then
    SynEdit.ExecuteCommand(SynEditorCommand, Char(ItemIndex), nil);
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
  SynEdit: TBCOraSynEdit;
  FileDateTime: TDateTime;
  DialogResult: Integer;
begin
  DialogResult := mrNo;
  if FProcessing then
    Exit;
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
            PageControl.TabClosed := True; { just to avoid begin drag }
            if not (DialogResult in [mrYesToAll, mrNoToAll]) then
              DialogResult := AskYesOrNoAll(Format(LanguageDataModule.GetYesOrNoMessage('DocumentTimeChanged'), [SynEdit.DocumentName]));
            if DialogResult in [mrYes, mrYesToAll] then
              Refresh(i);
          end
          else
          begin
            if OptionsContainer.AutoSave then
              Save
            else
            begin
              SynEdit.Modified := True;
              PageControl.Pages[i].Caption := FormatFileName(PageControl.Pages[i].Caption, SynEdit.Modified);
              PageControl.Invalidate;
            end;
          end;
        end;
      end;
  end;
end;

procedure TSQLEditorFrame.Refresh(Page: Integer);
var
  SynEdit: TBCOraSynEdit;
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
  SynEdit: TBCOraSynEdit;
begin
  { assign to every synedit }
  for i := 0 to PageControl.PageCount - 1 do
  begin
    SynEdit := GetSynEdit(PageControl.Pages[i]);
    if Assigned(SynEdit) then
      OptionsContainer.AssignTo(SynEdit);
  end;
  { set output options }
  if Assigned(FOutputFrame) then
    FOutputFrame.SetOptions;
end;

procedure TSQLEditorFrame.BoxDownActionExecute(Sender: TObject);

 procedure BoxDown(SynEdit: TBCOraSynEdit);
  begin
    if Assigned(SynEdit) then
      if SynEdit.Focused then
      begin
        OptionsContainer.EnableSelectionMode := True;
        SynEdit.Options := SynEdit.Options + [eoAltSetsColumnMode];
        SynEdit.Selectionmode := smColumn;
        Keybd_Event(VK_SHIFT, MapVirtualKey(VK_SHIFT, 0), 0, 0);
        Keybd_Event(VK_DOWN, MapVirtualKey(VK_DOWN, 0), 0, 0);
        Keybd_Event(VK_DOWN, MapVirtualKey(VK_DOWN, 0), KEYEVENTF_KEYUP, 0);
        Keybd_Event(VK_MENU, MapVirtualKey(VK_MENU, 0), KEYEVENTF_KEYUP, 0);
      end;
  end;

begin
  BoxDown(GetActiveSynEdit);
end;

procedure TSQLEditorFrame.BoxLeftActionExecute(Sender: TObject);

  procedure BoxLeft(SynEdit: TBCOraSynEdit);
  begin
    if Assigned(SynEdit) then
      if SynEdit.Focused then
      begin
        OptionsContainer.EnableSelectionMode := True;
        SynEdit.Options := SynEdit.Options + [eoAltSetsColumnMode];
        SynEdit.Selectionmode := smColumn;
        Keybd_Event(VK_SHIFT, MapVirtualKey(VK_SHIFT, 0), 0, 0);
        Keybd_Event(VK_LEFT, MapVirtualKey(VK_LEFT, 0), 0, 0);
        Keybd_Event(VK_LEFT, MapVirtualKey(VK_LEFT, 0), KEYEVENTF_KEYUP, 0);
        Keybd_Event(VK_MENU, MapVirtualKey(VK_MENU, 0), KEYEVENTF_KEYUP, 0);
    end;
  end;

begin
  BoxLeft(GetActiveSynEdit);
end;

procedure TSQLEditorFrame.BoxRightActionExecute(Sender: TObject);

  procedure BoxRight(SynEdit: TBCOraSynEdit);
  begin
    if Assigned(SynEdit) then
      if SynEdit.Focused then
      begin
        OptionsContainer.EnableSelectionMode := True;
        SynEdit.Options := SynEdit.Options + [eoAltSetsColumnMode];
        SynEdit.Selectionmode := smColumn;
        Keybd_Event(VK_SHIFT, MapVirtualKey(VK_SHIFT, 0), 0, 0);
        Keybd_Event(VK_RIGHT, MapVirtualKey(VK_RIGHT, 0), 0, 0);
        Keybd_Event(VK_RIGHT, MapVirtualKey(VK_RIGHT, 0), KEYEVENTF_KEYUP, 0);
        Keybd_Event(VK_MENU, MapVirtualKey(VK_MENU, 0), KEYEVENTF_KEYUP, 0);
      end;
  end;

begin
  BoxRight(GetActiveSynEdit);
end;

procedure TSQLEditorFrame.BoxUpActionExecute(Sender: TObject);

  procedure BoxUp(SynEdit: TBCOraSynEdit);
  begin
    if Assigned(SynEdit) then
      if SynEdit.Focused then
      begin
        OptionsContainer.EnableSelectionMode := True;
        SynEdit.Options := SynEdit.Options + [eoAltSetsColumnMode];
        SynEdit.Selectionmode := smColumn;
        Keybd_Event(VK_SHIFT, MapVirtualKey(VK_SHIFT, 0), 0, 0);
        Keybd_Event(VK_UP, MapVirtualKey(VK_UP, 0), 0, 0);
        Keybd_Event(VK_UP, MapVirtualKey(VK_UP, 0), KEYEVENTF_KEYUP, 0);
        Keybd_Event(VK_MENU ,MapVirtualKey(VK_MENU ,0), KEYEVENTF_KEYUP, 0);
      end;
  end;

begin
  BoxUp(GetActiveSynEdit);
end;

procedure TSQLEditorFrame.SetHighlighterTableNames(Value: TStrings);
begin
  SynSQLSyn.TableNames.Text := LowerCase(Value.Text);
end;

procedure TSQLEditorFrame.ShowObjects;
var
  SynEdit: TBCOraSynEdit;
begin
  SynEdit := GetActiveSynEdit;
  SynEdit.ObjectCompletionProposal.ActivateCompletion;
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

procedure TSQLEditorFrame.ExecuteScript(Current: Boolean);
var
  i, Row, Col: Integer;
  SynEdit: TBCOraSynEdit;
  CreateStatement: Boolean;
  s, Temp: WideString;
begin
  SynEdit := GetActiveSynEdit;

  if SynEdit.SelAvail then
    s := SynEdit.SelText
  else
    s := Trim(SynEdit.Text);

  CreateStatement := Pos(ShortString('CREATE'), UpperCase(Trim(RemoveParenthesisFromBegin(RemoveComments(s))))) = 1;

  OraScript.SQL.Text := s;
  if Current then
  begin
    { find current script }
    for i := 0 to OraScript.Statements.Count - 1 do
    if (OraScript.Statements.Items[i].StartLine <= SynEdit.CaretXY.Line - 1) and
     (OraScript.Statements.Items[i].EndLine >= SynEdit.CaretXY.Line - 1) then
    begin
      s := OraScript.Statements.Items[i].SQL;
      OraScript.SQL.Text := s;
      Break;
    end;
  end;
  if (System.Pos(WideString('SELECT'), WideString(Trim(UpperCase(s)))) = 1) or
    (System.Pos(WideString('DESC'), WideString(Trim(UpperCase(s)))) = 1) then
    ExecuteStatement(GetActiveSynEdit, s)
  else
  begin
    ScriptQuery.SQL.Text := s;
    try
      OraScript.Session := FSession;
      ScriptQuery.Session := FSession;
      ScriptQuery.AfterExecute := OraScriptQueryAfterExecuteEvent;
      FOutputFrame.ClearStrings('Output: ' + GetActivePageCaption);
      SynEdit.StartTime := Now;
      if MainForm.DBMSOutputAction.Checked then // DBMSOutputToolButton.Down then
        EnableDBMSOutput;
      { parameters }
      if ScriptQuery.ParamCount > 0 then
        if not ParametersDialog.Open(ScriptQuery) then
          Exit;
      if not CreateStatement then
        if not FSession.InTransaction then
          FSession.StartTransaction;
      for i := 0 to OraScript.Statements.Count - 1 do
      begin
        Temp := OraScript.Statements.Items[i].SQL;
        if System.Pos('EXECUTE', UpperCase(Temp)) = 1 then
        begin
          Temp := 'BEGIN ' + System.Copy(Temp, 8, Length(Temp)) + '; END;';
          ScriptQuery.SQL.Text := Temp;
          ScriptQuery.Execute;
        end
        else
        if System.Pos('EXEC', UpperCase(Temp)) = 1 then
        begin
          Temp := 'BEGIN ' + System.Copy(Temp, 5, Length(Temp)) + '; END;';
          ScriptQuery.SQL.Text := Temp;
          ScriptQuery.Execute;
        end
        else
          OraScript.Statements.Items[i].Execute;
      end;
      if MainForm.DBMSOutputAction.Checked then //DBMSOutputToolButton.Down then
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
end;

function TSQLEditorFrame.RemoveComments(s: WideString): WideString; //SynEdit: TBCOraSynEdit): WideString;
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

procedure TSQLEditorFrame.ExecuteCurrentStatement;
begin
  ExecuteStatement(True);
end;

procedure TSQLEditorFrame.ExecuteStatement(Current: Boolean);
var
  SynEdit: TBCOraSynEdit;
  s: WideString;
begin
  SynEdit := GetActiveSynEdit;

  if SynEdit.SelAvail then
    s := SynEdit.SelText
  else
    s := Trim(SynEdit.Text);

  s := Trim(UpperCase(RemoveParenthesisFromBegin(RemoveComments(s))));

  if s = '' then
    Exit;

  if s[Length(s)] = ';' then
    ExecuteScript(Current)
  else
  if (System.Pos(WideString('SELECT'), s) = 1) or (System.Pos(WideString('DESC'), s) = 1) then
    ExecuteStatement(SynEdit)
  else
    ExecuteNoRowsStatement(SynEdit);
end;

procedure TSQLEditorFrame.ExplainPlan;
var
  SynEdit: TBCOraSynEdit;
begin
  SynEdit := GetActiveSynEdit;
  if Trim(SynEdit.Text) = '' then
    Exit;
  if not Assigned(SynEdit.PlanQuery) then
  begin
    SynEdit.PlanQuery := TOraQuery.Create(nil);
    SynEdit.PlanQuery.Session := FSession;
    SynEdit.PlanQuery.ReadOnly := True;
    SynEdit.PlanQuery.SQL.Clear;
    SynEdit.PlanQuery.SQL.Add(SQLStringHolder.StringsByName['ExplainPlanSQL'].Text);
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
  SynEdit.PlanQuery.Close;
  SynEdit.PlanQuery.UnPrepare;
  SynEdit.PlanQuery.Prepare;
  SynEdit.PlanQuery.Open;
  FOutputFrame.AddPlanGrid('Plan: ' + GetActivePageCaption, SynEdit.PlanQuery);
  OutputPanel.Visible := True;
end;

function TSQLEditorFrame.CreateSession(OraSession: TOraSession): TOraSession;
begin
  Result := TOraSession.Create(Self);
  Result.ConnectString := OraSession.ConnectString;
  Result.Options.Direct := OraSession.Options.Direct;
  Result.Options.DateFormat := OptionsContainer.DateFormat;
  Result.Options.UseUnicode := True;
  Result.Options.UnicodeEnvironment := True; // False;
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
  SynEdit: TBCOraSynEdit;
begin
  { Get objectname }
  SQLTokenizer := TSQLTokenizer.Create;
  SynEdit := GetActiveSynEdit;
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

procedure TSQLEditorFrame.GotoBookmarks(ItemIndex: Integer);
var
  SynEdit: TBCOraSynEdit;
  SynEditorCommand: TSynEditorCommand;
begin
  SynEditorCommand := ecNone;
  case ItemIndex of
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
  SynEdit := GetActiveSynEdit;
  if Assigned(SynEdit) then
    SynEdit.ExecuteCommand(SynEditorCommand, Char(ItemIndex), nil);
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

procedure TSQLEditorFrame.ExecuteStatement(SynEdit: TBCOraSynEdit; SQL: string = '');
var
  s, Owner, TableName: string;
  T1, T2: TTime;
  QuerySuccess: Boolean;
  Row, Col: Integer;
begin
  if not Assigned(SynEdit.OraQuery) then
  begin
    SynEdit.OraQuery := TOraQuery.Create(nil);
    SynEdit.OraQuery.Session := CreateSession(FSession);
    SynEdit.OraQuery.AutoCommit := False;
    SynEdit.OraQuery.FetchRows := 500;
    SynEdit.OraQuery.Options.StrictUpdate := False;
    SynEdit.OraQuery.Options.RequiredFields := False;
    SynEdit.OraQuery.Options.RawAsString := True;
    SynEdit.OraQuery.LocalUpdate := True;
    SynEdit.OraQuery.NonBlocking := True;

    SynEdit.OraQuery.Options.CacheLobs := False;
    SynEdit.OraQuery.Options.DeferredLobRead := True;
  end;

  SynEdit.OraQuery.SQL.Clear;

  if SQL <> '' then
    s := SQL
  else
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
  SynEdit.OraQuery.SQL.Add(s);
  { parameters }

  if SynEdit.OraQuery.ParamCount > 0 then
    if not ParametersDialog.Open(SynEdit.OraQuery) then
      Exit;

  T1 := Now;
  QuerySuccess := False;
  try
    SynEdit.InThread := True;
    SynEdit.OraQuery.Prepare;
    AddAllFields(SynEdit.OraQuery);              { these are important to do after prepare because if there is }
    SetClobAndTimestampFields(SynEdit.OraQuery); { problem with fields it may cause OCI_INVALID_HANDLE }
    SynEdit.OraQuery.Open;
    QuerySuccess := QueryProgressDialog.Open(SynEdit.OraQuery, T1);
    if not QuerySuccess then
      SynEdit.OraQuery.Active := False;
    SynEdit.InThread := False;
  except

  end;
  if QuerySuccess then
  begin
    T2 := Now;
    FOutputFrame.AddDataGrid('Data: ' + GetActivePageCaption, SynEdit.OraQuery, System.SysUtils.FormatDateTime('hh:nn:ss.zzz', T2 - T1));
    WriteHistory(SynEdit.OraQuery.Session, SynEdit.Text);
  end
  else
  begin
    SynEdit.OraQuery.GetErrorPos(Row, Col);
    SynEdit.SetFocus;
    SynEdit.CaretY := Row;
    SynEdit.CaretX := Col;
  end;
  OutputPanel.Visible := True;
end;

procedure TSQLEditorFrame.EnableDBMSOutput;
var
  SynEdit: TBCOraSynEdit;
  OraSession: TOraSession;
begin
  SynEdit := GetActiveSynEdit;
  OraSession := nil;
  if Assigned(SynEdit) and Assigned(SynEdit.OraSQL) then
    OraSession := SynEdit.OraSQL.Session
  else
  if Assigned(OraScript.Session) then
    OraSession := OraScript.Session;

  if Assigned(OraSession) then
    OraSession.ExecSQL('BEGIN dbms_output.enable(1000000); END;', []);
end;

procedure TSQLEditorFrame.ExecuteNoRowsStatement(SynEdit: TBCOraSynEdit);
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

  SynEdit.OraSQL := TOraSQL.Create(nil);
  if CreateNewSession then
    SynEdit.OraSQL.Session := CreateSession(FSession)
  else
    SynEdit.OraSQL.Session := FSession;
  SynEdit.OraSQL.AutoCommit := False;
  SynEdit.OraSQL.AfterExecute := OraSQLAfterExecuteEvent;
  SynEdit.OraSQL.NonBlocking := CreateNewSession;
  try
    SynEdit.OraSQL.SQL.Clear;
    if SynEdit.SelAvail then
      s := SynEdit.SelText
    else
      s := Trim(SynEdit.Text);
    if System.Pos('EXECUTE', UpperCase(s)) = 1 then
      s := 'BEGIN ' + System.Copy(s, 8, Length(s)) + '; END;';
    if System.Pos('EXEC', UpperCase(s)) = 1 then
      s := 'BEGIN ' + System.Copy(s, 5, Length(s)) + '; END;';
    SynEdit.OraSQL.SQL.Add(s);
    { parameters }
    if SynEdit.OraSQL.ParamCount > 0 then
      if not ParametersDialog.Open(SynEdit.OraSQL) then
        Exit;

    SynEdit.StartTime := Now;
    try
      if MainForm.DBMSOutputAction.Checked then //DBMSOutputToolButton.Down then
        EnableDBMSOutput;
      if not CreateNewSession then
        if not FSession.InTransaction then
          FSession.StartTransaction;
      SynEdit.InThread := True;
      QuerySuccess := True;
      SynEdit.OraSQL.Prepare;
      SynEdit.OraSQL.Execute;

      if CreateNewSession then
      begin
        QuerySuccess := SQLProgressDialog.Open(SynEdit.OraSQL, SynEdit.StartTime);
        if not QuerySuccess then
          SynEdit.OraSQL.BreakExec;
      end;
      SynEdit.InThread := False;
      if QuerySuccess then
        if MainForm.DBMSOutputAction.Checked then //DBMSOutputToolButton.Down then
          GetDBMSOutput;
    except
      QuerySuccess := SynEdit.OraSQL.ErrorOffset = 0;
    end;
    if not QuerySuccess then
    begin
      SynEdit.SetFocus;
      SynEdit.SelStart := SynEdit.OraSQL.ErrorOffset + 2;
    end;

    OutputPanel.Visible := True;
  finally
    SynEdit.OraSQL.Free;
  end;
end;

procedure TSQLEditorFrame.OraSQLAfterExecuteEvent(Sender: TObject; Result: Boolean);
var
  i:integer;
  SynEdit: TBCOraSynEdit;
  StringList: TStringList;
  s: string;
begin
  SynEdit := GetActiveSynEdit;
  if Result then
  begin
    StringList := TStringList.Create;
    try
      for i := 0 to SynEdit.OraSQL.Params.Count-1 do
        StringList.Add(Format('%s = %s', [SynEdit.OraSQL.Params[i].Name, SynEdit.OraSQL.Params[i].AsWideString]));

      if SynEdit.OraSQL.RowsProcessed <> 0 then
        s := Format('%d row(s) processed.', [SynEdit.OraSQL.RowsProcessed])
      else
        s := 'Success.';

      StringList.Add(Format('%s Time Elapsed: %s', [s, System.SysUtils.FormatDateTime('hh:nn:ss.zzz', Now - SynEdit.StartTime)]));

      FOutputFrame.AddStrings(Format('Output: %s', [GetActivePageCaption]), StringList.Text);
    finally
      WriteHistory(SynEdit.OraSQL.Session, SynEdit.Text);
      StringList.Free;
    end;
  end
end;

procedure TSQLEditorFrame.OraScriptQueryAfterExecuteEvent(Sender: TObject; Result: Boolean);
var
  i:integer;
  SynEdit: TBCOraSynEdit;
  StringList: TStringList;
  s: string;
begin
  SynEdit := GetActiveSynEdit;
  if Result then
  begin
    StringList := TStringList.Create;
    try
      for i := 0 to ScriptQuery.Params.Count-1 do
        StringList.Add(Format('%s = %s', [ScriptQuery.Params[i].Name, ScriptQuery.Params[i].AsWideString]));

      if ScriptQuery.RowsProcessed <> 0 then
        s := Format('%d row(s) processed.', [ScriptQuery.RowsProcessed])
      else
        s := 'Success.';

      StringList.Add(Format('%s Time Elapsed: %s', [s, System.SysUtils.FormatDateTime('hh:nn:ss.zzz', Now - SynEdit.StartTime)]));

      FOutputFrame.AddStrings(Format('Output: %s', [GetActivePageCaption]), StringList.Text);
    finally
      WriteHistory(ScriptQuery.Session, SynEdit.Text);
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
  SynEdit: TBCOraSynEdit;
  OraSession: TOraSession;
begin
  Found := False;
  SynEdit := GetActiveSynEdit;
  OraSession := nil;
  if Assigned(SynEdit) and Assigned(SynEdit.OraSQL) then
    OraSession := SynEdit.OraSQL.Session
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
      if Found or not MainForm.DBMSOutputAction.Checked then //DBMSOutputToolButton.Down then
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
    History.Insert(0, EncryptString(DateTimeToStr(Now) + ';' +
                Lib.FormatSchema(OraSession.Schema + '@' + OraSession.Server) + ';' +
                SQL + END_OF_SQL_STATEMENT));
    History.SaveToFile(GetHistoryFile);
  finally
    History.Free;
  end;
end;

function TSQLEditorFrame.GetCaretInfo: string;
var
  SynEdit: TBCOraSynEdit;
begin
  SynEdit := GetActiveSynEdit;
  Result := Format('%d: %d', [SynEdit.CaretY, SynEdit.CaretX]);
end;

function TSQLEditorFrame.GetModifiedInfo: string;
var
  SynEdit: TBCOraSynEdit;
begin
  Result := '';
  if OptionsContainer.AutoSave then
    Result := LanguageDataModule.GetConstant('AutoSave')
  else
  begin
    SynEdit := GetActiveSynEdit;
    if Assigned(SynEdit) and SynEdit.Modified then
      Result := LanguageDataModule.GetConstant('Modified');
  end;
end;

procedure TSQLEditorFrame.DecreaseIndent;
var
  SynEdit: TBCOraSynEdit;
begin
  SynEdit := GetActiveSynEdit;
  if Assigned(SynEdit) then
    SynEdit.ExecuteCommand(ecBlockUnindent, 'U', nil);
end;

procedure TSQLEditorFrame.IncreaseIndent;
var
  SynEdit: TBCOraSynEdit;
begin
  SynEdit := GetActiveSynEdit;
  if Assigned(SynEdit) then
    SynEdit.ExecuteCommand(ecBlockIndent, 'I', nil);
end;

procedure TSQLEditorFrame.ToggleCase;
var
  SelStart, SelEnd: Integer;
  SynEdit: TBCOraSynEdit;

  function Toggle(const aStr: UnicodeString): UnicodeString;
  var
    i: Integer;
    sLower: UnicodeString;
  begin
    Result := SynWideUpperCase(aStr);
    sLower := SynWideLowerCase(aStr);
    for i := 1 to Length(aStr) do
    begin
      if Result[i] = aStr[i] then
        Result[i] := sLower[i];
    end;
  end;

begin
  SynEdit := GetActiveSynEdit;
  if Assigned(SynEdit) then
    if SynEdit.Focused then
    begin
      if SynWideUpperCase(SynEdit.SelText) <> SynWideUpperCase(FSelectedText) then
      begin
        FCaseCycle := 0;
        FSelectedText := SynEdit.SelText;
      end;
      SynEdit.BeginUpdate;
      SelStart := SynEdit.SelStart;
      SelEnd := SynEdit.SelEnd;
      { UPPER/lower/Sentence/And Title }
      case FCaseCycle of
        0: SynEdit.SelText := SynWideUpperCase(FSelectedText);
        1: SynEdit.SelText := SynWideLowerCase(FSelectedText);
        2: SynEdit.SelText := Toggle(FSelectedText);
        3: SynEdit.SelText := SynWideUpperCase(FSelectedText[1]) + SynWideLowerCase(System.Copy(FSelectedText, 2, Length(FSelectedText)));
        4: SynEdit.SelText := FSelectedText;
      end;
      SynEdit.SelStart := SelStart;
      SynEdit.SelEnd := SelEnd;
      SynEdit.EndUpdate;
      Inc(FCaseCycle);
      if FCaseCycle > 4 then
        FCaseCycle := 0;
    end;
end;

procedure TSQLEditorFrame.SortAsc;
var
  SynEdit: TBCOraSynEdit;
  Strings: TWideStringList;
begin
  SynEdit := GetActiveSynEdit;
  if Assigned(SynEdit) then
  begin
    Strings := TWideStringList.Create;
    with Strings do
    try
      Text := SynEdit.SelText;
      Sort;
      SynEdit.SelText := TrimRight(Text);
    finally
      Free;
    end;
  end;
end;

procedure TSQLEditorFrame.SortDesc;
var
  i: Integer;
  SynEdit: TBCOraSynEdit;
  s: WideString;
  Strings: TWideStringList;
begin
  SynEdit := GetActiveSynEdit;
  if Assigned(SynEdit) then
  begin
    Strings := TWideStringList.Create;
    with Strings do
    try
      Text := SynEdit.SelText;
      Sort;
      for i := Count - 1 downto 0 do
        s := s + Strings[i] + Chr(13) + Chr(10);
      SynEdit.SelText := TrimRight(s);
    finally
      Free;
    end;
  end;
end;

procedure TSQLEditorFrame.ClearBookmarks;
var
  i: Integer;
  SynEdit: TBCOraSynEdit;
begin
  SynEdit := GetActiveSynEdit;
  if Assigned(SynEdit) then
    for i := 0 to 9 do
      SynEdit.ClearBookMark(i);
end;

procedure TSQLEditorFrame.InsertLine;
var
  SynEdit: TBCOraSynEdit;
begin
  SynEdit := GetActiveSynEdit;
  if Assigned(SynEdit) then
    SynEdit.ExecuteCommand(ecInsertLine, 'N', nil);
end;

procedure TSQLEditorFrame.DeleteWord;
var
  SynEdit: TBCOraSynEdit;
begin
  SynEdit := GetActiveSynEdit;
  if Assigned(SynEdit) then
    SynEdit.ExecuteCommand(ecDeleteWord, 'T', nil);
end;

procedure TSQLEditorFrame.DeleteLine;
var
  SynEdit: TBCOraSynEdit;
begin
  SynEdit := GetActiveSynEdit;
  if Assigned(SynEdit) then
    SynEdit.ExecuteCommand(ecDeleteLine, 'Y', nil);
end;

procedure TSQLEditorFrame.DeleteEOL;
var
  SynEdit: TBCOraSynEdit;
begin
  SynEdit := GetActiveSynEdit;
  if Assigned(SynEdit) then
    SynEdit.ExecuteCommand(ecDeleteEOL, 'Y', nil);
end;

function TSQLEditorFrame.GetActiveDocumentModified: Boolean;
var
  SynEdit: TBCOraSynEdit;
begin
  SynEdit := GetActiveSynEdit;
  Result := Assigned(SynEdit) and SynEdit.Modified;
end;

function TSQLEditorFrame.IsCompareFilesActivePage: Boolean;
begin
  Result := Assigned(PageControl.ActivePage) and (PageControl.ActivePage.ImageIndex = FCompareImageIndex);
end;

procedure TSQLEditorFrame.GotoLine;
begin
  GotoLinePanel.Show;
  if GotoLineNumberEdit.CanFocus then
    GotoLineNumberEdit.SetFocus;
end;

procedure TSQLEditorFrame.SetSearchMapVisible(Value: Boolean);
var
  i: Integer;
  SynEdit: TBCOraSynEdit;
begin
  for i := 0 to PageControl.PageCount - 1 do
  begin
    SynEdit := GetSynEdit(PageControl.Pages[i]);
    if Assigned(SynEdit) then
      SynEdit.SearchMap.Visible := OptionsContainer.ShowSearchMap and Value;
  end;
end;

procedure TSQLEditorFrame.GotoLineActionExecute(Sender: TObject);
begin
  try
    GetActiveSynEdit.CaretY := StrToInt(GotoLineNumberEdit.Text);
  except
    { silent }
  end;
end;

procedure TSQLEditorFrame.GotoLineClearActionExecute(Sender: TObject);
begin
  GotoLineNumberEdit.Text := '';
end;

procedure TSQLEditorFrame.GotoLineCloseActionExecute(Sender: TObject);
begin
  GotoLinePanel.Hide;
end;

procedure TSQLEditorFrame.GotoLineNumberEditChange(Sender: TObject);
begin
  GotoLineNumberEdit.RightButton.Visible := Trim(GotoLineNumberEdit.Text) <> '';
end;

procedure TSQLEditorFrame.GotoLineNumberEditKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    GotoLineAction.Execute;
end;

function TSQLEditorFrame.GetActiveBookmarkList: TSynEditMarkList;
var
  SynEdit: TBCOraSynEdit;
begin
  Result := nil;
  SynEdit := GetActiveSynEdit;
  if Assigned(SynEdit) then
    Result := SynEdit.Marks;
end;

function TSQLEditorFrame.GetInTransAction: Boolean;
begin
  Result := FSession.InTransaction;
end;

procedure TSQLEditorFrame.ToggleMiniMap;
var
  SQLEditorTabSheetFrame: TSQLEditorTabSheetFrame;
begin
  SQLEditorTabSheetFrame := GetSQLEditorTabSheetFrame(PageControl.ActivePage);
  if Assigned(SQLEditorTabSheetFrame) then
    SQLEditorTabSheetFrame.MinimapVisible := not SQLEditorTabSheetFrame.MinimapVisible;
end;

function TSQLEditorFrame.GetMinimapChecked: Boolean;
var
  SQLEditorTabSheetFrame: TSQLEditorTabSheetFrame;
begin
  Result := False;
  SQLEditorTabSheetFrame := GetSQLEditorTabSheetFrame(PageControl.ActivePage);
  if Assigned(SQLEditorTabSheetFrame) then
    Result := SQLEditorTabSheetFrame.MinimapVisible;
end;

procedure TSQLEditorFrame.CreateActionToolBar(CreateToolBar: Boolean);
var
  i, k, ButtonCount: Integer;
  s: string;
  Action: TCustomAction;
  ToolBarItems: TStrings;
  Panel: TPanel;
  ToolBar: TBCToolBar;
  ToolButton: TToolButton;
  Bevel: TBevel;
  IsChanged: Boolean;

  function FindItemByName(ItemName: string): TCustomAction;
  var
    j: Integer;
  begin
    Result := nil;
    for j := 0 to MainForm.ActionManager.ActionCount - 1 do
      if MainForm.ActionManager.Actions[j].Name = ItemName then
        Exit(MainForm.ActionManager.Actions[j] as TCustomAction);
  end;

begin
  ToolBarItems := TStringList.Create;
  with TBigIniFile.Create(GetIniFilename) do
  try
    { update if changed }
    IsChanged := ReadBool('ToolBarItemsChanged', 'Changed', False);
    EraseSection('ToolBarItemsChanged');

    if IsChanged or CreateToolBar then
    begin
      ToolbarPanel.Visible := False;
      { read items from ini }
      ReadSectionValues('ToolBarItems', ToolBarItems);
      if ToolBarItems.Count > 0 then
      begin
        { add items to action bar }
        for i := ToolbarPanel.ControlCount - 1 downto 0 do
           (ToolbarPanel.Controls[i] as TPanel).Free;
        i := ToolBarItems.Count - 1;
        while i >= 0 do
        begin
          Panel := TPanel.Create(ToolbarPanel);
          Panel.Parent := ToolbarPanel;
          Panel.Align := alLeft;
          Panel.BevelOuter := bvNone;
          Panel.ParentColor := True;
          Panel.AutoSize := True;
          Toolbar := TBCToolBar.Create(Panel);
          Toolbar.Parent := Panel;
          Toolbar.Images := ImagesDataModule.ImageList;
          Toolbar.Align := alLeft;
          //ToolBar.Autosize := True;
          { Fuck this, Embarcadero! AutoSize can't be used because syncronizing between action's checked property and 
            the tool button's down property will be lost.
             
            See Vcl.ComCtrls.pas: procedure TToolButton.SetAutoSize(Value: Boolean); buttons are recreated. }
          k := i;
          ButtonCount := 0;
          while (k >= 0) and (Pos('-', ToolBarItems.Strings[k]) = 0) do
          begin
            Inc(ButtonCount);
            Dec(k);
          end;
          ToolBar.Width := ButtonCount * 23;
          s := '';
          while (i >= 0) and (s <> '-')  do
          begin
            s := System.Copy(ToolBarItems.Strings[i], Pos('=', ToolBarItems.Strings[i]) + 1, Length(ToolBarItems.Strings[i]));
            if s <> '-' then
            begin
              ToolButton := TToolButton.Create(Toolbar);
              ToolButton.Parent := Toolbar;
              Action := FindItemByName(s);
              if Action.Tag = 99 then
                ToolButton.Style := tbsCheck;
              ToolButton.Action := Action;
            end
            else
            begin
              if i > 0 then  { no bevel after last item }
              begin
                Bevel := TBevel.Create(Panel);
                with Bevel do
                begin
                  Parent := Panel;
                  Align := alLeft;
                  Shape := bsLeftLine;
                  Width := 4;
                  AlignWithMargins := True;
                  Margins.Bottom := 2;
                  Margins.Left := 6;
                  Margins.Top := 2;
                end;
              end;
            end;
          
            Dec(i);
          end;
        end;
        //Toolbar.AutoSize := False;
        //Panel.AutoSize := False;
      end;
      ToolbarPanel.Visible := True;
    end
  finally
    Free;
    ToolBarItems.Free;
  end;
end;

end.
