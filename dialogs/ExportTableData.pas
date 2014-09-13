unit ExportTableData;

interface

uses
  Winapi.Windows, System.SysUtils, System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, BCControls.PageControl,
  Vcl.StdCtrls, Vcl.Mask, JvExMask, ComCtrls, JvExComCtrls, JvComCtrls, Vcl.ExtCtrls, JvSpin, CheckLst, ActnList, Ora,
  DB, DBAccess, BCControls.Edit, BCDialogs.Dlg, BCControls.ComboBox, BCControls.SpinEdit, BCControls.DBGrid,
  Vcl.Buttons, System.Actions, JvExControls, JvSpeedButton, BCControls.CheckBox, JvExStdCtrls, JvCheckBox;

type
  TExportTableDataDialog = class(TDialog)
    ActionList: TActionList;
    CancelButton: TButton;
    ClipboardRadioButton: TRadioButton;
    ColumnsPanel: TPanel;
    ColumnsTabSheet: TTabSheet;
    ComminIntervalLabel: TLabel;
    CommitIntervalSpinEdit: TBCSpinEdit;
    DelimiterAfterLastColumnCheckBox: TBCCheckBox;
    DelimiterComboBox: TBCComboBox;
    DelimiterLabel: TLabel;
    DoubleQuoteRadioButton: TRadioButton;
    ExportAction: TAction;
    ExportButton: TButton;
    FilenameEdit: TBCEdit;
    FileRadioButton: TRadioButton;
    FormatComboBox: TBCComboBox;
    FormatLabel: TLabel;
    IncludeColumnHeadersCheckBox: TBCCheckBox;
    IncludeNullColumns1CheckBox: TBCCheckBox;
    IncludeNullColumns2CheckBox: TBCCheckBox;
    Label1: TLabel;
    LaunchAfterCreationCheckBox: TBCCheckBox;
    LoadInEditorRadioButton: TRadioButton;
    Options1TabSheet: TTabSheet;
    Options2TabSheet: TTabSheet;
    OutputGroupBox: TGroupBox;
    PageControl: TBCPageControl;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    QuotedStringColumnsCheckBox: TBCCheckBox;
    SchemaEdit: TBCEdit;
    SchemaFilterCheckListBox: TCheckListBox;
    SchemaLabel: TLabel;
    SelectedRowsOnlyCheckBox: TBCCheckBox;
    SelectFileButtonAction: TAction;
    Separator1Panel: TPanel;
    SingleQuoteRadioButton: TRadioButton;
    TableEdit: TBCEdit;
    TableLabel: TLabel;
    BitBtn1: TJvSpeedButton;
    procedure ExportActionExecute(Sender: TObject);
    procedure FormatComboBoxChange(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure QuotedStringColumnsCheckBoxClick(Sender: TObject);
    procedure SelectFileButtonActionExecute(Sender: TObject);
  private
    { Private declarations }
    FGrid: TBCDBGrid;
    function CheckFields: Boolean;
    function ExportData: Boolean;
    function GetFirstTableName: string;
    procedure CSVFileOutput(SList: TStringList; OraQuery: TOraQuery; AddHeader: Boolean);
    procedure InsertStatementOutput(SList: TStringList; OraQuery: TOraQuery);
    procedure ReadIniFile;
    procedure SetFields;
    procedure WriteIniFile;
  public
    { Public declarations }
    function Open(Grid: TBCDBGrid): Boolean;
  end;

function ExportTableDataDialog: TExportTableDataDialog;

implementation

{$R *.dfm}

uses
  BCCommon.OptionsContainer, BigIni, BCSQL.Tokenizer, ShellApi, DBGrids, Progress, Main, Vcl.Clipbrd,
  BCCommon.FileUtils, BCCommon.Lib, Vcl.Themes, BCCommon.StyleUtils, BCCommon.Dialogs, BCCommon.LanguageStrings,
  BCCommon.Messages;

var
  FExportTableDataDialog: TExportTableDataDialog;

function ExportTableDataDialog: TExportTableDataDialog;
begin
  if not Assigned(FExportTableDataDialog) then
    Application.CreateForm(TExportTableDataDialog, FExportTableDataDialog);
  Result := FExportTableDataDialog;
  SetStyledFormSize(Result);
end;

procedure TExportTableDataDialog.FormDestroy(Sender: TObject);
begin
  FExportTableDataDialog := nil;
end;

procedure TExportTableDataDialog.FormatComboBoxChange(Sender: TObject);
begin
  SetFields;
end;

procedure TExportTableDataDialog.SelectFileButtonActionExecute(Sender: TObject);
var
  Filter, DefaultExt: string;
begin
  case FormatComboBox.ItemIndex of
    0:
      begin
        Filter := 'CSV files (*.csv)'#0'*.csv'#0#0;
        DefaultExt := 'csv';
      end;
    1:
      begin
        Filter := 'SQL files (*.sql)'#0'*.sql'#0#0;
        DefaultExt := 'sql';
      end;
  end;
  if BCCommon.Dialogs.OpenFile(Handle, FilenameEdit.Text, Filter,
    LanguageDataModule.GetConstant('SelectFile'), DefaultExt) then
  begin
    Application.ProcessMessages; { style fix }
    FilenameEdit.Text := BCCommon.Dialogs.Files[0];
  end;
end;

procedure TExportTableDataDialog.SetFields;
begin
  case FormatComboBox.ItemIndex of
    0: FilenameEdit.Text := ChangeFileExt(FilenameEdit.Text, '.csv');
    1: FilenameEdit.Text := ChangeFileExt(FilenameEdit.Text, '.sql');
  end;

  Options1TabSheet.TabVisible := FormatComboBox.ItemIndex = 0;
  if Options1TabSheet.TabVisible then
    PageControl.ActivePage := Options1TabSheet;
  Options2TabSheet.TabVisible := FormatComboBox.ItemIndex = 1;
  if Options2TabSheet.TabVisible then
    PageControl.ActivePage := Options2TabSheet;
  SingleQuoteRadioButton.Enabled := QuotedStringColumnsCheckBox.Checked;
  DoubleQuoteRadioButton.Enabled := QuotedStringColumnsCheckBox.Checked;
  if not QuotedStringColumnsCheckBox.Checked then
  begin
    SingleQuoteRadioButton.Checked := False;
    DoubleQuoteRadioButton.Checked := False;
  end;
end;

procedure TExportTableDataDialog.QuotedStringColumnsCheckBoxClick(Sender: TObject);
begin
  SetFields;
end;

procedure TExportTableDataDialog.ExportActionExecute(Sender: TObject);
begin
  WriteIniFile;
  if ExportData then
    ModalResult := mrOk;
end;

function TExportTableDataDialog.GetFirstTableName: string;
var
  FromFound: Boolean;
  SQLTokenizer: TSQLTokenizer;
begin
  Result := '';

  SQLTokenizer := TSQLTokenizer.Create;
  try
    SQLTokenizer.SetText(TOraQuery(FGrid.DataSource.DataSet).SQL.Text);
    FromFound := False;
    while not SQLTokenizer.Eof do
    begin
      if FromFound and
       // not SQLTokenizer.TokenStrIs(AnsiString(Trim(SchemaEdit.Text))) and
        (SQLTokenizer.TokenType <> ttWhiteSpace) and
        (SQLTokenizer.TokenType <> ttPeriod) and
        (SQLTokenizer.TokenType <> ttOpenParens) then
      begin
        if SQLTokenizer.TokenStrIs('SELECT') then
          FromFound := False
        else
        begin
          Result := String(SQLTokenizer.TokenStr);
          SQLTokenizer.Next;
          if SQLTokenizer.TokenType = ttPeriod then //  TokenStrIs('.') then
          begin
            SchemaEdit.Text := Result;
            SQLTokenizer.Next;
            Result := String(SQLTokenizer.TokenStr);
          end;
          Break;
        end;
      end;
      if SQLTokenizer.TokenStrIs('FROM') then
        FromFound := True;
      SQLTokenizer.Next;
    end;
  finally
    SQLTokenizer.Free;
  end;
end;

function TExportTableDataDialog.Open(Grid: TBCDBGrid): Boolean;
var
  i: Integer;
  Rslt: Integer;
begin
  FGrid := Grid;
  SelectedRowsOnlyCheckBox.Checked := FGrid.SelectedRows.Count > 0;
  SchemaEdit.Text := TOraQuery(FGrid.DataSource.DataSet).Session.Schema;
  TableEdit.Text := GetFirstTableName;
  SchemaFilterCheckListBox.Items.Clear;
  for i := 0 to FGrid.Columns.Count - 1 do
    SchemaFilterCheckListBox.Items.Add(FGrid.Columns.Items[i].FieldName);
  SchemaFilterCheckListBox.CheckAll(cbChecked, false, false);

  ReadIniFile;
  SetFields;

  if Assigned(TStyleManager.ActiveStyle) then
    PageControl.DoubleBuffered := TStyleManager.ActiveStyle.Name = 'Windows';

  Rslt := ShowModal;

  Result := Rslt = mrOk;
end;

function TExportTableDataDialog.CheckFields: Boolean;
begin
  Result := False;

  if Options2TabSheet.Visible then
  begin
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
  end;
  if FileRadioButton.Checked and (Trim(FilenameEdit.Text) = '') then
  begin
    ShowErrorMessage('Enter Filename.');
    FilenameEdit.SetFocus;
    Exit;
  end;

  Result := True;
end;

function TExportTableDataDialog.ExportData: Boolean;
var
  i, j{, Row}: Integer;
  //SynEdit: TSynEdit;
  Interval, AddHeader: Boolean;
  StringList: TStringList;
begin
  Result := False;

  if not CheckFields then
    Exit;

  StringList := TStringList.Create;
  // jos SelectedRowsOnlyCheckBox.Checked, niin muodostetaan rivit gridiltä
  // muuten OraQuery (fetch all)

  TOraQuery(FGrid.DataSource.DataSet).DisableControls;
  try
    if not SelectedRowsOnlyCheckBox.Checked then
      FGrid.SelectedRows.SelectAll; // Selection.SelectAll;

    //k := 0;
    j := FGrid.SelectedRows.Count;
    //k := FGrid.SelectedRow;
    ProgressDialog(Self).Open(0, j, True);
    AddHeader := True;
    for i := 0 to j - 1 do
    begin
      ProgressDialog(Self).ProgressPosition := i;
      ProgressDialog(Self).InformationText := Format('Exporting (Row %d/%d)...', [i+1, j]);
      if not ProgressDialog(Self).OnProgress then
        Exit;
      FGrid.DataSource.DataSet.Bookmark := FGrid.SelectedRows[i];
      if FormatComboBox.ItemIndex = 0 then
      begin
        CSVFileOutput({SynEdit,}StringList, TOraQuery(FGrid.DataSource.DataSet), AddHeader);
        AddHeader := False;
      end;
      if FormatComboBox.ItemIndex = 1 then
      begin
        InsertStatementOutput({SynEdit,}StringList, TOraQuery(FGrid.DataSource.DataSet));
        if StrToInt(CommitIntervalSpinEdit.Text) <> 0 then { Add COMMIT; }
        begin
          Interval := ((i + 1) mod StrToInt(CommitIntervalSpinEdit.Text)) = 0;
          if Interval or (not Interval and (i = (j - 1))) then
            StringList.Add('COMMIT;');
            //SynEdit.Text := SynEdit.Text + 'COMMIT;' + CHR_ENTER;
        end;
    end;
    end;
    //SynEdit.SelectAll;
    if FileRadioButton.Checked then
    begin
      StringList.SaveToFile(FilenameEdit.Text);
      //SynEdit.Lines.SaveToFile(FilenameEdit.Text);
      if LaunchAfterCreationCheckBox.Checked then
        ShellExecute(Handle, 'open', PWideChar(FilenameEdit.Text), nil, nil, SW_SHOWNORMAL) ;
    end;
    if ClipboardRadioButton.Checked then
      Clipboard.AsText := StringList.Text;
    //  SynEdit.CopyToClipboard;
    if LoadInEditorRadioButton.Checked then
      MainForm.LoadSQLIntoEditor(Format('%s@%s', [TOraQuery(FGrid.DataSource.DataSet).Session.Schema, TOraQuery(FGrid.DataSource.DataSet).Session.Server]), StringList.Text {SynEdit.Text});
  finally
    if not SelectedRowsOnlyCheckBox.Checked then
      FGrid.SelectedRows.Clear;
    TOraQuery(FGrid.DataSource.DataSet).EnableControls;
    //FGrid GotoSelection(0);
    //SynEdit.Free;
    StringList.Free;
    ProgressDialog(Self).Free;
  end;

  ShowMessage('Export Done.');
  Result := True;
end;

procedure TExportTableDataDialog.ReadIniFile;
begin
  with TBigIniFile.Create(GetINIFilename) do
  try
    FormatComboBox.ItemIndex := ReadInteger('ExportSettings', 'Format', 0);
    DelimiterComboBox.ItemIndex := ReadInteger('ExportSettings', 'Delimiter', 2);
    IncludeColumnHeadersCheckBox.Checked := ReadBool('ExportSettings', 'IncludeColumnHeaders', True);
    QuotedStringColumnsCheckBox.Checked := ReadBool('ExportSettings', 'QuoteStringColumns', False);
    SingleQuoteRadioButton.Checked := ReadBool('ExportSettings', 'SingleQuote', False);
    DoubleQuoteRadioButton.Checked := ReadBool('ExportSettings', 'DoubleQuote', False);
    IncludeNullColumns1CheckBox.Checked := ReadBool('ExportSettings', 'IncludeNullColumns', True);
    IncludeNullColumns2CheckBox.Checked := ReadBool('ExportSettings', 'IncludeNullColumns', True);
    DelimiterAfterLastColumnCheckBox.Checked := ReadBool('ExportSettings', 'DelimiterAfterLastColumn', False);
    FileRadioButton.Checked := ReadBool('ExportSettings', 'FileOutput', True);
    ClipboardRadioButton.Checked := ReadBool('ExportSettings', 'ClipboardOutput', False);
    LoadInEditorRadioButton.Checked := ReadBool('ExportSettings', 'LoadInEditorOutput', True);
    CommitIntervalSpinEdit.Value := ReadInteger('ExportSettings', 'CommitInterval', 0);
    LaunchAfterCreationCheckBox.Checked := ReadBool('ExportSettings', 'LaunchAfterCreation', False);
    FilenameEdit.Text := ReadString('ExportSettings', 'Filename', '');
  finally
    Free;
  end;
end;

procedure TExportTableDataDialog.WriteIniFile;
begin
  with TBigIniFile.Create(GetINIFilename) do
  try
    WriteInteger('ExportSettings', 'Format', FormatComboBox.ItemIndex);
    WriteInteger('ExportSettings', 'Delimiter', DelimiterComboBox.ItemIndex);
    WriteBool('ExportSettings', 'IncludeColumnHeaders', IncludeColumnHeadersCheckBox.Checked);
    WriteBool('ExportSettings', 'QuoteStringColumns', QuotedStringColumnsCheckBox.Checked);
    WriteBool('ExportSettings', 'SingleQuote', SingleQuoteRadioButton.Checked);
    WriteBool('ExportSettings', 'DoubleQuote', DoubleQuoteRadioButton.Checked);
    if PageControl.ActivePage = Options1TabSheet then
      WriteBool('ExportSettings', 'IncludeNullColumns', IncludeNullColumns1CheckBox.Checked)
    else
      WriteBool('ExportSettings', 'IncludeNullColumns', IncludeNullColumns2CheckBox.Checked);
    WriteBool('ExportSettings', 'DelimiterAfterLastColumn', DelimiterAfterLastColumnCheckBox.Checked);
    WriteBool('ExportSettings', 'FileOutput', FileRadioButton.Checked);
    WriteBool('ExportSettings', 'ClipboardOutput', ClipboardRadioButton.Checked);
    WriteBool('ExportSettings', 'LoadInEditorOutput', LoadInEditorRadioButton.Checked);
    WriteInteger('ExportSettings', 'CommitInterval', StrToInt(CommitIntervalSpinEdit.Text));
    WriteBool('ExportSettings', 'LaunchAfterCreation', LaunchAfterCreationCheckBox.Checked);
    WriteString('ExportSettings', 'Filename', FilenameEdit.Text);
  finally
    Free;
  end;
end;

procedure TExportTableDataDialog.InsertStatementOutput({SynEdit: TSynEdit;}SList: TStringList;  OraQuery: TOraQuery);
var
  i: Integer;
  s, row, FieldValue: string;
  RightMargin: Integer;
  StringList: TStrings;
  IncludeNullColumns, AddField: Boolean;
begin
  IncludeNullColumns := IncludeNullColumns2CheckBox.Checked;
  StringList := TStringList.Create;
  try
    for i := 0 to SchemaFilterCheckListBox.Items.Count - 1 do
    begin
      AddField := (IncludeNullColumns and OraQuery.FieldByName(SchemaFilterCheckListBox.Items[i]).IsNull) or
        not OraQuery.FieldByName(SchemaFilterCheckListBox.Items[i]).IsNull;

      if AddField and SchemaFilterCheckListBox.Checked[i] then
        StringList.Add(SchemaFilterCheckListBox.Items[i]);
    end;

    RightMargin := OptionsContainer.MarginRightMargin;
    //SynEdit.Text := SynEdit.Text + 'INSERT INTO ' + LowerCase(SchemaEdit.Text) + '.' + LowerCase(TableEdit.Text) + CHR_ENTER;
    row := 'INSERT INTO ' + LowerCase(SchemaEdit.Text) + '.' + LowerCase(TableEdit.Text) + CHR_ENTER;
    s := '            (';
    i := 0;
    while i < StringList.Count do
    begin
      s := s + LowerCase(Trim(StringList.Strings[i]));

      Inc(i);
      if i < StringList.Count then
      begin
        s := s + ', ';

        if Length(s) + Length(Trim(StringList.Strings[i])) > RightMargin then
        begin
          //SynEdit.Text := SynEdit.Text + s + CHR_ENTER;
          Row := Row + s + CHR_ENTER;
          s := '             ';
        end;
      end;
    end;

    if s <> '' then
      //SynEdit.Text := SynEdit.Text + s;
      Row := Row + s;

    //SynEdit.Text := SynEdit.Text + ')' + CHR_ENTER;
    Row := Row + ')' + CHR_ENTER;
    s := '     VALUES (';
    i := 0;
    while i < StringList.Count do
    begin
      FieldValue := Trim(OraQuery.FieldByName(StringList.Strings[i]).AsWideString);
      if OraQuery.FieldByName(StringList.Strings[i]).DataType = ftWideString then
        FieldValue := AnsiQuotedStr(FieldValue, '''');
      if OraQuery.FieldByName(StringList.Strings[i]).IsNull then
      begin
        if OraQuery.FieldByName(StringList.Strings[i]).DataType = ftWideString then
          FieldValue := ''''''
        else
          FieldValue := 'NULL';
      end;
      if OraQuery.FieldByName(StringList.Strings[i]).DataType = ftFloat then
        FieldValue := StringReplace(FieldValue, ',', '.', []);

      if not OraQuery.FieldByName(StringList.Strings[i]).IsNull and (OraQuery.FieldByName(StringList.Strings[i]).DataType = ftDateTime) then
        FieldValue := 'TO_DATE(' + QuotedStr(
        {FormatDateTime(OptionsContainer.DateFormat + ' hh:nn:ss', }OraQuery.FieldByName(StringList.Strings[i]).AsString){)} +
          ', ' + QuotedStr(OptionsContainer.DateFormat + ' ' + OptionsContainer.TimeFormat) + ')';

      s := s + FieldValue;
      Inc(i);
      if i < StringList.Count then
      begin
        s := s + ', ';

        if Length(s) + Length(Trim(OraQuery.FieldByName(StringList.Strings[i]).AsWideString)) > RightMargin then
        begin
          //SynEdit.Text := SynEdit.Text + s + CHR_ENTER;
          Row := Row + s + CHR_ENTER;
          s := '             ';
        end;
      end;
    end;

    if s <> '' then
      //SynEdit.Text := SynEdit.Text + s;
      Row := Row + s;

    //SynEdit.Text := SynEdit.Text + ');' + CHR_ENTER;
    Row := Row + ');' + CHR_ENTER;
    SList.Add(Row);
  finally
    StringList.Free;
  end;
end;

procedure TExportTableDataDialog.CSVFileOutput({SynEdit: TSynEdit;}SList: TStringList; OraQuery: TOraQuery; AddHeader: Boolean);
var
  i: Integer;
  s: string;
  Delimiter: Char;
  FieldValue: string;
  StringList: TStrings;
  IncludeNullColumns, AddField: Boolean;
begin
  case DelimiterComboBox.ItemIndex of
    0: Delimiter := ',';
    1: Delimiter := '|';
    2: Delimiter := ';';
    3: Delimiter := Chr(9);
  else
    Delimiter := ' ';
  end;
  IncludeNullColumns := IncludeNullColumns1CheckBox.Checked;
  StringList := TStringList.Create;
  try
    for i := 0 to SchemaFilterCheckListBox.Items.Count - 1 do
    begin
      AddField := (IncludeNullColumns and OraQuery.FieldByName(SchemaFilterCheckListBox.Items[i]).IsNull) or
        not OraQuery.FieldByName(SchemaFilterCheckListBox.Items[i]).IsNull;

      if AddField and SchemaFilterCheckListBox.Checked[i] then
        StringList.Add(SchemaFilterCheckListBox.Items[i]);
    end;
    if AddHeader then
      if IncludeColumnHeadersCheckBox.Checked then
      begin
        for i := 0 to StringList.Count - 1 do
        begin
          //SynEdit.Text := SynEdit.Text + StringList.Strings[i];
          s := s + StringList.Strings[i];
          if (i < StringList.Count - 1) or
            ((i = StringList.Count - 1) and DelimiterAfterLastColumnCheckBox.Checked) then
            //SynEdit.Text := SynEdit.Text + Delimiter;
            s := s + Delimiter;
        end;
        SList.Add(s);
        //SynEdit.Text := SynEdit.Text + CHR_ENTER;
      end;
    s := '';
    for i := 0 to StringList.Count - 1 do
    begin
      FieldValue := Trim(OraQuery.FieldByName(StringList.Strings[i]).AsWideString);
      if QuotedStringColumnsCheckBox.Checked and (OraQuery.FieldByName(StringList.Strings[i]).DataType = ftWideString) then
      begin
        if SingleQuoteRadioButton.Checked then
          FieldValue := QuotedStr(FieldValue)
        else
          FieldValue := '"' + FieldValue + '"';
      end;

      //SynEdit.Text := SynEdit.Text + FieldValue;
      s := s + FieldValue;
      if (i < StringList.Count - 1) or
        ((i = StringList.Count - 1) and DelimiterAfterLastColumnCheckBox.Checked) then
        //SynEdit.Text := SynEdit.Text + Delimiter;
        s := s + Delimiter;
    end;
    //SynEdit.Text := SynEdit.Text + CHR_ENTER;
    SList.Add(s);
  finally
    FreeAndNil(StringList);
  end;
end;

end.
