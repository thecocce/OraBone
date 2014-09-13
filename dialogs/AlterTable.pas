unit AlterTable;

interface

uses
  System.SysUtils, System.Variants, System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  CreateObjectDialog, Ora, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.DBCtrls, BCControls.Edit, Vcl.ImgList,
  SynEditHighlighter, SynHighlighterSQL, Vcl.ActnList, Vcl.ComCtrls, Vcl.ToolWin, JvExComCtrls, SynEdit, JvComCtrls,
  BCControls.PageControl, BCControls.ToolBar, BCControls.DBGrid, Data.DB, MemDS, DBAccess, BCDialogs.Dlg,
  System.Actions, GridsEh, DBAxisGridsEh, DBGridEh, BCControls.ImageList, DBGridEhGrouping, ToolCtrlsEh,
  DBGridEhToolCtrls, BCControls.CheckBox, DynVarsEh, JvExStdCtrls, JvCheckBox;

type
  TAlterTableDialog = class(TCreateObjectBaseDialog)
    AddColumnAction: TAction;
    AlterTableRadioButton: TRadioButton;
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
    OriginalColumnsQuery: TOraQuery;
    RecreateTableRadioButton: TRadioButton;
    ResetColumnsAction: TAction;
    TableNameEdit: TBCEdit;
    TableNameLabel: TLabel;
    ColumnButtonPanel: TPanel;
    Panel2: TPanel;
    ColumnsToolBar: TBCToolBar;
    MoveUpToolButton: TToolButton;
    MoveDownToolButton: TToolButton;
    AddColumnToolButton: TToolButton;
    DeleteColumnToolButton: TToolButton;
    DropUnusedColumnsCheckBox: TBCCheckBox;
    DividerBevel: TBevel;
    ResetToolBar: TBCToolBar;
    ResetToolButton: TToolButton;
    procedure AddColumnActionExecute(Sender: TObject);
    procedure ColumnCommentsDBGridGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure ColumnsDBGridGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure ColumnsQueryAfterScroll(DataSet: TDataSet);
    procedure ColumnsQueryNewRecord(DataSet: TDataSet);
    procedure DataTypeDBComboBoxChange(Sender: TObject);
    procedure DeleteColumnActionExecute(Sender: TObject);
    procedure MoveDownActionExecute(Sender: TObject);
    procedure MoveUpActionExecute(Sender: TObject);
    procedure PageControlChange(Sender: TObject);
    procedure ResetColumnsActionExecute(Sender: TObject);
   procedure FormDestroy(Sender: TObject);
    procedure ColumnsDBGridKeyPress(Sender: TObject; var Key: Char);  private
    { Private declarations }
    FOriginalTableComment: string;
    FRecordCount: Integer;
    procedure FillColumnQueries;
    procedure SetButtonActions;
  protected
    function CheckFields: Boolean; override;
    procedure CreateSQL; override;
    procedure Initialize; override;
  public
    { Public declarations }
  end;

function AlterTableDialog: TAlterTableDialog;

implementation

{$R *.dfm}

uses
  DataModule, Lib, Vcl.Themes, Winapi.UxTheme, BCCommon.StyleUtils, BCCommon.Messages, BCCommon.Lib, System.AnsiStrings;

var
  FAlterTableDialog: TAlterTableDialog;

function AlterTableDialog: TAlterTableDialog;
begin
  if not Assigned(FAlterTableDialog) then
    Application.CreateForm(TAlterTableDialog, FAlterTableDialog);
  Result := FAlterTableDialog;
  SetStyledFormSize(TDialog(Result));
end;

procedure TAlterTableDialog.AddColumnActionExecute(Sender: TObject);
begin
  inherited;
  ColumnsQuery.Append;
  SetButtonActions;
end;

procedure TAlterTableDialog.ColumnsQueryAfterScroll(DataSet: TDataSet);
begin
  inherited;
  SetButtonActions
end;

procedure TAlterTableDialog.ColumnsQueryNewRecord(DataSet: TDataSet);
begin
  inherited;
  Inc(FRecordCount);
  DataSet.FieldByName('PRIMARY_KEY').AsString := 'False';
  DataSet.FieldByName('NULLABLE').AsString := 'False';
  DataSet.FieldByName('UNUSED').AsString := 'False';
end;

procedure TAlterTableDialog.DataTypeDBComboBoxChange(Sender: TObject);
begin
  inherited;
  if (ColumnsQuery.State <> dsEdit) and
    (ColumnsQuery.State <> dsInsert) then
    Exit;
  ColumnsQuery.Post;
  ColumnsQuery.Edit;
end;

procedure TAlterTableDialog.ColumnsDBGridGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont;
  var Background: TColor; State: TGridDrawState);
var
  LStyles: TCustomStyleServices;
  LDetails: TThemedElementDetails;
  LColor: TColor;
begin
  LStyles := StyleServices;
  OriginalColumnsQuery.Locate('COLUMN_ID', ColumnsQuery.FieldByName('COLUMN_ID').AsInteger, []);
  if (Column.FieldName <> 'UNUSED') {or (Column.FieldName <> 'SIZE')} then
  begin
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

procedure TAlterTableDialog.ColumnsDBGridKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if ColumnsDBGrid.Col in [0, 1] then
    Key := Char(System.AnsiStrings.StrUpper(@Key)^); { Maybe there's a better way to do this... }
end;

procedure TAlterTableDialog.DeleteColumnActionExecute(Sender: TObject);
begin
  inherited;
  Dec(FRecordCount);
  ColumnsQuery.Delete;
  SetButtonActions;
end;

procedure TAlterTableDialog.FormDestroy(Sender: TObject);
begin
  inherited;
  FAlterTableDialog := nil;
end;

procedure TAlterTableDialog.MoveDownActionExecute(Sender: TObject);
begin
  inherited;
  Lib.MoveGridRowDown(ColumnsQuery);
  SetButtonActions;
end;

procedure TAlterTableDialog.MoveUpActionExecute(Sender: TObject);
begin
  inherited;
  Lib.MoveGridRowUp(ColumnsQuery);
  SetButtonActions;
end;

procedure TAlterTableDialog.PageControlChange(Sender: TObject);
begin
  inherited;
  SetButtonActions;
end;

procedure TAlterTableDialog.ResetColumnsActionExecute(Sender: TObject);
begin
  inherited;
  FillColumnQueries
end;

procedure TAlterTableDialog.ColumnCommentsDBGridGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont;
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

function TAlterTableDialog.CheckFields: Boolean;
begin
  Result := False;
  if ColumnsQuery.RecordCount = 0 then
  begin
    ShowErrorMessage('Set columns.');
    Exit;
  end;
  Result := True;
end;

procedure TAlterTableDialog.FillColumnQueries;
var
  OraQuery: TOraQuery;
  DataType: string;
begin
  CommentEdit.Text := FOriginalTableComment;
  with ColumnsQuery do
  begin
    Close;
    Open;
  end;
  with OriginalColumnsQuery do
  begin
    Close;
    Open;
  end;
  OraQuery := TOraQuery.Create(nil);
  OraQuery.Session := ColumnsQuery.Session;
  OraQuery.SQL.Add(DM.StringHolder.StringsByName['ColumnsSQL'].Text);
  with OraQuery do
  try
    ParamByName('P_OWNER').AsWideString := FSchemaParam;
    ParamByName('P_TABLE_NAME').AsWideString := TableNameEdit.Text;
    Prepare;
    Open;
    ColumnsQuery.DisableControls;
    while not Eof do
    begin
      ColumnsQuery.Append;
      ColumnsQuery.FieldByName('COLUMN_ID').AsInteger := FieldByName('COLUMN_ID').AsInteger;
      ColumnsQuery.FieldByName('COLUMN_NAME').AsString := FieldByName('COLUMN_NAME').AsString;
      DataType := FieldByName('DATA_TYPE').AsString;
      if Pos('(', DataType) <> 0 then
        DataType := Copy(DataType, 1, Pos('(', DataType) - 1);
      ColumnsQuery.FieldByName('DATA_TYPE').AsString := DataType;
      if (Pos('NCHAR', DataType) = 1) or (Pos('NVARCHAR2', DataType) = 1) or (Pos('RAW', DataType) = 1) or
        (Pos('VARCHAR2', DataType) = 1) then
        ColumnsQuery.FieldByName('COLUMN_SIZE').AsString := FieldByName('COLUMN_SIZE').AsString;
      ColumnsQuery.FieldByName('COLUMN_PRECISION').AsString := FieldByName('COLUMN_PRECISION').AsString;
      if (FieldByName('SCALE').AsInteger <> 0) and (Pos('TIMESTAMP', DataType) = 0) then
        ColumnsQuery.FieldByName('SCALE').AsString := FieldByName('SCALE').AsString;
      ColumnsQuery.FieldByName('PRIMARY_KEY').AsString := FieldByName('PRIMARY_KEY').AsString;
      ColumnsQuery.FieldByName('NULLABLE').AsString := FieldByName('NULLABLE').AsString;
      ColumnsQuery.FieldByName('COLUMN_DEFAULT').AsWideString := FieldByName('COLUMN_DEFAULT').AsWideString;
      ColumnsQuery.FieldByName('COLUMN_COMMENT').AsWideString := FieldByName('COLUMN_COMMENT').AsWideString;
      OriginalColumnsQuery.Append;
      OriginalColumnsQuery.FieldByName('COLUMN_ID').AsInteger := FieldByName('COLUMN_ID').AsInteger;
      OriginalColumnsQuery.FieldByName('COLUMN_NAME').AsString := FieldByName('COLUMN_NAME').AsString;
      OriginalColumnsQuery.FieldByName('DATA_TYPE').AsString := DataType;
      if (Pos('NCHAR', DataType) = 1) or (Pos('NVARCHAR2', DataType) = 1) or (Pos('RAW', DataType) = 1) or
        (Pos('VARCHAR2', DataType) = 1) then
        OriginalColumnsQuery.FieldByName('COLUMN_SIZE').AsString := FieldByName('COLUMN_SIZE').AsString;
      OriginalColumnsQuery.FieldByName('COLUMN_PRECISION').AsString := FieldByName('COLUMN_PRECISION').AsString;
      if (FieldByName('SCALE').AsInteger <> 0) and (Pos('TIMESTAMP', DataType) = 0) then
        OriginalColumnsQuery.FieldByName('SCALE').AsString := FieldByName('SCALE').AsString;
      OriginalColumnsQuery.FieldByName('PRIMARY_KEY').AsString := FieldByName('PRIMARY_KEY').AsString;
      OriginalColumnsQuery.FieldByName('NULLABLE').AsString := FieldByName('NULLABLE').AsString;
      OriginalColumnsQuery.FieldByName('COLUMN_DEFAULT').AsWideString := FieldByName('COLUMN_DEFAULT').AsWideString;
      OriginalColumnsQuery.FieldByName('COLUMN_COMMENT').AsWideString := FieldByName('COLUMN_COMMENT').AsWideString;
      Next;
    end;
    ColumnsQuery.First;
    FRecordCount := ColumnsQuery.RecordCount;
    ColumnsQuery.EnableControls;
  finally
    Close;
    UnPrepare;
    FreeAndNil(OraQuery);
  end;
end;

procedure TAlterTableDialog.Initialize;
begin
  inherited;
  ColumnsQuery.Session := FOraSession;
  OriginalColumnsQuery.Session := FOraSession;
  TableNameEdit.Text := FObjectName;
  FOriginalTableComment := Lib.GetTableOrViewComment(FOraSession, FSchemaParam, FObjectName);
  FillColumnQueries;
end;

procedure TAlterTableDialog.SetButtonActions;
begin
  MoveUpAction.Enabled := not ColumnsQuery.Bof and RecreateTableRadioButton.Checked and (FRecordCount > 1);
  MoveDownAction.Enabled := not ColumnsQuery.Eof and RecreateTableRadioButton.Checked and (FRecordCount > 1);
  DeleteColumnAction.Enabled := (FRecordCount <> 0);
  if FOriginalTableComment = CommentEdit.Text then
    CommentEdit.Font.Color := clWindowText
  else
    CommentEdit.Font.Color := clRed;
end;

procedure TAlterTableDialog.CreateSQL;
var
  MaxColumnLength, MaxDataTypeLength: Integer;
  DataType, OldTable: string;
  ColumnComments, PrimaryKeySQL, ConstraintsSQL, TriggersSQL, GrantsSQL, UnusedColumns,
  RenameColumns, DropColumns, AddColumns, ModifyColumnType, ModifyColumns, ModifyColumn, PrimaryKeyColumns: WideString;
  DefaultChange, PrimaryKeyChange, OriginalFound: Boolean;

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

  function GetConstraintsSQL(EnableConstraint: Boolean): WideString;
  var
    OraQuery: TOraQuery;
  begin
    Screen.Cursor := crSQLWait;
    OraQuery := TOraQuery.Create(nil);
    OraQuery.Session := ColumnsQuery.Session;
    OraQuery.SQL.Add(DM.StringHolder.StringsByName['ObjectConstraintsSQL'].Text);
    with OraQuery do
    try
      ParamByName('P_OWNER').AsString := FSchemaParam;
      ParamByName('P_OBJECT_NAME').AsString := TableNameEdit.Text;
      Prepare;
      Open;
      while not Eof do
      begin
        Result := Result + GetAlterConstraintSQL(FSchemaParam, TableNameEdit.Text, FieldByName('CONSTRAINT_NAME').AsString, EnableConstraint) + ';' + CHR_ENTER;
        Next;
      end;
      if Result <> '' then
        Result := Result + CHR_ENTER;
    finally
      Close;
      UnPrepare;
      FreeAndNil(OraQuery);
      Screen.Cursor := crDefault;
    end;
  end;

  function GetTriggersSQL(EnableTrigger: Boolean): WideString;
  var
    OraQuery: TOraQuery;
  begin
    Screen.Cursor := crSQLWait;
    OraQuery := TOraQuery.Create(nil);
    OraQuery.Session := ColumnsQuery.Session;
    OraQuery.SQL.Add(DM.StringHolder.StringsByName['ObjectTriggersSQL'].Text);
    with OraQuery do
    try
      ParamByName('P_OWNER').AsString := FSchemaParam;
      ParamByName('P_OBJECT_NAME').AsString := TableNameEdit.Text;
      Prepare;
      Open;
      while not Eof do
      begin
        Result := Result + GetAlterTriggerSQL(FSchemaParam, FieldByName('TRIGGER_NAME').AsString, EnableTrigger) + ';' + CHR_ENTER;
        Next;
      end;
      if Result <> '' then
        Result := Result + CHR_ENTER + '/' + CHR_ENTER;
    finally
      Close;
      UnPrepare;
      FreeAndNil(OraQuery);
      Screen.Cursor := crDefault;
    end;
  end;

  function GetCopyDataSQL: WideString;
  var
    i: Integer;
    NewColumns, OldColumns: string;
  begin
    with ColumnsQuery do
    begin
      DisableControls;
      First;
      i := 1;
      while not Eof do
      begin
        if not FieldByName('COLUMN_ID').IsNull then
        begin
          if OriginalColumnsQuery.Locate('COLUMN_ID', FieldByName('COLUMN_ID').AsInteger, []) then
          begin
            if NewColumns <> '' then
              NewColumns := NewColumns + ', ';
            if OldColumns <> '' then
              OldColumns := OldColumns + ', ';
            if i mod 5 = 0 then
            begin
              NewColumns := NewColumns + CHR_ENTER + '  ';
              OldColumns := OldColumns + CHR_ENTER + '         ';
            end;
            NewColumns := NewColumns + FieldByName('COLUMN_NAME').AsString;
            OldColumns := OldColumns + OriginalColumnsQuery.FieldByName('COLUMN_NAME').AsString;
          end;
        end;
        Next;
        Inc(i);
      end;
      First;
      EnableControls;
    end;
    Result := Format('INSERT INTO %s.%s (', [FSchemaParam, TableNameEdit.Text]) + CHR_ENTER;
    Result := Result + Format('  %s)', [NewColumns]) + CHR_ENTER;
    //Result := Result + 'VALUES (' + CHR_ENTER;
    Result := Result + Format('  SELECT %s', [OldColumns]) + CHR_ENTER;
    Result := Result + Format('    FROM %s.%s;', [FSchemaParam, OldTable]) + CHR_ENTER;
  end;

  function GetConstraintColumns(ConstraintName: string; var RefTableName: string; RefConstraintName: string=''): WideString;
  var
    OraQuery: TOraQuery;
  begin
    OraQuery := TOraQuery.Create(nil);
    OraQuery.Session := FOraSession;
    OraQuery.SQL.Add(DM.StringHolder.StringsByName['ObjectConstraintColumnsSQL'].Text);
    with OraQuery do
    try
      ParamByName('P_OWNER').AsString := FSchemaParam;
      ParamByName('P_CONSTRAINT_NAME').AsString := ConstraintName;
      ParamByName('P_R_CONSTRAINT_NAME').AsString := RefConstraintName;
      Prepare;
      Open;
      RefTableName := FieldByName('R_TABLE_NAME').AsString; { not very good but... }
      Result := '';
      while not Eof do
      begin
        if Result <> '' then
          Result := Result + ', ';
        if RefConstraintName = '' then
          Result := Result + FieldByName('COLUMN_NAME').AsString
        else
          Result := Result + FieldByName('R_COLUMN_NAME').AsString;
        Next;
      end;
    finally
      Close;
      UnPrepare;
      FreeAndNil(OraQuery);
    end;
  end;

  function GetCreateConstraintsSQL: WideString;
  var
    RefTableName: string;
    ConstraintColumns: WideString;
    OraQuery: TOraQuery;
  begin
    Screen.Cursor := crSQLWait;
    OraQuery := TOraQuery.Create(nil);
    OraQuery.Session := FOraSession;
    OraQuery.SQL.Add(DM.StringHolder.StringsByName['ObjectConstraintsSQL'].Text);
    with OraQuery do
    try
      ParamByName('P_OWNER').AsString := FSchemaParam;
      ParamByName('P_OBJECT_NAME').AsString := TableNameEdit.Text;
      Prepare;
      Open;
      Result := '';
      while not Eof do
      begin
        if (FieldByName('CONSTRAINT_TYPE').AsString = 'P') or
          (FieldByName('CONSTRAINT_TYPE').AsString = 'R') then
        begin
          ConstraintColumns := GetConstraintColumns(FieldByName('CONSTRAINT_NAME').AsString, RefTableName);
          Result := Result + Format('ALTER TABLE %s.%s', [FSchemaParam, TableNameEdit.Text]) + CHR_ENTER;
          Result := Result + Format('  ADD CONSTRAINT %s', [FieldByName('CONSTRAINT_NAME').AsString]) + CHR_ENTER;
          if FieldByName('CONSTRAINT_TYPE').AsString = 'P' then
            Result := Result + Format('  PRIMARY KEY (%s);', [ConstraintColumns]) + CHR_ENTER + CHR_ENTER;
          if FieldByName('CONSTRAINT_TYPE').AsString = 'R' then
          begin
            Result := Result + Format('  FOREIGN KEY (%s)', [ConstraintColumns]) + CHR_ENTER;
            ConstraintColumns := GetConstraintColumns(FieldByName('CONSTRAINT_NAME').AsString, RefTableName, FieldByName('R_CONSTRAINT_NAME').AsString);
            Result := Result + Format('  REFERENCING %s (%s);', [RefTableName, ConstraintColumns]) + CHR_ENTER + CHR_ENTER;
          end;
        end;
        Next;
      end;
    finally
      Close;
      UnPrepare;
      FreeAndNil(OraQuery);
      Screen.Cursor := crDefault;
    end;
  end;

  function GetCreateTriggerSQL: WideString;
  var
    OraQuery: TOraQuery;
  begin
    Screen.Cursor := crSQLWait;
    OraQuery := TOraQuery.Create(nil);
    OraQuery.Session := FOraSession;
    OraQuery.SQL.Add(DM.StringHolder.StringsByName['ObjectTriggersSQL'].Text);
    with OraQuery do
    try
      ParamByName('P_OWNER').AsString := FSchemaParam;
      ParamByName('P_OBJECT_NAME').AsString := TableNameEdit.Text;
      Prepare;
      Open;
      Result := '';
      while not Eof do
      begin
        Result := Result + 'CREATE OR REPLACE TRIGGER ' + FieldByName('DESCRIPTION').AsWideString +
          FieldByName('TRIGGER_BODY').AsWideString + CHR_ENTER + CHR_ENTER;
        Next;
      end;
      if Result <> '' then
        Result := Result + CHR_ENTER + '/' + CHR_ENTER;
    finally
      Close;
      UnPrepare;
      FreeAndNil(OraQuery);
      Screen.Cursor := crDefault;
    end;
  end;

  function GetCreateGrantSQL: WideString;
  var
    TempObjectName: string;
    OraQuery: TOraQuery;
  begin
    Screen.Cursor := crSQLWait;
    OraQuery := TOraQuery.Create(nil);
    OraQuery.Session := FOraSession;
    OraQuery.SQL.Add(DM.StringHolder.StringsByName['ObjectGrantsSQL'].Text);
    with OraQuery do
    try
      //ParamByName('P_OWNER').AsString := FSchemaParam;
      ParamByName('P_OBJECT_NAME').AsString := TableNameEdit.Text;
      Prepare;
      Open;
      Result := '';
      TempObjectName := '';
      while not Eof do
      begin
        if TempObjectName <> FieldByName('GRANTEE').AsWideString then
        begin
          TempObjectName := FieldByName('GRANTEE').AsWideString;
          Result := Result + 'GRANT ';
        end;
        Result := Result + FieldByName('PRIVILEGE').AsWideString;
        Next;
        if (TempObjectName <> FieldByName('GRANTEE').AsWideString) or Eof then
          Result := Result + ' ON ' + FSchemaParam + '.' + FObjectName + ' TO ' + TempObjectName + ';' + CHR_ENTER
        else
          Result := Result + ', ';
      end;
    finally
      Close;
      UnPrepare;
      FreeAndNil(OraQuery);
      Screen.Cursor := crDefault;
    end;
  end;

  function RenameConstraintsSQL: Widestring;
  var
    OldName, NewName: string;
    OraQuery: TOraQuery;

    function RenameConstraintSQL(OldName, NewName: string): Widestring;
    var
      ObjectType, ObjectName: string;
      OraQuery: TOraQuery;
    begin
    { get constraint object type and name }
      OraQuery := TOraQuery.Create(nil);
      OraQuery.Session := FOraSession;
      OraQuery.SQL.Add(DM.StringHolder.StringsByName['ConstraintTypeForRenamingSQL'].Text);
      with OraQuery do
      try
        ParamByName('CONSTRAINT_NAME').AsWideString := String(OldName);
        Open;
        ObjectType := FieldByName('TYPE').AsWideString;
        ObjectName := FieldByName('NAME').AsWideString;
      finally
        Close;
        Free;
      end;
      Result := Format(DM.StringHolder.StringsByName['RenameConstraintSQL'].Text, [ObjectType, ObjectName, OldName, NewName])
    end;
  begin
    Screen.Cursor := crSQLWait;
    OraQuery := TOraQuery.Create(nil);
    OraQuery.Session := FOraSession;
    OraQuery.SQL.Add(DM.StringHolder.StringsByName['ObjectConstraintsSQL'].Text);
    with OraQuery do
    try
      ParamByName('P_OWNER').AsString := FSchemaParam;
      ParamByName('P_OBJECT_NAME').AsString := TableNameEdit.Text;
      Prepare;
      Open;
      Result := '';
      while not Eof do
      begin
        OldName := FieldByName('CONSTRAINT_NAME').AsString;
        NewName := OldName;
        if Length(NewName) > 26 then
          NewName := Copy(NewName, 1, 26);
        NewName := NewName + '_OLD';
        Result := Result + RenameConstraintSQL(OldName, NewName);
        Next;
      end;
      if Result <> '' then
        Result := Result + CHR_ENTER;
    finally
      Close;
      UnPrepare;
      FreeAndNil(OraQuery);
      Screen.Cursor := crDefault;
    end;
  end;

  function RenameTriggersSQL: WideString;
  var
    OldName, NewName: string;
    OraQuery: TOraQuery;
  begin
    Screen.Cursor := crSQLWait;
    OraQuery := TOraQuery.Create(nil);
    OraQuery.Session := FOraSession;
    OraQuery.SQL.Add(DM.StringHolder.StringsByName['ObjectTriggersSQL'].Text);
    with OraQuery do
    try
      ParamByName('P_OWNER').AsString := FSchemaParam;
      ParamByName('P_OBJECT_NAME').AsString := TableNameEdit.Text;
      Prepare;
      Open;
      Result := '';
      while not Eof do
      begin
        OldName := FieldByName('TRIGGER_NAME').AsString;
        NewName := OldName;
        if Length(NewName) > 26 then
          NewName := Copy(NewName, 1, 26);
        NewName := NewName + '_OLD';
        Result := Result + Format(DM.StringHolder.StringsByName['RenameTriggerSQL'].Text, [OldName, NewName]);
        Next;
      end;
      if Result <> '' then
        Result := Result + CHR_ENTER;
    finally
      Close;
      UnPrepare;
      FreeAndNil(OraQuery);
      Screen.Cursor := crDefault;
    end;
  end;

  procedure GetMaxLengths(var MaxColumnLength: Integer; var MaxDataTypeLength: Integer;
    OnlyNewColumn: Boolean=False);
  begin
    MaxColumnLength := 0;
    MaxDataTypeLength := 0;
    with ColumnsQuery do
    begin
      First;
      while not Eof do
      begin
        if (not OnlyNewColumn) or (OnlyNewColumn and FieldByName('COLUMN_ID').IsNull) then
        begin
          DataType := GetDataTypeString(FieldByName('DATA_TYPE').AsWideString,
            FieldByName('COLUMN_PRECISION').AsString, FieldByName('SCALE').AsString,
            FieldByName('COLUMN_SIZE').AsString);
          if Length(Trim(FieldByName('COLUMN_NAME').AsWideString)) > MaxColumnLength then
            MaxColumnLength := Length(Trim(FieldByName('COLUMN_NAME').AsWideString));
          if Length(Trim(DataType)) > MaxDataTypeLength then
            MaxDataTypeLength := Length(Trim(DataType));
        end;
        Next;
      end;
    end;
  end;

  procedure GetModifyMaxLengths(var MaxColumnLength: Integer; var MaxDataTypeLength: Integer);
  begin
    MaxColumnLength := 0;
    MaxDataTypeLength := 0;
    with ColumnsQuery do
    begin
      First;
      while not Eof do
      begin
        if OriginalColumnsQuery.Locate('COLUMN_ID', FieldByName('COLUMN_ID').AsInteger, []) and (
         (FieldByName('COLUMN_NAME').AsString <> OriginalColumnsQuery.FieldByName('COLUMN_NAME').AsString) or
         (FieldByName('DATA_TYPE').AsString <> OriginalColumnsQuery.FieldByName('DATA_TYPE').AsString) or
         (FieldByName('COLUMN_PRECISION').AsString <> OriginalColumnsQuery.FieldByName('COLUMN_PRECISION').AsString) or
         (FieldByName('SCALE').AsString <> OriginalColumnsQuery.FieldByName('SCALE').AsString) or
         (FieldByName('COLUMN_SIZE').AsString <> OriginalColumnsQuery.FieldByName('COLUMN_SIZE').AsString) or
         (FieldByName('NULLABLE').AsString <> OriginalColumnsQuery.FieldByName('NULLABLE').AsString) or
         (FieldByName('COLUMN_DEFAULT').AsString <> OriginalColumnsQuery.FieldByName('COLUMN_DEFAULT').AsString)
         ) then
        begin
          DataType := GetDataTypeString(FieldByName('DATA_TYPE').AsWideString,
            FieldByName('COLUMN_PRECISION').AsString, FieldByName('SCALE').AsString,
            FieldByName('COLUMN_SIZE').AsString);
          if Length(Trim(FieldByName('COLUMN_NAME').AsWideString)) > MaxColumnLength then
            MaxColumnLength := Length(Trim(FieldByName('COLUMN_NAME').AsWideString));
          if Length(Trim(DataType)) > MaxDataTypeLength then
            MaxDataTypeLength := Length(Trim(DataType));
        end;
        Next;
      end;
    end;
  end;

  function GetDropPrimaryKeySQL: WideString;
  var
    OraQuery: TOraQuery;
  begin
    Screen.Cursor := crSQLWait;
    OraQuery := TOraQuery.Create(nil);
    OraQuery.Session := FOraSession;
    OraQuery.SQL.Add(DM.StringHolder.StringsByName['ObjectConstraintsSQL'].Text);
    with OraQuery do
    try
      ParamByName('P_OWNER').AsString := FSchemaParam;
      ParamByName('P_OBJECT_NAME').AsString := TableNameEdit.Text;
      Prepare;
      Open;
      Result := '';
      while not Eof do
      begin
        if FieldByName('CONSTRAINT_TYPE').AsString = 'P' then
          Result := Result + Format('ALTER TABLE %s.%s DROP CONSTRAINT %s;', [FSchemaParam,
            TableNameEdit.Text, FieldByName('CONSTRAINT_NAME').AsString]) + CHR_ENTER;
        Next;
      end;
    finally
      Close;
      UnPrepare;
      FreeAndNil(OraQuery);
      Screen.Cursor := crDefault;
    end;
  end;

  function GetCreatePrimaryKeySQL: WideString;
  var
    ConstraintName, ConstraintColumns: WideString;
    OraQuery: TOraQuery;

    function GetPrimaryKeyColumns: WideString;
    begin
      Result := '';
      with ColumnsQuery do
      begin
        DisableControls;
        First;
        while not Eof do
        begin
          if UpperCase(FieldByName('PRIMARY_KEY').AsWideString) = 'TRUE' then
          begin
            if Result <> '' then
              Result := Result + ', ';
            Result := Result + FieldByName('COLUMN_NAME').AsString;
          end;
          Next;
        end;
        First;
        EnableControls;
      end;
    end;

  begin
    Screen.Cursor := crSQLWait;
    OraQuery := TOraQuery.Create(nil);
    OraQuery.Session := FOraSession;
    OraQuery.SQL.Add(DM.StringHolder.StringsByName['ObjectConstraintsSQL'].Text);
    with OraQuery do
    try
      ParamByName('P_OWNER').AsString := FSchemaParam;
      ParamByName('P_OBJECT_NAME').AsString := TableNameEdit.Text;
      Prepare;
      Open;
      Result := '';
      ConstraintName := Format('%s_PK', [TableNameEdit.Text]);
      ConstraintColumns := GetPrimaryKeyColumns;
      while not Eof do
      begin
        if FieldByName('CONSTRAINT_TYPE').AsString = 'P' then
        begin
          ConstraintName := FieldByName('CONSTRAINT_NAME').AsString;
          Break;
        end;
        Next;
      end;
      Result := Result + Format('ALTER TABLE %s.%s', [FSchemaParam, TableNameEdit.Text]) + CHR_ENTER;
      Result := Result + Format('  ADD CONSTRAINT %s', [ConstraintName]) + CHR_ENTER;
      Result := Result + Format('  PRIMARY KEY (%s);', [ConstraintColumns]) + CHR_ENTER + CHR_ENTER;
    finally
      Close;
      UnPrepare;
      FreeAndNil(OraQuery);
      Screen.Cursor := crDefault;
    end;
  end;


begin
  if not ColumnsQuery.Active then
    Exit;
  SourceSynEdit.Lines.Clear;
  SourceSynEdit.Lines.BeginUpdate;
  { unused columns }
  with ColumnsQuery do
  begin
    DisableControls;
    First;
    UnusedColumns := '';
    while not Eof do
    begin
      if UpperCase(FieldByName('UNUSED').AsString) = 'TRUE' then
        UnusedColumns := UnusedColumns + Format('ALTER TABLE %s SET UNUSED COLUMN %s;', [
          TableNameEdit.Text, FieldByName('COLUMN_NAME').AsString]) + CHR_ENTER;
      Next;
    end;
    First;
    EnableControls;
  end;
  if UnusedColumns <> '' then
  begin
    SourceSynEdit.Lines.Text := SourceSynEdit.Lines.Text + '-- set unused columns' + CHR_ENTER;
    SourceSynEdit.Lines.Text := SourceSynEdit.Lines.Text + UnusedColumns + CHR_ENTER;
    if DropUnusedColumnsCheckBox.Checked then
    begin
      SourceSynEdit.Lines.Text := SourceSynEdit.Lines.Text + '-- drop unused columns' + CHR_ENTER;
      SourceSynEdit.Lines.Text := SourceSynEdit.Lines.Text + Format('ALTER TABLE %s DROP UNUSED COLUMNS;', [TableNameEdit.Text]) + CHR_ENTER + CHR_ENTER;
    end;
  end;
  { Recreate table }
  if RecreateTableRadioButton.Checked then
  begin
    with ColumnsQuery do
    begin
      DisableControls;
      First;
      OldTable := TableNameEdit.Text;
      if Length(OldTable) > 26 then
        OldTable := Copy(OldTable, 1, 26);
      OldTable := OldTable + '_OLD';
      { create SQL for constraints, triggers and grants }
      ConstraintsSQL := GetCreateConstraintsSQL;
      TriggersSQL := GetCreateTriggerSQL;
      GrantsSQL := GetCreateGrantSQL;
      { rename current constraints and triggers }
      if (ConstraintsSQL <> '') or (TriggersSQL <> '')  then
      begin
        SourceSynEdit.Lines.Text := SourceSynEdit.Lines.Text + '-- rename current constraints and triggers' + CHR_ENTER;
        SourceSynEdit.Lines.Text := SourceSynEdit.Lines.Text + RenameConstraintsSQL;
        SourceSynEdit.Lines.Text := SourceSynEdit.Lines.Text + RenameTriggersSQL;
      end;
      { rename current table }
      SourceSynEdit.Lines.Text := SourceSynEdit.Lines.Text + '-- rename current table' + CHR_ENTER;
      SourceSynEdit.Lines.Text := SourceSynEdit.Lines.Text + Format('ALTER TABLE %s.%s RENAME TO %s;', [FSchemaParam,
        TableNameEdit.Text, OldTable]) + CHR_ENTER + CHR_ENTER;
      { create new table }
      SourceSynEdit.Lines.Text := SourceSynEdit.Lines.Text + '-- create new table' + CHR_ENTER;
      SourceSynEdit.Lines.Text := SourceSynEdit.Lines.Text + Format('CREATE TABLE %s.%s', [FSchemaParam,
        TableNameEdit.Text]) + CHR_ENTER;
      SourceSynEdit.Lines.Text := SourceSynEdit.Lines.Text + '(' + CHR_ENTER;
      GetMaxLengths(MaxColumnLength, MaxDataTypeLength);

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
          //if UpperCase(FieldByName('NULLABLE').AsWideString) = 'TRUE' then
          //   SourceSynEdit.Lines.Text := SourceSynEdit.Lines.Text + ' ';
          if (Pos('NCHAR', DataType) = 1) or (Pos('NVARCHAR2', DataType) = 1) or (Pos('RAW', DataType) = 1) or
            (Pos('VARCHAR2', DataType) = 1) then
            SourceSynEdit.Lines.Text := SourceSynEdit.Lines.Text + ' DEFAULT ' + QuotedStr(FieldByName('COLUMN_DEFAULT').AsString)
          else
            SourceSynEdit.Lines.Text := SourceSynEdit.Lines.Text + ' DEFAULT ' + FieldByName('COLUMN_DEFAULT').AsString;
        end;

        if not FieldByName('COLUMN_COMMENT').IsNull then
          ColumnComments := ColumnComments + Format('COMMENT ON COLUMN %s.%s.%s IS %s;', [FSchemaParam,
            TableNameEdit.Text, Trim(FieldByName('COLUMN_NAME').AsWideString), QuotedStr(FieldByName('COLUMN_COMMENT').AsWideString)]) + CHR_ENTER;

        {if UpperCase(FieldByName('PRIMARY_KEY').AsWideString) = 'TRUE' then
        begin
          if PrimaryKeyColumns <> '' then
            PrimaryKeyColumns := PrimaryKeyColumns + ', ';
          PrimaryKeyColumns := PrimaryKeyColumns + FieldByName('COLUMN_NAME').AsString;
        end; }

        Next;
        if not Eof then
          SourceSynEdit.Lines.Text := SourceSynEdit.Lines.Text + ',' + CHR_ENTER;
      end;
      First;
      EnableControls;
      SourceSynEdit.Lines.Text := SourceSynEdit.Lines.Text + CHR_ENTER + ');';
      SourceSynEdit.Lines.Text := SourceSynEdit.Lines.Text + CHR_ENTER;
    end;
    Application.ProcessMessages;
    { add comments }
    if (CommentEdit.Text <> '') or (ColumnComments <> '') then
    begin
      SourceSynEdit.Lines.Text := SourceSynEdit.Lines.Text + CHR_ENTER;
      SourceSynEdit.Lines.Text := SourceSynEdit.Lines.Text + '-- add comments' + CHR_ENTER;
    end;
    if CommentEdit.Text <> '' then
      SourceSynEdit.Lines.Text := SourceSynEdit.Lines.Text + Format('COMMENT ON TABLE %s.%s IS %s;', [
        FSchemaParam, TableNameEdit.Text, QuotedStr(CommentEdit.Text)]) + CHR_ENTER;
    SourceSynEdit.Lines.Text := SourceSynEdit.Lines.Text + ColumnComments + CHR_ENTER;
    { copy data to the new table }
    SourceSynEdit.Lines.Text := SourceSynEdit.Lines.Text + '-- copy data to the new table' + CHR_ENTER;
    SourceSynEdit.Lines.Text := SourceSynEdit.Lines.Text + GetCopyDataSQL + CHR_ENTER;
    SourceSynEdit.Lines.Text := SourceSynEdit.Lines.Text + 'COMMIT;' + CHR_ENTER;
    (*{ create primary key }
    if PrimaryKeyColumns <> '' then
    begin
      SourceSynEdit.Lines.Text := SourceSynEdit.Lines.Text + '-- create primary key' + CHR_ENTER;
      SourceSynEdit.Lines.Text := SourceSynEdit.Lines.Text + GetCreatePrimaryKeySQL + CHR_ENTER;
    end;*)
    { create constraints and triggers }
    if ConstraintsSQL <> '' then
    begin
      SourceSynEdit.Lines.Text := SourceSynEdit.Lines.Text + '-- create constraints' + CHR_ENTER;
      SourceSynEdit.Lines.Text := SourceSynEdit.Lines.Text + ConstraintsSQL;
    end;
    { create triggers }
    if TriggersSQL <> '' then
    begin
      SourceSynEdit.Lines.Text := SourceSynEdit.Lines.Text + '-- create triggers' + CHR_ENTER;
      SourceSynEdit.Lines.Text := SourceSynEdit.Lines.Text + TriggersSQL;
    end;
    { grants }
    if GrantsSQL <> '' then
    begin
      SourceSynEdit.Lines.Text := SourceSynEdit.Lines.Text + '-- grant privileges' + CHR_ENTER;
      SourceSynEdit.Lines.Text := SourceSynEdit.Lines.Text + GrantsSQL;
    end;
  end;
  { Alter table }
  if AlterTableRadioButton.Checked then
  begin
    with ColumnsQuery do
    begin
      DisableControls;
      First;
      RenameColumns := '';
      DropColumns := '';
      AddColumns := '';
      ModifyColumns := '';
      ModifyColumnType := '';
      GetMaxLengths(MaxColumnLength, MaxDataTypeLength, True);
      First;
      DefaultChange := False;
      while not Eof do
      begin
        { rename columns }
        if OriginalColumnsQuery.Locate('COLUMN_ID', FieldByName('COLUMN_ID').AsInteger, []) then
        begin
          if FieldByName('COLUMN_NAME').AsString <> OriginalColumnsQuery.FieldByName('COLUMN_NAME').AsString then
            RenameColumns := RenameColumns + Format('ALTER TABLE %s RENAME COLUMN %s TO %s;', [
              TableNameEdit.Text, OriginalColumnsQuery.FieldByName('COLUMN_NAME').AsString,
              FieldByName('COLUMN_NAME').AsString]) + CHR_ENTER;
          { column comments }
          if FieldByName('COLUMN_COMMENT').AsString <> OriginalColumnsQuery.FieldByName('COLUMN_COMMENT').AsString then
            ColumnComments := ColumnComments + Format('COMMENT ON COLUMN %s.%s.%s IS %s;', [FSchemaParam,
              TableNameEdit.Text, Trim(FieldByName('COLUMN_NAME').AsWideString), QuotedStr(FieldByName('COLUMN_COMMENT').AsWideString)]) + CHR_ENTER;
        end;
        { add column }
        if FieldByName('COLUMN_ID').IsNull then
        begin
          if AddColumns <> '' then
            AddColumns := AddColumns + ', ' + CHR_ENTER;

          DataType := GetDataTypeString(FieldByName('DATA_TYPE').AsWideString,
            FieldByName('COLUMN_PRECISION').AsString, FieldByName('SCALE').AsString,
            FieldByName('COLUMN_SIZE').AsString);

          AddColumns := AddColumns + '  ' + TrimToMaxLength(FieldByName('COLUMN_NAME').AsWideString, MaxColumnLength);
          if (UpperCase(FieldByName('NULLABLE').AsWideString) = 'TRUE') or (not FieldByName('COLUMN_DEFAULT').IsNull) then
            AddColumns := AddColumns + TrimToMaxLength(DataType, MaxDataTypeLength)
          else
            AddColumns := AddColumns + Trim(DataType);
          if UpperCase(FieldByName('NULLABLE').AsWideString) = 'TRUE' then
            AddColumns := AddColumns + 'NOT NULL';
          if not FieldByName('COLUMN_DEFAULT').IsNull then
          begin
            DefaultChange := True;
            //if UpperCase(FieldByName('NULLABLE').AsWideString) = 'TRUE' then
            //   AddColumns := AddColumns + ' ';
            if (Pos('NCHAR', DataType) = 1) or (Pos('NVARCHAR2', DataType) = 1) or (Pos('RAW', DataType) = 1) or
             (Pos('VARCHAR2', DataType) = 1) then
              AddColumns := AddColumns + ' DEFAULT ' +  QuotedStr(FieldByName('COLUMN_DEFAULT').AsString)
            else
              AddColumns := AddColumns + ' DEFAULT ' +  FieldByName('COLUMN_DEFAULT').AsString;
          end;
        end;
        Next;
      end;
      { modify columns }
      GetModifyMaxLengths(MaxColumnLength, MaxDataTypeLength);
      First;
      PrimaryKeyColumns := '';
      PrimaryKeyChange := False;
      while not Eof do
      begin
        OriginalFound := OriginalColumnsQuery.Locate('COLUMN_ID', FieldByName('COLUMN_ID').AsInteger, []);
        { column type }
        if OriginalFound then
        begin
           //(FieldByName('COLUMN_NAME').AsString <> OriginalColumnsQuery.FieldByName('COLUMN_NAME').AsString) or
           if (FieldByName('DATA_TYPE').AsString <> OriginalColumnsQuery.FieldByName('DATA_TYPE').AsString) or
           (FieldByName('COLUMN_PRECISION').AsString <> OriginalColumnsQuery.FieldByName('COLUMN_PRECISION').AsString) or
           (FieldByName('SCALE').AsString <> OriginalColumnsQuery.FieldByName('SCALE').AsString) or
           (FieldByName('COLUMN_SIZE').AsString <> OriginalColumnsQuery.FieldByName('COLUMN_SIZE').AsString) //or
           //(FieldByName('NULLABLE').AsString <> OriginalColumnsQuery.FieldByName('NULLABLE').AsString) or
           //(FieldByName('COLUMN_DEFAULT').AsString <> OriginalColumnsQuery.FieldByName('COLUMN_DEFAULT').AsString)
           then
          begin
            if ModifyColumnType <> '' then
              ModifyColumnType := ModifyColumnType + ', ';

            DataType := GetDataTypeString(FieldByName('DATA_TYPE').AsWideString,
              FieldByName('COLUMN_PRECISION').AsString, FieldByName('SCALE').AsString,
              FieldByName('COLUMN_SIZE').AsString);

            ModifyColumnType := ModifyColumnType + '  ' + FieldByName('COLUMN_NAME').AsWideString + ' ' +
              DataType;
            {
            if (UpperCase(FieldByName('NULLABLE').AsWideString) = 'TRUE') or (not FieldByName('COLUMN_DEFAULT').IsNull) then
              ModifyColumnType := ModifyColumnType + TrimToMaxLength(DataType, MaxDataTypeLength)
            else
              ModifyColumnType := ModifyColumnType + Trim(DataType); }
          end;

          { column nullable and default }
          if (FieldByName('NULLABLE').AsString <> OriginalColumnsQuery.FieldByName('NULLABLE').AsString) or
             (FieldByName('COLUMN_DEFAULT').AsString <> OriginalColumnsQuery.FieldByName('COLUMN_DEFAULT').AsString) then
          begin
            if ModifyColumns <> '' then
              ModifyColumns := ModifyColumns + ', ';

            DataType := GetDataTypeString(FieldByName('DATA_TYPE').AsWideString,
              FieldByName('COLUMN_PRECISION').AsString, FieldByName('SCALE').AsString,
              FieldByName('COLUMN_SIZE').AsString);

            ModifyColumns := ModifyColumns + '  ' + FieldByName('COLUMN_NAME').AsWideString + ' ' +
              DataType;
           { if (UpperCase(FieldByName('NULLABLE').AsWideString) = 'TRUE') or (not FieldByName('COLUMN_DEFAULT').IsNull) then
              ModifyColumns := ModifyColumns + TrimToMaxLength(DataType, MaxDataTypeLength)
            else
              ModifyColumns := ModifyColumns + Trim(DataType);}

            if (UpperCase(FieldByName('NULLABLE').AsWideString) = 'TRUE') and
              (FieldByName('NULLABLE').AsWideString <> OriginalColumnsQuery.FieldByName('NULLABLE').AsWideString) then
              ModifyColumns := ModifyColumns + ' NOT NULL'
            else
              ModifyColumns := ModifyColumns + ' NULL';
            if (not FieldByName('COLUMN_DEFAULT').IsNull) and
              (FieldByName('COLUMN_DEFAULT').AsWideString <> OriginalColumnsQuery.FieldByName('COLUMN_DEFAULT').AsWideString)  then
            begin
              DefaultChange := True;
              //if UpperCase(FieldByName('NULLABLE').AsWideString) = 'TRUE' then
              //   ModifyColumns := ModifyColumns + ' ';

              if (Pos('NCHAR', DataType) = 1) or (Pos('NVARCHAR2', DataType) = 1) or (Pos('RAW', DataType) = 1) or
                (Pos('VARCHAR2', DataType) = 1) then
                ModifyColumns := ModifyColumns + ' DEFAULT ' +  QuotedStr(FieldByName('COLUMN_DEFAULT').AsString)
              else
                ModifyColumns := ModifyColumns + ' DEFAULT ' +  FieldByName('COLUMN_DEFAULT').AsString;
            end;
          end;

          if UpperCase(FieldByName('PRIMARY_KEY').AsWideString) = 'TRUE' then
          begin
            if PrimaryKeyColumns <> '' then
              PrimaryKeyColumns := PrimaryKeyColumns + ', ';
            PrimaryKeyColumns := PrimaryKeyColumns + FieldByName('COLUMN_NAME').AsString;
          end;

          if FieldByName('PRIMARY_KEY').AsString <> OriginalColumnsQuery.FieldByName('PRIMARY_KEY').AsString then
            PrimaryKeyChange := True;
        end;
        Next;
      end;
      { drop columns }
      OriginalColumnsQuery.First;
      while not OriginalColumnsQuery.Eof do
      begin
        if not Locate('COLUMN_ID', OriginalColumnsQuery.FieldByName('COLUMN_ID').AsInteger, []) then
          DropColumns := DropColumns + Format('ALTER TABLE %s.%s DROP COLUMN %s;', [FSchemaParam,
            TableNameEdit.Text, OriginalColumnsQuery.FieldByName('COLUMN_NAME').AsString]) + CHR_ENTER;
        OriginalColumnsQuery.Next;
      end;
      First;
      EnableControls;
    end;

    { set table comment }
    if CommentEdit.Font.Color = clRed then
    begin
      SourceSynEdit.Lines.Text := SourceSynEdit.Lines.Text + '-- set table comment' + CHR_ENTER;
      SourceSynEdit.Lines.Text := SourceSynEdit.Lines.Text + Format('COMMENT ON TABLE %s.%s IS %s;', [
        FSchemaParam, TableNameEdit.Text, QuotedStr(CommentEdit.Text)]) + CHR_ENTER + CHR_ENTER;
    end;
    if ColumnComments <> '' then
    begin
      SourceSynEdit.Lines.Text := SourceSynEdit.Lines.Text + '-- set column comments' + CHR_ENTER;
      SourceSynEdit.Lines.Text := SourceSynEdit.Lines.Text + ColumnComments + CHR_ENTER;
    end;
    if RenameColumns <> '' then
    begin
      SourceSynEdit.Lines.Text := SourceSynEdit.Lines.Text + '-- rename columns' + CHR_ENTER;
      SourceSynEdit.Lines.Text := SourceSynEdit.Lines.Text + RenameColumns + CHR_ENTER;
    end;
    if DropColumns <> '' then
    begin
      SourceSynEdit.Lines.Text := SourceSynEdit.Lines.Text + '-- drop columns' + CHR_ENTER;
      SourceSynEdit.Lines.Text := SourceSynEdit.Lines.Text + DropColumns + CHR_ENTER;
    end;
    { disable triggers because for setting default value can trigger an after update }
    if DefaultChange then
    begin
      TriggersSQL := GetTriggersSQL(False);
      if TriggersSQL <> '' then
      begin
        SourceSynEdit.Lines.Text := SourceSynEdit.Lines.Text + '-- disable constraints and triggers' + CHR_ENTER;
        SourceSynEdit.Lines.Text := SourceSynEdit.Lines.Text + TriggersSQL;
      end;
    end;

    if AddColumns <> '' then
    begin
      SourceSynEdit.Lines.Text := SourceSynEdit.Lines.Text + '-- add columns' + CHR_ENTER;
      SourceSynEdit.Lines.Text := SourceSynEdit.Lines.Text + Format('ALTER TABLE %s.%s ADD (',
        [FSchemaParam, TableNameEdit.Text]) + CHR_ENTER;
      SourceSynEdit.Lines.Text := SourceSynEdit.Lines.Text + AddColumns + CHR_ENTER + ');' + CHR_ENTER;
    end;
    if ModifyColumnType <> '' then
      SourceSynEdit.Lines.Text := SourceSynEdit.Lines.Text + '-- modify column type' + CHR_ENTER;
    while ModifyColumnType <> '' do
    begin
      SourceSynEdit.Lines.Text := SourceSynEdit.Lines.Text + Format('ALTER TABLE %s.%s MODIFY ',
        [FSchemaParam, TableNameEdit.Text]) + CHR_ENTER;

      if Pos(',', ModifyColumnType) <> 0 then
        ModifyColumn := Copy(ModifyColumnType, 0, Pos(',', ModifyColumnType) - 1)
      else
        ModifyColumn := ModifyColumnType;

      SourceSynEdit.Lines.Text := SourceSynEdit.Lines.Text + ModifyColumn + ';' + CHR_ENTER;

      if Pos(',', ModifyColumnType) <> 0 then
        ModifyColumnType := '  ' + Trim(Copy(ModifyColumnType, Pos(',', ModifyColumnType) + 1, Length(ModifyColumnType)))
      else
        ModifyColumnType := '';
    end;
    while ModifyColumns <> '' do
    begin
      SourceSynEdit.Lines.Text := SourceSynEdit.Lines.Text + '-- modify column' + CHR_ENTER;
      SourceSynEdit.Lines.Text := SourceSynEdit.Lines.Text + Format('ALTER TABLE %s.%s MODIFY ',
        [FSchemaParam, TableNameEdit.Text]) + CHR_ENTER;

      if Pos(',', ModifyColumns) <> 0 then
        ModifyColumn := Copy(ModifyColumns, 0, Pos(',', ModifyColumns) - 1)
      else
        ModifyColumn := ModifyColumns;

      SourceSynEdit.Lines.Text := SourceSynEdit.Lines.Text + ModifyColumn + ';' + CHR_ENTER;

      if Pos(',', ModifyColumns) <> 0 then
        ModifyColumns := '  ' + Trim(Copy(ModifyColumns, Pos(',', ModifyColumns) + 1, Length(ModifyColumns)))
      else
        ModifyColumns := '';
    end;
    if DefaultChange then
    begin
      TriggersSQL := GetTriggersSQL(True);
      if (ConstraintsSQL <> '') or (TriggersSQL <> '') then
      begin
        SourceSynEdit.Lines.Text := SourceSynEdit.Lines.Text + '-- enable constraints and triggers' + CHR_ENTER;
        SourceSynEdit.Lines.Text := SourceSynEdit.Lines.Text + ConstraintsSQL;
        SourceSynEdit.Lines.Text := SourceSynEdit.Lines.Text + TriggersSQL;
      end;
    end;
    if PrimaryKeyChange then
    begin
      PrimaryKeySQL := GetDropPrimaryKeySQL;
      if PrimaryKeySQL <> '' then
      begin
        SourceSynEdit.Lines.Text := SourceSynEdit.Lines.Text + '-- drop primary key' + CHR_ENTER;
        SourceSynEdit.Lines.Text := SourceSynEdit.Lines.Text + PrimaryKeySQL + CHR_ENTER;
      end;
      if PrimaryKeyColumns <> '' then
      begin
        SourceSynEdit.Lines.Text := SourceSynEdit.Lines.Text + '-- create primary key' + CHR_ENTER;
        SourceSynEdit.Lines.Text := SourceSynEdit.Lines.Text + GetCreatePrimaryKeySQL + CHR_ENTER;
      end;
    end;
    SourceSynEdit.Lines.Text := SourceSynEdit.Lines.Text + 'COMMIT;';

    (* jos modify columnia, niin kopsaa tiedot temppi tauluun, tyhjennä taulu, disabloi constraintit ja triggerit
       tee muutokset, kopsaa data takaisin ja enabloi const ja trig

    { disable constraints and triggers }
    ConstraintsSQL := GetConstraintsSQL(False);
    TriggersSQL := GetTriggersSQL(False);
    if (ConstraintsSQL <> '') or (TriggersSQL <> '') then
    begin
      SourceSynEdit.Lines.Text := SourceSynEdit.Lines.Text + '-- disable constraints and triggers' + CHR_ENTER;
      SourceSynEdit.Lines.Text := SourceSynEdit.Lines.Text + ConstraintsSQL;
      SourceSynEdit.Lines.Text := SourceSynEdit.Lines.Text + TriggersSQL;
    end;

    { enable constraints and triggers }
    ConstraintsSQL := GetConstraintsSQL(True);
    TriggersSQL := GetTriggersSQL(True);
    if (ConstraintsSQL <> '') or (TriggersSQL <> '') then
    begin
      SourceSynEdit.Lines.Text := SourceSynEdit.Lines.Text + '-- enable constraints and triggers' + CHR_ENTER;
      SourceSynEdit.Lines.Text := SourceSynEdit.Lines.Text + ConstraintsSQL;
      SourceSynEdit.Lines.Text := SourceSynEdit.Lines.Text + TriggersSQL;
    end;  *)
  end;
  SourceSynEdit.Lines.Text := Trim(SourceSynEdit.Lines.Text);
  SourceSynEdit.Lines.EndUpdate;
end;

end.
