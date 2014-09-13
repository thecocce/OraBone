unit CreateTable;

interface

uses
  System.SysUtils, System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, CreateObjectDialog, DB, MemDS,
  DBAccess, Ora, Vcl.Buttons, Vcl.StdCtrls, Vcl.DBCtrls, BCControls.Edit, BCDialogs.Dlg, Vcl.ImgList,
  SynEditHighlighter, SynHighlighterSQL, ActnList, ComCtrls, ToolWin, JvExComCtrls, SynEdit, Vcl.ExtCtrls, JvComCtrls,
  BCControls.PageControl, BCControls.ToolBar, BCControls.DBGrid, System.Actions, GridsEh, DBAxisGridsEh, DBGridEh,
  BCControls.ImageList, DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh;

type
  TCreateTableDialog = class(TCreateObjectBaseDialog)
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
    CommentLabel: TLabel;
    DeleteColumnAction: TAction;
    MoveDownAction: TAction;
    MoveUpAction: TAction;
    TableNameEdit: TBCEdit;
    TableNameLabel: TLabel;
    ColumnsToolBar: TBCToolBar;
    MoveUpToolButton: TToolButton;
    MoveDownToolButton: TToolButton;
    AddColumnToolButton: TToolButton;
    DeleteColumnToolButton: TToolButton;
    procedure AddColumnActionExecute(Sender: TObject);
    procedure ColumnCommentsDBGridGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure ColumnsDBGridGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure ColumnsQueryAfterScroll(DataSet: TDataSet);
    procedure ColumnsQueryNewRecord(DataSet: TDataSet);
    procedure DeleteColumnActionExecute(Sender: TObject);
    procedure Formshow(Sender: TObject);
    procedure MoveDownActionExecute(Sender: TObject);
    procedure MoveUpActionExecute(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    FRecordCount: Integer;
    procedure SetButtonActions;
  protected
    function CheckFields: Boolean; override;
    procedure CreateSQL; override;
    procedure Initialize; override;
  end;

function CreateTableDialog: TCreateTableDialog;

implementation

{$R *.dfm}

uses
  Lib, Vcl.Themes, Winapi.UxTheme, BCCommon.StyleUtils, BCCommon.Messages, BCCommon.Lib;

var
  FCreateTableDialog: TCreateTableDialog;

function CreateTableDialog: TCreateTableDialog;
begin
  if not Assigned(FCreateTableDialog) then
    Application.CreateForm(TCreateTableDialog, FCreateTableDialog);
  Result := FCreateTableDialog;
  SetStyledFormSize(TDialog(Result));
end;

procedure TCreateTableDialog.AddColumnActionExecute(Sender: TObject);
begin
  inherited;
  ColumnsQuery.Append;
  SetButtonActions;
end;

procedure TCreateTableDialog.ColumnCommentsDBGridGetCellParams(Sender: TObject; Column: TColumnEh;
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

procedure TCreateTableDialog.ColumnsDBGridGetCellParams(Sender: TObject; Column: TColumnEh;
  AFont: TFont; var Background: TColor; State: TGridDrawState);
var
  LStyles: TCustomStyleServices;
begin
  LStyles := StyleServices;

  if Column.FieldName = 'COLUMN_SIZE' then
  begin
    if not (
      (ColumnsQuery.FieldByName('DATA_TYPE').AsString = 'VARCHAR2') or
      (ColumnsQuery.FieldByName('DATA_TYPE').AsString = 'NCHAR') or
      (ColumnsQuery.FieldByName('DATA_TYPE').AsString = 'NVARCHAR2') or
      (ColumnsQuery.FieldByName('DATA_TYPE').AsString = 'RAW')) then
    begin
      if UseThemes then
        Background := LStyles.GetSystemColor(clBtnFace)
      else
        Background := clBtnFace;
    end;
  end;
  if (Column.FieldName = 'COLUMN_PRECISION') or (Column.FieldName = 'SCALE') then
    if ColumnsQuery.FieldByName('DATA_TYPE').AsString <> 'NUMBER'  then
    begin
      if UseThemes then
        Background := LStyles.GetSystemColor(clBtnFace)
      else
        Background := clBtnFace;
    end;
end;

procedure TCreateTableDialog.ColumnsQueryAfterScroll(DataSet: TDataSet);
begin
  inherited;
  SetButtonActions
end;

procedure TCreateTableDialog.ColumnsQueryNewRecord(DataSet: TDataSet);
begin
  inherited;
  Inc(FRecordCount);
  DataSet.FieldByName('PRIMARY_KEY').AsString := 'False';
  DataSet.FieldByName('NULLABLE').AsString := 'False';
end;

procedure TCreateTableDialog.DeleteColumnActionExecute(Sender: TObject);
begin
  inherited;
  Dec(FRecordCount);
  ColumnsQuery.Delete;
  SetButtonActions;
end;

procedure TCreateTableDialog.FormDestroy(Sender: TObject);
begin
  inherited;
  FCreateTableDialog := nil;
end;

procedure TCreateTableDialog.Formshow(Sender: TObject);
begin
  inherited;
  TableNameEdit.SetFocus;
end;

procedure TCreateTableDialog.MoveDownActionExecute(Sender: TObject);
begin
  inherited;
  Lib.MoveGridRowDown(ColumnsQuery);
  SetButtonActions;
end;

procedure TCreateTableDialog.MoveUpActionExecute(Sender: TObject);
begin
  inherited;
  Lib.MoveGridRowUp(ColumnsQuery);
  SetButtonActions;
end;

function TCreateTableDialog.CheckFields: Boolean;
begin
  Result := False;
  if Trim(TableNameEdit.Text) = '' then
  begin
    ShowErrorMessage('Set table name.');
    TableNameEdit.SetFocus;
    Exit;
  end;
  if ColumnsQuery.RecordCount = 0 then
  begin
    ShowErrorMessage('Set columns.');
    Exit;
  end;
  Result := True;
end;

procedure TCreateTableDialog.Initialize;
begin
  inherited;
  with ColumnsQuery do
  begin
    Session := FOraSession;
    Close;
    Open;
  end;
  FRecordCount := 0;
end;

procedure TCreateTableDialog.SetButtonActions;
begin
  MoveUpAction.Enabled := (not ColumnsQuery.Bof) and (FRecordCount > 1);
  MoveDownAction.Enabled := (not ColumnsQuery.Eof) and (FRecordCount > 1);
  DeleteColumnAction.Enabled := FRecordCount <> 0;
end;

procedure TCreateTableDialog.CreateSQL;
var
  MaxColumnLength, MaxDataTypeLength: Integer;
  DataType, PrimaryKeyColumns: string;
  ColumnComments: WideString;

  function GetDataTypeString(DataType: string; Precision: string; Scale: string; Size: string): string;
  begin
    Result := DataType;
    if (DataType = 'VARCHAR2') or (DataType = 'NCHAR') or (DataType = 'NVARCHAR2') or
      (DataType = 'RAW') then
      Result := Result + Format('(%s)', [Size])
    else
    if DataType = 'NUMBER' then
    begin
      if Precision <> '' then
      begin
        Result := Result + Format('(%s', [Precision]);
        if Scale <> '' then
          Result := Result + Format(', %s', [Scale]);
        Result := Result + ')';
      end;
    end
  end;
begin
  SourceSynEdit.Lines.Clear;
  SourceSynEdit.Lines.BeginUpdate;
  { create table }
  with ColumnsQuery do
  begin
    DisableControls;
    First;
    SourceSynEdit.Lines.Text := Format('CREATE TABLE %s.%s', [FSchemaParam, TableNameEdit.Text]) + CHR_ENTER;
    SourceSynEdit.Lines.Text := SourceSynEdit.Lines.Text + '(' + CHR_ENTER;
    MaxColumnLength := 0;
    MaxDataTypeLength := 0;
    PrimaryKeyColumns := '';
    while not Eof do
    begin
      DataType := GetDataTypeString(FieldByName('DATA_TYPE').AsWideString,
        FieldByName('COLUMN_PRECISION').AsString, FieldByName('SCALE').AsString,
        FieldByName('COLUMN_SIZE').AsString);

      if UpperCase(FieldByName('PRIMARY_KEY').AsWideString) = 'TRUE' then
      begin
        if PrimaryKeyColumns <> '' then
          PrimaryKeyColumns := PrimaryKeyColumns + ', ';
        PrimaryKeyColumns := PrimaryKeyColumns + FieldByName('COLUMN_NAME').AsWideString;
      end;
      if Length(Trim(FieldByName('COLUMN_NAME').AsWideString)) > MaxColumnLength then
        MaxColumnLength := Length(Trim(FieldByName('COLUMN_NAME').AsWideString));
      if Length(Trim(DataType)) > MaxDataTypeLength then
        MaxDataTypeLength := Length(Trim(DataType));
      Next;
    end;
    First;
    while not Eof do
    begin
      DataType := GetDataTypeString(FieldByName('DATA_TYPE').AsWideString,
        FieldByName('COLUMN_PRECISION').AsString, FieldByName('SCALE').AsString,
        FieldByName('COLUMN_SIZE').AsString);

      SourceSynEdit.Lines.Text := SourceSynEdit.Lines.Text + '  ' + TrimToMaxLength(FieldByName('COLUMN_NAME').AsWideString, MaxColumnLength);
      if (UpperCase(FieldByName('NULLABLE').AsWideString) = 'TRUE') or (not FieldByName('COLUMN_DEFAULT').IsNull) then
        SourceSynEdit.Lines.Text := SourceSynEdit.Lines.Text + TrimToMaxLength(DataType, MaxDataTypeLength)
      else
        SourceSynEdit.Lines.Text := SourceSynEdit.Lines.Text + Trim(DataType);
      if UpperCase(FieldByName('NULLABLE').AsWideString) = 'TRUE' then
        SourceSynEdit.Lines.Text := SourceSynEdit.Lines.Text + 'NOT NULL';
      if not FieldByName('COLUMN_DEFAULT').IsNull then
      begin
        if UpperCase(FieldByName('NULLABLE').AsWideString) = 'TRUE' then
           SourceSynEdit.Lines.Text := SourceSynEdit.Lines.Text + ' ';
        SourceSynEdit.Lines.Text := SourceSynEdit.Lines.Text + 'DEFAULT ' +  FieldByName('COLUMN_DEFAULT').AsString;
      end;

      if not FieldByName('COLUMN_COMMENT').IsNull then
        ColumnComments := ColumnComments + Format('COMMENT ON COLUMN %s.%s.%s IS %s;', [FSchemaParam,
          TableNameEdit.Text, Trim(FieldByName('COLUMN_NAME').AsWideString), QuotedStr(FieldByName('COLUMN_COMMENT').AsWideString)]) + CHR_ENTER;

      Next;
      if not Eof then
        SourceSynEdit.Lines.Text := SourceSynEdit.Lines.Text + ',' + CHR_ENTER;
    end;
    First;
    SourceSynEdit.Lines.Text := SourceSynEdit.Lines.Text + CHR_ENTER + ');';
    SourceSynEdit.Lines.Text := SourceSynEdit.Lines.Text + CHR_ENTER;
    EnableControls;
  end;
  Application.ProcessMessages;
  { comments }
  if (CommentEdit.Text <> '') or (ColumnComments <> '') then
    SourceSynEdit.Lines.Text := SourceSynEdit.Lines.Text + CHR_ENTER;
  if CommentEdit.Text <> '' then
    SourceSynEdit.Lines.Text := SourceSynEdit.Lines.Text + Format('COMMENT ON TABLE %s.%s IS %s;', [
      FSchemaParam, TableNameEdit.Text, QuotedStr(CommentEdit.Text)]) + CHR_ENTER;
  SourceSynEdit.Lines.Text := SourceSynEdit.Lines.Text + ColumnComments + CHR_ENTER;
  if PrimaryKeyColumns <> '' then
  begin
    SourceSynEdit.Lines.Text := SourceSynEdit.Lines.Text + Format('ALTER TABLE %s.%s ADD (', [FSchemaParam, TableNameEdit.Text]) + CHR_ENTER;
    SourceSynEdit.Lines.Text := SourceSynEdit.Lines.Text + Format('PRIMARY KEY (%s));', [PrimaryKeyColumns]);
  end;
  Application.ProcessMessages;
  SourceSynEdit.Lines.Text := Trim(SourceSynEdit.Lines.Text);
  SourceSynEdit.Lines.EndUpdate;
end;

end.
