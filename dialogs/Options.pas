unit Options;

interface

uses
  Winapi.Windows, Winapi.Messages, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, ComCtrls,
  CommCtrl, Registry, Vcl.ExtCtrls, Vcl.Buttons, Menus, SynEdit, SynEditHighlighter, Dlg,
  SynEditMiscClasses, SynHighlighterWebData, SynEditKeyCmds, System.Classes, BCPageControl,
  System.SysUtils, Vcl.ImgList, SynHighlighterWeb, Grids, JvExComCtrls, JvComCtrls, JvExControls, JvxSlider,
  ActnList, JvExButtons, JvBitBtn, ValEdit, Vcl.Themes, Ora, BCEdit, JvExStdCtrls, JvEdit, JvCombobox,
  BCComboBox, VirtualTrees, Vcl.ActnMenus, OptionsEditorOptions, OptionsEditorFont, OptionsEditorGutter,
  OptionsEditorTabs, OptionsConnectionTabs, OptionsMainMenu, OptionsOutputTabs, OptionsDBMSOutput,
  OptionsSchemaBrowser, OptionsObjectFrame, OptionsDateFormat, OptionsTimeFormat, OptionsCompare;

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
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure OKButtonActionExecute(Sender: TObject);
  private
    FOptionsContainer: TOptionsContainer;
    FEditorOptionsFrame: TEditorOptionsFrame;
    FEditorFontFrame: TEditorFontFrame;
    FEditorGutterFrame: TEditorGutterFrame;
    FEditorTabsFrame: TEditorTabsFrame;
    FMainMenuFrame: TMainMenuFrame;
    FOutputTabsFrame: TOutputTabsFrame;
    FDBMSOutputFrame: TDBMSOutputFrame;
    FOptionsSchemaBrowserFrame: TOptionsSchemaBrowserFrame;
    FObjectFrameFrame: TObjectFrameFrame;
    FDateFormatFrame: TDateFormatFrame;
    FTimeFormatFrame: TTimeFormatFrame;
    FConnectionTabsFrame: TConnectionTabsFrame;
    FOptionsCompareFrame: TOptionsCompareFrame;
    procedure GetData;
    procedure PutData;
  public
    function Execute(OraSession: TOraSession; EditOptions: TOptionsContainer): Boolean;
  end;

  TOptionsContainer = class(TComponent)
  private
    FAnimationDuration: Integer;
    FAnimationStyle: TAnimationStyle;
    FAutoIndent: Boolean;
    FColorBrightness: Integer;
    FConnectionMultiLine: Boolean;
    FConnectionShowCloseButton: Boolean;
    FDateFormat: string;
    FEditorMultiLine: Boolean;
    FEditorShowCloseButton: Boolean;
    FEnableLineNumbers: Boolean;
    FEnableSelectionMode: Boolean;
    FEnableSpecialChars: Boolean;
    FEnableWordWrap: Boolean;
    FExtraLineSpacing: Integer;
    FFontName: string;
    FFontSize: Integer;
    FGutterFontName: string;
    FGutterFontSize: Integer;
    FGutterLineNumbers: Boolean;
    FGutterVisible: Boolean;
    FIgnoreBlanks: Boolean;
    FIgnoreCase: Boolean;
    FMainMenuFontName: string;
    FMainMenuFontSize: Integer;
    FObjectFrameAlign: string;
    FOutputMultiLine: Boolean;
    FOutputShowCloseButton: Boolean;
    FPersistentHotKeys: Boolean;
    FPollingInterval: Integer;
    FRightMargin: Integer;
    FSchemaBrowserAlign: string;
    FScrollPastEof: Boolean;
    FScrollPastEol: Boolean;
    FShadows: Boolean;
    FTabsToSpaces: Boolean;
    FTabWidth: Integer;
    FTimeFormat: string;
    FTrimTrailingSpaces: Boolean;
    FUseSystemFont: Boolean;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure AssignTo(Dest: TPersistent); override;
  published
    property AnimationDuration: Integer read FAnimationDuration write FAnimationDuration;
    property AnimationStyle: TAnimationStyle read FAnimationStyle write FAnimationStyle;
    property AutoIndent: Boolean read FAutoIndent write FAutoIndent;
    property ColorBrightness: Integer read FColorBrightness write FColorBrightness;
    property ConnectionMultiLine: Boolean read FConnectionMultiLine write FConnectionMultiLine;
    property ConnectionShowCloseButton: Boolean read FConnectionShowCloseButton write FConnectionShowCloseButton;
    property DateFormat: string read FDateFormat write FDateFormat;
    property EditorMultiLine: Boolean read FEditorMultiLine write FEditorMultiLine;
    property EditorShowCloseButton: Boolean read FEditorShowCloseButton write FEditorShowCloseButton;
    property EnableLineNumbers: Boolean read FEnableLineNumbers write FEnableLineNumbers;
    property EnableSelectionMode: Boolean read FEnableSelectionMode write FEnableSelectionMode;
    property EnableSpecialChars: Boolean read FEnableSpecialChars write FEnableSpecialChars;
    property EnableWordWrap: Boolean read FEnableWordWrap write FEnableWordWrap;
    property ExtraLineSpacing: Integer read FExtraLineSpacing write FExtraLineSpacing;
    property FontName: string read FFontName write FFontName;
    property FontSize: Integer read FFontSize write FFontSize;
    property GutterFontName: string read FGutterFontName write FGutterFontName;
    property GutterFontSize: Integer read FGutterFontSize write FGutterFontSize;
    property GutterLineNumbers: Boolean read FGutterVisible write FGutterLineNumbers;
    property GutterVisible: Boolean read FGutterVisible write FGutterVisible;
    property IgnoreBlanks: Boolean read FIgnoreBlanks write FIgnoreBlanks;
    property IgnoreCase: Boolean read FIgnoreCase write FIgnoreCase;
    property MainMenuFontName: string read FMainMenuFontName write FMainMenuFontName;
    property MainMenuFontSize: Integer read FMainMenuFontSize write FMainMenuFontSize;
    property ObjectFrameAlign: string read FObjectFrameAlign write FObjectFrameAlign;
    property OutputMultiLine: Boolean read FOutputMultiLine write FOutputMultiLine;
    property OutputShowCloseButton: Boolean read FOutputShowCloseButton write FOutputShowCloseButton;
    property PersistentHotKeys: Boolean read FPersistentHotKeys write FPersistentHotKeys;
    property PollingInterval: Integer read FPollingInterval write FPollingInterval;
    property RightMargin: Integer read FRightMargin write FRightMargin;
    property SchemaBrowserAlign: string read FSchemaBrowserAlign write FSchemaBrowserAlign;
    property ScrollPastEof: Boolean read FScrollPastEof write FScrollPastEof;
    property ScrollPastEol: Boolean read FScrollPastEol write FScrollPastEol;
    property Shadows: Boolean read FShadows write FShadows;
    property TabsToSpaces: Boolean read FTabsToSpaces write FTabsToSpaces;
    property TabWidth: Integer read FTabWidth write FTabWidth;
    property TimeFormat: string read FTimeFormat write FTimeFormat;
    property TrimTrailingSpaces: Boolean read FTrimTrailingSpaces write FTrimTrailingSpaces;
    property UseSystemFont: Boolean read FUseSystemFont write FUseSystemFont;
  end;

function OptionsDialog: TOptionsDialog;
function OptionsContainer: TOptionsContainer;

implementation

{$R *.dfm}

uses
  Common, Math, UxTheme, DataModule, StyleHooks, SynEditTypes;

const
  CELL_PADDING = 4;

{ TOptionsContainer }

var
  FOptionsContainer: TOptionsContainer;
  FOptionsDialog: TOptionsDialog;

function OptionsContainer: TOptionsContainer;
begin
  if FOptionsContainer = nil then
    FOptionsContainer := TOptionsContainer.Create(nil);
  Result := FOptionsContainer;
end;

procedure TOptionsContainer.AssignTo(Dest: TPersistent);
begin
  if Assigned(Dest) and (Dest is TCustomSynEdit) then
  begin
    TCustomSynEdit(Dest).Font.Name := FFontName;
    TCustomSynEdit(Dest).Font.Size := FFontSize;
    TCustomSynEdit(Dest).Gutter.Visible := FGutterVisible;
    TCustomSynEdit(Dest).Gutter.ShowLineNumbers := FGutterLineNumbers;
    TCustomSynEdit(Dest).Gutter.Font.Name := FGutterFontName;
    TCustomSynEdit(Dest).Gutter.Font.Size := FGutterFontSize;
    TCustomSynEdit(Dest).ExtraLineSpacing := FExtraLineSpacing;
    TCustomSynEdit(Dest).RightEdge := FRightMargin;
    TCustomSynEdit(Dest).TabWidth := FTabWidth;
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
    if FTrimTrailingSpaces then
      TCustomSynEdit(Dest).Options := TCustomSynEdit(Dest).Options + [eoTrimTrailingSpaces]
    else
      TCustomSynEdit(Dest).Options := TCustomSynEdit(Dest).Options - [eoTrimTrailingSpaces];


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
    TActionMainMenuBar(Dest).UseSystemFont := FUseSystemFont;
    Screen.MenuFont.Name := FMainMenuFontName;
    Screen.MenuFont.Size := FMainMenuFontSize;
    TActionMainMenuBar(Dest).AnimationStyle := FAnimationStyle;
    TActionMainMenuBar(Dest).AnimateDuration := FAnimationDuration;
  end
  else
    inherited;
end;

constructor TOptionsContainer.Create(AOwner: TComponent);
begin
  inherited;
  FGutterVisible := True;
  FGutterLineNumbers := True;
  FEditorMultiLine := False;
  FFontName := 'Courier New';
  FFontSize := 10;
  FExtraLineSpacing := 0;
  FTabWidth := 8;
  FPollingInterval := 1;
  FDateFormat := 'DD.MM.YYYY';
  FTimeFormat := 'HH24:MI:SS';
  FSchemaBrowserAlign := 'Bottom';
  FObjectFrameAlign := 'Bottom';
  FIgnoreCase := True;
  FIgnoreBlanks := True;
  FAutoIndent := True;
  FTrimTrailingSpaces := True;
  FScrollPastEof := False;
  FScrollPastEol := True;
  FTabsToSpaces := True;
  FGutterVisible := True;
  FGutterLineNumbers := True;
  FEditorMultiLine := False;
  FEditorShowCloseButton := False;
  FConnectionMultiLine := False;
  FConnectionShowCloseButton := False;
  FOutputMultiLine := False;
  FOutputShowCloseButton := False;
  FIgnoreCase := True;
  FIgnoreBlanks := True;
  FFontName := 'Courier New';
  FFontSize := 10;
  FGutterFontName := 'Courier New';
  FGutterFontSize := 8;
  FExtraLineSpacing := 0;
  FRightMargin := 80;
  FTabWidth := 8;
  FPersistentHotKeys := False;
  FShadows := True;
  FUseSystemFont := False;
  FMainMenuFontName := 'Tahoma';
  FMainMenuFontSize := 8;
  FAnimationStyle := asDefault;
  FAnimationDuration := 150;
end;

destructor TOptionsContainer.Destroy;
begin
  FOptionsContainer := nil;
  inherited;
end;

{ TOptionsDialog }

function OptionsDialog: TOptionsDialog;
begin
  if FOptionsDialog = nil then
    Application.CreateForm(TOptionsDialog, FOptionsDialog);
  Result := FOptionsDialog;
  StyleHooks.SetStyledFormSize(Result);
end;

procedure TOptionsDialog.FormDestroy(Sender: TObject);
begin
  FEditorOptionsFrame.Destroy;
  FEditorFontFrame.Destroy;
  FEditorGutterFrame.Destroy;
  FEditorTabsFrame.Destroy;
  FMainMenuFrame.Destroy;
  FOutputTabsFrame.Destroy;
  FDBMSOutputFrame.Destroy;
  FOptionsSchemaBrowserFrame.Destroy;
  FObjectFrameFrame.Destroy;
  FDateFormatFrame.Destroy;
  FTimeFormatFrame.Destroy;
  FConnectionTabsFrame.Destroy;
  FOptionsCompareFrame.Destroy;

  FOptionsDialog := nil;
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
  FEditorOptionsFrame.TrimTrailingSpacesCheckBox.Checked := FOptionsContainer.TrimTrailingSpaces;
  FEditorOptionsFrame.ScrollPastEofCheckBox.Checked := FOptionsContainer.ScrollPastEof;
  FEditorOptionsFrame.ScrollPastEolCheckBox.Checked := FOptionsContainer.ScrollPastEol;
  FEditorOptionsFrame.TabsToSpacesCheckBox.Checked := FOptionsContainer.TabsToSpaces;
  FEditorOptionsFrame.ExtraLinesEdit.Text := IntToStr(FOptionsContainer.ExtraLineSpacing);
  FEditorOptionsFrame.TabWidthEdit.Text := IntToStr(FOptionsContainer.TabWidth);
  FEditorOptionsFrame.BrightnessTrackBar.Position := FOptionsContainer.ColorBrightness;
  { Font }
  FEditorFontFrame.FontLabel.Font.Name := FOptionsContainer.FontName;
  FEditorFontFrame.FontLabel.Font.Size := FOptionsContainer.FontSize;
  FEditorFontFrame.FontLabel.Caption := Format('%s %dpt', [FEditorFontFrame.FontLabel.Font.Name, FEditorFontFrame.FontLabel.Font.Size]);
  { Gutter }
  FEditorGutterFrame.GutterVisibleCheckBox.Checked := FOptionsContainer.GutterVisible;
  FEditorGutterFrame.LineNumbersCheckBox.Checked := FOptionsContainer.GutterLineNumbers;
  FEditorGutterFrame.RightMarginEdit.Text := IntToStr(FOptionsContainer.RightMargin);
  FEditorGutterFrame.FontLabel.Font.Name := FOptionsContainer.GutterFontName;
  FEditorGutterFrame.FontLabel.Font.Size := FOptionsContainer.GutterFontSize;
  FEditorGutterFrame.FontLabel.Caption := Format('%s %dpt', [FEditorGutterFrame.FontLabel.Font.Name, FEditorGutterFrame.FontLabel.Font.Size]);
  { Document tabs }
  FEditorTabsFrame.MultiLineCheckBox.Checked := FOptionsContainer.EditorMultiLine;
  FEditorTabsFrame.ShowCloseButtonCheckBox.Checked := FOptionsContainer.EditorShowCloseButton;
  { Connection tabs }
  FConnectionTabsFrame.MultiLineCheckBox.Checked := FOptionsContainer.ConnectionMultiLine;
  FConnectionTabsFrame.ShowCloseButtonCheckBox.Checked := FOptionsContainer.ConnectionShowCloseButton;
  { Output tabs }
  FOutputTabsFrame.MultiLineCheckBox.Checked := FOptionsContainer.OutputMultiLine;
  FOutputTabsFrame.ShowCloseButtonCheckBox.Checked := FOptionsContainer.OutputShowCloseButton;
  { Compare }
  FOptionsCompareFrame.IgnoreCaseCheckBox.Checked := FOptionsContainer.IgnoreCase;
  FOptionsCompareFrame.IgnoreBlanksCheckBox.Checked := FOptionsContainer.IgnoreBlanks;
  { Main menu }
  FMainMenuFrame.PersistentHotKeysCheckBox.Checked := FOptionsContainer.PersistentHotKeys;
  FMainMenuFrame.ShadowsCheckBox.Checked := FOptionsContainer.Shadows;
  FMainMenuFrame.UseSystemFontCheckBox.Checked := FOptionsContainer.UseSystemFont;
  FMainMenuFrame.FontLabel.Font.Name := FOptionsContainer.MainMenuFontName;
  FMainMenuFrame.FontLabel.Font.Size := FOptionsContainer.MainMenuFontSize;
  FMainMenuFrame.FontLabel.Caption := Format('%s %dpt', [FMainMenuFrame.FontLabel.Font.Name, FMainMenuFrame.FontLabel.Font.Size]);
  FMainMenuFrame.AnimationStyleComboBox.ItemIndex := Ord(FOptionsContainer.AnimationStyle);
  FMainMenuFrame.AnimationDurationEdit.Text := IntToStr(FOptionsContainer.AnimationDuration);
  { DBMS Output }
  FDBMSOutputFrame.PollingIntervalTrackBar.Position := FOptionsContainer.PollingInterval;
  { Format }
  FDateFormatFrame.DateFormatEdit.Text := FOptionsContainer.DateFormat;
  FTimeFormatFrame.TimeFormatEdit.Text := FOptionsContainer.TimeFormat;
  { SchemaBrowser }
  FOptionsSchemaBrowserFrame.ButtonPanelAlignComboBox.Text := FOptionsContainer.SchemaBrowserAlign;
  FObjectFrameFrame.ButtonPanelAlignComboBox.Text := FOptionsContainer.ObjectFrameAlign;
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

procedure TOptionsDialog.PutData;
begin
  { Options }
  FOptionsContainer.AutoIndent := FEditorOptionsFrame.AutoIndentCheckBox.Checked;
  FOptionsContainer.TrimTrailingSpaces := FEditorOptionsFrame.TrimTrailingSpacesCheckBox.Checked;
  FOptionsContainer.ScrollPastEof := FEditorOptionsFrame.ScrollPastEofCheckBox.Checked;
  FOptionsContainer.ScrollPastEol := FEditorOptionsFrame.ScrollPastEolCheckBox.Checked;
  FOptionsContainer.TabsToSpaces := FEditorOptionsFrame.TabsToSpacesCheckBox.Checked;
  FOptionsContainer.ExtraLineSpacing := StrToIntDef(FEditorOptionsFrame.ExtraLinesEdit.Text, 0);
  FOptionsContainer.TabWidth := StrToIntDef(FEditorOptionsFrame.TabWidthEdit.Text, 8);
  FOptionsContainer.ColorBrightness := FEditorOptionsFrame.BrightnessTrackBar.Position;
  { Font }
  FOptionsContainer.FontName := FEditorFontFrame.FontLabel.Font.Name;
  FOptionsContainer.FontSize := FEditorFontFrame.FontLabel.Font.Size;
  { Gutter }
  FOptionsContainer.GutterVisible := FEditorGutterFrame.GutterVisibleCheckBox.Checked;
  FOptionsContainer.GutterLineNumbers := FEditorGutterFrame.LineNumbersCheckBox.Checked;
  FOptionsContainer.RightMargin := StrToIntDef(FEditorGutterFrame.RightMarginEdit.Text, 80);
  FOptionsContainer.GutterFontName := FEditorGutterFrame.FontLabel.Font.Name;
  FOptionsContainer.GutterFontSize := FEditorGutterFrame.FontLabel.Font.Size;
  { Editor tabs }
  FOptionsContainer.EditorMultiLine := FEditorTabsFrame.MultiLineCheckBox.Checked;
  FOptionsContainer.EditorShowCloseButton := FEditorTabsFrame.ShowCloseButtonCheckBox.Checked;
  { Connection tabs }
  FOptionsContainer.ConnectionMultiLine := FConnectionTabsFrame.MultiLineCheckBox.Checked;
  FOptionsContainer.ConnectionShowCloseButton := FConnectionTabsFrame.ShowCloseButtonCheckBox.Checked;
  { Output tabs }
  FOptionsContainer.OutputMultiLine := FOutputTabsFrame.MultiLineCheckBox.Checked;
  FOptionsContainer.OutputShowCloseButton := FOutputTabsFrame.ShowCloseButtonCheckBox.Checked;
  { Compare }
  FOptionsContainer.IgnoreCase := FOptionsCompareFrame.IgnoreCaseCheckBox.Checked;
  FOptionsContainer.IgnoreBlanks := FOptionsCompareFrame.IgnoreBlanksCheckBox.Checked;
  { Main menu }
  FOptionsContainer.PersistentHotKeys := FMainMenuFrame.PersistentHotKeysCheckBox.Checked;
  FOptionsContainer.Shadows := FMainMenuFrame.ShadowsCheckBox.Checked;
  FOptionsContainer.UseSystemFont := FMainMenuFrame.UseSystemFontCheckBox.Checked;
  FOptionsContainer.MainMenuFontName := FMainMenuFrame.FontLabel.Font.Name;
  FOptionsContainer.MainMenuFontSize := FMainMenuFrame.FontLabel.Font.Size;
  FOptionsContainer.AnimationStyle := TAnimationStyle(FMainMenuFrame.AnimationStyleComboBox.ItemIndex);
  FOptionsContainer.AnimationDuration := StrToIntDef(FMainMenuFrame.AnimationDurationEdit.Text, 150);
  { DBMS Output }
  FOptionsContainer.PollingInterval := FDBMSOutputFrame.PollingIntervalTrackBar.Position;
  { Format }
  FOptionsContainer.DateFormat := FDateFormatFrame.DateFormatEdit.Text;
  FOptionsContainer.TimeFormat := FTimeFormatFrame.TimeFormatEdit.Text;
  { Schema browser }
  FOptionsContainer.SchemaBrowserAlign := FOptionsSchemaBrowserFrame.ButtonPanelAlignComboBox.Text;
  FOptionsContainer.ObjectFrameAlign := FObjectFrameFrame.ButtonPanelAlignComboBox.Text;

end;

procedure TOptionsDialog.FormCreate(Sender: TObject);
begin
  OptionsVirtualStringTree.NodeDataSize := SizeOf(TOptionsRec);
  FEditorOptionsFrame := TEditorOptionsFrame.Create(OptionsPanel);
  FEditorOptionsFrame.Parent := OptionsPanel;
  FEditorFontFrame := TEditorFontFrame.Create(OptionsPanel);
  FEditorFontFrame.Parent := OptionsPanel;
  FEditorGutterFrame := TEditorGutterFrame.Create(OptionsPanel);
  FEditorGutterFrame.Parent := OptionsPanel;
  FEditorTabsFrame := TEditorTabsFrame.Create(OptionsPanel);
  FEditorTabsFrame.Parent := OptionsPanel;
  FMainMenuFrame := TMainMenuFrame.Create(OptionsPanel);
  FMainMenuFrame.Parent := OptionsPanel;
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
end;

end.
