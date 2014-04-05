unit Options;

interface

uses
  Vcl.Controls, Vcl.Forms, Vcl.Graphics, Vcl.Dialogs, Vcl.StdCtrls, ComCtrls, CommCtrl, Registry, Vcl.ExtCtrls,
  Vcl.Buttons, System.Classes, System.SysUtils, Vcl.ImgList, Grids, System.Generics.Collections,
  ActnList, ValEdit, Vcl.Themes, Ora, VirtualTrees, BCFrames.OptionsEditorOptions, BCFrames.OptionsEditorFont,
  BCFrames.OptionsEditorLeftMargin, BCFrames.OptionsEditorRightMargin, OptionsEditorTabs, OptionsConnectionTabs,
  BCFrames.OptionsMainMenu, OptionsOutputTabs, OptionsDBMSOutput, OptionsSchemaBrowser, OptionsObjectFrame,
  OptionsDateFormat, OptionsTimeFormat, BCFrames.OptionsCompare, BCFrames.OptionsPrint, BCFrames.OptionsStatusBar,
  BCFrames.OptionsOutput, BCFrames.OptionsToolBar, BCFrames.OptionsEditorCompletionProposal, System.Actions,
  BCFrames.OptionsEditorSearch, BCSQL.Formatter, BCFrames.OptionsSQLSelect, BCCommon.OptionsContainer,
  BCFrames.OptionsSQLAlignments, BCFrames.OptionsSQLInsert, BCFrames.OptionsSQLUpdate, BCCommon.Images,
  BCFrames.OptionsSQLWhitespace, BCFrames.OptionsSQLCapitalization, BCFrames.OptionsSQLIndentation;

type
  POptionsRec = ^TOptionsRec;
  TOptionsRec = record
    Index: Integer;
    Caption: UnicodeString;
    ImageIndex: Integer;
  end;

  TOptionsForm = class(TForm)
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
    MainMenuAction: TAction;
    ObjectFrameAction: TAction;
    OKButton: TButton;
    OptionsPanel: TPanel;
    OptionsVirtualDrawTree: TVirtualDrawTree;
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
    SQLFormatterAction: TAction;
    SQLSelectAction: TAction;
    SQLAlignmentsAction: TAction;
    ScrollBox: TScrollBox;
    SQLInsertAction: TAction;
    SQLUpdateAction: TAction;
    SQLWhitespaceAction: TAction;
    SQLIndentationAction: TAction;
    SQLCapitalizationAction: TAction;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure OptionsVirtualDrawTreeClick(Sender: TObject);
    procedure OptionsVirtualDrawTreeFreeNode(Sender: TBaseVirtualTree; Node: PVirtualNode);
    procedure OptionsVirtualDrawTreeGetImageIndex(Sender: TBaseVirtualTree; Node: PVirtualNode;
      Kind: TVTImageKind; Column: TColumnIndex; var Ghosted: Boolean; var ImageIndex: Integer);
    procedure FormShow(Sender: TObject);
    procedure OptionsVirtualDrawTreeDrawNode(Sender: TBaseVirtualTree; const PaintInfo: TVTPaintInfo);
    procedure OptionsVirtualDrawTreeGetNodeWidth(Sender: TBaseVirtualTree; HintCanvas: TCanvas; Node: PVirtualNode;
      Column: TColumnIndex; var NodeWidth: Integer);
    procedure OptionsVirtualDrawTreeKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    FOraSession: TOraSession;
    FActionList: TObjectList<TAction>;
    FSQLFormatterDLLFound: Boolean;
    procedure CreateTree;
    procedure ReadIniFile;
    procedure SaveSelectedTreeNode;
    procedure SetVisibleFrame;
    procedure WriteIniFile;
  public
    function Execute(OraSession: TOraSession; ActionList: TObjectList<TAction>): Boolean;
  end;

function OptionsForm: TOptionsForm;

implementation

{$R *.dfm}

uses
  Winapi.Windows, System.Math, System.Types, BCCommon.StyleUtils, BCCommon.Messages, System.IniFiles,
  BCCommon.FileUtils, BCCommon.Lib;

const
  CELL_PADDING = 4;

var
  FOptionsForm: TOptionsForm;

{ TOptionsDialog }

function OptionsForm: TOptionsForm;
begin
  if not Assigned(FOptionsForm) then
    Application.CreateForm(TOptionsForm, FOptionsForm);
  Result := FOptionsForm;
end;

procedure TOptionsForm.FormDestroy(Sender: TObject);
begin
  FOptionsForm := nil;
end;

procedure TOptionsForm.FormShow(Sender: TObject);
var
  SelectedItemIndex: Integer;
  Node: PVirtualNode;

  function FindItem(CurrentNode: PVirtualNode; ItemIndex: Integer): PVirtualNode;
  var
    Data: POptionsRec;
  begin
    Data := OptionsVirtualDrawTree.GetNodeData(CurrentNode);
    while Assigned(CurrentNode) and (Data.Index <> ItemIndex) do
    begin
      CurrentNode := OptionsVirtualDrawTree.GetNext(CurrentNode);
      Data := OptionsVirtualDrawTree.GetNodeData(CurrentNode);
    end;
    Result := CurrentNode;
  end;

begin
  inherited;
  CreateTree;

  with TIniFile.Create(GetIniFilename) do
  try
    SelectedItemIndex := ReadInteger('Options', 'OptionsSelectedItemIndex', 0);
  finally
    Free;
  end;
  Node := FindItem(OptionsVirtualDrawTree.GetFirst, SelectedItemIndex);
  if Assigned(Node) then
    OptionsVirtualDrawTree.Selected[Node] := True;
  SetVisibleFrame;
end;

procedure TOptionsForm.CreateTree;
var
  i: Integer;
  Data: POptionsRec;
  Node, ChildNode: PVirtualNode;
begin
  with OptionsVirtualDrawTree do
  begin
    Clear;
    i := 0;
    { Editor }
    Node := AddChild(nil);
    Data := GetNodeData(Node);
    Data.Index := PostInc(i);
    Data.ImageIndex := EditorAction.ImageIndex;
    Data.Caption := EditorAction.Caption;
    { Font }
    ChildNode := AddChild(Node);
    Data := GetNodeData(ChildNode);
    Data.Index := PostInc(i);
    Data.ImageIndex := EditorFontAction.ImageIndex;
    Data.Caption := EditorFontAction.Caption;
    { Left Margin }
    ChildNode := AddChild(Node);
    Data := GetNodeData(ChildNode);
    Data.Index := PostInc(i);
    Data.ImageIndex := EditorLeftMarginAction.ImageIndex;
    Data.Caption := EditorLeftMarginAction.Caption;
    { Right Margin }
    ChildNode := AddChild(Node);
    Data := GetNodeData(ChildNode);
    Data.Index := PostInc(i);
    Data.ImageIndex := EditorRightMarginAction.ImageIndex;
    Data.Caption := EditorRightMarginAction.Caption;
    { Tabs }
    ChildNode := AddChild(Node);
    Data := GetNodeData(ChildNode);
    Data.Index := PostInc(i);
    Data.ImageIndex := EditorTabsAction.ImageIndex;
    Data.Caption := EditorTabsAction.Caption;
    { Search }
    ChildNode := AddChild(Node);
    Data := GetNodeData(ChildNode);
    Data.Index := PostInc(i);
    Data.ImageIndex := EditorSearchAction.ImageIndex;
    Data.Caption := EditorSearchAction.Caption;
    { Completion proposal }
    ChildNode := AddChild(Node);
    Data := GetNodeData(ChildNode);
    Data.Index := PostInc(i);
    Data.ImageIndex := EditorCompletionProposalAction.ImageIndex;
    Data.Caption := EditorCompletionProposalAction.Caption;
    { Tool bar }
    ChildNode := AddChild(Node);
    Data := GetNodeData(ChildNode);
    Data.Index := PostInc(i);
    Data.ImageIndex := EditorToolBarAction.ImageIndex;
    Data.Caption := EditorToolBarAction.Caption;
    Node.ChildCount := 7;
    OptionsVirtualDrawTree.Selected[Node] := True;
    OptionsVirtualDrawTree.Expanded[Node] := True;
    { Schema Browser }
    Node := AddChild(nil);
    Data := GetNodeData(Node);
    Data.Index := PostInc(i);
    Data.ImageIndex := SchemaBrowserAction.ImageIndex;
    Data.Caption := SchemaBrowserAction.Caption;
    { Object Frame }
    ChildNode := AddChild(Node);
    Data := GetNodeData(ChildNode);
    Data.Index := PostInc(i);
    Data.ImageIndex := ObjectFrameAction.ImageIndex;
    Data.Caption := ObjectFrameAction.Caption;
    Node.ChildCount := 1;
    OptionsVirtualDrawTree.Selected[Node] := True;
    OptionsVirtualDrawTree.Expanded[Node] := True;
    { Connection }
    Node := AddChild(nil);
    Data := GetNodeData(Node);
    Data.Index := PostInc(i);
    Data.ImageIndex := ConnectionAction.ImageIndex;
    Data.Caption := ConnectionAction.Caption;
    { Tabs }
    ChildNode := AddChild(Node);
    Data := GetNodeData(ChildNode);
    Data.Index := PostInc(i);
    Data.ImageIndex := ConnectionTabsAction.ImageIndex;
    Data.Caption := ConnectionTabsAction.Caption;
    Node.ChildCount := 1;
    OptionsVirtualDrawTree.Selected[Node] := True;
    OptionsVirtualDrawTree.Expanded[Node] := True;
    { Output }
    Node := AddChild(nil);
    Data := GetNodeData(Node);
    Data.Index := PostInc(i);
    Data.ImageIndex := OutputAction.ImageIndex;
    Data.Caption := OutputAction.Caption;
    { DBMS }
    ChildNode := AddChild(Node);
    Data := GetNodeData(ChildNode);
    Data.Index := PostInc(i);
    Data.ImageIndex := DBMSOutputAction.ImageIndex;
    Data.Caption := DBMSOutputAction.Caption;
    { Tabs }
    ChildNode := AddChild(Node);
    Data := GetNodeData(ChildNode);
    Data.Index := PostInc(i);
    Data.ImageIndex := OutputTabsAction.ImageIndex;
    Data.Caption := OutputTabsAction.Caption;
    Node.ChildCount := 2;
    OptionsVirtualDrawTree.Selected[Node] := True;
    OptionsVirtualDrawTree.Expanded[Node] := True;
    { Compare }
    Node := AddChild(nil);
    Data := GetNodeData(Node);
    Data.Index := PostInc(i);
    Data.ImageIndex := CompareAction.ImageIndex;
    Data.Caption := CompareAction.Caption;
    { Print }
    Node := AddChild(nil);
    Data := GetNodeData(Node);
    Data.Index := PostInc(i);
    Data.ImageIndex := PrintAction.ImageIndex;
    Data.Caption := PrintAction.Caption;
    { Main menu }
    Node := AddChild(nil);
    Data := GetNodeData(Node);
    Data.Index := PostInc(i);
    Data.ImageIndex := MainMenuAction.ImageIndex;
    Data.Caption := MainMenuAction.Caption;
    { Status Bar }
    Node := AddChild(nil);
    Data := GetNodeData(Node);
    Data.Index := PostInc(i);
    Data.ImageIndex := StatusBarAction.ImageIndex;
    Data.Caption := StatusBarAction.Caption;
    { DB Settings }
    Node := AddChild(nil);
    Data := GetNodeData(Node);
    Data.Index := PostInc(i);
    Data.ImageIndex := DBSettingsAction.ImageIndex;
    Data.Caption := DBSettingsAction.Caption;
    { Date Format }
    ChildNode := AddChild(Node);
    Data := GetNodeData(ChildNode);
    Data.Index := PostInc(i);
    Data.ImageIndex := DateFormatAction.ImageIndex;
    Data.Caption := DateFormatAction.Caption;
    { Time Format }
    ChildNode := AddChild(Node);
    Data := GetNodeData(ChildNode);
    Data.Index := PostInc(i);
    Data.ImageIndex := TimeFormatAction.ImageIndex;
    Data.Caption := TimeFormatAction.Caption;
    Node.ChildCount := 2;
    OptionsVirtualDrawTree.Selected[Node] := True;
    OptionsVirtualDrawTree.Expanded[Node] := True;

    if FSQLFormatterDLLFound then
    begin
      { SQL Formatter }
      Node := AddChild(nil);
      Data := GetNodeData(Node);
      Data.Index := PostInc(i);
      Data.ImageIndex := SQLFormatterAction.ImageIndex;
      Data.Caption := SQLFormatterAction.Caption;
      { Alignments }
      ChildNode := AddChild(Node);
      Data := GetNodeData(ChildNode);
      Data.Index := PostInc(i);
      Data.ImageIndex := SQLAlignmentsAction.ImageIndex;
      Data.Caption := SQLAlignmentsAction.Caption;
      { Capitalization }
      ChildNode := AddChild(Node);
      Data := GetNodeData(ChildNode);
      Data.Index := PostInc(i);
      Data.ImageIndex := SQLCapitalizationAction.ImageIndex;
      Data.Caption := SQLCapitalizationAction.Caption;
      { Indentation }
      ChildNode := AddChild(Node);
      Data := GetNodeData(ChildNode);
      Data.Index := PostInc(i);
      Data.ImageIndex := SQLIndentationAction.ImageIndex;
      Data.Caption := SQLIndentationAction.Caption;
      { Insert }
      ChildNode := AddChild(Node);
      Data := GetNodeData(ChildNode);
      Data.Index := PostInc(i);
      Data.ImageIndex := SQLInsertAction.ImageIndex;
      Data.Caption := SQLInsertAction.Caption;
      { Select }
      ChildNode := AddChild(Node);
      Data := GetNodeData(ChildNode);
      Data.Index := PostInc(i);
      Data.ImageIndex := SQLSelectAction.ImageIndex;
      Data.Caption := SQLSelectAction.Caption;
      { Update }
      ChildNode := AddChild(Node);
      Data := GetNodeData(ChildNode);
      Data.Index := PostInc(i);
      Data.ImageIndex := SQLUpdateAction.ImageIndex;
      Data.Caption := SQLUpdateAction.Caption;
      { Whitespace }
      ChildNode := AddChild(Node);
      Data := GetNodeData(ChildNode);
      Data.Index := PostInc(i);
      Data.ImageIndex := SQLWhitespaceAction.ImageIndex;
      Data.Caption := SQLWhitespaceAction.Caption;

      Node.ChildCount := 7;
      OptionsVirtualDrawTree.Selected[Node] := True;
      OptionsVirtualDrawTree.Expanded[Node] := True;
    end;
    OptionsVirtualDrawTree.Selected[OptionsVirtualDrawTree.GetFirst] := True;
  end;
end;

function TOptionsForm.Execute(OraSession: TOraSession; ActionList: TObjectList<TAction>): Boolean;
begin
  FActionList := ActionList;
  FOraSession := OraSession;
  try
    ReadIniFile;
    Result := Showmodal = mrOk;
    WriteIniFile;
    SaveSelectedTreeNode;
  finally
    Free;
  end;
  if Result then
    SQLFormatterOptions.WriteIniFile; { this is written here because dll is reading settings from the ini file }
end;

procedure TOptionsForm.OptionsVirtualDrawTreeClick(Sender: TObject);
begin
  inherited;
  SetVisibleFrame;
end;

procedure TOptionsForm.OptionsVirtualDrawTreeDrawNode(Sender: TBaseVirtualTree; const PaintInfo: TVTPaintInfo);
var
  Data: POptionsRec;
  S: UnicodeString;
  R: TRect;
  Format: Cardinal;
  LStyles: TCustomStyleServices;
  LColor: TColor;
begin
  LStyles := StyleServices;
  with Sender as TVirtualDrawTree, PaintInfo do
  begin
    Data := Sender.GetNodeData(Node);

    if not Assigned(Data) then
      Exit;

    if not LStyles.GetElementColor(LStyles.GetElementDetails(tgCellNormal), ecTextColor, LColor) or  (LColor = clNone) then
      LColor := LStyles.GetSystemColor(clWindowText);
    //get and set the background color
    Canvas.Brush.Color := LStyles.GetStyleColor(scEdit);
    Canvas.Font.Color := LColor;

    if LStyles.Enabled and (vsSelected in PaintInfo.Node.States) then
    begin
       Colors.FocusedSelectionColor := LStyles.GetSystemColor(clHighlight);
       Colors.FocusedSelectionBorderColor := LStyles.GetSystemColor(clHighlight);
       Colors.UnfocusedSelectionColor := LStyles.GetSystemColor(clHighlight);
       Colors.UnfocusedSelectionBorderColor := LStyles.GetSystemColor(clHighlight);
       Canvas.Brush.Color := LStyles.GetSystemColor(clHighlight);
       Canvas.Font.Color := LStyles.GetStyleFontColor(sfMenuItemTextSelected);
    end
    else
    if not LStyles.Enabled and (vsSelected in PaintInfo.Node.States) then
    begin
      Canvas.Brush.Color := clHighlight;
      Canvas.Font.Color := clHighlightText;
    end;

    SetBKMode(Canvas.Handle, TRANSPARENT);

    R := ContentRect;
    InflateRect(R, -TextMargin, 0);
    Dec(R.Right);
    Dec(R.Bottom);
    S := Data.Caption;

    if Length(S) > 0 then
    begin
      Format := DT_TOP or DT_LEFT or DT_VCENTER or DT_SINGLELINE;
      DrawText(Canvas.Handle, S, Length(S), R, Format)
    end;
  end;
end;

procedure TOptionsForm.OptionsVirtualDrawTreeFreeNode(Sender: TBaseVirtualTree;
  Node: PVirtualNode);
var
  Data: POptionsRec;
begin
  Data := Sender.GetNodeData(Node);
  Finalize(Data^);
end;

procedure TOptionsForm.OptionsVirtualDrawTreeGetImageIndex(Sender: TBaseVirtualTree;
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

procedure TOptionsForm.OptionsVirtualDrawTreeGetNodeWidth(Sender: TBaseVirtualTree; HintCanvas: TCanvas;
  Node: PVirtualNode; Column: TColumnIndex; var NodeWidth: Integer);
var
  Data: POptionsRec;
begin
  Data := Sender.GetNodeData(Node);
  if Assigned(Data) then
    NodeWidth := Canvas.TextWidth(Trim(Data.Caption)) + 2;
end;

procedure TOptionsForm.OptionsVirtualDrawTreeKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  SetVisibleFrame;
end;

procedure TOptionsForm.SetVisibleFrame;
var
  i, Level, ParentIndex: Integer;
  TreeNode: PVirtualNode;
begin
  inherited;
  TreeNode := OptionsVirtualDrawTree.GetFirstSelected;
  if Assigned(TreeNode) then
  begin
    { hide all frames }
    for i := 0 to ComponentCount - 1 do
      if Components[i]  is TFrame then
        TFrame(Components[i]).Visible := False;
    Level := OptionsVirtualDrawTree.GetNodeLevel(TreeNode);
    ParentIndex := -1;
    if Level = 1 then
      ParentIndex := TreeNode.Parent.Index;
    if Level = 2 then
      ParentIndex := TreeNode.Parent.Parent.Index;

     { don't set the visibility value with the condition because the frame is created }
    if (Level = 0) and (TreeNode.Index = 0) then
      OptionsEditorOptionsFrame(Self).Show;
    if (ParentIndex = 0) and (Level = 1) and (TreeNode.Index = 0) then
      OptionsEditorFontFrame(Self).Show;
    if (ParentIndex = 0) and (Level = 1) and (TreeNode.Index = 1) then
      OptionsEditorLeftMarginFrame(Self).Show;
    if (ParentIndex = 0) and (Level = 1) and (TreeNode.Index = 2) then
      OptionsEditorRightMarginFrame(Self).Show;
    if (ParentIndex = 0) and (Level = 1) and (TreeNode.Index = 3) then
      OptionsEditorTabsFrame(Self).Show;
    if (ParentIndex = 0) and (Level = 1) and (TreeNode.Index = 4) then
      OptionsEditorSearchFrame(Self).Show;
    if (ParentIndex = 0) and (Level = 1) and (TreeNode.Index = 5) then
      OptionsEditorCompletionProposalFrame(Self).Show;
    if (ParentIndex = 0) and (Level = 1) and (TreeNode.Index = 6) then
      OptionsToolBarFrame(Self, FActionList).Show;
    if (Level = 0) and (TreeNode.Index = 1) then
      OptionsSchemaBrowserFrame(Self).Show;
    if (ParentIndex = 1) and (Level = 1) and (TreeNode.Index = 0) then
      OptionsObjectFrameFrame(Self).Show;
    if (ParentIndex = 2) and (Level = 1) and (TreeNode.Index = 0) then
      OptionsConnectionTabsFrame(Self).Show;
    if (Level = 0) and (TreeNode.Index = 3) then
      OptionsOutputFrame(Self).Show;
    if (ParentIndex = 3) and (Level = 1) and (TreeNode.Index = 0) then
      OptionsDBMSOutputFrame(Self).Show;
    if (ParentIndex = 3) and (Level = 1) and (TreeNode.Index = 1) then
      OptionsOutputTabsFrame(Self).Show;
    if (Level = 0) and (TreeNode.Index = 4) then
      OptionsCompareFrame(Self).Show;
    if (Level = 0) and (TreeNode.Index = 5) then
      OptionsPrintFrame(Self).Show;
    if (Level = 0) and (TreeNode.Index = 6) then
      OptionsMainMenuFrame(Self).Show;
    if (Level = 0) and (TreeNode.Index = 7) then
      OptionsStatusBarFrame(Self).Show;
    if (ParentIndex = 8) and (Level = 1) and (TreeNode.Index = 0) then
      OptionsDateFormatFrame(Self, FOraSession).Show;
    if (ParentIndex = 8) and (Level = 1) and (TreeNode.Index = 1) then
      OptionsTimeFormatFrame(Self, FOraSession).Show;
    if FSQLFormatterDLLFound then
    begin
      { SQL Formatter options }
      if (ParentIndex = 9) and (Level = 1) and (TreeNode.Index = 0) then
        OptionsSQLAlignmentsFrame(Self).Show;
      if (ParentIndex = 9) and (Level = 1) and (TreeNode.Index = 1) then
        OptionsSQLCapitalizationFrame(Self).Show;
      if (ParentIndex = 9) and (Level = 1) and (TreeNode.Index = 2) then
        OptionsSQLIndentationFrame(Self).Show;
      if (ParentIndex = 9) and (Level = 1) and (TreeNode.Index = 3) then
        OptionsSQLInsertFrame(Self).Show;
      if (ParentIndex = 9) and (Level = 1) and (TreeNode.Index = 4) then
        OptionsSQLSelectFrame(Self).Show;
      if (ParentIndex = 9) and (Level = 1) and (TreeNode.Index = 5) then
        OptionsSQLUpdateFrame(Self).Show;
      if (ParentIndex = 9) and (Level = 1) and (TreeNode.Index = 6) then
        OptionsSQLWhitespaceFrame(Self).Show;
    end;
  end;
end;

procedure TOptionsForm.ReadIniFile;
begin
  with TMemIniFile.Create(GetIniFilename) do
  try
    { Size }
    Width := ReadInteger('OptionsSize', 'Width', Width);
    Height := ReadInteger('OptionsSize', 'Height', Height);
    { Position }
    Left := ReadInteger('OptionsPosition', 'Left', (Screen.Width - Width) div 2);
    Top := ReadInteger('OptionsPosition', 'Top', (Screen.Height - Height) div 2);
    { Check if the form is outside the workarea }
    Left := SetFormInsideWorkArea(Left, Width);
    { Tree width }
    OptionsVirtualDrawTree.Width := ReadInteger('OptionsSize', 'TreeWidth', OptionsVirtualDrawTree.Width);
  finally
    Free;
  end;
end;

procedure TOptionsForm.WriteIniFile;
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
    WriteInteger('OptionsSize', 'TreeWidth', OptionsVirtualDrawTree.Width);
  finally
    UpdateFile;
    Free;
  end;
end;

procedure TOptionsForm.FormCreate(Sender: TObject);
begin
  OptionsVirtualDrawTree.NodeDataSize := SizeOf(TOptionsRec);
  FSQLFormatterDLLFound := FileExists(GetSQLFormatterDLLFilename);
end;

procedure TOptionsForm.SaveSelectedTreeNode;
var
  Node: PVirtualNode;
  Data: POptionsRec;
begin
  with TIniFile.Create(GetIniFilename) do
  try
    Node := OptionsVirtualDrawTree.GetFirstSelected;
    Data := OptionsVirtualDrawTree.GetNodeData(Node);
    WriteInteger('Options', 'OptionsSelectedItemIndex', Data.Index);
  finally
    Free;
  end;
end;

end.
