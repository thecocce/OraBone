unit AlterView;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, CreateObjectDialog, Vcl.ImgList, SynEditHighlighter,
  SynHighlighterSQL, Vcl.ActnList, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.ToolWin, JvExComCtrls, JvToolBar,
  SynEdit, JvComCtrls, BCPageControl, JvEdit, BCEdit, DBAccess, Ora, MemDS, Vcl.Buttons,
  JvExButtons, JvBitBtn, BCDBEdit, BCToolBar, DBGridEhGrouping, GridsEh, DBGridEh, BCDBGrid,
  JvExStdCtrls, Vcl.ExtCtrls, Data.DB;

type
  TAlterViewDialog = class(TCreateObjectBaseDialog)
    ViewNameLabel: TLabel;
    ViewNameEdit: TBCEdit;
    CommnetLabel: TLabel;
    CommentEdit: TBCEdit;
    ColumnsTabSheet: TTabSheet;
    ColumnCommentsTabSheet: TTabSheet;
    SelectStatementTabSheet: TTabSheet;
    ColumnsQuery: TOraQuery;
    ColumnsDataSource: TOraDataSource;
    MoveUpAction: TAction;
    MoveDownAction: TAction;
    AddColumnAction: TAction;
    DeleteColumnAction: TAction;
    ColumnsPanel: TPanel;
    ColumnButtonPanel: TPanel;
    UpBitBtn: TJvBitBtn;
    DownBitBtn: TJvBitBtn;
    InsertBitBtn: TJvBitBtn;
    DeleteBitBtn: TJvBitBtn;
    ColumnCommentsPanel: TPanel;
    SQLPanel: TPanel;
    SQLSynEdit: TSynEdit;
    OriginalColumnsQuery: TOraQuery;
    Bevel1: TBevel;
    ResetBitBtn: TJvBitBtn;
    ResetColumnsAction: TAction;
    ColumnCommentsDBGrid: TBCDBGrid;
    ColumnsDBGrid: TBCDBGrid;
    procedure FormDestroy(Sender: TObject);
    procedure AddColumnActionExecute(Sender: TObject);
    procedure DeleteColumnActionExecute(Sender: TObject);
    procedure MoveDownActionExecute(Sender: TObject);
    procedure MoveUpActionExecute(Sender: TObject);
    procedure ResetColumnsActionExecute(Sender: TObject);
    procedure PageControlChange(Sender: TObject);
    procedure ColumnCommentsDBGridGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont;
      var Background: TColor; State: TGridDrawState);
    procedure ColumnsDBGridGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont;
      var Background: TColor; State: TGridDrawState);
  private
    { Private declarations }
    FOriginalViewComment: string;
    FMaterialized: Boolean;
    procedure GetViewData;
  protected
    procedure CreateSQL; override;
    function CheckFields: Boolean; override;
    procedure Initialize; override;
  public
    { Public declarations }
  end;

function AlterViewDialog: TAlterViewDialog;

implementation

{$R *.dfm}

uses
  Common, DataModule, Lib, Vcl.Themes, Winapi.UxTheme, StyleHooks;

var
  FAlterViewDialog: TAlterViewDialog;

function AlterViewDialog: TAlterViewDialog;
begin
  if FAlterViewDialog = nil then
    Application.CreateForm(TAlterViewDialog, FAlterViewDialog);
  Result := FAlterViewDialog;
  Common.SetStyledFormSize(Result, 459, 460);
end;

procedure TAlterViewDialog.FormDestroy(Sender: TObject);
begin
  inherited;
  FAlterViewDialog := nil;
end;

procedure TAlterViewDialog.MoveDownActionExecute(Sender: TObject);
begin
  inherited;
  Lib.MoveGridRowDown(ColumnsQuery);
end;

procedure TAlterViewDialog.MoveUpActionExecute(Sender: TObject);
begin
  inherited;
  Lib.MoveGridRowUp(ColumnsQuery);
end;

procedure TAlterViewDialog.PageControlChange(Sender: TObject);
begin
  inherited;
  if FOriginalViewComment = CommentEdit.Text then
    CommentEdit.Font.Color := clWindowText
  else
    CommentEdit.Font.Color := clRed;
end;

procedure TAlterViewDialog.ResetColumnsActionExecute(Sender: TObject);
begin
  inherited;
  GetViewData;
end;

procedure TAlterViewDialog.AddColumnActionExecute(Sender: TObject);
begin
  inherited;
  ColumnsQuery.Append;
end;

procedure TAlterViewDialog.DeleteColumnActionExecute(Sender: TObject);
begin
  inherited;
  ColumnsQuery.Delete;
end;

procedure TAlterViewDialog.ColumnCommentsDBGridGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont;
  var Background: TColor; State: TGridDrawState);
var
  LStyles: TCustomStyleServices;
  LDetails: TThemedElementDetails;
  LColor: TColor;
begin
  LStyles := StyleServices;
  OriginalColumnsQuery.Locate('COLUMN_ID', ColumnsQuery.FieldByName('COLUMN_ID').AsInteger, []);
  if (Column.FieldName = 'COLUMN_COMMENT') then
  begin
    if ColumnsQuery.FieldByName(Column.FieldName).AsString = OriginalColumnsQuery.FieldByName(Column.FieldName).AsString then
    begin
      if UseThemes then
      begin
        LDetails := LStyles.GetElementDetails(tgCellNormal);
        if not LStyles.GetElementColor(LDetails, ecTextColor, LColor) or (LColor = clNone) then
          LColor := LStyles.GetSystemColor(clWindowText);
        AFont.Color := LColor;
        if not LStyles.GetElementColor(LDetails, ecFillColor, LColor) or (LColor = clNone) then
          LColor := LStyles.GetSystemColor(clWindow);
        Background := LColor;
      end
      else
      begin
        AFont.Color := ColumnCommentsDBGrid.Font.Color;
        Background := ColumnCommentsDBGrid.Color;
      end;
    end
    else
    begin
      AFont.Color := clWhite;
      Background := clRed;
    end;
  end;
  if Column.FieldName = 'COLUMN_NAME' then
  begin
    if UseThemes then
      Background := LStyles.GetSystemColor(clBtnFace)
    else
      Background := clBtnFace;
  end;
end;

function TAlterViewDialog.CheckFields: Boolean;
begin
  Result := False;
  if ColumnsQuery.RecordCount = 0 then
  begin
    Common.ShowErrorMessage('Set columns.');
    Exit;
  end;
  Result := True;
end;

procedure TAlterViewDialog.ColumnsDBGridGetCellParams(Sender: TObject; Column: TColumnEh;
  AFont: TFont; var Background: TColor; State: TGridDrawState);
var
  LStyles: TCustomStyleServices;
  LDetails: TThemedElementDetails;
  LColor: TColor;
begin
  LStyles := StyleServices;
  OriginalColumnsQuery.Locate('COLUMN_ID', ColumnsQuery.FieldByName('COLUMN_ID').AsInteger, []);

  if ColumnsQuery.FieldByName(Column.FieldName).IsNull or
    (ColumnsQuery.FieldByName(Column.FieldName).AsString = OriginalColumnsQuery.FieldByName(Column.FieldName).AsString) then
  begin
    if UseThemes then
    begin
      LDetails := LStyles.GetElementDetails(tgCellNormal);
      if not LStyles.GetElementColor(LDetails, ecTextColor, LColor) or (LColor = clNone) then
        LColor := LStyles.GetSystemColor(clWindowText);
      AFont.Color := LColor;
      if not LStyles.GetElementColor(LDetails, ecFillColor, LColor) or (LColor = clNone) then
        LColor := LStyles.GetSystemColor(clWindow);
      Background := LColor;
    end
    else
    begin
      AFont.Color := ColumnsDBGrid.Font.Color;
      Background := ColumnsDBGrid.Color;
    end;
  end
  else
  begin
    AFont.Color := clWhite;
    Background := clRed;
  end;
end;

procedure TAlterViewDialog.GetViewData;
var
  OraQuery: TOraQuery;
begin
  with ColumnsQuery do
  begin
    Session := FOraSession;
    Close;
    Open;
  end;
  with OriginalColumnsQuery do
  begin
    Session := FOraSession;
    Close;
    Open;
  end;
  ViewNameEdit.Text := FObjectName;
  FOriginalViewComment := Lib.GetTableOrViewComment(FOraSession, FSchemaParam, FObjectName);
  CommentEdit.Text := FOriginalViewComment;
  { columns }
  OraQuery := TOraQuery.Create(nil);
  OraQuery.Session := FOraSession;
  OraQuery.SQL.Add(DM.StringHolder.StringsByName['ViewColumnsSQL'].Text);
  with OraQuery do
  try
    ParamByName('P_VIEW_NAME').AsWideString := FObjectName;
    ParamByName('P_OWNER').AsWideString := FSchemaParam;
    Prepare;
    Open;
    while not Eof do
    begin
      ColumnsQuery.Append;
      ColumnsQuery.FieldByName('COLUMN_ID').AsString := FieldByName('COLUMN_ID').AsString;
      ColumnsQuery.FieldByName('COLUMN_NAME').AsString := FieldByName('COLUMN_NAME').AsString;
      ColumnsQuery.FieldByName('COLUMN_COMMENT').AsString := FieldByName('COMMENTS').AsString;
      OriginalColumnsQuery.Append;
      OriginalColumnsQuery.FieldByName('COLUMN_ID').AsString := FieldByName('COLUMN_ID').AsString;
      OriginalColumnsQuery.FieldByName('COLUMN_NAME').AsString := FieldByName('COLUMN_NAME').AsString;
      OriginalColumnsQuery.FieldByName('COLUMN_COMMENT').AsString := FieldByName('COMMENTS').AsString;
      Next;
    end;
  finally
    Close;
    UnPrepare;
    FreeAndNil(OraQuery);
  end;
  { select statements }
  OraQuery := TOraQuery.Create(nil);
  OraQuery.Session := FOraSession;
  OraQuery.SQL.Add(DM.StringHolder.StringsByName['ViewTextSQL'].Text);
  with OraQuery do
  try
    ParamByName('P_VIEW_NAME').AsWideString := FObjectName;
    ParamByName('P_OWNER').AsWideString := FSchemaParam;
    Prepare;
    Open;
    SQLSynEdit.Text := FieldByName('TEXT').AsWideString;
    FMaterialized := FieldByName('TYPE').AsString = 'M';
  finally
    Close;
    UnPrepare;
    FreeAndNil(OraQuery);
  end;
end;

procedure TAlterViewDialog.Initialize;
begin
  inherited;
  UpdateGutter(SQLSynEdit);
  GetViewData;
end;

procedure TAlterViewDialog.CreateSQL;
var
  i: Integer;
  Columns: string;
  ColumnComments: WideString;
  Materialized: string;
begin
  SourceSynEdit.Lines.Clear;
  SourceSynEdit.Lines.BeginUpdate;
  i := 1;
  Columns := '(';
  with ColumnsQuery do
  begin
    First;
    while not Eof do
    begin
      Columns := Columns + FieldByName('COLUMN_NAME').AsString;
      if not FieldByName('COLUMN_COMMENT').IsNull then
        ColumnComments := ColumnComments + Format('COMMENT ON COLUMN %s.%s.%s IS %s;', [FSchemaParam,
          ViewNameEdit.Text, Trim(FieldByName('COLUMN_NAME').AsWideString), QuotedStr(FieldByName('COLUMN_COMMENT').AsWideString)]) + CHR_ENTER;
      Next;
      if not Eof then
        Columns := Columns + ', ';
      if i mod 5 = 0 then
      begin
        i := 1;
        Columns := Columns + CHR_ENTER + ' ';
      end;
      Inc(i);
    end;
    First;
  end;
  Columns := Columns + ') AS';
  SourceSynEdit.Lines.Clear;
  SourceSynEdit.Lines.BeginUpdate;
  Materialized := '';
  if FMaterialized then
    Materialized := ' MATERIALIZED';
  SourceSynEdit.Lines.Text := Format('CREATE OR REPLACE%s VIEW %s.%s', [Materialized, FSchemaParam, ViewNameEdit.Text]) + CHR_ENTER +
    Columns + CHR_ENTER + SQLSynEdit.Text + ';' + CHR_ENTER;
  Application.ProcessMessages;
  { comments }
  if (CommentEdit.Text <> '') or (ColumnComments <> '') then
    SourceSynEdit.Lines.Text := SourceSynEdit.Lines.Text + CHR_ENTER;
  if CommentEdit.Text <> '' then
    SourceSynEdit.Lines.Text := SourceSynEdit.Lines.Text + Format('COMMENT ON VIEW %s.%s IS %s;', [
      FSchemaParam, ViewNameEdit.Text, QuotedStr(CommentEdit.Text)]) + CHR_ENTER;
  SourceSynEdit.Lines.Text := SourceSynEdit.Lines.Text + ColumnComments + CHR_ENTER;
  Application.ProcessMessages;
  SourceSynEdit.Lines.Text := Trim(SourceSynEdit.Lines.Text);
  SourceSynEdit.Lines.EndUpdate;
end;

end.
