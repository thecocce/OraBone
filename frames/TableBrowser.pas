unit TableBrowser;

interface

uses
  Winapi.Windows, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Ora,
  Vcl.ComCtrls, JvExComCtrls, JvComCtrls, DBAccess, MemDS, Vcl.ExtCtrls, Vcl.DBCtrls, JvStringHolder, Vcl.Buttons,
  Vcl.ActnList, BCControls.PageControl, Vcl.ImgList, SynEditHighlighter, SynHighlighterSQL, SynEdit, Vcl.AppEvnts,
  Vcl.ToolWin, Vcl.Menus, Vcl.StdCtrls, Vcl.PlatformDefaultStyleActnCtrls, Vcl.ActnPopup,
  Vcl.StdStyleActnCtrls, BCControls.ImageList, BCControls.ToolBar, BCControls.DBGrid, Data.DB, System.Actions,
  ToolCtrlsEh, GridsEh, DBAxisGridsEh, DBGridEh, DBGridEhGrouping, DBGridEhToolCtrls, Vcl.Grids, Vcl.DBGrids, DynVarsEh;

type
  TTableBrowserFrame = class(TFrame)
    TablePageControl: TBCPageControl;
    ColumnsTabSheet: TTabSheet;
    DataTabSheet: TTabSheet;
    ConstraintsTabSheet: TTabSheet;
    TriggersTabSheet: TTabSheet;
    IndexesTabSheet: TTabSheet;
    GrantsTabSheet: TTabSheet;
    ReferencedByTabSheet: TTabSheet;
    DependenciesTabSheet: TTabSheet;
    ColumnsPanel: TPanel;
    ColumnsQuery: TOraQuery;
    ColumnsDataSource: TOraDataSource;
    DataPanel: TPanel;
    DataDataSource: TOraDataSource;
    SQLStringHolder: TJvMultiStringHolder;
    ImageList: TBCImageList;
    ActionList: TActionList;
    FilterAction: TAction;
    CommitAction: TAction;
    RollbackAction: TAction;
    ConstraintsClientPanel: TPanel;
    ConstraintsDBGrid: TBCDBGrid;
    ConstraintsQuery: TOraQuery;
    ConstraintsDataSource: TOraDataSource;
    TriggersQuery: TOraQuery;
    TriggersDataSource: TOraDataSource;
    GrantsDataSource: TOraDataSource;
    GrantsQuery: TOraQuery;
    IndexesDataSource: TOraDataSource;
    IndexesQuery: TOraQuery;
    ReferencesDataSource: TOraDataSource;
    ReferencesQuery: TOraQuery;
    DependenciesDataSource: TOraDataSource;
    DependenciesQuery: TOraQuery;
    TriggersTopPanel: TPanel;
    TriggersDBGrid: TBCDBGrid;
    TriggersSplitter: TSplitter;
    TriggersBottomPanel: TPanel;
    TriggerSynEdit: TSynEdit;
    IndexesPanel: TPanel;
    IndexesDBGrid: TBCDBGrid;
    GrantsPanel: TPanel;
    GrantsDBGrid: TBCDBGrid;
    ReferencedByQuery: TOraQuery;
    ReferencedByDataSource: TOraDataSource;
    ReferencedByPanel: TPanel;
    ReferencedByDBGrid: TBCDBGrid;
    ReferencesTabSheet: TTabSheet;
    ReferencesPanel: TPanel;
    ReferencesDBGrid: TBCDBGrid;
    DependenciesPanel: TPanel;
    DependenciesDBGrid: TBCDBGrid;
    SynonymsQuery: TOraQuery;
    SynonymsDataSource: TOraDataSource;
    SynonymsTabSheet: TTabSheet;
    SynonymsPanel: TPanel;
    SynonymsDBGrid: TBCDBGrid;
    SynSQLSyn: TSynSQLSyn;
    SourceTabSheet: TTabSheet;
    SQLEditorAction: TAction;
    SourcePanel: TPanel;
    SourceSynEdit: TSynEdit;
    SourceQuery: TOraQuery;
    SourceDataSource: TOraDataSource;
    FilterDropDownPopupActionBar: TPopupActionBar;
    est1: TMenuItem;
    N1: TMenuItem;
    NoFilterMenuItem: TMenuItem;
    RefreshAction: TAction;
    RemoveCurrentFilterAction: TAction;
    NoFilterAction: TAction;
    DataPopupActionBar: TPopupActionBar;
    ExportMenuItem: TMenuItem;
    CommitMenuItem: TMenuItem;
    RollbackMenuItem: TMenuItem;
    N2: TMenuItem;
    RefreshMenuItem: TMenuItem;
    N3: TMenuItem;
    InsertRowMenuItem: TMenuItem;
    DeleteRowMenuItem: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    SelectAllMenuItem: TMenuItem;
    InsertRowAction: TAction;
    DeleteRowAction: TAction;
    SortAction: TAction;
    SortDropDownPopupActionBar: TPopupActionBar;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    NoSortMenuItem: TMenuItem;
    RemoveCurrentSortAction: TAction;
    NoSortAction: TAction;
    PageControlPopupActionBar: TPopupActionBar;
    CustomizeAction: TAction;
    CustomizePageControl1: TMenuItem;
    ConstraintBottomPanel: TPanel;
    ConstraintSplitter: TSplitter;
    ConstraintColumnsQuery: TOraQuery;
    ConstraintColumnsDBGrid: TBCDBGrid;
    ConstraintColumnsDataSource: TOraDataSource;
    DuplicateRowAction: TAction;
    DublicateRow1: TMenuItem;
    EnableConstraintAction: TAction;
    DisableConstraintAction: TAction;
    EnableTriggerAction: TAction;
    DisableTriggerAction: TAction;
    SourceButtonPanel: TPanel;
    SourceToolBar: TBCToolBar;
    SQLEditorToolButton: TToolButton;
    SetSourceClickAction: TAction;
    ToolButton11: TToolButton;
    ToolButton12: TToolButton;
    CopyToClipboardAction: TAction;
    SaveToFileAction: TAction;
    N6: TMenuItem;
    CustomizeTableColumns1: TMenuItem;
    CustomizeTableColumnsAction: TAction;
    CreateConstraintAction: TAction;
    DropConstraintAction: TAction;
    CreateTriggerAction: TAction;
    DropTriggerAction: TAction;
    IndexesButtonPanel: TPanel;
    JvToolBar2: TBCToolBar;
    ToolButton19: TToolButton;
    ToolButton20: TToolButton;
    CreateIndexAction: TAction;
    DropIndexAction: TAction;
    GrantsButtonPanel: TPanel;
    JvToolBar3: TBCToolBar;
    ToolButton21: TToolButton;
    ToolButton22: TToolButton;
    GrantPrivilegesAction: TAction;
    RevokePrivilegesAction: TAction;
    SynonymsButtonPanel: TPanel;
    JvToolBar4: TBCToolBar;
    ToolButton23: TToolButton;
    ToolButton24: TToolButton;
    CreateSynonymAction: TAction;
    DropSynonymAction: TAction;
    ColumnsButtonPanel: TPanel;
    JvToolBar5: TBCToolBar;
    ToolButton25: TToolButton;
    AlterTableAction: TAction;
    ToolButton26: TToolButton;
    AnalyzeTableAction: TAction;
    ConstraintButtonPanel: TPanel;
    ConstraintToolBar: TBCToolBar;
    ToolButton13: TToolButton;
    ToolButton14: TToolButton;
    TriggersButtonPanel: TPanel;
    TriggersToolBar: TBCToolBar;
    ToolButton16: TToolButton;
    ToolButton17: TToolButton;
    SelectAllAction: TAction;
    ExportTableDataAction: TAction;
    DataButtonPanel: TPanel;
    DataToolBar: TBCToolBar;
    ToolButton7: TToolButton;
    ToolButton1: TToolButton;
    ReferencedByButtonPanel: TPanel;
    ReferencedByToolBar: TBCToolBar;
    ToolButton44: TToolButton;
    ReferencesButtonPanel: TPanel;
    ReferencesToolBar: TBCToolBar;
    ToolButton41: TToolButton;
    DependenciesButtonPanel: TPanel;
    DependenciesToolBar: TBCToolBar;
    ToolButton42: TToolButton;
    DataDBNavigator: TDBNavigator;
    ColumnsDBGrid: TBCDBGrid;
    DataDBGrid: TBCDBGrid;
    CommitRollbackToolBar: TBCToolBar;
    ToolButton43: TToolButton;
    ToolButton45: TToolButton;
    RefreshToolbar: TBCToolBar;
    ToolButton46: TToolButton;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Bevel3: TBevel;
    BCToolBar1: TBCToolBar;
    ToolButton2: TToolButton;
    Bevel4: TBevel;
    BCToolBar2: TBCToolBar;
    ToolButton3: TToolButton;
    Bevel5: TBevel;
    BCToolBar3: TBCToolBar;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    Bevel6: TBevel;
    Bevel7: TBevel;
    BCToolBar4: TBCToolBar;
    ToolButton6: TToolButton;
    BCToolBar5: TBCToolBar;
    ToolButton10: TToolButton;
    ToolButton15: TToolButton;
    Bevel8: TBevel;
    Bevel9: TBevel;
    BCToolBar6: TBCToolBar;
    ToolButton8: TToolButton;
    Bevel10: TBevel;
    BCToolBar7: TBCToolBar;
    ToolButton9: TToolButton;
    Bevel11: TBevel;
    BCToolBar8: TBCToolBar;
    ToolButton18: TToolButton;
    Bevel12: TBevel;
    BCToolBar9: TBCToolBar;
    ToolButton27: TToolButton;
    BCToolBar10: TBCToolBar;
    ToolButton28: TToolButton;
    SourceOptionsAction: TAction;
    CreationAndModificationTimestampLabel: TLabel;
    procedure TablePageControlChange(Sender: TObject);
    procedure FilterActionExecute(Sender: TObject);
    procedure TriggersQueryAfterScroll(DataSet: TDataSet);
    procedure CommitActionExecute(Sender: TObject);
    procedure RollbackActionExecute(Sender: TObject);
    procedure DataQueryBefore(DataSet: TDataSet);
    procedure SQLEditorActionExecute(Sender: TObject);
    procedure SourceQueryAfterOpen(DataSet: TDataSet);
    procedure RefreshActionExecute(Sender: TObject);
    procedure RemoveCurrentFilterActionExecute(Sender: TObject);
    procedure NoFilterActionExecute(Sender: TObject);
    procedure DataQueryAfterScroll(DataSet: TDataSet);
    procedure InsertRowActionExecute(Sender: TObject);
    procedure DeleteRowActionExecute(Sender: TObject);
    procedure SortActionExecute(Sender: TObject);
    procedure RemoveCurrentSortActionExecute(Sender: TObject);
    procedure NoSortActionExecute(Sender: TObject);
    procedure CustomizeActionExecute(Sender: TObject);
    procedure ConstraintsQueryAfterScroll(DataSet: TDataSet);
    procedure ReferencedByQueryAfterOpen(DataSet: TDataSet);
    procedure ReferencesQueryAfterOpen(DataSet: TDataSet);
    procedure DataDBNavigatorBeforeAction(Sender: TObject; Button: TNavigateBtn);
    procedure DuplicateRowActionExecute(Sender: TObject);
    procedure EnableConstraintActionExecute(Sender: TObject);
    procedure DisableConstraintActionExecute(Sender: TObject);
    procedure EnableTriggerActionExecute(Sender: TObject);
    procedure DisableTriggerActionExecute(Sender: TObject);
    procedure SetSourceClickActionExecute(Sender: TObject);
    procedure ConstraintsQueryAfterOpen(DataSet: TDataSet);
    procedure TriggersQueryAfterOpen(DataSet: TDataSet);
    procedure CopyToClipboardActionExecute(Sender: TObject);
    procedure SaveToFileActionExecute(Sender: TObject);
    procedure CustomizeTableColumnsActionExecute(Sender: TObject);
    procedure GetText(Sender: TField; var Text: String; DisplayText: Boolean);
    procedure CreateConstraintActionExecute(Sender: TObject);
    procedure DropConstraintActionExecute(Sender: TObject);
    procedure CreateTriggerActionExecute(Sender: TObject);
    procedure DropTriggerActionExecute(Sender: TObject);
    procedure CreateIndexActionExecute(Sender: TObject);
    procedure DropIndexActionExecute(Sender: TObject);
    procedure GrantsQueryAfterOpen(DataSet: TDataSet);
    procedure IndexesQueryAfterOpen(DataSet: TDataSet);
    procedure GrantPrivilegesActionExecute(Sender: TObject);
    procedure RevokePrivilegesActionExecute(Sender: TObject);
    procedure CreateSynonymActionExecute(Sender: TObject);
    procedure DropSynonymActionExecute(Sender: TObject);
    procedure SynonymsQueryAfterOpen(DataSet: TDataSet);
    procedure AlterTableActionExecute(Sender: TObject);
    procedure AnalyzeTableActionExecute(Sender: TObject);
    procedure SelectAllActionExecute(Sender: TObject);
    procedure ExportTableDataActionExecute(Sender: TObject);
    procedure DataQueryQueryAfterFetch(DataSet: TCustomDADataSet);
    procedure DataQueryQueryBeforeFetch(DataSet: TCustomDADataSet; var Cancel: Boolean);
    procedure DataDBGridDblClick(Sender: TObject);
    procedure DataDBGridMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X,
      Y: Integer);
    procedure ConstraintsDBGridSelectionChanged(Sender: TObject);
    procedure TriggersDBGridSelectionChanged(Sender: TObject);
    procedure IndexesDBGridSelectionChanged(Sender: TObject);
    procedure GrantsDBGridSelectionChanged(Sender: TObject);
    procedure SynonymsDBGridSelectionChanged(Sender: TObject);
    procedure DataDBGridTitleClick(Column: TColumnEh);
    procedure SourceOptionsActionExecute(Sender: TObject);
    procedure DataDBGridSelectionChanged(Sender: TObject);
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
    function GetTableColumns: TStringList;
    function GetCurrentDataFilter: string;
    function GetCurrentDataSort: string;
    procedure SetCommitRollback;
    procedure SetHighlighterTableNames(Value: TStrings);
    procedure InsertFiltersToDropDownMenu(PopupActionBar: TPopupActionBar);
    procedure InsertSortsToDropDownMenu(PopupActionBar: TPopupActionBar);
    procedure DropDownFilterMenuClick(Sender: TObject);
    procedure DropDownSortMenuClick(Sender: TObject);
    function GetQueryOpened: Boolean;
    procedure SetColumnWidths(OraQuery: TOraQuery);
    procedure SetSource;
    procedure SetConstraintActions;
    procedure SetTriggerActions;
    procedure SetGrantActions;
    procedure SetIndexActions;
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
    property ObjectFrameAlign: TAlign write SetObjectFrameAlign;
    procedure UpdateFilterDropDownMenu;
    procedure UpdateSortDropDownMenu;
    procedure CopyToClipboard;
    procedure GetTableComments;
    property ShowDataSearchPanel: Boolean write SetShowDataSearchPanel;
    //property DataQuery: TOraQuery read FDataQuery;
  end;

implementation

uses
  DataFilter, DataSort, Main, StringData, CustomizePages, UxTheme, Blob, BCCommon.Lib, BCCommon.StringUtils,
  CustomizeTableColumns, BCCommon.OptionsContainer, Lib, TableSourceOptions, DataModule, BCCommon.Dialogs,
  BCCommon.LanguageStrings, BCCommon.Messages;

const
  { ColumnsQuery columns }
  COLUMN_NAME = 'Column Name';
  NULLABLE = 'Nullable';
  NOT_NULL = 'NOT NULL';
  DATA_TYPE = 'Data Type';
  COMMENTS = 'Comments';
  { IndexesQuoery columns }
  INDEX_NAME = 'Index Name';
  UNIQUENESS = 'Uniqueness';
  { ConstraintsQuery columns }
  CONSTRAINT_NAME = 'Constraint Name';
  CONSTRAINT_COLUMN = 'Constraint Column';
  CONSTRAINT_TYPE = 'Type';
  CONSTRAINT_STATUS = 'Status';
  STATUS_ENABLED = 'Enabled';
  POSITION = 'Position';
  { TriggersQuery columns }
  TRIGGER_NAME = 'Trigger Name';
  TRIGGER_STATUS = 'Status';
  { SynonymsQuery columns }
  SYNONYM_OWNER = 'Synonym Owner';
  SYNONYM_NAME = 'Synonym Name';
  OBJECT_OWNER = 'Object Owner';
  OBJECT_NAME = 'Object Name';
  { GrantsQuery columns }
  GRANTEE = 'Granted To';
  PRIVILEGE = 'Privilege';
  { ReferencedByQuery and ReferencesQuery columns }
  COLUMN_TABLE = 'Table';
  COLUMN_COLUMNS = 'Columns';
  COLUMN_FOREIGN_KEY = 'Foreign Key';
  COLUMN_REF_TABLE = 'Ref. Table';
  COLUMN_REF_CONSTRAINT = 'Ref. Constraint';
  COLUMN_REF_COLUMNS = 'Ref. Columns';
  COLUMN_REF_FOREIGN_KEY = 'Ref. Foreign Key';
  COLUMN_CONSTRAINT = 'Constraint';

{$R *.dfm}

constructor TTableBrowserFrame.Create(AOwner: TComponent; ParentPanel: TPanel;
  OraSession: TOraSession; SchemaParam: string);
begin
  inherited Create(AOwner);

  FQuickSort := '';
  Visible := False;
  TablePageControl.TabIndex := 0;
  Parent := ParentPanel;
  SetSession(OraSession);
  FSchemaParam := SchemaParam;
end;

procedure TTableBrowserFrame.SetShowDataSearchPanel(Value: Boolean);
begin
  DataDBGrid.SearchPanel.Enabled := Value;
end;

procedure TTableBrowserFrame.CreateConstraintActionExecute(Sender: TObject);
begin
  Lib.ExecuteActionFromList(SchemaActionList, 'CreateConstraintForObjectAction');
  RefreshAction.Execute;
end;

procedure TTableBrowserFrame.CreateIndexActionExecute(Sender: TObject);
begin
  Lib.ExecuteActionFromList(SchemaActionList, 'CreateIndexForObjectAction');
  RefreshAction.Execute;
end;

procedure TTableBrowserFrame.CreateSynonymActionExecute(Sender: TObject);
begin
  Lib.ExecuteActionFromList(SchemaActionList, 'CreateSynonymForObjectAction');
  RefreshAction.Execute;
end;

procedure TTableBrowserFrame.CreateTriggerActionExecute(Sender: TObject);
begin
  Lib.ExecuteActionFromList(SchemaActionList, 'CreateTriggerForObjectAction');
  RefreshAction.Execute;
end;

function TTableBrowserFrame.GetQueryOpened: Boolean;
begin
  Result := Assigned(FDataQuery) and FDataQuery.Active and (TablePageControl.ActivePage = DataTabSheet);
end;

procedure TTableBrowserFrame.TablePageControlChange(Sender: TObject);
begin
  OpenQuery;
end;

procedure TTableBrowserFrame.SetSession(OraSession: TOraSession);
var
  i: Integer;
begin
  FSession := OraSession;
  for i := 0 to ComponentCount - 1 do
    if Components[i] is TOraQuery then
      (Components[i] as TOraQuery).Session := FSession;
end;

procedure TTableBrowserFrame.SetSortMarkers(OrderSQL: string);
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

procedure TTableBrowserFrame.SourceOptionsActionExecute(Sender: TObject);
begin
  if TableSourceOptionsDialog.Open then
    RefreshAction.Execute;
end;

procedure TTableBrowserFrame.SourceQueryAfterOpen(DataSet: TDataSet);
begin
  SetSource;
end;

procedure TTableBrowserFrame.SetSource;
var
  MaxColumnLength, MaxDataTypeLength: Integer;
  s: string;
  OraQuery: TOraQuery;
  ColumnComments, Temp: WideString;
  TempObjectName, Column: string;
begin
  SourceSynEdit.Lines.Clear;
  SourceSynEdit.Lines.BeginUpdate;
  { create table }
  if TableSourceOptionsDialog.CreateTable then
  begin
    OpenQuery(ColumnsQuery, True);
    with ColumnsQuery do
    begin
      First;
      SourceSynEdit.Lines.Text := Format('CREATE TABLE %s.%s', [FSchemaParam, FObjectName]) + CHR_ENTER;
      SourceSynEdit.Lines.Text := SourceSynEdit.Lines.Text + '(' + CHR_ENTER;
      MaxColumnLength := 0;
      MaxDataTypeLength := 0;
      while not Eof do
      begin
        if Length(Trim(FieldByName(COLUMN_NAME).AsWideString)) > MaxColumnLength then
          MaxColumnLength := Length(Trim(FieldByName(COLUMN_NAME).AsWideString));
       if Length(Trim(FieldByName(DATA_TYPE).AsWideString)) > MaxDataTypeLength then
          MaxDataTypeLength := Length(Trim(FieldByName(DATA_TYPE).AsWideString));
        Next;
      end;
      First;
      while not Eof do
      begin
        SourceSynEdit.Lines.Text := SourceSynEdit.Lines.Text + '  ' + TrimToMaxLength(FieldByName(COLUMN_NAME).AsWideString, MaxColumnLength);
        if (UpperCase(FieldByName(NULLABLE).AsWideString) = NOT_NULL) or (not FieldByName('DEFAULT').IsNull) then
          SourceSynEdit.Lines.Text := SourceSynEdit.Lines.Text + TrimToMaxLength(FieldByName(DATA_TYPE).AsWideString, MaxDataTypeLength)
        else
          SourceSynEdit.Lines.Text := SourceSynEdit.Lines.Text + Trim(FieldByName(DATA_TYPE).AsWideString);

        if not FieldByName('DEFAULT').IsNull then
          SourceSynEdit.Lines.Text := SourceSynEdit.Lines.Text + 'DEFAULT ' +  Trim(FieldByName('DEFAULT').AsString);
        if UpperCase(FieldByName(NULLABLE).AsWideString) = NOT_NULL then
        begin
          if not FieldByName('DEFAULT').IsNull then
            SourceSynEdit.Lines.Text := SourceSynEdit.Lines.Text + ' ';
          SourceSynEdit.Lines.Text := SourceSynEdit.Lines.Text + NOT_NULL;
        end;

        ColumnComments := ColumnComments + Format('COMMENT ON COLUMN %s.%s.%s IS %s;', [FSchemaParam,
          FObjectName, Trim(FieldByName(COLUMN_NAME).AsWideString), QuotedStr(FieldByName(COMMENTS).AsWideString)]) + CHR_ENTER;

        Next;
        if not Eof then
          SourceSynEdit.Lines.Text := SourceSynEdit.Lines.Text + ',' + CHR_ENTER;
      end;
      SourceSynEdit.Lines.Text := SourceSynEdit.Lines.Text + CHR_ENTER + ')';

      if TableSourceOptionsDialog.Storage or TableSourceOptionsDialog.Parameters then
      begin
        OraQuery := TOraQuery.Create(Self);
        with OraQuery do
        begin
          Session := FSession;
          SQL.Add(DM.StringHolder.StringsByName['TableParametersSQL'].Text);
          try
            ParamByName('P_TABLE_NAME').AsWideString := FObjectName;
            ParamByName('P_OWNER').AsWideString := FSchemaParam;
            Open;
            { storage }
            if TableSourceOptionsDialog.Storage then
            begin
              SourceSynEdit.Lines.Text := SourceSynEdit.Lines.Text + CHR_ENTER + Format('TABLESPACE    %s', [FieldByName('TABLESPACE_NAME').AsString]) + CHR_ENTER;
              SourceSynEdit.Lines.Text := SourceSynEdit.Lines.Text + Format('PCTUSED       %s', [FieldByName('PCT_USED').AsString]) + CHR_ENTER;
              SourceSynEdit.Lines.Text := SourceSynEdit.Lines.Text + Format('PCTFREE       %s', [FieldByName('PCT_FREE').AsString]) + CHR_ENTER;
              SourceSynEdit.Lines.Text := SourceSynEdit.Lines.Text + Format('INITRANS      %s', [FieldByName('INI_TRANS').AsString]) + CHR_ENTER;
              SourceSynEdit.Lines.Text := SourceSynEdit.Lines.Text + Format('MAXTRANS      %s', [FieldByName('MAX_TRANS').AsString]) + CHR_ENTER;
              SourceSynEdit.Lines.Text := SourceSynEdit.Lines.Text + 'STORAGE (' + CHR_ENTER;
              SourceSynEdit.Lines.Text := SourceSynEdit.Lines.Text + Format('  INITIAL     %s', [FieldByName('INITIAL_EXTENT').AsString]) + CHR_ENTER;
              SourceSynEdit.Lines.Text := SourceSynEdit.Lines.Text + Format('  NEXT        %s', [FieldByName('NEXT_EXTENT').AsString]) + CHR_ENTER;
              SourceSynEdit.Lines.Text := SourceSynEdit.Lines.Text + Format('  MINEXTENTS  %s', [FieldByName('MIN_EXTENTS').AsString]) + CHR_ENTER;
              SourceSynEdit.Lines.Text := SourceSynEdit.Lines.Text + Format('  MAXEXTENTS  %s', [FieldByName('MAX_EXTENTS').AsString]) + CHR_ENTER;
              SourceSynEdit.Lines.Text := SourceSynEdit.Lines.Text + Format('  PCTINCREASE %s', [FieldByName('PCT_INCREASE').AsString]) + CHR_ENTER;
              SourceSynEdit.Lines.Text := SourceSynEdit.Lines.Text + Format('  BUFFER_POOL %s', [FieldByName('BUFFER_POOL').AsString]) + CHR_ENTER;
              SourceSynEdit.Lines.Text := SourceSynEdit.Lines.Text + ')';
            end;
            { parameters }
            if TableSourceOptionsDialog.Parameters then
            begin
              SourceSynEdit.Lines.Text := SourceSynEdit.Lines.Text + CHR_ENTER + FieldByName('LOGGING').AsString + CHR_ENTER;
              SourceSynEdit.Lines.Text := SourceSynEdit.Lines.Text + FieldByName('COMPRESSION').AsString + CHR_ENTER;
              SourceSynEdit.Lines.Text := SourceSynEdit.Lines.Text + FieldByName('CACHE').AsString + CHR_ENTER;
              SourceSynEdit.Lines.Text := SourceSynEdit.Lines.Text + FieldByName('PARALLEL').AsString + CHR_ENTER;
              SourceSynEdit.Lines.Text := SourceSynEdit.Lines.Text + FieldByName('MONITORING').AsString;
            end;
          finally
            Close;
            Free;
          end;
        end;
      end;
      SourceSynEdit.Lines.Text := SourceSynEdit.Lines.Text + ';';
      SourceSynEdit.Lines.Text := SourceSynEdit.Lines.Text + CHR_ENTER + CHR_ENTER;
    end;
    Application.ProcessMessages;
  end;
  { comments }
  if TableSourceOptionsDialog.Comments then
  begin
    with SourceQuery do
    begin
      First;
      SourceSynEdit.Lines.Text := SourceSynEdit.Lines.Text + Format('COMMENT ON TABLE %s.%s IS %s;', [
        FSchemaParam, FObjectName, QuotedStr(FieldByName('COMMENTS').AsWideString)]) + CHR_ENTER;
      SourceSynEdit.Lines.Text := SourceSynEdit.Lines.Text + ColumnComments;
    end;
    SourceSynEdit.Lines.Text := SourceSynEdit.Lines.Text + CHR_ENTER;
    Application.ProcessMessages;
  end;
  { indexes }
  if TableSourceOptionsDialog.Indexes then
  begin
    s := SQLStringHolder.StringsByName['IndexesDescendSQL'].Text;
    { test if Oracle supports descend field }
    OraQuery := TOraQuery.Create(Self);
    OraQuery.Session := FSession;
    OraQuery.FetchRows := 1;
    try
      OraQuery.SQL.Add(SQLStringHolder.StringsByName['DescendTestSQL'].Text);
      try
        OraQuery.Open;
      finally
        OraQuery.Close;
        OraQuery.Free;
      end;
    except
      s := SQLStringHolder.StringsByName['IndexesSQL'].Text;
    end;
    IndexesQuery.SQL.Clear;
    IndexesQuery.SQL.Add(s);
    OpenQuery(IndexesQuery, True);
    with IndexesQuery do
    begin
      First;
      TempObjectName := '';
      while not Eof do
      begin
        if TempObjectName <> FieldByName(INDEX_NAME).AsWideString then
        begin
          TempObjectName := FieldByName(INDEX_NAME).AsWideString;
          SourceSynEdit.Lines.Text := SourceSynEdit.Lines.Text +  'CREATE ' + FieldByName(UNIQUENESS).AsWideString +
            ' INDEX ' + FSchemaParam + '.' + TempObjectName + ' ON ' + FSchemaParam + '.' + FObjectName + CHR_ENTER;
          SourceSynEdit.Lines.Text := SourceSynEdit.Lines.Text + '(';
        end;
        SourceSynEdit.Lines.Text := SourceSynEdit.Lines.Text + FieldByName(COLUMN_NAME).AsWideString;
        Next;
        if (TempObjectName <> FieldByName(INDEX_NAME).AsWideString) or Eof then
        begin
          SourceSynEdit.Lines.Text := SourceSynEdit.Lines.Text + ')';
          if TableSourceOptionsDialog.Storage or TableSourceOptionsDialog.Parameters then
          begin
            OraQuery := TOraQuery.Create(Self);
            with OraQuery do
            begin
              Session := FSession;
              SQL.Add(DM.StringHolder.StringsByName['IndexParametersSQL'].Text);
              try
                ParamByName('P_TABLE_NAME').AsWideString := FObjectName;
                ParamByName('P_OWNER').AsWideString := FSchemaParam;
                Open;
                { storage }
                if TableSourceOptionsDialog.Storage then
                begin
                  SourceSynEdit.Lines.Text := SourceSynEdit.Lines.Text + CHR_ENTER + Format('TABLESPACE    %s', [FieldByName('TABLESPACE_NAME').AsString]) + CHR_ENTER;
                  SourceSynEdit.Lines.Text := SourceSynEdit.Lines.Text + Format('PCTFREE       %s', [FieldByName('PCT_FREE').AsString]) + CHR_ENTER;
                  SourceSynEdit.Lines.Text := SourceSynEdit.Lines.Text + Format('INITRANS      %s', [FieldByName('INI_TRANS').AsString]) + CHR_ENTER;
                  SourceSynEdit.Lines.Text := SourceSynEdit.Lines.Text + Format('MAXTRANS      %s', [FieldByName('MAX_TRANS').AsString]) + CHR_ENTER;
                  SourceSynEdit.Lines.Text := SourceSynEdit.Lines.Text + 'STORAGE (' + CHR_ENTER;
                  SourceSynEdit.Lines.Text := SourceSynEdit.Lines.Text + Format('  INITIAL     %s', [FieldByName('INITIAL_EXTENT').AsString]) + CHR_ENTER;
                  SourceSynEdit.Lines.Text := SourceSynEdit.Lines.Text + Format('  NEXT        %s', [FieldByName('NEXT_EXTENT').AsString]) + CHR_ENTER;
                  SourceSynEdit.Lines.Text := SourceSynEdit.Lines.Text + Format('  MINEXTENTS  %s', [FieldByName('MIN_EXTENTS').AsString]) + CHR_ENTER;
                  SourceSynEdit.Lines.Text := SourceSynEdit.Lines.Text + Format('  MAXEXTENTS  %s', [FieldByName('MAX_EXTENTS').AsString]) + CHR_ENTER;
                  SourceSynEdit.Lines.Text := SourceSynEdit.Lines.Text + Format('  PCTINCREASE %s', [FieldByName('PCT_INCREASE').AsString]) + CHR_ENTER;
                  SourceSynEdit.Lines.Text := SourceSynEdit.Lines.Text + Format('  BUFFER_POOL %s', [FieldByName('BUFFER_POOL').AsString]) + CHR_ENTER;
                  SourceSynEdit.Lines.Text := SourceSynEdit.Lines.Text + ')';
                end;
                { parameters }
                if TableSourceOptionsDialog.Parameters then
                  SourceSynEdit.Lines.Text := SourceSynEdit.Lines.Text + CHR_ENTER + FieldByName('PARALLEL').AsString;
              finally
                Close;
                Free;
              end;
            end;
          end;
          SourceSynEdit.Lines.Text := SourceSynEdit.Lines.Text + ';';
          SourceSynEdit.Lines.Text := SourceSynEdit.Lines.Text + CHR_ENTER + CHR_ENTER;
        end
        else
          SourceSynEdit.Lines.Text := SourceSynEdit.Lines.Text + ', ';
      end;
    end;
    Application.ProcessMessages;
  end;
  { constraints }
  if TableSourceOptionsDialog.Constraints then
  begin
    OpenQuery(ConstraintsQuery, True);
    with ConstraintsQuery do
    begin
      First;
      while not Eof do
      begin
        if (FieldByName(CONSTRAINT_TYPE).AsWideString = 'Referential Integrity') or (FieldByName(CONSTRAINT_TYPE).AsWideString = 'Primary Key') then
        begin
          Temp := '';
          SourceSynEdit.Lines.Text := SourceSynEdit.Lines.Text +  'ALTER TABLE ' + FSchemaParam + '.' + FObjectName +
            ' ADD (' + CHR_ENTER;
          SourceSynEdit.Lines.Text := SourceSynEdit.Lines.Text + '  CONSTRAINT ' + FieldByName(CONSTRAINT_NAME).AsWideString
            + CHR_ENTER;
          if FieldByName(CONSTRAINT_TYPE).AsWideString = 'Referential Integrity' then
          begin
            Temp := '  REFERENCES ' + ConstraintColumnsQuery.FieldByName('REF_TABLE_NAME').AsWideString + ' ('; // +
            SourceSynEdit.Lines.Text := SourceSynEdit.Lines.Text + '  FOREIGN KEY ('
          end
          else
            SourceSynEdit.Lines.Text := SourceSynEdit.Lines.Text + '  PRIMARY KEY (';
          while not ConstraintColumnsQuery.Eof do
          begin
            Column := Copy(ConstraintColumnsQuery.FieldByName('REF_COLUMN_NAME').AsWideString, Pos('.', ConstraintColumnsQuery.FieldByName('REF_COLUMN_NAME').AsWideString) + 1, Length(ConstraintColumnsQuery.FieldByName('REF_COLUMN_NAME').AsWideString));
            Temp := Temp + Trim(Column);
            Column := Copy(ConstraintColumnsQuery.FieldByName(CONSTRAINT_COLUMN).AsWideString, Pos('.', ConstraintColumnsQuery.FieldByName(CONSTRAINT_COLUMN).AsWideString) + 1, Length(ConstraintColumnsQuery.FieldByName(CONSTRAINT_COLUMN).AsWideString));
            SourceSynEdit.Lines.Text := SourceSynEdit.Lines.Text + Trim(Column);

            ConstraintColumnsQuery.Next;
            if ConstraintColumnsQuery.Eof then
            begin
              SourceSynEdit.Lines.Text := SourceSynEdit.Lines.Text + ')';
              if Temp <> '' then
                SourceSynEdit.Lines.Text := SourceSynEdit.Lines.Text + CHR_ENTER + Temp + ')';

              if (ConstraintsQuery.FieldByName(CONSTRAINT_TYPE).AsWideString <> 'Referential Integrity') and
                TableSourceOptionsDialog.Storage then
              begin
                OraQuery := TOraQuery.Create(Self);
                with OraQuery do
                begin
                  Session := FSession;
                  SQL.Add(DM.StringHolder.StringsByName['TableParametersSQL'].Text);
                  try
                    ParamByName('P_TABLE_NAME').AsWideString := FObjectName;
                    ParamByName('P_OWNER').AsWideString := FSchemaParam;
                    Open;
                    SourceSynEdit.Lines.Text := SourceSynEdit.Lines.Text + CHR_ENTER + 'USING INDEX' + CHR_ENTER;
                    { storage }
                    if TableSourceOptionsDialog.Storage then
                    begin
                      SourceSynEdit.Lines.Text := SourceSynEdit.Lines.Text + Format('TABLESPACE    %s', [FieldByName('TABLESPACE_NAME').AsString]) + CHR_ENTER;
                      SourceSynEdit.Lines.Text := SourceSynEdit.Lines.Text + Format('PCTFREE       %s', [FieldByName('PCT_FREE').AsString]) + CHR_ENTER;
                      SourceSynEdit.Lines.Text := SourceSynEdit.Lines.Text + Format('INITRANS      %s', [FieldByName('INI_TRANS').AsString]) + CHR_ENTER;
                      SourceSynEdit.Lines.Text := SourceSynEdit.Lines.Text + Format('MAXTRANS      %s', [FieldByName('MAX_TRANS').AsString]) + CHR_ENTER;
                      SourceSynEdit.Lines.Text := SourceSynEdit.Lines.Text + 'STORAGE (' + CHR_ENTER;
                      SourceSynEdit.Lines.Text := SourceSynEdit.Lines.Text + Format('  INITIAL     %s', [FieldByName('INITIAL_EXTENT').AsString]) + CHR_ENTER;
                      SourceSynEdit.Lines.Text := SourceSynEdit.Lines.Text + Format('  NEXT        %s', [FieldByName('NEXT_EXTENT').AsString]) + CHR_ENTER;
                      SourceSynEdit.Lines.Text := SourceSynEdit.Lines.Text + Format('  MINEXTENTS  %s', [FieldByName('MIN_EXTENTS').AsString]) + CHR_ENTER;
                      SourceSynEdit.Lines.Text := SourceSynEdit.Lines.Text + Format('  MAXEXTENTS  %s', [FieldByName('MAX_EXTENTS').AsString]) + CHR_ENTER;
                      SourceSynEdit.Lines.Text := SourceSynEdit.Lines.Text + Format('  PCTINCREASE %s', [FieldByName('PCT_INCREASE').AsString]) + CHR_ENTER;
                      SourceSynEdit.Lines.Text := SourceSynEdit.Lines.Text + ')';
                    end;
                  finally
                    Close;
                    Free;
                  end;
                end;
              end;
              SourceSynEdit.Lines.Text := SourceSynEdit.Lines.Text + ');' + CHR_ENTER + CHR_ENTER;
            end
            else
            begin
              if Temp <> '' then
                Temp := Temp + ', ';
              SourceSynEdit.Lines.Text := SourceSynEdit.Lines.Text + ', ';
            end;
          end;
        end;
        Next;
      end;
      First;
    end;
    Application.ProcessMessages;
  end;
  { triggers }
  if TableSourceOptionsDialog.Triggers then
  begin
    OraQuery := TOraQuery.Create(Self);
    with OraQuery do
    try
      Session := FSession;
      FetchRows := 1;
      SQL.Add(SQLStringHolder.StringsByName['TriggersSQL'].Text);
      ParamByName('P_TABLE_NAME').AsWideString := FObjectName;
      ParamByName('P_OWNER').AsWideString := FSchemaParam;
      Open;
      First;
      while not Eof do
      begin
        SourceSynEdit.Lines.Text := SourceSynEdit.Lines.Text + 'CREATE OR REPLACE TRIGGER ' + FieldByName('DESCRIPTION').AsWideString +
          FieldByName('TRIGGER_BODY').AsWideString + CHR_ENTER + '/' + CHR_ENTER;
        Next;
      end;
    finally
      Close;
      Free;
    end;
    Application.ProcessMessages;
  end;
  { synonyms }
  if TableSourceOptionsDialog.Synonyms then
  begin
    OpenQuery(SynonymsQuery, True);
    with SynonymsQuery do
    begin
      First;
      while not Eof do
      begin
        SourceSynEdit.Lines.Text := SourceSynEdit.Lines.Text + 'CREATE OR REPLACE ';
        if FieldByName(SYNONYM_OWNER).AsWideString = 'PUBLIC' then
          SourceSynEdit.Lines.Text := SourceSynEdit.Lines.Text + 'PUBLIC SYNONYM '
        else
          SourceSynEdit.Lines.Text := SourceSynEdit.Lines.Text + Format('SYNONYM %s.', [FieldByName(SYNONYM_OWNER).AsWideString]);
        SourceSynEdit.Lines.Text := SourceSynEdit.Lines.Text + Format('%s FOR %s.%s;', [FieldByName(SYNONYM_NAME).AsWideString,
          FieldByName(OBJECT_OWNER).AsWideString, FieldByName(OBJECT_NAME).AsWideString]) + CHR_ENTER + CHR_ENTER;
        Next;
      end;
    end;
    Application.ProcessMessages;
  end;
  { grants }
  if TableSourceOptionsDialog.Grants then
  begin
    OpenQuery(GrantsQuery, True);
    with GrantsQuery do
    begin
      First;
      TempObjectName := '';
      while not Eof do
      begin
        if TempObjectName <> FieldByName(GRANTEE).AsWideString then
        begin
          TempObjectName := FieldByName(GRANTEE).AsWideString;
          SourceSynEdit.Lines.Text := SourceSynEdit.Lines.Text +  'GRANT ';
        end;
        SourceSynEdit.Lines.Text := SourceSynEdit.Lines.Text + FieldByName(PRIVILEGE).AsWideString;
        Next;
        if (TempObjectName <> FieldByName(GRANTEE).AsWideString) or Eof then
          SourceSynEdit.Lines.Text := SourceSynEdit.Lines.Text + ' ON ' + FSchemaParam + '.' + FObjectName + ' TO ' + TempObjectName + ';' + CHR_ENTER
        else
          SourceSynEdit.Lines.Text := SourceSynEdit.Lines.Text + ', ';
      end;
    end;
    Application.ProcessMessages;
  end;
  SourceSynEdit.Lines.Text := Trim(SourceSynEdit.Lines.Text);
  SourceSynEdit.Lines.EndUpdate;
end;

procedure TTableBrowserFrame.SetSourceClickActionExecute(Sender: TObject);
begin
  SetSource;
end;

procedure TTableBrowserFrame.SQLEditorActionExecute(Sender: TObject);
begin
  MainForm.LoadSQLIntoEditor(Format('%s@%s', [SourceQuery.Session.Schema, SourceQuery.Session.Server]), SourceSynEdit.Text);
end;

procedure TTableBrowserFrame.SynonymsDBGridSelectionChanged(Sender: TObject);
begin
  SetSynonymActions;
end;

procedure TTableBrowserFrame.SynonymsQueryAfterOpen(DataSet: TDataSet);
begin
  SetSynonymActions
end;

procedure TTableBrowserFrame.SetTriggerActions;
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

procedure TTableBrowserFrame.SetGrantActions;
begin
  RevokePrivilegesAction.Enabled := GrantsDBGrid.SelectedRows.Count > 0;
end;

procedure TTableBrowserFrame.SetIndexActions;
begin
  DropIndexAction.Enabled := IndexesDBGrid.SelectedRows.Count > 0;
end;

procedure TTableBrowserFrame.SetSynonymActions;
begin
  DropSynonymAction.Enabled := SynonymsDBGrid.SelectedRows.Count > 0;
end;

procedure TTableBrowserFrame.TriggersDBGridSelectionChanged(Sender: TObject);
begin
  SetTriggerActions;
end;

procedure TTableBrowserFrame.TriggersQueryAfterOpen(DataSet: TDataSet);
begin
  TriggerSynEdit.Lines.Clear;
  SetTriggerActions;
end;

procedure TTableBrowserFrame.TriggersQueryAfterScroll(DataSet: TDataSet);
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

function TTableBrowserFrame.GetTableColumns: TStringList;
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

procedure TTableBrowserFrame.SetCommitRollback;
begin
  //CommitAction.Enabled := Value;
  //RollbackAction.Enabled := Value;
  CommitAction.Enabled := FDataQuery.Session.InTransaction;
  RollbackAction.Enabled := FDataQuery.Session.InTransaction;
end;

procedure TTableBrowserFrame.ReferencedByQueryAfterOpen(DataSet: TDataSet);
var
  OraQuery1, OraQuery2: TOraQuery;
  Table, Constraint, Constraint2, Columns: string;
  FirstInserted: Boolean;
begin
  FirstInserted := False;
  OraQuery1 := TOraQuery.Create(Self);
  try
    OraQuery1.Session := FSession;
    OraQuery1.SQL.Text := SQLStringHolder.StringsByName['ReferencedBy1SQL'].Text;
    OraQuery1.ParamByName('P_TABLE_NAME').AsWideString := FObjectName;
    OraQuery1.ParamByName('P_OWNER').AsWideString := FSchemaParam;
    OraQuery1.Open;
    while not OraQuery1.Eof do
    begin
      Table := OraQuery1.FieldByName('TABLE_NAME').AsWideString;
      Constraint := OraQuery1.FieldByName('CONSTRAINT_NAME').AsWideString;
      // get columns
      Columns := '';
      while (not OraQuery1.Eof) and (Constraint = OraQuery1.FieldByName('CONSTRAINT_NAME').AsWideString) do
      begin
        Columns := Columns + OraQuery1.FieldByName('COLUMN_NAME').AsWideString;
        OraQuery1.Next;
        if (not OraQuery1.Eof) and (Constraint = OraQuery1.FieldByName('CONSTRAINT_NAME').AsWideString) then
          Columns := Columns + ', ';
      end;

      OraQuery2 := TOraQuery.Create(Self);
      try
        OraQuery2.Session := FSession;
        OraQuery2.SQL.Text := SQLStringHolder.StringsByName['ReferencedBy2SQL'].Text;
        OraQuery2.ParamByName('P_CONSTRAINT_NAME').AsWideString := Constraint;
        OraQuery2.ParamByName('P_OWNER').AsWideString := FSchemaParam;
        OraQuery2.Open;

        while not OraQuery2.Eof do
        begin
          Constraint2 := OraQuery2.FieldByName('CONSTRAINT_NAME').AsWideString;

          if FirstInserted then
            ReferencedByQuery.Insert
          else
            ReferencedByQuery.Edit;

          ReferencedByQuery.fieldbyname(COLUMN_TABLE).AsWideString := OraQuery2.FieldByName('TABLE_NAME').AsWideString;
          ReferencedByQuery.FieldByName(COLUMN_FOREIGN_KEY).AsWideString := OraQuery2.FieldByName('CONSTRAINT_NAME').AsWideString;
          ReferencedByQuery.FieldByName(COLUMN_COLUMNS).AsWideString := '';
          while (not OraQuery2.Eof) and (Constraint2 = OraQuery2.FieldByName('CONSTRAINT_NAME').AsWideString) do
          begin
           ReferencedByQuery.FieldByName(COLUMN_COLUMNS).AsWideString := ReferencedByQuery.FieldByName(COLUMN_COLUMNS).AsWideString + OraQuery2.FieldByName('COLUMN_NAME').AsWideString;
           OraQuery2.Next;
           if (not OraQuery2.Eof) and (Constraint2 = OraQuery2.FieldByName('CONSTRAINT_NAME').AsWideString) then
             ReferencedByQuery.FieldByName(COLUMN_COLUMNS).AsWideString := ReferencedByQuery.FieldByName(COLUMN_COLUMNS).AsWideString + ', ';
          end;

          ReferencedByQuery.FieldByName(COLUMN_REF_TABLE).AsWideString := Table;
          ReferencedByQuery.FieldByName(COLUMN_REF_CONSTRAINT).AsWideString := Constraint;
          ReferencedByQuery.FieldByName(COLUMN_REF_COLUMNS).AsWideString := Columns;

          FirstInserted := True;
          //OraQuery2.Next;
        end;
      finally
        OraQuery2.Close;
        OraQuery2.Free;
      end;

      //OraQuery1.Next;
    end;
  finally
    OraQuery1.Close;
    OraQuery1.Free;
  end;
end;

procedure TTableBrowserFrame.ReferencesQueryAfterOpen(DataSet: TDataSet);
var
  OraQuery1, OraQuery2: TOraQuery;
  Table, Constraint, RConstraint, Constraint2, Columns: string;
  FirstInserted: Boolean;
begin
  FirstInserted := False;
  OraQuery1 := TOraQuery.Create(Self);
  try
    OraQuery1.Session := FSession;
    OraQuery1.SQL.Text := SQLStringHolder.StringsByName['References1SQL'].Text;
    OraQuery1.ParamByName('P_TABLE_NAME').AsWideString := FObjectName;
    OraQuery1.ParamByName('P_OWNER').AsWideString := FSchemaParam;
    OraQuery1.Open;
    while not OraQuery1.Eof do
    begin
      Table := OraQuery1.FieldByName('TABLE_NAME').AsWideString;
      Constraint := OraQuery1.FieldByName('CONSTRAINT_NAME').AsWideString;
      RConstraint := OraQuery1.FieldByName('R_CONSTRAINT_NAME').AsWideString;
      // get columns
      Columns := '';
      while (not OraQuery1.Eof) and (Constraint = OraQuery1.FieldByName('CONSTRAINT_NAME').AsWideString) do
      begin
        Columns := Columns + OraQuery1.FieldByName('COLUMN_NAME').AsWideString;
        OraQuery1.Next;
        if (not OraQuery1.Eof) and (Constraint = OraQuery1.FieldByName('CONSTRAINT_NAME').AsWideString) then
          Columns := Columns + ', ';
      end;

      OraQuery2 := TOraQuery.Create(Self);
      try
        OraQuery2.Session := FSession;
        OraQuery2.SQL.Text := SQLStringHolder.StringsByName['References2SQL'].Text;
        OraQuery2.ParamByName('P_CONSTRAINT_NAME').AsWideString := RConstraint;
        OraQuery2.ParamByName('P_OWNER').AsWideString := FSchemaParam;
        OraQuery2.Open;

        while not OraQuery2.Eof do
        begin
          Constraint2 := OraQuery2.FieldByName('CONSTRAINT_NAME').AsWideString;
          if FirstInserted then
            ReferencesQuery.Insert
          else
            ReferencesQuery.Edit;
          ReferencesQuery.fieldbyname(COLUMN_REF_TABLE).AsWideString := OraQuery2.FieldByName('TABLE_NAME').AsWideString;
          ReferencesQuery.FieldByName(COLUMN_REF_CONSTRAINT).AsWideString := OraQuery2.FieldByName('CONSTRAINT_NAME').AsWideString;
          ReferencesQuery.FieldByName(COLUMN_REF_COLUMNS).AsWideString := '';
          while (not OraQuery2.Eof) and (Constraint2 = OraQuery2.FieldByName('CONSTRAINT_NAME').AsWideString) do
          begin
            ReferencesQuery.FieldByName(COLUMN_REF_COLUMNS).AsWideString := ReferencesQuery.FieldByName(COLUMN_REF_COLUMNS).AsWideString + OraQuery2.FieldByName('COLUMN_NAME').AsWideString;
            OraQuery2.Next;
            if (not OraQuery2.Eof) and (Constraint2 = OraQuery2.FieldByName('CONSTRAINT_NAME').AsWideString) then
             ReferencesQuery.FieldByName(COLUMN_REF_COLUMNS).AsWideString := ReferencesQuery.FieldByName(COLUMN_REF_COLUMNS).AsWideString + ', ';
          end;

          ReferencesQuery.FieldByName(COLUMN_TABLE).AsWideString := Table;
          ReferencesQuery.FieldByName(COLUMN_FOREIGN_KEY).AsWideString := Constraint;
          ReferencesQuery.FieldByName(COLUMN_COLUMNS).AsWideString := Columns;

          FirstInserted := True;
          //OraQuery2.Next;
        end;
      finally
        OraQuery2.Close;
        OraQuery2.Free;
      end;

      //OraQuery1.Next;
    end;
  finally
    OraQuery1.Close;
    OraQuery1.Free;
  end;
end;

procedure TTableBrowserFrame.RefreshActionExecute(Sender: TObject);
begin
  if TablePageControl.ActivePage = ColumnsTabSheet then
    OpenQuery(ColumnsQuery, True)
  else
  if TablePageControl.ActivePage = SourceTabSheet then
    OpenQuery(SourceQuery, True)
  else
  if TablePageControl.ActivePage = DataTabSheet then
  begin
    if FDataQuery.Session.InTransaction then
    begin
      if Lib.AskCommit(FDataQuery.Session.Schema + '@' + FDataQuery.Session.Server) then
        FDataQuery.Session.Commit
      else
        FDataQuery.Session.Rollback
    end;
    SetCommitRollback;
    OpenQuery(FDataQuery, True);
  end
  else
  if TablePageControl.ActivePage = ConstraintsTabSheet then
    OpenQuery(ConstraintsQuery, True)
  else
  if TablePageControl.ActivePage = TriggersTabSheet then
    OpenQuery(TriggersQuery, True)
  else
  if TablePageControl.ActivePage = IndexesTabSheet then
  begin
    OpenQuery(IndexesQuery, True)
  end
  else
  if TablePageControl.ActivePage = GrantsTabSheet then
    OpenQuery(GrantsQuery, True)
  else
  if TablePageControl.ActivePage = SynonymsTabSheet then
    OpenQuery(SynonymsQuery, True)
  else
  if TablePageControl.ActivePage = ReferencedByTabSheet then
    OpenQuery(ReferencedByQuery, True)
  else
  if TablePageControl.ActivePage = ReferencesTabSheet then
    OpenQuery(ReferencesQuery, True)
  else
  if TablePageControl.ActivePage = DependenciesTabSheet then
    OpenQuery(DependenciesQuery, True)
end;

procedure TTableBrowserFrame.RemoveCurrentFilterActionExecute(Sender: TObject);
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
   //if Pos(FObjectName + '@' + FSchemaParam + ':CURRENT', DataFilterDialog.ValuesList.Keys[i]) <> 0 then
   if (CurrentKeyValue = DataFilterDialog.ValuesList.Keys[i]) and
     (DataFilterDialog.ValuesList.Values[DataFilterDialog.ValuesList.Keys[i]] = EncryptString(FilterName)) then
   begin
     DataFilterDialog.ValuesList.DeleteRow(i);
     //Break;
   end;
  end;
  NoFilterMenuItem.Checked := True;
  UpdateFilterDropDownMenu;
  OpenQuery(FDataQuery, True);
end;

procedure TTableBrowserFrame.RemoveCurrentSortActionExecute(Sender: TObject);
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

procedure TTableBrowserFrame.RevokePrivilegesActionExecute(Sender: TObject);
begin
  Lib.RevokeSelectedGrants(FSession, FSchemaParam, FObjectName, GrantsDBGrid);
{  if Common.AskYesOrNo(Format('Revoke privilege %s, are you sure?', [GrantsQuery.FieldByName(PRIVILEGE).AsString])) then
  begin
    GrantsQuery.Session.ExecSQL(Format('REVOKE %s ON %s FROM %s', [GrantsQuery.FieldByName(PRIVILEGE).AsString,
      FObjectName, GrantsQuery.FieldByName(GRANTEE).AsString]), []);
    GrantsQuery.Refresh;
  end; }
end;

procedure TTableBrowserFrame.NoFilterActionExecute(Sender: TObject);
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

procedure TTableBrowserFrame.NoSortActionExecute(Sender: TObject);
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

procedure TTableBrowserFrame.RollbackActionExecute(Sender: TObject);
begin
  FDataQuery.CancelUpdates;
  FDataQuery.Session.Rollback;
  OpenQuery(FDataQuery, True);
 // CommitAction.Enabled := False;
 // RollbackAction.Enabled := False;
  SetCommitRollback;
end;

function TTableBrowserFrame.GetCurrentDataFilter: string;
begin
  Result := DataFilterDialog.GetCurrentDataFilter(FObjectName, FSchemaParam);

  if Trim(Result) <> '' then
    FilterAction.ImageIndex := 1
  else
    FilterAction.ImageIndex := 0;
end;

function TTableBrowserFrame.GetCurrentDataSort: string;
begin
  Result := DataSortDialog.GetCurrentDataSort(FObjectName, FSchemaParam);

  if Trim(Result) <> '' then
    SortAction.ImageIndex := 7
  else
    SortAction.ImageIndex := 6;
end;

procedure TTableBrowserFrame.AlterTableActionExecute(Sender: TObject);
begin
  Lib.ExecuteActionFromList(SchemaActionList, 'AlterTableAction');
  RefreshAction.Execute;
end;

procedure TTableBrowserFrame.AnalyzeTableActionExecute(Sender: TObject);
begin
  Lib.ExecuteActionFromList(SchemaActionList, 'AnalyzeTableAction');
  RefreshAction.Execute;
end;

procedure TTableBrowserFrame.CommitActionExecute(Sender: TObject);
begin
  {if FDataQuery.State in [dsEdit, dsInsert] then
  begin
    FDataQuery.Post;
    DataQueryAfterScroll(FDataQuery);
  end;
  FDataQuery.Session.Commit; }
  FDataQuery.ApplyUpdates;
  FDataQuery.CommitUpdates;
  FDataQuery.Session.Commit;
  DataQueryAfterScroll(FDataQuery);
  SetCommitRollback;
end;

procedure DrawItemText(X: integer;ACanvas: TCanvas;ARect: TRect;Text: string);
begin
  ARect.Left := X;
  DrawText(ACanvas.Handle, PChar(Text), -1, ARect, DT_LEFT or DT_VCENTER or DT_SINGLELINE or DT_NOCLIP);
end;

procedure TTableBrowserFrame.SetConstraintActions;
begin
  EnableConstraintAction.Enabled := (not ConstraintsQuery.FieldByName(CONSTRAINT_STATUS).IsNull) and
    (ConstraintsDBGrid.SelectedRows.Count > 0) and
    ((ConstraintsQuery.FieldByName(CONSTRAINT_STATUS).AsString <> STATUS_ENABLED) or (ConstraintsDBGrid.SelectedRows.Count > 1));
  DisableConstraintAction.Enabled := (not ConstraintsQuery.FieldByName(CONSTRAINT_STATUS).IsNull) and
    (ConstraintsDBGrid.SelectedRows.Count > 0) and
    ((ConstraintsQuery.FieldByName(CONSTRAINT_STATUS).AsString = STATUS_ENABLED) or (ConstraintsDBGrid.SelectedRows.Count > 1));
  DropConstraintAction.Enabled := (not ConstraintsQuery.FieldByName(CONSTRAINT_STATUS).IsNull) and
    (ConstraintsDBGrid.SelectedRows.Count > 0);
end;

procedure TTableBrowserFrame.ConstraintsDBGridSelectionChanged(Sender: TObject);
begin
  SetConstraintActions;
end;

procedure TTableBrowserFrame.ConstraintsQueryAfterOpen(DataSet: TDataSet);
begin
  SetConstraintActions;
end;

procedure TTableBrowserFrame.ConstraintsQueryAfterScroll(DataSet: TDataSet);
begin
  if DataSet.ControlsDisabled then
    Exit;

  with ConstraintColumnsQuery do
  begin
    Close;
    ParamByName('P_OWNER').AsWideString := FSchemaParam;
    ParamByName('P_CONSTRAINT_NAME').AsWideString := DataSet.FieldByName(CONSTRAINT_NAME).AsWideString;
    ParamByName('P_R_CONSTRAINT_NAME').AsWideString := DataSet.FieldByName('R_CONSTRAINT_NAME').AsWideString;
    Open;
    ConstraintColumnsDBGrid.Columns[0].Visible := DataSet.FieldByName('CONSTRAINT_TYPE').AsWideString <> 'C';
    ConstraintColumnsDBGrid.Columns[2].Visible := DataSet.FieldByName('CONSTRAINT_TYPE').AsWideString = 'R';
    ConstraintColumnsDBGrid.Columns[3].Visible := False;
    ConstraintColumnsDBGrid.Columns[4].Visible := False;
    Application.ProcessMessages;
    SetGridColumnWidths(ConstraintColumnsDBGrid)
  end;
end;

procedure TTableBrowserFrame.CustomizeActionExecute(Sender: TObject);
begin
  with CustomizePageControlDialog do
  try
    Open(TablePageControl);
  finally
    Free
  end;
end;

procedure TTableBrowserFrame.CustomizeTableColumnsActionExecute(Sender: TObject);
begin
  with CustomizeTableColumnsDialog do
  try
  if Open(FSession, FSchemaParam, FObjectName) then
    RefreshAction.Execute;
  finally
    Free;
  end;
end;

procedure TTableBrowserFrame.DataDBGridAdvDrawDataCell(Sender: TCustomDBGridEh; Cell, AreaCell: TGridCoord;
  Column: TColumnEh; const ARect: TRect; var Params: TColCellParamsEh; var Processed: Boolean);
begin
  GridDrawStringDataCell(Column, Params);
end;

procedure TTableBrowserFrame.DataDBGridDblClick(Sender: TObject);
var
  Rslt: Integer;
  Stream: TStream;
  BlobStream: TStream;
  FilterIndex: Cardinal;
begin
  if (DataDBGrid.SelectedField.DataType = ftVarBytes) or (DataDBGrid.SelectedField is TStringField) or (DataDBGrid.SelectedField is TWideMemoField) then
  begin
    if StringDataDialog.Open(DataDBGrid.Columns.Items[DataDBGrid.SelectedIndex].FieldName, DataDBGrid.SelectedField.AsWideString) then
    begin
      DataDBGrid.DataSource.DataSet.Edit;
      DataDBGrid.SelectedField.AsWideString := StringDataDialog.StringData;
    end;
  end
  else
  if DataDBGrid.SelectedField is TBlobField then
  begin
    Rslt := BlobDialog.Open(TBlobField(DataDBGrid.DataSource.DataSet.FieldByName(DataDBGrid.Columns.Items[DataDBGrid.SelectedIndex].FieldName)));
    if Rslt = mrYes then // load
      if BCCommon.Dialogs.OpenFiles(Handle, '', Format('%s'#0'*.*'#0#0, [LanguageDataModule.GetConstant('AllFiles')]), LanguageDataModule.GetConstant('Open')) then
      begin
        Application.ProcessMessages; { style fix }
        DataDBGrid.DataSource.DataSet.Edit;
        Stream := nil;
        BlobStream := nil;
        try
          Stream := TFileStream.Create(BCCommon.Dialogs.Files[0], fmOpenRead);
          BlobStream := DataDBGrid.DataSource.DataSet.CreateBlobStream(DataDBGrid.DataSource.DataSet.FieldByName(DataDBGrid.Columns.Items[DataDBGrid.SelectedIndex].FieldName), bmWrite);
          BlobStream.CopyFrom(Stream, 0);
        finally
          BlobStream.Free;
          Stream.Free;
        end;
      end;
    if Rslt = mrNo then // save
      if BCCommon.Dialogs.SaveFile(Handle, '', Format('%s'#0'*.*'#0#0, [LanguageDataModule.GetConstant('AllFiles')]), LanguageDataModule.GetConstant('SaveAs'), FilterIndex) then
      begin
        Application.ProcessMessages; { style fix }
        TBlobField(DataDBGrid.DataSource.DataSet.FieldByName(DataDBGrid.Columns.Items[DataDBGrid.SelectedIndex].FieldName)).SaveToFile(BCCommon.Dialogs.Files[0]);
      end;
    if Rslt = mrAbort then
    begin
      DataDBGrid.DataSource.DataSet.Edit;
      //DataDBGrid. //SelectedField.Clear;
    end;
  end;
end;

procedure TTableBrowserFrame.DataDBGridMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  { this fixes the bug when popup is popped from grid - it won't get the focus }
  if Button = mbRight then
    DataPopupActionBar.Popup(Mouse.CursorPos.X, Mouse.CursorPos.Y);
end;

procedure TTableBrowserFrame.DataDBGridSelectionChanged(Sender: TObject);
begin
  DuplicateRowAction.Enabled := DataDBGrid.SelectedRows.Count > 0;
  DeleteRowAction.Enabled := DuplicateRowAction.Enabled;
end;

procedure TTableBrowserFrame.DataDBGridTitleClick(Column: TColumnEh);
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

procedure TTableBrowserFrame.DataDBNavigatorBeforeAction(Sender: TObject; Button: TNavigateBtn);
begin
  if Button = nbDelete then
  begin
    DeleteRowActionExecute(Sender);
    Abort;
  end;
end;

procedure TTableBrowserFrame.DataQueryBefore(DataSet: TDataSet);
begin
  if not FDataQuery.Session.InTransaction then
    FDataQuery.Session.StartTransaction;
  SetCommitRollback;
end;

procedure TTableBrowserFrame.DeleteRowActionExecute(Sender: TObject);
var
  i: Integer;
begin
  if DataDBGrid.SelectedRows.Count = 1 then
  begin
    if AskYesOrNo('Delete record?') then
    begin
      FDataQuery.Delete;
      DataDBGrid.Selection.Clear;
    end
    else
      Abort
  end
  else
  if DataDBGrid.SelectedRows.Count > 1 then
  begin
    if AskYesOrNo('Delete selected records?') then
    begin
     for i := 0 to DataDBGrid.SelectedRows.Count - 1 do
      begin
        //DataDBGrid.DataSource.DataSet.Bookmark := DataDBGrid.SelectedRows[i];
        FDataQuery.Bookmark := DataDBGrid.SelectedRows[i];
        FDataQuery.Delete;
      end;
      //FDataQuery.Bookmark
      //DataDBGrid.DataSource.DataSet.Bookmark := nil;
      DataDBGrid.Selection.Clear;
    end
    else
      Abort;
  end;
end;

procedure TTableBrowserFrame.DropConstraintActionExecute(Sender: TObject);
begin
  Lib.DropSelectedConstraints(FSession, FSchemaParam, FObjectName, ConstraintsDBGrid);
end;

procedure TTableBrowserFrame.DropDownFilterMenuClick(Sender: TObject);
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

procedure TTableBrowserFrame.DropDownSortMenuClick(Sender: TObject);
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

procedure TTableBrowserFrame.DropIndexActionExecute(Sender: TObject);
begin
  if AskYesOrNo(Format('Drop index %s, are you sure?', [IndexesQuery.FieldByName(INDEX_NAME).AsString])) then
  begin
    IndexesQuery.Session.ExecSQL(Format('DROP INDEX %s', [IndexesQuery.FieldByName(INDEX_NAME).AsString]), []);
    IndexesQuery.Refresh;
  end;
end;

procedure TTableBrowserFrame.DropSynonymActionExecute(Sender: TObject);
begin
  Lib.DropSelectedSynonyms(FSession, SynonymsDBGrid);
end;

procedure TTableBrowserFrame.DropTriggerActionExecute(Sender: TObject);
begin
  Lib.DropSelectedTriggers(FSession, FSchemaParam, TriggersDBGrid);
end;

procedure TTableBrowserFrame.DuplicateRowActionExecute(Sender: TObject);
var
  i, j: Integer;
  DBGridRec: array of Variant;
begin
  with DataDBGrid do
  if SelectedRows.Count > 0 then
  begin
    DataSource.DataSet.DisableControls();
    SetLength(DBGridRec, Datasource.DataSet.FieldCount);
    try
      for i := 0 to SelectedRows.Count - 1 do
      begin
        Datasource.DataSet.GotoBookmark(Pointer(SelectedRows[i]));

        for j := 0 to Datasource.DataSet.FieldCount - 1 do
          DBGridRec[j] := Datasource.DataSet.Fields[j].Value;

        Datasource.DataSet.Insert;

        for j := 0 to Datasource.DataSet.FieldCount - 1 do
          Datasource.DataSet.Fields[j].Value := DBGridRec[j];
      end;
    finally
       DataSource.DataSet.EnableControls();
       DBGridRec := nil;
    end;
  end;
end;

procedure TTableBrowserFrame.EnableConstraintActionExecute(Sender: TObject);
begin
  AlterSelectedConstraints(FSession, FSchemaParam, FObjectName, ConstraintsDBGrid, True);
end;

procedure TTableBrowserFrame.EnableTriggerActionExecute(Sender: TObject);
begin
  AlterSelectedTriggers(FSession, FSchemaParam, TriggersDBGrid, True);
end;

procedure TTableBrowserFrame.ExportTableDataActionExecute(Sender: TObject);
begin
  MainForm.DatabaseExportTableDataAction.Execute;
end;

procedure TTableBrowserFrame.DisableConstraintActionExecute(Sender: TObject);
begin
  AlterSelectedConstraints(FSession, FSchemaParam, FObjectName, ConstraintsDBGrid, False);
end;

procedure TTableBrowserFrame.DisableTriggerActionExecute(Sender: TObject);
begin
  AlterSelectedTriggers(FSession, FSchemaParam, TriggersDBGrid, False);
end;

procedure TTableBrowserFrame.IndexesDBGridSelectionChanged(Sender: TObject);
begin
  SetIndexActions
end;

procedure TTableBrowserFrame.IndexesQueryAfterOpen(DataSet: TDataSet);
begin
  SetIndexActions
end;

procedure TTableBrowserFrame.InsertFiltersToDropDownMenu(PopupActionBar: TPopupActionBar);
var
  i: Integer;
  KeyValue, CurrentValue, s: string;
  Item: TMenuItem;
begin
  KeyValue := EncryptString(FObjectName + '@' + FSchemaParam);
  CurrentValue := EncryptString(':CURRENT');
  for i := 0 to DataFilterDialog.ValuesList.RowCount - 1 do
    if Pos(KeyValue, DataFilterDialog.ValuesList.Keys[i]) <> 0 then
      if Pos(CurrentValue, DataFilterDialog.ValuesList.Keys[i]) = 0 then { skip current }
      begin
        Item := TMenuItem.Create(PopupActionBar);
        Item.Tag := 1;
        Item.GroupIndex := 1;
        Item.RadioItem := True;
        s :=  DecryptString(DataFilterDialog.ValuesList.Keys[i]);
        Item.Caption := Copy(s, Pos(':', s) + 1, Length(s));
        Item.OnClick := DropDownFilterMenuClick;
        PopupActionBar.Items.Add(Item);
      end;
end;

procedure TTableBrowserFrame.InsertSortsToDropDownMenu(PopupActionBar: TPopupActionBar);
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
        s :=  DecryptString(DataSortDialog.ValuesList.Keys[i]);
        Item.Caption := Copy(s, Pos(':', s) + 1, Length(s));
        Item.OnClick := DropDownSortMenuClick;
        PopupActionBar.Items.Add(Item);
      end;
end;

procedure TTableBrowserFrame.InsertRowActionExecute(Sender: TObject);
begin
  FDataQuery.Insert;
end;

procedure TTableBrowserFrame.UpdateFilterDropDownMenu;
var
  i: Integer;
  FilterName: string;
begin
  FilterName := DataFilterDialog.GetCurrentFilterName(FObjectName, FSchemaParam);
  RemoveCurrentFilterAction.Enabled := FilterName <> '';
  { Remove filters }
  for i := FilterDropDownPopupActionBar.Items.Count - 1 downto 0 do
    if FilterDropDownPopupActionBar.Items[i].Tag = 1 then
      FilterDropDownPopupActionBar.Items[i].Free;
  { Insert filters }
  InsertFiltersToDropDownMenu(FilterDropDownPopupActionBar);
  { Check item }
  if FilterName <> '' then
    if Assigned(FilterDropDownPopupActionBar.Items.Find(FilterName)) then
      FilterDropDownPopupActionBar.Items.Find(FilterName).Checked := True
end;

procedure TTableBrowserFrame.UpdateSortDropDownMenu;
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
      SortDropDownPopupActionBar.Items[i].Free;
  { Insert filters }
  InsertSortsToDropDownMenu(SortDropDownPopupActionBar);
  { Check item }
  if SortName <> '' then
    if Assigned(SortDropDownPopupActionBar.Items.Find(SortName)) then
      SortDropDownPopupActionBar.Items.Find(SortName).Checked := True
end;

procedure TTableBrowserFrame.SortActionExecute(Sender: TObject);
var
  Columns: TStringList;
begin
  if not Visible then
    Exit;
  if TablePageControl.ActivePage <> DataTabSheet then
    Exit;
  try
    Columns := GetTableColumns;

    if DataSortDialog.Open(FObjectName, FSchemaParam, Columns{, FilterText}) then
    begin
      UpdateSortDropDownMenu;
      OpenQuery(FDataQuery, True);
    end;
  finally
    FreeAndNil(Columns);
  end;
end;

procedure TTableBrowserFrame.FilterActionExecute(Sender: TObject);
var
  Columns: TStringList;
begin
  if not Visible then
    Exit;
  if TablePageControl.ActivePage <> DataTabSheet then
    Exit;

  try
    Columns := GetTableColumns;

    if DataFilterDialog.Open(FObjectName, FSchemaParam, Columns{, FilterText}) then
    begin
      UpdateFilterDropDownMenu;
      OpenQuery(FDataQuery, True);
    end;
  finally
    FreeAndNil(Columns);
  end;
end;

procedure TTableBrowserFrame.DataQueryAfterScroll(DataSet: TDataSet);
var
  RecCount: Integer;
begin
  RecCount := DataSet.RecordCount;
  if TOraQuery(DataSet).State = dsInsert then
    DataButtonPanel.Caption := 'Inserting'
  else
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

procedure TTableBrowserFrame.DataQueryQueryBeforeFetch(DataSet: TCustomDADataSet; var Cancel: Boolean);
begin
  DataSet.DisableControls;
end;

procedure TTableBrowserFrame.DataQueryQueryAfterFetch(DataSet: TCustomDADataSet);
begin
  DataSet.EnableControls;
end;

function TTableBrowserFrame.GetActivePageQuery(Refresh: Boolean): TOraQuery;
var
  s: string;
  OraQuery: TOraQuery;
begin
  Result := nil;
  if TablePageControl.ActivePage = ColumnsTabSheet then
  begin
    CreationAndModificationTimestampLabel.Caption := '';
    if OptionsContainer.ShowObjectCreationAndModificationTimestamp then
      CreationAndModificationTimestampLabel.Caption := GetCreationAndModificationTimestamp(FSession, FSchemaParam, FObjectName);
    Exit(ColumnsQuery)
  end
  else
  if TablePageControl.ActivePage = SourceTabSheet then
    Exit(SourceQuery)
  else
  if TablePageControl.ActivePage = DataTabSheet then
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
    FDataQuery.CachedUpdates := True;
    FDataQuery.AutoCommit := False;
    //FDataQuery.FetchAll := True;
    FDataQuery.FetchRows := 500;
    FDataQuery.Options.StrictUpdate := False;
    FDataQuery.Options.RequiredFields := False;
    FDataQuery.Options.CacheLobs := False;
    FDataQuery.Options.DeferredLobRead := True;
    FDataQuery.Options.RawAsString := True;

    FDataQuery.RefreshOptions := [roAfterInsert, roAfterUpdate, roBeforeEdit];
    FDataQuery.BeforeDelete := DataQueryBefore;
    FDataQuery.BeforeEdit := DataQueryBefore;
    FDataQuery.BeforeInsert := DataQueryBefore;
    FDataQuery.BeforeFetch := DataQueryQueryBeforeFetch;
    FDataQuery.AfterFetch := DataQueryQueryAfterFetch;
    //FDataQuery.AfterOpen := FDataQueryAfterScroll;
    FDataQuery.AfterScroll := DataQueryAfterScroll;
    DataDataSource.DataSet := FDataQuery;
    FQuickSort := '';

    Exit(FDataQuery)
  end
  else
  if TablePageControl.ActivePage = ConstraintsTabSheet then
    Exit(ConstraintsQuery)
  else
  if TablePageControl.ActivePage = TriggersTabSheet then
    Exit(TriggersQuery)
  else
  if TablePageControl.ActivePage = IndexesTabSheet then
  begin
    if not IndexesQuery.Active or (IndexesQuery.ParamByName('P_TABLE_NAME').AsWideString <> FObjectName) then
    begin
      s := SQLStringHolder.StringsByName['IndexesDescendSQL'].Text;
      { Test if Oracle supports descend field }
      OraQuery := TOraQuery.Create(Self);
      OraQuery.Session := FSession;
      OraQuery.FetchRows := 1;
      try
        { test if descend field founds }
        OraQuery.SQL.Add(SQLStringHolder.StringsByName['DescendTestSQL'].Text);
        try
          OraQuery.Open;
        finally
          OraQuery.Close;
          OraQuery.Free;
        end;
      except
        s := SQLStringHolder.StringsByName['IndexesSQL'].Text;
      end;
      IndexesQuery.SQL.Clear;
      IndexesQuery.SQL.Add(s);
    end;
    Exit(IndexesQuery)
  end
  else
  if TablePageControl.ActivePage = GrantsTabSheet then
    Exit(GrantsQuery)
  else
  if TablePageControl.ActivePage = SynonymsTabSheet then
    Exit(SynonymsQuery)
  else
  if TablePageControl.ActivePage = ReferencedByTabSheet then
    Exit(ReferencedByQuery)
  else
  if TablePageControl.ActivePage = ReferencesTabSheet then
    Exit(ReferencesQuery)
  else
  if TablePageControl.ActivePage = DependenciesTabSheet then
    Exit(DependenciesQuery)
end;

procedure TTableBrowserFrame.SaveToFileActionExecute(Sender: TObject);
begin
  Lib.SaveSQL(Handle, SourceSynEdit);
end;

procedure TTableBrowserFrame.SetColumnWidths(OraQuery: TOraQuery);
begin
  Application.ProcessMessages;
  OraQuery.DisableControls;
  if OraQuery = FDataQuery then
    Lib.SetGridColumnWidths(DataDBGrid, True)
  else
  if OraQuery = ColumnsQuery then
    Lib.SetGridColumnWidths(ColumnsDBGrid)
  else
  if OraQuery = IndexesQuery then
    SetGridColumnWidths(IndexesDBGrid)
  else
  if OraQuery = ConstraintsQuery then
  begin
    ConstraintsDBGrid.Columns[4].Visible := False;
    ConstraintsDBGrid.Columns[5].Visible := False;
    Application.ProcessMessages;
    SetGridColumnWidths(ConstraintsDBGrid)
  end
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
    SetGridColumnWidths(DependenciesDBGrid)
  else
  if OraQuery = ReferencedByQuery then
    SetGridColumnWidths(ReferencedByDBGrid)
  else
  if OraQuery = ReferencesQuery then
    SetGridColumnWidths(ReferencesDBGrid);

  OraQuery.EnableControls;
end;

procedure TTableBrowserFrame.GetText(Sender: TField; var Text: String; DisplayText: Boolean);
begin
  Text := Copy(Sender.AsString, 1, 50);
end;

procedure TTableBrowserFrame.GrantPrivilegesActionExecute(Sender: TObject);
begin
  Lib.ExecuteActionFromList(SchemaActionList, 'GrantPrivilegesForObjectAction');
  RefreshAction.Execute;
end;

procedure TTableBrowserFrame.GrantsDBGridSelectionChanged(Sender: TObject);
begin
  SetGrantActions;
end;

procedure TTableBrowserFrame.GrantsQueryAfterOpen(DataSet: TDataSet);
begin
  SetGrantActions
end;

procedure TTableBrowserFrame.SelectAllActionExecute(Sender: TObject);
begin
  MainForm.EditSelectAllAction.Execute;
end;

procedure TTableBrowserFrame.SetClobAndTimestampFields(OraQuery: TOraQuery);
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

procedure TTableBrowserFrame.OpenQuery(Query: TOraQuery; RefreshQuery: Boolean);
var
  Sort, DataFilter, Columns, ColumnName: string;
  OraQuery: TOraQuery;
begin
  Screen.Cursor := crSQLWait;
  try
    if not Assigned(Query) then
      OraQuery := GetActivePageQuery(RefreshQuery)
    else
      OraQuery := Query;
  //  OraQuery.DisableControls;
    if Assigned(OraQuery) then
    begin
      if (not RefreshQuery) and OraQuery.Active and (OraQuery.ParamByName('P_TABLE_NAME').AsWideString = FObjectName) then
        Exit;

      with OraQuery do
      begin
        ColumnName := '';

        Close;
        UnPrepare;
        if (OraQuery = FDataQuery) and (RefreshQuery or (not Assigned(Query)) ) then
        begin
          //DataDBGrid.SortedFields := nil;
          SQL.Clear;
          Columns := CustomizeTableColumns.GetTableColumns(FSchemaParam, FObjectName);
          if Columns = '' then
            Columns := '*';
          SQL.Add(Format('SELECT %s FROM %s.%s WHERE :P_TABLE_NAME = :P_TABLE_NAME', [Columns, FSchemaParam, FObjectName]));
          DataFilter := GetCurrentDataFilter;
          if DataFilter <> '' then
            SQL.Add('AND ' + DataFilter);
          Sort := GetCurrentDataSort;
          if Sort <> '' then
            SQL.Add('ORDER BY ' + Sort)
          else
          if FQuickSort <> '' then
            SQL.Add('ORDER BY ' + FQuickSort);
        end;
        ParamByName('P_TABLE_NAME').AsWideString := FObjectName;
        if OraQuery <> FDataQuery then
          ParamByName('P_OWNER').AsWideString := FSchemaParam;

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
    //OraQuery.EnableControls;
    Screen.Cursor := crDefault;
  end;
end;

procedure TTableBrowserFrame.SetHighlighterTableNames(Value: TStrings);
begin
  SynSQLSyn.TableNames.Text := Value.Text;
end;

procedure TTableBrowserFrame.CopyToClipboard;
begin
  if TablePageControl.ActivePageCaption = 'Source' then
    SourceSynEdit.CopyToClipboard
  else
  if TablePageControl.ActivePageCaption = 'Data' then
    CopyDataFromDBGridToClipboard(DataDBGrid);
end;

procedure TTableBrowserFrame.CopyToClipboardActionExecute(Sender: TObject);
begin
  CopyAllToClipboard(SourceSynEdit);
end;

procedure TTableBrowserFrame.GetTableComments;
begin
  MainForm.StatusBar.Panels[3].Text := GetTableOrViewComment(FSession, FSchemaParam, FObjectName);
end;

procedure TTableBrowserFrame.SetObjectFrameAlign(Value: TAlign);
begin
  ColumnsButtonPanel.Align := Value;
  SourceButtonPanel.Align := Value;
  DataButtonPanel.Align := Value;
  ConstraintButtonPanel.Align := Value;
  TriggersButtonPanel.Align := Value;
  IndexesButtonPanel.Align := Value;
  GrantsButtonPanel.Align := Value;
  SynonymsButtonPanel.Align := Value;
  ReferencedByButtonPanel.Align := Value;
  ReferencesButtonPanel.Align := Value;
  DependenciesButtonPanel.Align := Value;
end;

end.
