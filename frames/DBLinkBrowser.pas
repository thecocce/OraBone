unit DBLinkBrowser;

interface

uses
  System.SysUtils, System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Ora, Vcl.Dialogs, BCControls.DBGrid, ComCtrls,
  JvExComCtrls, JvComCtrls, DB, DBAccess, MemDS, Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.Buttons, Vcl.ActnList,
  BCControls.PageControl, Vcl.ImgList, SynEditHighlighter, SynHighlighterSQL, SynEdit, Vcl.AppEvnts, Vcl.ToolWin,
  Vcl.Menus, BCControls.ToolBar, PlatformDefaultStyleActnCtrls, Vcl.ActnPopup, System.Actions,
  GridsEh, DBAxisGridsEh, DBGridEh, Vcl.StdCtrls, DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, BCCommon.Images,
  DynVarsEh;

type
  TDBLinkBrowserFrame = class(TFrame)
    DBLinkPageControl: TBCPageControl;
    ActionList: TActionList;
    SourceTabSheet: TTabSheet;
    DBLinkQuery: TOraQuery;
    SQLEditorAction: TAction;
    DBLinkDataSource: TOraDataSource;
    SynSQLSyn: TSynSQLSyn;
    InfoTabSheet: TTabSheet;
    DBLinkPanel: TPanel;
    DBLinkDBGrid: TBCDBGrid;
    SourcePanel: TPanel;
    SourceSynEdit: TSynEdit;
    CustomizeAction: TAction;
    PageControlPopupActionBar: TPopupActionBar;
    CustomizePageControl1: TMenuItem;
    CopyToClipboardAction: TAction;
    SaveToFileAction: TAction;
    RefreshAction: TAction;
    InfoButtonPanel: TPanel;
    InfoToolBar: TBCToolBar;
    ToolButton41: TToolButton;
    SourceButtonPanel: TPanel;
    SourceToolBar: TBCToolBar;
    SQLEditorToolButton: TToolButton;
    CopyToolButton: TToolButton;
    SaveToolButton: TToolButton;
    Bevel2: TBevel;
    RefreshToolbar: TBCToolBar;
    ToolButton46: TToolButton;
    CreationAndModificationTimestampLabel: TLabel;
    procedure DBLinkPageControlChange(Sender: TObject);
    procedure SQLEditorActionExecute(Sender: TObject);
    procedure DBLinkQueryAfterOpen(DataSet: TDataSet);
    procedure CustomizeActionExecute(Sender: TObject);
    procedure CopyToClipboardActionExecute(Sender: TObject);
    procedure SaveToFileActionExecute(Sender: TObject);
    procedure RefreshActionExecute(Sender: TObject);
  private
    { Private declarations }
    FObjectName: string;
    FSchemaParam: string;
    FSession: TOraSession;
    procedure SetSession(OraSession: TOraSession);
    function GetActivePageQuery: TOraQuery;
    procedure SetObjectFrameAlign(Value: TAlign);
  public
    { Public declarations }
    constructor Create(AOwner: TComponent; ParentPanel: TPanel;
      OraSession: TOraSession; SchemaParam: string); reintroduce; overload;
    procedure OpenQuery(RefreshQuery: Boolean);
    property ObjectName: string write FObjectName;
    property SchemaParam: string read FSchemaParam write FSchemaParam;
    property ObjectFrameAlign: TAlign write SetObjectFrameAlign;
    procedure CopyToClipboard;
  end;

implementation

uses
  Main, CustomizePages, Lib, BCCommon.Lib, BCCommon.OptionsContainer;

const
  LINK_NAME = 'Link Name';
  USERNAME = 'User Name';
  HOST = 'Host';

{$R *.dfm}

constructor TDBLinkBrowserFrame.Create(AOwner: TComponent; ParentPanel: TPanel;
  OraSession: TOraSession; SchemaParam: string);
begin
  inherited Create(AOwner);

  Visible := False;
  DBLinkPageControl.TabIndex := 0;
  Parent := ParentPanel;
  SetSession(OraSession);
  FSchemaParam := SchemaParam;
end;

procedure TDBLinkBrowserFrame.CopyToClipboardActionExecute(Sender: TObject);
begin
  Lib.CopyAllToClipboard(SourceSynEdit);
end;

procedure TDBLinkBrowserFrame.CustomizeActionExecute(Sender: TObject);
begin
  CustomizePageControlDialog.Open(DBLinkPageControl);
end;

procedure TDBLinkBrowserFrame.DBLinkPageControlChange(Sender: TObject);
begin
  OpenQuery(False);
end;

procedure TDBLinkBrowserFrame.SaveToFileActionExecute(Sender: TObject);
begin
  Lib.SaveSQL(Handle, SourceSynEdit);
end;

procedure TDBLinkBrowserFrame.SetSession(OraSession: TOraSession);
var
  i: Integer;
begin
  FSession := OraSession;
  for i := 0 to ComponentCount - 1 do
    if Components[i] is TOraQuery then
      TOraQuery(Components[i]).Session := OraSession;
end;

procedure TDBLinkBrowserFrame.DBLinkQueryAfterOpen(DataSet: TDataSet);
begin
  with DataSet do
  begin
    SourceSynEdit.Lines.Clear;
    SourceSynEdit.Lines.BeginUpdate;
    SourceSynEdit.Lines.Text := 'CREATE DATABASE LINK ' + FSchemaParam + '.' + DataSet.FieldByName(LINK_NAME).AsWideString + CHR_ENTER;
    SourceSynEdit.Lines.Text := SourceSynEdit.Lines.Text + '  CONNECT TO ' + DataSet.FieldByName(USERNAME).AsWideString + CHR_ENTER;
    SourceSynEdit.Lines.Text := SourceSynEdit.Lines.Text + '  IDENTIFIED BY "<password>"' + CHR_ENTER;
    SourceSynEdit.Lines.Text := SourceSynEdit.Lines.Text + '  USING ''' + DataSet.FieldByName(HOST).AsWideString + ''';';
    SourceSynEdit.Lines.Text := Trim(SourceSynEdit.Lines.Text);
    SourceSynEdit.Lines.EndUpdate;
  end;
end;

procedure TDBLinkBrowserFrame.SQLEditorActionExecute(Sender: TObject);
begin
  MainForm.LoadSQLIntoEditor(Format('%s@%s', [DBLinkQuery.Session.Schema, DBLinkQuery.Session.Server]), SourceSynEdit.Text);
end;

function TDBLinkBrowserFrame.GetActivePageQuery: TOraQuery;
begin
  Result := nil;
  if DBLinkPageControl.ActivePage = InfoTabSheet then
  begin
    CreationAndModificationTimestampLabel.Caption := '';
    if OptionsContainer.ShowObjectCreationAndModificationTimestamp then
      CreationAndModificationTimestampLabel.Caption := GetCreationAndModificationTimestamp(FSession, FSchemaParam, FObjectName);
    Result := DBLinkQuery
  end
  else
  if DBLinkPageControl.ActivePage = SourceTabSheet then
    Result := DBLinkQuery
end;

procedure TDBLinkBrowserFrame.OpenQuery(RefreshQuery: Boolean);
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
      Application.ProcessMessages;
      SetGridColumnWidths(DBLinkDBGrid)
    end;
  end;
end;

procedure TDBLinkBrowserFrame.RefreshActionExecute(Sender: TObject);
begin
  OpenQuery(True);
end;

procedure TDBLinkBrowserFrame.SetObjectFrameAlign(Value: TAlign);
begin
  InfoButtonPanel.Align := Value;
  SourceButtonPanel.Align := Value;
end;

procedure TDBLinkBrowserFrame.CopyToClipboard;
begin
  SourceSynEdit.CopyToClipboard
end;

end.
