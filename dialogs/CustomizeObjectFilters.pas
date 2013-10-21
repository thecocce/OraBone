unit CustomizeObjectFilters;

interface

uses
  System.SysUtils, System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, CheckLst, ActnList,
  DB, MemDS, DBAccess, Ora, JvStringHolder, BCControls.ComboBox, JvExControls, JvSpeedButton, Vcl.ExtCtrls,
  BCDialogs.Dlg, System.Actions;

type
  TCustomizeObjectFiltersDialog = class(TDialog)
    ActionList: TActionList;
    BottomPanel: TPanel;
    CancelButton: TButton;
    ClientPanel: TPanel;
    DeselectAllAction: TAction;
    DeselectAllButton: TButton;
    NameComboBox: TBCComboBox;
    NameLabel: TLabel;
    ObjectsCheckListBox: TCheckListBox;
    ObjectsQuery: TOraQuery;
    OKAction: TAction;
    OKButton: TButton;
    RemoveAction: TAction;
    RemoveSpeedButton: TJvSpeedButton;
    SelectAllAction: TAction;
    SelectAllButton: TButton;
    Separator1Panel: TPanel;
    Separator2Panel: TPanel;
    Separator3Panel: TPanel;
    SQLStringHolder: TJvMultiStringHolder;
    TopPanel: TPanel;
    procedure DeselectAllActionExecute(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure NameComboBoxChange(Sender: TObject);
    procedure OKActionExecute(Sender: TObject);
    procedure RemoveActionExecute(Sender: TObject);
    procedure SelectAllActionExecute(Sender: TObject);
  private
    { Private declarations }
    FObjectType: string;
    FSchemaName: string;
    FSchemaParam: string;
    function GetFilterName: string;
    function GetObjects: string;
    procedure FillCombo;
    procedure GetTableAndField(var Table: string; var Field: String; var ExtraCondition: string);
    procedure SetObjects;
  public
    { Public declarations }
    function Open(OraSession: TOraSession; SchemaParam: string; ObjectType: string; SchemaName: string): Boolean;
    property FilterName: string read GetFilterName;
  end;

function CustomizeObjectFiltersDialog: TCustomizeObjectFiltersDialog;

implementation

{$R *.dfm}

uses
  BigIni, Lib, BCCommon.StyleUtils, BCCommon.Messages, BCCommon.FileUtils, BCCommon.StringUtils;

const
  CAPTION_TEXT = 'Customize %s Filters';

var
  FCustomizeObjectFiltersDialog: TCustomizeObjectFiltersDialog;

function CustomizeObjectFiltersDialog: TCustomizeObjectFiltersDialog;
begin
  if not Assigned(FCustomizeObjectFiltersDialog) then
    Application.CreateForm(TCustomizeObjectFiltersDialog, FCustomizeObjectFiltersDialog);
  Result := FCustomizeObjectFiltersDialog;
  SetStyledFormSize(Result);
end;

procedure TCustomizeObjectFiltersDialog.DeselectAllActionExecute(Sender: TObject);
begin
  ObjectsCheckListBox.CheckAll(cbUnChecked, false, false);
end;

procedure TCustomizeObjectFiltersDialog.FormDestroy(Sender: TObject);
begin
  FCustomizeObjectFiltersDialog := nil;
end;

procedure TCustomizeObjectFiltersDialog.SelectAllActionExecute(Sender: TObject);
begin
  ObjectsCheckListBox.CheckAll(cbChecked, false, false);
end;

function TCustomizeObjectFiltersDialog.GetObjects: string;
var
  i: Integer;
begin
  Result := '';
  for i := 0 to ObjectsCheckListBox.Count - 1 do
    if ObjectsCheckListBox.Checked[i] then
    begin
      if Result <> '' then
        Result := Result + ',';
      Result := Result + QuotedStr(ObjectsCheckListBox.Items.Strings[i]);
    end;
end;

function TCustomizeObjectFiltersDialog.GetFilterName: string;
begin
  Result := Trim(NameComboBox.Text);
end;

procedure TCustomizeObjectFiltersDialog.OKActionExecute(Sender: TObject);
var
  i: Integer;
  Objects, KeyValue: string;
  SchemaObjectFilters: TStrings;
begin
  if FilterName = '' then
  begin
    ShowErrorMessage('Set name.');
    Exit;
  end;
  Objects := GetObjects;
  SchemaObjectFilters := TStringList.Create;
  KeyValue := Lib.GetObjectFilterKeyValue(FObjectType, FilterName, FSchemaName);
  with TBigIniFile.Create(GetINIFilename) do
  try
    { delete key, string is crypted, so it must be deleted like this }
    ReadSectionValues('SchemaObjectFilters', SchemaObjectFilters);
    for i := 0 to SchemaObjectFilters.Count - 1 do
      if KeyValue = DecryptString(System.Copy(SchemaObjectFilters.Strings[i], 0, Pos('=', SchemaObjectFilters.Strings[i]) - 1)) then
      begin
        DeleteKey('SchemaObjectFilters', System.Copy(SchemaObjectFilters.Strings[i], 0, Pos('=', SchemaObjectFilters.Strings[i]) - 1));
        Break;
      end;
    { write ini }
    WriteString('SchemaObjectFilters', EncryptString(KeyValue), EncryptString(Objects));
  finally
    Free;
  end;
  ModalResult := mrOk;
end;

procedure TCustomizeObjectFiltersDialog.GetTableAndField(var Table: string; var Field: string;
  var ExtraCondition: string);
begin
  ExtraCondition := 'AND owner = :p_owner';
  if FObjectType = OBJECT_TYPE_TABLE then
  begin
    Field := 'table_name';
    Table := 'all_tables';
    ExtraCondition := ExtraCondition +
      ' AND table_name NOT IN (SELECT mview_name FROM all_mviews)';
  end
  else
  if FObjectType = OBJECT_TYPE_VIEW then
  begin
    Field := 'view_name';
    Table := 'all_views';
  end
  else
  if FObjectType = OBJECT_TYPE_FUNCTION then
  begin
    Field := 'name';
    Table := 'all_source';
    ExtraCondition := ExtraCondition + ' AND type = ''FUNCTION''';
  end
  else
  if FObjectType = OBJECT_TYPE_PROCEDURE then
  begin
    Field := 'name';
    Table := 'all_source';
    ExtraCondition := ExtraCondition + ' AND type = ''PROCEDURE''';
  end
  else
  if FObjectType = OBJECT_TYPE_PACKAGE then
  begin
    Field := 'name';
    Table := 'all_source';
    ExtraCondition := ExtraCondition + ' AND type = ''PACKAGE''';
  end
  else
  if FObjectType = OBJECT_TYPE_TRIGGER then
  begin
    Field := 'trigger_name';
    Table := 'all_triggers';
  end
  else
  if FObjectType = OBJECT_TYPE_CONSTRAINT then
  begin
    Field := 'constraint_name';
    Table := 'all_constraints';
  end
  else
  if FObjectType = OBJECT_TYPE_INDEX then
  begin
    Field := 'index_name';
    Table := 'all_indexes';
  end
  else
  if FObjectType = OBJECT_TYPE_SEQUENCE then
  begin
    Field := 'sequence_name';
    Table := 'all_sequences';
    ExtraCondition := 'AND sequence_owner = :p_owner';
  end
  else
  if FObjectType = OBJECT_TYPE_SYNONYM then
  begin
    Field := 'synonym_name';
    Table := 'all_synonyms';
    ExtraCondition := 'AND table_owner = :p_owner';
  end
  else
  if FObjectType = OBJECT_TYPE_DATABASE_LINK then
  begin
    Field := 'db_link';
    Table := 'all_db_links';
  end
  else
  if FObjectType = OBJECT_TYPE_USER then
  begin
    Field := 'username';
    Table := 'dba_users';
    ExtraCondition := '';
  end
end;

procedure TCustomizeObjectFiltersDialog.NameComboBoxChange(Sender: TObject);
begin
  if NameComboBox.Items.IndexOf(NameComboBox.Text) <> -1 then
    SetObjects;
end;

procedure TCustomizeObjectFiltersDialog.SetObjects;
var
  i, ObjectsLength: Integer;
  Objects, Field, Table, ExtraCondition: string;
begin
  GetTableAndField(Table, Field, ExtraCondition);
  Objects := Lib.GetFilterObjectsFromIni(Lib.GetObjectFilterKeyValue(FObjectType, FilterName, FSchemaName));
  ObjectsLength := Length(Objects);
  if Objects = '' then
    Objects := '''''';

  with ObjectsQuery do
  begin
    SQL.Clear;
    SQL.Add(Format(SQLStringHolder.StringsByName['ObjectsSQL'].Text, [Field, Table, Field, Objects, ObjectsLength,
      ExtraCondition, Field, Table, Field, Objects, ObjectsLength, ExtraCondition]));
    if ParamCount > 0 then
      ParamByName('P_OWNER').AsString := FSchemaParam;
    Open;
    try
      i := 0;
      ObjectsCheckListBox.Clear;
      while not Eof do
      begin
        ObjectsCheckListBox.Items.Add(FieldByName('OBJECT_NAME').AsWideString);
        ObjectsCheckListBox.Checked[i] := FieldByName('CHECKED').AsWideString = 'T';
        Next;
        Inc(i);
      end;
      if FObjectType = OBJECT_TYPE_VIEW then
      begin
        Field := 'mview_name';
        Table := 'all_mviews';
        Close;
        SQL.Clear;
        SQL.Add(Format(SQLStringHolder.StringsByName['ObjectsSQL'].Text, [Field, Table, Field, Objects, ObjectsLength,
          ExtraCondition, Field, Table, Field, Objects, ObjectsLength, ExtraCondition]));
        if ParamCount > 0 then
          ParamByName('P_OWNER').AsString := FSchemaParam;
        Open;
        while not Eof do
        begin
          ObjectsCheckListBox.Items.Add(FieldByName('OBJECT_NAME').AsWideString);
          ObjectsCheckListBox.Checked[i] := FieldByName('CHECKED').AsWideString = 'T';
          Next;
          Inc(i);
        end;
      end
    finally
      Close;
    end;
  end;
end;

procedure TCustomizeObjectFiltersDialog.FillCombo;
begin
  NameComboBox.Items := Lib.GetObjectFilterNames(FObjectType, FSchemaName);
end;

function TCustomizeObjectFiltersDialog.Open(OraSession: TOraSession; SchemaParam: string;
  ObjectType: string; SchemaName: string): Boolean;
var
  Rslt: Integer;
begin
  Caption := Format(CAPTION_TEXT, [AnsiInitCap(ObjectType)]);
  Lib.SetSession(Self, OraSession);
  FSchemaParam := SchemaParam;
  FObjectType := ObjectType;
  FSchemaName := SchemaName;

  FillCombo;
  SetObjects;

  Rslt := ShowModal;

  Result := Rslt = mrOk;
end;


procedure TCustomizeObjectFiltersDialog.RemoveActionExecute(Sender: TObject);
var
  i: Integer;
  KeyValue: string;
  SchemaObjectFilters: TStrings;
begin
  if FilterName = '' then
  begin
    ShowErrorMessage('Choose a filter.');
    NameComboBox.SetFocus;
    Exit;
  end;
  if AskYesOrNo(Format('Remove filter %s, are you sure?', [FilterName])) then
  begin
    SchemaObjectFilters := TStringList.Create;
    KeyValue := Lib.GetObjectFilterKeyValue(FObjectType, FilterName, FSchemaName);
    with TBigIniFile.Create(GetINIFilename) do
    try
      { delete key, string is crypted, so it must be deleted like this }
      ReadSectionValues('SchemaObjectFilters', SchemaObjectFilters);
      for i := 0 to SchemaObjectFilters.Count - 1 do
        if KeyValue = DecryptString(System.Copy(SchemaObjectFilters.Strings[i], 0, Pos('=', SchemaObjectFilters.Strings[i]) - 1)) then
        begin
          DeleteKey('SchemaObjectFilters', System.Copy(SchemaObjectFilters.Strings[i], 0, Pos('=', SchemaObjectFilters.Strings[i]) - 1));
          Break;
        end;
    finally
      Free;
    end;
    NameComboBox.Text := '';
    FillCombo;
    SetObjects;
  end;
end;

end.
