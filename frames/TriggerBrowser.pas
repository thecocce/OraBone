unit TriggerBrowser;

interface

uses
  System.SysUtils, System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Ora, Vcl.Dialogs, BCControls.DBGrid,
  Vcl.ComCtrls, JvExComCtrls, JvComCtrls, DBAccess, MemDS, Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.Buttons, Vcl.ActnList,
  BCControls.PageControl, Vcl.ImgList, SynEditHighlighter, SynHighlighterSQL, SynEdit, Vcl.AppEvnts, Vcl.ToolWin,
  Vcl.Menus, BCControls.ImageList, BCControls.ToolBar, Vcl.PlatformDefaultStyleActnCtrls, Vcl.ActnPopup,
  Data.DB, System.Actions, GridsEh, DBAxisGridsEh, DBGridEh, Vcl.StdCtrls, DBGridEhToolCtrls,
  DBGridEhGrouping, ToolCtrlsEh, DynVarsEh;

type
  TTriggerBrowserFrame = class(TFrame)
    TriggerPageControl: TBCPageControl;
    ImageList: TBCImageList;
    ActionList: TActionList;
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
    TriggersTopPanel: TPanel;
    TriggersDBGrid: TBCDBGrid;
    EnableTriggerAction: TAction;
    DisableTriggerAction: TAction;
    CopyToClipboardAction: TAction;
    SaveToFileAction: TAction;
    RefreshAction: TAction;
    SourceButtonPanel: TPanel;
    SourceToolBar: TBCToolBar;
    SQLEditorToolButton: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    BCToolBar1: TBCToolBar;
    ToolButton8: TToolButton;
    ToolButton9: TToolButton;
    Bevel3: TBevel;
    Bevel1: TBevel;
    BCToolBar2: TBCToolBar;
    ToolButton2: TToolButton;
    CreationAndModificationTimestampLabel: TLabel;
    procedure TriggerPageControlChange(Sender: TObject);
    procedure SQLEditorActionExecute(Sender: TObject);
    procedure CustomizeActionExecute(Sender: TObject);
    procedure EnableTriggerActionExecute(Sender: TObject);
    procedure DisableTriggerActionExecute(Sender: TObject);
    procedure SourceQueryAfterScroll(DataSet: TDataSet);
    procedure SaveToFileActionExecute(Sender: TObject);
    procedure CopyToClipboardActionExecute(Sender: TObject);
    procedure RefreshActionExecute(Sender: TObject);
  private
    { Private declarations }
    FObjectName: string;
    FSchemaParam: string;
    FSession: TOraSession;
    procedure SetSession(OraSession: TOraSession);
    function GetActivePageQuery: TOraQuery;
    procedure SetHighlighterTableNames(Value: TStrings);
    procedure SetObjectFrameAlign(Value: TAlign);
  public
    { Public declarations }
    constructor Create(AOwner: TComponent; ParentPanel: TPanel;
      OraSession: TOraSession; SchemaParam: string); reintroduce; overload;
    procedure OpenQuery(RefreshQuery: Boolean);
    property ObjectName: string write FObjectName;
    property HighlighterTableNames: TStrings write SetHighlighterTableNames;
    property SchemaParam: string read FSchemaParam write FSchemaParam;
    property ObjectFrameAlign: TAlign write SetObjectFrameAlign;
    procedure CopyToClipboard;
  end;

implementation

uses
  Main, CustomizePages, Lib, BCCommon.OptionsContainer;

const
  TRIGGER_NAME = 'Trigger Name';
  TRIGGER_STATUS = 'Status';
  STATUS_ENABLED = 'Enabled';

{$R *.dfm}

constructor TTriggerBrowserFrame.Create(AOwner: TComponent; ParentPanel: TPanel;
  OraSession: TOraSession; SchemaParam: string);
begin
  inherited Create(AOwner);

  Visible := False;
  TriggerPageControl.TabIndex := 0;
  Parent := ParentPanel;
  SetSession(OraSession);
  FSchemaParam := SchemaParam;
end;

procedure TTriggerBrowserFrame.TriggerPageControlChange(Sender: TObject);
begin
  OpenQuery(False);
end;

procedure TTriggerBrowserFrame.SetSession(OraSession: TOraSession);
var
  i: Integer;
begin
  FSession := OraSession;
  for i := 0 to ComponentCount - 1 do
    if Components[i] is TOraQuery then
      TOraQuery(Components[i]).Session := OraSession;
end;

procedure TTriggerBrowserFrame.SourceQueryAfterScroll(DataSet: TDataSet);
begin
  EnableTriggerAction.Enabled := (not DataSet.FieldByName(TRIGGER_STATUS).IsNull) and
    (DataSet.FieldByName(TRIGGER_STATUS).AsString <> STATUS_ENABLED);
  DisableTriggerAction.Enabled := (not DataSet.FieldByName(TRIGGER_STATUS).IsNull) and
    (not EnableTriggerAction.Enabled);
  with DataSet do
  begin
    SourceSynEdit.Lines.Clear;
    SourceSynEdit.Lines.BeginUpdate;
    SourceSynEdit.Lines.Text := 'CREATE OR REPLACE TRIGGER ' + FieldByName('DESCRIPTION').AsWideString +
      FieldByName('TRIGGER_BODY').AsWideString;
    SourceSynEdit.Lines.Text := Trim(SourceSynEdit.Lines.Text);
    SourceSynEdit.Lines.EndUpdate;
  end;
end;

procedure TTriggerBrowserFrame.SQLEditorActionExecute(Sender: TObject);
begin
  MainForm.LoadSQLIntoEditor(Format('%s@%s', [SourceQuery.Session.Schema, SourceQuery.Session.Server]), SourceSynEdit.Text);
end;

procedure TTriggerBrowserFrame.CopyToClipboardActionExecute(Sender: TObject);
begin
  CopyAllToClipboard(SourceSynEdit);
end;

procedure TTriggerBrowserFrame.CustomizeActionExecute(Sender: TObject);
begin
  CustomizePageControlDialog.Open(TriggerPageControl);
end;

procedure TTriggerBrowserFrame.DisableTriggerActionExecute(Sender: TObject);
begin
  AlterTrigger(FSession, FSchemaParam, SourceQuery.FieldByName(TRIGGER_NAME).AsString, False);
  SourceQuery.Refresh;
end;

procedure TTriggerBrowserFrame.EnableTriggerActionExecute(Sender: TObject);
begin
  AlterTrigger(FSession, FSchemaParam, SourceQuery.FieldByName(TRIGGER_NAME).AsString, True);
  SourceQuery.Refresh;
end;

function TTriggerBrowserFrame.GetActivePageQuery: TOraQuery;
begin
  Result := nil;
  if TriggerPageControl.ActivePage = SourceTabSheet then
  begin
    CreationAndModificationTimestampLabel.Caption := '';
    if OptionsContainer.ShowObjectCreationAndModificationTimestamp then
      CreationAndModificationTimestampLabel.Caption := GetCreationAndModificationTimestamp(FSession, FSchemaParam, FObjectName);
    Result := SourceQuery
  end;
end;

procedure TTriggerBrowserFrame.OpenQuery(RefreshQuery: Boolean);
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
    end;

    TriggersDBGrid.Columns[4].Visible := False;
    TriggersDBGrid.Columns[5].Visible := False;
    Application.ProcessMessages;
    SetGridColumnWidths(TriggersDBGrid)
  end;
end;

procedure TTriggerBrowserFrame.RefreshActionExecute(Sender: TObject);
begin
  OpenQuery(True);
end;

procedure TTriggerBrowserFrame.SaveToFileActionExecute(Sender: TObject);
begin
  Lib.SaveSQL(Handle, SourceSynEdit);
end;

procedure TTriggerBrowserFrame.SetHighlighterTableNames(Value: TStrings);
begin
  SynSQLSyn.TableNames.Text := Value.Text;
end;

procedure TTriggerBrowserFrame.SetObjectFrameAlign(Value: TAlign);
begin
  SourceButtonPanel.Align := Value;
end;

procedure TTriggerBrowserFrame.CopyToClipboard;
begin
  SourceSynEdit.CopyToClipboard
end;

end.
