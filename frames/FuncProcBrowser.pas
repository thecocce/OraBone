unit FuncProcBrowser;

interface

uses
  System.SysUtils, System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Ora, Vcl.Dialogs, Vcl.ComCtrls, JvExComCtrls,
  JvComCtrls, DB, DBAccess, MemDS, Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.Buttons, Vcl.ActnList, BCControls.PageControl,
  Vcl.ImgList, SynEditHighlighter, SynHighlighterSQL, SynEdit, Vcl.AppEvnts, Vcl.ToolWin, Vcl.Menus,
  BCControls.ImageList, BCControls.ToolBar, PlatformDefaultStyleActnCtrls, Vcl.ActnPopup, GridsEh,
  DBGridEh, BCControls.DBGrid, System.Actions, ToolCtrlsEh, DBAxisGridsEh, Vcl.StdCtrls, DBGridEhGrouping,
  DBGridEhToolCtrls, DynVarsEh;

type
  TFuncProcBrowserFrame = class(TFrame)
    FuncProcPageControl: TBCPageControl;
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
    SourceQuery: TOraQuery;
    SQLEditorAction: TAction;
    SourceDataSource: TOraDataSource;
    SourceSynEdit: TSynEdit;
    SynSQLSyn: TSynSQLSyn;
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
    JvToolBar3: TBCToolBar;
    ToolButton21: TToolButton;
    ToolButton22: TToolButton;
    SynonymsButtonPanel: TPanel;
    JvToolBar4: TBCToolBar;
    ToolButton23: TToolButton;
    ToolButton24: TToolButton;
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
    ToolButton3: TToolButton;
    Bevel3: TBevel;
    Refresh3ToolBar: TBCToolBar;
    ToolButton4: TToolButton;
    CreationAndModificationTimestampLabel: TLabel;
    procedure FuncProcPageControlChange(Sender: TObject);
    procedure SQLEditorActionExecute(Sender: TObject);
    procedure SourceQueryAfterOpen(DataSet: TDataSet);
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
    procedure OpenQuery(RefreshQuery: Boolean);
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
  Main, CustomizePages, Lib, BCCommon.OptionsContainer;

const
  { SynonymsQuery columns }
  SYNONYM_OWNER = 'Synonym Owner';
  SYNONYM_NAME = 'Synonym Name';
  { GrantsQuery columns }
  GRANTEE = 'Granted To';
  PRIVILEGE = 'Privilege';

constructor TFuncProcBrowserFrame.Create(AOwner: TComponent; ParentPanel: TPanel;
  OraSession: TOraSession; SchemaParam: string);
begin
  inherited Create(AOwner);

  Visible := False;
  FuncProcPageControl.TabIndex := 0;
  Parent := ParentPanel;
  FSession := OraSession;
  SetSession(OraSession);
  FSchemaParam := SchemaParam;
end;

procedure TFuncProcBrowserFrame.CopyToClipboardActionExecute(Sender: TObject);
begin
  Lib.CopyAllToClipboard(SourceSynEdit);
end;

procedure TFuncProcBrowserFrame.CreateSynonymActionExecute(Sender: TObject);
begin
  Lib.ExecuteActionFromList(SchemaActionList, 'CreateSynonymForObjectAction');
  RefreshAction.Execute;
end;

procedure TFuncProcBrowserFrame.CustomizeActionExecute(Sender: TObject);
begin
  CustomizePageControlDialog.Open(FuncProcPageControl);
end;

procedure TFuncProcBrowserFrame.DropSynonymActionExecute(Sender: TObject);
begin
  Lib.DropSelectedSynonyms(FSession, SynonymsDBGrid);
end;

procedure TFuncProcBrowserFrame.FuncProcPageControlChange(Sender: TObject);
begin
  OpenQuery(False);
end;

procedure TFuncProcBrowserFrame.SetSession(OraSession: TOraSession);
var
  i: Integer;
begin
  for i := 0 to ComponentCount - 1 do
    if Components[i] is TOraQuery then
      TOraQuery(Components[i]).Session := OraSession;
end;

procedure TFuncProcBrowserFrame.SourceQueryAfterOpen(DataSet: TDataSet);
begin
  with DataSet do
  begin
    SourceSynEdit.Lines.Clear;
    SourceSynEdit.Lines.BeginUpdate;
    SourceSynEdit.Lines.Text := 'CREATE OR REPLACE ' + FieldByName('TYPE').AsWideString + ' ' +
      FSchemaParam + '.' +
      Copy(FieldByName('TEXT').AsWideString, Pos(FObjectName, UpperCase(FieldByName('TEXT').AsWideString)), Length(FieldByName('TEXT').AsWideString));
    Next;
    while not Eof do
    begin
      SourceSynEdit.Lines.Text := SourceSynEdit.Lines.Text + FieldByName('TEXT').AsWideString;
      Next;
    end;
    SourceSynEdit.Lines.Text := Trim(SourceSynEdit.Lines.Text);
    SourceSynEdit.Lines.EndUpdate;
  end;
end;

procedure TFuncProcBrowserFrame.SQLEditorActionExecute(Sender: TObject);
begin
  MainForm.LoadSQLIntoEditor(Format('%s@%s', [SourceQuery.Session.Schema, SourceQuery.Session.Server]), SourceSynEdit.Text);
end;

procedure TFuncProcBrowserFrame.SynonymsDBGridSelectionChanged(Sender: TObject);
begin
  SetSynonymActions
end;

procedure TFuncProcBrowserFrame.SynonymsQueryAfterOpen(DataSet: TDataSet);
begin
  SetSynonymActions
end;

function TFuncProcBrowserFrame.GetActivePageQuery: TOraQuery;
begin
  Result := nil;
  if FuncProcPageControl.ActivePage = SourceTabSheet then
  begin
    CreationAndModificationTimestampLabel.Caption := '';
    if OptionsContainer.ShowObjectCreationAndModificationTimestamp then
      CreationAndModificationTimestampLabel.Caption := GetCreationAndModificationTimestamp(FSession, FSchemaParam, FObjectName);
    Result := SourceQuery
  end
  else
  if FuncProcPageControl.ActivePage = GrantsTabSheet then
    Result := GrantsQuery
  else
  if FuncProcPageControl.ActivePage = SynonymsTabSheet then
    Result := SynonymsQuery
  else
  if FuncProcPageControl.ActivePage = DependenciesTabSheet then
    Result := DependenciesQuery
end;

procedure TFuncProcBrowserFrame.GrantPrivilegesActionExecute(Sender: TObject);
begin
  Lib.ExecuteActionFromList(SchemaActionList, 'GrantPrivilegesForObjectAction');
  RefreshAction.Execute;
end;

procedure TFuncProcBrowserFrame.GrantsDBGridSelectionChanged(Sender: TObject);
begin
  SetGrantActions;
end;

procedure TFuncProcBrowserFrame.GrantsQueryAfterOpen(DataSet: TDataSet);
begin
  SetGrantActions;
end;

procedure TFuncProcBrowserFrame.SaveToFileActionExecute(Sender: TObject);
begin
  Lib.SaveSQL(Handle, SourceSynEdit);
end;

procedure TFuncProcBrowserFrame.SetColumnWidths(OraQuery: TOraQuery);
begin
  Application.ProcessMessages;
  OraQuery.DisableControls;
  if OraQuery = GrantsQuery then
    Lib.SetGridColumnWidths(GrantsDBGrid)
  else
  if OraQuery = SynonymsQuery then
    Lib.SetGridColumnWidths(SynonymsDBGrid)
  else
  if OraQuery = DependenciesQuery then
    SetGridColumnWidths(DependenciesDBGrid);
  OraQuery.EnableControls;
end;

procedure TFuncProcBrowserFrame.OpenQuery(RefreshQuery: Boolean);
var
  OraQuery: TOraQuery;
begin
  OraQuery := GetActivePageQuery;

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

procedure TFuncProcBrowserFrame.RefreshActionExecute(Sender: TObject);
begin
  OpenQuery(True);
end;

procedure TFuncProcBrowserFrame.RevokePrivilegesActionExecute(Sender: TObject);
begin
  Lib.RevokeSelectedGrants(FSession, FSchemaParam, FObjectName, GrantsDBGrid);
  {if Common.AskYesOrNo(Format('Revoke privilege %s, are you sure?', [GrantsQuery.FieldByName(PRIVILEGE).AsString])) then
  begin
    GrantsQuery.Session.ExecSQL(Format('REVOKE %s ON %s FROM %s', [GrantsQuery.FieldByName(PRIVILEGE).AsString,
      FObjectName, GrantsQuery.FieldByName(GRANTEE).AsString]), []);
    GrantsQuery.Refresh;
  end;  }
end;

procedure TFuncProcBrowserFrame.SetHighlighterTableNames(Value: TStrings);
begin
  SynSQLSyn.TableNames.Text := Value.Text;
end;

procedure TFuncProcBrowserFrame.SetGrantActions;
begin
  RevokePrivilegesAction.Enabled := GrantsDBGrid.SelectedRows.Count > 0;
end;

procedure TFuncProcBrowserFrame.SetSynonymActions;
begin
  DropSynonymAction.Enabled := SynonymsDBGrid.SelectedRows.Count > 0;
end;

procedure TFuncProcBrowserFrame.SetObjectFrameAlign(Value: TAlign);
begin
  SourceButtonPanel.Align := Value;
  GrantsButtonPanel.Align := Value;
  SynonymsButtonPanel.Align := Value;
  DependenciesButtonPanel.Align := Value;
end;

procedure TFuncProcBrowserFrame.CopyToClipboard;
begin
  SourceSynEdit.CopyToClipboard
end;

end.
