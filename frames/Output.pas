unit Output;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.ExtCtrls, Vcl.ComCtrls, JvExControls,
  JvLabel, Vcl.ActnList, Vcl.ImgList, Vcl.ToolWin, Vcl.StdCtrls, JvSpeedButton, JvExComCtrls,
  JvComCtrls, Vcl.Menus, Ora, Vcl.Grids, BCSynEdit, BCPageControl, BCPopupMenu, VirtualTrees,
  PlatformDefaultStyleActnCtrls, Vcl.ActnPopup, BCDBGrid, DBGridEh, Data.DB;

type
  TOutputFrame = class(TFrame)
    ClearDBMSOutputAction: TAction;
    ImageList: TImageList;
    OutputActionList: TActionList;
    OutputCloseAction: TAction;
    OutputCloseAllAction: TAction;
    OutputCloseAllOtherPagesAction: TAction;
    PageControl: TBCPageControl;
    PopupMenu: TBCPopupMenu;
    procedure ClearDBMSOutputActionExecute(Sender: TObject);
    procedure DataDBGridDrawDataCell(Sender: TObject; const Rect: TRect; Field: TField; State: TGridDrawState);
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
  private
    { Private declarations }
    FProcessingTabSheet: Boolean;
    FTabsheetDblClick: TNotifyEvent;
    function GetCount: Integer;
    function GetDataGrid(TabCaption: string): TBCDBGrid;
    function GetIsAnyOutput: Boolean;
    function GetIsEmpty: Boolean;
    function GetListBox(TabCaption: string): TListBox;
    function GetSynEdit(TabCaption: string): TBCSynEdit;
    function GetVirtualDrawTree: TVirtualDrawTree;
    function TabFound(TabCaption: string): Boolean;
    procedure SetProcessingTabSheet(Value: Boolean);
    procedure SetRows(TabCaption: string);
    procedure SetTime(TabCaption: string; Time: string);
    procedure UpdatePopupMenu;
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
    procedure AddTreeView(TabCaption: string; AutoExpand: Boolean = False);
    procedure AddTreeViewLine(Text: string); overload;
    procedure AddTreeViewLine(var Root: PVirtualNode; Filename: WideString; Ln, Ch: LongWord; Text: WideString; SearchString: ShortString = ''); overload;
    procedure Clear;
    procedure ClearStrings(TabCaption: string);
    procedure CloseAllOtherTabSheets;
    procedure CloseAllTabSheets;
    procedure CloseTabSheet;
    procedure CopyToClipboard;
    procedure UpdateControls;
    property Count: Integer read GetCount;
    property IsAnyOutput: Boolean read GetIsAnyOutput;
    property IsEmpty: Boolean read GetIsEmpty;
    property OnTabsheetDblClick: TNotifyEvent read FTabsheetDblClick write FTabsheetDblClick;
    property ProcessingTabSheet: Boolean read FProcessingTabSheet write SetProcessingTabSheet;
  end;

implementation

{$R *.dfm}

uses
  Main, Common, Options, Lib, Vcl.Themes, StyleHooks, ClipBrd, OutputDataGridTabSheet,
  OutputPlanGridTabSheet, OutputListBoxTabSheet, OutputSynEditTabSheet, OutputTreeViewTabSheet;

constructor TOutputFrame.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  { IDE can lose these, if the main form is not open }
  PopupMenu.Images := MainForm.MenuImageList;
  PageControl.MultiLine := OptionsContainer.MultiLine;
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
  UpdatePopupMenu;
end;

procedure TOutputFrame.UpdatePopupMenu;
var
  MenuItem: TMenuItem;
begin
  PopupMenu.Items.Clear;
  { close }
  MenuItem := TMenuItem.Create(PopupMenu);
  MenuItem.Action := OutputCloseAction;
  PopupMenu.Items.Add(MenuItem);
  { close all }
  MenuItem := TMenuItem.Create(PopupMenu);
  MenuItem.Action := OutputCloseAllAction;
  PopupMenu.Items.Add(MenuItem);
  { separator }
  MenuItem := TMenuItem.Create(PopupMenu);
  MenuItem.Caption := '-';
  PopupMenu.Items.Add(MenuItem);
  { close all other pages }
  MenuItem := TMenuItem.Create(PopupMenu);
  MenuItem.Action := OutputCloseAllOtherPagesAction;
  PopupMenu.Items.Add(MenuItem);
  if Pos('Data:', PageControl.ActivePage.Caption) <> 0 then
  begin
    MenuItem := TMenuItem.Create(PopupMenu);
    MenuItem.Caption := '-';
    PopupMenu.Items.Add(MenuItem);
    MenuItem := TMenuItem.Create(PopupMenu);
    MenuItem.Action := MainForm.DatabaseExportTableDataAction;
    MenuItem.Caption := '&Export Table Data...';
    PopupMenu.Items.Add(MenuItem);
  end;
  if Pos('DBMS output:', PageControl.ActivePage.Caption) <> 0 then
  begin
    MenuItem := TMenuItem.Create(PopupMenu);
    MenuItem.Caption := '-';
    PopupMenu.Items.Add(MenuItem);
    MenuItem := TMenuItem.Create(PopupMenu);
    MenuItem.Action := ClearDBMSOutputAction;
    PopupMenu.Items.Add(MenuItem);
  end;
end;

procedure TOutputFrame.SetTime(TabCaption: string; Time: string);
var
  i: Integer;
  TabSheet: TTabSheet;
begin
  TabSheet := nil;
  for i := 0 to PageControl.PageCount - 1 do
    if PageControl.Pages[i].Caption = TabCaption then
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
    if PageControl.Pages[i].Caption = TabCaption then
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
    UpdatePopupMenu;
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
  UpdatePopupMenu;
end;

procedure TOutputFrame.DataDBGridMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  { this fixes the bug when popup is popped from grid - it won't get the focus }
  if Button = mbRight then
    PopupMenu.Popup(Mouse.CursorPos.X, Mouse.CursorPos.Y);
end;

procedure TOutputFrame.DataQueryAfterScroll(DataSet: TDataSet);
var
  RecCount: Integer;
begin
  SetRows(PageControl.ActivePage.Caption);

  if Assigned(PageControl.ActivePage) then
    if PageControl.ActivePage.ComponentCount <> 0 then
      if PageControl.ActivePage.Components[0] is TOutputDataGridFrame then
      with TOutputDataGridFrame(PageControl.ActivePage.Components[0]) do
      begin
        RecCount := DataSet.RecordCount;
        if RecCount = 0 then
          StatisticsPanel.Caption := 'No rows'
        else
        begin
          StatisticsPanel.Caption := 'Row ' + IntToStr(DataSet.RecNo) + ' of ' + IntToStr(RecCount);
          if TOraQuery(DataSet).Fetched then
            StatisticsPanel.Caption := StatisticsPanel.Caption + ' total'
          else
            StatisticsPanel.Caption := StatisticsPanel.Caption + ' fetched';
        end;
      end;
end;

procedure TOutputFrame.DataDBGridDrawDataCell(Sender: TObject; const Rect: TRect;
  Field: TField; State: TGridDrawState);
begin
  GridDrawStringDataCell(Sender, Rect, Field);
end;

procedure TOutputFrame.AddPlanGrid(TabCaption: string; OraQuery: TOraQuery);
var
  TabSheet: TTabSheet;
  OutputPlanGridFrame: TOutputPlanGridFrame;
begin
  if TabFound(TabCaption) then
  begin
    UpdatePopupMenu;
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
  UpdatePopupMenu;
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
  UpdatePopupMenu;
end;

function TOutputFrame.GetListBox(TabCaption: string): TListBox;
var
  i: Integer;
  TabSheet: TTabSheet;
begin
  Result := nil;
  TabSheet := nil;

  for i := 0 to PageControl.PageCount - 1 do
    if PageControl.Pages[i].Caption = TabCaption then
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
    if PageControl.Pages[i].Caption = TabCaption then
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
    if PageControl.Pages[i].Caption = TabCaption then
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
    UpdatePopupMenu;
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
    UpdateGutter(SynEdit);
    UpdateSQLSynColors(SynSQLSyn);
    Application.ProcessMessages;
    SynEdit.Text := Text + CHR_ENTER;
  end;
  TabSheet.TabVisible := True;
  UpdatePopupMenu;
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
    UpdatePopupMenu;
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
  UpdatePopupMenu;
end;

function TOutputFrame.TabFound(TabCaption: string): Boolean;
var
  i: Integer;
begin
  Result := False;
  { check if there already is a tab with same name }
  for i := 0 to PageControl.PageCount - 1 do
    if PageControl.Pages[i].Caption = TabCaption then
    begin
      PageControl.ActivePageIndex := i;
      Result := True;
      Break;
    end;
end;

procedure TOutputFrame.AddTreeView(TabCaption: string; AutoExpand: Boolean); //(TabCaption: string);
var
  TabSheet: TTabSheet;
  OutputTreeViewFrame: TOutputTreeViewFrame;
begin
  { check if there already is a tab with same name }
  if TabFound(TabCaption) then
  begin
    Self.Clear;
    UpdatePopupMenu;
    Exit;
  end;

  TabSheet := TTabSheet.Create(PageControl);
  TabSheet.TabVisible := False;
  TabSheet.PageControl := PageControl;
  TabSheet.ImageIndex := IMAGE_INDEX_FIND_IN_FILES; { find in files }
  TabSheet.Caption := TabCaption;
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
  end;
  Self.Clear;
  TabSheet.TabVisible := True;
  UpdatePopupMenu;
end;

function TOutputFrame.GetVirtualDrawTree: TVirtualDrawTree;
begin
  Result := nil;
  if Assigned(PageControl.ActivePage) then
    if PageControl.ActivePage.ComponentCount <> 0 then
      if PageControl.ActivePage.Components[0] is TOutputTreeViewFrame then
        Result := TOutputTreeViewFrame(PageControl.ActivePage.Components[0]).VirtualDrawTree;
end;

procedure TOutputFrame.AddTreeViewLine(Text: string);
var
  Root: PVirtualNode;
begin
  AddTreeViewLine(Root, '', 0, 0, Text);
end;

procedure TOutputFrame.AddTreeViewLine(var Root: PVirtualNode; Filename: WideString; Ln, Ch: LongWord; Text: WideString; SearchString: ShortString);
var
  Node: PVirtualNode;
  NodeData: POutputRec;
  OutputTreeView: TVirtualDrawTree;
  S: WideString;
begin
  OutputTreeView := GetVirtualDrawTree;
  if not Assigned(OutputTreeView) then
    Exit;

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
    NodeData.Filename := Filename;
  end;

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
      s := System.Copy(s, 0, 251) + '...';
  end;

  if toAutoExpand in OutputTreeView.TreeOptions.AutoOptions then
    if not OutputTreeView.Expanded[Root] then
      OutputTreeView.FullExpand(Root);

  NodeData.Text := ShortString(S);
  OutputTreeView.Tag := OutputTreeView.Tag + 1;
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
  SynEdit := GetSynEdit(PageControl.ActivePage.Caption);
  SynEdit.Text := ''
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
  Result := False;
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

procedure TOutputFrame.CloseTabSheet;
begin
  if PageControl.PageCount > 0 then
  begin
    Self.Clear;
    PageControl.ActivePage.Destroy;
    if PageControl.PageCount > 0 then
      PageControl.ActivePageIndex := PageControl.PageCount - 1;
  end;
end;

procedure TOutputFrame.CloseAllTabSheets;
begin
  while PageControl.PageCount > 0 do
  begin
    Self.Clear;
    PageControl.ActivePage.Destroy;
    if PageControl.PageCount > 0 then
      PageControl.ActivePageIndex := PageControl.PageCount - 1;
  end;
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
  i: Integer;
begin
  PageControl.ActivePage.Tag := 1; { not destroyed }

  for i := PageControl.PageCount - 1 downto 0 do
  begin
    PageControl.ActivePageIndex := i;
    if PageControl.ActivePage.Tag = 0 then
    begin
      Self.Clear;
      PageControl.ActivePage.Destroy;
    end;
  end;

  PageControl.ActivePage.Tag := 0;
end;

procedure TOutputFrame.SetProcessingTabSheet(Value: Boolean);
begin
  FProcessingTabSheet := Value;
  OutputCloseAction.Enabled := not Value;
end;

procedure TOutputFrame.CopyToClipboard;
var
 Grid: TBCDBGrid;
begin
  Grid := GetDataGrid(PageControl.ActivePage.Caption);
  if Assigned(Grid) then
    CopyDataFromDBGridToClipboard(Grid);
end;

procedure TOutputFrame.VirtualDrawTreeDrawNode(Sender: TBaseVirtualTree;
  const PaintInfo: TVTPaintInfo);
var
  Data: POutputRec;
  S: UnicodeString;
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
        if Data.Level = 1 then
          S := System.SysUtils.Format('%s (%d, %d): ', [ExtractFilename(String(Data.Filename)), Data.Ln, Data.Ch]) + S;
        DrawTextW(Canvas.Handle, PWideChar(S), Length(S), R, Format)
      end
      else
      begin
        S := String(Data.Text);
        S := System.Copy(S, 0, Data.TextCh - 1);

        S := System.SysUtils.Format('%s (%d, %d): ', [ExtractFilename(String(Data.Filename)), Data.Ln, Data.Ch]) + S;

        DrawTextW(Canvas.Handle, PWideChar(S), Length(S), R, Format);
        R.Left := R.Left + Canvas.TextWidth(S);
        Canvas.Font.Color := clRed;
        S := Copy(String(Data.Text), Data.TextCh, Length(Data.SearchString));
        Canvas.Font.Style := Canvas.Font.Style + [fsBold];
        DrawTextW(Canvas.Handle, PWideChar(S), Length(S), R, Format);
        Canvas.Font.Color := LColor;
        R.Left := R.Left + Canvas.TextWidth(S);
        Canvas.Font.Style := Canvas.Font.Style - [fsBold];
        S := Copy(String(Data.Text), Data.TextCh + Length(Data.SearchString), Length(String(Data.Text)));
        DrawTextW(Canvas.Handle, PWideChar(S), Length(S), R, Format);
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

    case Data.Level of
      0: begin
           Canvas.Font.Style := Canvas.Font.Style + [fsBold];
           NodeWidth := Canvas.TextWidth(Trim(String(Data.FileName))) + 2 * AMargin;
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
  if Assigned(Data) then
  begin
    Data^.Level := 0;
    Data^.Filename := '';
    Data^.Ln := 0;
    Data^.Ch := 0;
    Data^.TextCh := 0;
    Data^.Text := '';
    Data^.SearchString := '';
  end;
  //Finalize(Data^);
end;

procedure TOutputFrame.UpdateControls;
var
  i, Right: Integer;
  LStyles: TCustomStyleServices;
  PanelColor: TColor;
begin
  PageControl.DoubleBuffered := TStyleManager.ActiveStyle.Name = 'Windows';
  //PageControl.MultiLine := OptionsContainer.OutputMultiLine;
  //PageControl.ShowCloseButton := OptionsContainer.OutputShowCloseButton;

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

end.
