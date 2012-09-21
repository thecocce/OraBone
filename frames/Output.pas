unit Output;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.ExtCtrls, Vcl.ComCtrls, JvExControls,
  JvLabel, Vcl.ActnList, Vcl.ImgList, Vcl.ToolWin, Vcl.StdCtrls, JvSpeedButton, JvExComCtrls,
  JvComCtrls, Vcl.Menus, Ora, Vcl.Grids, SynEditHighlighter, SynHighlighterSQL, SynEdit,
  BCPageControl, BCPopupMenu, VirtualTrees, PlatformDefaultStyleActnCtrls, Vcl.ActnPopup,
  BCDBGrid, DBGridEh, Data.DB;

type
  TOutputFrame = class(TFrame)
    OutputActionList: TActionList;
    OutputCloseAction: TAction;
    ImageList: TImageList;
    PageControl: TBCPageControl;
    PopupMenu: TBCPopupMenu;
    SynSQLSyn: TSynSQLSyn;
    ClearDBMSOutputAction: TAction;
    OutputCloseAllAction: TAction;
    OutputCloseAllOtherPagesAction: TAction;
    procedure OutputCloseActionExecute(Sender: TObject);
    procedure VirtualDrawTreeDrawNode(Sender: TBaseVirtualTree; const PaintInfo: TVTPaintInfo);
    procedure VirtualDrawTreeFreeNode(Sender: TBaseVirtualTree; Node: PVirtualNode);
    procedure VirtualDrawTreeGetNodeWidth(Sender: TBaseVirtualTree;
      HintCanvas: TCanvas; Node: PVirtualNode; Column: TColumnIndex; var NodeWidth: Integer);
    //procedure OutputTreeViewCustomDrawItem(Sender: TCustomTreeView; Node: TTreeNode;
    //  State: TCustomDrawState; var DefaultDraw: Boolean);
    procedure TabsheetDblClick(Sender: TObject);
    procedure DataDBGridDrawDataCell(Sender: TObject; const Rect: TRect;
      Field: TField; State: TGridDrawState);
    procedure DataQueryAfterScroll(DataSet: TDataSet);
    procedure PageControlChange(Sender: TObject);
    procedure ClearDBMSOutputActionExecute(Sender: TObject);
    procedure OutputCloseAllActionExecute(Sender: TObject);
    procedure OutputCloseAllOtherPagesActionExecute(Sender: TObject);
    procedure DataDBGridMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ListBoxKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
    FTabsheetDblClick: TNotifyEvent;
    FProcessingTabSheet: Boolean;
    function GetIsEmpty: Boolean;
    function GetCount: Integer;
    function GetIsAnyOutput: Boolean;
//    procedure DrawImage(Sender: TCustomTreeView; NodeRect: TRect; ImageIndex: Integer);
 //   function TreeView: TJvTreeView;
    function VirtualDrawTree: TVirtualDrawTree;
    procedure SetProcessingTabSheet(Value: Boolean);
    function TabFound(TabCaption: string): Boolean;
    procedure SetRows(TabCaption: string);
    procedure SetTime(TabCaption: string; Time: string);
    function GetListBox(TabCaption: string): TListBox;
    function GetGrid(TabCaption: string): TBCDBGrid;
    function GetSynEdit(TabCaption: string): TSynEdit;
    function GetPanel(TabCaption: string): TPanel;
    procedure UpdatePopupMenu;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
   // procedure AddTreeView(TabCaption: string);
    procedure AddGrid(TabCaption: string; OraQuery: TOraQuery; Time: string);
    procedure AddPlan(TabCaption: string; OraQuery: TOraQuery);
    procedure AddStrings(TabCaption: string; Text: string);
    procedure AddErrors(TabCaption: string; Text: string);
    procedure AddDBMSOutput(TabCaption: string; Text: string);
    procedure AddTreeView(TabCaption: string; AutoExpand: Boolean = False);
    procedure AddTreeViewLine(Text: string); overload;
  //  procedure AddTreeViewLine(Filename: string; Ln, Ch: Integer; Text: string); overload;
    procedure AddTreeViewLine(var Root: PVirtualNode; Filename: WideString; Ln, Ch: LongWord; Text: WideString; SearchString: ShortString = ''); overload;
    procedure CloseTabSheet;
    procedure CloseAllTabSheets;
    procedure CloseAllOtherTabSheets;
    procedure Clear;
    function SelectedLine(var Filename: string; var Ln: LongWord; var Ch: LongWord): Boolean;
    property IsEmpty: Boolean read GetIsEmpty;
    property Count: Integer read GetCount;
    property IsAnyOutput: Boolean read GetIsAnyOutput;
    property OnTabsheetDblClick: TNotifyEvent read FTabsheetDblClick write FTabsheetDblClick;
    property ProcessingTabSheet: Boolean read FProcessingTabSheet write SetProcessingTabSheet;
    function GetActiveGrid: TBCDBGrid;
    procedure CopyToClipboard;
    procedure UpdateControls;
  end;

implementation

{$R *.dfm}

uses
  Main, Common, Preferences, Lib, Vcl.Themes, StyleHooks, ClipBrd;

constructor TOutputFrame.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  { IDE can lose these, if the main form is not open }
  PopupMenu.Images := MainForm.MenuImageList;
//  PopupMenu.PopupDisabledImages := MainForm.DisabledMenuImageList;
  PageControl.MultiLine := OptionsContainer.MultiLine;
  //ExportMenuItem.Action := MainForm.DatabaseExportTableDataAction;
end;

procedure TOutputFrame.OutputCloseActionExecute(Sender: TObject);
begin
  CloseTabSheet;
end;

(*procedure TOutputFrame.DrawImage(Sender: TCustomTreeView; NodeRect: TRect; ImageIndex: Integer);
var
  cy: Integer;
begin
  cy := NodeRect.Top + (NodeRect.Bottom - NodeRect.Top) div 2;
  //center image in NodeRect.
  ImageList.Draw(Sender.Canvas, NodeRect.Left, cy - ImageList.Height div 2, ImageIndex, True);
end; *)

procedure TOutputFrame.TabsheetDblClick(Sender: TObject);
begin
  if Assigned(FTabsheetDblClick) then
    FTabsheetDblClick(Sender);
end;

(*procedure TOutputFrame.OutputTreeViewCustomDrawItem(Sender: TCustomTreeView; Node: TTreeNode;
  State: TCustomDrawState; var DefaultDraw: Boolean);
begin
  DefaultDraw := True;

  if Node.Selected and not Sender.Focused then
  begin
    Sender.Canvas.Brush.Color := clBtnFace;
    Sender.Canvas.Font.Color := clBlack;
  end;

  with Sender do
  begin
    if Node.HasChildren then
    begin
      //draw the selection rect.
     { if cdsSelected in State then
      begin
        NodeRect := Node.DisplayRect(True);
        Canvas.FillRect(NodeRect);
      end; }
      //NodeRect := Node.DisplayRect(False);


      //NodeRect.Left := NodeRect.Left + (Node.Level * TTreeView(Sender).Indent);
      //rc := Node.DisplayRect(False);

      //if Node.Expanded then
      //begin
        //DrawImage(Sender, NodeRect, 1);
        //Node.ImageIndex := 1;
        //Node.SelectedIndex := 1;
      //end
      //else
      //begin
        //DrawImage(Sender, NodeRect, 0);
        //Node.ImageIndex := 0;
        //Node.SelectedIndex := 0;
      //end;
      //Canvas.FillRect(NodeRect);
      Canvas.Font.Style := [fsBold];
      //Canvas.TextOut(Node.DisplayRect(True).Left, Node.DisplayRect(True).Top, Node.Text);
    end
    else
    begin
      //DefaultDraw := False;
      //Canvas.TextOut(Node.DisplayRect(True).Left, Node.DisplayRect(True).Top, Node.Text);
      // etsitty sana ensimmäisen ): jälkeen
      //Canvas.TextOut(rc.Left + Canvas.TextWidth(Copy(Node.Text, 1, Pos('(', Node.Text))), rc.Top, EntreValores(Node.Text, '(', ')'));


    end;
    //Canvas.Refresh;
  end;
end; *)

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
  for i := 0 to TabSheet.ComponentCount - 1 do
    if TabSheet.Components[i].Tag = 76 then
    begin
      TLabel(TabSheet.Components[i]).Caption := 'Execution time: ' + Time;
      Break;
    end
end;

procedure TOutputFrame.SetRows(TabCaption: string);
var
  i: Integer;
  TabSheet: TTabSheet;
  DataSet: TDataSet;
begin
  TabSheet := nil;

  for i := 0 to PageControl.PageCount - 1 do
    if PageControl.Pages[i].Caption = TabCaption then
    begin
      TabSheet := PageControl.Pages[i];
      Break;
    end;

  if Assigned(TabSheet) then
  begin
    DataSet := nil;

    for i := 0 to TabSheet.ComponentCount - 1 do
      if TabSheet.Components[i] is TBCDBGrid then
       begin
         DataSet := TBCDBGrid(TabSheet.Components[i]).DataSource.DataSet;
         Break;
       end;

    if Assigned(DataSet) then
      for i := 0 to TabSheet.ComponentCount - 1 do
        if TabSheet.Components[i].Tag = 77 then
        begin
          TLabel(TabSheet.Components[i]).Caption := 'Row ' + IntToStr(DataSet.RecNo) + ' of ' + IntToStr(DataSet.RecordCount);
          if TOraQuery(DataSet).Fetched then
            TLabel(TabSheet.Components[i]).Caption := TLabel(TabSheet.Components[i]).Caption + ' total'
          else
            TLabel(TabSheet.Components[i]).Caption := TLabel(TabSheet.Components[i]).Caption + ' fetched';
          Break;
        end;
  end;
end;

function TOutputFrame.GetPanel(TabCaption: string): TPanel;
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
  begin
    for i := 0 to TabSheet.ComponentCount - 1 do
      if TabSheet.Components[i].Tag = 75 then
      begin
        Result := TPanel(TabSheet.Components[i]);
        Break;
      end;
  end;
end;


function TOutputFrame.GetActiveGrid: TBCDBGrid;
var
  i, j: Integer;
  TabSheet: TTabSheet;
begin
  Result := nil;
  TabSheet := PageControl.ActivePage;
  if Assigned(TabSheet) then
  for i := 0 to TabSheet.ComponentCount - 1 do
    if TabSheet.Components[i] is TPanel then
    for j := 0 to TPanel(TabSheet.Components[i]).ComponentCount - 1 do
      if  TPanel(TabSheet.Components[i]).Components[j] is TBCDBGrid then
      begin
        Result := TBCDBGrid(TPanel(TabSheet.Components[i]).Components[j]);
        Break;
      end;
end;

procedure TOutputFrame.AddGrid(TabCaption: string; OraQuery: TOraQuery; Time: string);
var
  TabSheet: TTabSheet;
  StatsPanel, GridPanel: TPanel;
  StatsTime, StatsRows: TLabel;
  Grid: TBCDBGrid;
  GridDataSource: TOraDataSource;
begin
  if TabFound(TabCaption) then
  begin
    SetTime(TabCaption, Time);
    SetRows(TabCaption);
    Grid := GetGrid(TabCaption);
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

  StatsPanel := TPanel.Create(TabSheet); //PageControl);
  with StatsPanel do
  begin
    Parent := TabSheet;
    Align := alBottom;
    Height := 15;
    BevelOuter := bvNone;
    Padding.Top := 0;
    Padding.Left := 2;
    Padding.Right := 2;
    Padding.Bottom := 2;
    ParentBackground := True;
    //DoubleBuffered := False;
    ParentColor := True;
    //ParentDoubleBuffered := False;
    Tag := 75;
  end;
  StatsTime := TLabel.Create(TabSheet);
  with StatsTime do
  begin
    Parent := StatsPanel;
    Align := alLeft;
    //Caption := 'Execute time: ' + Time;
    Tag := 76;
  end;
  SetTime(TabCaption, Time);
  StatsRows := TLabel.Create(TabSheet);
  with StatsRows do
  begin
    Parent := StatsPanel;
    Align := alRight;
    {Caption := 'Row 1 of ' + IntToStr(OraQuery.RecordCount);
    if OraQuery.Fetched then
      Caption := Caption + ' total'
    else
      Caption := Caption + ' fetched'; }
    Tag := 77;
  end;
  GridPanel := TPanel.Create(TabSheet);
  with GridPanel do
  begin
    Parent := TabSheet;
    Align := alClient;
    BevelOuter := bvNone;
    Padding.Top := 0;
    Padding.Left := 0;
    Padding.Right := 2;
    Padding.Bottom := 2;
    ParentBackground := True;
    //DoubleBuffered := False;
    ParentColor := True;
    //ParentDoubleBuffered := False;
    Tag := 78;
  end;
  GridDataSource := TOraDataSource.Create(GridPanel);
  GridDataSource.DataSet := OraQuery;

  Grid := TBCDBGrid.Create(GridPanel);
  with Grid do
  begin
    Parent := GridPanel;
    Align := alClient;
   // AutoSort := False;
   // CanDelete := False;
   // Options := [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgTitleClick, dgTitleHotTrack, dgMultiSelect];
    ReadOnly := False;
   // SortWith := swFields;
   // TitleArrow := False;
   // TitleVcl.Buttons := True;
    DataSource := GridDataSource;
  //  ShowGlyphs := False;
    Tag := 75;
  //  OnDrawDataCell := DataDBGridDrawDataCell;
    Canvas.Font := Font;
    AllowedSelections := [gstRecordBookmarks, gstAll];
    DrawGraphicData := True;
    DrawMemoText := True;
    Options := Options + [dgMultiSelect];
    OptionsEh := OptionsEh + [dghRowHighlight, dghHotTrack, dghMultiSortMarking];
    OptionsEh := OptionsEh - [dghExtendVertLines];
    IndicatorOptions := [gioShowRowselCheckboxesEh];
    OnMouseDown := DataDBGridMouseDown;
  end;
  //OraQuery.DisableControls;
  SetGridColumnWidths(Grid, True);
  //OraQuery.EnableControls;
  OraQuery.AfterScroll := DataQueryAfterScroll;
  DataQueryAfterScroll(OraQuery);
  //SetRows(TabCaption);
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
  StatisticsPanel: TPanel;
  RecCount: Integer;
begin
  SetRows(PageControl.ActivePage.Caption);

  StatisticsPanel := GetPanel(PageControl.ActivePage.Caption);
  if Assigned(StatisticsPanel) then
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

procedure TOutputFrame.AddPlan(TabCaption: string; OraQuery: TOraQuery);
var
  TabSheet: TTabSheet;
  GridPanel: TPanel;
  Grid: TBCDBGrid;
  GridDataSource: TOraDataSource;
begin
  if TabFound(TabCaption) then
  begin
    UpdatePopupMenu;
    Exit;
  end;

  TabSheet := TTabSheet.Create(PageControl);
  TabSheet.TabVisible := False;
  TabSheet.PageControl := PageControl;
  TabSheet.ImageIndex := IMAGE_INDEX_PLAN; // data
  TabSheet.Caption := TabCaption;
  PageControl.ActivePage := TabSheet;

  GridPanel := TPanel.Create(PageControl);
  with GridPanel do
  begin
    Parent := TabSheet;
    Align := alClient;
    BevelOuter := bvNone;
    Padding.Top := 0;
    Padding.Left := 0;
    Padding.Right := 2;
    Padding.Bottom := 2;
    ParentBackground := True;
    //DoubleBuffered := False;
    ParentColor := True;
    //ParentDoubleBuffered := False;
  end;
  GridDataSource := TOraDataSource.Create(GridPanel);
  GridDataSource.DataSet := OraQuery;

  Grid := TBCDBGrid.Create(GridPanel);
  with Grid do
  begin
    Parent := GridPanel;
    Align := alClient;
    //AutoSort := False;
    //CanDelete := False;
    //Options := [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowSelect, dgRowLines, dgTabs, dgTitleClick, dgTitleHotTrack, dgMultiSelect];
    ReadOnly := True;
    //SortWith := swFields;
    //TitleArrow := False;
    //TitleVcl.Buttons := False;
    DataSource := GridDataSource;
    Tag := 75;
    AllowedSelections := [gstRecordBookmarks, gstAll];
    DrawGraphicData := True;
    DrawMemoText := True;
    Options := Options + [dgMultiSelect];
    OptionsEh := OptionsEh + [dghRowHighlight, dghHotTrack];
    OptionsEh := OptionsEh - [dghExtendVertLines];
  end;
  TabSheet.TabVisible := True;
  UpdatePopupMenu;
end;

procedure TOutputFrame.AddStrings(TabCaption: string; Text: string);
var
  TabSheet: TTabSheet;
  ListPanel: TPanel;
  ListBox: TListBox;
begin
  if TabFound(TabCaption) then
  begin
    ListBox := GetListBox(TabCaption);
    ListBox.Items.Add(Trim(Text));
    Exit;
  end;
  TabSheet := TTabSheet.Create(PageControl);
  TabSheet.TabVisible := False;
  TabSheet.PageControl := PageControl;
  TabSheet.ImageIndex := IMAGE_INDEX_OUTPUT; // output
  TabSheet.Caption := TabCaption;
  PageControl.ActivePage := TabSheet;

  ListPanel := TPanel.Create(TabSheet);
  with ListPanel do
  begin
    Parent := TabSheet;
    Align := alClient;
    BevelOuter := bvNone;
    Padding.Top := 0;
    Padding.Left := 0;
    Padding.Right := 2;
    Padding.Bottom := 2;
    ParentBackground := True;
    //DoubleBuffered := False;
    ParentColor := True;
    //ParentDoubleBuffered := False;
  end;

  ListBox := TListBox.Create(ListPanel);
  with ListBox do
  begin
    Parent := ListPanel;
    Align := alClient;
    Items.Clear;
    Items.Text := Text;
    MultiSelect := True;
    OnKeyDown := ListBoxKeyDown;
  end;
  TabSheet.TabVisible := True;
  UpdatePopupMenu;
end;

function TOutputFrame.GetListBox(TabCaption: string): TListBox;
var
  i: Integer;
  Panel: TPanel;
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
    begin
      if TabSheet.Components[0] is TPanel then
      begin
        Panel := TPanel(TabSheet.Components[0]);
        if Panel.ComponentCount <> 0 then
          if Panel.Components[0] is TListBox then
            Result := TListBox(Panel.Components[0]);
      end;
    end;
end;

function TOutputFrame.GetGrid(TabCaption: string): TBCDBGrid;
var
  i, j: Integer;
  Panel: TPanel;
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
    begin
      for i := 0 to TabSheet.ComponentCount - 1 do
      if TabSheet.Components[i].Tag = 78 then
      begin
        Panel := TPanel(TabSheet.Components[i]);
        for j := 0 to Panel.ComponentCount - 1 do
          if Panel.Components[j] is TBCDBGrid then
            Result := TBCDBGrid(Panel.Components[j]);
        Break;
      end;
    end;
end;

function TOutputFrame.GetSynEdit(TabCaption: string): TSynEdit;
var
  i: Integer;
  Panel: TPanel;
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
    begin
      if TabSheet.Components[0] is TPanel then
      begin
        Panel := TPanel(TabSheet.Components[0]);
        if Panel.ComponentCount <> 0 then
          if Panel.Components[0] is TSynEdit then
            Result := TSynEdit(Panel.Components[0]);
      end;
    end;
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
  ListPanel: TPanel;
  //ListBox: TListBox;
  SynEdit: TSynEdit;
begin
  if TabFound(TabCaption) then
  begin
   // ListBox := GetListBox(TabCaption);
    SynEdit := GetSynEdit(TabCaption);
   // ListBox.Items.Add(Text);
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

  ListPanel := TPanel.Create(TabSheet);
  with ListPanel do
  begin
    Parent := TabSheet;
    Align := alClient;
    BevelOuter := bvNone;
    Padding.Top := 0;
    Padding.Left := 0;
    Padding.Right := 2;
    Padding.Bottom := 2;
    ParentBackground := True;
    //DoubleBuffered := False;
    ParentColor := True;
    //ParentDoubleBuffered := False;
  end;

 { ListBox := TListBox.Create(ListPanel);
  with ListBox do
  begin
    Parent := ListPanel;
    Align := alClient;
    Items.Clear;
    Items.Text := Text;
    MultiSelect := True;
  end; }
  { create a SynEdit }
  SynEdit := TSynEdit.Create(ListPanel);
  with SynEdit do
  begin
    Parent := ListPanel;
    Align := alClient;
    Font.Charset := DEFAULT_CHARSET;
    Font.Color := clWindowText;
    Font.Height := -13;
    Font.Name := 'Courier New';
    Font.Style := [];
    Gutter.AutoSize := True;
    Gutter.Font.Charset := DEFAULT_CHARSET;
    Gutter.Font.Color := clWindowText;
    Gutter.Font.Height := -11;
    Gutter.Font.Name := 'Courier New';
    Gutter.Font.Style := [];
    Gutter.ShowLineNumbers := True;
    Gutter.Gradient := False;
    WantTabs := True;
    Options := [eoAutoIndent, eoDragDropEditing, eoEnhanceEndKey, eoGroupUndo,
      eoShowScrollHint, eoSmartTabDelete, eoSmartTabs, eoTabsToSpaces,
      eoTrimTrailingSpaces];
    ActiveLineColor := clSkyBlue;
    Highlighter := SynSQLSyn;
  end;
  TStyleManager.Engine.RegisterStyleHook(TCustomSynEdit, TSynEditStyleHook);
  UpdateGutter(SynEdit);
  Application.ProcessMessages;
  SynEdit.Text := Text + CHR_ENTER;
  TabSheet.TabVisible := True;
  UpdatePopupMenu;
end;

{ could use AddStrings but maybe some changes in future... }
procedure TOutputFrame.AddErrors(TabCaption: string; Text: string);
var
  TabSheet: TTabSheet;
  ListPanel: TPanel;
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

  ListPanel := TPanel.Create(TabSheet);
  with ListPanel do
  begin
    Parent := TabSheet;
    Align := alClient;
    BevelOuter := bvNone;
    Padding.Top := 0;
    Padding.Left := 0;
    Padding.Right := 2;
    Padding.Bottom := 2;
    ParentBackground := True;
    //DoubleBuffered := False;
    ParentColor := True;
    //ParentDoubleBuffered := False;
  end;

  ListBox := TListBox.Create(ListPanel);
  with ListBox do
  begin
    Parent := ListPanel;
    Align := alClient;
    Items.Clear;
    Items.Text := Text;
    MultiSelect := True;
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
  TreeViewPanel: TPanel;
  OutputTreeView: TVirtualDrawTree;
  //OutputTreeView: TJvTreeView;
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
  TabSheet.Caption := TabCaption; //Format('Search: ''%s''', [TabCaption]);
  PageControl.ActivePage := TabSheet;

  TreeViewPanel := TPanel.Create(PageControl);
  with TreeViewPanel do
  begin
    Parent := TabSheet;
    Align := alClient;
    BevelOuter := bvNone;
    Padding.Top := 1;
    Padding.Left := 1;
    if TStyleManager.ActiveStyle.Name = 'Windows' then
      Padding.Right := 3
    else
      Padding.Right := 1;
    Padding.Bottom := 2;
    ParentBackground := True;
    //DoubleBuffered := False;
    ParentColor := True;
    //ParentDoubleBuffered := False;
  end;
  OutputTreeView := TVirtualDrawTree.Create(TabSheet);
  with OutputTreeView do
  begin
    Parent := TreeViewPanel;
    Align := alClient;
    DragOperations := [];
    Header.Options := [];
    ParentCtl3D := False;
    Indent := 16;
    TreeOptions.AutoOptions := [toAutoDropExpand, toAutoScroll, toAutoScrollOnExpand, toAutoTristateTracking, toAutoDeleteMovedNodes];
    TreeOptions.MiscOptions := [toFullRepaintOnResize, toInitOnSave, toToggleOnDblClick, toWheelPanning];
    TreeOptions.PaintOptions := [toShowButtons, toShowRoot, toUseBlendedSelection, toThemeAware];
    if AutoExpand then
      TreeOptions.AutoOptions := TreeOptions.AutoOptions + [toAutoExpand];
    //TreeOptions.SelectionOptions := [toFullRowSelect];
    OnDrawNode := VirtualDrawTreeDrawNode;
    OnFreeNode := VirtualDrawTreeFreeNode;
    OnGetNodeWidth := VirtualDrawTreeGetNodeWidth;
    OnDblClick := TabsheetDblClick;
    Colors.GridLineColor := clScrollBar;
    NodeDataSize := SizeOf(TOutputRec);
  end;
  Self.Clear;

  (*OutputTreeView := TJvTreeView.Create(TabSheet);
  with OutputTreeView do
  begin
    Parent := TreeViewPanel;
    Align := alClient;
    DoubleBuffered := True;
    HideSelection := False;
    //Images := ImageList;
    Indent := 19;
    ParentDoubleBuffered := False;
    RowSelect := True;
    ShowLines := False;
    ReadOnly := True;
    //ShowRoot := False;
    TabOrder := 0;
    ToolTips := False;
    OnCustomDrawItem := OutputTreeViewCustomDrawItem;
    OnDblClick := TabsheetDblClick;
    LineColor := clScrollBar;
  end;
  Self.Clear;  *)
  TabSheet.TabVisible := True;
  UpdatePopupMenu;
end;

function TOutputFrame.VirtualDrawTree: TVirtualDrawTree;
var
  i: Integer;
begin
  Result := nil;
  for i := 0 to PageControl.ActivePage.ComponentCount - 1 do
    if  PageControl.ActivePage.Components[i] is TVirtualDrawTree then
    begin
      Result := TVirtualDrawTree(PageControl.ActivePage.Components[i]);
      Break;
    end;
end;

procedure TOutputFrame.AddTreeViewLine(Text: string);
var
  Root: PVirtualNode;
begin
  AddTreeViewLine(Root, '', 0, 0, Text);
end;

(*procedure TOutputFrame.AddTreeViewLine(Filename: string; Ln, Ch: Integer; Text: string);
var
  OutputObject: TOutputObject;
  Root, Child: TTreeNode;
  i: Integer;
  OutputTreeView: TJvTreeView;
begin
  OutputTreeView := TreeView;
  if not Assigned(OutputTreeView) then
    Exit;

  OutputObject := nil;
  if Filename <> '' then
  begin
    OutputObject := TOutputObject.Create;
    OutputObject.Filename := Filename;
    OutputObject.Ln := Ln;
    OutputObject.Ch := Ch;
    OutputObject.Text := Text;
  end;

  Root := nil;

  for i := 0 to OutputTreeView.Items.Count - 1 do
    if (OutputTreeView.Items[i].Text = Filename) and (OutputTreeView.Items[i].Level = 0) then
    begin
      Root := OutputTreeView.Items[i];
      Break;
    end;

  if not Assigned(Root) then
  begin
    Root := OutputTreeView.Items.Add(nil, Filename);
    //Root.ImageIndex := 0;
    //Root.SelectedIndex := 0;
    //Root.HasChildren := True;
  end;

  if Assigned(OutputObject) then
  begin
    Child := OutputTreeView.Items.AddChildObject(Root, Format('%s (%d, %d): %s', [ExtractFilename(Filename), Ln, Ch, Text]), OutputObject);
    Child.ImageIndex := -1;
    Child.SelectedIndex := -1;
    OutputTreeView.Tag := OutputTreeView.Tag + 1;
  end;
  Application.ProcessMessages;
  //Show;
end; *)

procedure TOutputFrame.AddTreeViewLine(var Root: PVirtualNode; Filename: WideString; Ln, Ch: LongWord; Text: WideString; SearchString: ShortString);
var
  Node: PVirtualNode;
  NodeData: POutputRec;
  OutputTreeView: TVirtualDrawTree;
  S: WideString;
begin
  OutputTreeView := VirtualDrawTree;
  if not Assigned(OutputTreeView) then
    Exit;

  if not Assigned(Root) then
  begin
    Root := OutputTreeView.GetFirst;
    while Assigned(Root) do
    begin
      NodeData := VirtualDrawTree.GetNodeData(Root);
      if String(NodeData.Filename) = FileName then
        Break;
      Root := OutputTreeView.GetNext(Root);
    end;
  end;

  if not Assigned(Root) then
  begin
    Root := OutputTreeView.AddChild(nil);
    NodeData := VirtualDrawTree.GetNodeData(Root);
    NodeData.Level := 0;
    NodeData.Filename := Filename;
  end;

  Node := OutputTreeView.AddChild(Root);
  NodeData := VirtualDrawTree.GetNodeData(Node);
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
  OutputTreeView := VirtualDrawTree;
  if Assigned(OutputTreeView) then
  begin
    OutputTreeView.Clear;
    OutputTreeView.Tag := 0;
  end;
end;

procedure TOutputFrame.ClearDBMSOutputActionExecute(Sender: TObject);
var
  SynEdit: TSynEdit;
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
  OutputTreeView := VirtualDrawTree;
  if not Assigned(OutputTreeView) then
    Exit;

  Node := OutputTreeView.GetFirstSelected;
  NodeData := OutputTreeView.GetNodeData(Node);
  {NodeData := nil;
  while Assigned(Node) do
  begin
    NodeData := OutputTreeView.GetNodeData(Node);
    if OutputTreeView.Selected[Node] then
      Break;
    Node := OutputTreeView.GetNext(Node);
  end;}

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
  OutputTreeView := VirtualDrawTree;
  if not Assigned(OutputTreeView) then
    Exit;
  Result := OutputTreeView.GetFirst = nil;
end;

function TOutputFrame.GetCount: Integer;
var
  OutputTreeView: TVirtualDrawTree;
begin
  Result := 0;
  OutputTreeView := VirtualDrawTree;
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
  Grid := GetGrid(PageControl.ActivePage.Caption);
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
  //StartPos: LongWord;
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

    {Canvas.Font.Color := clWindowText;

    if (Column = FocusedColumn) and (not Sender.Focused) then
    begin
      Canvas.Brush.Color := clBtnFace;
      Canvas.Font.Color := clBlack;
    end;  }

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
  i, j: Integer;
begin
  PageControl.DoubleBuffered := TStyleManager.ActiveStyle.Name = 'Windows';

  for i := 0 to PageControl.PageCount - 1 do
    for j := 0 to PageControl.Pages[i].ComponentCount - 1 do
      if PageControl.Pages[i].Components[j] is TPanel then
      begin
        if TStyleManager.ActiveStyle.Name = 'Windows' then
          TPanel(PageControl.Pages[i].Components[j]).Padding.Right := 3
        else
          TPanel(PageControl.Pages[i].Components[j]).Padding.Right := 1;
      end;
end;

end.
