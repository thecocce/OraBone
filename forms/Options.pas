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
    FOraSession: TOraSession;
    FActionList: TObjectList<TAction>;
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
  System.Math, BCCommon.StyleUtils, BCCommon.Messages, System.IniFiles, BCCommon.FileUtils, BCCommon.Lib;

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
    Data := OptionsVirtualStringTree.GetNodeData(CurrentNode);
    while Assigned(CurrentNode) and (Data.Index <> ItemIndex) do
    begin
      CurrentNode := OptionsVirtualStringTree.GetNext(CurrentNode);
      Data := OptionsVirtualStringTree.GetNodeData(CurrentNode);
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
  Node := FindItem(OptionsVirtualStringTree.GetFirst, SelectedItemIndex);
  if Assigned(Node) then
    OptionsVirtualStringTree.Selected[Node] := True;
  SetVisibleFrame;
end;

procedure TOptionsForm.CreateTree;
var
  i: Integer;
  Data: POptionsRec;
  Node, ChildNode: PVirtualNode;
begin
  with OptionsVirtualStringTree do
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
    OptionsVirtualStringTree.Selected[Node] := True;
    OptionsVirtualStringTree.Expanded[Node] := True;
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
    OptionsVirtualStringTree.Selected[Node] := True;
    OptionsVirtualStringTree.Expanded[Node] := True;
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
    OptionsVirtualStringTree.Selected[Node] := True;
    OptionsVirtualStringTree.Expanded[Node] := True;
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
    OptionsVirtualStringTree.Selected[Node] := True;
    OptionsVirtualStringTree.Expanded[Node] := True;
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
    OptionsVirtualStringTree.Selected[Node] := True;
    OptionsVirtualStringTree.Expanded[Node] := True;
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

    Node.ChildCount := 4;
    OptionsVirtualStringTree.Selected[Node] := True;
    OptionsVirtualStringTree.Expanded[Node] := True;
    OptionsVirtualStringTree.Selected[OptionsVirtualStringTree.GetFirst] := True;
  end;
end;

function TOptionsForm.Execute(OraSession: TOraSession; ActionList: TObjectList<TAction>): Boolean;
begin
  FActionList := ActionList;
  FOraSession := OraSession;
  try
    ReadIniFile;
    Result := Showmodal = mrOk;
    if Result then
      SQLFormatterOptions.WriteIniFile; { this is written here because dll is reading settings from the ini file }
    WriteIniFile;
    SaveSelectedTreeNode;
  finally
    Free;
  end;
end;

procedure TOptionsForm.OptionsVirtualStringTreeClick(Sender: TObject);
begin
  inherited;
  SetVisibleFrame;
end;

procedure TOptionsForm.OptionsVirtualStringTreeFreeNode(Sender: TBaseVirtualTree;
  Node: PVirtualNode);
var
  Data: POptionsRec;
begin
  Data := Sender.GetNodeData(Node);
  Finalize(Data^);
end;

procedure TOptionsForm.OptionsVirtualStringTreeGetImageIndex(Sender: TBaseVirtualTree;
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

procedure TOptionsForm.OptionsVirtualStringTreeGetText(Sender: TBaseVirtualTree;
  Node: PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType; var CellText: string);
var
  Data: POptionsRec;
begin
  Data := Sender.GetNodeData(Node);
  if Assigned(Data) then
    CellText := Data.Caption;
end;

procedure TOptionsForm.OptionsVirtualStringTreePaintText(Sender: TBaseVirtualTree; const TargetCanvas: TCanvas;
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

procedure TOptionsForm.SetVisibleFrame;
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
    OptionsVirtualStringTree.Width := ReadInteger('OptionsSize', 'TreeWidth', OptionsVirtualStringTree.Width);
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
    WriteInteger('OptionsSize', 'TreeWidth', OptionsVirtualStringTree.Width);
  finally
    UpdateFile;
    Free;
  end;
end;

procedure TOptionsForm.FormCreate(Sender: TObject);
begin
  OptionsVirtualStringTree.NodeDataSize := SizeOf(TOptionsRec);
end;

procedure TOptionsForm.SaveSelectedTreeNode;
var
  Node: PVirtualNode;
  Data: POptionsRec;
begin
  with TIniFile.Create(GetIniFilename) do
  try
    Node := OptionsVirtualStringTree.GetFirstSelected;
    Data := OptionsVirtualStringTree.GetNodeData(Node);
    WriteInteger('Options', 'OptionsSelectedItemIndex', Data.Index);
  finally
    Free;
  end;
end;

end.
