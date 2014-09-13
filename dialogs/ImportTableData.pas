unit ImportTableData;

interface

uses
  Winapi.Windows, System.SysUtils, System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, ActnList, Vcl.StdCtrls,
  Vcl.Mask, JvExMask, JvSpin, Ora, BCControls.Edit, BCControls.ComboBox, BCControls.SpinEdit, Vcl.Buttons, Vcl.ExtCtrls,
  BCDialogs.Dlg, System.Actions, JvExControls, JvSpeedButton, BCControls.CheckBox, JvExStdCtrls, JvCheckBox;

type
  TImportTableDataDialog = class(TDialog)
    ActionList: TActionList;
    CancelButton: TButton;
    ClipboardRadioButton: TRadioButton;
    ComminIntervalLabel: TLabel;
    CommitIntervalSpinEdit: TBCSpinEdit;
    DelimiterComboBox: TBCComboBox;
    DelimiterLabel: TLabel;
    FilenameLabel: TLabel;
    FileRadioButton: TRadioButton;
    ImportAction: TAction;
    ImportButton: TButton;
    Label1: TLabel;
    LaunchAfterCreationCheckBox: TBCCheckBox;
    LoadInEditorRadioButton: TRadioButton;
    OpenFileButtonAction: TAction;
    OpenFilenameEdit: TBCEdit;
    OptionsGroupBox: TGroupBox;
    OutputGroupBox: TGroupBox;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    SaveFileButtonAction: TAction;
    SaveFilenameEdit: TBCEdit;
    SchemaEdit: TBCEdit;
    SchemaLabel: TLabel;
    Separator1Panel: TPanel;
    TableEdit: TBCEdit;
    TableLabel: TLabel;
    JvSpeedButton1: TJvSpeedButton;
    JvSpeedButton2: TJvSpeedButton;
    procedure FormDestroy(Sender: TObject);
    procedure ImportActionExecute(Sender: TObject);
    procedure OpenFileButtonActionExecute(Sender: TObject);
    procedure SaveFileButtonActionExecute(Sender: TObject);
  private
    { Private declarations }
    FSession: TOraSession;
    function CheckFields: Boolean;
    function GetColumns(Header: string): TStrings;
    function GetDelimiter: Char;
    function ImportData: Boolean;
    function InsertStatementOutput(ColumnTypeQuery: TOraQuery; Columns: TStrings; Line: string): string;
    procedure ReadIniFile;
    procedure WriteIniFile;
  public
    { Public declarations }
    function Open(Session: TOraSession): Boolean;
  end;

function ImportTableDataDialog: TImportTableDataDialog;

implementation

{$R *.dfm}

uses
  BCCommon.OptionsContainer, BigIni, ShellApi, Progress, SynEdit, Main, DB, BCCommon.StyleUtils, BCCommon.Dialogs,
  BCCommon.LanguageStrings, BCCommon.FileUtils, BCCommon.Messages, BCCommon.Lib;

var
  FImportTableDataDialog: TImportTableDataDialog;

function ImportTableDataDialog: TImportTableDataDialog;
begin
  if not Assigned(FImportTableDataDialog) then
    Application.CreateForm(TImportTableDataDialog, FImportTableDataDialog);
  Result := FImportTableDataDialog;
  SetStyledFormSize(Result);
end;

procedure TImportTableDataDialog.FormDestroy(Sender: TObject);
begin
  FImportTableDataDialog := nil;
end;

procedure TImportTableDataDialog.ImportActionExecute(Sender: TObject);
begin
  WriteIniFile;
  if ImportData then
    ModalResult := mrOk;
end;

function TImportTableDataDialog.Open(Session: TOraSession): Boolean;
var
  Rslt: Integer;
begin
  FSession := Session;
  SchemaEdit.Text := Session.Schema;

  ReadIniFile;

  Rslt := ShowModal;

  Result := Rslt = mrOk;
end;

procedure TImportTableDataDialog.OpenFileButtonActionExecute(Sender: TObject);
begin
  if BCCommon.Dialogs.OpenFile(Handle, OpenFilenameEdit.Text, Format('%s'#0'*.*'#0#0, [LanguageDataModule.GetConstant('AllFiles')]),
    LanguageDataModule.GetConstant('SelectFile')) then
  begin
    Application.ProcessMessages; { style fix }
    OpenFilenameEdit.Text := BCCommon.Dialogs.Files[0];
  end;
end;

procedure TImportTableDataDialog.WriteIniFile;
begin
  with TBigIniFile.Create(GetINIFilename) do
  try
    WriteInteger('ImportSettings', 'CommitInterval', StrToInt(CommitIntervalSpinEdit.Text));
    WriteBool('ImportSettings', 'LaunchAfterCreation', LaunchAfterCreationCheckBox.Checked);
    WriteString('ImportSettings', 'OpenFilename', OpenFilenameEdit.Text);
    WriteString('ImportSettings', 'SaveFilename', SaveFilenameEdit.Text);
    WriteBool('ImportSettings', 'FileOutput', FileRadioButton.Checked);
    WriteBool('ImportSettings', 'ClipboardOutput', ClipboardRadioButton.Checked);
    WriteBool('ImportSettings', 'LoadInEditorOutput', LoadInEditorRadioButton.Checked);
  finally
    Free;
  end;
end;

procedure TImportTableDataDialog.ReadIniFile;
begin
  with TBigIniFile.Create(GetINIFilename) do
  try
    FileRadioButton.Checked := ReadBool('ImportSettings', 'FileOutput', True);
    ClipboardRadioButton.Checked := ReadBool('ImportSettings', 'ClipboardOutput', False);
    LoadInEditorRadioButton.Checked := ReadBool('ImportSettings', 'LoadInEditorOutput', True);
    CommitIntervalSpinEdit.Value := ReadInteger('ImportSettings', 'CommitInterval', 0);
    LaunchAfterCreationCheckBox.Checked := ReadBool('ImportSettings', 'LaunchAfterCreation', False);
    OpenFilenameEdit.Text := ReadString('ImportSettings', 'OpenFilename', '');
    SaveFilenameEdit.Text := ReadString('ImportSettings', 'SaveFilename', '');
  finally
    Free;
  end;
end;

procedure TImportTableDataDialog.SaveFileButtonActionExecute(Sender: TObject);
var
  FilterIndex: Cardinal;
begin
  if BCCommon.Dialogs.SaveFile(Handle, '', Format('%s'#0'*.*'#0#0, [LanguageDataModule.GetConstant('AllFiles')]),
    LanguageDataModule.GetConstant('SaveAs'), FilterIndex) then
  begin
    Application.ProcessMessages; { style fix }
    SaveFilenameEdit.Text := BCCommon.Dialogs.Files[0];
  end;
end;

function TImportTableDataDialog.CheckFields: Boolean;
begin
  Result := False;

  if not FileExists(OpenFilenameEdit.Text) then
  begin
    ShowErrorMessage(Format('File %s does not exist.', [OpenFilenameEdit.Text]));
    OpenFilenameEdit.SetFocus;
    Exit;
  end;
  if Trim(OpenFilenameEdit.Text) = '' then
  begin
    ShowErrorMessage('Enter Filename.');
    OpenFilenameEdit.SetFocus;
    Exit;
  end;
  if Trim(SchemaEdit.Text) = '' then
  begin
    ShowErrorMessage('Enter Schema.');
    SchemaEdit.SetFocus;
    Exit;
  end;
  if Trim(TableEdit.Text) = '' then
  begin
    ShowErrorMessage('Enter Table.');
    TableEdit.SetFocus;
    Exit;
  end;
  if FileRadioButton.Checked and (Trim(SaveFilenameEdit.Text) = '') then
  begin
    ShowErrorMessage('Enter Filename.');
    SaveFilenameEdit.SetFocus;
    Exit;
  end;

  Result := True;
end;

function TImportTableDataDialog.GetDelimiter: Char;
begin
  case DelimiterComboBox.ItemIndex of
    0: Result := ',';
    1: Result := '|';
    2: Result := ';';
    3: Result := Chr(9);
  else
    Result := ' ';
  end;
end;

function TImportTableDataDialog.GetColumns(Header: string): TStrings;
var
  s, ColumnName: string;
  Delimiter: Char;
  OraQuery: TOraQuery;
begin
  { check field exists in table }
  Delimiter := GetDelimiter;
  Result := TStringList.Create;
  OraQuery := TOraQuery.Create(nil);
  with OraQuery do
  try
    Session := FSession;
    SQL.Add('SELECT * FROM ' + TableEdit.Text);
    Open;
    s := Header;
    while Pos(Delimiter, s) <> 0 do
    begin
      ColumnName := Trim(Copy(s, 0, Pos(Delimiter, s) - 1));

      if OraQuery.FieldList.IndexOf(ColumnName) = -1 then
      begin
        ShowErrorMessage(Format('Header row in the file must have correct field names. Can''t find: %s', [ColumnName]));
        Result.Clear;
        Exit;
      end
      else
        Result.Add(ColumnName);

      s := Trim(Copy(s, Pos(Delimiter, s) + 1, Length(s)));
      // add delimiter at the end if it doesn't exist xxx;yyy
      if (Length(s) <> 0) and (Pos(Delimiter, s) = 0) then
        s := s + Delimiter;
    end;
  finally
    Close;
    Free;
  end;
end;

function TImportTableDataDialog.ImportData: Boolean;
var
  i, j{, Row}: Integer;
  Columns: TStrings;
  OpenSynEdit, SaveSynEdit: TSynEdit;
  Interval: Boolean;
  ColumnTypeQuery: TOraQuery;
begin
  Result := False;

  if not CheckFields then
    Exit;

  ColumnTypeQuery := TOraQuery.Create(nil);
  with ColumnTypeQuery do
  try
    Session := FSession;
    SQL.Add('SELECT * FROM ' + TableEdit.Text);
    Open;
  except
    on E: Exception do
    begin
      ShowErrorMessage(E.Message);
      Close;
      Free;
      Exit;
    end;
  end;

  OpenSynEdit := TSynEdit.Create(nil);
  OpenSynEdit.Visible := False;
  OpenSynEdit.Parent := Self;
  OpenSynEdit.Lines.LoadFromFile(OpenFilenameEdit.Text);
  SaveSynEdit := TSynEdit.Create(nil);
  SaveSynEdit.Visible := False;
  SaveSynEdit.Parent := Self;
  Columns := nil;

  try
    j := OpenSynEdit.Lines.Count - 1;
    ProgressDialog(Self).Open(0, j, True);
    { read header - columns }
    Columns := GetColumns(OpenSynEdit.Lines.Strings[0]);
    if Columns.Count > 0 then
    begin
      for i := 1 to j - 1 do
      begin
        ProgressDialog(Self).ProgressPosition := i;
        ProgressDialog(Self).InformationText := Format('Importing (Row %d/%d)...', [i+1, j]);
        if not ProgressDialog(Self).OnProgress then
          Exit;

        SaveSynEdit.Text := SaveSynEdit.Text + InsertStatementOutput(ColumnTypeQuery, Columns, OpenSynEdit.Lines.Strings[i]);
        if StrToInt(CommitIntervalSpinEdit.Text) <> 0 then { Add COMMIT; }
        begin
          Interval := ((i + 1) mod StrToInt(CommitIntervalSpinEdit.Text)) = 0;
          if Interval or (not Interval and (i = (j - 1))) then
            SaveSynEdit.Text := SaveSynEdit.Text + 'COMMIT;' + CHR_ENTER;
        end;
      end;
      if FileRadioButton.Checked then
      begin
        SaveSynEdit.Lines.SaveToFile(SaveFilenameEdit.Text);
        if LaunchAfterCreationCheckBox.Checked then
          ShellExecute(Handle, 'open', PWideChar(SaveFilenameEdit.Text), nil, nil, SW_SHOWNORMAL) ;
      end;
      if ClipboardRadioButton.Checked then
        SaveSynEdit.CopyToClipboard;
      if LoadInEditorRadioButton.Checked then
        MainForm.LoadSQLIntoEditor(Format('%s@%s', [FSession.Schema, FSession.Server]), SaveSynEdit.Text);
    end;
  finally
    if Assigned(Columns) then
      Columns.Free;
    OpenSynEdit.Free;
    SaveSynEdit.Free;
    ProgressDialog(Self).Free;
    ColumnTypeQuery.Close;
    ColumnTypeQuery.Free;
  end;

  ShowMessage('Export Done.');
  Result := True;
end;

function TImportTableDataDialog.InsertStatementOutput(ColumnTypeQuery: TOraQuery; Columns: TStrings; Line: string): string;
var
  i: Integer;
  s, FieldValue: string;
  RightMargin: Integer;
begin
  RightMargin := OptionsContainer.MarginRightMargin;
  Result := 'INSERT INTO ' + LowerCase(SchemaEdit.Text) + '.' + LowerCase(TableEdit.Text) + CHR_ENTER;
  s := '            (';
  i := 0;
  while i < Columns.Count do
  begin
    s := s + LowerCase(Trim(Columns.Strings[i]));

    Inc(i);
    if i < Columns.Count then
    begin
      s := s + ', ';

      if Length(s) + Length(Trim(Columns.Strings[i])) > RightMargin then
      begin
        Result := Result + s + CHR_ENTER;
        s := '             ';
      end;
    end;
  end;

  if s <> '' then
    Result := Result + s;

  Result := Result + ')' + CHR_ENTER;
  s := '     VALUES (';
  i := 0;
  while i < Columns.Count do
  begin
    if Pos(GetDelimiter, Line) > 0 then
    begin
      FieldValue := Copy(Line, 1, Pos(GetDelimiter, Line) - 1);
      Line := Copy(Line, Pos(GetDelimiter, Line) + 1, Length(Line));
    end
    else
      FieldValue := Line; // last, if not delimiter
    if ColumnTypeQuery.FieldByName(Columns.Strings[i]).DataType = ftWideString then
    begin
      FieldValue := AnsiDequotedStr(FieldValue, ''''); // single
      FieldValue := AnsiDequotedStr(FieldValue, '"'); // double
      FieldValue := AnsiQuotedStr(FieldValue, '''');
    end;
    if FieldValue = '' then
    begin
      if ColumnTypeQuery.FieldByName(Columns.Strings[i]).DataType <> ftWideString then
        FieldValue := 'NULL';
    end;
    if ColumnTypeQuery.FieldByName(Columns.Strings[i]).DataType = ftFloat then
      FieldValue := StringReplace(FieldValue, ',', '.', []);

    if (FieldValue <> 'NULL') and (ColumnTypeQuery.FieldByName(Columns.Strings[i]).DataType = ftDateTime) then
      FieldValue := 'TO_DATE(' + QuotedStr({FormatDateTime(OptionsContainer.DateFormat + ' hh:nn:ss',} FieldValue){)} +
        ', ' + QuotedStr(OptionsContainer.DateFormat + ' ' + OptionsContainer.TimeFormat) + ')';

    s := s + FieldValue;
    Inc(i);
    if i < Columns.Count then
    begin
      s := s + ', ';

      if Length(s) + Length(FieldValue) > RightMargin then
      begin
        Result := Result + s + CHR_ENTER;
        s := '             ';
      end;
    end;
  end;

  if s <> '' then
    Result := Result + s;

  Result := Result + ');' + CHR_ENTER;
end;

end.
