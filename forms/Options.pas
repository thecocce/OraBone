unit Options;

interface

uses
  Vcl.Controls, Vcl.Forms, Vcl.Graphics, Vcl.Dialogs, Vcl.StdCtrls, ComCtrls, CommCtrl, Registry, Vcl.ExtCtrls,
  Vcl.Buttons, BCDialogs.Dlg, System.Classes, System.SysUtils, Vcl.ImgList, Grids,
  ActnList, ValEdit, Vcl.Themes, Ora, VirtualTrees, BCFrames.OptionsEditorOptions, BCFrames.OptionsEditorFont,
  BCFrames.OptionsEditorLeftMargin, BCFrames.OptionsEditorRightMargin, OptionsEditorTabs, OptionsConnectionTabs,
  BCFrames.OptionsMainMenu, OptionsOutputTabs, OptionsDBMSOutput, OptionsSchemaBrowser, OptionsObjectFrame,
  OptionsDateFormat, OptionsTimeFormat, BCFrames.OptionsCompare, BCFrames.OptionsPrint, BCFrames.OptionsStatusBar,
  BCFrames.OptionsOutput, OptionsEditorToolBar, BCFrames.OptionsEditorCompletionProposal, System.Actions,
  BCFrames.OptionsEditorSearch, BCSQL.Formatter, BCFrames.OptionsSQLSelectColumnList, BCCommon.OptionsContainer,
  BCFrames.OptionsSQLSelectSubquery;

type
  POptionsRec = ^TOptionsRec;
  TOptionsRec = record
    Caption: UnicodeString;
    ImageIndex: Integer;
  end;

  TOptionsForm = class(TDialog)
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
    SQLFormatterAction: TAction;
    SQLSelectAction: TAction;
    SQLSelectColumnListAction: TAction;
    SQLSelectSubqueryAction: TAction;
    SQLSelectIntoClauseAction: TAction;
    SQLSelectFromJoinClauseAction: TAction;
    SQLSelectAndOrKeywordAction: TAction;
    SQLSelectGroupByClauseAction: TAction;
    SQLSelectHavingClauseAction: TAction;
    SQLSelectOrderByAction: TAction;
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
    FOptionsConnectionTabsFrame: TOptionsConnectionTabsFrame;
    FOptionsDateFormatFrame: TOptionsDateFormatFrame;
    FOptionsDBMSOutputFrame: TOptionsDBMSOutputFrame;
    FOptionsEditorCompletionProposalFrame: TOptionsEditorCompletionProposalFrame;
    FOptionsEditorFontFrame: TOptionsEditorFontFrame;
    FOptionsEditorLeftMarginFrame: TOptionsEditorLeftMarginFrame;
    FOptionsEditorOptionsFrame: TOptionsEditorOptionsFrame;
    FOptionsEditorRightMarginFrame: TOptionsEditorRightMarginFrame;
    FOptionsEditorSearchFrame: TOptionsEditorSearchFrame;
    FOptionsEditorTabsFrame: TOptionsEditorTabsFrame;
    FOptionsEditorToolBarFrame: TOptionsEditorToolBarFrame;
    FOptionsMainMenuFrame: TOptionsMainMenuFrame;
    FOptionsObjectFrameFrame: TOptionsObjectFrameFrame;
    FOptionsCompareFrame: TOptionsCompareFrame;
    FOptionsContainer: TOraBoneOptionsContainer;
    FOptionsOutputFrame: TOptionsOutputFrame;
    FOptionsPrintFrame: TOptionsPrintFrame;
    FOptionsSchemaBrowserFrame: TOptionsSchemaBrowserFrame;
    FOptionsOutputTabsFrame: TOptionsOutputTabsFrame;
    FOptionsStatusBarFrame: TOptionsStatusBarFrame;
    FSQLFormatterOptionsWrapper: TSQLFormatterOptionsWrapper;
    FOptionsSQLSelectColumnListFrame: TOptionsSQLSelectColumnListFrame;
    FOptionsSQLSelectSubqueryFrame: TOptionsSQLSelectSubqueryFrame;
    FOptionsTimeFormatFrame: TOptionsTimeFormatFrame;
    procedure CreateTree;
    procedure GetData;
    procedure PutData;
    procedure ReadIniFile;
    procedure SetVisibleFrame;
    procedure WriteIniFile;
  public
    function Execute(OraSession: TOraSession; EditOptions: TOraBoneOptionsContainer): Boolean;
  end;

function OptionsForm: TOptionsForm;

implementation

{$R *.dfm}

uses
  System.Math, BCCommon.StyleUtils, BCCommon.Messages, System.IniFiles, BCCommon.FileUtils;

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
  SetStyledFormSize(Result);
end;

procedure TOptionsForm.FormDestroy(Sender: TObject);
begin
  FOptionsEditorOptionsFrame.Free;
  FOptionsEditorFontFrame.Free;
  FOptionsEditorLeftMarginFrame.Free;
  FOptionsEditorRightMarginFrame.Free;
  FOptionsEditorTabsFrame.Free;
  FOptionsEditorSearchFrame.Free;
  FOptionsEditorToolBarFrame.Free;
  FOptionsEditorCompletionProposalFrame.Free;
  FOptionsMainMenuFrame.Free;
  FOptionsOutputFrame.Free;
  FOptionsOutputTabsFrame.Free;
  FOptionsDBMSOutputFrame.Free;
  FOptionsSchemaBrowserFrame.Free;
  FOptionsObjectFrameFrame.Free;
  FOptionsDateFormatFrame.Free;
  FOptionsTimeFormatFrame.Free;
  FOptionsConnectionTabsFrame.Free;
  FOptionsCompareFrame.Free;
  FOptionsStatusBarFrame.Free;
  FOptionsPrintFrame.Free;
  FOptionsSQLSelectColumnListFrame.Free;
  FOptionsSQLSelectSubqueryFrame.Free;

  FSQLFormatterOptionsWrapper.Free;

  FOptionsForm := nil;
end;

procedure TOptionsForm.FormShow(Sender: TObject);
var
  Node: PVirtualNode;
begin
  inherited;
  Node := OptionsVirtualStringTree.GetFirstSelected;
  CreateTree;
  OptionsVirtualStringTree.Selected[Node] := True;
  SetVisibleFrame;
end;

procedure TOptionsForm.CreateTree;
var
  Data: POptionsRec;
  Node, ChildNode, ChildChildNode: PVirtualNode;
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
    { SQL Formatter }
    Node := AddChild(nil);
    Data := GetNodeData(Node);
    Data.ImageIndex := SQLFormatterAction.ImageIndex;
    Data.Caption := SQLFormatterAction.Caption;
    { Select }
    ChildNode := AddChild(Node);
    Data := GetNodeData(ChildNode);
    Data.ImageIndex := SQLSelectAction.ImageIndex;
    Data.Caption := SQLSelectAction.Caption;
    { Select Column List }
    ChildChildNode := AddChild(ChildNode);
    Data := GetNodeData(ChildChildNode);
    Data.ImageIndex := SQLSelectColumnListAction.ImageIndex;
    Data.Caption := SQLSelectColumnListAction.Caption;
    { Select Subquery }
    ChildChildNode := AddChild(ChildNode);
    Data := GetNodeData(ChildChildNode);
    Data.ImageIndex := SQLSelectSubqueryAction.ImageIndex;
    Data.Caption := SQLSelectSubqueryAction.Caption;


    Node.ChildCount := 1;
    ChildNode.ChildCount := 2;
    OptionsVirtualStringTree.Selected[Node] := True;
    OptionsVirtualStringTree.Expanded[Node] := True;
    OptionsVirtualStringTree.Selected[OptionsVirtualStringTree.GetFirst] := True;
  end;
end;

function TOptionsForm.Execute(OraSession: TOraSession; EditOptions: TOraBoneOptionsContainer): Boolean;
begin
  FOptionsDateFormatFrame.Session := OraSession;
  FOptionsTimeFormatFrame.Session := OraSession;
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

procedure TOptionsForm.GetData;
begin
  FOptionsEditorOptionsFrame.GetData(FOptionsContainer);
  FOptionsEditorFontFrame.GetData(FOptionsContainer);
  FOptionsEditorLeftMarginFrame.GetData(FOptionsContainer);
  FOptionsEditorRightMarginFrame.GetData(FOptionsContainer);
  FOptionsEditorSearchFrame.GetData(FOptionsContainer);
  FOptionsEditorTabsFrame.GetData(FOptionsContainer);
  FOptionsEditorCompletionProposalFrame.GetData(FOptionsContainer);
  FOptionsEditorToolBarFrame.GetData(FOptionsContainer);
  FOptionsConnectionTabsFrame.GetData(FOptionsContainer);
  FOptionsOutputTabsFrame.GetData(FOptionsContainer);
  FOptionsCompareFrame.GetData(FOptionsContainer);
  FOptionsPrintFrame.GetData(FOptionsContainer);
  FOptionsMainMenuFrame.GetData(FOptionsContainer);
  FOptionsOutputFrame.GetData(FOptionsContainer);
  FOptionsDBMSOutputFrame.GetData(FOptionsContainer);
  FOptionsDateFormatFrame.GetData(FOptionsContainer);
  FOptionsTimeFormatFrame.GetData(FOptionsContainer);
  FOptionsSchemaBrowserFrame.GetData(FOptionsContainer);
  FOptionsObjectFrameFrame.GetData(FOptionsContainer);
  FOptionsStatusBarFrame.GetData(FOptionsContainer);
  FOptionsSQLSelectColumnListFrame.GetData(FSQLFormatterOptionsWrapper);
  FOptionsSQLSelectSubqueryFrame.GetData(FSQLFormatterOptionsWrapper);
end;

procedure TOptionsForm.OKButtonActionExecute(Sender: TObject);
begin
  if FOptionsDateFormatFrame.DateFormatExampleEdit.Font.Color = clRed then
  begin
    ShowErrorMessage('Invalid date format.');
    Exit;
  end;
  if FOptionsTimeFormatFrame.TimeFormatExampleEdit.Font.Color = clRed then
  begin
    ShowErrorMessage('Invalid time format.');
    Exit;
  end;

  ModalResult := mrOk;
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
    FOptionsEditorOptionsFrame.Visible := (Level = 0) and (TreeNode.Index = 0);
    FOptionsEditorFontFrame.Visible := (ParentIndex = 0) and (Level = 1) and (TreeNode.Index = 0);
    if FOptionsEditorFontFrame.Visible then
    begin
      FOptionsContainer.AssignTo(FOptionsEditorFontFrame.SynEdit);
      FOptionsEditorFontFrame.SynEdit.ActiveLineColor := LightenColor(FOptionsEditorFontFrame.SynEdit.Color, 1 - (10 - FOptionsContainer.ColorBrightness)/10);
      BCCommon.StyleUtils.UpdateMarginAndColors(FOptionsEditorFontFrame.SynEdit);
    end;
    FOptionsEditorLeftMarginFrame.Visible := (ParentIndex = 0) and (Level = 1) and (TreeNode.Index = 1);
    FOptionsEditorRightMarginFrame.Visible := (ParentIndex = 0) and (Level = 1) and (TreeNode.Index = 2);
    FOptionsEditorTabsFrame.Visible := (ParentIndex = 0) and (Level = 1) and (TreeNode.Index = 3);
    FOptionsEditorSearchFrame.Visible := (ParentIndex = 0) and (Level = 1) and (TreeNode.Index = 4);
    FOptionsEditorCompletionProposalFrame.Visible := (ParentIndex = 0) and (Level = 1) and (TreeNode.Index = 5);
    FOptionsEditorToolBarFrame.Visible := (ParentIndex = 0) and (Level = 1) and (TreeNode.Index = 6);

    FOptionsSchemaBrowserFrame.Visible := (Level = 0) and (TreeNode.Index = 1);
    FOptionsObjectFrameFrame.Visible := (ParentIndex = 1) and (Level = 1) and (TreeNode.Index = 0);

    FOptionsConnectionTabsFrame.Visible := (ParentIndex = 2) and (Level = 1) and (TreeNode.Index = 0);

    FOptionsOutputFrame.Visible := (Level = 0) and (TreeNode.Index = 3);
    FOptionsDBMSOutputFrame.Visible := (ParentIndex = 3) and (Level = 1) and (TreeNode.Index = 0);
    FOptionsOutputTabsFrame.Visible := (ParentIndex = 3) and (Level = 1) and (TreeNode.Index = 1);

    FOptionsCompareFrame.Visible := (Level = 0) and (TreeNode.Index = 4);
    FOptionsPrintFrame.Visible := (Level = 0) and (TreeNode.Index = 5);
    FOptionsMainMenuFrame.Visible := (Level = 0) and (TreeNode.Index = 6);
    FOptionsStatusBarFrame.Visible := (Level = 0) and (TreeNode.Index = 7);

    FOptionsDateFormatFrame.Visible := (ParentIndex = 8) and (Level = 1) and (TreeNode.Index = 0);
    FOptionsTimeFormatFrame.Visible := (ParentIndex = 8) and (Level = 1) and (TreeNode.Index = 1);

    FOptionsSQLSelectColumnListFrame.Visible := (ParentIndex = 9) and (Level = 2) and (TreeNode.Index = 0);
    FOptionsSQLSelectSubqueryFrame.Visible := (ParentIndex = 9) and (Level = 2) and (TreeNode.Index = 1);
  end;
end;

procedure TOptionsForm.PutData;
begin
  FOptionsEditorOptionsFrame.PutData(FOptionsContainer);
  FOptionsEditorFontFrame.PutData(FOptionsContainer);
  FOptionsEditorLeftMarginFrame.PutData(FOptionsContainer);
  FOptionsEditorRightMarginFrame.PutData(FOptionsContainer);
  FOptionsEditorSearchFrame.PutData(FOptionsContainer);
  FOptionsEditorTabsFrame.PutData(FOptionsContainer);
  FOptionsEditorCompletionProposalFrame.PutData(FOptionsContainer);
  FOptionsEditorToolBarFrame.PutData(FOptionsContainer);
  FOptionsConnectionTabsFrame.PutData(FOptionsContainer);
  FOptionsOutputTabsFrame.PutData(FOptionsContainer);
  FOptionsCompareFrame.PutData(FOptionsContainer);
  FOptionsPrintFrame.PutData(FOptionsContainer);
  FOptionsMainMenuFrame.PutData(FOptionsContainer);
  FOptionsOutputFrame.PutData(FOptionsContainer);
  FOptionsDBMSOutputFrame.PutData(FOptionsContainer);
  FOptionsDateFormatFrame.PutData(FOptionsContainer);
  FOptionsTimeFormatFrame.PutData(FOptionsContainer);
  FOptionsSchemaBrowserFrame.PutData(FOptionsContainer);
  FOptionsObjectFrameFrame.PutData(FOptionsContainer);
  FOptionsStatusBarFrame.PutData(FOptionsContainer);
  FOptionsSQLSelectColumnListFrame.PutData(FSQLFormatterOptionsWrapper);
  FOptionsSQLSelectSubqueryFrame.PutData(FSQLFormatterOptionsWrapper);
end;

procedure TOptionsForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  WriteIniFile;
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
  FOptionsEditorOptionsFrame := TOptionsEditorOptionsFrame.Create(OptionsPanel);
  FOptionsEditorOptionsFrame.Parent := OptionsPanel;
  FOptionsEditorFontFrame := TOptionsEditorFontFrame.Create(OptionsPanel);
  FOptionsEditorFontFrame.Parent := OptionsPanel;
  FOptionsEditorLeftMarginFrame := TOptionsEditorLeftMarginFrame.Create(OptionsPanel);
  FOptionsEditorLeftMarginFrame.Parent := OptionsPanel;
  FOptionsEditorRightMarginFrame := TOptionsEditorRightMarginFrame.Create(OptionsPanel);
  FOptionsEditorRightMarginFrame.Parent := OptionsPanel;
  FOptionsEditorSearchFrame := TOptionsEditorSearchFrame.Create(OptionsPanel);
  FOptionsEditorSearchFrame.Parent := OptionsPanel;
  FOptionsEditorTabsFrame := TOptionsEditorTabsFrame.Create(OptionsPanel);
  FOptionsEditorTabsFrame.Parent := OptionsPanel;
  FOptionsEditorToolBarFrame := TOptionsEditorToolBarFrame.Create(OptionsPanel);
  FOptionsEditorToolBarFrame.Parent := OptionsPanel;
  FOptionsEditorCompletionProposalFrame := TOptionsEditorCompletionProposalFrame.Create(OptionsPanel);
  FOptionsEditorCompletionProposalFrame.Parent := OptionsPanel;
  FOptionsMainMenuFrame := TOptionsMainMenuFrame.Create(OptionsPanel);
  FOptionsMainMenuFrame.Parent := OptionsPanel;
  FOptionsOutputFrame := TOptionsOutputFrame.Create(OptionsPanel);
  FOptionsOutputFrame.Parent := OptionsPanel;
  FOptionsOutputTabsFrame := TOptionsOutputTabsFrame.Create(OptionsPanel);
  FOptionsOutputTabsFrame.Parent := OptionsPanel;
  FOptionsDBMSOutputFrame := TOptionsDBMSOutputFrame.Create(OptionsPanel);
  FOptionsDBMSOutputFrame.Parent := OptionsPanel;
  FOptionsSchemaBrowserFrame := TOptionsSchemaBrowserFrame.Create(OptionsPanel);
  FOptionsSchemaBrowserFrame.Parent := OptionsPanel;
  FOptionsObjectFrameFrame := TOptionsObjectFrameFrame.Create(OptionsPanel);
  FOptionsObjectFrameFrame.Parent := OptionsPanel;
  FOptionsDateFormatFrame := TOptionsDateFormatFrame.Create(OptionsPanel);
  FOptionsDateFormatFrame.Parent := OptionsPanel;
  FOptionsTimeFormatFrame := TOptionsTimeFormatFrame.Create(OptionsPanel);
  FOptionsTimeFormatFrame.Parent := OptionsPanel;
  FOptionsConnectionTabsFrame := TOptionsConnectionTabsFrame.Create(OptionsPanel);
  FOptionsConnectionTabsFrame.Parent := OptionsPanel;
  FOptionsCompareFrame := TOptionsCompareFrame.Create(OptionsPanel);
  FOptionsCompareFrame.Parent := OptionsPanel;
  FOptionsPrintFrame := TOptionsPrintFrame.Create(OptionsPanel);
  FOptionsPrintFrame.Parent := OptionsPanel;
  FOptionsStatusBarFrame := TOptionsStatusBarFrame.Create(OptionsPanel);
  FOptionsStatusBarFrame.Parent := OptionsPanel;
  FOptionsSQLSelectColumnListFrame := TOptionsSQLSelectColumnListFrame.Create(OptionsPanel);
  FOptionsSQLSelectColumnListFrame.Parent := OptionsPanel;
  FOptionsSQLSelectSubqueryFrame := TOptionsSQLSelectSubqueryFrame.Create(OptionsPanel);
  FOptionsSQLSelectSubqueryFrame.Parent := OptionsPanel;

  FSQLFormatterOptionsWrapper := TSQLFormatterOptionsWrapper.Create;
end;

end.
