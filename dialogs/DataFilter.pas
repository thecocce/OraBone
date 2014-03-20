unit DataFilter;

interface

uses
  System.SysUtils, System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, SynEdit, ActnList,
  JvExStdCtrls, JvListBox, SynEditHighlighter, BCDialogs.Dlg, SynHighlighterSQL, ValEdit, JvStringHolder, Menus,
  BCControls.Edit, Vcl.ExtCtrls, System.Actions;

type
  TDataFilterDialog = class(TDialog)
    ActionList: TActionList;
    AndAction: TAction;
    AndButton: TButton;
    BetweenAction: TAction;
    BetweenButton: TButton;
    Button11: TButton;
    CancelButton: TButton;
    ClearFilterAction: TAction;
    ColumnClickAction: TAction;
    ColumnListBox: TJvListBox;
    EqualAction: TAction;
    EqualButton: TButton;
    EqualOrGreaterAction: TAction;
    EqualOrGreaterButton: TButton;
    FilterMultiStringHolder: TJvMultiStringHolder;
    FilterNameEdit: TBCEdit;
    FilterSynEdit: TSynEdit;
    GreaterAction: TAction;
    GreaterButton: TButton;
    InAction: TAction;
    InButton: TButton;
    InequalAction: TAction;
    InequalButton: TButton;
    Label1: TLabel;
    OKAction: TAction;
    OKButton: TButton;
    OrAction: TAction;
    OrButton: TButton;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Separator1Panel: TPanel;
    SmallerAction: TAction;
    SmallerButton: TButton;
    SmallerOrEqualAction: TAction;
    SmallerOrEqualButton: TButton;
    SynSQLSyn: TSynSQLSyn;
    ToDateAction: TAction;
    ToDateButton: TButton;
    LikeButton: TButton;
    LikeAction: TAction;
    procedure AndActionExecute(Sender: TObject);
    procedure BetweenActionExecute(Sender: TObject);
    procedure ClearFilterActionExecute(Sender: TObject);
    procedure ColumnClickActionExecute(Sender: TObject);
    procedure EqualActionExecute(Sender: TObject);
    procedure EqualOrGreaterActionExecute(Sender: TObject);
    procedure FilterNameEditChange(Sender: TObject);
    procedure FilterNameEditKeyPress(Sender: TObject; var Key: Char);
    procedure FilterSynEditChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure GreaterActionExecute(Sender: TObject);
    procedure InActionExecute(Sender: TObject);
    procedure InequalActionExecute(Sender: TObject);
    procedure OKActionExecute(Sender: TObject);
    procedure OrActionExecute(Sender: TObject);
    procedure SmallerActionExecute(Sender: TObject);
    procedure SmallerOrEqualActionExecute(Sender: TObject);
    procedure ToDateActionExecute(Sender: TObject);
    procedure LikeActionExecute(Sender: TObject);
  private
    { Private declarations }
    FObjectName: string;
    FSchemaParam: string;
    function GetDataFilter: WideString;
    procedure SetFields;
  public
    { Public declarations }
    ValuesList: TValueListEditor; { Save filter values }
    function GetCurrentDataFilter(ObjectName: string; SchemaParam: string): string;
    function GetCurrentFilterName(ObjectName: string; SchemaParam: string): string;
    function Open(ObjectName: string; SchemaParam: string; Columns: TStrings{; DataFilter: WideString}): Boolean;
    procedure SetCurrentDataFilter(ObjectName: string; SchemaParam: string; Name: string);
    property DataFilter: WideString read GetDataFilter;
  end;

function DataFilterDialog: TDataFilterDialog;

implementation

{$R *.dfm}

uses
  BCCommon.OptionsContainer, BCCommon.StyleUtils, SynEditKeyCmds, BCCommon.StringUtils;

var
  FDataFilterDialog: TDataFilterDialog;

function DataFilterDialog: TDataFilterDialog;
begin
  if not Assigned(FDataFilterDialog) then
    Application.CreateForm(TDataFilterDialog, FDataFilterDialog);
  Result := FDataFilterDialog;
  SetStyledFormSize(Result);
end;

procedure TDataFilterDialog.SetFields;
begin
  OKAction.Enabled := (Trim(FilterNameEdit.Text) <> '') and
    (Trim(FilterSynEdit.Text) <> '');
end;

procedure TDataFilterDialog.AndActionExecute(Sender: TObject);
begin
  FilterSynEdit.SetFocus;
  FilterSynEdit.ExecuteCommand(ecImeStr, #0, PWideChar(' AND '));
end;

procedure TDataFilterDialog.BetweenActionExecute(Sender: TObject);
begin
  FilterSynEdit.SetFocus;
  FilterSynEdit.ExecuteCommand(ecImeStr, #0, PWideChar(' BETWEEN  AND '));
  FilterSynEdit.CaretX := FilterSynEdit.CaretX - 5;
end;

procedure TDataFilterDialog.ClearFilterActionExecute(Sender: TObject);
begin
  FilterSynEdit.Clear;
end;

procedure TDataFilterDialog.ColumnClickActionExecute(Sender: TObject);
var
  i: Integer;
begin
  FilterSynEdit.SetFocus;
  for i := 0 to ColumnListBox.Count - 1 do
    if ColumnListBox.Selected[i] then
      FilterSynEdit.ExecuteCommand(ecImeStr, #0, PWideChar(Trim(ColumnListBox.Items.Strings[i])));
end;

procedure TDataFilterDialog.EqualActionExecute(Sender: TObject);
begin
  FilterSynEdit.SetFocus;
  FilterSynEdit.ExecuteCommand(ecImeStr, #0, PWideChar(' = '));
end;

procedure TDataFilterDialog.EqualOrGreaterActionExecute(Sender: TObject);
begin
  FilterSynEdit.SetFocus;
  FilterSynEdit.ExecuteCommand(ecImeStr, #0, PWideChar(' => '));
end;

procedure TDataFilterDialog.FilterNameEditChange(Sender: TObject);
begin
  SetFields;
end;

procedure TDataFilterDialog.FilterNameEditKeyPress(Sender: TObject; var Key: Char);
begin
  if not (CharInSet(Key, ['a'..'z', 'ä', 'Ä', 'å', 'Å', 'ö', 'Ö', 'A'..'Z', '0'..'9', #8, ' ', '%'])) then
    Key := #0;
end;

procedure TDataFilterDialog.FilterSynEditChange(Sender: TObject);
begin
  SetFields;
end;

procedure TDataFilterDialog.FormCreate(Sender: TObject);
begin
  ValuesList := TValueListEditor.Create(nil);
  ValuesList.Strings.Clear;
  UpdateMargin(FilterSynEdit);
  UpdateSQLSynColors(SynSQLSyn);
end;

procedure TDataFilterDialog.SetCurrentDataFilter(ObjectName: string; SchemaParam: string; Name: string);
var
  i: Integer;
  Found: Boolean;
  KeyValue: string;
begin
  { Get Data Filter }
  KeyValue := EncryptString(ObjectName + '@' + SchemaParam + ':' + Name);
  for i := 0 to ValuesList.RowCount - 1 do
    if KeyValue = ValuesList.Keys[i] then
    begin
      FilterNameEdit.Text := Name;
      FilterSynEdit.Text := DecryptString(ValuesList.Values[ValuesList.Keys[i]]);
      Break;
    end;
  { Update Current Data Filter }
  Found := False;
  KeyValue := EncryptString(ObjectName + '@' + SchemaParam + ':CURRENT');
  for i := 0 to ValuesList.RowCount - 1 do
    if KeyValue = ValuesList.Keys[i] then
    begin
       Found := True;
       //ValuesList.Keys[i] := ObjectName + '@' + SchemaParam + ':CURRENT';
       ValuesList.Values[ValuesList.Keys[i]] := EncryptString(Name);
       Break;
    end;
  { insert if not found }
  if not Found then
    ValuesList.InsertRow(KeyValue, EncryptString(Name), True);
end;

procedure TDataFilterDialog.SmallerActionExecute(Sender: TObject);
begin
  FilterSynEdit.SetFocus;
  FilterSynEdit.ExecuteCommand(ecImeStr, #0, PWideChar(' < '));
end;

procedure TDataFilterDialog.SmallerOrEqualActionExecute(Sender: TObject);
begin
  FilterSynEdit.SetFocus;
  FilterSynEdit.ExecuteCommand(ecImeStr, #0, PWideChar(' <= '));
end;

procedure TDataFilterDialog.ToDateActionExecute(Sender: TObject);
begin
  FilterSynEdit.SetFocus;
  FilterSynEdit.ExecuteCommand(ecImeStr, #0, PWideChar('TO_DATE('''', ' + QuotedStr(OptionsContainer.DateFormat + ' ' + OptionsContainer.TimeFormat) + ') '));
  FilterSynEdit.CaretX := FilterSynEdit.CaretX - Length(QuotedStr(OptionsContainer.DateFormat + ' ' + OptionsContainer.TimeFormat)) - 5;
end;

function TDataFilterDialog.GetCurrentDataFilter(ObjectName: string; SchemaParam: string): string;
var
  i: Integer;
  FilterName, KeyValue: string;
begin
  Result := '';
  FilterName := GetCurrentFilterName(ObjectName, SchemaParam);
  KeyValue := EncryptString(ObjectName + '@' + SchemaParam + ':' + FilterName);
  for i := 0 to ValuesList.RowCount - 1 do
    if KeyValue = ValuesList.Keys[i] then
    begin
      Result := DecryptString(ValuesList.Values[ValuesList.Keys[i]]);
      Break;
    end;
end;

function TDataFilterDialog.GetCurrentFilterName(ObjectName: string; SchemaParam: string): string;
var
  i: Integer;
  KeyValue: string;
begin
  Result := '';
  KeyValue := EncryptString(ObjectName + '@' + SchemaParam + ':CURRENT');
  for i := 0 to ValuesList.RowCount - 1 do
    if KeyValue = ValuesList.Keys[i] then
    begin
      Result := DecryptString(ValuesList.Values[ValuesList.Keys[i]]);
      Break;
    end;
end;

procedure TDataFilterDialog.FormDestroy(Sender: TObject);
begin
  ValuesList.Free;
  FDataFilterDialog := nil;
end;

// FilterMultiStringHolder name: Object Name@S@SchemaParam
//                               object name@F@FilterName

procedure TDataFilterDialog.OKActionExecute(Sender: TObject);
var
  i: Integer;
  FilterName, KeyValue: string;
  Found: Boolean;
begin
  { Update Current Data Filter }
  Found := False;
  KeyValue := EncryptString(FObjectName + '@' + FSchemaParam + ':CURRENT');
  for i := 0 to ValuesList.RowCount - 1 do
    if KeyValue = ValuesList.Keys[i] then
    begin
       Found := True;
      // ValuesList.Keys[i] := FObjectName + '@' + FSchemaParam + ':CURRENT' + ':' + FilterNameEdit.Text;
       ValuesList.Values[ValuesList.Keys[i]] := EncryptString(FilterNameEdit.Text);
       Break;
    end;
  { insert if not found }
  if not Found then
    ValuesList.InsertRow(KeyValue, EncryptString(FilterNameEdit.Text), True);

  FilterName := EncryptString(FObjectName + '@' + FSchemaParam + ':' + FilterNameEdit.Text);
  if not ValuesList.FindRow(FilterName, i) then
    ValuesList.InsertRow(FilterName, EncryptString(DataFilter), True)
  else
    ValuesList.Values[ValuesList.Keys[i]] := EncryptString(DataFilter);

  ModalResult := mrOk;
end;

function TDataFilterDialog.Open(ObjectName: string; SchemaParam: string; Columns: TStrings{; DataFilter: WideString}): Boolean;
begin
  ColumnListBox.Items := Columns;

  FilterSynEdit.Text := '';

  FilterNameEdit.Text := GetCurrentFilterName(ObjectName, SchemaParam);
  if FilterNameEdit.Text = '' then
    FilterNameEdit.Text := 'Unnamed';
  if Trim(FilterNameEdit.Text) <> '' then
    FilterSynEdit.Text := GetCurrentDataFilter(ObjectName, SchemaParam);

  FObjectName := ObjectName;
  FSchemaParam := SchemaParam;
  SetFields;

  Result := ShowModal = mrOk;
end;

procedure TDataFilterDialog.OrActionExecute(Sender: TObject);
begin
  FilterSynEdit.SetFocus;
  FilterSynEdit.ExecuteCommand(ecImeStr, #0, PWideChar(' OR '));
end;

function TDataFilterDialog.GetDataFilter: WideString;
begin
  Result := FilterSynEdit.Text;
end;

procedure TDataFilterDialog.GreaterActionExecute(Sender: TObject);
begin
  FilterSynEdit.SetFocus;
  FilterSynEdit.ExecuteCommand(ecImeStr, #0, PWideChar(' > '));
end;

procedure TDataFilterDialog.InActionExecute(Sender: TObject);
begin
  FilterSynEdit.SetFocus;
  FilterSynEdit.ExecuteCommand(ecImeStr, #0, PWideChar(' IN ()'));
  FilterSynEdit.CaretX := FilterSynEdit.CaretX - 1;
end;

procedure TDataFilterDialog.InequalActionExecute(Sender: TObject);
begin
  FilterSynEdit.SetFocus;
  FilterSynEdit.ExecuteCommand(ecImeStr, #0, PWideChar(' <> '));
end;

procedure TDataFilterDialog.LikeActionExecute(Sender: TObject);
begin
  FilterSynEdit.SetFocus;
  FilterSynEdit.ExecuteCommand(ecImeStr, #0, PWideChar(' LIKE '));
end;

end.
