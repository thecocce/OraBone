unit Common;

{$WARN SYMBOL_PLATFORM OFF}

interface

uses
  Vcl.StdCtrls, Winapi.Windows, Winapi.Messages, Ora, System.Classes, DB, JvDBGrid, Vcl.Forms,
  SynEdit, Vcl.Controls, BCComboBox, BCStringGrid, ActnList, ComCtrls;

//type
//  TWordTriple = Array[0..2] of Word;

const
  CHR_ENTER = Chr(13) + Chr(10);
  OLD_CRYPT_KEY = '0129ABCDEFGHIJKQRSTUbcdijklmnstxyz';
  CAPTION_ERRORS = 'Errors';

  { Sql editor output }
  IMAGE_INDEX_FIND_IN_FILES = 0;
  IMAGE_INDEX_ERRORS = 1;
  IMAGE_INDEX_GRID = 2;
  IMAGE_INDEX_OUTPUT = 3;
  IMAGE_INDEX_PLAN = 4;
  { Main }
  IMAGE_INDEX_DBMS_OUTPUT_UP = 44;
  IMAGE_INDEX_DBMS_OUTPUT_DOWN = 45;
  IMAGE_INDEX_REFRESH = 34;
  IMAGE_INDEX_SCHEMA_BROWSER = 32;
  IMAGE_INDEX_SQL_EDITOR = 21;
  IMAGE_INDEX_SQL_HISTORY = 46;
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
  (*TOutputObject = class
    Filename: string;
    Ln, Ch: Integer;
    Text: string;
  end;*)
  POutputRec = ^TOutputRec;
  TOutputRec = packed record
    Level: Byte;
    Filename: string;
    Ln: LongWord;
    Ch: LongWord;
    TextCh: LongWord;
    Text: ShortString;
    SearchString: ShortString;
  end;

//  TWordTriple = Array[0..2] of Word;

function BrowseURL(const URL: string): Boolean;
function GetOSInfo: string;
procedure InsertTextToCombo(ComboBox: TBCComboBox);
function AddSlash(Path: string): string;
function StringBetween(Str: string; SubStr1: string; SunStr2: string): string;
function IsAsciiFile(Filename: string): Boolean;
function SaveChanges(IncludeCancel: Boolean = True): Integer;
function AskYesOrNo(Msg: string): Boolean;
function AskCommit(Schema: string): Boolean;
procedure ShowMessage(Msg: string);
procedure ShowErrorMessage(Msg: string);
procedure ShowWarningMessage(Msg: string);
function EncryptString(Data: string): string;
function DecryptString(Data: string): string;
//function EncryptString(s: string; Key: string): string;
//function DecryptString(s: string; Key: string): string;
function OldEncryptString(s: string; Key: string): string;
function OldDecryptString(s: string; Key: string): string;
function SessionObjectNames(Session: TOraSession; SchemaParam: string; IncludeType: Boolean = False): TStringList;
procedure AutoSizeCol(Grid: TBCStringGrid);
function GetHistoryFile: string;
procedure SetGridColumnWidths(Grid: TBCDBGrid; OnlyVisibleColumns: Boolean = False);
procedure GridDrawStringDataCell(Sender: TObject; const Rect: TRect; Field: TField);
function FormatServer(Server: string): string;
function FormatSchema(Schema: string): string;
function StrContains(Str1, Str2: string): Boolean;
function AnsiInitCap(Str: string): string;
function GetAlterConstraintSQL(TableName: string; ConstraintName: string; EnableConstraint: Boolean): string;
procedure AlterConstraint(OraSession: TOraSession; TableName: string; ConstraintName: string; EnableConstraint: Boolean);
procedure AlterSelectedConstraints(OraSession: TOraSession; TableName: string; Grid: TBCDBGrid; EnableConstraint: Boolean);
procedure AlterAllConstraints(OraSession: TOraSession; SchemaParam: string; EnableConstraint: Boolean);
procedure AlterObjectConstraints(OraSession: TOraSession; SchemaParam: string; ObjectName: string; EnableConstraint: Boolean);
function GetAlterTriggerSQL(TriggerName: string; EnableTrigger: Boolean): string;
procedure AlterTrigger(OraSession: TOraSession; TriggerName: string; EnableTrigger: Boolean);
procedure AlterSelectedTriggers(OraSession: TOraSession; Grid: TBCDBGrid; EnableTrigger: Boolean);
procedure AlterAllTriggers(OraSession: TOraSession; SchemaParam: string; EnableConstraint: Boolean);
procedure AlterObjectTriggers(OraSession: TOraSession; SchemaParam: string; ObjectName: string; EnableConstraint: Boolean);
procedure CopyDataFromDBGridToClipboard(DBGrid: TJvDBGrid);
function Lpad(Text: string; TextLength: Integer): string;
procedure SaveSQL(SynEdit: TSynEdit);
procedure CopyAllToClipboard(SynEdit: TSynEdit);
function TrimToMaxLength(Text: WideString; MaxLength: Integer): WideString;
procedure AddAllFields(DataSet: TDataset);
//procedure FocusGridCell(const DBGrid: TDBGrid; const Column: integer);
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
function GetINIFilename: string;
function GetFilterObjectType(Index: Integer): string;
function GetFilterObjectIndex(ObjectType: string): Integer;

implementation

uses
  Registry, ShellAPI, System.SysUtils, Vcl.Dialogs, Clipbrd, Main, OraServices, DataModule, BigINI;

const
  Codes64 = '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz+/';
  //C1 = 52845;
  //C2 = 22719;
  CONSTRAINT_NAME = 'Constraint Name';
  TRIGGER_NAME = 'Trigger Name';

function AnsiInitCap(Str: string): string;
begin
  Result := Concat(AnsiUpperCase(Copy(Str, 1, 1)), AnsiLowerCase(Copy(Str, 2, Length(Str))));
end;

function StringBetween(Str: string; SubStr1: string; SunStr2: string): string;
begin
  Result := Str;
  Result := Copy(Result, Pos(SubStr1, Result) + 1, Length(Result));
  Result := Copy(Result, 1, Pos(SunStr2, Result) - 1);
end;

procedure RunCommand(const Cmd, Params: String);
var
  SI: TStartupInfo;
  PI: TProcessInformation;
  CmdLine: String;
begin
  //Fill record with zero byte values
  FillChar(SI, SizeOf(SI), 0);
  //Set mandatory record field
  SI.cb := SizeOf(SI);
  //Ensure Winapi.Windows mouse cursor reflects launch progress
  SI.dwFlags := StartF_ForceOnFeedback;
  //Set up command line
  CmdLine := Cmd;
  if Length(Params) > 0 then
    CmdLine := CmdLine + #32 + Params;
  //Try and launch child process. Raise exception on failure
  Win32Check(CreateProcess(nil, PChar(CmdLine), nil, nil, False, 0, nil, nil, SI, PI));
  //Wait until process has started its main message loop
  WaitForInputIdle(PI.hProcess, Infinite);
  //Close process and thread handles
  CloseHandle(PI.hThread);
  CloseHandle(PI.hProcess);
end;

function BrowseURL(const URL: string): Boolean;
var
  Browser: string;
begin
  Result := True;
  Browser := '';
  with TRegistry.Create do
  try
    RootKey := HKEY_System.Classes_ROOT;
    Access := KEY_QUERY_VALUE;
    if OpenKey('\htmlfile\shell\open\command', False) then
      Browser := ReadString('');
    CloseKey;
  finally
    Free;
  end;
  if Browser = '' then
  begin
    Result := False;
    Exit;
  end;
  Browser := Copy(Browser, Pos('"', Browser) + 1, Length(Browser));
  Browser := Copy(Browser, 1, Pos('"', Browser) - 1);
  //ShellExecute(0, 'open', PChar(Browser), PChar(URL), nil, SW_SHOW);
  RunCommand(Browser, URL);
end;

function GetOSInfo: string;
var
  OS: TOSVersionInfo;
begin
  OS.dwOSVersionInfoSize := SizeOf(OS);
  GetVersionEx(OS);
  case OS.dwPlatformID of
    VER_PLATFORM_WIN32_Winapi.Windows:
      if (OS.dwMajorVersion = 4) and (OS.dwMinorVersion = 0) then
        Result := Format('Winapi.Windows 95 (Build %d.%d.%d) %s', [OS.dwMajorVersion, OS.dwMinorVersion,
          LoWord(OS.dwBuildNumber), OS.szCSDVersion])
      else if (OS.dwMajorVersion = 4) and (OS.dwMinorVersion = 10) then
        Result := Format('Winapi.Windows 98 (Build %d.%d.%d) %s', [OS.dwMajorVersion, OS.dwMinorVersion,
          LoWord(OS.dwBuildNumber), OS.szCSDVersion]);
    VER_PLATFORM_WIN32_NT:
      if (OS.dwMajorVersion = 5) and (OS.dwMinorVersion = 0) then
        Result := Format('Winapi.Windows 2000 (Build %d) %s', [OS.dwBuildNumber, OS.szCSDVersion])
      else if (OS.dwMajorVersion = 5) and (OS.dwMinorVersion = 1) then
        Result := Format('Winapi.Windows XP (Build %d) %s', [OS.dwBuildNumber, OS.szCSDVersion])
      else
        Result := Format('Winapi.Windows NT %d.%d (Build %d) %s', [OS.dwMajorVersion, OS.dwMinorVersion,
          OS.dwBuildNumber, OS.szCSDVersion])
    else
      Result := Format('Winapi.Windows %d.%d %s', [OS.dwMajorVersion, OS.dwMinorVersion, OS.szCSDVersion]);
  end;
end;

procedure InsertTextToCombo(ComboBox: TBCComboBox);
var
  s: string;
  i: Integer;
begin
  with ComboBox do
  begin
    s := Text;
    if s <> '' then
    begin
      i := Items.IndexOf(s);
      if i > -1 then
      begin
        Items.Delete(i);
        Items.Insert(0, s);
        Text := s;
      end
      else
        Items.Insert(0, s);
    end;
  end;
end;

function AddSlash(Path: string): string;
begin
  if Path = '' then
    exit;
  if Path[Length(Path)] <> '\' then
    Result := Path + '\'
  else
    Result := Path;
end;

function IsAsciiFile(Filename: string): Boolean;
const
  Sett = 2048;
var
  i: Integer;
  F: file;
  TotalSize, IncSize, ReadSize: Integer;
  c: array[0..Sett] of Byte;
begin
  {$I-}
  try
    AssignFile(F, Filename);
    Reset(F, 1);
    TotalSize := FileSize(F);

    IncSize := 0;
    Result := true;

    while (IncSize < TotalSize) and Result do
    begin
      ReadSize := Sett;
      if IncSize + ReadSize > TotalSize then
        ReadSize := TotalSize - IncSize;
      IncSize := IncSize + ReadSize;
      BlockRead(F, c, ReadSize);
      for i := 0 to ReadSize - 1 do
        if (c[i]<32) and (not (c[i] in [9, 10, 13, 26])) then
        begin
          Result := False;
          Exit;
        end;
    end;
  finally
    CloseFile(F);
    {$I+}
    if IOResult <> 0 then
      Result := False
  end;
end;

function SaveChanges(IncludeCancel: Boolean): Integer;
var
  Vcl.Buttons: TMsgDlgVcl.Buttons;
begin
  Vcl.Buttons := [mbYes, mbNO];
  if IncludeCancel then
    Vcl.Buttons := Vcl.Buttons + [mbCancel];

  with CreateMessageDialog('Save changes?', mtConfirmation, Vcl.Buttons) do
  try
    Left := MainForm.Left + (MainForm.Width - Width) div 2;
    Top := MainForm.Top + (MainForm.Height - Height) div 2;
    Result := ShowModal;
  finally
    Free;
  end
end;

function AskYesOrNo(Msg: string): Boolean;
begin
  with CreateMessageDialog(Msg, mtConfirmation, [mbYes, mbNo]) do
  try
    Left := MainForm.Left + (MainForm.Width - Width) div 2;
    Top := MainForm.Top + (MainForm.Height - Height) div 2;
    Result := ShowModal = mrYes;
  finally
    Free;
  end
end;

procedure ShowMessage(Msg: string);
begin
  with CreateMessageDialog(Msg, mtInformation, [mbOK]) do
  try
    Left := MainForm.Left + (MainForm.Width - Width) div 2;
    Top := MainForm.Top + (MainForm.Height - Height) div 2;
    ShowModal;
  finally
    Free;
  end
end;

procedure ShowErrorMessage(Msg: string);
begin
  with CreateMessageDialog(Msg, mtError, [mbOK]) do
  try
    Left := MainForm.Left + (MainForm.Width - Width) div 2;
    Top := MainForm.Top + (MainForm.Height - Height) div 2;
    ShowModal;
  finally
    Free;
  end
end;

procedure ShowWarningMessage(Msg: string);
begin
  with CreateMessageDialog(Msg, mtWarning, [mbOK]) do
  try
    Left := MainForm.Left + (MainForm.Width - Width) div 2;
    Top := MainForm.Top + (MainForm.Height - Height) div 2;
    ShowModal;
  finally
    Free;
  end
end;

function MessageDialog(const Msg: string; DlgType: TMsgDlgType;
  Vcl.Buttons: TMsgDlgVcl.Buttons; Captions: array of string): Integer;
var
  i: Integer;
  dlgButton: TButton;
  CaptionIndex: Integer;
begin
  { Create the Dialog }
  { Dialog erzeugen }
  with CreateMessageDialog(Msg, DlgType, Vcl.Buttons) do
  try
    captionIndex := 0;
    { Loop through Objects in Dialog }
    { Über alle Objekte auf dem Dialog iterieren}
    for i := 0 to ComponentCount - 1 do
    begin
     { If the object is of type TButton, then }
     { Wenn es ein Button ist, dann...}
      if (Components[i] is TButton) then
      begin
        dlgButton := TButton(Components[i]);
        if CaptionIndex > High(Captions) then Break;
        { Give a new caption from our Captions array}
        { Schreibe Beschriftung entsprechend Captions array}
        dlgButton.Caption := Captions[CaptionIndex];
        Inc(CaptionIndex);
      end;
    end;
    Left := MainForm.Left + (MainForm.Width - Width) div 2;
    Top := MainForm.Top + (MainForm.Height - Height) div 2;
    Result := ShowModal;
  finally
    Free;
  end;
end;

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
{
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
end;   }

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

function DecryptString(Data: string): string;
var
  i: Integer;
begin
  Result := '';
  if Length(Data) > 0 Then
    for i := 1 to Length(Data) do
    begin
      if Ord(Data[i]) <> 0 Then
        Result:= Result + Chr(Ord(Data[i]) - 1)
      else
        Result:= Result + Chr(255)
    end;
end;

function EncryptString(Data: string): string;
var
  i: Integer;
begin
  Result := '';
  if Length(Data) > 0 then
    for i := 1 to Length(Data) do
    begin
      if Ord(Data[i]) <> 255 Then
        Result := Result + Chr(Ord(Data[i]) + 1)
      else
        Result := Result + Chr(0)
    end;
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
  OraQuery.SQL.Add(DM.ObjectTreeStringHolder.StringsByName['HighlighterObjectsSQL'].Text);
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

procedure AutoSizeCol(Grid: TBCStringGrid);
var
  i, W, WMax, Column: Integer;
begin
  Screen.Cursor := crHourglass;
  for Column := 0 to Grid.ColCount - 1 do
  begin
    if not Grid.IsHidden(Column, 0) then
    begin
      WMax := 0;
      for i := 0 to Grid.RowCount - 1 do
      begin
        W := Grid.Canvas.TextWidth(Grid.Cells[Column, i]);
        if W > WMax then
          WMax := W;
      end;
      Grid.ColWidths[Column] := WMax + 7;
    end;
  end;

  Grid.Width := Grid.ColWidths[0] + Grid.ColWidths[1] + 2;
// xxx  Grid.Height := Grid.RowCount * Grid.DefaultRowHeight + 5;
  Grid.Visible := True;
  Screen.Cursor := crDefault;
end;

function GetHistoryFile: string;
begin
  Result := ExtractFilePath(Application.ExeName) + 'sqlhistory.log';
end;

procedure SetGridColumnWidths(Grid: TBCDBGrid; OnlyVisibleColumns: Boolean);
const
  DEFBORDER = 10;
var
  temp, n, i, RowCount: Integer;
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
      RowCount := Grid.VisibleRowCount
    else
      RowCount := Grid.DataSource.DataSet.RecordCount;

    for i := 0 to RowCount do
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

procedure GridDrawStringDataCell(Sender: TObject; const Rect: TRect; Field: TField);
var
  S: string;
begin
  if Field is TStringField then
  begin
    with (Sender as TBCDBGrid).Canvas do
    begin
      S := Field.Text;
      while Pos(#13, S) > 0 do
        S[Pos(#13, S)] := '|';
      while Pos(#10, S) > 0 do
        S[Pos(#10, S)] := '|';
      FillRect(Rect); {clear the cell}
      TextOut(Rect.Left + 2, Rect.Top + 2, S); {fill cell with memo data}
    end;
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

function StrContains(Str1, Str2: string): Boolean;
var
  i: Integer;
begin
  for i := 1 to Length(Str1) do
    if Pos(Str1[i], Str2) <> 0 then
    begin
      Result := True;
      Exit;
    end;
  Result := False;
end;

function GetAlterConstraintSQL(TableName: string; ConstraintName: string; EnableConstraint: Boolean): string;
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
  Result := Trim(Format('ALTER TABLE %s %s CONSTRAINT %s %s', [TableName, Action, ConstraintName, Cascade]));
end;

procedure AlterConstraint(OraSession: TOraSession; TableName: string; ConstraintName: string; EnableConstraint: Boolean);
begin
  try
    OraSession.ExecSQL(GetAlterConstraintSQL(TableName, ConstraintName, EnableConstraint), []);
  except
    on E: Exception do
      Common.ShowErrorMessage(E.message);
  end;
end;

procedure AlterSelectedConstraints(OraSession: TOraSession; TableName: string; Grid: TBCDBGrid; EnableConstraint: Boolean);
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
         AlterConstraint(OraSession, TableName, Datasource.DataSet.FieldByName(CONSTRAINT_NAME).AsString, EnableConstraint);
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
  OraQuery.SQL.Add(DM.ObjectTreeStringHolder.StringsByName['AllConstrainsSQL'].Text);
  with OraQuery do
  try
    ParamByName('P_OWNER').AsWideString := SchemaParam;
    Prepare;
    Open;
    while not Eof do
    begin
      AlterConstraint(OraSession, FieldByName('TABLE_NAME').AsString, FieldByName('CONSTRAINT_NAME').AsString, EnableConstraint);
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
  OraQuery.SQL.Add(DM.ObjectTreeStringHolder.StringsByName['ObjectConstraintsSQL'].Text);
  with OraQuery do
  try
    ParamByName('P_OWNER').AsString := SchemaParam;
    ParamByName('P_OBJECT_NAME').AsString := ObjectName;
    Prepare;
    Open;
    while not Eof do
    begin
      AlterConstraint(OraSession, FieldByName('TABLE_NAME').AsString, FieldByName('CONSTRAINT_NAME').AsString, EnableConstraint);
      Next;
    end;
  finally
    Close;
    UnPrepare;
    FreeAndNil(OraQuery);
    Screen.Cursor := crDefault;
  end;
end;

function GetAlterTriggerSQL(TriggerName: string; EnableTrigger: Boolean): string;
var
  Action: string;
begin
  if EnableTrigger then
    Action := 'ENABLE'
  else
    Action := 'DISABLE';
  Result := Format('ALTER TRIGGER %s %s', [TriggerName, Action]);
end;

procedure AlterTrigger(OraSession: TOraSession; TriggerName: string; EnableTrigger: Boolean);
begin
  try
    OraSession.ExecSQL(GetAlterTriggerSQL(TriggerName, EnableTrigger), []);
  except
    on E: Exception do
      Common.ShowErrorMessage(E.message);
  end;
end;

procedure AlterSelectedTriggers(OraSession: TOraSession; Grid: TBCDBGrid; EnableTrigger: Boolean);
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
         AlterTrigger(OraSession, Datasource.DataSet.FieldByName(TRIGGER_NAME).AsString, EnableTrigger);
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
  OraQuery.SQL.Add(DM.ObjectTreeStringHolder.StringsByName['AllTriggersSQL'].Text);

  with OraQuery do
  try
    ParamByName('P_OWNER').AsWideString := SchemaParam;
    Prepare;
    Open;
    while not Eof do
    begin
      AlterTrigger(OraSession, FieldByName('TRIGGER_NAME').AsString, EnableConstraint);
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
  OraQuery.SQL.Add(DM.ObjectTreeStringHolder.StringsByName['ObjectTriggersSQL'].Text);

  with OraQuery do
  try
    ParamByName('P_OWNER').AsWideString := SchemaParam;
    ParamByName('P_OBJECT_NAME').AsWideString := ObjectName;
    Prepare;
    Open;
    while not Eof do
    begin
      AlterTrigger(OraSession, FieldByName('TRIGGER_NAME').AsString, EnableConstraint);
      Next;
    end;
  finally
    Close;
    UnPrepare;
    FreeAndNil(OraQuery);
    Screen.Cursor := crDefault;
  end;
end;

procedure CopyDataFromDBGridToClipboard(DBGrid: TJvDBGrid);
var
  i, j: Integer;
  s: WideString;
begin
  if DBGrid.EditorMode then
  begin
    Clipboard.AsText := DBGrid.DataSource.DataSet.FieldByName(DBGrid.Columns.Items[ DBGrid.SelectedIndex].FieldName).AsWideString;
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
      for i := 0 to SelectedRows.Count - 1 do
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

procedure SaveSQL(SynEdit: TSynEdit);
begin
  with TSaveDialog.Create(nil) do
  try
    Title := 'Save As';
    Filter := 'SQL files (*.sql)|*.sql';
    DefaultExt := '.sql';
    if Execute then
      SynEdit.Lines.SaveToFile(FileName);
  finally
    Free;
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
                  if (Field = nil) or (Field.Owner <> DataSet.Owner) then
                     FieldsList.Add(FieldName);
               end;

         // add those fields to the dataset
         for i := 0 to FieldsList.Count - 1 do
         begin
            FieldDef := DataSet.FieldDefList.FieldByName(FieldsList[i]);
            //Field :=
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

{procedure FocusGridCell(const DBGrid: TDBGrid; const Column: integer);
begin
  with TStringGrid(DBGrid) do
  begin
    Col := Column;
    SetFocus;
  end;
end;}

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
  Enum: TOraServerEnumerator;
  List: TStringList;
begin
  List := TStringList.Create;
  Enum := TOraServerEnumerator.Create;
  try
    Enum.GetServerList(List);
  finally
    Enum.Free;
  end;
  List.Sort;
  Result := List;
end;

function GetTableOrViewComment(OraSession: TOraSession; SchemaParam: string; ObjectName: string): WideString;
var
  OraQuery: TOraQuery;
begin
  OraQuery := TOraQuery.Create(nil);
  OraQuery.Session := OraSession;
  OraQuery.SQL.Add(DM.ObjectTreeStringHolder.StringsByName['TableOrViewCommentsSQL'].Text);
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

function GetINIFilename: string;
begin
  Result := ChangeFileExt(Application.EXEName, '.ini');
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
      s := Common.DecryptString(System.Copy(Objects.Strings[i], 0, Pos('=', Objects.Strings[i]) - 1));
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
      if KeyValue = Common.DecryptString(System.Copy(SchemaObjectFilters.Strings[i], 0, Pos('=', SchemaObjectFilters.Strings[i]) - 1)) then
      begin
        Result := Common.DecryptString(ReadString('SchemaObjectFilters', System.Copy(SchemaObjectFilters.Strings[i], 0, Pos('=', SchemaObjectFilters.Strings[i]) - 1), ''));
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

end.
