unit SchemaFilter;

interface

uses
  System.SysUtils, System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, CheckLst, DB,
  MemDS, DBAccess, Ora, ActnList, JvStringHolder, Vcl.ExtCtrls, BCDialogs.Dlg, System.Actions;

type
  TSchemaFilterDialog = class(TDialog)
    ActionList: TActionList;
    BottomPanel: TPanel;
    CancelButton: TButton;
    DeselectAllAction: TAction;
    DeselectAllButton: TButton;
    OKAction: TAction;
    OKButton: TButton;
    Panel2: TPanel;
    SchemaFilterCheckListBox: TCheckListBox;
    SchemasQuery: TOraQuery;
    SelectAllAction: TAction;
    SelectAllButton: TButton;
    Separator1Panel: TPanel;
    Separator2Panel: TPanel;
    SQLStringHolder: TJvMultiStringHolder;
    procedure DeselectAllActionExecute(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure OKActionExecute(Sender: TObject);
    procedure SelectAllActionExecute(Sender: TObject);
  private
    { Private declarations }
    FKeyValue: string;
    function GetSchemaFilters: string;
    procedure SetSchemaFilters(SchemaFilters: string; FilterLength: Integer);
  public
    { Public declarations }
    function Open(OraSession: TOraSession; KeyValue: string; SchemaFilters: string): Boolean;
  end;

function SchemaFilterDialog: TSchemaFilterDialog;

implementation

{$R *.dfm}

uses
  BigIni, Lib, BCCommon.StyleUtils, BCCommon.FileUtils, BCCommon.StringUtils;

var
  FSchemaFilterDialog: TSchemaFilterDialog;

function SchemaFilterDialog: TSchemaFilterDialog;
begin
  if not Assigned(FSchemaFilterDialog) then
    Application.CreateForm(TSchemaFilterDialog, FSchemaFilterDialog);
  Result := FSchemaFilterDialog;
  SetStyledFormSize(Result);
end;

procedure TSchemaFilterDialog.DeselectAllActionExecute(Sender: TObject);
begin
  SchemaFilterCheckListBox.CheckAll(cbUnChecked, false, false);
end;

procedure TSchemaFilterDialog.SelectAllActionExecute(Sender: TObject);
begin
  SchemaFilterCheckListBox.CheckAll(cbChecked, false, false);
end;

procedure TSchemaFilterDialog.FormDestroy(Sender: TObject);
begin
  FSchemaFilterDialog := nil;
end;

function TSchemaFilterDialog.GetSchemaFilters: string;
var
  i: Integer;
  AllSelected: Boolean;
begin
  Result := '';
  { check if all selected }
  AllSelected := True;
  for i := 0 to SchemaFilterCheckListBox.Count - 1 do
    if not SchemaFilterCheckListBox.Checked[i] then
    begin
      AllSelected := False;
      Break;
    end;
  if not AllSelected then
  for i := 0 to SchemaFilterCheckListBox.Count - 1 do
    if SchemaFilterCheckListBox.Checked[i] then
    begin
      if Result <> '' then
        Result := Result + ',';
      Result := Result + QuotedStr(SchemaFilterCheckListBox.Items.Strings[i]);
    end;
end;

procedure TSchemaFilterDialog.OKActionExecute(Sender: TObject);
var
  i: Integer;
  Filters: string;
  SchemaFilters: TStrings;
begin
  Filters := GetSchemaFilters;
  SchemaFilters := TStringList.Create;
  with TBigIniFile.Create(GetINIFilename) do
  try
    { delete key, string is crypted, so it must be deleted like this }
    ReadSectionValues('SchemaFilters', SchemaFilters);
    for i := 0 to SchemaFilters.Count - 1 do
      if FKeyValue = DecryptString(System.Copy(SchemaFilters.Strings[i], 0, Pos('=', SchemaFilters.Strings[i]) - 1)) then
      begin
        DeleteKey('SchemaFilters', System.Copy(SchemaFilters.Strings[i], 0, Pos('=', SchemaFilters.Strings[i]) - 1));
        Break;
      end;
    { write ini }
    if Filters <> '' then
      WriteString('SchemaFilters', EncryptString(FKeyValue), EncryptString(Filters));
  finally
    Free;
  end;
  ModalResult := mrOk;
end;

procedure TSchemaFilterDialog.SetSchemaFilters(SchemaFilters: string; FilterLength: Integer);
var
  i: Integer;
  Schema: string;
begin
  with SchemasQuery do
  begin
    SQL.Clear;
    SQL.Add(Format(SQLStringHolder.StringsByName['SchemasSQL'].Text, [SchemaFilters, FilterLength,
      SchemaFilters, FilterLength]));
    Open;
    try
      i := 0;
      SchemaFilterCheckListBox.Clear;
      while not Eof do
      begin
        SchemaFilterCheckListBox.Items.Add(FieldByName('USERNAME').AsWideString);
        SchemaFilterCheckListBox.Checked[i] := FieldByName('CHECKED').AsWideString = 'T';
        Next;
        Inc(i);
      end;
      Schema := Copy(FKeyValue, 0, Pos('@', FKeyValue) - 1);
      i := SchemaFilterCheckListBox.Items.IndexOf(Schema);
      if i <> - 1 then
        SchemaFilterCheckListBox.ItemEnabled[i] := False;
    finally
      Close;
    end;
  end;
end;

function TSchemaFilterDialog.Open(OraSession: TOraSession; KeyValue: string; SchemaFilters: string): Boolean;
var
  Rslt, FilterLength: Integer;
  Filters: string;
begin
  Lib.SetSession(Self, OraSession);
  Filters := SchemaFilters;
  FKeyValue := KeyValue;
  FilterLength := Length(Filters);
  if Filters = '' then
    Filters := '''''';

  SetSchemaFilters(Filters, FilterLength);

  Rslt := ShowModal;

  Result := Rslt = mrOk;
end;

end.
