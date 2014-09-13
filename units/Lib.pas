unit Lib;

{$WARN SYMBOL_PLATFORM OFF}

interface

uses
  Winapi.Windows, Ora, System.Classes, DB, Vcl.Forms, SynEdit, Vcl.Controls, Grids, BCControls.StringGrid, ActnList,
  ComCtrls, BCControls.DBGrid, DBGridEh;

//type
//  TWordTriple = Array[0..2] of Word;

const
  OLD_CRYPT_KEY = '0129ABCDEFGHIJKQRSTUbcdijklmnstxyz';
  CAPTION_ERRORS = 'Errors';
  END_OF_SQL_STATEMENT = '#!SQLEND!#';

  { Object types }
  OBJECT_TYPE_TABLE = 'TABLE';
  OBJECT_TYPE_VIEW = 'VIEW';
  OBJECT_TYPE_FUNCTION = 'FUNCTION';
  OBJECT_TYPE_PROCEDURE = 'PROCEDURE';
  OBJECT_TYPE_PACKAGE = 'PACKAGE';
  OBJECT_TYPE_TRIGGER = 'TRIGGER';
  OBJECT_TYPE_CONSTRAINT = 'CONSTRAINT';
  OBJECT_TYPE_INDEX = 'INDEX';
  OBJECT_TYPE_SEQUENCE = 'SEQUENCE';
  OBJECT_TYPE_SYNONYM = 'SYNONYM';
  OBJECT_TYPE_DATABASE_LINK = 'DATABASE LINK';
  OBJECT_TYPE_USER = 'USER';
  OBJECT_TYPE_INVALID_OBJECT = 'INVALID OBJECT';
  OBJECT_TYPE_RECYCLE_BIN = 'RECYCLE BIN';

resourcestring
  TEXT_USERNAME = 'Set Username before login.';
  TEXT_PASSWORD = 'Set Password before login.';

type
  POutputRec = ^TOutputRec;
  TOutputRec = packed record
    Level: Byte;
    Filename: string;
    Ln: LongWord;
    Ch: LongWord;
    TextCh: LongWord;
    Text: string;
    SearchString: ShortString;
  end;

function AskCommit(Schema: string): Boolean;
function OldEncryptString(s: string; Key: string): string;
function OldDecryptString(s: string; Key: string): string;
function SessionObjectNames(Session: TOraSession; SchemaParam: string; IncludeType: Boolean = False): TStringList;
function GetHistoryFile: string;
procedure SetGridColumnWidths(Grid: TBCDBGrid; OnlyVisibleColumns: Boolean = False);
procedure GridDrawStringDataCell(Column: TColumnEh; var Params: TColCellParamsEh);
function FormatServer(Server: string): string;
function FormatSchema(Schema: string): string;
function GetAlterConstraintSQL(SchemaParam: string; TableName: string; ConstraintName: string; EnableConstraint: Boolean): string;
procedure AlterConstraint(OraSession: TOraSession; SchemaParam: string; TableName: string; ConstraintName: string; EnableConstraint: Boolean);
procedure AlterSelectedConstraints(OraSession: TOraSession; SchemaParam: string; TableName: string; Grid: TBCDBGrid; EnableConstraint: Boolean);
procedure DropConstraint(OraSession: TOraSession; SchemaParam: string; TableName: string; ConstraintName: string);
procedure DropSelectedConstraints(OraSession: TOraSession; SchemaParam: string; TableName: string; Grid: TBCDBGrid);
procedure AlterAllConstraints(OraSession: TOraSession; SchemaParam: string; EnableConstraint: Boolean);
procedure AlterObjectConstraints(OraSession: TOraSession; SchemaParam: string; ObjectName: string; EnableConstraint: Boolean);
function GetAlterTriggerSQL(SchemaParam: string; TriggerName: string; EnableTrigger: Boolean): string;
procedure AlterTrigger(OraSession: TOraSession; SchemaParam: string; TriggerName: string; EnableTrigger: Boolean);
procedure AlterSelectedTriggers(OraSession: TOraSession; SchemaParam: string; Grid: TBCDBGrid; EnableTrigger: Boolean);
procedure DropTrigger(OraSession: TOraSession; SchemaParam: string; TriggerName: string);
procedure DropSelectedTriggers(OraSession: TOraSession; SchemaParam: string; Grid: TBCDBGrid);
procedure RevokeGrant(OraSession: TOraSession; Privilege: string; SchemaParam: string; ObjectName: string; Grantee: string);
procedure RevokeSelectedGrants(OraSession: TOraSession; SchemaParam: string; ObjectName: string; Grid: TBCDBGrid);
procedure DropSynonym(OraSession: TOraSession; SynonymOwner: string; SynonymName: string);
procedure DropSelectedSynonyms(OraSession: TOraSession; Grid: TBCDBGrid);
procedure AlterAllTriggers(OraSession: TOraSession; SchemaParam: string; EnableConstraint: Boolean);
procedure AlterObjectTriggers(OraSession: TOraSession; SchemaParam: string; ObjectName: string; EnableConstraint: Boolean);
procedure CopyDataFromDBGridToClipboard(DBGrid: TBCDBGrid);
function Lpad(Text: string; TextLength: Integer): string;
procedure SaveSQL(Handle: HWND; SynEdit: TSynEdit);
procedure CopyAllToClipboard(SynEdit: TSynEdit);
function TrimToMaxLength(Text: WideString; MaxLength: Integer): WideString;
procedure AddAllFields(DataSet: TDataset);
procedure MoveGridRowDown(OraQuery: TOraQuery);
procedure MoveGridRowUp(OraQuery: TOraQuery);
procedure MoveStringGridRow(Grid: TBCStringGrid; Direction: Integer);
function GetServerlist: TStringlist;
function GetTableOrViewComment(OraSession: TOraSession; SchemaParam: string; ObjectName: string): WideString;
procedure ExecuteActionFromList(ActionList: TActionList; Action: string);
procedure SetSession(Form: TForm; OraSession: TOraSession);
function GetObjectFilterNames(ObjectTypeParam: string; SchemaNameParam: string): TStrings;
function GetObjectFilterKeyValue(ObjectType: string; Name: string; SchemaName: string): string;
function GetFilterObjectsFromIni(KeyValue: string): string;
function GetFilterObjectType(Index: Integer): string;
function GetFilterObjectIndex(ObjectType: string): Integer;
function GetSQLFormat(OraSession: TOraSession; DateFormat: string): string;
function GetCreationAndModificationTimestamp(OraSession: TOraSession; SchemaParam: string; ObjectName: string): WideString;

implementation

uses
  System.SysUtils, Vcl.Dialogs, Vcl.Clipbrd, OraServices, DataModule, BigINI, BCCommon.FileUtils, Vcl.Graphics,
  Math, BCCommon.Dialogs, BCCommon.LanguageStrings, BCCommon.Messages, BCCommon.Lib, BCCommon.StringUtils, Vcl.Themes;

const
  Codes64 = '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz+/';
  //C1 = 52845;
  //C2 = 22719;
  CONSTRAINT_NAME = 'Constraint Name';
  TRIGGER_NAME = 'Trigger Name';
  { GrantsQuery columns }
  GRANTEE = 'Granted To';
  PRIVILEGE = 'Privilege';
  { SynonymsQuery columns }
  SYNONYM_OWNER = 'Synonym Owner';
  SYNONYM_NAME = 'Synonym Name';

function AskCommit(Schema: string): Boolean;
begin
  Result := MessageDialog(Format('The session ''%s'' has pending transaction. Do you want to commit or rollback?', [Schema]),
    mtConfirmation, [mbYes, mbNo], ['Commit', 'Rollback']) = mrYes;
end;

function CreateRandomString(s: string; Count: Integer): string;
var
  i, x: integer;
begin
  Result := '';
  for i := 0 to Count - 1 do
  begin
    x := Length(s) - Random(Length(s));
    Result := Result + s[x];
    s := Copy(s, 1,x - 1) + Copy(s, x + 1,Length(s));
  end;
end;

function OldEncryptString(s: string; Key: string): string;
var
  i, x: integer;
  s1, s2, ss: string;
begin
  Result := '';
  if Length(Key) < 16 then
    Exit;
  for i := 1 to Length(Key) do
  begin
    s1 := Copy(Key, i + 1,Length(Key));
    if Pos(Key[i], s1) > 0 then
      Exit;
    if Pos(Key[i], Codes64) <= 0 then
      Exit;
  end;
  s1 := Codes64;
  s2 := '';
  for i := 1 to Length(Key) do
  begin
    x := Pos(Key[i], s1);
    if x > 0 then
      s1 := Copy(s1, 1,x - 1) + Copy(s1, x + 1,Length(s1));
  end;
  ss := Key;
  for i := 1 to Length(s) do
  begin
    s2 := s2 + ss[Ord(s[i]) mod 16 + 1];
    ss := Copy(ss, Length(ss), 1) + Copy(ss, 1,Length(ss) - 1);
    s2 := s2 + ss[Ord(s[i]) div 16 + 1];
    ss := Copy(ss, Length(ss), 1) + Copy(ss, 1,Length(ss) - 1);
  end;
  Result := CreateRandomString(s1, Random(5) + 1);
  for i := 1 to Length(s2) do
    Result := Result + s2[i] + CreateRandomString(s1, Random(5));
end;

function OldDecryptString(s: string; Key: string): string;
var
  i, x, x2: integer;
  s1, s2, ss: string;
begin
  Result := '';
  if Length(Key) < 16 then
    Exit;
  for i := 1 to Length(Key) do
  begin
    s1 := Copy(Key, i + 1,Length(Key));
    if Pos(Key[i], s1) > 0 then
      Exit;
    if Pos(Key[i], Codes64) <= 0 then
      Exit;
  end;
  s1 := Codes64;
  s2 := '';
  ss := Key;
  for i := 1 to Length(s) do
    if Pos(s[i], ss) > 0 then
      s2 := s2 + s[i];
  s := s2;
  s2   := '';
  if Length(s) mod 2 <> 0 then
    Exit;
  for i := 0 to Length(s) div 2 - 1 do
  begin
    x := Pos(s[i * 2 + 1], ss) - 1;
    if x < 0 then
      Exit;
    ss := Copy(ss, Length(ss), 1) + Copy(ss, 1,Length(ss) - 1);
    x2 := Pos(s[i * 2 + 2], ss) - 1;
    if x2 < 0 then
      Exit;
    x  := x + x2 * 16;
    s2 := s2 + chr(x);
    ss := Copy(ss, Length(ss), 1) + Copy(ss, 1,Length(ss) - 1);
  end;
  Result := s2;
end;

function SessionObjectNames(Session: TOraSession; SchemaParam: string; IncludeType: Boolean = False): TStringList;
var
  s: string;
  OraQuery: TOraQuery;
begin
  Result := TStringList.Create;
  Screen.Cursor := crSQLWait;
  OraQuery := TOraQuery.Create(nil);
  OraQuery.Session := Session;
  OraQuery.SQL.Add(DM.StringHolder.StringsByName['HighlighterObjectsSQL'].Text);
  with OraQuery do
  try
    ParamByName('P_OWNER').AsWideString := SchemaParam;
    Prepare;
    Open;
    while not Eof do
    begin
      s := '';
      if IncludeType then
        s := FieldByName('TYPE').AsWideString + ': ' + LowerCase(FieldByName('NAME').AsWideString)
      else
        s := FieldByName('NAME').AsWideString;
      Result.Add(s);
      Next;
    end;
  finally
    Close;
    UnPrepare;
    FreeAndNil(OraQuery);
    Screen.Cursor := crDefault;
  end;
end;

function GetHistoryFile: string;
begin
  Result := ExtractFilePath(Application.ExeName) + 'sqlhistory.log';
end;

procedure SetGridColumnWidths(Grid: TBCDBGrid; OnlyVisibleColumns: Boolean);
const
  DEFBORDER = 10;
var
  temp, n, i, RCount: Integer;
  lmax: array of Integer;
  Text: string;
begin
  if not Grid.DataSource.DataSet.Active then
    Exit;

  Application.ProcessMessages;
  Screen.Cursor := crHourGlass;
  with Grid do
  begin
    Canvas.Font := Font;
    SetLength(lmax, Columns.Count);
    for n := 0 to Columns.Count - 1 do
      lmax[n] := Canvas.TextWidth(Columns[n].FieldName) + DEFBORDER;

    Grid.DataSource.DataSet.DisableControls;
    Grid.DataSource.DataSet.First;

    if OnlyVisibleColumns then
      RCount := Min(Grid.RowCount, 10)
    else
      RCount := Grid.DataSource.DataSet.RecordCount;

    for i := 0 to RCount do
    begin
      for n := 0 to Columns.Count - 1 do
      begin
        if (Columns[n].Field.DataType = ftOraBlob) or (Columns[n].Field.DataType = ftBlob) then
          Continue
        else
        begin
          Text := Trim(Columns[n].Field.AsWideString);
          if Columns[n].Field.DataType = ftOraClob then
            Text := Trim(Copy(Columns[n].Field.AsWideString, 1, 50));

          if (Columns[n].Field.DataType <> ftVarBytes) then
          begin
            temp := Canvas.TextWidth(Text) + DEFBORDER;
            if temp > lmax[n] then
              lmax[n] := temp;
          end;
        end;
      end; {for}
      Grid.DataSource.DataSet.Next;
    end;
    Grid.DataSource.DataSet.First;
    Grid.DataSource.DataSet.EnableControls;
    for n := 0 to Columns.Count - 1 do
      if lmax[n] > 0 then
        Columns[n].Width := lmax[n];
  end;
  Screen.Cursor := crDefault;
end; {SetGridColumnWidths  }

procedure GridDrawStringDataCell(Column: TColumnEh; var Params: TColCellParamsEh);
var
  S: string;
begin
  if (Column.Field is TStringField) or (Column.Field is TWideMemoField) then
  begin
    S := Params.Text;
    while Pos(#13, S) > 0 do
      S[Pos(#13, S)] := '|';
    while Pos(#10, S) > 0 do
      S[Pos(#10, S)] := '|';
    Params.Text := S;
  end;
end;

function FormatServer(Server: string): string;
begin
  Result := UpperCase(Server);
  while Pos(':', Result) <> 0 do
    Delete(Result, 1, Pos(':', Result));

  if Pos('=', Result) <> 0 then
    Result := Copy(Result, Pos('=', Result) + 1, Length(Result));
end;

function FormatSchema(Schema: string): string;
var
  s: string;
begin
  Result := Copy(Schema, 0, Pos('@', Schema));
  s := Copy(Schema, Pos('@', Schema) + 1, Length(Schema));
  Result := Result + FormatServer(s);
end;

function GetAlterConstraintSQL(SchemaParam: string; TableName: string; ConstraintName: string; EnableConstraint: Boolean): string;
var
  Action, Cascade: string;
begin
  Cascade := '';
  if EnableConstraint then
    Action := 'ENABLE'
  else
  begin
    Action := 'DISABLE';
    Cascade := 'CASCADE';
  end;
  Result := Trim(Format('ALTER TABLE %s.%s %s CONSTRAINT %s %s', [SchemaParam, TableName, Action, ConstraintName, Cascade]));
end;

procedure AlterConstraint(OraSession: TOraSession; SchemaParam: string; TableName: string; ConstraintName: string; EnableConstraint: Boolean);
begin
  try
    OraSession.ExecSQL(GetAlterConstraintSQL(SchemaParam, TableName, ConstraintName, EnableConstraint), []);
  except
    on E: Exception do
      ShowErrorMessage(E.message);
  end;
end;

procedure AlterSelectedConstraints(OraSession: TOraSession; SchemaParam: string; TableName: string; Grid: TBCDBGrid; EnableConstraint: Boolean);
var
  i: Integer;
begin
  with Grid do
  if SelectedRows.Count > 0 then
  begin
     DataSource.DataSet.DisableControls();
     try
       for i := 0 to SelectedRows.Count - 1 do
       begin
         Datasource.DataSet.GotoBookmark(Pointer(SelectedRows[i]));
         AlterConstraint(OraSession, SchemaParam, TableName, Datasource.DataSet.FieldByName(CONSTRAINT_NAME).AsString, EnableConstraint);
       end;
     finally
       DataSource.DataSet.EnableControls();
       Datasource.DataSet.Refresh;
     end;
  end;
end;

procedure DropConstraint(OraSession: TOraSession; SchemaParam: string; TableName: string; ConstraintName: string);
begin
  try
    if AskYesOrNo(Format('Drop constraint %s, are you sure?', [ConstraintName])) then
      OraSession.ExecSQL(Format('ALTER TABLE %s.%s DROP CONSTRAINT %s', [SchemaParam, TableName, ConstraintName]), []);
  except
    on E: Exception do
      ShowErrorMessage(E.message);
  end;
end;

procedure DropSelectedConstraints(OraSession: TOraSession; SchemaParam: string; TableName: string; Grid: TBCDBGrid);
var
  i: Integer;
begin
  with Grid do
  if SelectedRows.Count > 0 then
  begin
     DataSource.DataSet.DisableControls();
     try
       for i := 0 to SelectedRows.Count - 1 do
       begin
         Datasource.DataSet.GotoBookmark(Pointer(SelectedRows[i]));
         DropConstraint(OraSession, SchemaParam, TableName, Datasource.DataSet.FieldByName(CONSTRAINT_NAME).AsString);
       end;
     finally
       DataSource.DataSet.EnableControls();
       Datasource.DataSet.Refresh;
     end;
  end;
end;

procedure AlterAllConstraints(OraSession: TOraSession; SchemaParam: string; EnableConstraint: Boolean);
var
  OraQuery: TOraQuery;
begin
  Screen.Cursor := crSQLWait;
  OraQuery := TOraQuery.Create(nil);
  OraQuery.Session := OraSession;
  OraQuery.SQL.Add(DM.StringHolder.StringsByName['AllConstrainsSQL'].Text);
  with OraQuery do
  try
    ParamByName('P_OWNER').AsWideString := SchemaParam;
    Prepare;
    Open;
    while not Eof do
    begin
      AlterConstraint(OraSession, SchemaParam, FieldByName('TABLE_NAME').AsString, FieldByName('CONSTRAINT_NAME').AsString, EnableConstraint);
      Next;
    end;
  finally
    Close;
    UnPrepare;
    FreeAndNil(OraQuery);
    Screen.Cursor := crDefault;
  end;
end;

procedure AlterObjectConstraints(OraSession: TOraSession; SchemaParam: string; ObjectName: string; EnableConstraint: Boolean);
var
  OraQuery: TOraQuery;
begin
  Screen.Cursor := crSQLWait;
  OraQuery := TOraQuery.Create(nil);
  OraQuery.Session := OraSession;
  OraQuery.SQL.Add(DM.StringHolder.StringsByName['ObjectConstraintsSQL'].Text);
  with OraQuery do
  try
    ParamByName('P_OWNER').AsString := SchemaParam;
    ParamByName('P_OBJECT_NAME').AsString := ObjectName;
    Prepare;
    Open;
    while not Eof do
    begin
      AlterConstraint(OraSession, SchemaParam, FieldByName('TABLE_NAME').AsString, FieldByName('CONSTRAINT_NAME').AsString, EnableConstraint);
      Next;
    end;
  finally
    Close;
    UnPrepare;
    FreeAndNil(OraQuery);
    Screen.Cursor := crDefault;
  end;
end;

function GetAlterTriggerSQL(SchemaParam: string; TriggerName: string; EnableTrigger: Boolean): string;
var
  Action: string;
begin
  if EnableTrigger then
    Action := 'ENABLE'
  else
    Action := 'DISABLE';
  Result := Format('ALTER TRIGGER %s.%s %s', [SchemaParam, TriggerName, Action]);
end;

procedure AlterTrigger(OraSession: TOraSession; SchemaParam: string; TriggerName: string; EnableTrigger: Boolean);
begin
  try
    OraSession.ExecSQL(GetAlterTriggerSQL(SchemaParam, TriggerName, EnableTrigger), []);
  except
    on E: Exception do
      ShowErrorMessage(E.message);
  end;
end;

procedure AlterSelectedTriggers(OraSession: TOraSession; SchemaParam: string; Grid: TBCDBGrid; EnableTrigger: Boolean);
var
  i: Integer;
begin
  with Grid do
  if SelectedRows.Count > 0 then
  begin
     DataSource.DataSet.DisableControls();
     try
       for i := 0 to SelectedRows.Count - 1 do
       begin
         Datasource.DataSet.GotoBookmark(Pointer(SelectedRows[i]));
         AlterTrigger(OraSession, SchemaParam, Datasource.DataSet.FieldByName(TRIGGER_NAME).AsString, EnableTrigger);
       end;
     finally
       DataSource.DataSet.EnableControls();
       Datasource.DataSet.Refresh;
     end;
  end;
end;

procedure DropTrigger(OraSession: TOraSession; SchemaParam: string; TriggerName: string);
begin
  try
    if AskYesOrNo(Format('Drop trigger %s.%s, are you sure?', [SchemaParam, TriggerName])) then
      OraSession.ExecSQL(Format('DROP TRIGGER %s.%s', [SchemaParam, TriggerName]), []);
  except
    on E: Exception do
      ShowErrorMessage(E.message);
  end;
end;

procedure DropSelectedTriggers(OraSession: TOraSession; SchemaParam: string; Grid: TBCDBGrid);
var
  i: Integer;
begin
  with Grid do
  if SelectedRows.Count > 0 then
  begin
     DataSource.DataSet.DisableControls();
     try
       for i := 0 to SelectedRows.Count - 1 do
       begin
         Datasource.DataSet.GotoBookmark(Pointer(SelectedRows[i]));
         DropTrigger(OraSession, SchemaParam, Datasource.DataSet.FieldByName(TRIGGER_NAME).AsString);
       end;
     finally
       DataSource.DataSet.EnableControls();
       Datasource.DataSet.Refresh;
     end;
  end;
end;

procedure RevokeGrant(OraSession: TOraSession; Privilege: string; SchemaParam: string; ObjectName: string; Grantee: string);
begin
  try
    if AskYesOrNo(Format('Revoke privilege %s, are you sure?', [Privilege])) then
      OraSession.ExecSQL(Format('REVOKE %s ON %s.%s FROM %s', [SchemaParam, Privilege, ObjectName, Grantee]), []);
  except
    on E: Exception do
      ShowErrorMessage(E.message);
  end;
end;

procedure RevokeSelectedGrants(OraSession: TOraSession; SchemaParam: string; ObjectName: string; Grid: TBCDBGrid);
var
  i: Integer;
begin
  with Grid do
  if SelectedRows.Count > 0 then
  begin
     DataSource.DataSet.DisableControls();
     try
       for i := 0 to SelectedRows.Count - 1 do
       begin
         Datasource.DataSet.GotoBookmark(Pointer(SelectedRows[i]));
         RevokeGrant(OraSession, SchemaParam, Datasource.DataSet.FieldByName(PRIVILEGE).AsString, ObjectName,
           Datasource.DataSet.FieldByName(GRANTEE).AsString);
       end;
     finally
       DataSource.DataSet.EnableControls();
       Datasource.DataSet.Refresh;
     end;
  end;
end;

procedure DropSynonym(OraSession: TOraSession; SynonymOwner: string; SynonymName: string);
var
  SynonymAvailability: string;
begin
  try
    if AskYesOrNo(Format('Drop synonym %s, are you sure?', [SynonymName])) then
    begin
      if SynonymOwner = 'PUBLIC' then
        SynonymAvailability := 'PUBLIC ';
      OraSession.ExecSQL(Format('DROP %sSYNONYM %s', [SynonymAvailability, SynonymName]), []);
    end;
  except
    on E: Exception do
      ShowErrorMessage(E.message);
  end;
end;

procedure DropSelectedSynonyms(OraSession: TOraSession; Grid: TBCDBGrid);
var
  i: Integer;
begin
  with Grid do
  if SelectedRows.Count > 0 then
  begin
     DataSource.DataSet.DisableControls();
     try
       for i := 0 to SelectedRows.Count - 1 do
       begin
         Datasource.DataSet.GotoBookmark(Pointer(SelectedRows[i]));
         DropSynonym(OraSession, Datasource.DataSet.FieldByName(SYNONYM_OWNER).AsString,
           Datasource.DataSet.FieldByName(SYNONYM_NAME).AsString);
       end;
     finally
       DataSource.DataSet.EnableControls();
       Datasource.DataSet.Refresh;
     end;
  end;
end;

procedure AlterAllTriggers(OraSession: TOraSession; SchemaParam: string; EnableConstraint: Boolean);
var
  OraQuery: TOraQuery;
begin
  Screen.Cursor := crSQLWait;
  OraQuery := TOraQuery.Create(nil);
  OraQuery.Session := OraSession;
  OraQuery.SQL.Add(DM.StringHolder.StringsByName['AllTriggersSQL'].Text);

  with OraQuery do
  try
    ParamByName('P_OWNER').AsWideString := SchemaParam;
    Prepare;
    Open;
    while not Eof do
    begin
      AlterTrigger(OraSession, SchemaParam, FieldByName('TRIGGER_NAME').AsString, EnableConstraint);
      Next;
    end;
  finally
    Close;
    UnPrepare;
    FreeAndNil(OraQuery);
    Screen.Cursor := crDefault;
  end;
end;

procedure AlterObjectTriggers(OraSession: TOraSession; SchemaParam: string; ObjectName: string; EnableConstraint: Boolean);
var
  OraQuery: TOraQuery;
begin
  Screen.Cursor := crSQLWait;
  OraQuery := TOraQuery.Create(nil);
  OraQuery.Session := OraSession;
  OraQuery.SQL.Add(DM.StringHolder.StringsByName['ObjectTriggersSQL'].Text);

  with OraQuery do
  try
    ParamByName('P_OWNER').AsWideString := SchemaParam;
    ParamByName('P_OBJECT_NAME').AsWideString := ObjectName;
    Prepare;
    Open;
    while not Eof do
    begin
      AlterTrigger(OraSession, SchemaParam, FieldByName('TRIGGER_NAME').AsString, EnableConstraint);
      Next;
    end;
  finally
    Close;
    UnPrepare;
    FreeAndNil(OraQuery);
    Screen.Cursor := crDefault;
  end;
end;

procedure CopyDataFromDBGridToClipboard(DBGrid: TBCDBGrid);
var
  i, j: Integer;
  s: WideString;
begin
  if DBGrid.EditorMode then
  begin
    Clipboard.AsText := DBGrid.DataSource.DataSet.FieldByName(DBGrid.Columns.Items[DBGrid.SelectedIndex].FieldName).AsWideString;
    Exit;
  end;
  s := '';
  with DBGrid do
  begin
    DataSource.DataSet.DisableControls();
    try
      { header }
      for j := 0 to DBGrid.Columns.Count - 1 do
        s := s + DBGrid.Columns.Items[j].FieldName + ';';
      s := s + CHR_ENTER;
      { data }
      for i := 0 to DBGrid.SelectedRows.Count - 1 do
      begin
        Datasource.DataSet.GotoBookmark(Pointer(SelectedRows[i]));
        for j := 0 to DBGrid.Columns.Count - 1 do
          s := s + DataSource.DataSet.FieldByName(DBGrid.Columns.Items[j].FieldName).AsWideString + ';';
        s := s + CHR_ENTER;
      end;
    finally
      DataSource.DataSet.EnableControls();
      Clipboard.AsText := s;
    end;
  end;
end;

function Lpad(Text: string; TextLength: Integer): string;
var
  i: Integer;
begin
  Result := Text;
  if TextLength < 0 then
    Exit;
  Result := Copy(Text, 0, TextLength);
  for i := 0 to TextLength - Length(Text) - 1 do
    Result := Result + ' ';
end;

procedure SaveSQL(Handle: HWND; SynEdit: TSynEdit);
var
  FilterIndex: Cardinal;
begin
  if BCCommon.Dialogs.SaveFile(Handle, '', 'SQL Files (*.sql)'#0'*.sql'#0#0, LanguageDataModule.GetConstant('SaveAs'), FilterIndex, '', 'sql') then
  begin
    Application.ProcessMessages; { style fix }
    SynEdit.Lines.SaveToFile(BCCommon.Dialogs.Files[0]);
  end;
end;

procedure CopyAllToClipboard(SynEdit: TSynEdit);
begin
  SynEdit.SelectAll;
  SynEdit.CopyToClipboard;
  SynEdit.SelEnd := 0;
  SynEdit.CaretY := 0;
end;

function TrimToMaxLength(Text: WideString; MaxLength: Integer): WideString;
var
  i, j: Integer;
begin
  Result := Trim(Text);
  j := MaxLength - Length(Result);
  for i := 0 to j do
    Result := Result + ' ';
end;

procedure AddAllFields(DataSet: TDataset);
var
  FieldsList: TStringList;
  FieldName: WideString;
  Field: TField;
  WasActive: boolean;
  FieldDef: TFieldDef;
  i: Integer;
begin
  WasActive := DataSet.Active;
  if WasActive then
    DataSet.Active := False;
  try
    FieldsList := TStringList.Create;
    try
      DataSet.Fields.Clear;
      DataSet.FieldDefs.Update;
      // make a list of all the field names that aren't already on the DataSet
      for i := 0 to DataSet.FieldDefList.Count - 1 do
        with DataSet.FieldDefList[i] do
        if (FieldClass <> nil) and not(faHiddenCol in Attributes) then
        begin
          FieldName := DataSet.FieldDefList.Strings[i];
          Field := DataSet.FindField(FieldName);
          if not Assigned(Field) or (Field.Owner <> DataSet.Owner) then
            FieldsList.Add(FieldName);
        end;

      // add those fields to the dataset
      for i := 0 to FieldsList.Count - 1 do
      begin
        FieldDef := DataSet.FieldDefList.FieldByName(FieldsList[i]);
        FieldDef.CreateField(DataSet.Owner, nil, FieldsList[i], False);
      end;
    finally
      FieldsList.Free;
    end;
  finally
   if WasActive then
     DataSet.Active := True;
  end;
end;

procedure MoveGridRowDown(OraQuery: TOraQuery);
var
  i: Integer;
  CurrentDBGridRec, NextDBGridRec: array of Variant;
begin
  with OraQuery do
  try
    DisableControls;
    Next;
    if not Eof then
      Prior
    else
      Exit;
    SetLength(CurrentDBGridRec, FieldCount);
    SetLength(NextDBGridRec, FieldCount);

    for i := 0 to FieldCount - 1 do
      CurrentDBGridRec[i] := Fields[i].Value;
    Next;
    for i := 0 to FieldCount - 1 do
      NextDBGridRec[i] := Fields[i].Value;
    Edit;
    for i := 0 to FieldCount - 1 do
      Fields[i].Value := CurrentDBGridRec[i];
    Prior;
    Edit;
    for i := 0 to FieldCount - 1 do
      Fields[i].Value := NextDBGridRec[i];
    Next;
  finally
    EnableControls;
    CurrentDBGridRec := nil;
    NextDBGridRec := nil;
  end;
end;

procedure MoveGridRowUp(OraQuery: TOraQuery);
var
  i: Integer;
  CurrentDBGridRec, NextDBGridRec: array of Variant;
  AfterScrollTemp: TDataSetNotifyEvent;
begin
  with OraQuery do
  try
    DisableControls;
    AfterScrollTemp := AfterScroll;
    AfterScroll := nil;
    Prior;
    if not Bof then
      Next
    else
      Exit;
    SetLength(CurrentDBGridRec, FieldCount);
    SetLength(NextDBGridRec, FieldCount);

    for i := 0 to FieldCount - 1 do
      CurrentDBGridRec[i] := Fields[i].Value;
    Prior;
    for i := 0 to FieldCount - 1 do
      NextDBGridRec[i] := Fields[i].Value;
    Edit;
    for i := 0 to FieldCount - 1 do
      Fields[i].Value := CurrentDBGridRec[i];
    Next;
    Edit;
    for i := 0 to FieldCount - 1 do
      Fields[i].Value := NextDBGridRec[i];
    Prior;
    AfterScroll := AfterScrollTemp;
  finally
    EnableControls;
    CurrentDBGridRec := nil;
    NextDBGridRec := nil;
  end;
end;

procedure MoveStringGridRow(Grid: TBCStringGrid; Direction: Integer);
begin
  if Direction > 0 then
    if Grid.Row + 1 = Grid.RowCount then
      Exit;

  if Direction < 0 then
    if Grid.Row - 1 = 0 then
      Exit;

  Grid.Cols[0].Exchange(Grid.Row + Direction, Grid.Row);
  Grid.Cols[1].Exchange(Grid.Row + Direction, Grid.Row);
  Grid.Row := Grid.Row + Direction;
end;

function GetServerlist: TStringlist;
var
  i: Integer;
  Enum: TOraServerEnumerator;
begin
  Result := TStringList.Create;
  Enum := TOraServerEnumerator.Create;
  try
    Enum.GetServerList(Result);
  finally
    Enum.Free;
  end;
  Result.Sort;
  for i := 0 to Result.Count - 1 do
    if Pos('.WORLD', Result.Strings[i]) <> 0 then
      Result.Strings[i] := StringReplace(Result.Strings[i], '.WORLD', '', [rfIgnoreCase]);
end;

function GetTableOrViewComment(OraSession: TOraSession; SchemaParam: string; ObjectName: string): WideString;
var
  OraQuery: TOraQuery;
begin
  OraQuery := TOraQuery.Create(nil);
  OraQuery.Session := OraSession;
  OraQuery.SQL.Add(DM.StringHolder.StringsByName['TableOrViewCommentsSQL'].Text);
  with OraQuery do
  try
    ParamByName('P_OWNER').AsWideString := SchemaParam;
    ParamByName('P_TABLE_NAME').AsWideString := ObjectName;
    Prepare;
    Open;
    Result := FieldByName('COMMENTS').AsWideString;
  finally
    Close;
    UnPrepare;
    FreeAndNil(OraQuery);
  end;
end;

procedure ExecuteActionFromList(ActionList: TActionList; Action: string);
var
  i: Integer;
begin
  for i := 0 to ActionList.ActionCount - 1 do
    if ActionList.Actions[i].Name = Action then
    begin
      ActionList.Actions[i].Execute;
      Exit;
    end;
end;

procedure SetSession(Form: TForm; OraSession: TOraSession);
var
  i: Integer;
begin
  for i := 0 to Form.ComponentCount - 1 do
    if Form.Components[i] is TOraQuery then
      TOraQuery(Form.Components[i]).Session := OraSession;
end;

function GetObjectFilterNames(ObjectTypeParam: string; SchemaNameParam: string): TStrings;
var
  i: Integer;
  Objects: TStrings;
  s, ObjectType, CustomizeName, SchemaName: string;
begin
  Objects := TStringList.Create;
  Result := TStringList.Create;
  Screen.Cursor := crHourglass;
  { Read objects from ini - object type;name;schema@server=object;object;...}
  with TBigIniFile.Create(GetINIFilename) do
  try
    { read string }
    ReadSectionValues('SchemaObjectFilters', Objects);
    for i := 0 to Objects.Count - 1 do
    begin
      s := DecryptString(System.Copy(Objects.Strings[i], 0, Pos('=', Objects.Strings[i]) - 1));
      ObjectType := Copy(s, 1, Pos(';', s) - 1);
      s := Copy(s, Pos(';', s) + 1, Length(s));
      CustomizeName := Copy(s, 1, Pos(';', s) - 1);
      s := Copy(s, Pos(';', s) + 1, Length(s));
      SchemaName := s;
      if (ObjectTypeParam = ObjectType) and (SchemaNameParam = SchemaName) then
        Result.Add(CustomizeName);
    end;
  finally
    Objects.Free;
    Free;
    Screen.Cursor := crDefault;
  end;
end;

{ KeyValue: object type;name;schema@server }
function GetObjectFilterKeyValue(ObjectType: string; Name: string; SchemaName: string): string;
begin
  Result := Format('%s;%s;%s', [ObjectType, Name, SchemaName]);
end;

function GetFilterObjectsFromIni(KeyValue: string): string;
var
  i: Integer;
  SchemaObjectFilters: TStrings;
begin
  Result := '';
  { Read objects from ini - object type;name;schema@server=object;object;...}
  SchemaObjectFilters := TStringList.Create;
  Screen.Cursor := crHourglass;
  with TBigIniFile.Create(GetINIFilename) do
  try
    { read string }
    ReadSectionValues('SchemaObjectFilters', SchemaObjectFilters);
    for i := 0 to SchemaObjectFilters.Count - 1 do
      if KeyValue = DecryptString(System.Copy(SchemaObjectFilters.Strings[i], 0, Pos('=', SchemaObjectFilters.Strings[i]) - 1)) then
      begin
        Result := DecryptString(ReadString('SchemaObjectFilters', System.Copy(SchemaObjectFilters.Strings[i], 0, Pos('=', SchemaObjectFilters.Strings[i]) - 1), ''));
        Break;
      end;
  finally
    SchemaObjectFilters.Free;
    Free;
    Screen.Cursor := crDefault;
  end;
end;

function GetFilterObjectType(Index: Integer): string;
begin
  Result := '';
  if Index = 0 then
    Result := OBJECT_TYPE_TABLE
  else
  if Index = 1 then
    Result := OBJECT_TYPE_VIEW
  else
  if Index = 2 then
    Result := OBJECT_TYPE_FUNCTION
  else
  if Index = 3 then
    Result := OBJECT_TYPE_PROCEDURE
  else
  if Index = 4 then
    Result := OBJECT_TYPE_PACKAGE
  else
  if Index = 5 then
    Result := OBJECT_TYPE_TRIGGER
  else
  if Index = 6 then
    Result := OBJECT_TYPE_CONSTRAINT
  else
  if Index = 7 then
    Result := OBJECT_TYPE_INDEX
  else
  if Index = 8 then
    Result := OBJECT_TYPE_SEQUENCE
  else
  if Index = 9 then
    Result := OBJECT_TYPE_SYNONYM
  else
  if Index = 10 then
    Result := OBJECT_TYPE_DATABASE_LINK
  else
  if Index = 11 then
    Result := OBJECT_TYPE_USER
end;

function GetFilterObjectIndex(ObjectType: string): Integer;
begin
  Result := -1;
  if ObjectType = OBJECT_TYPE_TABLE then
    Result := 0
  else
  if ObjectType = OBJECT_TYPE_VIEW then
    Result := 1
  else
  if ObjectType = OBJECT_TYPE_FUNCTION then
    Result := 2
  else
  if ObjectType = OBJECT_TYPE_PROCEDURE then
    Result := 3
  else
  if ObjectType = OBJECT_TYPE_PACKAGE then
    Result := 4
  else
  if ObjectType = OBJECT_TYPE_TRIGGER then
    Result := 5
  else
  if ObjectType = OBJECT_TYPE_CONSTRAINT then
    Result := 6
  else
  if ObjectType = OBJECT_TYPE_INDEX then
    Result := 7
  else
  if ObjectType = OBJECT_TYPE_SEQUENCE then
    Result := 8
  else
  if ObjectType = OBJECT_TYPE_SYNONYM then
    Result := 9
  else
  if ObjectType = OBJECT_TYPE_DATABASE_LINK then
    Result := 10
  else
  if ObjectType = OBJECT_TYPE_USER then
    Result := 11
end;

function GetSQLFormat(OraSession: TOraSession; DateFormat: string): string;
var
  OraQuery: TOraQuery;
begin
  OraQuery := TOraQuery.Create(nil);
  with OraQuery do
  begin
    Session := OraSession;
    SQL.Add(Format(DM.StringHolder.StringsByName['DateFromDualSQL'].Text, [DateFormat]));
    Open;
    Result := FieldByName('TEXT').AsString;
    Close;
  end;
  FreeAndNil(OraQuery);
end;

function GetCreationAndModificationTimestamp(OraSession: TOraSession; SchemaParam: string; ObjectName: string): WideString;
var
  OraQuery: TOraQuery;
begin
  OraQuery := TOraQuery.Create(nil);
  OraQuery.Session := OraSession;
  OraQuery.SQL.Add(DM.StringHolder.StringsByName['CreationAndModificationTimestampSQL'].Text);
  with OraQuery do
  try
    ParamByName('OWNER').AsWideString := SchemaParam;
    ParamByName('OBJECT').AsWideString := ObjectName;
    Prepare;
    Open;
    Result := Format('Created: %s - Modified: %s', [FieldByName('CREATED').AsWideString, FieldByName('LAST_DDL_TIME').AsWideString]);
  finally
    Close;
    UnPrepare;
    FreeAndNil(OraQuery);
  end;
end;

end.
