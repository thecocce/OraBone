unit Options;

interface

uses
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, ComCtrls, CommCtrl, Registry, Vcl.ExtCtrls,
  Vcl.Buttons, Menus, SynEdit, BCDialogs.Dlg, SynEditMiscClasses, System.Classes, System.SysUtils, Vcl.ImgList, Grids,
  ActnList, ValEdit, Vcl.Themes, Ora, VirtualTrees, Vcl.ActnMenus, OptionsEditorOptions, OptionsEditorFont,
  OptionsEditorLeftMargin, OptionsEditorRightMargin, OptionsEditorTabs, OptionsConnectionTabs, OptionsMainMenu,
  OptionsOutputTabs, OptionsDBMSOutput, OptionsSchemaBrowser, OptionsObjectFrame, OptionsDateFormat, OptionsTimeFormat,
  OptionsCompare, OptionsPrint, OptionsStatusBar, OptionsOutput, OptionsEditorToolBar, OptionsEditorCompletionProposal,
  System.Actions, OptionsEditorSearch;

type
  POptionsRec = ^TOptionsRec;
  TOptionsRec = record
    Caption: UnicodeString;
    ImageIndex: Integer;
  end;

  TOptionsContainer = class;

  TOptionsDialog = class(TDialog)
    ActionList: TActionList;
    CancelButton: TButton;
    CompareAction: TAction;
    ConnectionAction: TAction;
    ConnectionTabsAction: TAction;
    DateFormatAction: TAction;
    DBMSOutputAction: TAction;
    DBSettingsAction: TAction;
    EditorAction: TAction;
    EditorCompletionProposalAction: TAction;
    EditorFontAction: TAction;
    EditorLeftMarginAction: TAction;
    EditorRightMarginAction: TAction;
    EditorTabsAction: TAction;
    EditorToolBarAction: TAction;
    ImageList: TImageList;
    MainMenuAction: TAction;
    ObjectFrameAction: TAction;
    OKButton: TButton;
    OKButtonAction: TAction;
    OptionsPanel: TPanel;
    OptionsVirtualStringTree: TVirtualStringTree;
    OutputAction: TAction;
    OutputTabsAction: TAction;
    Panel1: TPanel;
    Panel2: TPanel;
    PrintAction: TAction;
    SchemaBrowserAction: TAction;
    Separator1Panel: TPanel;
    Splitter: TSplitter;
    StatusBarAction: TAction;
    TimeFormatAction: TAction;
    EditorSearchAction: TAction;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure OKButtonActionExecute(Sender: TObject);
    procedure OptionsVirtualStringTreeClick(Sender: TObject);
    procedure OptionsVirtualStringTreeFreeNode(Sender: TBaseVirtualTree; Node: PVirtualNode);
    procedure OptionsVirtualStringTreeGetImageIndex(Sender: TBaseVirtualTree; Node: PVirtualNode;
      Kind: TVTImageKind; Column: TColumnIndex; var Ghosted: Boolean; var ImageIndex: Integer);
    procedure OptionsVirtualStringTreeGetText(Sender: TBaseVirtualTree; Node: PVirtualNode;
      Column: TColumnIndex; TextType: TVSTTextType; var CellText: string);
    procedure FormShow(Sender: TObject);
    procedure OptionsVirtualStringTreePaintText(Sender: TBaseVirtualTree; const TargetCanvas: TCanvas;
      Node: PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    FConnectionTabsFrame: TConnectionTabsFrame;
    FDateFormatFrame: TDateFormatFrame;
    FDBMSOutputFrame: TDBMSOutputFrame;
    FEditorCompletionProposalFrame: TEditorCompletionProposalFrame;
    FEditorFontFrame: TEditorFontFrame;
    FEditorLeftMarginFrame: TEditorLeftMarginFrame;
    FEditorOptionsFrame: TEditorOptionsFrame;
    FEditorRightMarginFrame: TEditorRightMarginFrame;
    FEditorSearchFrame: TEditorSearchFrame;
    FEditorTabsFrame: TEditorTabsFrame;
    FEditorToolBarFrame: TEditorToolBarFrame;
    FMainMenuFrame: TMainMenuFrame;
    FObjectFrameFrame: TObjectFrameFrame;
    FOptionsCompareFrame: TOptionsCompareFrame;
    FOptionsContainer: TOptionsContainer;
    FOptionsOutputFrame: TOptionsOutputFrame;
    FOptionsPrintFrame: TOptionsPrintFrame;
    FOptionsSchemaBrowserFrame: TOptionsSchemaBrowserFrame;
    FOutputTabsFrame: TOutputTabsFrame;
    FStatusBarFrame: TStatusBarFrame;
    FTimeFormatFrame: TTimeFormatFrame;
    procedure CreateTree;
    procedure GetData;
    procedure PutData;
    procedure ReadIniFile;
    procedure SetVisibleFrame;
    procedure WriteIniFile;
  public
    function Execute(OraSession: TOraSession; EditOptions: TOptionsContainer): Boolean;
  end;

  TOptionsContainer = class(TComponent)
  private
    FAnimationDuration: Integer;
    FAnimationStyle: TAnimationStyle;
    FAutoIndent: Boolean;
    FAutoSave: Boolean;
    FBeepIfSearchStringNotFound: Boolean;
    FColorBrightness: Integer;
    FCompletionProposalCaseSensitive: Boolean;
    FCompletionProposalEnabled: Boolean;
    FCompletionProposalShortcut: string;
    FConnectionCloseTabByDblClick: Boolean;
    FConnectionCloseTabByMiddleClick: Boolean;
    FConnectionDoubleBuffered: Boolean;
    FConnectionMultiLine: Boolean;
    FConnectionRightClickSelect: Boolean;
    FConnectionShowCloseButton: Boolean;
    FConnectionShowImage: Boolean;
    FDateFormat: string;
    FEditorCloseTabByDblClick: Boolean;
    FEditorCloseTabByMiddleClick: Boolean;
    FEditorDoubleBuffered: Boolean;
    FEditorMultiLine: Boolean;
    FEditorRightClickSelect: Boolean;
    FEditorShowCloseButton: Boolean;
    FEditorShowImage: Boolean;
    FEnableLineNumbers: Boolean;
    FEnableSelectionMode: Boolean;
    FEnableSpecialChars: Boolean;
    FEnableWordWrap: Boolean;
    FFilterOnTyping: Boolean;
    FFontName: string;
    FFontSize: Integer;
    FIgnoreBlanks: Boolean;
    FIgnoreCase: Boolean;
    FInsertCaret: TSynEditCaretType;
    FLineSpacing: Integer;
    FMainMenuFontName: string;
    FMainMenuFontSize: Integer;
    FMainMenuSystemFontName: string;
    FMainMenuSystemFontSize: Integer;
    FMainMenuUseSystemFont: Boolean;
    FMarginFontName: string;
    FMarginFontSize: Integer;
    FMarginInTens: Boolean;
    FMarginLeftMarginAutoSize: Boolean;
    FMarginLeftMarginWidth: Integer;
    FMarginLeftMarginMouseMove: Boolean;
    FMarginLineModified: Boolean;
    FMarginModifiedColor: string;
    FMarginNormalColor: string;
    FMarginRightMargin: Integer;
    FMarginShowBookmarks: Boolean;
    FMarginShowBookmarkPanel: Boolean;
    FMarginVisibleLeftMargin: Boolean;
    FMarginVisibleRightMargin: Boolean;
    FMarginZeroStart: Boolean;
    FMinimapFontName: string;
    FMinimapFontSize: Integer;
    FMinimapWidth: Integer;
    FNonblinkingCaret: Boolean;
    FNonblinkingCaretColor: string;
    FObjectFrameAlign: string;
    FOutputCloseTabByDblClick: Boolean;
    FOutputCloseTabByMiddleClick: Boolean;
    FOutputDoubleBuffered: Boolean;
    FOutputIndent: Integer;
    FOutputMultiLine: Boolean;
    FOutputRightClickSelect: Boolean;
    FOutputShowCloseButton: Boolean;
    FOutputShowImage: Boolean;
    FOutputShowTreeLines: Boolean;
    FPersistentHotKeys: Boolean;
    FPollingInterval: Integer;
    FPrintDateTime: Integer;
    FPrintDocumentName: Integer;
    FPrintPageNumber: Integer;
    FPrintPrintedBy: Integer;
    FPrintShowFooterLine: Boolean;
    FPrintShowHeaderLine: Boolean;
    FPrintShowLineNumbers: Boolean;
    FPrintWordWrapLine: Boolean;
    FSchemaBrowserAlign: string;
    FSchemaBrowserIndent: Integer;
    FSchemaBrowserShowTreeLines: Boolean;
    FScrollPastEof: Boolean;
    FScrollPastEol: Boolean;
    FShadows: Boolean;
    FShowSearchStringNotFound: Boolean;
    FShowDataSearchPanel: Boolean;
    FShowObjectCreationAndModificationTimestamp: Boolean;
    FSmartTabDelete: Boolean;
    FSmartTabs: Boolean;
    FStatusBarFontName: string;
    FStatusBarFontSize: Integer;
    FStatusBarUseSystemFont: Boolean;
    FTabsToSpaces: Boolean;
    FTabWidth: Integer;
    FTimeFormat: string;
    FToolBarCase: Boolean;
    FToolBarCommand: Boolean;
    FToolBarDBMS: Boolean;
    FToolBarExecute: Boolean;
    FToolBarExplainPlan: Boolean;
    FToolBarIndent: Boolean;
    FToolBarMode: Boolean;
    FToolBarPrint: Boolean;
    FToolBarSearch: Boolean;
    FToolBarSort: Boolean;
    FToolBarStandard: Boolean;
    FToolBarTools: Boolean;
    FToolBarTransaction: Boolean;
    FTrimTrailingSpaces: Boolean;
    FTripleClickRowSelect: Boolean;
    FUndoAfterSave: Boolean;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure AssignTo(Dest: TPersistent); override;
  published
    property AnimationDuration: Integer read FAnimationDuration write FAnimationDuration default 150;
    property AnimationStyle: TAnimationStyle read FAnimationStyle write FAnimationStyle default asDefault;
    property AutoIndent: Boolean read FAutoIndent write FAutoIndent default True;
    property AutoSave: Boolean read FAutoSave write FAutoSave default False;
    property BeepIfSearchStringNotFound: Boolean read FBeepIfSearchStringNotFound write FBeepIfSearchStringNotFound default True;
    property ColorBrightness: Integer read FColorBrightness write FColorBrightness;
    property CompletionProposalCaseSensitive: Boolean read FCompletionProposalCaseSensitive write FCompletionProposalCaseSensitive default True;
    property CompletionProposalEnabled: Boolean read FCompletionProposalEnabled write FCompletionProposalEnabled default True;
    property CompletionProposalShortcut: string read FCompletionProposalShortcut write FCompletionProposalShortcut;
    property ConnectionCloseTabByDblClick: Boolean read FConnectionCloseTabByDblClick write FConnectionCloseTabByDblClick default False;
    property ConnectionCloseTabByMiddleClick: Boolean read FConnectionCloseTabByMiddleClick write FConnectionCloseTabByMiddleClick default False;
    property ConnectionDoubleBuffered: Boolean read FConnectionDoubleBuffered write FConnectionDoubleBuffered default True;
    property ConnectionMultiLine: Boolean read FConnectionMultiLine write FConnectionMultiLine default False;
    property ConnectionRightClickSelect: Boolean read FConnectionRightClickSelect write FConnectionRightClickSelect default True;
    property ConnectionShowCloseButton: Boolean read FConnectionShowCloseButton write FConnectionShowCloseButton default False;
    property ConnectionShowImage: Boolean read FConnectionShowImage write FConnectionShowImage default True;
    property DateFormat: string read FDateFormat write FDateFormat;
    property EditorCloseTabByDblClick: Boolean read FEditorCloseTabByDblClick write FEditorCloseTabByDblClick default False;
    property EditorCloseTabByMiddleClick: Boolean read FEditorCloseTabByMiddleClick write FEditorCloseTabByMiddleClick  default False;
    property EditorDoubleBuffered: Boolean read FEditorDoubleBuffered write FEditorDoubleBuffered default True;
    property EditorMultiLine: Boolean read FEditorMultiLine write FEditorMultiLine default False;
    property EditorRightClickSelect: Boolean read FEditorRightClickSelect write FEditorRightClickSelect default True;
    property EditorShowCloseButton: Boolean read FEditorShowCloseButton write FEditorShowCloseButton default False;
    property EditorShowImage: Boolean read FEditorShowImage write FEditorShowImage default True;
    property EnableLineNumbers: Boolean read FEnableLineNumbers write FEnableLineNumbers default True;
    property EnableSelectionMode: Boolean read FEnableSelectionMode write FEnableSelectionMode default False;
    property EnableSpecialChars: Boolean read FEnableSpecialChars write FEnableSpecialChars default False;
    property EnableWordWrap: Boolean read FEnableWordWrap write FEnableWordWrap default False;
    property FilterOnTyping: Boolean read FFilterOnTyping write FFilterOnTyping default True;
    property FontName: string read FFontName write FFontName;
    property FontSize: Integer read FFontSize write FFontSize default 9;
    property IgnoreBlanks: Boolean read FIgnoreBlanks write FIgnoreBlanks default True;
    property IgnoreCase: Boolean read FIgnoreCase write FIgnoreCase default True;
    property InsertCaret: TSynEditCaretType read FInsertCaret write FInsertCaret default ctVerticalLine;
    property LineSpacing: Integer read FLineSpacing write FLineSpacing default 0;
    property MainMenuFontName: string read FMainMenuFontName write FMainMenuFontName;
    property MainMenuFontSize: Integer read FMainMenuFontSize write FMainMenuFontSize default 8;
    property MainMenuSystemFontName: string read FMainMenuSystemFontName write FMainMenuSystemFontName;
    property MainMenuSystemFontSize: Integer read FMainMenuSystemFontSize write FMainMenuSystemFontSize;
    property MainMenuUseSystemFont: Boolean read FMainMenuUseSystemFont write FMainMenuUseSystemFont default False;
    property MarginFontName: string read FMarginFontName write FMarginFontName;
    property MarginFontSize: Integer read FMarginFontSize write FMarginFontSize default 9;
    property MarginInTens: Boolean read FMarginInTens write FMarginInTens default True;
    property MarginLeftMarginAutoSize: Boolean read FMarginLeftMarginAutoSize write FMarginLeftMarginAutoSize default True;
    property MarginLeftMarginWidth: Integer read FMarginLeftMarginWidth write FMarginLeftMarginWidth default 30;
    property MarginLeftMarginMouseMove: Boolean read FMarginLeftMarginMouseMove write FMarginLeftMarginMouseMove default True;
    property MarginLineModified: Boolean read FMarginLineModified write FMarginLineModified default False;
    property MarginModifiedColor: string read FMarginModifiedColor write FMarginModifiedColor;
    property MarginNormalColor: string read FMarginNormalColor write FMarginNormalColor;
    property MarginRightMargin: Integer read FMarginRightMargin write FMarginRightMargin default 80;
    property MarginShowBookmarks: Boolean read FMarginShowBookmarks write FMarginShowBookmarks default True;
    property MarginShowBookmarkPanel: Boolean read FMarginShowBookmarkPanel write FMarginShowBookmarkPanel default True;
    property MarginVisibleLeftMargin: Boolean read FMarginVisibleLeftMargin write FMarginVisibleLeftMargin default True;
    property MarginVisibleRightMargin: Boolean read FMarginVisibleRightMargin write FMarginVisibleRightMargin default True;
    property MarginZeroStart: Boolean read FMarginZeroStart write FMarginZeroStart default False;
    property MinimapFontName: string read FMinimapFontName write FMinimapFontName;
    property MinimapFontSize: Integer read FMinimapFontSize write FMinimapFontSize default 2;
    property MinimapWidth: Integer read FMinimapWidth write FMinimapWidth default 100;
    property NonblinkingCaret: Boolean read FNonblinkingCaret write FNonblinkingCaret default False;
    property NonblinkingCaretColor: string read FNonblinkingCaretColor write FNonblinkingCaretColor;
    property ObjectFrameAlign: string read FObjectFrameAlign write FObjectFrameAlign;
    property OutputCloseTabByDblClick: Boolean read FOutputCloseTabByDblClick write FOutputCloseTabByDblClick default False;
    property OutputCloseTabByMiddleClick: Boolean read FOutputCloseTabByMiddleClick write FOutputCloseTabByMiddleClick default False;
    property OutputDoubleBuffered: Boolean read FOutputDoubleBuffered write FOutputDoubleBuffered default True;
    property OutputIndent: Integer read FOutputIndent write FOutputIndent default 16;
    property OutputMultiLine: Boolean read FOutputMultiLine write FOutputMultiLine default False;
    property OutputRightClickSelect: Boolean read FOutputRightClickSelect write FOutputRightClickSelect default True;
    property OutputShowCloseButton: Boolean read FOutputShowCloseButton write FOutputShowCloseButton default False;
    property OutputShowImage: Boolean read FOutputShowImage write FOutputShowImage default True;
    property OutputShowTreeLines: Boolean read FOutputShowTreeLines write FOutputShowTreeLines default False;
    property PersistentHotKeys: Boolean read FPersistentHotKeys write FPersistentHotKeys default False;
    property PollingInterval: Integer read FPollingInterval write FPollingInterval default 1;
    property PrintDateTime: Integer read FPrintDateTime write FPrintDateTime default 1;
    property PrintDocumentName: Integer read FPrintDocumentName write FPrintDocumentName default 2;
    property PrintPageNumber: Integer read FPrintPageNumber write FPrintPageNumber default 3;
    property PrintPrintedBy: Integer read FPrintPrintedBy write FPrintPrintedBy default 0;
    property PrintShowFooterLine: Boolean read FPrintShowFooterLine write FPrintShowFooterLine default True;
    property PrintShowHeaderLine: Boolean read FPrintShowHeaderLine write FPrintShowHeaderLine default True;
    property PrintShowLineNumbers: Boolean read FPrintShowLineNumbers write FPrintShowLineNumbers default False;
    property PrintWordWrapLine: Boolean read FPrintWordWrapLine write FPrintWordWrapLine default False;
    property SchemaBrowserAlign: string read FSchemaBrowserAlign write FSchemaBrowserAlign;
    property SchemaBrowserIndent: Integer read FSchemaBrowserIndent write FSchemaBrowserIndent default 16;
    property SchemaBrowserShowTreeLines: Boolean read FSchemaBrowserShowTreeLines write FSchemaBrowserShowTreeLines default False;
    property ScrollPastEof: Boolean read FScrollPastEof write FScrollPastEof default False;
    property ScrollPastEol: Boolean read FScrollPastEol write FScrollPastEol default True;
    property Shadows: Boolean read FShadows write FShadows default True;
    property ShowSearchStringNotFound: Boolean read FShowSearchStringNotFound write FShowSearchStringNotFound default True;
    property ShowDataSearchPanel: Boolean read FShowDataSearchPanel write FShowDataSearchPanel default True;
    property ShowObjectCreationAndModificationTimestamp: Boolean read FShowObjectCreationAndModificationTimestamp write FShowObjectCreationAndModificationTimestamp default False;
    property SmartTabDelete: Boolean read FSmartTabDelete write FSmartTabDelete default False;
    property SmartTabs: Boolean read FSmartTabs write FSmartTabs default False;
    property StatusBarFontName: string read FStatusBarFontName write FStatusBarFontName;
    property StatusBarFontSize: Integer read FStatusBarFontSize write FStatusBarFontSize default 8;
    property StatusBarUseSystemFont: Boolean read FStatusBarUseSystemFont write FStatusBarUseSystemFont default False;
    property TabsToSpaces: Boolean read FTabsToSpaces write FTabsToSpaces default True;
    property TabWidth: Integer read FTabWidth write FTabWidth default 8;
    property TimeFormat: string read FTimeFormat write FTimeFormat;
    property ToolBarCase: Boolean read FToolBarCase write FToolBarCase default True;
    property ToolBarCommand: Boolean read FToolBarCommand write FToolBarCommand default True;
    property ToolBarDBMS: Boolean read FToolBarDBMS write FToolBarDBMS default True;
    property ToolBarExecute: Boolean read FToolBarExecute write FToolBarExecute default True;
    property ToolBarExplainPlan: Boolean read FToolBarExplainPlan write FToolBarExplainPlan default True;
    property ToolBarIndent: Boolean read FToolBarIndent write FToolBarIndent default True;
    property ToolBarMode: Boolean read FToolBarMode write FToolBarMode default True;
    property ToolBarPrint: Boolean read FToolBarPrint write FToolBarPrint default True;
    property ToolBarSearch: Boolean read FToolBarSearch write FToolBarSearch default True;
    property ToolBarSort: Boolean read FToolBarSort write FToolBarSort default True;
    property ToolBarStandard: Boolean read FToolBarStandard write FToolBarStandard default True;
    property ToolBarTools: Boolean read FToolBarTools write FToolBarTools default True;
    property ToolBarTransaction: Boolean read FToolBarTransaction write FToolBarTransaction default True;
    property TrimTrailingSpaces: Boolean read FTrimTrailingSpaces write FTrimTrailingSpaces default True;
    property TripleClickRowSelect: Boolean read FTripleClickRowSelect write FTripleClickRowSelect default True;
    property UndoAfterSave: Boolean read FUndoAfterSave write FUndoAfterSave default False;
  end;

function OptionsDialog: TOptionsDialog;
function OptionsContainer: TOptionsContainer;

implementation

{$R *.dfm}

uses
  System.Math, BCCommon.StyleUtils, SynEditTypes, SynCompletionProposal, BCCommon.Messages, System.IniFiles,
  BCCommon.FileUtils;

const
  CELL_PADDING = 4;

{ TOptionsContainer }

var
  FOptionsContainer: TOptionsContainer;
  FOptionsDialog: TOptionsDialog;

function OptionsContainer: TOptionsContainer;
begin
  if not Assigned(FOptionsContainer) then
    FOptionsContainer := TOptionsContainer.Create(nil);
  Result := FOptionsContainer;
end;

procedure TOptionsContainer.AssignTo(Dest: TPersistent);
begin
  if Assigned(Dest) and (Dest is TCustomSynEdit) then
  begin
    TCustomSynEdit(Dest).Font.Name := FFontName;
    TCustomSynEdit(Dest).Font.Size := FFontSize;
    TCustomSynEdit(Dest).Gutter.Visible := FMarginVisibleLeftMargin;
    TCustomSynEdit(Dest).Gutter.Font.Name := FMarginFontName;
    TCustomSynEdit(Dest).Gutter.Font.Size := FMarginFontSize;
    TCustomSynEdit(Dest).LineSpacing := FLineSpacing;
    TCustomSynEdit(Dest).RightEdge.Visible := FMarginVisibleRightMargin;
    TCustomSynEdit(Dest).Gutter.AutoSize := FMarginLeftMarginAutoSize;
    TCustomSynEdit(Dest).Gutter.Width := FMarginLeftMarginWidth;
    TCustomSynEdit(Dest).Gutter.Intens := FMarginInTens;
    TCustomSynEdit(Dest).Gutter.ZeroStart := FMarginZeroStart;
    TCustomSynEdit(Dest).Gutter.ShowLineModified := FMarginLineModified;
    TCustomSynEdit(Dest).Gutter.ShowBookmarks := FMarginShowBookmarks;
    TCustomSynEdit(Dest).Gutter.ShowBookmarkPanel := FMarginShowBookmarkPanel;
    TCustomSynEdit(Dest).Gutter.LineModifiedColor := StringToColor(FMarginModifiedColor);
    TCustomSynEdit(Dest).Gutter.LineNormalColor := StringToColor(FMarginNormalColor);
    TCustomSynEdit(Dest).TabWidth := FTabWidth;
    TCustomSynEdit(Dest).InsertCaret := FInsertCaret;
    TCustomSynEdit(Dest).NonBlinkingCaretColor := StringToColor(FNonblinkingCaretColor);
    if FAutoIndent then
      TCustomSynEdit(Dest).Options := TCustomSynEdit(Dest).Options + [eoAutoIndent]
    else
      TCustomSynEdit(Dest).Options := TCustomSynEdit(Dest).Options - [eoAutoIndent];
    if FScrollPastEof then
      TCustomSynEdit(Dest).Options := TCustomSynEdit(Dest).Options + [eoScrollPastEof]
    else
      TCustomSynEdit(Dest).Options := TCustomSynEdit(Dest).Options - [eoScrollPastEof];
    if FScrollPastEol then
      TCustomSynEdit(Dest).Options := TCustomSynEdit(Dest).Options + [eoScrollPastEol]
    else
      TCustomSynEdit(Dest).Options := TCustomSynEdit(Dest).Options - [eoScrollPastEol];
    if FTabsToSpaces then
      TCustomSynEdit(Dest).Options := TCustomSynEdit(Dest).Options + [eoTabsToSpaces]
    else
      TCustomSynEdit(Dest).Options := TCustomSynEdit(Dest).Options - [eoTabsToSpaces];
    if FSmartTabs then
      TCustomSynEdit(Dest).Options := TCustomSynEdit(Dest).Options + [eoSmartTabs]
    else
      TCustomSynEdit(Dest).Options := TCustomSynEdit(Dest).Options - [eoSmartTabs];
    if FSmartTabDelete then
      TCustomSynEdit(Dest).Options := TCustomSynEdit(Dest).Options + [eoSmartTabDelete]
    else
      TCustomSynEdit(Dest).Options := TCustomSynEdit(Dest).Options - [eoSmartTabDelete];
    if FTrimTrailingSpaces then
      TCustomSynEdit(Dest).Options := TCustomSynEdit(Dest).Options + [eoTrimTrailingSpaces]
    else
      TCustomSynEdit(Dest).Options := TCustomSynEdit(Dest).Options - [eoTrimTrailingSpaces];
    if FTripleClickRowSelect then
      TCustomSynEdit(Dest).Options := TCustomSynEdit(Dest).Options + [eoTripleClicks]
    else
      TCustomSynEdit(Dest).Options := TCustomSynEdit(Dest).Options - [eoTripleClicks];
    if FNonblinkingCaret then
      TCustomSynEdit(Dest).Options := TCustomSynEdit(Dest).Options + [eoNonblinkingCaret]
    else
      TCustomSynEdit(Dest).Options := TCustomSynEdit(Dest).Options - [eoNonblinkingCaret];

    TCustomSynEdit(Dest).WordWrap.Enabled := FEnableWordWrap;
    TCustomSynEdit(Dest).Gutter.ShowLineNumbers := FEnableLineNumbers;

    if FEnableSpecialChars then
      TCustomSynEdit(Dest).Options := TCustomSynEdit(Dest).Options + [eoShowSpecialChars]
    else
      TCustomSynEdit(Dest).Options := TCustomSynEdit(Dest).Options - [eoShowSpecialChars];

    if FEnableSelectionMode then
      TCustomSynEdit(Dest).SelectionMode := smColumn
    else
      TCustomSynEdit(Dest).SelectionMode := smNormal;

    TCustomSynEdit(Dest).RightEdge.Visible := FMarginVisibleRightMargin;
    TCustomSynEdit(Dest).RightEdge.MouseMove := FMarginLeftMarginMouseMove;
    TCustomSynEdit(Dest).RightEdge.Position := FMarginRightMargin;

    TCustomSynEdit(Dest).Gutter.ShowBookmarks := FMarginShowBookmarks;
    TCustomSynEdit(Dest).Minimap.Font.Name := FMinimapFontName;
    TCustomSynEdit(Dest).Minimap.Font.Size := FMinimapFontSize;
    TCustomSynEdit(Dest).Minimap.Width := FMinimapWidth;
  end
  else
  if Assigned(Dest) and (Dest is TActionMainMenuBar) then
  begin
    TActionMainMenuBar(Dest).PersistentHotKeys := FPersistentHotKeys;
    TActionMainMenuBar(Dest).Shadows := FShadows;
    TActionMainMenuBar(Dest).UseSystemFont := FMainMenuUseSystemFont;
    if FMainMenuUseSystemFont then
    begin
      Screen.MenuFont.Name := FMainMenuSystemFontName;
      Screen.MenuFont.Size := FMainMenuSystemFontSize;
    end
    else
    begin
      Screen.MenuFont.Name := FMainMenuFontName;
      Screen.MenuFont.Size := FMainMenuFontSize;
    end;
    TActionMainMenuBar(Dest).AnimationStyle := FAnimationStyle;
    TActionMainMenuBar(Dest).AnimateDuration := FAnimationDuration;
  end
  else
  if Assigned(Dest) and (Dest is TStatusBar) then
  begin
    TStatusBar(Dest).UseSystemFont := FStatusBarUseSystemFont;
    if not FStatusBarUseSystemFont then
    begin
      TStatusBar(Dest).Font.Name := FStatusBarFontName;
      TStatusBar(Dest).Font.Size := FStatusBarFontSize;
      TStatusBar(Dest).Height := FStatusBarFontSize + 11;
    end;
  end
  else
  if Assigned(Dest) and (Dest is TSynCompletionProposal) then
  begin
    if not FCompletionProposalEnabled then
      TSynCompletionProposal(Dest).ShortCut := TextToShortCut('')
    else
      TSynCompletionProposal(Dest).ShortCut := TextToShortCut(FCompletionProposalShortcut);
    if FCompletionProposalCaseSensitive then
      TSynCompletionProposal(Dest).Options := TSynCompletionProposal(Dest).Options + [scoCaseSensitive]
    else
      TSynCompletionProposal(Dest).Options := TSynCompletionProposal(Dest).Options - [scoCaseSensitive];
  end
  else
    inherited;
end;

constructor TOptionsContainer.Create(AOwner: TComponent);
begin
  { default values }
  FCompletionProposalShortCut := 'Ctrl+Space';
  FDateFormat := 'DD.MM.YYYY';
  FFontName := 'Courier New';
  FNonblinkingCaretColor := 'clBlack';
  FMainMenuFontName := 'Tahoma';
  FMainMenuSystemFontName := Screen.MenuFont.Name;
  FMainMenuSystemFontSize := Screen.MenuFont.Size;
  FMarginFontName := 'Courier New';
  FMarginModifiedColor := 'clYellow';
  FMarginNormalColor := 'clGreen';
  FObjectFrameAlign := 'Bottom';
  FSchemaBrowserAlign := 'Bottom';
  FStatusBarFontName := 'Tahoma';
  FTimeFormat := 'HH24:MI:SS';
end;

destructor TOptionsContainer.Destroy;
begin
  FOptionsContainer := nil;
  inherited;
end;

{ TOptionsDialog }

function OptionsDialog: TOptionsDialog;
begin
  if not Assigned(FOptionsDialog) then
    Application.CreateForm(TOptionsDialog, FOptionsDialog);
  Result := FOptionsDialog;
  SetStyledFormSize(Result);
end;

procedure TOptionsDialog.FormDestroy(Sender: TObject);
begin
  FEditorOptionsFrame.Free;
  FEditorFontFrame.Free;
  FEditorLeftMarginFrame.Free;
  FEditorRightMarginFrame.Free;
  FEditorTabsFrame.Free;
  FEditorSearchFrame.Free;
  FEditorToolBarFrame.Free;
  FEditorCompletionProposalFrame.Free;
  FMainMenuFrame.Free;
  FOptionsOutputFrame.Free;
  FOutputTabsFrame.Free;
  FDBMSOutputFrame.Free;
  FOptionsSchemaBrowserFrame.Free;
  FObjectFrameFrame.Free;
  FDateFormatFrame.Free;
  FTimeFormatFrame.Free;
  FConnectionTabsFrame.Free;
  FOptionsCompareFrame.Free;
  FStatusBarFrame.Free;
  FOptionsPrintFrame.Free;

  FOptionsDialog := nil;
end;

procedure TOptionsDialog.FormShow(Sender: TObject);
var
  Node: PVirtualNode;
begin
  inherited;
  Node := OptionsVirtualStringTree.GetFirstSelected;
  CreateTree;
  OptionsVirtualStringTree.Selected[Node] := True;
  SetVisibleFrame;
end;

procedure TOptionsDialog.CreateTree;
var
  Data: POptionsRec;
  Node, ChildNode: PVirtualNode;
begin
  with OptionsVirtualStringTree do
  begin
    Clear;
    { Editor }
    Node := AddChild(nil);
    Data := GetNodeData(Node);
    Data.ImageIndex := EditorAction.ImageIndex;
    Data.Caption := EditorAction.Caption;
    { Font }
    ChildNode := AddChild(Node);
    Data := GetNodeData(ChildNode);
    Data.ImageIndex := EditorFontAction.ImageIndex;
    Data.Caption := EditorFontAction.Caption;
    { Left Margin }
    ChildNode := AddChild(Node);
    Data := GetNodeData(ChildNode);
    Data.ImageIndex := EditorLeftMarginAction.ImageIndex;
    Data.Caption := EditorLeftMarginAction.Caption;
    { Right Margin }
    ChildNode := AddChild(Node);
    Data := GetNodeData(ChildNode);
    Data.ImageIndex := EditorRightMarginAction.ImageIndex;
    Data.Caption := EditorRightMarginAction.Caption;
    { Tabs }
    ChildNode := AddChild(Node);
    Data := GetNodeData(ChildNode);
    Data.ImageIndex := EditorTabsAction.ImageIndex;
    Data.Caption := EditorTabsAction.Caption;
    { Search }
    ChildNode := AddChild(Node);
    Data := GetNodeData(ChildNode);
    Data.ImageIndex := EditorSearchAction.ImageIndex;
    Data.Caption := EditorSearchAction.Caption;
    { Completion proposal }
    ChildNode := AddChild(Node);
    Data := GetNodeData(ChildNode);
    Data.ImageIndex := EditorCompletionProposalAction.ImageIndex;
    Data.Caption := EditorCompletionProposalAction.Caption;
    { Tool bar }
    ChildNode := AddChild(Node);
    Data := GetNodeData(ChildNode);
    Data.ImageIndex := EditorToolBarAction.ImageIndex;
    Data.Caption := EditorToolBarAction.Caption;
    Node.ChildCount := 7;
    OptionsVirtualStringTree.Selected[Node] := True;
    OptionsVirtualStringTree.Expanded[Node] := True;
    { Schema Browser }
    Node := AddChild(nil);
    Data := GetNodeData(Node);
    Data.ImageIndex := SchemaBrowserAction.ImageIndex;
    Data.Caption := SchemaBrowserAction.Caption;
    { Object Frame }
    ChildNode := AddChild(Node);
    Data := GetNodeData(ChildNode);
    Data.ImageIndex := ObjectFrameAction.ImageIndex;
    Data.Caption := ObjectFrameAction.Caption;
    Node.ChildCount := 1;
    OptionsVirtualStringTree.Selected[Node] := True;
    OptionsVirtualStringTree.Expanded[Node] := True;
    { Connection }
    Node := AddChild(nil);
    Data := GetNodeData(Node);
    Data.ImageIndex := ConnectionAction.ImageIndex;
    Data.Caption := ConnectionAction.Caption;
    { Tabs }
    ChildNode := AddChild(Node);
    Data := GetNodeData(ChildNode);
    Data.ImageIndex := ConnectionTabsAction.ImageIndex;
    Data.Caption := ConnectionTabsAction.Caption;
    Node.ChildCount := 1;
    OptionsVirtualStringTree.Selected[Node] := True;
    OptionsVirtualStringTree.Expanded[Node] := True;
    { Output }
    Node := AddChild(nil);
    Data := GetNodeData(Node);
    Data.ImageIndex := OutputAction.ImageIndex;
    Data.Caption := OutputAction.Caption;
    { DBMS }
    ChildNode := AddChild(Node);
    Data := GetNodeData(ChildNode);
    Data.ImageIndex := DBMSOutputAction.ImageIndex;
    Data.Caption := DBMSOutputAction.Caption;
    { Tabs }
    ChildNode := AddChild(Node);
    Data := GetNodeData(ChildNode);
    Data.ImageIndex := OutputTabsAction.ImageIndex;
    Data.Caption := OutputTabsAction.Caption;
    Node.ChildCount := 2;
    OptionsVirtualStringTree.Selected[Node] := True;
    OptionsVirtualStringTree.Expanded[Node] := True;
    { Compare }
    Node := AddChild(nil);
    Data := GetNodeData(Node);
    Data.ImageIndex := CompareAction.ImageIndex;
    Data.Caption := CompareAction.Caption;
    { Print }
    Node := AddChild(nil);
    Data := GetNodeData(Node);
    Data.ImageIndex := PrintAction.ImageIndex;
    Data.Caption := PrintAction.Caption;
    { Main menu }
    Node := AddChild(nil);
    Data := GetNodeData(Node);
    Data.ImageIndex := MainMenuAction.ImageIndex;
    Data.Caption := MainMenuAction.Caption;
    { Status Bar }
    Node := AddChild(nil);
    Data := GetNodeData(Node);
    Data.ImageIndex := StatusBarAction.ImageIndex;
    Data.Caption := StatusBarAction.Caption;
    { DB Settings }
    Node := AddChild(nil);
    Data := GetNodeData(Node);
    Data.ImageIndex := DBSettingsAction.ImageIndex;
    Data.Caption := DBSettingsAction.Caption;
    { Date Format }
    ChildNode := AddChild(Node);
    Data := GetNodeData(ChildNode);
    Data.ImageIndex := DateFormatAction.ImageIndex;
    Data.Caption := DateFormatAction.Caption;
    { Time Format }
    ChildNode := AddChild(Node);
    Data := GetNodeData(ChildNode);
    Data.ImageIndex := TimeFormatAction.ImageIndex;
    Data.Caption := TimeFormatAction.Caption;
    Node.ChildCount := 2;
    OptionsVirtualStringTree.Selected[Node] := True;
    OptionsVirtualStringTree.Expanded[Node] := True;

    OptionsVirtualStringTree.Selected[OptionsVirtualStringTree.GetFirst] := True;
  end;
end;

function TOptionsDialog.Execute(OraSession: TOraSession; EditOptions: TOptionsContainer): Boolean;
begin
  FDateFormatFrame.Session := OraSession;
  FTimeFormatFrame.Session := OraSession;
  ReadIniFile;
  if not Assigned(EditOptions) then
  begin
    Result:= False;
    Exit;
  end;
  //Assign the Containers
  FOptionsContainer := EditOptions;
  //Get Data
  GetData;
  //Show the form
  Result:= Showmodal = mrOk;
  //PutData
  if Result then
    PutData;
end;

procedure TOptionsDialog.GetData;
begin
  { Options }
  FEditorOptionsFrame.AutoIndentCheckBox.Checked := FOptionsContainer.AutoIndent;
  FEditorOptionsFrame.AutoSaveCheckBox.Checked := FOptionsContainer.AutoSave;
  FEditorOptionsFrame.NonblinkingCaretCheckBox.Checked := FOptionsContainer.NonblinkingCaret;
  FEditorOptionsFrame.UndoAfterSaveCheckBox.Checked := FOptionsContainer.UndoAfterSave;
  FEditorOptionsFrame.TrimTrailingSpacesCheckBox.Checked := FOptionsContainer.TrimTrailingSpaces;
  FEditorOptionsFrame.TripleClickRowSelectCheckBox.Checked := FOptionsContainer.TripleClickRowSelect;
  FEditorOptionsFrame.ScrollPastEofCheckBox.Checked := FOptionsContainer.ScrollPastEof;
  FEditorOptionsFrame.ScrollPastEolCheckBox.Checked := FOptionsContainer.ScrollPastEol;
  FEditorOptionsFrame.TabsToSpacesCheckBox.Checked := FOptionsContainer.TabsToSpaces;
  FEditorOptionsFrame.SmartTabsCheckBox.Checked := FOptionsContainer.SmartTabs;
  FEditorOptionsFrame.SmartTabDeleteCheckBox.Checked := FOptionsContainer.SmartTabDelete;
  FEditorOptionsFrame.LineSpacingEdit.Text := IntToStr(FOptionsContainer.LineSpacing);
  FEditorOptionsFrame.TabWidthEdit.Text := IntToStr(FOptionsContainer.TabWidth);
  FEditorOptionsFrame.BrightnessTrackBar.Position := FOptionsContainer.ColorBrightness;
  FEditorOptionsFrame.InsertCaretComboBox.ItemIndex := Ord(FOptionsContainer.InsertCaret);
  FEditorOptionsFrame.NonblinkingCaretColorBox.Selected := StringToColor(FOptionsContainer.NonblinkingCaretColor);
  { Font }
  FEditorFontFrame.EditorFontLabel.Font.Name := FOptionsContainer.FontName;
  FEditorFontFrame.EditorFontLabel.Font.Size := FOptionsContainer.FontSize;
  FEditorFontFrame.EditorFontLabel.Caption := Format('%s %dpt', [FEditorFontFrame.EditorFontLabel.Font.Name, FEditorFontFrame.EditorFontLabel.Font.Size]);
  FEditorFontFrame.SynEdit.Text := FEditorFontFrame.EditorFontLabel.Caption;
  FEditorFontFrame.MarginFontLabel.Font.Name := FOptionsContainer.MarginFontName;
  FEditorFontFrame.MarginFontLabel.Font.Size := FOptionsContainer.MarginFontSize;
  FEditorFontFrame.MarginFontLabel.Caption := Format('%s %dpt', [FEditorFontFrame.MarginFontLabel.Font.Name, FEditorFontFrame.MarginFontLabel.Font.Size]);
  FEditorFontFrame.MinimapFontLabel.Font.Name := FOptionsContainer.MinimapFontName;
  FEditorFontFrame.MinimapFontLabel.Font.Size := FOptionsContainer.MinimapFontSize;
  FEditorFontFrame.MinimapFontLabel.Caption := Format('%s %dpt', [FEditorFontFrame.MinimapFontLabel.Font.Name, FEditorFontFrame.MinimapFontLabel.Font.Size]);
  FEditorFontFrame.MinimapWidthEdit.Text := IntToStr(FOptionsContainer.MinimapWidth);
  { Left Margin }
  FEditorLeftMarginFrame.AutoSizeCheckBox.Checked := FOptionsContainer.MarginLeftMarginAutoSize;
  FEditorLeftMarginFrame.VisibleCheckBox.Checked := FOptionsContainer.MarginVisibleLeftMargin;
  FEditorLeftMarginFrame.InTensCheckBox.Checked := FOptionsContainer.MarginInTens;
  FEditorLeftMarginFrame.ZeroStartCheckBox.Checked := FOptionsContainer.MarginZeroStart;
  FEditorLeftMarginFrame.ShowBookmarksCheckBox.Checked := FOptionsContainer.MarginShowBookmarks;
  FEditorLeftMarginFrame.ShowBookmarkPanelCheckBox.Checked := FOptionsContainer.MarginShowBookmarkPanel;
  FEditorLeftMarginFrame.ShowLineModifiedCheckBox.Checked := FOptionsContainer.MarginLineModified;
  FEditorLeftMarginFrame.LineModifiedColorBox.Selected := StringToColor(FOptionsContainer.MarginModifiedColor);
  FEditorLeftMarginFrame.LineNormalColorBox.Selected := StringToColor(FOptionsContainer.MarginNormalColor);
  FEditorLeftMarginFrame.LeftMarginWidthEdit.Text := IntToStr(FOptionsContainer.MarginLeftMarginWidth);
  { Right Margin }
  FEditorRightMarginFrame.VisibleCheckBox.Checked := FOptionsContainer.MarginVisibleRightMargin;
  FEditorRightMarginFrame.PositionEdit.Text := IntToStr(FOptionsContainer.MarginRightMargin);
  FEditorRightMarginFrame.MouseMoveCheckBox.Checked := FOptionsContainer.MarginLeftMarginMouseMove;
  { Search }
  FEditorSearchFrame.ShowSearchStringNotFoundCheckBox.Checked := FOptionsContainer.ShowSearchStringNotFound;
  FEditorSearchFrame.BeepIfSearchStringNotFoundCheckBox.Checked := FOptionsContainer.BeepIfSearchStringNotFound;
  { Document tabs }
  FEditorTabsFrame.CloseTabByDblClickCheckBox.Checked := FOptionsContainer.EditorCloseTabByDblClick;
  FEditorTabsFrame.CloseTabByMiddleClickCheckBox.Checked := FOptionsContainer.EditorCloseTabByMiddleClick;
  FEditorTabsFrame.MultiLineCheckBox.Checked := FOptionsContainer.EditorMultiLine;
  FEditorTabsFrame.DoubleBufferedCheckBox.Checked := FOptionsContainer.EditorDoubleBuffered;
  FEditorTabsFrame.ShowCloseButtonCheckBox.Checked := FOptionsContainer.EditorShowCloseButton;
  FEditorTabsFrame.ShowImageCheckBox.Checked := FOptionsContainer.EditorShowImage;
  FEditorTabsFrame.RightClickSelectCheckBox.Checked := FOptionsContainer.EditorRightClickSelect;
  { Completion proposal }
  FEditorCompletionProposalFrame.EnabledCheckBox.Checked := FOptionsContainer.CompletionProposalEnabled;
  FEditorCompletionProposalFrame.CaseSensitiveCheckBox.Checked := FOptionsContainer.CompletionProposalCaseSensitive;
  FEditorCompletionProposalFrame.ShortcutComboBox.Text := FOptionsContainer.CompletionProposalShortcut;
  { Tool bar }
  FEditorToolBarFrame.ExecuteCheckBox.Checked := FOptionsContainer.ToolBarExecute;
  FEditorToolBarFrame.TransactionCheckBox.Checked := FOptionsContainer.ToolBarTransaction;
  FEditorToolBarFrame.DBMSCheckBox.Checked := FOptionsContainer.ToolBarDBMS;
  FEditorToolBarFrame.ExplainPlanCheckBox.Checked := FOptionsContainer.ToolBarExplainPlan;
  FEditorToolBarFrame.StandardCheckBox.Checked := FOptionsContainer.ToolBarStandard;
  FEditorToolBarFrame.PrintCheckBox.Checked := FOptionsContainer.ToolBarPrint;
  FEditorToolBarFrame.IndentCheckBox.Checked := FOptionsContainer.ToolBarIndent;
  FEditorToolBarFrame.SortCheckBox.Checked := FOptionsContainer.ToolBarSort;
  FEditorToolBarFrame.CaseCheckBox.Checked := FOptionsContainer.ToolBarCase;
  FEditorToolBarFrame.CommandCheckBox.Checked := FOptionsContainer.ToolBarCommand;
  FEditorToolBarFrame.SearchCheckBox.Checked := FOptionsContainer.ToolBarSearch;
  FEditorToolBarFrame.ModeCheckBox.Checked := FOptionsContainer.ToolBarMode;
  FEditorToolBarFrame.ToolsCheckBox.Checked := FOptionsContainer.ToolBarTools;
  { Connection tabs }
  FConnectionTabsFrame.CloseTabByDblClickCheckBox.Checked := FOptionsContainer.ConnectionCloseTabByDblClick;
  FConnectionTabsFrame.CloseTabByMiddleClickCheckBox.Checked := FOptionsContainer.ConnectionCloseTabByMiddleClick;
  FConnectionTabsFrame.MultiLineCheckBox.Checked := FOptionsContainer.ConnectionMultiLine;
  FConnectionTabsFrame.DoubleBufferedCheckBox.Checked := FOptionsContainer.ConnectionDoubleBuffered;
  FConnectionTabsFrame.ShowCloseButtonCheckBox.Checked := FOptionsContainer.ConnectionShowCloseButton;
  FConnectionTabsFrame.ShowImageCheckBox.Checked := FOptionsContainer.ConnectionShowImage;
  FConnectionTabsFrame.RightClickSelectCheckBox.Checked := FOptionsContainer.ConnectionRightClickSelect;
  { Output tabs }
  FOutputTabsFrame.CloseTabByDblClickCheckBox.Checked := FOptionsContainer.OutputCloseTabByDblClick;
  FOutputTabsFrame.CloseTabByMiddleClickCheckBox.Checked := FOptionsContainer.OutputCloseTabByMiddleClick;
  FOutputTabsFrame.MultiLineCheckBox.Checked := FOptionsContainer.OutputMultiLine;
  FOutputTabsFrame.DoubleBufferedCheckBox.Checked := FOptionsContainer.OutputDoubleBuffered;
  FOutputTabsFrame.ShowCloseButtonCheckBox.Checked := FOptionsContainer.OutputShowCloseButton;
  FOutputTabsFrame.ShowImageCheckBox.Checked := FOptionsContainer.OutputShowImage;
  FOutputTabsFrame.RightClickSelectCheckBox.Checked := FOptionsContainer.OutputRightClickSelect;
  { Compare }
  FOptionsCompareFrame.IgnoreCaseCheckBox.Checked := FOptionsContainer.IgnoreCase;
  FOptionsCompareFrame.IgnoreBlanksCheckBox.Checked := FOptionsContainer.IgnoreBlanks;
  { Print preview }
  FOptionsPrintFrame.DocumentNameComboBox.ItemIndex := FOptionsContainer.PrintDocumentName;
  FOptionsPrintFrame.PageNumberComboBox.ItemIndex := FOptionsContainer.PrintPageNumber;
  FOptionsPrintFrame.PrintedByComboBox.ItemIndex := FOptionsContainer.PrintPrintedBy;
  FOptionsPrintFrame.DateTimeComboBox.ItemIndex := FOptionsContainer.PrintDateTime;
  FOptionsPrintFrame.ShowHeaderLineCheckBox.Checked := FOptionsContainer.PrintShowHeaderLine;
  FOptionsPrintFrame.ShowFooterLineCheckBox.Checked := FOptionsContainer.PrintShowFooterLine;
  FOptionsPrintFrame.ShowLineNumbersCheckBox.Checked := FOptionsContainer.PrintShowLineNumbers;
  FOptionsPrintFrame.WordWrapCheckBox.Checked := FOptionsContainer.PrintWordWrapLine;
  { Main menu }
  FMainMenuFrame.PersistentHotKeysCheckBox.Checked := FOptionsContainer.PersistentHotKeys;
  FMainMenuFrame.ShadowsCheckBox.Checked := FOptionsContainer.Shadows;
  FMainMenuFrame.UseSystemFontCheckBox.Checked := FOptionsContainer.MainMenuUseSystemFont;
  FMainMenuFrame.FontLabel.Font.Name := FOptionsContainer.MainMenuFontName;
  FMainMenuFrame.FontLabel.Font.Size := FOptionsContainer.MainMenuFontSize;
  FMainMenuFrame.FontLabel.Caption := Format('%s %dpt', [FMainMenuFrame.FontLabel.Font.Name, FMainMenuFrame.FontLabel.Font.Size]);
  FMainMenuFrame.AnimationStyleComboBox.ItemIndex := Ord(FOptionsContainer.AnimationStyle);
  FMainMenuFrame.AnimationDurationEdit.Text := IntToStr(FOptionsContainer.AnimationDuration);
  { Output }
  FOptionsOutputFrame.ShowTreeLinesCheckBox.Checked := FOptionsContainer.OutputShowTreeLines;
  FOptionsOutputFrame.IndentEdit.Text := IntToStr(FOptionsContainer.OutputIndent);
  { DBMS Output }
  FDBMSOutputFrame.PollingIntervalTrackBar.Position := FOptionsContainer.PollingInterval;
  { Format }
  FDateFormatFrame.DateFormatEdit.Text := FOptionsContainer.DateFormat;
  FTimeFormatFrame.TimeFormatEdit.Text := FOptionsContainer.TimeFormat;
  { SchemaBrowser }
  FOptionsSchemaBrowserFrame.ButtonPanelAlignComboBox.Text := FOptionsContainer.SchemaBrowserAlign;
  FOptionsSchemaBrowserFrame.ShowTreeLinesCheckBox.Checked := FOptionsContainer.SchemaBrowserShowTreeLines;
  FOptionsSchemaBrowserFrame.IndentEdit.Text := IntToStr(FOptionsContainer.SchemaBrowserIndent);
  { Object frame }
  FObjectFrameFrame.ButtonPanelAlignComboBox.Text := FOptionsContainer.ObjectFrameAlign;
  FObjectFrameFrame.ShowCreationAndModificationTimestampCheckBox.Checked := FOptionsContainer.ShowObjectCreationAndModificationTimestamp;
  FObjectFrameFrame.ShowDataSearchPanelCheckBox.Checked := FOptionsContainer.ShowDataSearchPanel;
  FObjectFrameFrame.FilterOnTypingCheckBox.Checked := FOptionsContainer.FilterOnTyping;
  { Status bar }
  FStatusBarFrame.UseSystemFontCheckBox.Checked := FOptionsContainer.StatusBarUseSystemFont;
  FStatusBarFrame.FontLabel.Font.Name := FOptionsContainer.StatusBarFontName;
  FStatusBarFrame.FontLabel.Font.Size := FOptionsContainer.StatusBarFontSize;
  FStatusBarFrame.FontLabel.Caption := Format('%s %dpt', [FStatusBarFrame.FontLabel.Font.Name, FStatusBarFrame.FontLabel.Font.Size]);
end;

procedure TOptionsDialog.OKButtonActionExecute(Sender: TObject);
begin
  if FDateFormatFrame.DateFormatExampleEdit.Font.Color = clRed then
  begin
    ShowErrorMessage('Invalid date format.');
    Exit;
  end;
  if FTimeFormatFrame.TimeFormatExampleEdit.Font.Color = clRed then
  begin
    ShowErrorMessage('Invalid time format.');
    Exit;
  end;

  ModalResult := mrOk;
end;

procedure TOptionsDialog.OptionsVirtualStringTreeClick(Sender: TObject);
begin
  inherited;
  SetVisibleFrame;
end;

procedure TOptionsDialog.OptionsVirtualStringTreeFreeNode(Sender: TBaseVirtualTree;
  Node: PVirtualNode);
var
  Data: POptionsRec;
begin
  Data := Sender.GetNodeData(Node);
  Finalize(Data^);
end;

procedure TOptionsDialog.OptionsVirtualStringTreeGetImageIndex(Sender: TBaseVirtualTree;
  Node: PVirtualNode; Kind: TVTImageKind; Column: TColumnIndex; var Ghosted: Boolean;
  var ImageIndex: Integer);
var
  Data: POptionsRec;
begin
  inherited;
  if not (Kind in [ikNormal, ikSelected]) then
    Exit;
  Data := Sender.GetNodeData(Node);
  if Assigned(Data) then
    ImageIndex := Data.ImageIndex;
end;

procedure TOptionsDialog.OptionsVirtualStringTreeGetText(Sender: TBaseVirtualTree;
  Node: PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType; var CellText: string);
var
  Data: POptionsRec;
begin
  Data := Sender.GetNodeData(Node);
  if Assigned(Data) then
    CellText := Data.Caption;
end;

procedure TOptionsDialog.OptionsVirtualStringTreePaintText(Sender: TBaseVirtualTree; const TargetCanvas: TCanvas;
  Node: PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType);
var
  LStyles: TCustomStyleServices;
begin
  if TStyleManager.ActiveStyle.Name <> STYLENAME_WINDOWS then
    if vsSelected in Node.States then
    begin
      LStyles := StyleServices;
      if LStyles.Enabled then
        TargetCanvas.Font.Color := LStyles.GetSystemColor(clHighlightText)
    end;
end;

procedure TOptionsDialog.SetVisibleFrame;
var
  i, Level, ParentIndex: Integer;
  TreeNode: PVirtualNode;
begin
  inherited;
  TreeNode := OptionsVirtualStringTree.GetFirstSelected;
  if Assigned(TreeNode) then
  begin
    { hide all frames }
    for i := 0 to ComponentCount - 1 do
      if Components[i]  is TFrame then
        TFrame(Components[i]).Visible := False;
    Level := OptionsVirtualStringTree.GetNodeLevel(TreeNode);
    ParentIndex := -1;
    if Level = 1 then
      ParentIndex := TreeNode.Parent.Index;
    FEditorOptionsFrame.Visible := (Level = 0) and (TreeNode.Index = 0);
    FEditorFontFrame.Visible := (ParentIndex = 0) and (Level = 1) and (TreeNode.Index = 0);
    if FEditorFontFrame.Visible then
    begin
      FOptionsContainer.AssignTo(FEditorFontFrame.SynEdit);
      FEditorFontFrame.SynEdit.ActiveLineColor := LightenColor(FEditorFontFrame.SynEdit.Color, 1 - (10 - FOptionsContainer.ColorBrightness)/10);
      BCCommon.StyleUtils.UpdateMarginAndColors(FEditorFontFrame.SynEdit);
    end;
    FEditorLeftMarginFrame.Visible := (ParentIndex = 0) and (Level = 1) and (TreeNode.Index = 1);
    FEditorRightMarginFrame.Visible := (ParentIndex = 0) and (Level = 1) and (TreeNode.Index = 2);
    FEditorTabsFrame.Visible := (ParentIndex = 0) and (Level = 1) and (TreeNode.Index = 3);
    FEditorSearchFrame.Visible := (ParentIndex = 0) and (Level = 1) and (TreeNode.Index = 4);
    FEditorCompletionProposalFrame.Visible := (ParentIndex = 0) and (Level = 1) and (TreeNode.Index = 5);
    FEditorToolBarFrame.Visible := (ParentIndex = 0) and (Level = 1) and (TreeNode.Index = 6);

    FOptionsSchemaBrowserFrame.Visible := (Level = 0) and (TreeNode.Index = 1);
    FObjectFrameFrame.Visible := (ParentIndex = 1) and (Level = 1) and (TreeNode.Index = 0);

    FConnectionTabsFrame.Visible := (ParentIndex = 2) and (Level = 1) and (TreeNode.Index = 0);

    FOptionsOutputFrame.Visible := (Level = 0) and (TreeNode.Index = 3);
    FDBMSOutputFrame.Visible := (ParentIndex = 3) and (Level = 1) and (TreeNode.Index = 0);
    FOutputTabsFrame.Visible := (ParentIndex = 3) and (Level = 1) and (TreeNode.Index = 1);

    FOptionsCompareFrame.Visible := (Level = 0) and (TreeNode.Index = 4);
    FOptionsPrintFrame.Visible := (Level = 0) and (TreeNode.Index = 5);
    FMainMenuFrame.Visible := (Level = 0) and (TreeNode.Index = 6);
    FStatusBarFrame.Visible := (Level = 0) and (TreeNode.Index = 7);

    FDateFormatFrame.Visible := (ParentIndex = 8) and (Level = 1) and (TreeNode.Index = 0);
    FTimeFormatFrame.Visible := (ParentIndex = 8) and (Level = 1) and (TreeNode.Index = 1);
  end;
end;

procedure TOptionsDialog.PutData;
begin
  { Options }
  FOptionsContainer.AutoIndent := FEditorOptionsFrame.AutoIndentCheckBox.Checked;
  FOptionsContainer.AutoSave := FEditorOptionsFrame.AutoSaveCheckBox.Checked;
  FOptionsContainer.NonblinkingCaret := FEditorOptionsFrame.NonblinkingCaretCheckBox.Checked;
  FOptionsContainer.UndoAfterSave := FEditorOptionsFrame.UndoAfterSaveCheckBox.Checked;
  FOptionsContainer.TrimTrailingSpaces := FEditorOptionsFrame.TrimTrailingSpacesCheckBox.Checked;
  FOptionsContainer.TripleClickRowSelect := FEditorOptionsFrame.TripleClickRowSelectCheckBox.Checked;
  FOptionsContainer.ScrollPastEof := FEditorOptionsFrame.ScrollPastEofCheckBox.Checked;
  FOptionsContainer.ScrollPastEol := FEditorOptionsFrame.ScrollPastEolCheckBox.Checked;
  FOptionsContainer.TabsToSpaces := FEditorOptionsFrame.TabsToSpacesCheckBox.Checked;
  FOptionsContainer.SmartTabs := FEditorOptionsFrame.SmartTabsCheckBox.Checked;
  FOptionsContainer.SmartTabDelete := FEditorOptionsFrame.SmartTabDeleteCheckBox.Checked;
  FOptionsContainer.LineSpacing := StrToIntDef(FEditorOptionsFrame.LineSpacingEdit.Text, 0);
  FOptionsContainer.TabWidth := StrToIntDef(FEditorOptionsFrame.TabWidthEdit.Text, 8);
  FOptionsContainer.ColorBrightness := FEditorOptionsFrame.BrightnessTrackBar.Position;
  FOptionsContainer.InsertCaret := TSynEditCaretType(FEditorOptionsFrame.InsertCaretComboBox.ItemIndex);
  FOptionsContainer.NonblinkingCaretColor := ColorToString(FEditorOptionsFrame.NonblinkingCaretColorBox.Selected);
  { Font }
  FOptionsContainer.FontName := FEditorFontFrame.EditorFontLabel.Font.Name;
  FOptionsContainer.FontSize := FEditorFontFrame.EditorFontLabel.Font.Size;
  FOptionsContainer.MarginFontName := FEditorFontFrame.MarginFontLabel.Font.Name;
  FOptionsContainer.MarginFontSize := FEditorFontFrame.MarginFontLabel.Font.Size;
  FOptionsContainer.MinimapFontName := FEditorFontFrame.MinimapFontLabel.Font.Name;
  FOptionsContainer.MinimapFontSize := FEditorFontFrame.MinimapFontLabel.Font.Size;
  FOptionsContainer.MinimapWidth := StrToIntDef(FEditorFontFrame.MinimapWidthEdit.Text, 100);
  { Left Margin }
  FOptionsContainer.MarginVisibleLeftMargin := FEditorLeftMarginFrame.VisibleCheckBox.Checked;
  FOptionsContainer.MarginLeftMarginAutoSize := FEditorLeftMarginFrame.AutoSizeCheckBox.Checked;
  FOptionsContainer.MarginInTens := FEditorLeftMarginFrame.InTensCheckBox.Checked;
  FOptionsContainer.MarginZeroStart := FEditorLeftMarginFrame.ZeroStartCheckBox.Checked;
  FOptionsContainer.MarginShowBookmarks := FEditorLeftMarginFrame.ShowBookmarksCheckBox.Checked;
  FOptionsContainer.MarginShowBookmarkPanel := FEditorLeftMarginFrame.ShowBookmarkPanelCheckBox.Checked;
  FOptionsContainer.MarginLineModified := FEditorLeftMarginFrame.ShowLineModifiedCheckBox.Checked;
  FOptionsContainer.MarginModifiedColor := ColorToString(FEditorLeftMarginFrame.LineModifiedColorBox.Selected);
  FOptionsContainer.MarginNormalColor := ColorToString(FEditorLeftMarginFrame.LineNormalColorBox.Selected);
  FOptionsContainer.MarginLeftMarginWidth := StrToIntDef(FEditorLeftMarginFrame.LeftMarginWidthEdit.Text, 30);
  { Right Margin }
  FOptionsContainer.MarginVisibleRightMargin := FEditorRightMarginFrame.VisibleCheckBox.Checked;
  FOptionsContainer.MarginRightMargin := StrToIntDef(FEditorRightMarginFrame.PositionEdit.Text, 80);
  FOptionsContainer.MarginLeftMarginMouseMove := FEditorRightMarginFrame.MouseMoveCheckBox.Checked;
  { Search }
  FOptionsContainer.ShowSearchStringNotFound := FEditorSearchFrame.ShowSearchStringNotFoundCheckBox.Checked;
  FOptionsContainer.BeepIfSearchStringNotFound := FEditorSearchFrame.BeepIfSearchStringNotFoundCheckBox.Checked;
  { Editor tabs }
  FOptionsContainer.EditorCloseTabByDblClick := FEditorTabsFrame.CloseTabByDblClickCheckBox.Checked;
  FOptionsContainer.EditorCloseTabByMiddleClick := FEditorTabsFrame.CloseTabByMiddleClickCheckBox.Checked;
  FOptionsContainer.EditorMultiLine := FEditorTabsFrame.MultiLineCheckBox.Checked;
  FOptionsContainer.EditorDoubleBuffered := FEditorTabsFrame.DoubleBufferedCheckBox.Checked;
  FOptionsContainer.EditorShowCloseButton := FEditorTabsFrame.ShowCloseButtonCheckBox.Checked;
  FOptionsContainer.EditorShowImage := FEditorTabsFrame.ShowImageCheckBox.Checked;
  FOptionsContainer.EditorRightClickSelect := FEditorTabsFrame.RightClickSelectCheckBox.Checked;
  { Completion proposal }
  FOptionsContainer.CompletionProposalEnabled := FEditorCompletionProposalFrame.EnabledCheckBox.Checked;
  FOptionsContainer.CompletionProposalCaseSensitive := FEditorCompletionProposalFrame.CaseSensitiveCheckBox.Checked;
  FOptionsContainer.CompletionProposalShortcut := FEditorCompletionProposalFrame.ShortcutComboBox.Text;
  { Tool bar }
  FOptionsContainer.ToolBarExecute := FEditorToolBarFrame.ExecuteCheckBox.Checked;
  FOptionsContainer.ToolBarTransaction := FEditorToolBarFrame.TransactionCheckBox.Checked;
  FOptionsContainer.ToolBarDBMS := FEditorToolBarFrame.DBMSCheckBox.Checked;
  FOptionsContainer.ToolBarExplainPlan := FEditorToolBarFrame.ExplainPlanCheckBox.Checked;
  FOptionsContainer.ToolBarStandard := FEditorToolBarFrame.StandardCheckBox.Checked;
  FOptionsContainer.ToolBarPrint := FEditorToolBarFrame.PrintCheckBox.Checked;
  FOptionsContainer.ToolBarIndent := FEditorToolBarFrame.IndentCheckBox.Checked;
  FOptionsContainer.ToolBarSort := FEditorToolBarFrame.SortCheckBox.Checked;
  FOptionsContainer.ToolBarCase := FEditorToolBarFrame.CaseCheckBox.Checked;
  FOptionsContainer.ToolBarCommand := FEditorToolBarFrame.CommandCheckBox.Checked;
  FOptionsContainer.ToolBarSearch := FEditorToolBarFrame.SearchCheckBox.Checked;
  FOptionsContainer.ToolBarMode := FEditorToolBarFrame.ModeCheckBox.Checked;
  FOptionsContainer.ToolBarTools := FEditorToolBarFrame.ToolsCheckBox.Checked;
  { Connection tabs }
  FOptionsContainer.ConnectionCloseTabByDblClick := FConnectionTabsFrame.CloseTabByDblClickCheckBox.Checked;
  FOptionsContainer.ConnectionCloseTabByMiddleClick := FConnectionTabsFrame.CloseTabByMiddleClickCheckBox.Checked;
  FOptionsContainer.ConnectionMultiLine := FConnectionTabsFrame.MultiLineCheckBox.Checked;
  FOptionsContainer.ConnectionDoubleBuffered := FConnectionTabsFrame.DoubleBufferedCheckBox.Checked;
  FOptionsContainer.ConnectionShowCloseButton := FConnectionTabsFrame.ShowCloseButtonCheckBox.Checked;
  FOptionsContainer.ConnectionShowImage := FConnectionTabsFrame.ShowImageCheckBox.Checked;
  FOptionsContainer.ConnectionRightClickSelect := FConnectionTabsFrame.RightClickSelectCheckBox.Checked;
  { Output tabs }
  FOptionsContainer.OutputCloseTabByDblClick := FOutputTabsFrame.CloseTabByDblClickCheckBox.Checked;
  FOptionsContainer.OutputCloseTabByMiddleClick := FOutputTabsFrame.CloseTabByMiddleClickCheckBox.Checked;
  FOptionsContainer.OutputMultiLine := FOutputTabsFrame.MultiLineCheckBox.Checked;
  FOptionsContainer.OutputDoubleBuffered := FOutputTabsFrame.DoubleBufferedCheckBox.Checked;
  FOptionsContainer.OutputShowCloseButton := FOutputTabsFrame.ShowCloseButtonCheckBox.Checked;
  FOptionsContainer.OutputShowImage := FOutputTabsFrame.ShowImageCheckBox.Checked;
  FOptionsContainer.OutputRightClickSelect := FOutputTabsFrame.RightClickSelectCheckBox.Checked;
  { Compare }
  FOptionsContainer.IgnoreCase := FOptionsCompareFrame.IgnoreCaseCheckBox.Checked;
  FOptionsContainer.IgnoreBlanks := FOptionsCompareFrame.IgnoreBlanksCheckBox.Checked;
  { Print preview }
  FOptionsContainer.PrintDocumentName := FOptionsPrintFrame.DocumentNameComboBox.ItemIndex;
  FOptionsContainer.PrintPageNumber := FOptionsPrintFrame.PageNumberComboBox.ItemIndex;
  FOptionsContainer.PrintPrintedBy := FOptionsPrintFrame.PrintedByComboBox.ItemIndex;
  FOptionsContainer.PrintDateTime := FOptionsPrintFrame.DateTimeComboBox.ItemIndex;
  FOptionsContainer.PrintShowHeaderLine := FOptionsPrintFrame.ShowHeaderLineCheckBox.Checked;
  FOptionsContainer.PrintShowFooterLine := FOptionsPrintFrame.ShowFooterLineCheckBox.Checked;
  FOptionsContainer.PrintShowLineNumbers := FOptionsPrintFrame.ShowLineNumbersCheckBox.Checked;
  FOptionsContainer.PrintWordWrapLine := FOptionsPrintFrame.WordWrapCheckBox.Checked;
  { Main menu }
  FOptionsContainer.PersistentHotKeys := FMainMenuFrame.PersistentHotKeysCheckBox.Checked;
  FOptionsContainer.Shadows := FMainMenuFrame.ShadowsCheckBox.Checked;
  FOptionsContainer.MainMenuUseSystemFont := FMainMenuFrame.UseSystemFontCheckBox.Checked;
  FOptionsContainer.MainMenuFontName := FMainMenuFrame.FontLabel.Font.Name;
  FOptionsContainer.MainMenuFontSize := FMainMenuFrame.FontLabel.Font.Size;
  FOptionsContainer.AnimationStyle := TAnimationStyle(FMainMenuFrame.AnimationStyleComboBox.ItemIndex);
  FOptionsContainer.AnimationDuration := StrToIntDef(FMainMenuFrame.AnimationDurationEdit.Text, 150);
  { Output }
  FOptionsContainer.OutputShowTreeLines := FOptionsOutputFrame.ShowTreeLinesCheckBox.Checked;
  FOptionsContainer.OutputIndent := StrToIntDef(FOptionsOutputFrame.IndentEdit.Text, 16);
  { DBMS Output }
  FOptionsContainer.PollingInterval := FDBMSOutputFrame.PollingIntervalTrackBar.Position;
  { Format }
  FOptionsContainer.DateFormat := FDateFormatFrame.DateFormatEdit.Text;
  FOptionsContainer.TimeFormat := FTimeFormatFrame.TimeFormatEdit.Text;
  { Schema browser }
  FOptionsContainer.SchemaBrowserAlign := FOptionsSchemaBrowserFrame.ButtonPanelAlignComboBox.Text;
  FOptionsContainer.SchemaBrowserShowTreeLines := FOptionsSchemaBrowserFrame.ShowTreeLinesCheckBox.Checked;
  FOptionsContainer.SchemaBrowserIndent := StrToIntDef(FOptionsSchemaBrowserFrame.IndentEdit.Text, 16);
  { Object frame }
  FOptionsContainer.ObjectFrameAlign := FObjectFrameFrame.ButtonPanelAlignComboBox.Text;
  FOptionsContainer.ShowObjectCreationAndModificationTimestamp := FObjectFrameFrame.ShowCreationAndModificationTimestampCheckBox.Checked;
  FOptionsContainer.ShowDataSearchPanel := FObjectFrameFrame.ShowDataSearchPanelCheckBox.Checked;
  FOptionsContainer.FilterOnTyping := FObjectFrameFrame.FilterOnTypingCheckBox.Checked;
  { Status bar }
  FOptionsContainer.StatusBarUseSystemFont := FStatusBarFrame.UseSystemFontCheckBox.Checked;
  FOptionsContainer.StatusBarFontName := FStatusBarFrame.FontLabel.Font.Name;
  FOptionsContainer.StatusBarFontSize := FStatusBarFrame.FontLabel.Font.Size;
end;

procedure TOptionsDialog.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  WriteIniFile;
end;

procedure TOptionsDialog.ReadIniFile;
begin
  with TMemIniFile.Create(GetIniFilename) do
  try
    { Size }
    Width := ReadInteger('OptionsSize', 'Width', Width);
    Height := ReadInteger('OptionsSize', 'Height', Height);
    { Position }
    Left := ReadInteger('OptionsPosition', 'Left', (Screen.Width - Width) div 2);
    Top := ReadInteger('OptionsPosition', 'Top', (Screen.Height - Height) div 2);
    { Tree width }
    OptionsVirtualStringTree.Width := ReadInteger('OptionsSize', 'TreeWidth', OptionsVirtualStringTree.Width);
  finally
    Free;
  end;
end;

procedure TOptionsDialog.WriteIniFile;
begin
  if Windowstate = wsNormal then
  with TMemIniFile.Create(GetIniFilename) do
  try
    { Size }
    WriteInteger('OptionsSize', 'Width', Width);
    WriteInteger('OptionsSize', 'Height', Height);
    { Position }
    WriteInteger('OptionsPosition', 'Left', Left);
    WriteInteger('OptionsPosition', 'Top', Top);
    { Tree width }
    WriteInteger('OptionsSize', 'TreeWidth', OptionsVirtualStringTree.Width);
  finally
    UpdateFile;
    Free;
  end;
end;

procedure TOptionsDialog.FormCreate(Sender: TObject);
begin
  OptionsVirtualStringTree.NodeDataSize := SizeOf(TOptionsRec);
  FEditorOptionsFrame := TEditorOptionsFrame.Create(OptionsPanel);
  FEditorOptionsFrame.Parent := OptionsPanel;
  FEditorFontFrame := TEditorFontFrame.Create(OptionsPanel);
  FEditorFontFrame.Parent := OptionsPanel;
  FEditorLeftMarginFrame := TEditorLeftMarginFrame.Create(OptionsPanel);
  FEditorLeftMarginFrame.Parent := OptionsPanel;
  FEditorRightMarginFrame := TEditorRightMarginFrame.Create(OptionsPanel);
  FEditorRightMarginFrame.Parent := OptionsPanel;
  FEditorSearchFrame := TEditorSearchFrame.Create(OptionsPanel);
  FEditorSearchFrame.Parent := OptionsPanel;
  FEditorTabsFrame := TEditorTabsFrame.Create(OptionsPanel);
  FEditorTabsFrame.Parent := OptionsPanel;
  FEditorToolBarFrame := TEditorToolBarFrame.Create(OptionsPanel);
  FEditorToolBarFrame.Parent := OptionsPanel;
  FEditorCompletionProposalFrame := TEditorCompletionProposalFrame.Create(OptionsPanel);
  FEditorCompletionProposalFrame.Parent := OptionsPanel;
  FMainMenuFrame := TMainMenuFrame.Create(OptionsPanel);
  FMainMenuFrame.Parent := OptionsPanel;
  FOptionsOutputFrame := TOptionsOutputFrame.Create(OptionsPanel);
  FOptionsOutputFrame.Parent := OptionsPanel;
  FOutputTabsFrame := TOutputTabsFrame.Create(OptionsPanel);
  FOutputTabsFrame.Parent := OptionsPanel;
  FDBMSOutputFrame := TDBMSOutputFrame.Create(OptionsPanel);
  FDBMSOutputFrame.Parent := OptionsPanel;
  FOptionsSchemaBrowserFrame := TOptionsSchemaBrowserFrame.Create(OptionsPanel);
  FOptionsSchemaBrowserFrame.Parent := OptionsPanel;
  FObjectFrameFrame := TObjectFrameFrame.Create(OptionsPanel);
  FObjectFrameFrame.Parent := OptionsPanel;
  FDateFormatFrame := TDateFormatFrame.Create(OptionsPanel);
  FDateFormatFrame.Parent := OptionsPanel;
  FTimeFormatFrame := TTimeFormatFrame.Create(OptionsPanel);
  FTimeFormatFrame.Parent := OptionsPanel;
  FConnectionTabsFrame := TConnectionTabsFrame.Create(OptionsPanel);
  FConnectionTabsFrame.Parent := OptionsPanel;
  FOptionsCompareFrame := TOptionsCompareFrame.Create(OptionsPanel);
  FOptionsCompareFrame.Parent := OptionsPanel;
  FOptionsPrintFrame := TOptionsPrintFrame.Create(OptionsPanel);
  FOptionsPrintFrame.Parent := OptionsPanel;
  FStatusBarFrame := TStatusBarFrame.Create(OptionsPanel);
  FStatusBarFrame.Parent := OptionsPanel;
end;

end.
