unit IndexBrowser;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Ora, Vcl.Dialogs, BCControls.BCDBGrid, ComCtrls, JvExComCtrls, JvComCtrls,
  DB, DBAccess, MemDS, Vcl.ExtCtrls, Vcl.DBCtrls, JvStringHolder, Vcl.Buttons, Vcl.ActnList,
  BCControls.BCPageControl, Vcl.ImgList, SynEditHighlighter, SynHighlighterSQL, SynEdit, Vcl.AppEvnts,
  Vcl.Menus, Vcl.PlatformDefaultStyleActnCtrls, Vcl.ActnPopup, BCControls.BCPopupMenu, Vcl.ToolWin, JvToolBar,
  BCControls.BCToolBar, System.Actions, DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, GridsEh, DBAxisGridsEh,
  DBGridEh;

type
  TIndexBrowserFrame = class(TFrame)
    IndexPageControl: TBCPageControl;
    InfoTabSheet: TTabSheet;
    IndexPanel: TPanel;
    IndexQuery: TOraQuery;
    IndexDataSource: TOraDataSource;
    IndexesDBGrid: TBCDBGrid;
    SQLStringHolder: TJvMultiStringHolder;
    ActionList: TActionList;
    CustomizeAction: TAction;
    PageControlPopupMenu: TBCPopupMenu;
    CustomizePageControl1: TMenuItem;
    ImageList: TImageList;
    InfoButtonPanel: TPanel;
    InfoToolBar: TBCToolBar;
    ToolButton41: TToolButton;
    RefreshAction: TAction;
    procedure IndexPageControlChange(Sender: TObject);
    procedure CustomizeActionExecute(Sender: TObject);
    procedure RefreshActionExecute(Sender: TObject);
  private
    { Private declarations }
    FSession: TOraSession;
    FObjectName: string;
    FSchemaParam: string;
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
  end;

implementation

uses
  Main, DataFilter, CustomizePages, Lib;

{$R *.dfm}

constructor TIndexBrowserFrame.Create(AOwner: TComponent; ParentPanel: TPanel;
  OraSession: TOraSession; SchemaParam: string);
begin
  inherited Create(AOwner);

  Visible := False;
  IndexPageControl.TabIndex := 0;
  Parent := ParentPanel;
  SetSession(OraSession);
  FSchemaParam := SchemaParam;
end;

procedure TIndexBrowserFrame.IndexPageControlChange(Sender: TObject);
begin
  OpenQuery(False);
end;

procedure TIndexBrowserFrame.SetSession(OraSession: TOraSession);
var
  i: Integer;
begin
  FSession := OraSession;
  for i := 0 to ComponentCount - 1 do
    if Components[i] is TOraQuery then
      TOraQuery(Components[i]).Session := OraSession;
end;

procedure TIndexBrowserFrame.CustomizeActionExecute(Sender: TObject);
begin
  CustomizePageControlDialog.Open(IndexPageControl);
end;

function TIndexBrowserFrame.GetActivePageQuery: TOraQuery;
var
  s: string;
  OraQuery: TOraQuery;
begin
  Result := nil;
  if IndexPageControl.ActivePage = InfoTabSheet then
  begin
    s := SQLStringHolder.StringsByName['IndexesDescendSQL'].Text;
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
    IndexQuery.SQL.Clear;
    IndexQuery.SQL.Add(s);
    Result := IndexQuery
  end
end;

procedure TIndexBrowserFrame.OpenQuery(RefreshQuery: Boolean);
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
      Lib.SetGridColumnWidths(IndexesDBGrid)
    end;
  end;
end;

procedure TIndexBrowserFrame.RefreshActionExecute(Sender: TObject);
begin
  OpenQuery(True);
end;

procedure TIndexBrowserFrame.SetObjectFrameAlign(Value: TAlign);
begin
  InfoButtonPanel.Align := Value;
end;

end.
