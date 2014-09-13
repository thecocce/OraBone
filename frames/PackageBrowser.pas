unit PackageBrowser;

interface

uses
  System.SysUtils, System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Ora, Vcl.Dialogs, BCControls.DBGrid, ComCtrls,
  JvExComCtrls, JvComCtrls, DBAccess, MemDS, Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.Buttons, Vcl.ActnList,
  BCControls.PageControl, Vcl.ImgList, SynEditHighlighter, SynHighlighterSQL, SynEdit, Vcl.AppEvnts, Vcl.ToolWin,
  Vcl.Menus, SynEditMiscClasses, SynEditSearch, BCControls.ImageList, BCControls.ToolBar,
  Vcl.PlatformDefaultStyleActnCtrls, Vcl.ActnPopup, Data.DB, System.Actions, ToolCtrlsEh, GridsEh,
   DBAxisGridsEh, DBGridEh, Vcl.StdCtrls, DBGridEhToolCtrls, DBGridEhGrouping, DynVarsEh;

type
  TPackageBrowserFrame = class(TFrame)
    PackagePageControl: TBCPageControl;
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
    SpecificationTabSheet: TTabSheet;
    SpecPanel: TPanel;
    SpecQuery: TOraQuery;
    SQLEditorAction: TAction;
    SpecDataSource: TOraDataSource;
    SpecSynEdit: TSynEdit;
    SynSQLSyn: TSynSQLSyn;
    BodyTabSheet: TTabSheet;
    BodyQuery: TOraQuery;
    BodyDataSource: TOraDataSource;
    BodyPanel: TPanel;
    BodySynEdit: TSynEdit;
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
    SynonymsToolBar: TBCToolBar;
    ToolButton23: TToolButton;
    ToolButton24: TToolButton;
    RefreshAction: TAction;
    SynEditSearch: TSynEditSearch;
    DependenciesButtonPanel: TPanel;
    DependenciesToolBar: TBCToolBar;
    ToolButton42: TToolButton;
    SpecificationButtonPanel: TPanel;
    SpecificationToolBar: TBCToolBar;
    SQLEditorToolButton: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    BodyButtonPanel: TPanel;
    BodyToolBar: TBCToolBar;
    ToolButton1: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    Bevel2: TBevel;
    RefreshToolbar: TBCToolBar;
    ToolButton46: TToolButton;
    Bevel1: TBevel;
    Refresh2ToolBar: TBCToolBar;
    ToolButton6: TToolButton;
    Bevel3: TBevel;
    Refresh3ToolBar: TBCToolBar;
    ToolButton7: TToolButton;
    Bevel4: TBevel;
    Refresh4ToolBar: TBCToolBar;
    ToolButton8: TToolButton;
    CreationAndModificationTimestampLabel: TLabel;
    procedure PackagePageControlChange(Sender: TObject);
    procedure SQLEditorActionExecute(Sender: TObject);
    procedure SpecQueryAfterOpen(DataSet: TDataSet);
    procedure BodyQueryAfterOpen(DataSet: TDataSet);
    procedure CustomizeActionExecute(Sender: TObject);
    procedure CopyToClipboardActionExecute(Sender: TObject);
    procedure SaveToFileActionExecute(Sender: TObject);
    procedure GrantPrivilegesActionExecute(Sender: TObject);
    procedure RevokePrivilegesActionExecute(Sender: TObject);
    procedure CreateSynonymActionExecute(Sender: TObject);
    procedure DropSynonymActionExecute(Sender: TObject);
    procedure GrantsQueryAfterOpen(DataSet: TDataSet);
    procedure SynonymsQueryAfterOpen(DataSet: TDataSet);
    procedure RefreshSpecActionExecute(Sender: TObject);
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
    procedure GetPackageText(DataSet: TDataSet; SynEdit: TSynEdit);
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

constructor TPackageBrowserFrame.Create(AOwner: TComponent; ParentPanel: TPanel;
  OraSession: TOraSession; SchemaParam: string);
begin
  inherited Create(AOwner);

  Visible := False;
  PackagePageControl.TabIndex := 0;
  Parent := ParentPanel;
  FSession := OraSession;
  SetSession(OraSession);
  FSchemaParam := SchemaParam;
end;

procedure TPackageBrowserFrame.PackagePageControlChange(Sender: TObject);
begin
  OpenQuery(False);
end;

procedure TPackageBrowserFrame.RefreshActionExecute(Sender: TObject);
begin
  OpenQuery(True);
end;

procedure TPackageBrowserFrame.RefreshSpecActionExecute(Sender: TObject);
begin
  if SpecQuery.Active then
  begin
    SpecQuery.Close;
    SpecQuery.Open;
  end;
end;

procedure TPackageBrowserFrame.RevokePrivilegesActionExecute(Sender: TObject);
begin
  Lib.RevokeSelectedGrants(FSession, FSchemaParam, FObjectName, GrantsDBGrid);
{  if Common.AskYesOrNo(Format('Revoke privilege %s, are you sure?', [GrantsQuery.FieldByName(PRIVILEGE).AsString])) then
  begin
    GrantsQuery.Session.ExecSQL(Format('REVOKE %s ON %s FROM %s', [GrantsQuery.FieldByName(PRIVILEGE).AsString,
      FObjectName, GrantsQuery.FieldByName(GRANTEE).AsString]), []);
    GrantsQuery.Refresh;
  end; }
end;

procedure TPackageBrowserFrame.SetSession(OraSession: TOraSession);
var
  i: Integer;
begin
  for i := 0 to ComponentCount - 1 do
    if Components[i] is TOraQuery then
      TOraQuery(Components[i]).Session := OraSession;
end;

procedure TPackageBrowserFrame.SpecQueryAfterOpen(DataSet: TDataSet);
begin
  GetPackageText(DataSet, SpecSynEdit);
end;

procedure TPackageBrowserFrame.GetPackageText(DataSet: TDataSet; SynEdit: TSynEdit);
begin
  with DataSet do
  begin
    SynEdit.Lines.Clear;
    SynEdit.Lines.BeginUpdate;
    SynEdit.Text := 'CREATE OR REPLACE ' + FieldByName('TYPE').AsWideString + ' ' +
      FSchemaParam + '.' +
      Copy(FieldByName('TEXT').AsWideString, Pos(FObjectName, UpperCase(FieldByName('TEXT').AsWideString)), Length(FieldByName('TEXT').AsWideString));
    Next;
    while not Eof do
    begin
      SynEdit.Text := SynEdit.Text + FieldByName('TEXT').AsWideString;
      Next;
    end;
    SynEdit.Lines.EndUpdate;
  end;
end;

procedure TPackageBrowserFrame.GrantPrivilegesActionExecute(Sender: TObject);
begin
  Lib.ExecuteActionFromList(SchemaActionList, 'GrantPrivilegesForObjectAction');
  RefreshAction.Execute;
end;

procedure TPackageBrowserFrame.GrantsDBGridSelectionChanged(Sender: TObject);
begin
  SetGrantActions
end;

procedure TPackageBrowserFrame.GrantsQueryAfterOpen(DataSet: TDataSet);
begin
  SetGrantActions
end;

procedure TPackageBrowserFrame.SQLEditorActionExecute(Sender: TObject);
begin
  if PackagePageControl.ActivePage = SpecificationTabSheet then
    MainForm.LoadSQLIntoEditor(Format('%s@%s', [SpecQuery.Session.Schema, SpecQuery.Session.Server]), SpecSynEdit.Text)
  else
    MainForm.LoadSQLIntoEditor(Format('%s@%s', [BodyQuery.Session.Schema, BodyQuery.Session.Server]), BodySynEdit.Text);
end;

procedure TPackageBrowserFrame.SynonymsDBGridSelectionChanged(Sender: TObject);
begin
  SetSynonymActions
end;

procedure TPackageBrowserFrame.SynonymsQueryAfterOpen(DataSet: TDataSet);
begin
  SetSynonymActions
end;

procedure TPackageBrowserFrame.BodyQueryAfterOpen(DataSet: TDataSet);
begin
  GetPackageText(DataSet, BodySynEdit);
end;

procedure TPackageBrowserFrame.CopyToClipboardActionExecute(Sender: TObject);
var
  SynEdit: TSynEdit;
begin
  if PackagePageControl.ActivePage = SpecificationTabSheet then
    SynEdit := SpecSynEdit
  else
    SynEdit := BodySynEdit;

  Lib.CopyAllToClipboard(SynEdit);
end;

procedure TPackageBrowserFrame.CreateSynonymActionExecute(Sender: TObject);
begin
  Lib.ExecuteActionFromList(SchemaActionList, 'CreateSynonymForObjectAction');
  RefreshAction.Execute;
end;

procedure TPackageBrowserFrame.CustomizeActionExecute(Sender: TObject);
begin
  CustomizePageControlDialog.Open(PackagePageControl);
end;

procedure TPackageBrowserFrame.DropSynonymActionExecute(Sender: TObject);
//var
//  SynonymAvailability: string;
begin
  Lib.DropSelectedSynonyms(FSession, SynonymsDBGrid);
{  if Common.AskYesOrNo(Format('Drop synonym %s, are you sure?', [SynonymsQuery.FieldByName(SYNONYM_NAME).AsString])) then
  begin
    SynonymAvailability := '';
    if SynonymsQuery.FieldByName(SYNONYM_OWNER).AsString = 'PUBLIC' then
      SynonymAvailability := 'PUBLIC ';
    SynonymsQuery.Session.ExecSQL(Format('DROP %sSYNONYM %s', [SynonymAvailability, SynonymsQuery.FieldByName(SYNONYM_NAME).AsString]), []);
    SynonymsQuery.Refresh;
  end;   }
end;

function TPackageBrowserFrame.GetActivePageQuery: TOraQuery;
begin
  Result := nil;
  if PackagePageControl.ActivePage = SpecificationTabSheet then
  begin
    CreationAndModificationTimestampLabel.Caption := '';
    if OptionsContainer.ShowObjectCreationAndModificationTimestamp then
      CreationAndModificationTimestampLabel.Caption := GetCreationAndModificationTimestamp(FSession, FSchemaParam, FObjectName);
    Result := SpecQuery
  end
  else
  if PackagePageControl.ActivePage = BodyTabSheet then
    Result := BodyQuery
  else
  if PackagePageControl.ActivePage = GrantsTabSheet then
    Result := GrantsQuery
  else
  if PackagePageControl.ActivePage = SynonymsTabSheet then
    Result := SynonymsQuery
  else
  if PackagePageControl.ActivePage = DependenciesTabSheet then
    Result := DependenciesQuery
end;

procedure TPackageBrowserFrame.SaveToFileActionExecute(Sender: TObject);
var
  SynEdit: TSynEdit;
begin
  if PackagePageControl.ActivePage = SpecificationTabSheet then
    SynEdit := SpecSynEdit
  else
    SynEdit := BodySynEdit;
  Lib.SaveSQL(Handle, SynEdit);
end;

procedure TPackageBrowserFrame.SetColumnWidths(OraQuery: TOraQuery);
begin
  Application.ProcessMessages;
  OraQuery.DisableControls;
  if OraQuery = SynonymsQuery then
    Lib.SetGridColumnWidths(SynonymsDBGrid)
  else
  if OraQuery = GrantsQuery then
    Lib.SetGridColumnWidths(GrantsDBGrid)
  else
  if OraQuery = DependenciesQuery then
    SetGridColumnWidths(DependenciesDBGrid);
  OraQuery.EnableControls;
end;

procedure TPackageBrowserFrame.OpenQuery(RefreshQuery: Boolean);
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

procedure TPackageBrowserFrame.SetHighlighterTableNames(Value: TStrings);
begin
  SynSQLSyn.TableNames.Text := Value.Text;
end;

procedure TPackageBrowserFrame.SetGrantActions;
begin
  RevokePrivilegesAction.Enabled := GrantsDBGrid.SelectedRows.Count > 0;
end;

procedure TPackageBrowserFrame.SetSynonymActions;
begin
  DropSynonymAction.Enabled := SynonymsDBGrid.SelectedRows.Count > 0;
end;

procedure TPackageBrowserFrame.SetObjectFrameAlign(Value: TAlign);
begin
  SpecificationButtonPanel.Align := Value;
  BodyButtonPanel.Align := Value;
  GrantsButtonPanel.Align := Value;
  SynonymsButtonPanel.Align := Value;
  DependenciesButtonPanel.Align := Value;
end;

procedure TPackageBrowserFrame.CopyToClipboard;
begin
  if PackagePageControl.ActivePageCaption = 'Specification' then
    SpecSynEdit.CopyToClipboard
  else
  if PackagePageControl.ActivePageCaption = 'Body' then
    BodySynEdit.CopyToClipboard
end;

end.
