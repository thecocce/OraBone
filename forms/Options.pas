unit Options;

interface

uses
  Winapi.Windows, Winapi.Messages, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, ComCtrls,
  CommCtrl, Registry, Vcl.ExtCtrls, Vcl.Buttons, Menus, SynEdit, SynEditHighlighter, BCDialogs.Dlg,
  SynEditMiscClasses, SynHighlighterWebData, SynEditKeyCmds, System.Classes, BCControls.PageControl,
  System.SysUtils, Vcl.ImgList, SynHighlighterWeb, Grids, JvExComCtrls, JvComCtrls, JvExControls, JvxSlider,
  ActnList, JvExButtons, JvBitBtn, ValEdit, Vcl.Themes, Ora, BCControls.Edit, JvExStdCtrls, JvEdit, JvCombobox,
  BCControls.ComboBox, VirtualTrees, Vcl.ActnMenus, OptionsEditorOptions, OptionsEditorFont, OptionsEditorMargin,
  OptionsEditorTabs, OptionsConnectionTabs, OptionsMainMenu, OptionsOutputTabs, OptionsDBMSOutput,
  OptionsSchemaBrowser, OptionsObjectFrame, OptionsDateFormat, OptionsTimeFormat, OptionsCompare, OptionsPrint,
  OptionsStatusBar, OptionsOutput, OptionsEditorToolBar, OptionsEditorCompletionProposal, System.Actions;

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
    ImageList: TImageList;
    OKButton: TButton;
    OKButtonAction: TAction;
    OptionsPanel: TPanel;
    OptionsVirtualStringTree: TVirtualStringTree;
    Panel1: TPanel;
    Panel2: TPanel;
    Separator1Panel: TPanel;
    Splitter: TSplitter;
    EditorAction: TAction;
    EditorFontAction: TAction;
    EditorMarginAction: TAction;
    EditorTabsAction: TAction;
    OutputAction: TAction;
    DBMSOutputAction: TAction;
    SchemaBrowserAction: TAction;
    ObjectFrameAction: TAction;
    ConnectionAction: TAction;
    ConnectionTabsAction: TAction;
    OutputTabsAction: TAction;
    CompareAction: TAction;
    MainMenuAction: TAction;
    DBSettingsAction: TAction;
    DateFormatAction: TAction;
    TimeFormatAction: TAction;
    StatusBarAction: TAction;
    EditorToolBarAction: TAction;
    EditorCompletionProposalAction: TAction;
    PrintAction: TAction;
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
  private
    FOptionsContainer: TOptionsContainer;
    FEditorOptionsFrame: TEditorOptionsFrame;
    FEditorFontFrame: TEditorFontFrame;
    FEditorMarginFrame: TEditorMarginFrame;
    FEditorTabsFrame: TEditorTabsFrame;
    FEditorToolBarFrame: TEditorToolBarFrame;
    FEditorCompletionProposalFrame: TEditorCompletionProposalFrame;
    FMainMenuFrame: TMainMenuFrame;
    FOptionsOutputFrame: TOptionsOutputFrame;
    FOutputTabsFrame: TOutputTabsFrame;
    FDBMSOutputFrame: TDBMSOutputFrame;
    FOptionsSchemaBrowserFrame: TOptionsSchemaBrowserFrame;
    FObjectFrameFrame: TObjectFrameFrame;
    FDateFormatFrame: TDateFormatFrame;
    FTimeFormatFrame: TTimeFormatFrame;
    FConnectionTabsFrame: TConnectionTabsFrame;
    FOptionsCompareFrame: TOptionsCompareFrame;
    FOptionsPrintFrame: TOptionsPrintFrame;
    FStatusBarFrame: TStatusBarFrame;
    procedure CreateTree;
    procedure GetData;
    procedure PutData;
    procedure SetVisibleFrame;
  public
    function Execute(OraSession: TOraSession; EditOptions: TOptionsContainer): Boolean;
  end;

  TOptionsContainer = class(TComponent)
  private
    FAnimationDuration: Integer;
    FAnimationStyle: TAnimationStyle;
    FAutoIndent: Boolean;
    FAutoSave: Boolean;
    FUndoAfterSave: Boolean;
    FColorBrightness: Integer;
    FConnectionCloseTabByDblClick: Boolean;
    FConnectionCloseTabByMiddleClick: Boolean;
    FConnectionMultiLine: Boolean;
    FConnectionDoubleBuffered: Boolean;
    FConnectionShowCloseButton: Boolean;
    FConnectionRightClickSelect: Boolean;
    FConnectionShowImage: Boolean;
    FCompletionProposalEnabled: Boolean;
    FCompletionProposalCaseSensitive: Boolean;
    FCompletionProposalShortcut: string;
    FDateFormat: string;
    FEditorCloseTabByDblClick: Boolean;
    FEditorCloseTabByMiddleClick: Boolean;
    FEditorMultiLine: Boolean;
    FEditorDoubleBuffered: Boolean;
    FEditorShowCloseButton: Boolean;
    FEditorRightClickSelect: Boolean;
    FEditorShowImage: Boolean;
    FEnableLineNumbers: Boolean;
    FEnableSelectionMode: Boolean;
    FEnableSpecialChars: Boolean;
    FEnableWordWrap: Boolean;
    FExtraLineSpacing: Integer;
    FFontName: string;
    FFontSize: Integer;
    FMarginAutoSize: Boolean;
    FMarginFontName: string;
    FMarginFontSize: Integer;
    FMarginRightMargin: Integer;
    FMarginVisible: Boolean;
    FMarginVisibleRightMargin: Boolean;
    FMarginWidth: Integer;
    FIgnoreBlanks: Boolean;
    FIgnoreCase: Boolean;
    FInsertCaret: TSynEditCaretType;
    FMainMenuFontName: string;
    FMainMenuFontSize: Integer;
    FMainMenuSystemFontName: string;
    FMainMenuSystemFontSize: Integer;
    FObjectFrameAlign: string;
    FObjectCreationAndModificationTimestamp: Boolean;
    FOutputCloseTabByDblClick: Boolean;
    FOutputCloseTabByMiddleClick: Boolean;
    FOutputShowTreeLines: Boolean;
    FOutputIndent: Integer;
    FOutputMultiLine: Boolean;
    FOutputDoubleBuffered: Boolean;
    FOutputShowCloseButton: Boolean;
    FOutputRightClickSelect: Boolean;
    FOutputShowImage: Boolean;
    FPersistentHotKeys: Boolean;
    FPollingInterval: Integer;
    FPrintDocumentName: Integer;
    FPrintPageNumber: Integer;
    FPrintPrintedBy: Integer;
    FPrintDateTime: Integer;
    FPrintShowHeaderLine: Boolean;
    FPrintShowFooterLine: Boolean;
    FPrintShowLineNumbers: Boolean;
    FPrintWordWrapLine: Boolean;
    FSchemaBrowserAlign: string;
    FSchemaBrowserShowTreeLines: Boolean;
    FSchemaBrowserIndent: Integer;
    FScrollPastEof: Boolean;
    FScrollPastEol: Boolean;
    FShadows: Boolean;
    FTabsToSpaces: Boolean;
    FSmartTabs: Boolean;
    FSmartTabDelete: Boolean;
    FTabWidth: Integer;
    FTimeFormat: string;
    FToolBarExecute: Boolean;
    FToolBarTransaction: Boolean;
    FToolBarDBMS: Boolean;
    FToolBarExplainPlan: Boolean;
    FToolBarStandard: Boolean;
    FToolBarPrint: Boolean;
    FToolBarIndent: Boolean;
    FToolBarSort: Boolean;
    FToolBarCase: Boolean;
    FToolBarCommand: Boolean;
    FToolBarSearch: Boolean;
    FToolBarMode: Boolean;
    FToolBarTools: Boolean;
    FTrimTrailingSpaces: Boolean;
    FTripleClickRowSelect: Boolean;
    FMainMenuUseSystemFont: Boolean;
    FStatusBarUseSystemFont: Boolean;
    FStatusBarFontName: string;
    FStatusBarFontSize: Integer;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure AssignTo(Dest: TPersistent); override;
  published
    property AnimationDuration: Integer read FAnimationDuration write FAnimationDuration;
    property AnimationStyle: TAnimationStyle read FAnimationStyle write FAnimationStyle;
    property AutoIndent: Boolean read FAutoIndent write FAutoIndent;
    property AutoSave: Boolean read FAutoSave write FAutoSave;
    property UndoAfterSave: Boolean read FUndoAfterSave write FUndoAfterSave;
    property ColorBrightness: Integer read FColorBrightness write FColorBrightness;
    property ConnectionCloseTabByDblClick: Boolean read FConnectionCloseTabByDblClick write FConnectionCloseTabByDblClick;
    property ConnectionCloseTabByMiddleClick: Boolean read FConnectionCloseTabByMiddleClick write FConnectionCloseTabByMiddleClick;
    property ConnectionMultiLine: Boolean read FConnectionMultiLine write FConnectionMultiLine;
    property ConnectionDoubleBuffered: Boolean read FConnectionDoubleBuffered write FConnectionDoubleBuffered;
    property ConnectionShowCloseButton: Boolean read FConnectionShowCloseButton write FConnectionShowCloseButton;
    property ConnectionRightClickSelect: Boolean read FConnectionRightClickSelect write FConnectionRightClickSelect;
    property ConnectionShowImage: Boolean read FConnectionShowImage write FConnectionShowImage;
    property CompletionProposalEnabled: Boolean read FCompletionProposalEnabled write FCompletionProposalEnabled;
    property CompletionProposalCaseSensitive: Boolean read FCompletionProposalCaseSensitive write FCompletionProposalCaseSensitive;
    property CompletionProposalShortcut: string read FCompletionProposalShortcut write FCompletionProposalShortcut;
    property DateFormat: string read FDateFormat write FDateFormat;
    property EditorCloseTabByDblClick: Boolean read FEditorCloseTabByDblClick write FEditorCloseTabByDblClick;
    property EditorCloseTabByMiddleClick: Boolean read FEditorCloseTabByMiddleClick write FEditorCloseTabByMiddleClick;
    property EditorMultiLine: Boolean read FEditorMultiLine write FEditorMultiLine;
    property EditorDoubleBuffered: Boolean read FEditorDoubleBuffered write FEditorDoubleBuffered;
    property EditorShowCloseButton: Boolean read FEditorShowCloseButton write FEditorShowCloseButton;
    property EditorRightClickSelect: Boolean read FEditorRightClickSelect write FEditorRightClickSelect;
    property EditorShowImage: Boolean read FEditorShowImage write FEditorShowImage;
    property EnableLineNumbers: Boolean read FEnableLineNumbers write FEnableLineNumbers;
    property EnableSelectionMode: Boolean read FEnableSelectionMode write FEnableSelectionMode;
    property EnableSpecialChars: Boolean read FEnableSpecialChars write FEnableSpecialChars;
    property EnableWordWrap: Boolean read FEnableWordWrap write FEnableWordWrap;
    property ExtraLineSpacing: Integer read FExtraLineSpacing write FExtraLineSpacing;
    property FontName: string read FFontName write FFontName;
    property FontSize: Integer read FFontSize write FFontSize;
    property MarginAutoSize: Boolean read FMarginAutoSize write FMarginAutoSize;
    property MarginFontName: string read FMarginFontName write FMarginFontName;
    property MarginFontSize: Integer read FMarginFontSize write FMarginFontSize;
    property MarginRightMargin: Integer read FMarginRightMargin write FMarginRightMargin;
    property MarginVisible: Boolean read FMarginVisible write FMarginVisible;
    property MarginVisibleRightMargin: Boolean read FMarginVisibleRightMargin write FMarginVisibleRightMargin;
    property MarginWidth: Integer read FMarginWidth write FMarginWidth;
    property IgnoreBlanks: Boolean read FIgnoreBlanks write FIgnoreBlanks;
    property IgnoreCase: Boolean read FIgnoreCase write FIgnoreCase;
    property InsertCaret: TSynEditCaretType read FInsertCaret write FInsertCaret;
    property MainMenuFontName: string read FMainMenuFontName write FMainMenuFontName;
    property MainMenuFontSize: Integer read FMainMenuFontSize write FMainMenuFontSize;
    property MainMenuSystemFontName: string read FMainMenuSystemFontName write FMainMenuSystemFontName;
    property MainMenuSystemFontSize: Integer read FMainMenuSystemFontSize write FMainMenuSystemFontSize;
    property ObjectFrameAlign: string read FObjectFrameAlign write FObjectFrameAlign;
    property ObjectCreationAndModificationTimestamp: Boolean read FObjectCreationAndModificationTimestamp write FObjectCreationAndModificationTimestamp;
    property OutputCloseTabByDblClick: Boolean read FOutputCloseTabByDblClick write FOutputCloseTabByDblClick;
    property OutputCloseTabByMiddleClick: Boolean read FOutputCloseTabByMiddleClick write FOutputCloseTabByMiddleClick;
    property OutputShowTreeLines: Boolean read FOutputShowTreeLines write FOutputShowTreeLines;
    property OutputIndent: Integer read FOutputIndent write FOutputIndent;
    property OutputMultiLine: Boolean read FOutputMultiLine write FOutputMultiLine;
    property OutputDoubleBuffered: Boolean read FOutputDoubleBuffered write FOutputDoubleBuffered;
    property OutputShowCloseButton: Boolean read FOutputShowCloseButton write FOutputShowCloseButton;
    property OutputRightClickSelect: Boolean read FOutputRightClickSelect write FOutputRightClickSelect;
    property OutputShowImage: Boolean read FOutputShowImage write FOutputShowImage;
    property PersistentHotKeys: Boolean read FPersistentHotKeys write FPersistentHotKeys;
    property PollingInterval: Integer read FPollingInterval write FPollingInterval;
    property PrintDocumentName: Integer read FPrintDocumentName write FPrintDocumentName;
    property PrintPageNumber: Integer read FPrintPageNumber write FPrintPageNumber;
    property PrintPrintedBy: Integer read FPrintPrintedBy write FPrintPrintedBy;
    property PrintDateTime: Integer read FPrintDateTime write FPrintDateTime;
    property PrintShowHeaderLine: Boolean read FPrintShowHeaderLine write FPrintShowHeaderLine;
    property PrintShowFooterLine: Boolean read FPrintShowFooterLine write FPrintShowFooterLine;
    property PrintShowLineNumbers: Boolean read FPrintShowLineNumbers write FPrintShowLineNumbers;
    property PrintWordWrapLine: Boolean read FPrintWordWrapLine write FPrintWordWrapLine;
    property SchemaBrowserAlign: string read FSchemaBrowserAlign write FSchemaBrowserAlign;
    property SchemaBrowserShowTreeLines: Boolean read FSchemaBrowserShowTreeLines write FSchemaBrowserShowTreeLines;
    property SchemaBrowserIndent: Integer read FSchemaBrowserIndent write FSchemaBrowserIndent;
    property ScrollPastEof: Boolean read FScrollPastEof write FScrollPastEof;
    property ScrollPastEol: Boolean read FScrollPastEol write FScrollPastEol;
    property Shadows: Boolean read FShadows write FShadows;
    property TabsToSpaces: Boolean read FTabsToSpaces write FTabsToSpaces;
    property SmartTabs: Boolean read FSmartTabs write FSmartTabs;
    property SmartTabDelete: Boolean read FSmartTabDelete write FSmartTabDelete;
    property TabWidth: Integer read FTabWidth write FTabWidth;
    property TimeFormat: string read FTimeFormat write FTimeFormat;
    property ToolBarExecute: Boolean read FToolBarExecute write FToolBarExecute;
    property ToolBarTransaction: Boolean read FToolBarTransaction write FToolBarTransaction;
    property ToolBarDBMS: Boolean read FToolBarDBMS write FToolBarDBMS;
    property ToolBarExplainPlan: Boolean read FToolBarExplainPlan write FToolBarExplainPlan;
    property ToolBarStandard: Boolean read FToolBarStandard write FToolBarStandard;
    property ToolBarPrint: Boolean read FToolBarPrint write FToolBarPrint;
    property ToolBarIndent: Boolean read FToolBarIndent write FToolBarIndent;
    property ToolBarSort: Boolean read FToolBarSort write FToolBarSort;
    property ToolBarCase: Boolean read FToolBarCase write FToolBarCase;
    property ToolBarCommand: Boolean read FToolBarCommand write FToolBarCommand;
    property ToolBarSearch: Boolean read FToolBarSearch write FToolBarSearch;
    property ToolBarMode: Boolean read FToolBarMode write FToolBarMode;
    property ToolBarTools: Boolean read FToolBarTools write FToolBarTools;
    property TrimTrailingSpaces: Boolean read FTrimTrailingSpaces write FTrimTrailingSpaces;
    property TripleClickRowSelect: Boolean read FTripleClickRowSelect write FTripleClickRowSelect;
    property MainMenuUseSystemFont: Boolean read FMainMenuUseSystemFont write FMainMenuUseSystemFont;
    property StatusBarUseSystemFont: Boolean read FStatusBarUseSystemFont write FStatusBarUseSystemFont;
    property StatusBarFontName: string read FStatusBarFontName write FStatusBarFontName;
    property StatusBarFontSize: Integer read FStatusBarFontSize write FStatusBarFontSize;
  end;

function OptionsDialog: TOptionsDialog;
function OptionsContainer: TOptionsContainer;

implementation

{$R *.dfm}

uses
  System.Math, Winapi.UxTheme, DataModule, BCCommon.StyleUtils, SynEditTypes, SynCompletionProposal, BCCommon.Messages;

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
    TCustomSynEdit(Dest).Gutter.Visible := FMarginVisible;
    TCustomSynEdit(Dest).Gutter.Font.Name := FMarginFontName;
    TCustomSynEdit(Dest).Gutter.Font.Size := FMarginFontSize;
    TCustomSynEdit(Dest).ExtraLineSpacing := FExtraLineSpacing;
    if FMarginVisibleRightMargin then
      TCustomSynEdit(Dest).RightEdge := FMarginRightMargin
    else
      TCustomSynEdit(Dest).RightEdge := 0;
    TCustomSynEdit(Dest).Gutter.AutoSize := FMarginAutoSize;
    TCustomSynEdit(Dest).Gutter.Width := FMarginWidth;
    TCustomSynEdit(Dest).TabWidth := FTabWidth;
    TCustomSynEdit(Dest).InsertCaret := FInsertCaret;
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

    TCustomSynEdit(Dest).WordWrap := FEnableWordWrap;
    TCustomSynEdit(Dest).Gutter.ShowLineNumbers := FEnableLineNumbers;

    if FEnableSpecialChars then
      TCustomSynEdit(Dest).Options := TCustomSynEdit(Dest).Options + [eoShowSpecialChars]
    else
      TCustomSynEdit(Dest).Options := TCustomSynEdit(Dest).Options - [eoShowSpecialChars];

    if FEnableSelectionMode then
      TCustomSynEdit(Dest).SelectionMode := smColumn
    else
      TCustomSynEdit(Dest).SelectionMode := smNormal;
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
  inherited;
  FAnimationDuration := 150;
  FAnimationStyle := asDefault;
  FAutoIndent := True;
  FAutoSave := False;
  FCompletionProposalCaseSensitive := True;
  FCompletionProposalEnabled := True;
  FCompletionProposalShortcut := 'Ctrl+Space';
  FConnectionCloseTabByDblClick := False;
  FConnectionCloseTabByMiddleClick := False;
  FConnectionDoubleBuffered := True;
  FConnectionMultiLine := False;
  FConnectionRightClickSelect := True;
  FConnectionShowCloseButton := False;
  FConnectionShowImage := True;
  FDateFormat := 'DD.MM.YYYY';
  FEditorCloseTabByDblClick := False;
  FEditorCloseTabByMiddleClick := False;
  FEditorDoubleBuffered := True;
  FEditorMultiLine := False;
  FEditorRightClickSelect := True;
  FEditorShowCloseButton := False;
  FEditorShowImage := True;
  FExtraLineSpacing := 0;
  FFontName := 'Courier New';
  FFontSize := 9;
  FIgnoreBlanks := True;
  FIgnoreCase := True;
  FInsertCaret := ctVerticalLine;
  FMainMenuFontName := 'Tahoma';
  FMainMenuFontSize := 8;
  FMainMenuSystemFontName := Screen.MenuFont.Name;
  FMainMenuSystemFontSize := Screen.MenuFont.Size;
  FMainMenuUseSystemFont := False;
  FMarginAutoSize := True;
  FMarginFontName := 'Courier New';
  FMarginFontSize := 8;
  FMarginRightMargin := 80;
  FMarginWidth := 48;
  FMarginVisible := True;
  FMarginVisibleRightMargin := True;
  FObjectCreationAndModificationTimestamp := False;
  FObjectFrameAlign := 'Bottom';
  FOutputCloseTabByDblClick := False;
  FOutputCloseTabByMiddleClick := False;
  FOutputDoubleBuffered := True;
  FOutputIndent := 16;
  FOutputMultiLine := False;
  FOutputRightClickSelect := True;
  FOutputShowCloseButton := False;
  FOutputShowImage := True;
  FOutputShowTreeLines := False;
  FPersistentHotKeys := False;
  FPollingInterval := 1;
  FPrintDateTime := 1;
  FPrintDocumentName := 2;
  FPrintPageNumber := 3;
  FPrintPrintedBy := 0;
  FPrintShowFooterLine := True;
  FPrintShowHeaderLine := True;
  FPrintShowLineNumbers := False;
  FPrintWordWrapLine := False;
  FSchemaBrowserAlign := 'Bottom';
  FSchemaBrowserIndent := 16;
  FSchemaBrowserShowTreeLines := False;
  FScrollPastEof := False;
  FScrollPastEol := True;
  FShadows := True;
  FSmartTabDelete := False;
  FSmartTabs := False;
  FStatusBarFontName := 'Tahoma';
  FStatusBarFontSize := 8;
  FStatusBarUseSystemFont := False;
  FTabsToSpaces := True;
  FTabWidth := 8;
  FTimeFormat := 'HH24:MI:SS';
  FToolBarCase := True;
  FToolBarCommand := True;
  FToolBarDBMS := True;
  FToolBarExecute := True;
  FToolBarExplainPlan := True;
  FToolBarIndent := True;
  FToolBarMode := True;
  FToolBarPrint := True;
  FToolBarSearch := True;
  FToolBarSort := True;
  FToolBarStandard := True;
  FToolBarTools := True;
  FToolBarTransaction := True;
  FTrimTrailingSpaces := True;
  FTripleClickRowSelect := True;
  FUndoAfterSave := False;
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
  FEditorMarginFrame.Free;
  FEditorTabsFrame.Free;
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
    { Margin }
    ChildNode := AddChild(Node);
    Data := GetNodeData(ChildNode);
    Data.ImageIndex := EditorMarginAction.ImageIndex;
    Data.Caption := EditorMarginAction.Caption;
    { Tabs }
    ChildNode := AddChild(Node);
    Data := GetNodeData(ChildNode);
    Data.ImageIndex := EditorTabsAction.ImageIndex;
    Data.Caption := EditorTabsAction.Caption;
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
    Node.ChildCount := 4;
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
  FEditorOptionsFrame.UndoAfterSaveCheckBox.Checked := FOptionsContainer.UndoAfterSave;
  FEditorOptionsFrame.TrimTrailingSpacesCheckBox.Checked := FOptionsContainer.TrimTrailingSpaces;
  FEditorOptionsFrame.TripleClickRowSelectCheckBox.Checked := FOptionsContainer.TripleClickRowSelect;
  FEditorOptionsFrame.ScrollPastEofCheckBox.Checked := FOptionsContainer.ScrollPastEof;
  FEditorOptionsFrame.ScrollPastEolCheckBox.Checked := FOptionsContainer.ScrollPastEol;
  FEditorOptionsFrame.TabsToSpacesCheckBox.Checked := FOptionsContainer.TabsToSpaces;
  FEditorOptionsFrame.SmartTabsCheckBox.Checked := FOptionsContainer.SmartTabs;
  FEditorOptionsFrame.SmartTabDeleteCheckBox.Checked := FOptionsContainer.SmartTabDelete;
  FEditorOptionsFrame.ExtraLinesEdit.Text := IntToStr(FOptionsContainer.ExtraLineSpacing);
  FEditorOptionsFrame.TabWidthEdit.Text := IntToStr(FOptionsContainer.TabWidth);
  FEditorOptionsFrame.BrightnessTrackBar.Position := FOptionsContainer.ColorBrightness;
  FEditorOptionsFrame.InsertCaretComboBox.ItemIndex := Ord(FOptionsContainer.InsertCaret);
  { Font }
  FEditorFontFrame.EditorFontLabel.Font.Name := FOptionsContainer.FontName;
  FEditorFontFrame.EditorFontLabel.Font.Size := FOptionsContainer.FontSize;
  FEditorFontFrame.EditorFontLabel.Caption := Format('%s %dpt', [FEditorFontFrame.EditorFontLabel.Font.Name, FEditorFontFrame.EditorFontLabel.Font.Size]);
  FEditorFontFrame.SynEdit.Text := FEditorFontFrame.EditorFontLabel.Caption;
  FEditorFontFrame.MarginFontLabel.Font.Name := FOptionsContainer.MarginFontName;
  FEditorFontFrame.MarginFontLabel.Font.Size := FOptionsContainer.MarginFontSize;
  FEditorFontFrame.MarginFontLabel.Caption := Format('%s %dpt', [FEditorFontFrame.MarginFontLabel.Font.Name, FEditorFontFrame.MarginFontLabel.Font.Size]);
  { Margin }
  FEditorMarginFrame.AutoSizeCheckBox.Checked := FOptionsContainer.MarginAutoSize;
  FEditorMarginFrame.MarginVisibleCheckBox.Checked := FOptionsContainer.MarginVisible;
  FEditorMarginFrame.VisibleRightMarginCheckBox.Checked := FOptionsContainer.MarginVisibleRightMargin;
  FEditorMarginFrame.RightMarginEdit.Text := IntToStr(FOptionsContainer.MarginRightMargin);
  FEditorMarginFrame.WidthEdit.Text := IntToStr(FOptionsContainer.MarginWidth);
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
  FObjectFrameFrame.ShowCreationAndModificationTimestampCheckBox.Checked := FOptionsContainer.ObjectCreationAndModificationTimestamp;
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
      BCCommon.StyleUtils.UpdateMarginAndColors(FEditorFontFrame.SynEdit);
    end;
    FEditorMarginFrame.Visible := (ParentIndex = 0) and (Level = 1) and (TreeNode.Index = 1);
    FEditorTabsFrame.Visible := (ParentIndex = 0) and (Level = 1) and (TreeNode.Index = 2);
    FEditorCompletionProposalFrame.Visible := (ParentIndex = 0) and (Level = 1) and (TreeNode.Index = 3);
    FEditorToolBarFrame.Visible := (ParentIndex = 0) and (Level = 1) and (TreeNode.Index = 4);

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
  FOptionsContainer.UndoAfterSave := FEditorOptionsFrame.UndoAfterSaveCheckBox.Checked;
  FOptionsContainer.TrimTrailingSpaces := FEditorOptionsFrame.TrimTrailingSpacesCheckBox.Checked;
  FOptionsContainer.TripleClickRowSelect := FEditorOptionsFrame.TripleClickRowSelectCheckBox.Checked;
  FOptionsContainer.ScrollPastEof := FEditorOptionsFrame.ScrollPastEofCheckBox.Checked;
  FOptionsContainer.ScrollPastEol := FEditorOptionsFrame.ScrollPastEolCheckBox.Checked;
  FOptionsContainer.TabsToSpaces := FEditorOptionsFrame.TabsToSpacesCheckBox.Checked;
  FOptionsContainer.SmartTabs := FEditorOptionsFrame.SmartTabsCheckBox.Checked;
  FOptionsContainer.SmartTabDelete := FEditorOptionsFrame.SmartTabDeleteCheckBox.Checked;
  FOptionsContainer.ExtraLineSpacing := StrToIntDef(FEditorOptionsFrame.ExtraLinesEdit.Text, 0);
  FOptionsContainer.TabWidth := StrToIntDef(FEditorOptionsFrame.TabWidthEdit.Text, 8);
  FOptionsContainer.ColorBrightness := FEditorOptionsFrame.BrightnessTrackBar.Position;
  FOptionsContainer.InsertCaret := TSynEditCaretType(FEditorOptionsFrame.InsertCaretComboBox.ItemIndex);
  { Font }
  FOptionsContainer.FontName := FEditorFontFrame.EditorFontLabel.Font.Name;
  FOptionsContainer.FontSize := FEditorFontFrame.EditorFontLabel.Font.Size;
  FOptionsContainer.MarginFontName := FEditorFontFrame.MarginFontLabel.Font.Name;
  FOptionsContainer.MarginFontSize := FEditorFontFrame.MarginFontLabel.Font.Size;
  { Margin }
  FOptionsContainer.MarginAutoSize := FEditorMarginFrame.AutoSizeCheckBox.Checked;
  FOptionsContainer.MarginVisible := FEditorMarginFrame.MarginVisibleCheckBox.Checked;
  FOptionsContainer.MarginRightMargin := StrToIntDef(FEditorMarginFrame.RightMarginEdit.Text, 80);
  FOptionsContainer.MarginVisibleRightMargin := FEditorMarginFrame.VisibleRightMarginCheckBox.Checked;
  FOptionsContainer.MarginWidth := StrToIntDef(FEditorMarginFrame.WidthEdit.Text, 48);
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
  FOptionsContainer.ObjectCreationAndModificationTimestamp := FObjectFrameFrame.ShowCreationAndModificationTimestampCheckBox.Checked;
  { Status bar }
  FOptionsContainer.StatusBarUseSystemFont := FStatusBarFrame.UseSystemFontCheckBox.Checked;
  FOptionsContainer.StatusBarFontName := FStatusBarFrame.FontLabel.Font.Name;
  FOptionsContainer.StatusBarFontSize := FStatusBarFrame.FontLabel.Font.Size;
end;

procedure TOptionsDialog.FormCreate(Sender: TObject);
begin
  OptionsVirtualStringTree.NodeDataSize := SizeOf(TOptionsRec);
  FEditorOptionsFrame := TEditorOptionsFrame.Create(OptionsPanel);
  FEditorOptionsFrame.Parent := OptionsPanel;
  FEditorFontFrame := TEditorFontFrame.Create(OptionsPanel);
  FEditorFontFrame.Parent := OptionsPanel;
  FEditorMarginFrame := TEditorMarginFrame.Create(OptionsPanel);
  FEditorMarginFrame.Parent := OptionsPanel;
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
