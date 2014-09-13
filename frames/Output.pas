unit Output;

interface

uses
  Winapi.Windows, System.SysUtils, System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons,
  Vcl.ComCtrls, Vcl.ActnList, Vcl.ImgList, Vcl.StdCtrls, JvExComCtrls, JvComCtrls, Vcl.Menus, Ora, Vcl.Grids,
  BCControls.PageControl, VirtualTrees, PlatformDefaultStyleActnCtrls, Vcl.ActnPopup,
  BCControls.DBGrid, BCControls.SynEdit, Data.DB, System.Actions, BCCommon.Images;

type
  TOpenAllEvent = procedure(var FileNames: TStrings);

  TOutputFrame = class(TFrame)
    ClearDBMSOutputAction: TAction;
    OutputActionList: TActionList;
    OutputCloseAction: TAction;
    OutputCloseAllAction: TAction;
    OutputCloseAllOtherPagesAction: TAction;
    PageControl: TBCPageControl;
    PopupActionBar: TPopupActionBar;
    CopyAllToClipboardAction: TAction;
    CopySelectedToClipboardAction: TAction;
    OpenAllAction: TAction;
    OpenSelectedAction: TAction;
    SelectAllAction: TAction;
    UnselectAllAction: TAction;
    procedure ClearDBMSOutputActionExecute(Sender: TObject);
    procedure DataDBGridMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure DataQueryAfterScroll(DataSet: TDataSet);
    procedure ListBoxKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure OutputCloseActionExecute(Sender: TObject);
    procedure OutputCloseAllActionExecute(Sender: TObject);
    procedure OutputCloseAllOtherPagesActionExecute(Sender: TObject);
    procedure PageControlChange(Sender: TObject);
    procedure TabsheetDblClick(Sender: TObject);
    procedure VirtualDrawTreeDrawNode(Sender: TBaseVirtualTree; const PaintInfo: TVTPaintInfo);
    procedure VirtualDrawTreeFreeNode(Sender: TBaseVirtualTree; Node: PVirtualNode);
    procedure VirtualDrawTreeGetNodeWidth(Sender: TBaseVirtualTree; HintCanvas: TCanvas; Node: PVirtualNode; Column: TColumnIndex; var NodeWidth: Integer);
    procedure PageControlCloseButtonClick(Sender: TObject);
    procedure PageControlDblClick(Sender: TObject);
    procedure CopyAllToClipboardActionExecute(Sender: TObject);
    procedure PageControlMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure CopySelectedToClipboardActionExecute(Sender: TObject);
    procedure OpenAllActionExecute(Sender: TObject);
    procedure OpenSelectedActionExecute(Sender: TObject);
    procedure SelectAllActionExecute(Sender: TObject);
    procedure UnselectAllActionExecute(Sender: TObject);
  private
    { Private declarations }
    FCancelSearch: Boolean;
    FProcessingTabSheet: Boolean;
    FProcessingPage: TTabSheet;
    FTabsheetDblClick: TNotifyEvent;
    FOpenAll: TOpenAllEvent;
    function CheckCancel: Boolean;
    function GetCount: Integer;
    function GetDataGrid(TabCaption: string): TBCDBGrid;
    function GetIsAnyOutput: Boolean;
    function GetIsEmpty: Boolean;
    function GetListBox(TabCaption: string): TListBox;
    function GetSynEdit(TabCaption: string): TBCSynEdit;
    function GetVirtualDrawTree: TVirtualDrawTree;
    function TabFound(TabCaption: string): Boolean;
    procedure CopyFilesToClipboard(OnlySelected: Boolean = False);
    procedure SetProcessingTabSheet(Value: Boolean);
    procedure SetRows(TabCaption: string);
    procedure SetTime(TabCaption: string; Time: string);
    procedure UpdatePopupActionBar;
    procedure CopyTreeToClipboard;
    procedure OpenFiles(OnlySelected: Boolean = False);
    procedure SetCheckedState(Value: TCheckState);
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    function GetActiveGrid: TBCDBGrid;
    function SelectedLine(var Filename: string; var Ln: LongWord; var Ch: LongWord): Boolean;
    procedure AddDBMSOutput(TabCaption: string; Text: string);
    procedure AddErrors(TabCaption: string; Text: string);
    procedure AddDataGrid(TabCaption: string; OraQuery: TOraQuery; Time: string);
    procedure AddPlanGrid(TabCaption: string; OraQuery: TOraQuery);
    procedure AddStrings(TabCaption: string; Text: string);
    function AddTreeView(TabCaption: string; AutoExpand: Boolean = False): TVirtualDrawTree;
    procedure AddTreeViewLine(OutputTreeView: TVirtualDrawTree; var Root: PVirtualNode; Filename: WideString; Ln, Ch: LongInt; Text: WideString; SearchString: ShortString = ''); //overload;
    procedure Clear;
    procedure ClearStrings(TabCaption: string);
    procedure CloseAllOtherTabSheets;
    procedure CloseAllTabSheets;
    procedure CloseTabSheet;
    procedure CopyToClipboard;
    procedure UpdateControls;
    procedure SetOptions;
    property Count: Integer read GetCount;
    property IsAnyOutput: Boolean read GetIsAnyOutput;
    property IsEmpty: Boolean read GetIsEmpty;
    property OnTabsheetDblClick: TNotifyEvent read FTabsheetDblClick write FTabsheetDblClick;
    property OnOpenAll: TOpenAllEvent read FOpenAll write FOpenAll;
    property ProcessingTabSheet: Boolean read FProcessingTabSheet write SetProcessingTabSheet;
    property CancelSearch: Boolean read FCancelSearch write FCancelSearch;
  end;

implementation

{$R *.dfm}

uses
  BCCommon.OptionsContainer, Lib, Vcl.Themes, BCCommon.StyleUtils, Vcl.ClipBrd, OutputDataGridTabSheet, Math,
  OutputPlanGridTabSheet, OutputListBoxTabSheet, OutputSynEditTabSheet, OutputTreeViewTabSheet,
  System.UITypes, BCCommon.Lib, BCCommon.LanguageStrings, BCCommon.Messages, Main, System.Types;

constructor TOutputFrame.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  { IDE can lose these, if the main form is not open }
  PopupActionBar.Images := ImagesDataModule.ImageList;
end;

procedure TOutputFrame.OpenAllActionExecute(Sender: TObject);
begin
  OpenFiles;
end;

procedure TOutputFrame.OpenSelectedActionExecute(Sender: TObject);
begin
  OpenFiles(True);
end;

procedure TOutputFrame.OutputCloseActionExecute(Sender: TObject);
begin
  CloseTabSheet;
end;

procedure TOutputFrame.TabsheetDblClick(Sender: TObject);
begin
  if Assigned(FTabsheetDblClick) then
    FTabsheetDblClick(Sender);
end;

procedure TOutputFrame.PageControlChange(Sender: TObject);
begin
  UpdatePopupActionBar;
end;

procedure TOutputFrame.PageControlCloseButtonClick(Sender: TObject);
begin
  OutputCloseAction.Execute;
end;

procedure TOutputFrame.PageControlDblClick(Sender: TObject);
begin
  if OptionsContainer.OutputCloseTabByDblClick then
    OutputCloseAction.Execute;
end;

procedure TOutputFrame.PageControlMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if (Button = mbMiddle) and OptionsContainer.OutputCloseTabByMiddleClick then
    OutputCloseAction.Execute;
end;

procedure TOutputFrame.UpdatePopupActionBar;
var
  MenuItem: TMenuItem;

  procedure AddMenuItem(Action: TAction; ACaption: TCaption = '');
  begin
    MenuItem := TMenuItem.Create(PopupActionBar);
    if Assigned(Action) then
      MenuItem.Action := Action;
    if ACaption <> '' then
      MenuItem.Caption := ACaption;
    PopupActionBar.Items.Add(MenuItem);
  end;

begin
  PopupActionBar.Items.Clear;
  AddMenuItem(OutputCloseAction);
  AddMenuItem(OutputCloseAllAction);
  AddMenuItem(OutputCloseAllOtherPagesAction);

  if Pos('Search for', PageControl.ActivePageCaption) = 1 then
  begin
    AddMenuItem(nil, '-');
    AddMenuItem(CopyAllToClipboardAction);
    AddMenuItem(CopySelectedToClipboardAction);
    AddMenuItem(nil, '-');
    AddMenuItem(OpenAllAction);
    AddMenuItem(OpenSelectedAction);
    AddMenuItem(nil, '-');
    AddMenuItem(SelectAllAction);
    AddMenuItem(UnselectAllAction);
  end;
  if Pos('Data:', PageControl.ActivePageCaption) = 1 then
  begin
    AddMenuItem(nil, '-');
    AddMenuItem(MainForm.DatabaseExportTableDataAction, '&Export Table Data...');
  end;
  if Pos('DBMS output:', PageControl.ActivePageCaption) = 1 then
  begin
    AddMenuItem(nil, '-');
    AddMenuItem(ClearDBMSOutputAction);
  end;
end;

procedure TOutputFrame.SetTime(TabCaption: string; Time: string);
var
  i: Integer;
  TabSheet: TTabSheet;
begin
  TabSheet := nil;
  for i := 0 to PageControl.PageCount - 1 do
    if Trim(PageControl.Pages[i].Caption) = TabCaption then
    begin
      TabSheet := PageControl.Pages[i];
      Break;
    end;
  if Assigned(TabSheet) then
    if TabSheet.ComponentCount <> 0 then
      if TabSheet.Components[0] is TOutputDataGridFrame then
        TOutputDataGridFrame(TabSheet.Components[0]).StatsTimeLabel.Caption := Format('Time elapsed: %s', [Time]);
end;

procedure TOutputFrame.SetRows(TabCaption: string);
var
  i: Integer;
  TabSheet: TTabSheet;
begin
  TabSheet := nil;

  for i := 0 to PageControl.PageCount - 1 do
    if Trim(PageControl.Pages[i].Caption) = TabCaption then
    begin
      TabSheet := PageControl.Pages[i];
      Break;
    end;

  if Assigned(TabSheet) then
    if TabSheet.ComponentCount <> 0 then
      if TabSheet.Components[0] is TOutputDataGridFrame then
      with TOutputDataGridFrame(TabSheet.Components[0]) do
      begin
        StatsRowsLabel.Caption := 'Row ' + IntToStr(Grid.DataSource.DataSet.RecNo) + ' of ' + IntToStr(Grid.DataSource.DataSet.RecordCount);
        if TOraQuery(Grid.DataSource.DataSet).Fetched then
          StatsRowsLabel.Caption := StatsRowsLabel.Caption + ' total'
        else
          StatsRowsLabel.Caption := StatsRowsLabel.Caption + ' fetched';
      end;
end;

function TOutputFrame.GetActiveGrid: TBCDBGrid;
begin
  Result := nil;

  if Assigned(PageControl.ActivePage) then
    if PageControl.ActivePage.ComponentCount <> 0 then
      if PageControl.ActivePage.Components[0] is TOutputDataGridFrame then
        Result := TOutputDataGridFrame(PageControl.ActivePage.Components[0]).Grid;
end;

procedure TOutputFrame.AddDataGrid(TabCaption: string; OraQuery: TOraQuery; Time: string);
var
  TabSheet: TTabSheet;
  Grid: TBCDBGrid;
  OutputGridFrame: TOutputDataGridFrame;
begin
  if TabFound(TabCaption) then
  begin
    SetTime(TabCaption, Time);
    SetRows(TabCaption);
    Grid := GetDataGrid(TabCaption);
    Lib.SetGridColumnWidths(Grid, True);
    UpdatePopupActionBar;
    Exit;
  end;

  TabSheet := TTabSheet.Create(PageControl);
  TabSheet.TabVisible := False;
  TabSheet.PageControl := PageControl;
  TabSheet.ImageIndex := IMAGE_INDEX_GRID; // data
  TabSheet.Caption := TabCaption;
  PageControl.ActivePage := TabSheet;

  OutputGridFrame := TOutputDataGridFrame.Create(TabSheet);
  with OutputGridFrame do
  begin
    Parent := TabSheet;
    Align := alClient;
    OutputGridFrame.Grid.Canvas.Font := Font;
    OnMouseDown := DataDBGridMouseDown;
    GridDataSource.DataSet := OraQuery;
  end;
  SetTime(TabCaption, Time);
  SetGridColumnWidths(OutputGridFrame.Grid, True);
  OraQuery.AfterScroll := DataQueryAfterScroll;
  DataQueryAfterScroll(OraQuery);
  TabSheet.TabVisible := True;
  UpdatePopupActionBar;
end;

procedure TOutputFrame.DataDBGridMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  { this fixes the bug when popup is popped from grid - it won't get the focus }
  if Button = mbRight then
    PopupActionBar.Popup(Mouse.CursorPos.X, Mouse.CursorPos.Y);
end;

procedure TOutputFrame.DataQueryAfterScroll(DataSet: TDataSet);
begin
  SetRows(PageControl.ActivePageCaption);
end;

procedure TOutputFrame.AddPlanGrid(TabCaption: string; OraQuery: TOraQuery);
var
  TabSheet: TTabSheet;
  OutputPlanGridFrame: TOutputPlanGridFrame;
begin
  if TabFound(TabCaption) then
  begin
    UpdatePopupActionBar;
    Exit;
  end;

  TabSheet := TTabSheet.Create(PageControl);
  TabSheet.TabVisible := False;
  TabSheet.PageControl := PageControl;
  TabSheet.ImageIndex := IMAGE_INDEX_PLAN;
  TabSheet.Caption := TabCaption;
  PageControl.ActivePage := TabSheet;

  OutputPlanGridFrame := TOutputPlanGridFrame.Create(TabSheet);
  with OutputPlanGridFrame do
  begin
    Parent := TabSheet;
    Align := alClient;
    GridDataSource.DataSet := OraQuery;
  end;
  TabSheet.TabVisible := True;
  UpdatePopupActionBar;
end;

procedure TOutputFrame.ClearStrings(TabCaption: string);
var
  ListBox: TListBox;
begin
  if TabFound(TabCaption) then
  begin
    ListBox := GetListBox(TabCaption);
    ListBox.Items.Clear;
  end;
end;

procedure TOutputFrame.AddStrings(TabCaption: string; Text: string);
var
  TabSheet: TTabSheet;
  ListBox: TListBox;
  OutputListBoxFrame: TOutputListBoxFrame;
begin
  if TabFound(TabCaption) then
  begin
    ListBox := GetListBox(TabCaption);
    ListBox.Items.Add(Text);
    Exit;
  end;
  TabSheet := TTabSheet.Create(PageControl);
  TabSheet.TabVisible := False;
  TabSheet.PageControl := PageControl;
  TabSheet.ImageIndex := IMAGE_INDEX_OUTPUT; // output
  TabSheet.Caption := TabCaption;
  PageControl.ActivePage := TabSheet;

  OutputListBoxFrame := TOutputListBoxFrame.Create(TabSheet);
  with OutputListBoxFrame do
  begin
    Parent := TabSheet;
    Align := alClient;
    ListBox.Items.Clear;
    ListBox.Items.Text := Text;
    OnKeyDown := ListBoxKeyDown;
  end;
  TabSheet.TabVisible := True;
  UpdatePopupActionBar;
end;

function TOutputFrame.GetListBox(TabCaption: string): TListBox;
var
  i: Integer;
  TabSheet: TTabSheet;
begin
  Result := nil;
  TabSheet := nil;

  for i := 0 to PageControl.PageCount - 1 do
    if Trim(PageControl.Pages[i].Caption) = TabCaption then
    begin
      TabSheet := PageControl.Pages[i];
      Break;
    end;

  if Assigned(TabSheet) then
    if TabSheet.ComponentCount <> 0 then
      if TabSheet.Components[0] is TOutputListBoxFrame then
        Result := TOutputListBoxFrame(TabSheet.Components[0]).ListBox;
end;

function TOutputFrame.GetDataGrid(TabCaption: string): TBCDBGrid;
var
  i: Integer;
  TabSheet: TTabSheet;
begin
  Result := nil;
  TabSheet := nil;

  for i := 0 to PageControl.PageCount - 1 do
    if Trim(PageControl.Pages[i].Caption) = TabCaption then
    begin
      TabSheet := PageControl.Pages[i];
      Break;
    end;

  if Assigned(TabSheet) then
    if TabSheet.ComponentCount <> 0 then
      if TabSheet.Components[0] is TOutputDataGridFrame then
        Result := TOutputDataGridFrame(TabSheet.Components[0]).Grid;
end;

function TOutputFrame.GetSynEdit(TabCaption: string): TBCSynEdit;
var
  i: Integer;
  TabSheet: TTabSheet;
begin
  Result := nil;
  TabSheet := nil;

  for i := 0 to PageControl.PageCount - 1 do
    if Trim(PageControl.Pages[i].Caption) = TabCaption then
    begin
      TabSheet := PageControl.Pages[i];
      Break;
    end;

  if Assigned(TabSheet) then
    if TabSheet.ComponentCount <> 0 then
      if TabSheet.Components[0] is TOutputSynEditFrame then
        Result := TOutputSynEditFrame(TabSheet.Components[0]).SynEdit;
end;

procedure TOutputFrame.ListBoxKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
var
  i: Integer;
begin
  if (ssCtrl in Shift) and (Key = 67) then
  begin
    Clipboard.AsText := '';
    for i := 0 to TListBox(Sender).Count - 1 do
      if TListBox(Sender).Selected[i] then
        Clipboard.AsText := Clipboard.AsText + TListBox(Sender).Items.Strings[i] + CHR_ENTER;
  end;
end;

procedure TOutputFrame.AddDBMSOutput(TabCaption: string; Text: string);
var
  TabSheet: TTabSheet;
  SynEdit: TBCSynEdit;
  OutputSynEditFrame: TOutputSynEditFrame;
begin
  if TabFound(TabCaption) then
  begin
    SynEdit := GetSynEdit(TabCaption);
    SynEdit.Text := SynEdit.Text + Text + CHR_ENTER;
    UpdatePopupActionBar;
    Exit;
  end;

  TabSheet := TTabSheet.Create(PageControl);
  TabSheet.TabVisible := False;
  TabSheet.PageControl := PageControl;
  TabSheet.ImageIndex := IMAGE_INDEX_OUTPUT; // output
  TabSheet.Caption := TabCaption;
  PageControl.ActivePage := TabSheet;

  { create a SynEdit }
  OutputSynEditFrame := TOutputSynEditFrame.Create(TabSheet);
  with OutputSynEditFrame do
  begin
    Parent := TabSheet;
    Align := alClient;
    UpdateMargin(SynEdit);
    UpdateSQLSynColors(SynSQLSyn);
    Application.ProcessMessages;
    SynEdit.Text := Text + CHR_ENTER;
  end;
  TabSheet.TabVisible := True;
  UpdatePopupActionBar;
end;

{ could use AddStrings but maybe some changes in future... }
procedure TOutputFrame.AddErrors(TabCaption: string; Text: string);
var
  TabSheet: TTabSheet;
  OutputListBoxFrame: TOutputListBoxFrame;
  ListBox: TListBox;
begin
  if TabFound(TabCaption) then
  begin
    ListBox := GetListBox(TabCaption);
    ListBox.Items.Text := Text;
    UpdatePopupActionBar;
    Exit;
  end;

  TabSheet := TTabSheet.Create(PageControl);
  TabSheet.TabVisible := False;
  TabSheet.PageControl := PageControl;
  TabSheet.ImageIndex := IMAGE_INDEX_ERRORS; // errors
  TabSheet.Caption := TabCaption;
  PageControl.ActivePage := TabSheet;

  OutputListBoxFrame := TOutputListBoxFrame.Create(TabSheet);
  with OutputListBoxFrame do
  begin
    Parent := TabSheet;
    Align := alClient;
    ListBox.Items.Clear;
    ListBox.Items.Text := Text;
    OnKeyDown := ListBoxKeyDown;
  end;
  TabSheet.TabVisible := True;
  UpdatePopupActionBar;
end;

function TOutputFrame.TabFound(TabCaption: string): Boolean;
var
  i: Integer;
begin
  Result := False;
  { check if there already is a tab with same name }
  for i := 0 to PageControl.PageCount - 1 do
    if Trim(PageControl.Pages[i].Caption) = TabCaption then
    begin
      PageControl.ActivePageIndex := i;
      Result := True;
      Break;
    end;
end;

function TOutputFrame.AddTreeView(TabCaption: string; AutoExpand: Boolean): TVirtualDrawTree;
var
  TabSheet: TTabSheet;
  OutputTreeViewFrame: TOutputTreeViewFrame;
begin
  { check if there already is a tab with same name }
  if TabFound(StringReplace(TabCaption, '&', '&&', [rfReplaceAll])) then
  begin
    Self.Clear;
    Result := GetVirtualDrawTree;
    UpdatePopupActionBar;
    Exit;
  end;

  TabSheet := TTabSheet.Create(PageControl);
  TabSheet.TabVisible := False;
  TabSheet.PageControl := PageControl;
  TabSheet.ImageIndex := IMAGE_INDEX_FIND_IN_FILES;
  TabSheet.Caption := StringReplace(TabCaption, '&', '&&', [rfReplaceAll]);
  PageControl.ActivePage := TabSheet;

  OutputTreeViewFrame := TOutputTreeViewFrame.Create(TabSheet);
  with OutputTreeViewFrame do
  begin
    Parent := TabSheet;
    Align := alClient;

    with VirtualDrawTree do
    begin
      if AutoExpand then
        TreeOptions.AutoOptions := TreeOptions.AutoOptions + [toAutoExpand];
      OnDrawNode := VirtualDrawTreeDrawNode;
      OnFreeNode := VirtualDrawTreeFreeNode;
      OnGetNodeWidth := VirtualDrawTreeGetNodeWidth;
      OnDblClick := TabsheetDblClick;
      NodeDataSize := SizeOf(TOutputRec);
    end;
    Result := VirtualDrawTree;
  end;
  Self.Clear;
  TabSheet.TabVisible := True;
  UpdatePopupActionBar;
end;

function TOutputFrame.GetVirtualDrawTree: TVirtualDrawTree;
begin
  Result := nil;
  if Assigned(PageControl.ActivePage) then
    if PageControl.ActivePage.ComponentCount <> 0 then
      if PageControl.ActivePage.Components[0] is TOutputTreeViewFrame then
        Result := TOutputTreeViewFrame(PageControl.ActivePage.Components[0]).VirtualDrawTree;
end;

procedure TOutputFrame.AddTreeViewLine(OutputTreeView: TVirtualDrawTree; var Root: PVirtualNode; Filename: WideString; Ln, Ch: LongInt; Text: WideString; SearchString: ShortString);
var
  Node: PVirtualNode;
  NodeData: POutputRec;
  S: WideString;
begin
  if not FProcessingTabSheet then
    Exit;
  if FCancelSearch then
    Exit;
  if not Assigned(OutputTreeView) then
    Exit;
  OutputTreeView.BeginUpdate;
  if not Assigned(Root) then
  begin
    Root := OutputTreeView.GetFirst;
    while Assigned(Root) do
    begin
      NodeData := OutputTreeView.GetNodeData(Root);
      if String(NodeData.Filename) = FileName then
        Break;
      Root := OutputTreeView.GetNext(Root);
    end;
  end;

  if not Assigned(Root) then
  begin
    Root := OutputTreeView.AddChild(nil);
    NodeData := OutputTreeView.GetNodeData(Root);
    NodeData.Level := 0;
    if Ln = -1 then
    begin
      NodeData.Level := 2;
      NodeData.Filename := Text;
    end
    else
      NodeData.Filename := Filename;
  end;
  if Ln <> -1  then
  begin
    Node := OutputTreeView.AddChild(Root);
    NodeData := OutputTreeView.GetNodeData(Node);
    NodeData.Level := 1;
    NodeData.Ln := Ln;
    NodeData.Ch := Ch;
    NodeData.SearchString := SearchString;
    NodeData.Filename := Filename;

    S := Text;

    if NodeData.SearchString <> '' then
    begin
      if Ch > 255 then
      begin
        NodeData.TextCh := 11;
        s := System.Copy(s, Ch - 10, System.Length(s));
      end
      else
        NodeData.TextCh := Ch;
      if System.Length(s) > 255 then
        s := Format('%s...', [System.Copy(s, 0, 251)]);
    end;

    if toAutoExpand in OutputTreeView.TreeOptions.AutoOptions then
      if not OutputTreeView.Expanded[Root] then
        OutputTreeView.FullExpand(Root);

    NodeData.Text := S;
    OutputTreeView.Tag := OutputTreeView.Tag + 1;
  end;
  OutputTreeView.EndUpdate;
  { fix for scrollbar resize bug }
  SetWindowPos(OutputTreeView.Handle, 0, 0, 0, OutputTreeView.Width, OutputTreeView.Height, SWP_DRAWFRAME);
  Application.ProcessMessages;
end;

procedure TOutputFrame.Clear;
var
  OutputTreeView: TVirtualDrawTree;
begin
  OutputTreeView := GetVirtualDrawTree;
  if Assigned(OutputTreeView) then
  begin
    OutputTreeView.Clear;
    OutputTreeView.Tag := 0;
  end;
end;

procedure TOutputFrame.ClearDBMSOutputActionExecute(Sender: TObject);
var
  SynEdit: TBCSynEdit;
begin
  SynEdit := GetSynEdit(PageControl.ActivePageCaption);
  SynEdit.Text := ''
end;

procedure TOutputFrame.SelectAllActionExecute(Sender: TObject);
begin
  SetCheckedState(csCheckedNormal);
end;

function TOutputFrame.SelectedLine(var Filename: string; var Ln: LongWord; var Ch: LongWord): Boolean;
var
  Node: PVirtualNode;
  NodeData: POutputRec;
  OutputTreeView: TVirtualDrawTree;
begin
  Result := False;
  OutputTreeView := GetVirtualDrawTree;
  if not Assigned(OutputTreeView) then
    Exit;

  Node := OutputTreeView.GetFirstSelected;
  NodeData := OutputTreeView.GetNodeData(Node);

  Result := Assigned(NodeData) and (NodeData.Text <> '');
  if Result then
  begin
    Filename := String(NodeData.Filename);
    Ln := NodeData.Ln;
    Ch := NodeData.Ch;
  end;
end;

function TOutputFrame.GetIsEmpty: Boolean;
var
  OutputTreeView: TVirtualDrawTree;
begin
  Result := True;
  if FCancelSearch then
    Exit;
  OutputTreeView := GetVirtualDrawTree;
  if not Assigned(OutputTreeView) then
    Exit;
  Result := OutputTreeView.GetFirst = nil;
end;

function TOutputFrame.GetCount: Integer;
var
  OutputTreeView: TVirtualDrawTree;
begin
  Result := 0;
  if FCancelSearch then
    Exit;
  OutputTreeView := GetVirtualDrawTree;
  if not Assigned(OutputTreeView) then
    Exit;
  Result := OutputTreeView.Tag;
end;

function TOutputFrame.GetIsAnyOutput: Boolean;
begin
  Result := False;
  if Assigned(PageControl) then
    Result := PageControl.PageCount <> 0;
end;

function TOutputFrame.CheckCancel: Boolean;
begin
  Result := False;
  Application.ProcessMessages;
  if FProcessingTabSheet then
    if FProcessingPage = PageControl.ActivePage then
    begin
      if AskYesOrNo(LanguageDataModule.GetYesOrNoMessage('CancelSearch')) then
        FCancelSearch := True
      else
        Result := True;
    end;
end;

procedure TOutputFrame.CloseTabSheet;
var
  ActivePageIndex: Integer;
begin
  if CheckCancel then
    Exit;
  if PageControl.PageCount > 0 then
  begin
    PageControl.TabClosed := True;
    Self.Clear;
    ActivePageIndex := PageControl.ActivePageIndex;
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

procedure TOutputFrame.CloseAllTabSheets;
var
  i, j: Integer;
begin
  if CheckCancel then
    Exit;
  j := PageControl.PageCount - 1;
  for i := j downto 0 do
    PageControl.Pages[i].Free;
end;

procedure TOutputFrame.OutputCloseAllActionExecute(Sender: TObject);
begin
  CloseAllTabSheets;
end;

procedure TOutputFrame.OutputCloseAllOtherPagesActionExecute(Sender: TObject);
begin
  CloseAllOtherTabSheets;
end;

procedure TOutputFrame.CloseAllOtherTabSheets;
var
  i, j: Integer;
begin
  if CheckCancel then
    Exit;
  PageControl.ActivePage.PageIndex := 0;
  j := PageControl.PageCount - 1;
  for i := j downto 1 do
    PageControl.Pages[i].Free;
end;

procedure TOutputFrame.SetProcessingTabSheet(Value: Boolean);
begin
  FProcessingTabSheet := Value;
  FProcessingPage := PageControl.ActivePage;
  FCancelSearch := False;
end;

procedure TOutputFrame.CopyToClipboard;
var
 Grid: TBCDBGrid;
begin
  Grid := GetDataGrid(PageControl.ActivePageCaption);
  if Assigned(Grid) then
    CopyDataFromDBGridToClipboard(Grid);
end;

procedure TOutputFrame.CopyTreeToClipboard;
var
  OutputTreeView: TVirtualDrawTree;
  Node, ChildNode: PVirtualNode;
  Data, ChildData: POutputRec;
  StringList: TStrings;
begin
  OutputTreeView := GetVirtualDrawTree;
  if Assigned(OutputTreeView) then
  begin
    StringList := TStringList.Create;
    try
      Node := OutputTreeView.GetFirst;
      while Assigned(Node) do
      begin
        Data := OutputTreeView.GetNodeData(Node);
        StringList.Add(Data.FileName);
        ChildNode := Node.FirstChild;
         while Assigned(ChildNode) do
         begin
           ChildData := OutputTreeView.GetNodeData(ChildNode);
           StringList.Add(System.SysUtils.Format('  %s (%d, %d): %s', [ExtractFilename(String(ChildData.Filename)),
             ChildData.Ln, ChildData.Ch, ChildData.Text]));
           ChildNode := ChildNode.NextSibling;
         end;
         Node := Node.NextSibling;
      end;
    finally
      Clipboard.AsText := StringList.Text;
      StringList.Free;
    end;
  end;
end;

procedure TOutputFrame.CopyAllToClipboardActionExecute(Sender: TObject);
begin
  CopyTreeToClipboard;
end;

procedure TOutputFrame.CopySelectedToClipboardActionExecute(Sender: TObject);
begin
  CopyFilesToClipboard(True);
end;

procedure TOutputFrame.VirtualDrawTreeDrawNode(Sender: TBaseVirtualTree;
  const PaintInfo: TVTPaintInfo);
var
  Data: POutputRec;
  S, Temp: UnicodeString;
  R: TRect;
  Format: Cardinal;
  LStyles: TCustomStyleServices;
  LDetails: TThemedElementDetails;
  LColor: TColor;
begin
  LStyles := StyleServices;
  with Sender as TVirtualDrawTree, PaintInfo do
  begin
    Data := Sender.GetNodeData(Node);

    if not Assigned(Data) then
      Exit;

    if LStyles.Enabled then
      Color := LStyles.GetStyleColor(scEdit);

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

    if Data.Level = 0 then
      Canvas.Font.Style := Canvas.Font.Style + [fsBold]
    else
      Canvas.Font.Style := Canvas.Font.Style - [fsBold];

    SetBKMode(Canvas.Handle, TRANSPARENT);

    R := ContentRect;
    InflateRect(R, -TextMargin, 0);
    Dec(R.Right);
    Dec(R.Bottom);

    if Data.Level = 0 then
      S := Data.Filename
    else
      S := String(Data.Text);

    if Length(S) > 0 then
    begin
      Format := DT_TOP or DT_LEFT or DT_VCENTER or DT_SINGLELINE;
      if (Data.Level = 0) or (Data.SearchString = '') then
      begin
        if Data.Level = 0 then
          S := System.SysUtils.Format('%s [%d]', [S, Node.ChildCount]);
        if Data.Level = 1 then
          S := System.SysUtils.Format('%s (%d, %d): ', [ExtractFilename(String(Data.Filename)), Data.Ln, Data.Ch]) + S;
        DrawText(Canvas.Handle, S, Length(S), R, Format)
      end
      else
      begin
        S := String(Data.Text);
        S := System.Copy(S, 0, Data.TextCh - 1);

        S := System.SysUtils.Format('%s (%d, %d): ', [ExtractFilename(String(Data.Filename)), Data.Ln, Data.Ch]) + S;

        DrawText(Canvas.Handle, S, Length(S), R, Format);
        S := StringReplace(S, Chr(9), '', [rfReplaceAll]); { replace tabs }
        R.Left := R.Left + Canvas.TextWidth(S);
        Canvas.Font.Color := clRed;
        S := Copy(String(Data.Text), Data.TextCh, Length(Data.SearchString));
        Temp := StringReplace(S, '&', '&&', [rfReplaceAll]);
        Canvas.Font.Style := Canvas.Font.Style + [fsBold];
        DrawText(Canvas.Handle, Temp, Length(Temp), R, Format);
        Canvas.Font.Color := LColor;
        R.Left := R.Left + Canvas.TextWidth(S);
        Canvas.Font.Style := Canvas.Font.Style - [fsBold];
        S := System.Copy(Data.Text, Integer(Data.TextCh) + Integer(System.Length(Data.SearchString)), Length(Data.Text));
        DrawText(Canvas.Handle, S, Length(S), R, Format);
      end;
    end;
  end;
end;

procedure TOutputFrame.VirtualDrawTreeGetNodeWidth(Sender: TBaseVirtualTree;
  HintCanvas: TCanvas; Node: PVirtualNode; Column: TColumnIndex; var NodeWidth: Integer);
var
  Data: POutputRec;
  AMargin, BoldWidth: Integer;
  S: string;
begin
  with Sender as TVirtualDrawTree do
  begin
    AMargin := TextMargin;
    Data := Sender.GetNodeData(Node);
    if Assigned(Data) then
    case Data.Level of
      0: begin
           Canvas.Font.Style := Canvas.Font.Style + [fsBold];
           NodeWidth := Canvas.TextWidth(Trim(Format('%s [%d]', [String(Data.FileName), Node.ChildCount]))) + 2 * AMargin;
         end;
      1: begin
           S := System.SysUtils.Format('%s (%d, %d): ', [ExtractFilename(String(Data.Filename)), Data.Ln, Data.Ch]);
           Canvas.Font.Style := Canvas.Font.Style + [fsBold];
           BoldWidth := Canvas.TextWidth(String(Data.SearchString));
           Canvas.Font.Style := Canvas.Font.Style - [fsBold];
           BoldWidth := BoldWidth - Canvas.TextWidth(string(Data.SearchString));
           NodeWidth := Canvas.TextWidth(Trim(S + String(Data.Text))) + 2 * AMargin + BoldWidth;
         end;
    end;
  end;
end;

procedure TOutputFrame.VirtualDrawTreeFreeNode(Sender: TBaseVirtualTree; Node: PVirtualNode);
var
  Data: POutputRec;
begin
  inherited;
  Data := Sender.GetNodeData(Node);
  Finalize(Data^);
end;

procedure TOutputFrame.SetOptions;
var
  i: Integer;
  VirtualDrawTree: TVirtualDrawTree;
begin
  PageControl.MultiLine := OptionsContainer.OutputMultiLine;
  PageControl.DoubleBuffered := OptionsContainer.OutputDoubleBuffered;
  PageControl.ShowCloseButton := OptionsContainer.OutputShowCloseButton;
  PageControl.RightClickSelect := OptionsContainer.OutputRightClickSelect;
  if OptionsContainer.OutputShowImage then
    PageControl.Images := ImagesDataModule.ImageList
  else
    PageControl.Images := nil;
  for i := 0 to PageControl.PageCount - 1 do
  begin
    if PageControl.Pages[i].Components[0] is TOutputTreeViewFrame then
    begin
      VirtualDrawTree := TOutputTreeViewFrame(PageControl.Pages[i].Components[0]).VirtualDrawTree;
      VirtualDrawTree.Indent := OptionsContainer.OutputIndent;
      if OptionsContainer.OutputShowTreeLines then
        VirtualDrawTree.TreeOptions.PaintOptions := VirtualDrawTree.TreeOptions.PaintOptions + [toShowTreeLines]
      else
        VirtualDrawTree.TreeOptions.PaintOptions := VirtualDrawTree.TreeOptions.PaintOptions - [toShowTreeLines]
    end;
  end;

  CopySelectedToClipboardAction.Visible := OptionsContainer.OutputShowCheckBox;
  OpenSelectedAction.Visible := OptionsContainer.OutputShowCheckBox;
  SelectAllAction.Visible := OptionsContainer.OutputShowCheckBox;
  UnselectAllAction.Visible := OptionsContainer.OutputShowCheckBox;
end;

procedure TOutputFrame.UnselectAllActionExecute(Sender: TObject);
begin
  SetCheckedState(csUncheckedNormal);
end;

procedure TOutputFrame.UpdateControls;
var
  i, Right: Integer;
  LStyles: TCustomStyleServices;
  PanelColor: TColor;
begin
  PageControl.DoubleBuffered := TStyleManager.ActiveStyle.Name = 'Windows';
  SetOptions;

  LStyles := StyleServices;
  PanelColor := clNone;
  if LStyles.Enabled then
    PanelColor := LStyles.GetStyleColor(scPanel);
  if TStyleManager.ActiveStyle.Name = STYLENAME_WINDOWS then
    Right := 3
  else
  if LStyles.Enabled and (GetRValue(PanelColor) + GetGValue(PanelColor) + GetBValue(PanelColor) > 500) then
    Right := 2
  else
    Right := 1;
  for i := 0 to PageControl.PageCount - 1 do
  begin
    if PageControl.Pages[i].ComponentCount > 0 then
    begin
      if PageControl.Pages[i].Components[0] is TOutputDataGridFrame then
      begin
        TOutputDataGridFrame(PageControl.Pages[i].Components[0]).GridPanel.Padding.Right := Right;
        TOutputDataGridFrame(PageControl.Pages[i].Components[0]).StatisticsPanel.Padding.Right := Right;;
      end
      else
      if PageControl.Pages[i].Components[0] is TOutputPlanGridFrame then
        TOutputPlanGridFrame(PageControl.Pages[i].Components[0]).GridPanel.Padding.Right := Right
      else
      if PageControl.Pages[i].Components[0] is TOutputListBoxFrame then
        TOutputListBoxFrame(PageControl.Pages[i].Components[0]).Panel.Padding.Right := Right
      else
      if PageControl.Pages[i].Components[0] is TOutputSynEditFrame then
        TOutputSynEditFrame(PageControl.Pages[i].Components[0]).Panel.Padding.Right := Right
      else
      if PageControl.Pages[i].Components[0] is TOutputTreeViewFrame then
        TOutputTreeViewFrame(PageControl.Pages[i].Components[0]).Panel.Padding.Right := Right
    end;
  end;
end;

procedure TOutputFrame.OpenFiles(OnlySelected: Boolean);
var
  FileNames: TStrings;

  procedure GetFileNames;
  var
    OutputTreeView: TVirtualDrawTree;
    Node: PVirtualNode;
    Data: POutputRec;
  begin
    OutputTreeView := GetVirtualDrawTree;
    Node := OutputTreeView.GetFirst;
    while Assigned(Node) do
    begin
      if not OnlySelected or OnlySelected and (OutputTreeView.CheckState[Node] = csCheckedNormal) then
      begin
        Data := OutputTreeView.GetNodeData(Node);
        FileNames.Add(Data.FileName);
      end;
      Node := Node.NextSibling;
    end;
  end;

begin
  if Assigned(FOpenAll) then
  begin
    FileNames := TStringList.Create;
    try
      GetFileNames;
      FOpenAll(FileNames);
    finally
      FileNames.Free;
    end;
  end;
end;

procedure TOutputFrame.SetCheckedState(Value: TCheckState);
var
  OutputTreeView: TVirtualDrawTree;
  Node: PVirtualNode;
begin
  OutputTreeView := GetVirtualDrawTree;
  Node := OutputTreeView.GetFirst;
  while Assigned(Node) do
  begin
    OutputTreeView.CheckState[Node] := Value;
    Node := Node.NextSibling;
  end;
end;

procedure TOutputFrame.CopyFilesToClipboard(OnlySelected: Boolean);
var
  OutputTreeView: TVirtualDrawTree;
  Node, ChildNode: PVirtualNode;
  Data, ChildData: POutputRec;
  StringList: TStrings;
begin
  OutputTreeView := GetVirtualDrawTree;
  if Assigned(OutputTreeView) then
  begin
    StringList := TStringList.Create;
    try
      Node := OutputTreeView.GetFirst;
      while Assigned(Node) do
      begin
        if not OnlySelected or OnlySelected and (OutputTreeView.CheckState[Node] = csCheckedNormal) then
        begin
          Data := OutputTreeView.GetNodeData(Node);
          StringList.Add(Data.FileName);
          ChildNode := Node.FirstChild;
          while Assigned(ChildNode) do
          begin
            ChildData := OutputTreeView.GetNodeData(ChildNode);
            StringList.Add(System.SysUtils.Format('  %s (%d, %d): %s', [ExtractFilename(String(ChildData.Filename)),
              ChildData.Ln, ChildData.Ch, ChildData.Text]));
            ChildNode := ChildNode.NextSibling;
          end;
        end;
        Node := Node.NextSibling;
      end;
    finally
      Clipboard.AsText := StringList.Text;
      StringList.Free;
    end;
  end;
end;

end.
