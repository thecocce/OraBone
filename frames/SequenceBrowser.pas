unit SequenceBrowser;

interface

uses
  System.SysUtils, System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Ora, Vcl.Dialogs, BCControls.DBGrid, ComCtrls,
  JvExComCtrls, JvComCtrls, DBAccess, MemDS, Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.Buttons, Vcl.ActnList,
  BCControls.PageControl, Vcl.ImgList, SynEditHighlighter, SynHighlighterSQL, SynEdit, Vcl.AppEvnts, Vcl.ToolWin,
  Vcl.Menus, BCControls.ImageList, BCControls.ToolBar, Vcl.PlatformDefaultStyleActnCtrls, Vcl.ActnPopup,
  GridsEh, DBGridEh, Data.DB, ToolCtrlsEh, System.Actions, DBAxisGridsEh, Vcl.StdCtrls,
  DBGridEhGrouping, DBGridEhToolCtrls, DynVarsEh;

type
  TSequenceBrowserFrame = class(TFrame)
    SequencePageControl: TBCPageControl;
    GrantsTabSheet: TTabSheet;
    DependenciesTabSheet: TTabSheet;
    ImageList: TBCImageList;
    ActionList: TActionList;
    GrantsDataSource: TOraDataSource;
    GrantsQuery: TOraQuery;
    DependenciesDataSource: TOraDataSource;
    DependenciesQuery: TOraQuery;
    GrantsPanel: TPanel;
    GrantsDBGrid: TBCDBGrid;
    DependenciesPanel: TPanel;
    DependenciesDBGrid: TBCDBGrid;
    SynonymsQuery: TOraQuery;
    SynonymsDataSource: TOraDataSource;
    SynonymsTabSheet: TTabSheet;
    SynonymsPanel: TPanel;
    SynonymsDBGrid: TBCDBGrid;
    SourceTabSheet: TTabSheet;
    SourcePanel: TPanel;
    SequenceQuery: TOraQuery;
    SQLEditorAction: TAction;
    SequenceDataSource: TOraDataSource;
    SourceSynEdit: TSynEdit;
    SynSQLSyn: TSynSQLSyn;
    InfoTabSheet: TTabSheet;
    SequencePanel: TPanel;
    SequenceDBGrid: TBCDBGrid;
    CustomizeAction: TAction;
    PageControlPopupActionBar: TPopupActionBar;
    CustomizePageControl1: TMenuItem;
    CopyToClipboardAction: TAction;
    SaveToFileAction: TAction;
    GrantPrivilegesAction: TAction;
    RevokePrivilegesAction: TAction;
    CreateSynonymAction: TAction;
    DropSynonymAction: TAction;
    GrantsButtonPanel: TPanel;
    GrantsToolBar: TBCToolBar;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    SynonymsButtonPanel: TPanel;
    SynonymsToolBar: TBCToolBar;
    ToolButton23: TToolButton;
    ToolButton24: TToolButton;
    InfoButtonPanel: TPanel;
    InfoToolBar: TBCToolBar;
    ToolButton41: TToolButton;
    RefreshAction: TAction;
    DependenciesButtonPanel: TPanel;
    DependenciesToolBar: TBCToolBar;
    ToolButton42: TToolButton;
    SourceButtonPanel: TPanel;
    SourceToolBar: TBCToolBar;
    SQLEditorToolButton: TToolButton;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    Bevel2: TBevel;
    RefreshToolbar: TBCToolBar;
    ToolButton46: TToolButton;
    Bevel1: TBevel;
    Refresh2ToolBar: TBCToolBar;
    ToolButton5: TToolButton;
    Bevel3: TBevel;
    BCToolBar1: TBCToolBar;
    ToolButton6: TToolButton;
    CreationAndModificationTimestampLabel: TLabel;
    procedure SequencePageControlChange(Sender: TObject);
    procedure SQLEditorActionExecute(Sender: TObject);
    procedure SequenceQueryAfterOpen(DataSet: TDataSet);
    procedure CustomizeActionExecute(Sender: TObject);
    procedure CopyToClipboardActionExecute(Sender: TObject);
    procedure SaveToFileActionExecute(Sender: TObject);
    procedure GrantPrivilegesActionExecute(Sender: TObject);
    procedure RevokePrivilegesActionExecute(Sender: TObject);
    procedure CreateSynonymActionExecute(Sender: TObject);
    procedure DropSynonymActionExecute(Sender: TObject);
    procedure GrantsQueryAfterOpen(DataSet: TDataSet);
    procedure SynonymsQueryAfterOpen(DataSet: TDataSet);
    procedure RefreshActionExecute(Sender: TObject);
    procedure GrantsDBGridSelectionChanged(Sender: TObject);
    procedure SynonymsDBGridSelectionChanged(Sender: TObject);
  private
    { Private declarations }
    FSession: TOraSession;
    FObjectName: string;
    FSchemaParam: string;
    FSchemaActionList: TActionList;
    procedure SetSession(OraSession: TOraSession);
    function GetActivePageQuery: TOraQuery;
    procedure SetHighlighterTableNames(Value: TStrings);
    procedure SetColumnWidths(OraQuery: TOraQuery);
    procedure SetGrantActions;
    procedure SetSynonymActions;
    procedure SetObjectFrameAlign(Value: TAlign);
  public
    { Public declarations }
    constructor Create(AOwner: TComponent; ParentPanel: TPanel;
      OraSession: TOraSession; SchemaParam: string); reintroduce; overload;
    procedure OpenQuery(Query: TOraQuery; RefreshQuery: Boolean);
    property ObjectName: string write FObjectName;
    property HighlighterTableNames: TStrings write SetHighlighterTableNames;
    property SchemaParam: string read FSchemaParam write FSchemaParam;
    property SchemaActionList: TActionList read FSchemaActionList write FSchemaActionList;
    property ObjectFrameAlign: TAlign write SetObjectFrameAlign;
    procedure CopyToClipboard;
  end;

implementation

{$R *.dfm}

uses
  Main, CustomizePages, Lib, BCCommon.Lib, BCCommon.OptionsContainer;

const
  { SynonymsQuery columns }
  SYNONYM_OWNER = 'Synonym Owner';
  SYNONYM_NAME = 'Synonym Name';
  { GrantsQuery columns }
  GRANTEE = 'Granted To';
  PRIVILEGE = 'Privilege';
  { SequenceQuery columns }
  MIN_VALUE = 'Min Value';
  MAX_VALUE = 'Max Value';
  LAST_NUMBER = 'Last Number';
  INCREMENT_BY = 'Increment By';
  CACHE_SIZE = 'Cache Size';
  CYCLE_FLAG = 'Cycle';
  ORDER_FLAG = 'Order';

constructor TSequenceBrowserFrame.Create(AOwner: TComponent; ParentPanel: TPanel;
  OraSession: TOraSession; SchemaParam: string);
begin
  inherited Create(AOwner);

  Visible := False;
  SequencePageControl.TabIndex := 0;
  Parent := ParentPanel;
  FSession := OraSession;
  SetSession(OraSession);
  FSchemaParam := SchemaParam;
end;

procedure TSequenceBrowserFrame.SaveToFileActionExecute(Sender: TObject);
begin
  Lib.SaveSQL(Handle, SourceSynEdit);
end;

procedure TSequenceBrowserFrame.SequencePageControlChange(Sender: TObject);
begin
  OpenQuery(nil, False);
end;

procedure TSequenceBrowserFrame.SetSession(OraSession: TOraSession);
var
  i: Integer;
begin
  for i := 0 to ComponentCount - 1 do
    if Components[i] is TOraQuery then
      TOraQuery(Components[i]).Session := OraSession;
end;

procedure TSequenceBrowserFrame.SequenceQueryAfterOpen(DataSet: TDataSet);
var
  TempObjectName: string;
begin
  with DataSet do
  begin
    SourceSynEdit.Lines.Clear;
    SourceSynEdit.Lines.BeginUpdate;
    SourceSynEdit.Lines.Text := 'DROP SEQUENCE ' + FSchemaParam + '.' + FObjectName + ';' + CHR_ENTER + CHR_ENTER;
    SourceSynEdit.Lines.Text := SourceSynEdit.Lines.Text + 'CREATE SEQUENCE ' + FSchemaParam + '.' + FObjectName + '' + CHR_ENTER;
    SourceSynEdit.Lines.Text := SourceSynEdit.Lines.Text + '  MINVALUE ' + DataSet.FieldByName(MIN_VALUE).AsWideString + CHR_ENTER;
    SourceSynEdit.Lines.Text := SourceSynEdit.Lines.Text + '  MAXVALUE ' + DataSet.FieldByName(MAX_VALUE).AsWideString + CHR_ENTER;
    SourceSynEdit.Lines.Text := SourceSynEdit.Lines.Text + '  START WITH ' + DataSet.FieldByName(LAST_NUMBER).AsWideString + CHR_ENTER;
    SourceSynEdit.Lines.Text := SourceSynEdit.Lines.Text + '  INCREMENT BY ' + DataSet.FieldByName(INCREMENT_BY).AsWideString + CHR_ENTER;
    if DataSet.FieldByName(CACHE_SIZE).AsInteger > 0 then
      SourceSynEdit.Lines.Text := SourceSynEdit.Lines.Text + '  CACHE ' + DataSet.FieldByName(CACHE_SIZE).AsWideString + CHR_ENTER
    else
      SourceSynEdit.Lines.Text := SourceSynEdit.Lines.Text + '  NOCACHE' + CHR_ENTER;
    if DataSet.FieldByName(CYCLE_FLAG).AsWideString = 'No' then
      SourceSynEdit.Lines.Text := SourceSynEdit.Lines.Text + '  NOCYCLE' + CHR_ENTER
    else
      SourceSynEdit.Lines.Text := SourceSynEdit.Lines.Text + '  CYCLE' + CHR_ENTER;
    if DataSet.FieldByName(ORDER_FLAG).AsWideString = 'No' then
      SourceSynEdit.Lines.Text := SourceSynEdit.Lines.Text + '  NOORDER'
    else
      SourceSynEdit.Lines.Text := SourceSynEdit.Lines.Text + '  ORDER';
    SourceSynEdit.Lines.Text := SourceSynEdit.Lines.Text + ';' + CHR_ENTER + CHR_ENTER;
    { grants }
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
          SourceSynEdit.Lines.Text := SourceSynEdit.Lines.Text + ' ON ' + FSchemaParam + '.' + FObjectName + ' TO ' + FSchemaParam + '.' + TempObjectName + ';' + CHR_ENTER
        else
          SourceSynEdit.Lines.Text := SourceSynEdit.Lines.Text + ', ';
      end;
    end;
    SourceSynEdit.Lines.Text := Trim(SourceSynEdit.Lines.Text);
    SourceSynEdit.Lines.EndUpdate;
  end;
end;

procedure TSequenceBrowserFrame.SQLEditorActionExecute(Sender: TObject);
begin
  MainForm.LoadSQLIntoEditor(Format('%s@%s', [SequenceQuery.Session.Schema, SequenceQuery.Session.Server]), SourceSynEdit.Text);
end;

procedure TSequenceBrowserFrame.SynonymsDBGridSelectionChanged(Sender: TObject);
begin
  SetSynonymActions
end;

procedure TSequenceBrowserFrame.SynonymsQueryAfterOpen(DataSet: TDataSet);
begin
  SetSynonymActions
end;

procedure TSequenceBrowserFrame.CopyToClipboardActionExecute(Sender: TObject);
begin
  CopyAllToClipboard(SourceSynEdit);
end;

procedure TSequenceBrowserFrame.CreateSynonymActionExecute(Sender: TObject);
begin
  Lib.ExecuteActionFromList(SchemaActionList, 'CreateSynonymForObjectAction');
  RefreshAction.Execute;
end;

procedure TSequenceBrowserFrame.CustomizeActionExecute(Sender: TObject);
begin
  CustomizePageControlDialog.Open(SequencePageControl);
end;

procedure TSequenceBrowserFrame.DropSynonymActionExecute(Sender: TObject);
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

function TSequenceBrowserFrame.GetActivePageQuery: TOraQuery;
begin
  Result := nil;
  if SequencePageControl.ActivePage = InfoTabSheet then
  begin
    CreationAndModificationTimestampLabel.Caption := '';
    if OptionsContainer.ShowObjectCreationAndModificationTimestamp then
      CreationAndModificationTimestampLabel.Caption := GetCreationAndModificationTimestamp(FSession, FSchemaParam, FObjectName);
    Result := SequenceQuery
  end
  else
  if SequencePageControl.ActivePage = SourceTabSheet then
    Result := SequenceQuery
  else
  if SequencePageControl.ActivePage = GrantsTabSheet then
    Result := GrantsQuery
  else
  if SequencePageControl.ActivePage = SynonymsTabSheet then
    Result := SynonymsQuery
  else
  if SequencePageControl.ActivePage = DependenciesTabSheet then
    Result := DependenciesQuery
end;

procedure TSequenceBrowserFrame.GrantPrivilegesActionExecute(Sender: TObject);
begin
  Lib.ExecuteActionFromList(SchemaActionList, 'GrantPrivilegesForObjectAction');
  RefreshAction.Execute;
end;

procedure TSequenceBrowserFrame.GrantsDBGridSelectionChanged(Sender: TObject);
begin
  SetGrantActions
end;

procedure TSequenceBrowserFrame.GrantsQueryAfterOpen(DataSet: TDataSet);
begin
  SetGrantActions
end;

procedure TSequenceBrowserFrame.SetColumnWidths(OraQuery: TOraQuery);
begin
  Application.ProcessMessages;
  OraQuery.DisableControls;
  if OraQuery = SequenceQuery then
    SetGridColumnWidths(SequenceDBGrid)
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

procedure TSequenceBrowserFrame.OpenQuery(Query: TOraQuery; RefreshQuery: Boolean);
var
  OraQuery: TOraQuery;
begin
  if not Assigned(Query) then
    OraQuery := GetActivePageQuery
  else
    OraQuery := Query;

  if Assigned(OraQuery) then
  begin
    if (not RefreshQuery) and OraQuery.Active and (OraQuery.ParamByName('P_OBJECT_NAME').AsWideString = FObjectName) then
      Exit;

    with OraQuery do
    begin
      Close;
      UnPrepare;
      ParamByName('P_OBJECT_NAME').AsWideString := FObjectName;
      ParamByName('P_OWNER').AsWideString := FSchemaParam;
      Prepare;
      Open;
      SetColumnWidths(OraQuery);
    end;
  end;
end;

procedure TSequenceBrowserFrame.RefreshActionExecute(Sender: TObject);
begin
  if SequencePageControl.ActivePage = InfoTabSheet then
    OpenQuery(SequenceQuery, True)
  else
  if SequencePageControl.ActivePage = SourceTabSheet then
    OpenQuery(SequenceQuery, True)
  else
  if SequencePageControl.ActivePage = GrantsTabSheet then
    OpenQuery(GrantsQuery, True)
  else
  if SequencePageControl.ActivePage = SynonymsTabSheet then
    OpenQuery(SynonymsQuery, True)
  else
  if SequencePageControl.ActivePage = DependenciesTabSheet then
    OpenQuery(DependenciesQuery, True)
end;

procedure TSequenceBrowserFrame.RevokePrivilegesActionExecute(Sender: TObject);
begin
  Lib.RevokeSelectedGrants(FSession, FSchemaParam, FObjectName, GrantsDBGrid);
  {if Common.AskYesOrNo(Format('Revoke privilege %s, are you sure?', [GrantsQuery.FieldByName(PRIVILEGE).AsString])) then
  begin
    GrantsQuery.Session.ExecSQL(Format('REVOKE %s ON %s FROM %s', [GrantsQuery.FieldByName(PRIVILEGE).AsString,
      FObjectName, GrantsQuery.FieldByName(GRANTEE).AsString]), []);
    GrantsQuery.Refresh;
  end;}
end;

procedure TSequenceBrowserFrame.SetHighlighterTableNames(Value: TStrings);
begin
  SynSQLSyn.TableNames.Text := Value.Text;
end;

procedure TSequenceBrowserFrame.SetGrantActions;
begin
  RevokePrivilegesAction.Enabled := GrantsDBGrid.SelectedRows.Count > 0;
end;

procedure TSequenceBrowserFrame.SetSynonymActions;
begin
  DropSynonymAction.Enabled := SynonymsDBGrid.SelectedRows.Count > 0;
end;

procedure TSequenceBrowserFrame.SetObjectFrameAlign(Value: TAlign);
begin
  InfoButtonPanel.Align := Value;
  SourceButtonPanel.Align := Value;
  GrantsButtonPanel.Align := Value;
  SynonymsButtonPanel.Align := Value;
  DependenciesButtonPanel.Align := Value;
end;

procedure TSequenceBrowserFrame.CopyToClipboard;
begin
  SourceSynEdit.CopyToClipboard
end;

end.
