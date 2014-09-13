unit TNSNamesEditor;

interface

uses
  Winapi.Windows, Winapi.CommDlg, System.SysUtils, System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, SynEdit,
  Vcl.ExtCtrls, VirtualTrees, Vcl.ComCtrls, Vcl.ToolWin, BCControls.ToolBar, Vcl.ImgList, BCControls.ImageList,
  Vcl.ActnList, Vcl.StdCtrls, BCControls.Edit, Vcl.Buttons, Vcl.AppEvnts, SynEditPrint, SynEditSearch,
  SynEditMiscClasses, SynEditTypes, BCControls.CheckBox, SynEditRegexSearch, System.Actions, JvExStdCtrls, JvCheckBox;

type
  PObjectNodeRec = ^TObjectNodeRec;
  TObjectNodeRec = record
    Level: Byte;
    Index: Integer;
    NodeText: ShortString;
    ImageIndex: Byte;
  end;

  TTNSNamesEditorForm = class(TForm)
    ButtonPanel: TPanel;
    Bevel7: TBevel;
    OpenToolBar: TBCToolBar;
    FirstToolButton: TToolButton;
    SaveToolBar: TBCToolBar;
    ZoomToolButton: TToolButton;
    Panel1: TPanel;
    StatusBar: TStatusBar;
    VirtualDrawTree: TVirtualDrawTree;
    Panel2: TPanel;
    VerticalSplitter: TSplitter;
    Bevel1: TBevel;
    PrintToolBar: TBCToolBar;
    ToolButton1: TToolButton;
    ImageList: TBCImageList;
    ActionList: TActionList;
    FileOpenAction: TAction;
    ToolButton2: TToolButton;
    FileSaveAction: TAction;
    BookmarkImagesList: TBCImageList;
    FileSaveAsAction: TAction;
    FilePrintAction: TAction;
    FilePrintPreviewAction: TAction;
    ToolButton3: TToolButton;
    Bevel2: TBevel;
    BCToolBar1: TBCToolBar;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    EditIncreaseIndentAction: TAction;
    EditDecreaseIndentAction: TAction;
    Bevel3: TBevel;
    BCToolBar2: TBCToolBar;
    ToolButton6: TToolButton;
    EditToggleCaseAction: TAction;
    Bevel4: TBevel;
    BCToolBar3: TBCToolBar;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    EditUndoAction: TAction;
    EditRedoAction: TAction;
    Bevel5: TBevel;
    BCToolBar4: TBCToolBar;
    ToolButton9: TToolButton;
    ToolButton10: TToolButton;
    ToolButton11: TToolButton;
    ToolButton12: TToolButton;
    ApplicationEvents: TApplicationEvents;
    ViewWordWrapAction: TAction;
    ViewLineNumbersAction: TAction;
    ViewSpecialCharsAction: TAction;
    ViewSelectionModeAction: TAction;
    SynEditSearch: TSynEditSearch;
    SynEditPrint: TSynEditPrint;
    SearchActionList: TActionList;
    SearchCloseAction: TAction;
    SearchFindNextAction: TAction;
    SearchFindPreviousAction: TAction;
    SearchClearAction: TAction;
    SearchAction: TAction;
    SearchPanel: TPanel;
    CaseSensitiveLabel: TLabel;
    WholeWordsOnlyLabel: TLabel;
    RegularExpressionLabel: TLabel;
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
    Panel3: TPanel;
    WholeWordsCheckBox: TBCCheckBox;
    Panel4: TPanel;
    RegularExpressionCheckBox: TBCCheckBox;
    Panel5: TPanel;
    SynEdit: TSynEdit;
    SynEditRegexSearch: TSynEditRegexSearch;
    procedure ApplicationEventsHint(Sender: TObject);
    procedure ApplicationEventsMessage(var Msg: tagMSG; var Handled: Boolean);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure VirtualDrawTreeDrawNode(Sender: TBaseVirtualTree; const PaintInfo: TVTPaintInfo);
    procedure VirtualDrawTreeFreeNode(Sender: TBaseVirtualTree; Node: PVirtualNode);
    procedure VirtualDrawTreeGetImageIndex(Sender: TBaseVirtualTree; Node: PVirtualNode;
      Kind: TVTImageKind; Column: TColumnIndex; var Ghosted: Boolean; var ImageIndex: Integer);
    procedure VirtualDrawTreeGetNodeWidth(Sender: TBaseVirtualTree; HintCanvas: TCanvas;
      Node: PVirtualNode; Column: TColumnIndex; var NodeWidth: Integer);
    procedure VirtualDrawTreeInitChildren(Sender: TBaseVirtualTree; Node: PVirtualNode;
      var ChildCount: Cardinal);
    procedure VirtualDrawTreeInitNode(Sender: TBaseVirtualTree; ParentNode, Node: PVirtualNode;
      var InitialStates: TVirtualNodeInitStates);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure VirtualDrawTreeCompareNodes(Sender: TBaseVirtualTree; Node1, Node2: PVirtualNode;
      Column: TColumnIndex; var Result: Integer);
    procedure VirtualDrawTreeClick(Sender: TObject);
    procedure FileOpenActionExecute(Sender: TObject);
    procedure FileSaveActionExecute(Sender: TObject);
    procedure FileSaveAsActionExecute(Sender: TObject);
    procedure FilePrintActionExecute(Sender: TObject);
    procedure FilePrintPreviewActionExecute(Sender: TObject);
    procedure EditIncreaseIndentActionExecute(Sender: TObject);
    procedure EditDecreaseIndentActionExecute(Sender: TObject);
    procedure EditToggleCaseActionExecute(Sender: TObject);
    procedure EditUndoActionExecute(Sender: TObject);
    procedure EditRedoActionExecute(Sender: TObject);
    procedure SynEditChange(Sender: TObject);
    procedure ViewWordWrapActionExecute(Sender: TObject);
    procedure ViewLineNumbersActionExecute(Sender: TObject);
    procedure ViewSpecialCharsActionExecute(Sender: TObject);
    procedure ViewSelectionModeActionExecute(Sender: TObject);
    procedure SynEditKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure SearchCloseActionExecute(Sender: TObject);
    procedure SearchFindNextActionExecute(Sender: TObject);
    procedure SearchFindPreviousActionExecute(Sender: TObject);
    procedure SearchClearActionExecute(Sender: TObject);
    procedure SearchForEditChange(Sender: TObject);
    procedure SearchActionExecute(Sender: TObject);
  private
    { Private declarations }
    FTNSNamesFileName: string;
    procedure LoadTNSNames(FileName: string);
    procedure AddTreeNode(Index: Integer; NodeText: string);
    procedure ReadIniFile;
    procedure WriteIniFile;
    procedure Save(ShowDialog: Boolean);
    procedure InitializeSynEditPrint;
    function GetCaption: string;
    function SearchOptions(IncludeBackwards: Boolean): TSynSearchOptions;
    procedure DoSearch;
    procedure Search;
    procedure FindNext;
    procedure FindPrevious;
    function GetCaretInfo: string;
    function GetModifiedInfo: string;
  public
    { Public declarations }
    procedure Open;
  end;

function TNSNamesEditorForm: TTNSNamesEditorForm;

implementation

{$R *.dfm}

uses
  System.RegularExpressions, Vcl.Themes, BigIni, BCCommon.StyleUtils, OraServices, OraCall,
  BCForms.PrintPreview, SynEditKeyCmds, BCCommon.Dialogs, BCCommon.LanguageStrings, BCCommon.OptionsContainer,
  BCCommon.FileUtils, BCCommon.Lib;

const
  FORM_CAPTION = 'TNSNames Editor - [%s]';
  REGEX_PATTERN = '[\n][\s]*[^\(][a-zA-Z0-9._-]+[\s]*';

var
  FTNSNamesEditorForm: TTNSNamesEditorForm;

function TNSNamesEditorForm: TTNSNamesEditorForm;
begin
  if not Assigned(FTNSNamesEditorForm) then
    Application.CreateForm(TTNSNamesEditorForm, FTNSNamesEditorForm);
  Result := FTNSNamesEditorForm;
end;

procedure TTNSNamesEditorForm.ReadIniFile;
begin
  with TBigIniFile.Create(GetINIFilename) do
  try
    { Size }
    Width := ReadInteger('TNSNamesEditorSize', 'Width', Round(Screen.Width * 0.5));
    Height := ReadInteger('TNSNamesEditorSize', 'Height', Round(Screen.Height * 0.5));
    { Position }
    Left := ReadInteger('TNSNamesEditorPosition', 'Left', (Screen.Width - Width) div 2);
    Top := ReadInteger('TNSNamesEditorPosition', 'Top', (Screen.Height - Height) div 2);
    { Check if the form is outside the workarea }
    Left := SetFormInsideWorkArea(Left, Width);
    ViewWordWrapAction.Checked := OptionsContainer.EnableWordWrap;
    ViewLineNumbersAction.Checked := OptionsContainer.EnableLineNumbers;
    ViewSpecialCharsAction.Checked := OptionsContainer.EnableSpecialChars;
    ViewSelectionModeAction.Checked := OptionsContainer.EnableSelectionMode;

   { ViewWordWrapAction.Checked := ReadBool('Options', 'EnableWordWrap', False);
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
      ViewSelectionModeAction.Execute; }
  finally
    Free;
  end;
end;

procedure TTNSNamesEditorForm.WriteIniFile;
begin
  if Windowstate = wsNormal then
  with TBigIniFile.Create(GetINIFilename) do
  try
    { Position }
    WriteInteger('TNSNamesEditorPosition', 'Left', Left);
    WriteInteger('TNSNamesEditorPosition', 'Top', Top);
    { Size }
    WriteInteger('TNSNamesEditorSize', 'Width', Width);
    WriteInteger('TNSNamesEditorSize', 'Height', Height);
  finally
    Free;
  end;
end;

procedure TTNSNamesEditorForm.ApplicationEventsHint(Sender: TObject);
begin
  StatusBar.Panels[3].Text := Application.Hint;
end;

function TTNSNamesEditorForm.GetCaretInfo: string;
begin
  Result := Format('%d: %d', [SynEdit.CaretY, SynEdit.CaretX]);
end;

function TTNSNamesEditorForm.GetModifiedInfo: string;
begin
  Result := '';
  if SynEdit.Modified then
    Result := 'Modified';
end;

procedure TTNSNamesEditorForm.ApplicationEventsMessage(var Msg: tagMSG; var Handled: Boolean);
var
  InfoText: string;
  KeyState: TKeyboardState;
begin
  FileSaveAction.Enabled := SynEdit.Modified;
  EditIncreaseIndentAction.Enabled := SynEdit.SelAvail;
  EditDecreaseIndentAction.Enabled := EditIncreaseIndentAction.Enabled;
  EditToggleCaseAction.Enabled := EditIncreaseIndentAction.Enabled;
  EditUndoAction.Enabled := SynEdit.CanUndo;
  EditRedoAction.Enabled := SynEdit.CanRedo;

  InfoText := GetCaretInfo;
  if StatusBar.Panels[0].Text <> InfoText then
    StatusBar.Panels[0].Text := InfoText;
  InfoText := GetModifiedInfo;
  if StatusBar.Panels[2].Text <> InfoText then
    StatusBar.Panels[2].Text := InfoText;

  GetKeyboardState(KeyState);
  if KeyState[VK_INSERT] = 0 then
    if StatusBar.Panels[1].Text <> 'Insert' then
      StatusBar.Panels[1].Text := 'Insert';
  if KeyState[VK_INSERT] = 1 then
    if StatusBar.Panels[1].Text <> 'Overwrite' then
      StatusBar.Panels[1].Text := 'Overwrite'
end;

procedure TTNSNamesEditorForm.EditDecreaseIndentActionExecute(Sender: TObject);
begin
  SynEdit.ExecuteCommand(ecBlockIndent, 'U', nil);
end;

procedure TTNSNamesEditorForm.EditIncreaseIndentActionExecute(Sender: TObject);
begin
  SynEdit.ExecuteCommand(ecBlockIndent, 'I', nil);
end;

procedure TTNSNamesEditorForm.EditRedoActionExecute(Sender: TObject);
begin
  SynEdit.Redo;
end;

procedure TTNSNamesEditorForm.EditToggleCaseActionExecute(Sender: TObject);
begin
  SynEdit.ExecuteCommand(ecToggleCaseBlock, 'C', nil);
end;

function TTNSNamesEditorForm.GetCaption: string;
begin
  Result := Format(FORM_CAPTION, [FTNSNamesFileName]);
end;

procedure TTNSNamesEditorForm.EditUndoActionExecute(Sender: TObject);
begin
  SynEdit.Undo;
  if SynEdit.UndoList.ItemCount = 0 then
  begin
    SynEdit.Modified := False; //PageControl.ActivePage.ImageIndex := SAVED_IMAGEINDEX
    if Pos('~', FTNSNamesFileName) = Length(FTNSNamesFileName) then
      FTNSNamesFileName := System.Copy(FTNSNamesFileName, 0, Length(FTNSNamesFileName) - 1);
    Caption := GetCaption;
  end;
end;

procedure TTNSNamesEditorForm.FileOpenActionExecute(Sender: TObject);
begin
  if BCCommon.Dialogs.OpenFiles(Handle, '', Format('%s'#0'*.*'#0, [LanguageDataModule.GetConstant('AllFiles')]) +
    Trim(StringReplace(LanguageDataModule.GetFileTypes('SQLNet'), '|', #0, [rfReplaceAll])) + #0#0, LanguageDataModule.GetConstant('Open')) then
  begin
    Application.ProcessMessages; { style fix }
    LoadTNSNames(BCCommon.Dialogs.Files[0])
  end;
end;

procedure TTNSNamesEditorForm.InitializeSynEditPrint;
begin
  with SynEditPrint.Header do
  begin
    Clear;
    Add(FTNSNamesFileName, nil, taLeftJustify, 1);
    Add('Page: $PAGENUM$ of $PAGECOUNT$', nil, taRightJustify, 1);
  end;
  with SynEditPrint.Footer do
  begin
    Clear;
    Add('Printed by OraBone', nil, taLeftJustify, 1);
    Add('$DATE$ $TIME$', nil, taRightJustify, 1);
  end;
  SynEditPrint.SynEdit := SynEdit;
  SynEditPrint.Title := ExtractFileName(FTNSNamesFileName);
end;

procedure TTNSNamesEditorForm.FilePrintActionExecute(Sender: TObject);
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

procedure TTNSNamesEditorForm.FilePrintPreviewActionExecute(Sender: TObject);
begin
  InitializeSynEditPrint;
  with PrintPreviewDialog do
  begin
    SynEditPrintPreview.SynEditPrint := SynEditPrint;
    ShowModal;
  end;
end;

procedure TTNSNamesEditorForm.Save(ShowDialog: Boolean);
var
  AFileName: string;
  FilterIndex: Cardinal;
begin
  AFileName := FTNSNamesFileName;
  if Pos('~', FTNSNamesFileName) = Length(FTNSNamesFileName) then
    AFileName := System.Copy(AFileName, 0, Length(AFileName) - 1);
  if ShowDialog then
  begin
    if BCCommon.Dialogs.SaveFile(Handle, ExtractFilePath(AFileName),
       Format('%s'#0'*.*'#0, [LanguageDataModule.GetConstant('AllFiles')]) +
       Trim(StringReplace(LanguageDataModule.GetFileTypes('SQLNet')
        , '|', #0, [rfReplaceAll])) + #0#0, LanguageDataModule.GetConstant('SaveAs'), FilterIndex, ExtractFileName(AFileName)) then
    begin
      Application.ProcessMessages; { style fix }
      AFileName := BCCommon.Dialogs.Files[0]
    end
    else
    begin
      SynEdit.SetFocus;
      Exit;
    end;
  end;
  SynEdit.Lines.SaveToFile(AFileName);
  SynEdit.UndoList.Clear;
  SynEdit.Modified := False;
  FTNSNamesFileName := AFileName;
  LoadTNSNames(FTNSNamesFileName);
  Caption := GetCaption;
end;

procedure TTNSNamesEditorForm.SynEditChange(Sender: TObject);
begin
  if Pos('~', FTNSNamesFileName) = 0 then
  begin
    FTNSNamesFileName := FTNSNamesFileName + '~';
    Caption := GetCaption;
    SynEdit.Repaint;
  end;
end;

procedure TTNSNamesEditorForm.SynEditKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Shift = [ssAlt] then
    if SynEdit.SelectionMode = smNormal then
      SynEdit.SelectionMode := smColumn;
end;

procedure TTNSNamesEditorForm.FileSaveActionExecute(Sender: TObject);
begin
  Save(False);
end;

procedure TTNSNamesEditorForm.FileSaveAsActionExecute(Sender: TObject);
begin
  Save(True);
  Repaint;
end;

procedure TTNSNamesEditorForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  WriteIniFile;
  Action := caFree;
end;

procedure TTNSNamesEditorForm.FormCreate(Sender: TObject);
begin
  StatusBar.Font.Name := 'Tahoma';
  StatusBar.Font.Size := 8;
  VirtualDrawTree.NodeDataSize := SizeOf(TObjectNodeRec);
end;

procedure TTNSNamesEditorForm.FormDestroy(Sender: TObject);
begin
  FTNSNamesEditorForm := nil;
end;

procedure TTNSNamesEditorForm.AddTreeNode(Index: Integer; NodeText: string);
var
  RootNode: PVirtualNode;
  Data: PObjectNodeRec;
begin
  RootNode := VirtualDrawTree.AddChild(nil);
  Data := VirtualDrawTree.GetNodeData(RootNode);
  Data.Index := Index;
  Data.NodeText := ShortString(Trim(NodeText));
  Data.ImageIndex := 16;
  Data.Level := 0;
end;

procedure TTNSNamesEditorForm.LoadTNSNames(FileName: string);
var
  i: Integer;
  s: string;
  RegEx: TRegEx;
  Match: TMatch;
begin
  if not FileExists(FileName) then
    Exit;
  FTNSNamesFileName := FileName;
  Caption := GetCaption;
  RegEx := TRegEx.Create(REGEX_PATTERN);
  SynEdit.Lines.LoadFromFile(FileName);
  Match := RegEx.Match(SynEdit.Text);
  VirtualDrawTree.BeginUpdate;
  VirtualDrawTree.Clear;
  while Match.Success do
  begin
    i := Match.Index;
    s := Trim(Match.Value);
    if Pos('#', s) <> 1 then
    begin
      while Copy(SynEdit.Text, i, Length(s)) <> s do
        Inc(i);
      AddTreeNode(i-1, s);
    end;
    Match := Match.NextMatch;
  end;
  VirtualDrawTree.Sort(nil, 0, sdAscending, False);
  VirtualDrawTree.EndUpdate;
end;

function GetTNSFileName: string;
var
  Enum: TOraServerEnumerator;
  OracleHome: TOracleHome;
begin
  (*if not LoadedOCI then
  try
    DetectOCI; // to show homes info
  except
    { silence }
  end;*)
  Enum := TOraServerEnumerator.Create;
  OracleHome := TOracleHome.Create(nil);
  try
    Result := Enum.GetTNSFileName(OracleHome);
  finally
    OracleHome.Free;
  end;
  Enum.Free;
end;

procedure TTNSNamesEditorForm.Open;
begin
  ReadIniFile;
  OptionsContainer.AssignTo(SynEdit);
  UpdateMargin(SynEdit);
  LoadTNSNames(GetTNSFileName);
  Show;
end;

procedure TTNSNamesEditorForm.ViewSelectionModeActionExecute(Sender: TObject);
begin
  if SynEdit.SelectionMode = smColumn then
    SynEdit.SelectionMode := smNormal
  else
    SynEdit.SelectionMode := smColumn
end;

procedure TTNSNamesEditorForm.ViewLineNumbersActionExecute(Sender: TObject);
begin
  SynEdit.Gutter.ShowLineNumbers := not SynEdit.Gutter.ShowLineNumbers;
end;

procedure TTNSNamesEditorForm.ViewSpecialCharsActionExecute(Sender: TObject);
begin
  if eoShowSpecialChars in SynEdit.Options then
    SynEdit.Options := SynEdit.Options - [eoShowSpecialChars]
  else
    SynEdit.Options := SynEdit.Options + [eoShowSpecialChars];
end;

procedure TTNSNamesEditorForm.ViewWordWrapActionExecute(Sender: TObject);
begin
  SynEdit.WordWrap.Enabled := not SynEdit.WordWrap.Enabled;
end;

procedure TTNSNamesEditorForm.VirtualDrawTreeClick(Sender: TObject);
var
  Data: PObjectNodeRec;
begin
  if VirtualDrawTree.SelectedCount > 0 then
  begin
    Data := VirtualDrawTree.GetNodeData(VirtualDrawTree.GetFirstSelected);
    SynEdit.SelStart := Data.Index;
    SynEdit.SelEnd := Data.Index + Length(Data.NodeText);
  end;
end;

procedure TTNSNamesEditorForm.VirtualDrawTreeCompareNodes(Sender: TBaseVirtualTree; Node1,
  Node2: PVirtualNode; Column: TColumnIndex; var Result: Integer);
var
  Data1, Data2: PObjectNodeRec;
begin
  if Result = 0 then
  begin
    Data1 := VirtualDrawTree.GetNodeData(Node1);
    Data2 := VirtualDrawTree.GetNodeData(Node2);

    Result := -1;

    if not Assigned(Data1) or not Assigned(Data2) then
      Exit;

    Result := AnsiCompareText(string(Data1.NodeText), string(Data2.NodeText));
  end;
end;

procedure TTNSNamesEditorForm.VirtualDrawTreeDrawNode(Sender: TBaseVirtualTree;
  const PaintInfo: TVTPaintInfo);
var
  Data: PObjectNodeRec;
  S: string;
  R: TRect;
  LStyles: TCustomStyleServices;
  LDetails: TThemedElementDetails;
  LColor: TColor;
begin
  inherited;
  LStyles := StyleServices;
  with PaintInfo do
  begin
    Data := VirtualDrawTree.GetNodeData(Node);
    if not Assigned(Data) then
      Exit;

    if LStyles.Enabled and (vsSelected in PaintInfo.Node.States) then
    begin
      R := ContentRect;
      R.Right := R.Left + NodeWidth;

      LDetails := LStyles.GetElementDetails(tgCellSelected);
      LStyles.DrawElement(Canvas.Handle, LDetails, R);
    end;

    if not LStyles.GetElementColor(LStyles.GetElementDetails(tgCellNormal), ecTextColor, LColor) or  (LColor = clNone) then
      LColor := LStyles.GetSystemColor(clWindowText);
    //get and set the background color
    Canvas.Brush.Color := LStyles.GetStyleColor(scEdit);
    Canvas.Font.Color := LColor;

    if LStyles.Enabled and (vsSelected in PaintInfo.Node.States) then
    begin
       Canvas.Brush.Color := LStyles.GetSystemColor(clHighlight);
       Canvas.Font.Color := LStyles.GetStyleFontColor(sfMenuItemTextSelected);// GetSystemColor(clHighlightText);
    end
    else
    if not LStyles.Enabled and (vsSelected in PaintInfo.Node.States) then
    begin
      Canvas.Brush.Color := clHighlight;
      Canvas.Font.Color := clHighlightText;
    end;

    SetBKMode(Canvas.Handle, TRANSPARENT);

    R := ContentRect;
    InflateRect(R, -VirtualDrawTree.TextMargin, 0);
    Dec(R.Right);
    Dec(R.Bottom);

    S := String(Data.NodeText);

    if Length(S) > 0 then
    begin
      with R do
      begin
        if (NodeWidth - 2 * VirtualDrawTree.Margin) > (Right - Left) then
          S := ShortenString(Canvas.Handle, S, Right - Left);
      end;
      DrawTextW(Canvas.Handle, PWideChar(S), Length(S), R, DT_TOP or DT_LEFT or DT_VCENTER or DT_SINGLELINE);
    end;
  end;
end;

procedure TTNSNamesEditorForm.VirtualDrawTreeFreeNode(Sender: TBaseVirtualTree; Node: PVirtualNode);
var
  Data: PObjectNodeRec;
begin
  inherited;
  Data := VirtualDrawTree.GetNodeData(Node);
  if Assigned(Data) then
  begin
    Data^.Level := 0;
    Data^.Index := 0;
    Data^.NodeText := '';
    Data^.ImageIndex := 0;
  end;
end;

procedure TTNSNamesEditorForm.VirtualDrawTreeGetImageIndex(Sender: TBaseVirtualTree;
  Node: PVirtualNode; Kind: TVTImageKind; Column: TColumnIndex; var Ghosted: Boolean;
  var ImageIndex: Integer);
var
  Data: PObjectNodeRec;
begin
  if Kind in [ikNormal, ikSelected] then
  begin
    Data := VirtualDrawTree.GetNodeData(Node);

    ImageIndex := Data.ImageIndex;
  end;
end;

procedure TTNSNamesEditorForm.VirtualDrawTreeGetNodeWidth(Sender: TBaseVirtualTree;
  HintCanvas: TCanvas; Node: PVirtualNode; Column: TColumnIndex; var NodeWidth: Integer);
var
  S: string;
  Data: PObjectNodeRec;
begin
  Data := VirtualDrawTree.GetNodeData(Node);
  if Assigned(Data) then
  begin
    S := Trim(String(Data.NodeText));
    NodeWidth := VirtualDrawTree.Canvas.TextWidth(S) + 2 * VirtualDrawTree.TextMargin;
  end;
end;

procedure TTNSNamesEditorForm.VirtualDrawTreeInitChildren(Sender: TBaseVirtualTree;
  Node: PVirtualNode; var ChildCount: Cardinal);
var
  i, Index: Integer;
  Schema, Settings: string;
  Data: PObjectNodeRec;
  ChildNode: PVirtualNode;
  RegEx: TRegEx;
  Match: TMatch;
  procedure GetSetting(var Index: Integer; SettingName: string);
  begin
    if Pos(SettingName, Settings) <> 0 then
    begin
      ChildNode := VirtualDrawTree.AddChild(Node);
      Data := VirtualDrawTree.GetNodeData(ChildNode);
      Data.Level := 1;
      Index := Index + Pos(SettingName, Settings) - 1;
      Data.Index := Index;
      Settings := Copy(Settings, Pos(SettingName, Settings), Length(Settings));
      Data.NodeText := ShortString(Copy(Settings, 1, Pos(')', Settings) - 1));
      Data.ImageIndex := 17;
      Inc(i);
    end;
  end;
begin
  if Assigned(Node) then
  begin
    Data := VirtualDrawTree.GetNodeData(Node);
    Index := Pos(string(Data.NodeText), SynEdit.Text) - 1;
    Schema := Trim(string(Data.NodeText));
    Settings := Copy(SynEdit.Text, Pos(Schema, SynEdit.Text), Length(SynEdit.Text));

    RegEx := TRegEx.Create(REGEX_PATTERN);
    Match := RegEx.Match(Settings);
    if Match.Success then
      Settings := Copy(Settings, 1, Pos(Match.Value, Settings));
    i := 0;
    GetSetting(Index, 'PROTOCOL');
    GetSetting(Index, 'HOST');
    GetSetting(Index, 'PORT');
    GetSetting(Index, 'SID');
    GetSetting(Index, 'SERVICE_NAME');
    ChildCount := i;
  end;
end;

procedure TTNSNamesEditorForm.VirtualDrawTreeInitNode(Sender: TBaseVirtualTree; ParentNode,
  Node: PVirtualNode; var InitialStates: TVirtualNodeInitStates);
var
  Data: PObjectNodeRec;
begin
  inherited;
  Data := VirtualDrawTree.GetNodeData(Node);

  if Data.Level = 0 then
    Include(InitialStates, ivsHasChildren);
end;

function TTNSNamesEditorForm.SearchOptions(IncludeBackwards: Boolean): TSynSearchOptions;
begin
  Result := [];
  if IncludeBackwards then
    Include(Result, ssoBackwards);
  if CaseSensitiveCheckBox.Checked then
    Include(Result, ssoMatchCase);
  if WholeWordsCheckBox.Checked then
    Include(Result, ssoWholeWord);
end;

procedure TTNSNamesEditorForm.DoSearch;
var
  SynSearchOptions: TSynSearchOptions;
begin
  if SearchForEdit.Text = '' then
    Exit;

  if RegularExpressionCheckBox.Checked then
    SynEdit.SearchEngine := SynEditRegexSearch
  else
    SynEdit.SearchEngine := SynEditSearch;
  SynSearchOptions := SearchOptions(False);

  if SynEdit.SearchReplace(SearchForEdit.Text, '', SynSearchOptions) = 0 then
  begin
    MessageBeep(MB_ICONASTERISK);
    SynEdit.BlockBegin := SynEdit.BlockEnd;
    SynEdit.CaretXY := SynEdit.BlockBegin;
  end;
end;

procedure TTNSNamesEditorForm.Search;
begin
  SearchPanel.Visible := not SearchPanel.Visible;
  if SearchPanel.Visible then
  begin
    if SynEdit.SelAvail then
      SearchForEdit.Text := SynEdit.SelText;
    SearchForEdit.SetFocus;
    SynEdit.CaretXY := BufferCoord(0, 0);
    DoSearch;
  end;
end;

procedure TTNSNamesEditorForm.SearchActionExecute(Sender: TObject);
begin
  Search;
end;

procedure TTNSNamesEditorForm.SearchClearActionExecute(Sender: TObject);
begin
  SearchForEdit.Clear;
end;

procedure TTNSNamesEditorForm.SearchCloseActionExecute(Sender: TObject);
begin
  SearchPanel.Hide;
end;

procedure TTNSNamesEditorForm.FindNext;
var
  SynSearchOptions: TSynSearchOptions;
begin
  if SearchForEdit.Text = '' then
    Exit;
  SynSearchOptions := SearchOptions(False);

  if SynEdit.SearchReplace(SearchForEdit.Text, '', SynSearchOptions) = 0 then
  begin
    MessageBeep(MB_ICONASTERISK);
    SynEdit.BlockBegin := SynEdit.BlockEnd;
    SynEdit.CaretXY := SynEdit.BlockBegin;
  end;
end;

procedure TTNSNamesEditorForm.FindPrevious;
var
  SynSearchOptions: TSynSearchOptions;
begin
  if SearchForEdit.Text = '' then
    Exit;
  SynSearchOptions := SearchOptions(True);
  if SynEdit.SearchReplace(SearchForEdit.Text, '', SynSearchOptions) = 0 then
  begin
    MessageBeep(MB_ICONASTERISK);
    SynEdit.BlockEnd := SynEdit.BlockBegin;
    SynEdit.CaretXY := SynEdit.BlockBegin;
  end;
end;

procedure TTNSNamesEditorForm.SearchFindNextActionExecute(Sender: TObject);
begin
  FindNext;
end;

procedure TTNSNamesEditorForm.SearchFindPreviousActionExecute(Sender: TObject);
begin
  FindPrevious;
end;

procedure TTNSNamesEditorForm.SearchForEditChange(Sender: TObject);
begin
  SynEdit.CaretXY := BufferCoord(0, 0);
  SearchFindNextAction.Enabled := SearchForEdit.Text <> '';
  SearchFindPreviousAction.Enabled := SearchFindNextAction.Enabled;
  DoSearch;
end;

end.
