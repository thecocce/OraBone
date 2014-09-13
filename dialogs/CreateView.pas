unit CreateView;

interface

uses
  System.SysUtils, System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, CreateObjectDialog, Vcl.Buttons,
  DB, MemDS, DBAccess, Ora, Vcl.StdCtrls, BCControls.Edit, Vcl.ImgList, BCDialogs.Dlg, SynEditHighlighter,
  SynHighlighterSQL, ActnList, ComCtrls, ToolWin, JvExComCtrls, SynEdit, Vcl.ExtCtrls, JvComCtrls,
  BCControls.PageControl, BCControls.ToolBar, BCControls.DBGrid, System.Actions, GridsEh, DBAxisGridsEh, DBGridEh,
  BCControls.ImageList, DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh;

type
  TCreateViewDialog = class(TCreateObjectBaseDialog)
    AddColumnAction: TAction;
    ColumnButtonPanel: TPanel;
    ColumnCommentsDBGrid: TBCDBGrid;
    ColumnCommentsPanel: TPanel;
    ColumnCommentsTabSheet: TTabSheet;
    ColumnsDataSource: TOraDataSource;
    ColumnsDBGrid: TBCDBGrid;
    ColumnsPanel: TPanel;
    ColumnsQuery: TOraQuery;
    ColumnsTabSheet: TTabSheet;
    CommentEdit: TBCEdit;
    CommnetLabel: TLabel;
    DeleteColumnAction: TAction;
    MoveDownAction: TAction;
    MoveUpAction: TAction;
    SelectStatementTabSheet: TTabSheet;
    SQLPanel: TPanel;
    SQLSynEdit: TSynEdit;
    ViewNameEdit: TBCEdit;
    ViewNameLabel: TLabel;
    ColumnsToolBar: TBCToolBar;
    MoveUpToolButton: TToolButton;
    MoveDownToolButton: TToolButton;
    AddColumnToolButton: TToolButton;
    DeleteColumnToolButton: TToolButton;
    procedure AddColumnActionExecute(Sender: TObject);
    procedure ColumnCommentsDBGridGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure DeleteColumnActionExecute(Sender: TObject);
    procedure Formshow(Sender: TObject);
    procedure MoveDownActionExecute(Sender: TObject);
    procedure MoveUpActionExecute(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  protected
    function CheckFields: Boolean; override;
    procedure CreateSQL; override;
    procedure Initialize; override;
  end;

function CreateViewDialog: TCreateViewDialog;

implementation

{$R *.dfm}

uses
  Lib, Vcl.Themes, Winapi.UxTheme, BCCommon.StyleUtils, BCCommon.Messages, BCCommon.Lib;

var
  FCreateViewDialog: TCreateViewDialog;

function CreateViewDialog: TCreateViewDialog;
begin
  if not Assigned(FCreateViewDialog) then
    Application.CreateForm(TCreateViewDialog, FCreateViewDialog);
  Result := FCreateViewDialog;
  SetStyledFormSize(TDialog(Result));
end;

procedure TCreateViewDialog.FormDestroy(Sender: TObject);
begin
  inherited;
  FCreateViewDialog := nil;
end;

procedure TCreateViewDialog.Formshow(Sender: TObject);
begin
  inherited;
  ViewNameEdit.SetFocus;
end;

procedure TCreateViewDialog.AddColumnActionExecute(Sender: TObject);
begin
  inherited;
  ColumnsQuery.Append;
end;

procedure TCreateViewDialog.DeleteColumnActionExecute(Sender: TObject);
begin
  inherited;
  ColumnsQuery.Delete;
end;

procedure TCreateViewDialog.MoveDownActionExecute(Sender: TObject);
begin
  inherited;
  Lib.MoveGridRowDown(ColumnsQuery);
end;

procedure TCreateViewDialog.MoveUpActionExecute(Sender: TObject);
begin
  inherited;
  Lib.MoveGridRowUp(ColumnsQuery);
end;

function TCreateViewDialog.CheckFields: Boolean;
begin
  Result := False;
  if Trim(ViewNameEdit.Text) = '' then
  begin
    ShowErrorMessage('Set table name.');
    ViewNameEdit.SetFocus;
    Exit;
  end;
  if ColumnsQuery.RecordCount = 0 then
  begin
    ShowErrorMessage('Set columns.');
    Exit;
  end;
  Result := True;
end;

procedure TCreateViewDialog.ColumnCommentsDBGridGetCellParams(Sender: TObject; Column: TColumnEh;
  AFont: TFont; var Background: TColor; State: TGridDrawState);
var
  LStyles: TCustomStyleServices;
begin
  LStyles := StyleServices;

  if Column.FieldName = 'COLUMN_NAME' then
  begin
    if UseThemes then
      Background := LStyles.GetSystemColor(clBtnFace)
    else
      Background := clBtnFace;
  end;
end;

procedure TCreateViewDialog.Initialize;
begin
  inherited;
  with ColumnsQuery do
  begin
    Session := FOraSession;
    Close;
    Open;
  end;
end;

procedure TCreateViewDialog.CreateSQL;
var
  i: Integer;
  Columns: string;
  ColumnComments: WideString;
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
  SourceSynEdit.Lines.Text := Format('CREATE OR REPLACE VIEW %s.%s', [FSchemaParam, ViewNameEdit.Text]) + CHR_ENTER +
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
