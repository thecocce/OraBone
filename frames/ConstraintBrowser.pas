unit ConstraintBrowser;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Ora, Vcl.Dialogs, Grids, BCDBGrid, ComCtrls, JvExComCtrls, JvComCtrls,
  DB, DBAccess, MemDS, Vcl.ExtCtrls, Vcl.DBCtrls, JvStringHolder, Vcl.Buttons, ActnList, BCPageControl,
  Vcl.ImgList, SynEditHighlighter, SynHighlighterSQL, SynEdit, AppEvnts, Vcl.Menus, Vcl.ToolWin,
  JvToolBar, BCImageList, BCToolBar, PlatformDefaultStyleActnCtrls, ActnPopup, BCPopupMenu,
  DBGridEhGrouping, GridsEh, DBGridEh;

type
  TConstraintBrowserFrame = class(TFrame)
    ConstraintPageControl: TBCPageControl;
    InfoTabSheet: TTabSheet;
    InfoPanel: TPanel;
    ConstraintsDBGrid: TBCDBGrid;
    ActionList: TActionList;
    CustomizeAction: TAction;
    PageControlPopupMenu: TBCPopupMenu;
    CustomizePageControl1: TMenuItem;
    ConstraintBottomPanel: TPanel;
    ConstraintColumnsDBGrid: TBCDBGrid;
    ConstraintSplitter: TSplitter;
    ConstraintColumnsQuery: TOraQuery;
    ConstraintColumnsDataSource: TOraDataSource;
    ConstraintsQuery: TOraQuery;
    ConstraintsDataSource: TOraDataSource;
    ImageList: TBCImageList;
    EnableConstraintAction: TAction;
    DisableConstraintAction: TAction;
    ConstraintButtonPanel: TPanel;
    ConstraintToolBar: TBCToolBar;
    ToolButton11: TToolButton;
    ToolButton12: TToolButton;
    RefreshAction: TAction;
    Bevel2: TBevel;
    RefreshToolbar: TBCToolBar;
    ToolButton46: TToolButton;
    procedure ConstraintPageControlChange(Sender: TObject);
    procedure CustomizeActionExecute(Sender: TObject);
    procedure ConstraintsQueryAfterScroll(DataSet: TDataSet);
    procedure EnableConstraintActionExecute(Sender: TObject);
    procedure DisableConstraintActionExecute(Sender: TObject);
    procedure RefreshActionExecute(Sender: TObject);
  private
    { Private declarations }
    FObjectName: string;
    FSchemaParam: string;
    FOraSession: TOraSession;
    procedure SetSession(OraSession: TOraSession);
    function GetActivePageQuery: TOraQuery;
    procedure SetColumnWidths;
    procedure SetObjectFrameAlign(Value: TAlign);
  public
    { Public declarations }
    constructor Create(AOwner: TComponent; ParentPanel: TPanel;
      OraSession: TOraSession; SchemaParam: string); reintroduce; overload;
    procedure OpenQuery(RefreshQuery: Boolean);
    property ObjectName: string write FObjectName;
    property SchemaParam: string read FSchemaParam write FSchemaParam;
    property ObjectFrameAlign: TAlign write SetObjectFrameAlign;
  end;

implementation

uses
  Common, Main, DataFilter, CustomizePages, Lib;

const
  { ConstraintsQuery columns }
  CONSTRAINT_NAME = 'Constraint Name';
  CONSTRAINT_TYPE = 'Type';
  CONSTRAINT_TABLE_NAME = 'Table Name';
  CONSTRAINT_STATUS = 'Status';
  STATUS_ENABLED = 'Enabled';
  SEARCH_CONDITION = 'Search Condition';

{$R *.dfm}

constructor TConstraintBrowserFrame.Create(AOwner: TComponent; ParentPanel: TPanel;
  OraSession: TOraSession; SchemaParam: string);
begin
  inherited Create(AOwner);

  Visible := False;
  ConstraintPageControl.TabIndex := 0;
  Parent := ParentPanel;
  SetSession(OraSession);
  FSchemaParam := SchemaParam;
end;

procedure TConstraintBrowserFrame.ConstraintPageControlChange(Sender: TObject);
begin
  OpenQuery(False);
end;

procedure TConstraintBrowserFrame.SetSession(OraSession: TOraSession);
var
  i: Integer;
begin
  FOraSession := OraSession;
  for i := 0 to ComponentCount - 1 do
    if Components[i] is TOraQuery then
      TOraQuery(Components[i]).Session := OraSession;
end;

procedure TConstraintBrowserFrame.ConstraintsQueryAfterScroll(DataSet: TDataSet);
begin
  if DataSet.ControlsDisabled then
    Exit;

  EnableConstraintAction.Enabled := DataSet.FieldByName(CONSTRAINT_STATUS).AsString <> STATUS_ENABLED;
  DisableConstraintAction.Enabled := not EnableConstraintAction.Enabled;

  with ConstraintColumnsQuery do
  begin
    Close;
    ParamByName('P_OWNER').AsWideString := FSchemaParam;
    ParamByName('P_CONSTRAINT_NAME').AsWideString := DataSet.FieldByName(CONSTRAINT_NAME).AsWideString;
    ParamByName('P_R_CONSTRAINT_NAME').AsWideString := DataSet.FieldByName('R_CONSTRAINT_NAME').AsWideString;
    Open;
    ConstraintColumnsDBGrid.Columns[0].Visible := DataSet.FieldByName('CONSTRAINT_TYPE').AsWideString <> 'C';
    ConstraintColumnsDBGrid.Columns[2].Visible := DataSet.FieldByName('CONSTRAINT_TYPE').AsWideString = 'R';

    Application.ProcessMessages;
    Lib.SetGridColumnWidths(ConstraintColumnsDBGrid)
  end;
end;

procedure TConstraintBrowserFrame.CustomizeActionExecute(Sender: TObject);
begin
  CustomizePageControlDialog.Open(ConstraintPageControl);
end;

procedure TConstraintBrowserFrame.DisableConstraintActionExecute(Sender: TObject);
begin
  AlterConstraint(FOraSession, ConstraintsQuery.FieldByName(CONSTRAINT_TABLE_NAME).AsString,
    ConstraintsQuery.FieldByName(CONSTRAINT_NAME).AsString, False);
  ConstraintsQuery.Refresh;
end;

procedure TConstraintBrowserFrame.EnableConstraintActionExecute(Sender: TObject);
begin
  AlterConstraint(FOraSession, ConstraintsQuery.FieldByName(CONSTRAINT_TABLE_NAME).AsString,
    ConstraintsQuery.FieldByName(CONSTRAINT_NAME).AsString, True);
  ConstraintsQuery.Refresh;
end;

function TConstraintBrowserFrame.GetActivePageQuery: TOraQuery;
begin
  Result := nil;
  if ConstraintPageControl.ActivePage = InfoTabSheet then
    Result := ConstraintsQuery
end;

procedure TConstraintBrowserFrame.SetColumnWidths;
begin
  ConstraintsDBGrid.Columns[4].Visible := not ConstraintsQuery.FieldByName(SEARCH_CONDITION).IsNull;
  ConstraintsDBGrid.Columns[5].Visible := False;
  ConstraintsDBGrid.Columns[6].Visible := False;
  Application.ProcessMessages;
  SetGridColumnWidths(ConstraintsDBGrid)
end;

procedure TConstraintBrowserFrame.OpenQuery(RefreshQuery: Boolean);
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
      SetColumnWidths;
    end;
  end;
end;

procedure TConstraintBrowserFrame.RefreshActionExecute(Sender: TObject);
begin
  OpenQuery(True);
end;

procedure TConstraintBrowserFrame.SetObjectFrameAlign(Value: TAlign);
begin
  ConstraintButtonPanel.Align := Value;
end;

end.
