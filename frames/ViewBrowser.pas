unit ViewBrowser;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Ora, Vcl.Dialogs, ComCtrls, JvExComCtrls, JvComCtrls, DBAccess, MemDS,
  Vcl.ExtCtrls, Vcl.DBCtrls, JvStringHolder, Vcl.Buttons, Vcl.ActnList, BCControls.PageControl, Vcl.ImgList,
  SynEditHighlighter, SynHighlighterSQL, SynEdit, Vcl.AppEvnts, Vcl.ToolWin, JvToolBar, Vcl.Menus,
  Vcl.PlatformDefaultStyleActnCtrls, Vcl.ActnPopup, BCControls.ImageList, BCControls.ToolBar,
  BCControls.DBGrid, DBGridEhGrouping, GridsEh, DBGridEh, Data.DB, System.Actions, ToolCtrlsEh, DBGridEhToolCtrls,
  DBAxisGridsEh, Vcl.StdCtrls, DynVarsEh;

type
  TViewBrowserFrame = class(TFrame)
    ViewPageControl: TBCPageControl;
    ColumnsTabSheet: TTabSheet;
    DataTabSheet: TTabSheet;
    TriggersTabSheet: TTabSheet;
    GrantsTabSheet: TTabSheet;
    DependenciesTabSheet: TTabSheet;
    ColumnsPanel: TPanel;
    ColumnsQuery: TOraQuery;
    ColumnsDataSource: TOraDataSource;
    ColumnsDBGrid: TBCDBGrid;
    DataPanel: TPanel;
    DataDataSource: TOraDataSource;
    SQLStringHolder: TJvMultiStringHolder;
    ImageList: TBCImageList;
    ActionList: TActionList;
    FilterAction: TAction;
    TriggersQuery: TOraQuery;
    TriggersDataSource: TOraDataSource;
    GrantsDataSource: TOraDataSource;
    GrantsQuery: TOraQuery;
    DependenciesDataSource: TOraDataSource;
    DependenciesQuery: TOraQuery;
    TriggersTopPanel: TPanel;
    TriggersDBGrid: TBCDBGrid;
    TriggersSplitter: TSplitter;
    TriggersBottomPanel: TPanel;
    TriggerSynEdit: TSynEdit;
    GrantsPanel: TPanel;
    GrantsDBGrid: TBCDBGrid;
    DependenciesPanel: TPanel;
    DependenciesDBGrid: TBCDBGrid;
    FilterMultiStringHolder: TJvMultiStringHolder;
    SynonymsQuery: TOraQuery;
    SynonymsDataSource: TOraDataSource;
    SynonymsTabSheet: TTabSheet;
    SynonymsPanel: TPanel;
    SynonymsDBGrid: TBCDBGrid;
    SourceTabSheet: TTabSheet;
    SourcePanel: TPanel;
    SourceSynEdit: TSynEdit;
    SourceQuery: TOraQuery;
    SourceDataSource: TOraDataSource;
    SQLEditorAction: TAction;
    SynSQLSyn: TSynSQLSyn;
    FilterDropDownPopupActionBar: TPopupActionBar;
    est1: TMenuItem;
    N1: TMenuItem;
    NoFilterMenuItem: TMenuItem;
    RemoveCurrentFilterAction: TAction;
    NoFilterAction: TAction;
    DataPopupActionBar: TPopupActionBar;
    ExportMenuItem: TMenuItem;
    SelectAllMenuItem: TMenuItem;
    N2: TMenuItem;
    RefreshMenuItem: TMenuItem;
    N3: TMenuItem;
    SortAction: TAction;
    SortDropDownPopupActionBar: TPopupActionBar;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    NoSortMenuItem: TMenuItem;
    RemoveCurrentSortAction: TAction;
    NoSortAction: TAction;
    CustomizeAction: TAction;
    PageControlPopupActionBar: TPopupActionBar;
    CustomizePageControl1: TMenuItem;
    EnableTriggerAction: TAction;
    DisableTriggerAction: TAction;
    CopyToClipboardAction: TAction;
    SaveToFileAction: TAction;
    CreateTriggerAction: TAction;
    DropTriggerAction: TAction;
    GrantPrivilegesAction: TAction;
    RevokePrivilegesAction: TAction;
    CreateSynonymAction: TAction;
    DropSynonymAction: TAction;
    GrantsButtonPanel: TPanel;
    JvToolBar3: TBCToolBar;
    ToolButton21: TToolButton;
    ToolButton22: TToolButton;
    SynonymsButtonPanel: TPanel;
    JvToolBar4: TBCToolBar;
    ToolButton23: TToolButton;
    ToolButton24: TToolButton;
    ColumnsButtonPanel: TPanel;
    JvToolBar5: TBCToolBar;
    ToolButton25: TToolButton;
    AlterViewAction: TAction;
    TriggersButtonPanel: TPanel;
    TriggersToolBar: TBCToolBar;
    ToolButton7: TToolButton;
    ToolButton10: TToolButton;
    SelectAllAction: TAction;
    ExportTableDataAction: TAction;
    RefreshAction: TAction;
    DependenciesButtonPanel: TPanel;
    DependenciesToolBar: TBCToolBar;
    DataButtonPanel: TPanel;
    DataDBNavigator: TDBNavigator;
    JvToolBar1: TBCToolBar;
    ToolButton4: TToolButton;
    ToolButton1: TToolButton;
    ToolButton29: TToolButton;
    SourceButtonPanel: TPanel;
    SourceToolBar: TBCToolBar;
    SQLEditorToolButton: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    DataDBGrid: TBCDBGrid;
    Bevel3: TBevel;
    BCToolBar1: TBCToolBar;
    ToolButton14: TToolButton;
    Bevel1: TBevel;
    BCToolBar2: TBCToolBar;
    ToolButton12: TToolButton;
    Bevel2: TBevel;
    BCToolBar3: TBCToolBar;
    ToolButton2: TToolButton;
    Bevel8: TBevel;
    BCToolBar5: TBCToolBar;
    ToolButton3: TToolButton;
    ToolButton15: TToolButton;
    Bevel4: TBevel;
    BCToolBar4: TBCToolBar;
    ToolButton8: TToolButton;
    Bevel5: TBevel;
    BCToolBar6: TBCToolBar;
    ToolButton9: TToolButton;
    Bevel6: TBevel;
    BCToolBar7: TBCToolBar;
    ToolButton11: TToolButton;
    CreationAndModificationTimestampLabel: TLabel;
    procedure ViewPageControlChange(Sender: TObject);
    procedure FilterActionExecute(Sender: TObject);
    procedure TriggersQueryAfterScroll(DataSet: TDataSet);
    procedure SourceQueryAfterScroll(DataSet: TDataSet);
    procedure SQLEditorActionExecute(Sender: TObject);
    procedure RefreshDataActionExecute(Sender: TObject);
    procedure RemoveCurrentFilterActionExecute(Sender: TObject);
    procedure NoFilterActionExecute(Sender: TObject);
    procedure DataQueryAfterScroll(DataSet: TDataSet);
    procedure SortActionExecute(Sender: TObject);
    procedure RemoveCurrentSortActionExecute(Sender: TObject);
    procedure NoSortActionExecute(Sender: TObject);
    procedure CustomizeActionExecute(Sender: TObject);
    procedure EnableTriggerActionExecute(Sender: TObject);
    procedure DisableTriggerActionExecute(Sender: TObject);
    procedure TriggersQueryAfterOpen(DataSet: TDataSet);
    procedure CopyToClipboardActionExecute(Sender: TObject);
    procedure SaveToFileActionExecute(Sender: TObject);
    procedure CreateTriggerActionExecute(Sender: TObject);
    procedure DropTriggerActionExecute(Sender: TObject);
    procedure GrantPrivilegesActionExecute(Sender: TObject);
    procedure RevokePrivilegesActionExecute(Sender: TObject);
    procedure CreateSynonymActionExecute(Sender: TObject);
    procedure DropSynonymActionExecute(Sender: TObject);
    procedure GrantsQueryAfterOpen(DataSet: TDataSet);
    procedure SynonymsQueryAfterOpen(DataSet: TDataSet);
    procedure GetText(Sender: TField; var Text: String; DisplayText: Boolean);
    procedure AlterViewActionExecute(Sender: TObject);
    procedure SelectAllActionExecute(Sender: TObject);
    procedure ExportTableDataActionExecute(Sender: TObject);
    procedure RefreshSourceActionExecute(Sender: TObject);
    procedure RefreshActionExecute(Sender: TObject);
    procedure RefreshTriggersActionExecute(Sender: TObject);
    procedure RefreshGrantsActionExecute(Sender: TObject);
    procedure DataDBGridMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X,
      Y: Integer);
    procedure TriggersDBGridSelectionChanged(Sender: TObject);
    procedure GrantsDBGridSelectionChanged(Sender: TObject);
    procedure SynonymsDBGridSelectionChanged(Sender: TObject);
    procedure ColumnsDBGridTitleClick(Column: TColumnEh);
    procedure DataDBGridAdvDrawDataCell(Sender: TCustomDBGridEh; Cell, AreaCell: TGridCoord; Column: TColumnEh;
      const ARect: TRect; var Params: TColCellParamsEh; var Processed: Boolean);
  private
    { Private declarations }
    FSession: TOraSession;
    FObjectName: string;
    FDataQuery: TOraQuery;
    FSchemaParam: string;
    FSchemaActionList: TActionList;
    FQuickSort: string;
    procedure SetSession(OraSession: TOraSession);
    function GetActivePageQuery(Refresh: Boolean): TOraQuery;
    function GetViewColumns: TStringList;
    function GetCurrentDataFilter: string;
    function GetCurrentDataSort: string;
    procedure SetHighlighterTableNames(Value: TStrings);
    procedure InsertFiltersToDropDownMenu(PopupActionBar: TPopupActionBar);
    procedure InsertSortsToDropDownMenu(PopupActionBar: TPopupActionBar);
    procedure DropDownMenuClick(Sender: TObject);
    procedure DropDownSortMenuClick(Sender: TObject);
    function GetQueryOpened: Boolean;
    procedure SetColumnWidths(OraQuery: TOraQuery);
    procedure SetTriggerActions;
    procedure SetGrantActions;
    procedure SetSynonymActions;
    procedure SetClobAndTimestampFields(OraQuery: TOraQuery);
    procedure SetObjectFrameAlign(Value: TAlign);
    procedure SetSortMarkers(OrderSQL: string);
    procedure SetShowDataSearchPanel(Value: Boolean);
  public
    { Public declarations }
    constructor Create(AOwner: TComponent; ParentPanel: TPanel;
      OraSession: TOraSession; SchemaParam: string); reintroduce; overload;
    procedure OpenQuery(Query: TOraQuery = nil; RefreshQuery: Boolean = False);
    property ObjectName: string write FObjectName;
    property HighlighterTableNames: TStrings write SetHighlighterTableNames;
    property SchemaParam: string read FSchemaParam write FSchemaParam;
    property QueryOpened: Boolean read GetQueryOpened;
    property SchemaActionList: TActionList read FSchemaActionList write FSchemaActionList;
    procedure UpdateFilterDropDownMenu;
    procedure UpdateSortDropDownMenu;
    procedure CopyToClipboard;
    procedure GetViewComments;
    property ObjectFrameAlign: TAlign write SetObjectFrameAlign;
    property ShowDataSearchPanel: Boolean write SetShowDataSearchPanel;
  end;

implementation

uses
  Main, DataFilter, DataSort, CustomizePages, BCCommon.OptionsContainer, Lib, Vcl.Themes, BCCommon.StyleUtils,
  BCCommon.StringUtils, BCCommon.Lib;

const
  { ColumnsQuery columns }
  COLUMN_NAME = 'Column Name';
  TRIGGER_NAME = 'Trigger Name';
  TRIGGER_STATUS = 'Status';
  STATUS_ENABLED = 'Enabled';
  { GrantsQuery columns }
  GRANTEE = 'Granted To';
  PRIVILEGE = 'Privilege';
  { SynonymsQuery columns }
  SYNONYM_OWNER = 'Synonym Owner';
  SYNONYM_NAME = 'Synonym Name';

{$R *.dfm}

procedure TViewBrowserFrame.CopyToClipboardActionExecute(Sender: TObject);
begin
  Lib.CopyAllToClipboard(SourceSynEdit);
end;

procedure TViewBrowserFrame.SetShowDataSearchPanel(Value: Boolean);
begin
  DataDBGrid.SearchPanel.Enabled := Value;
end;

constructor TViewBrowserFrame.Create(AOwner: TComponent; ParentPanel: TPanel;
  OraSession: TOraSession; SchemaParam: string);
begin
  inherited Create(AOwner);

  FQuickSort := '';
  Visible := False;
  ViewPageControl.TabIndex := 0;
  Parent := ParentPanel;
  SetSession(OraSession);
  FSchemaParam := SchemaParam;
end;

procedure TViewBrowserFrame.CreateSynonymActionExecute(Sender: TObject);
begin
  Lib.ExecuteActionFromList(SchemaActionList, 'CreateSynonymForObjectAction');
  RefreshAction.Execute;
end;

procedure TViewBrowserFrame.CreateTriggerActionExecute(Sender: TObject);
begin
  Lib.ExecuteActionFromList(SchemaActionList, 'CreateTriggerForObjectAction');
  RefreshAction.Execute;
end;

function TViewBrowserFrame.GetQueryOpened: Boolean;
begin
  Result := Assigned(FDataQuery) and FDataQuery.Active and (ViewPageControl.ActivePage = DataTabSheet);
end;

procedure TViewBrowserFrame.ViewPageControlChange(Sender: TObject);
begin
  OpenQuery;
end;

procedure TViewBrowserFrame.RefreshActionExecute(Sender: TObject);
begin
  if ViewPageControl.ActivePage = ColumnsTabSheet then
    OpenQuery(ColumnsQuery, True)
  else
  if ViewPageControl.ActivePage = DataTabSheet then
    OpenQuery(FDataQuery, True)
  else
  if ViewPageControl.ActivePage = SourceTabSheet then
    OpenQuery(SourceQuery, True)
  else
  if ViewPageControl.ActivePage = TriggersTabSheet then
    OpenQuery(TriggersQuery, True)
  else
  if ViewPageControl.ActivePage = GrantsTabSheet then
    OpenQuery(GrantsQuery, True)
  else
  if ViewPageControl.ActivePage = SynonymsTabSheet then
    OpenQuery(SynonymsQuery, True)
  else
  if ViewPageControl.ActivePage = DependenciesTabSheet then
    OpenQuery(DependenciesQuery, True)
end;

procedure TViewBrowserFrame.RefreshDataActionExecute(Sender: TObject);
begin
  OpenQuery(FDataQuery, True);
end;

procedure TViewBrowserFrame.RefreshGrantsActionExecute(Sender: TObject);
begin
  OpenQuery(GrantsQuery, True);
end;

procedure TViewBrowserFrame.RefreshSourceActionExecute(Sender: TObject);
begin
  OpenQuery(SourceQuery, True);
end;

procedure TViewBrowserFrame.RefreshTriggersActionExecute(Sender: TObject);
begin
  OpenQuery(TriggersQuery, True);
end;

procedure TViewBrowserFrame.RemoveCurrentFilterActionExecute(Sender: TObject);
var
  i: Integer;
  FilterName, KeyValue, CurrentKeyValue: string;
begin
  { Get checked filter name }
  for i := 0 to FilterDropDownPopupActionBar.Items.Count - 1 do
    if FilterDropDownPopupActionBar.Items[i].Checked then
    begin
      FilterName := FilterDropDownPopupActionBar.Items[i].Caption;
      Break;
    end;
  FilterName := StringReplace(FilterName, '&', '', []);
  KeyValue := EncryptString(FObjectName + '@' + FSchemaParam + ':' + FilterName);
  CurrentKeyValue := EncryptString(FObjectName + '@' + FSchemaParam + ':CURRENT');
  { Remove from valuelist (also remove current) }
  for i := DataFilterDialog.ValuesList.RowCount - 1 downto 0 do
  begin
   if KeyValue = DataFilterDialog.ValuesList.Keys[i] then
   begin
     DataFilterDialog.ValuesList.DeleteRow(i);
     //Break;
   end
   else
   if CurrentKeyValue = DataFilterDialog.ValuesList.Keys[i] then
   begin
     DataFilterDialog.ValuesList.DeleteRow(i);
     //Break;
   end;
  end;

  NoFilterMenuItem.Checked := True;
  UpdateFilterDropDownMenu;

  OpenQuery(FDataQuery, True);
end;

procedure TViewBrowserFrame.RemoveCurrentSortActionExecute(Sender: TObject);
var
  i: Integer;
  SortName, KeyValue, CurrentKeyValue: string;
begin
  { Get checked filter name }
  for i := 0 to SortDropDownPopupActionBar.Items.Count - 1 do
    if SortDropDownPopupActionBar.Items[i].Checked then
    begin
      SortName := SortDropDownPopupActionBar.Items[i].Caption;
      Break;
    end;
  SortName := StringReplace(SortName, '&', '', []);
  KeyValue := EncryptString(FObjectName + '@' + FSchemaParam + ':' + SortName);
  CurrentKeyValue := EncryptString(FObjectName + '@' + FSchemaParam + ':CURRENT');
  { Remove from valuelist (also remove current) }
  for i := DataSortDialog.ValuesList.RowCount - 1 downto 0 do
  begin
   if KeyValue = DataSortDialog.ValuesList.Keys[i] then
   begin
     DataSortDialog.ValuesList.DeleteRow(i);
     //Break;
   end
   else
   if CurrentKeyValue = DataSortDialog.ValuesList.Keys[i] then
   begin
     DataSortDialog.ValuesList.DeleteRow(i);
     //Break;
   end;
  end;
  NoSortMenuItem.Checked := True;
  UpdateSortDropDownMenu;
  OpenQuery(FDataQuery, True);
end;

procedure TViewBrowserFrame.RevokePrivilegesActionExecute(Sender: TObject);
begin
  Lib.RevokeSelectedGrants(FSession, FSchemaParam, FObjectName, GrantsDBGrid);
end;

procedure TViewBrowserFrame.SetSession(OraSession: TOraSession);
var
  i: Integer;
begin
  FSession := OraSession;
  for i := 0 to ComponentCount - 1 do
    if Components[i] is TOraQuery then
      TOraQuery(Components[i]).Session := FSession;
end;

procedure TViewBrowserFrame.SortActionExecute(Sender: TObject);
var
  Columns: TStringList;
begin
  if Self.Visible = False then
    Exit;
  if ViewPageControl.ActivePage <> DataTabSheet then
    Exit;
  try
    Columns := GetViewColumns;

    if DataSortDialog.Open(FObjectName, FSchemaParam, Columns{, FilterText}) then
    begin
      UpdateSortDropDownMenu;
      OpenQuery(FDataQuery, True);
    end;
  finally
    FreeAndNil(Columns);
  end;
end;

procedure TViewBrowserFrame.SourceQueryAfterScroll(DataSet: TDataSet);
var
  i: Integer;
  Cols: TStringList;
  Columns, Replace, Materialized: string;
begin
  Cols := GetViewColumns;
  Columns := '(';
  for i := 0 to Cols.Count - 1 do
  begin
    Columns := Columns + Trim(Cols.Strings[i]);
    if Cols.Count - 1 > i then
      Columns := Columns + ', ';
    if (i + 1) mod 5 = 0 then
      Columns := Columns + CHR_ENTER + ' ';
  end;
  Columns := Columns + ') ';
  SourceSynEdit.Lines.Clear;
  SourceSynEdit.Lines.BeginUpdate;

  Materialized := '';
  Replace := ' OR REPLACE';
  if DataSet.FieldByName('TYPE').AsString = 'M' then
  begin
    Materialized := ' MATERIALIZED';
    Replace := '';
    Columns := '';
  end;
  SourceSynEdit.Lines.Text := Format('CREATE%s%s VIEW %s.%s', [Replace, Materialized, FSchemaParam, FObjectName]) + CHR_ENTER +
    Columns + 'AS' + CHR_ENTER + DataSet.FieldByName('TEXT').AsWideString;
  SourceSynEdit.Lines.EndUpdate;
end;

procedure TViewBrowserFrame.SQLEditorActionExecute(Sender: TObject);
begin
  MainForm.LoadSQLIntoEditor(Format('%s@%s', [SourceQuery.Session.Schema, SourceQuery.Session.Server]), SourceSynEdit.Text);
end;

procedure TViewBrowserFrame.SynonymsDBGridSelectionChanged(Sender: TObject);
begin
  SetSynonymActions;
end;

procedure TViewBrowserFrame.SynonymsQueryAfterOpen(DataSet: TDataSet);
begin
  SetSynonymActions;
end;

procedure TViewBrowserFrame.TriggersDBGridSelectionChanged(Sender: TObject);
begin
  SetTriggerActions;
end;

procedure TViewBrowserFrame.TriggersQueryAfterOpen(DataSet: TDataSet);
begin
  TriggerSynEdit.Lines.Clear;
  SetTriggerActions;
end;

procedure TViewBrowserFrame.TriggersQueryAfterScroll(DataSet: TDataSet);
begin
  if DataSet.ControlsDisabled then
    Exit;
  TriggerSynEdit.Lines.Clear;
  if not DataSet.FieldByName('DESCRIPTION').IsNull then
  begin
    TriggerSynEdit.Lines.BeginUpdate;
    TriggerSynEdit.Lines.Text := 'CREATE OR REPLACE TRIGGER ' + DataSet.FieldByName('DESCRIPTION').AsWideString +
      DataSet.FieldByName('TRIGGER_BODY').AsWideString;
    TriggerSynEdit.Lines.EndUpdate;
  end;
end;

function TViewBrowserFrame.GetViewColumns: TStringList;
begin
  Result := TStringList.Create;
  { make sure columns query is open }
  OpenQuery(ColumnsQuery);

  with ColumnsQuery do
  begin
    First;
    while not Eof do
    begin
      Result.Add(FieldByName(COLUMN_NAME).AsWideString);
      Next;
    end;
    First;
  end;
end;

procedure TViewBrowserFrame.GrantPrivilegesActionExecute(Sender: TObject);
begin
  Lib.ExecuteActionFromList(SchemaActionList, 'GrantPrivilegesForObjectAction');
  RefreshAction.Execute;
end;

procedure TViewBrowserFrame.GrantsDBGridSelectionChanged(Sender: TObject);
begin
  SetGrantActions;
end;

procedure TViewBrowserFrame.GrantsQueryAfterOpen(DataSet: TDataSet);
begin
  SetGrantActions;
end;

function TViewBrowserFrame.GetCurrentDataFilter: string;
begin
  {Result := '';
  if FilterMultiStringHolder.MultipleStrings.DoesNameExist(FObjectName) then
    Result := FilterMultiStringHolder.StringsByName[FObjectName].Text;  }
  Result := DataFilterDialog.GetCurrentDataFilter(FObjectName, FSchemaParam);

  if Trim(Result) <> '' then
    FilterAction.ImageIndex := 1
  else
    FilterAction.ImageIndex := 0;
end;

function TViewBrowserFrame.GetCurrentDataSort: string;
begin
  Result := DataSortDialog.GetCurrentDataSort(FObjectName, FSchemaParam);

  if Trim(Result) <> '' then
    SortAction.ImageIndex := 5
  else
    SortAction.ImageIndex := 4;
end;

procedure TViewBrowserFrame.CustomizeActionExecute(Sender: TObject);
begin
  CustomizePageControlDialog.Open(ViewPageControl);
end;

procedure TViewBrowserFrame.DataDBGridAdvDrawDataCell(Sender: TCustomDBGridEh; Cell, AreaCell: TGridCoord;
  Column: TColumnEh; const ARect: TRect; var Params: TColCellParamsEh; var Processed: Boolean);
begin
  GridDrawStringDataCell(Column, Params);
end;

procedure TViewBrowserFrame.DataDBGridMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  // this fixes the bug when popup is popped from grid - it won't get the focus }
  if Button = mbRight then
    DataPopupActionBar.Popup(Mouse.CursorPos.X, Mouse.CursorPos.Y);
end;

procedure TViewBrowserFrame.DropDownMenuClick(Sender: TObject);
var
  Item: TMenuItem;
  ItemName: string;
begin
  Item := Sender as TMenuItem;
  Item.Checked := True;
  ItemName := StringReplace(Item.Caption, '&', '', []);
  DataFilterDialog.SetCurrentDataFilter(FObjectName, FSchemaParam, ItemName);
  UpdateFilterDropDownMenu;
  OpenQuery(FDataQuery, True);
end;

procedure TViewBrowserFrame.DropDownSortMenuClick(Sender: TObject);
var
  Item: TMenuItem;
  ItemName: string;
begin
  Item := Sender as TMenuItem;
  Item.Checked := True;
  ItemName := StringReplace(Item.Caption, '&', '', []);
  DataSortDialog.SetCurrentDataSort(FObjectName, FSchemaParam, ItemName);
  UpdateSortDropDownMenu;
  OpenQuery(FDataQuery, True);
end;

procedure TViewBrowserFrame.DropSynonymActionExecute(Sender: TObject);
//var
//  SynonymAvailability: string;
begin
  Lib.DropSelectedSynonyms(FSession, SynonymsDBGrid);
  {if Common.AskYesOrNo(Format('Drop synonym %s, are you sure?', [SynonymsQuery.FieldByName(SYNONYM_NAME).AsString])) then
  begin
    SynonymAvailability := '';
    if SynonymsQuery.FieldByName(SYNONYM_OWNER).AsString = 'PUBLIC' then
      SynonymAvailability := 'PUBLIC ';
    SynonymsQuery.Session.ExecSQL(Format('DROP %sSYNONYM %s', [SynonymAvailability, SynonymsQuery.FieldByName(SYNONYM_NAME).AsString]), []);
    SynonymsQuery.Refresh;
  end; }
end;


procedure TViewBrowserFrame.DropTriggerActionExecute(Sender: TObject);
begin
  Lib.DropSelectedTriggers(FSession, FSchemaParam, TriggersDBGrid);
end;

procedure TViewBrowserFrame.EnableTriggerActionExecute(Sender: TObject);
begin
  AlterSelectedTriggers(FSession, FSchemaParam, TriggersDBGrid, True);
  //AlterTrigger(FSession, TriggersQuery.FieldByName(TRIGGER_NAME).AsString, True);
  //TriggersQuery.Refresh;
end;

procedure TViewBrowserFrame.ExportTableDataActionExecute(Sender: TObject);
begin
  MainForm.DatabaseExportTableDataAction.Execute;
end;

procedure TViewBrowserFrame.InsertFiltersToDropDownMenu(PopupActionBar: TPopupActionBar);
var
  i: Integer;
  KeyValue, CurrentValue, s: string;
  Item: TMenuItem;
begin
  KeyValue := EncryptString(FObjectName + '@' + FSchemaParam);
  CurrentValue := EncryptString(':CURRENT');
  for i := 0 to DataFilterDialog.ValuesList.RowCount - 1 do
    if Pos(KeyValue, DataFilterDialog.ValuesList.Keys[i]) <> 0 then
      if Pos(CurrentValue, DataFilterDialog.ValuesList.Keys[i]) = 0 then
      begin
        Item := TMenuItem.Create(PopupActionBar);
        Item.Tag := 1;
        Item.GroupIndex := 1;
        s := DecryptString(DataFilterDialog.ValuesList.Keys[i]);
        Item.Caption := Copy(s, Pos(':', s) + 1, Length(s));
        Item.OnClick := DropDownMenuClick;
        PopupActionBar.Items.Add(Item);
      end;
end;

procedure TViewBrowserFrame.InsertSortsToDropDownMenu(PopupActionBar: TPopupActionBar);
var
  i: Integer;
  KeyValue, CurrentValue, s: string;
  Item: TMenuItem;
begin
  KeyValue := EncryptString(FObjectName + '@' + FSchemaParam);
  CurrentValue := EncryptString(':CURRENT');
  for i := 0 to DataSortDialog.ValuesList.RowCount - 1 do
    if Pos(KeyValue, DataSortDialog.ValuesList.Keys[i]) <> 0 then
      if Pos(CurrentValue, DataSortDialog.ValuesList.Keys[i]) = 0 then
      begin
        Item := TMenuItem.Create(PopupActionBar);
        Item.Tag := 1;
        Item.GroupIndex := 1;
        Item.RadioItem := True;
        s := DecryptString(DataSortDialog.ValuesList.Keys[i]);
        Item.Caption := Copy(s, Pos(':', s) + 1, Length(s));
        Item.OnClick := DropDownSortMenuClick;
        PopupActionBar.Items.Add(Item);
      end;
end;

procedure TViewBrowserFrame.NoFilterActionExecute(Sender: TObject);
var
  i: Integer;
begin
  { remove current filter }
  for i := DataFilterDialog.ValuesList.RowCount - 1 downto 0 do
  begin
     if EncryptString(FObjectName + '@' + FSchemaParam + ':CURRENT') = DataFilterDialog.ValuesList.Keys[i] then
     begin
       DataFilterDialog.ValuesList.DeleteRow(i);
       Break;
     end;
   end;
  { Set checked }
  NoFilterMenuItem.Checked := True;

  OpenQuery(FDataQuery, True);
end;

procedure TViewBrowserFrame.NoSortActionExecute(Sender: TObject);
var
  i: Integer;
begin
  { remove current filter }
  for i := DataSortDialog.ValuesList.RowCount - 1 downto 0 do
  begin
     if EncryptString(FObjectName + '@' + FSchemaParam + ':CURRENT') = DataSortDialog.ValuesList.Keys[i] then
     begin
       DataSortDialog.ValuesList.DeleteRow(i);
       Break;
     end;
   end;
  { Set checked }
  NoSortMenuItem.Checked := True;

  OpenQuery(FDataQuery, True);
end;

procedure TViewBrowserFrame.UpdateFilterDropDownMenu;
var
  i: Integer;
  FilterName: string;
begin
  FilterName := DataFilterDialog.GetCurrentFilterName(FObjectName, FSchemaParam);
  RemoveCurrentFilterAction.Enabled := FilterName <> '';
  NoFilterAction.Checked := not RemoveCurrentFilterAction.Enabled;
  { Remove filters }
  for i := FilterDropDownPopupActionBar.Items.Count - 1 downto 0 do
    if FilterDropDownPopupActionBar.Items[i].Tag = 1 then
      FilterDropDownPopupActionBar.Items[i].Destroy;
  { Insert filters }
  InsertFiltersToDropDownMenu(FilterDropDownPopupActionBar);
  { Check item }
  if FilterName <> '' then
    if Assigned(FilterDropDownPopupActionBar.Items.Find(FilterName)) then
      FilterDropDownPopupActionBar.Items.Find(FilterName).Checked := True
end;

procedure TViewBrowserFrame.SetSortMarkers(OrderSQL: string);
var
  SQL, ColumnName: string;
  SortMarker: TSortMarkerEh;
  Column: TColumnEh;

  function FindColumnByName(ColumnName: String): TColumnEh;
  var
    i: Integer;
  begin
    Result := nil;
    with DataDBGrid.Columns do
    for i := 0 to Count-1 do
    begin
      if Pos(ColumnName, Items[i].Name) <> 0 then
      begin
        Result := Items[i];
        Exit;
      end;
    end;
  end;
begin
  SQL := Trim(OrderSQL);
  while Length(SQL) > 0 do
  begin
    ColumnName := Copy(SQL, 1, Pos(' ', SQL) - 1);
    if (Pos('ASC', SQL) <> 0) and (Pos('DESC', SQL) <> 0) then
    begin
      if Pos('ASC', SQL) < Pos('DESC', SQL) then
        SortMarker := smUpEh
      else
        SortMarker := smDownEh
    end
    else
    if Pos('ASC', SQL) <> 0 then
      SortMarker := smUpEh
    else
      SortMarker := smDownEh;

    Column := FindColumnByName(ColumnName);
    if Assigned(Column) then
      Column.Title.SortMarker := SortMarker;

    if Pos(',', SQL) <> 0 then
      SQL := Trim(Copy(SQL, Pos(',', SQL) + 1, Length(SQL)))
    else
      SQL := '';
  end;
end;

procedure TViewBrowserFrame.UpdateSortDropDownMenu;
var
  i: Integer;
  SortName: string;
begin
  SortName := DataSortDialog.GetCurrentSortName(FObjectName, FSchemaParam);
  RemoveCurrentSortAction.Enabled := SortName <> '';
 // NoFilterAction.Checked := not RemoveCurrentFilterAction.Enabled;
  { Remove filters }
  for i := SortDropDownPopupActionBar.Items.Count - 1 downto 0 do
    if SortDropDownPopupActionBar.Items[i].Tag = 1 then
      SortDropDownPopupActionBar.Items[i].Destroy;
  { Insert filters }
  InsertSortsToDropDownMenu(SortDropDownPopupActionBar);
  { Check item }
  if SortName <> '' then
    if Assigned(SortDropDownPopupActionBar.Items.Find(SortName)) then
      SortDropDownPopupActionBar.Items.Find(SortName).Checked := True
end;

procedure TViewBrowserFrame.FilterActionExecute(Sender: TObject);
var
  Columns: TStringList;
begin
  if not Visible then
    Exit;
  if ViewPageControl.ActivePage <> DataTabSheet then
    Exit;
  try
    Columns := GetViewColumns;

    if DataFilterDialog.Open(FObjectName, FSchemaParam, Columns{ FilterText}) then
    begin
      UpdateFilterDropDownMenu;
      OpenQuery(FDataQuery, True);
    end;
  finally
    FreeAndNil(Columns);
  end;
end;

procedure TViewBrowserFrame.DataQueryAfterScroll(DataSet: TDataSet);
var
  RecCount: Integer;
begin
  RecCount := DataSet.RecordCount;
  if RecCount = 0 then
    DataButtonPanel.Caption := 'No rows'
  else
  begin
    DataButtonPanel.Caption := 'Row ' + IntToStr(DataSet.RecNo) + ' of ' + IntToStr(RecCount);
    if TOraQuery(DataSet).Fetched then
      DataButtonPanel.Caption := DataButtonPanel.Caption + ' total'
    else
      DataButtonPanel.Caption := DataButtonPanel.Caption + ' fetched';
  end;
end;

procedure TViewBrowserFrame.DisableTriggerActionExecute(Sender: TObject);
begin
  AlterSelectedTriggers(FSession, FSchemaParam, TriggersDBGrid, False);
  //AlterTrigger(FSession, TriggersQuery.FieldByName(TRIGGER_NAME).AsString, False);
  //TriggersQuery.Refresh;
end;

function TViewBrowserFrame.GetActivePageQuery(Refresh: Boolean): TOraQuery;
begin
  Result := nil;
  if ViewPageControl.ActivePage = ColumnsTabSheet then
  begin
    CreationAndModificationTimestampLabel.Caption := '';
    if OptionsContainer.ShowObjectCreationAndModificationTimestamp then
      CreationAndModificationTimestampLabel.Caption := GetCreationAndModificationTimestamp(FSession, FSchemaParam, FObjectName);
    Result := ColumnsQuery
  end
  else
  if ViewPageControl.ActivePage = DataTabSheet then
  begin
    if Assigned(FDataQuery) and not Refresh then
      Exit(FDataQuery);
    if Assigned(FDataQuery) then
    begin
      FDataQuery.Free;
      FDataQuery := nil;
    end;
    FDataQuery := TOraQuery.Create(Self);
    FDataQuery.Session := FSession;
    FDataQuery.AutoCommit := False;
    FDataQuery.FetchRows := 500;
    FDataQuery.AfterScroll := DataQueryAfterScroll;
    FDataQuery.Options.RawAsString := True;
    DataDataSource.DataSet := FDataQuery;
    FQuickSort := '';

    Result := FDataQuery
  end
  else
  if ViewPageControl.ActivePage = SourceTabSheet then
    Result := SourceQuery
  else
  if ViewPageControl.ActivePage = TriggersTabSheet then
    Result := TriggersQuery
  else
  if ViewPageControl.ActivePage = GrantsTabSheet then
    Result := GrantsQuery
  else
  if ViewPageControl.ActivePage = SynonymsTabSheet then
    Result := SynonymsQuery
  else
  if ViewPageControl.ActivePage = DependenciesTabSheet then
    Result := DependenciesQuery
end;

procedure TViewBrowserFrame.SaveToFileActionExecute(Sender: TObject);
begin
  Lib.SaveSQL(Handle, SourceSynEdit);
end;

procedure TViewBrowserFrame.SetColumnWidths(OraQuery: TOraQuery);
begin
  Application.ProcessMessages;
  OraQuery.DisableControls;
  if OraQuery = FDataQuery then
    Lib.SetGridColumnWidths(DataDBGrid, True)
  else
  if OraQuery = ColumnsQuery then
    Lib.SetGridColumnWidths(ColumnsDBGrid)
  else
  if OraQuery = TriggersQuery then
  begin
    TriggersDBGrid.Columns[4].Visible := False;
    TriggersDBGrid.Columns[5].Visible := False;
    Application.ProcessMessages;
    SetGridColumnWidths(TriggersDBGrid)
  end
  else
  if OraQuery = SynonymsQuery then
    SetGridColumnWidths(SynonymsDBGrid)
  else
  if OraQuery = GrantsQuery then
    SetGridColumnWidths(GrantsDBGrid)
  else
  if OraQuery = DependenciesQuery then
    SetGridColumnWidths(DependenciesDBGrid);
  OraQuery.EnableControls;
end;

procedure TViewBrowserFrame.GetText(Sender: TField; var Text: String; DisplayText: Boolean);
begin
  Text := Copy(Sender.AsString, 1, 50);
end;

procedure TViewBrowserFrame.SelectAllActionExecute(Sender: TObject);
begin
  MainForm.EditSelectAllAction.Execute;
end;

procedure TViewBrowserFrame.SetClobAndTimestampFields(OraQuery: TOraQuery);
var
  i: Integer;
begin
  for i := 0 to OraQuery.Fields.Count - 1 do
  begin
    if OraQuery.Fields[i].DataType = ftOraClob then
      OraQuery.Fields[i].OnGetText := GetText
    else
    if OraQuery.Fields[i].DataType = ftTimestamp then
      TOraTimeStampField (OraQuery.Fields[i]).Format := OptionsContainer.DateFormat + ' ' + OptionsContainer.TimeFormat;
  end
end;

procedure TViewBrowserFrame.OpenQuery(Query: TOraQuery; RefreshQuery: Boolean);
var
  Sort, DataFilter: string;
  OraQuery: TOraQuery;
begin
  Screen.Cursor := crSQLWait;
  try
    if not Assigned(Query) then
      OraQuery := GetActivePageQuery(RefreshQuery)
    else
      OraQuery := Query;

    if Assigned(OraQuery) then
    begin
      if (not RefreshQuery) and OraQuery.Active and (OraQuery.ParamByName('P_VIEW_NAME').AsWideString = FObjectName) then
        Exit;

      with OraQuery do
      begin
        Close;
        UnPrepare;
        if (OraQuery = FDataQuery) and (RefreshQuery or (not Assigned(Query))) then
        begin
          //DataDBGrid.SortedFields := nil;
          SQL.Clear;
          SQL.Add(Format('SELECT * FROM %s.%s WHERE :P_VIEW_NAME = :P_VIEW_NAME', [FSchemaParam, FObjectName]));
          //Filtered := False;
          DataFilter := GetCurrentDataFilter;
          if DataFilter <> '' then
            SQL.Add('AND ' + DataFilter);
            //Filtered := True;
          Sort := GetCurrentDataSort;

          if Sort <> '' then
            SQL.Add('ORDER BY ' + Sort)
          else
          if FQuickSort <> '' then
            SQL.Add('ORDER BY ' + FQuickSort);
        end;
        ParamByName('P_VIEW_NAME').AsWideString := FObjectName;
        if OraQuery <> FDataQuery then
        //begin
        //  ParamByName('P_VIEW_NAME').AsWideString := FObjectName;
          ParamByName('P_OWNER').AsWideString := FSchemaParam;
        //end;
        if (OraQuery = FDataQuery) then
        begin
          AddAllFields(OraQuery);
          SetClobAndTimestampFields(OraQuery);
        end;
        Prepare;
        Open;
        SetColumnWidths(OraQuery);
        if OraQuery = FDataQuery then
        begin
          if Sort <> '' then
            SetSortMarkers(Sort)
          else
          if FQuickSort <> '' then
            SetSortMarkers(FQuickSort);
        end;
      end;
    end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TViewBrowserFrame.SetHighlighterTableNames(Value: TStrings);
begin
  SynSQLSyn.TableNames.Text := Value.Text;
end;

procedure TViewBrowserFrame.AlterViewActionExecute(Sender: TObject);
begin
  Lib.ExecuteActionFromList(SchemaActionList, 'AlterViewAction');
  RefreshAction.Execute;
end;

procedure TViewBrowserFrame.ColumnsDBGridTitleClick(Column: TColumnEh);
begin
  { if sort enabled, can't quick sort }
  if SortAction.ImageIndex = 7 then
    Exit;

  if Column.Title.SortMarker = smNoneEh then
    FQuickSort := Column.Title.Caption + ' ASC'
  else
  if Column.Title.SortMarker = smUpEh then
    FQuickSort := Column.Title.Caption + ' DESC'
  else
    FQuickSort := '';
  OpenQuery(FDataQuery, True);
end;

procedure TViewBrowserFrame.CopyToClipboard;
begin
  if ViewPageControl.ActivePageCaption = 'Source' then
    SourceSynEdit.CopyToClipboard
  else
  if ViewPageControl.ActivePageCaption = 'Data' then
    Lib.CopyDataFromDBGridToClipboard(DataDBGrid);
end;

procedure TViewBrowserFrame.SetTriggerActions;
begin
  EnableTriggerAction.Enabled := (not TriggersQuery.FieldByName(TRIGGER_STATUS).IsNull) and
    (TriggersDBGrid.SelectedRows.Count > 0) and
    ((TriggersQuery.FieldByName(TRIGGER_STATUS).AsString <> STATUS_ENABLED) or (TriggersDBGrid.SelectedRows.Count > 1));
  DisableTriggerAction.Enabled := (not TriggersQuery.FieldByName(TRIGGER_STATUS).IsNull) and
    (TriggersDBGrid.SelectedRows.Count > 0) and
    ((TriggersQuery.FieldByName(TRIGGER_STATUS).AsString = STATUS_ENABLED) or (TriggersDBGrid.SelectedRows.Count > 1));
  DropTriggerAction.Enabled := (not TriggersQuery.FieldByName(TRIGGER_STATUS).IsNull) and
    (TriggersDBGrid.SelectedRows.Count > 0);
end;

procedure TViewBrowserFrame.SetGrantActions;
begin
  RevokePrivilegesAction.Enabled := GrantsDBGrid.SelectedRows.Count > 0;
end;

procedure TViewBrowserFrame.SetSynonymActions;
begin
  DropSynonymAction.Enabled := SynonymsDBGrid.SelectedRows.Count > 0;
end;

procedure TViewBrowserFrame.GetViewComments;
begin
  MainForm.StatusBar.Panels[3].Text := GetTableOrViewComment(FSession, FSchemaParam, FObjectName);
end;

procedure TViewBrowserFrame.SetObjectFrameAlign(Value: TAlign);
begin
  ColumnsButtonPanel.Align := Value;
  SourceButtonPanel.Align := Value;
  DataButtonPanel.Align := Value;
  TriggersButtonPanel.Align := Value;
  GrantsButtonPanel.Align := Value;
  SynonymsButtonPanel.Align := Value;
  DependenciesButtonPanel.Align := Value;
end;

end.
