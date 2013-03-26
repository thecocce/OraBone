unit DataFilter;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms,
  Vcl.Dialogs, Vcl.StdCtrls, SynEdit, ActnList, JvExStdCtrls, JvListBox, SynEditHighlighter, Dlg,
  SynHighlighterSQL, ValEdit, JvStringHolder, Menus, BCEdit, JvEdit, Vcl.ExtCtrls;

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
  private
    { Private declarations }
    FObjectName: string;
    FSchemaParam: string;
    function GetDataFilter: WideString;
    procedure InsertText(Text: string);
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
  Common, Options, Vcl.Themes, StyleHooks;

var
  FDataFilterDialog: TDataFilterDialog;

function DataFilterDialog: TDataFilterDialog;
begin
  if not Assigned(FDataFilterDialog) then
    Application.CreateForm(TDataFilterDialog, FDataFilterDialog);
  Result := FDataFilterDialog;
  StyleHooks.SetStyledFormSize(Result);
end;

procedure TDataFilterDialog.SetFields;
begin
  OKAction.Enabled := (Trim(FilterNameEdit.Text) <> '') and
    (Trim(FilterSynEdit.Text) <> '');
end;

procedure TDataFilterDialog.InsertText(Text: string);
var
  CurPoint: TBufferCoord;
  TempText: string;
begin
  CurPoint := FilterSynEdit.CaretXY;
  TempText := FilterSynEdit.Lines[CurPoint.Line - 1];
  TempText := Copy(TempText, 0, CurPoint.Char - 1) + Text + Copy(TempText, CurPoint.Char + 1, Length(TempText));
  FilterSynEdit.Lines[CurPoint.Line - 1] := TempText;
end;

procedure TDataFilterDialog.AndActionExecute(Sender: TObject);
var
  CaretX: Integer;
begin
  FilterSynEdit.SetFocus;
  CaretX := FilterSynEdit.CaretX;
  InsertText(' AND ');
 // FilterSynEdit.Text := FilterSynEdit.Text + ' AND ';
  FilterSynEdit.CaretX := CaretX + 5;
end;

procedure TDataFilterDialog.BetweenActionExecute(Sender: TObject);
var
  CaretX: Integer;
begin
  FilterSynEdit.SetFocus;
  CaretX := FilterSynEdit.CaretX;
  InsertText(' BETWEEN  AND ');
  //FilterSynEdit.Text := FilterSynEdit.Text + ' BETWEEN  AND ';
  FilterSynEdit.CaretX := CaretX + 9;
end;

procedure TDataFilterDialog.ClearFilterActionExecute(Sender: TObject);
begin
  FilterSynEdit.Clear;
end;

procedure TDataFilterDialog.ColumnClickActionExecute(Sender: TObject);
var
  i: Integer;
  CaretX: Integer;
begin
  FilterSynEdit.SetFocus;
  CaretX := FilterSynEdit.CaretX;
  for i := 0 to ColumnListBox.Count - 1 do
    if ColumnListBox.Selected[i] then
    begin
      //FilterSynEdit.Text := FilterSynEdit.Text + Trim(ColumnListBox.Items.Strings[i]);
      InsertText(Trim(ColumnListBox.Items.Strings[i]));
      FilterSynEdit.CaretX := CaretX + Length(Trim(ColumnListBox.Items.Strings[i]));
    end;
end;

procedure TDataFilterDialog.EqualActionExecute(Sender: TObject);
var
  CaretX: Integer;
begin
  FilterSynEdit.SetFocus;
  CaretX := FilterSynEdit.CaretX;
  InsertText(' = ');
  //FilterSynEdit.Text := FilterSynEdit.Text + ' = ';
  FilterSynEdit.CaretX := CaretX + 3;
end;

procedure TDataFilterDialog.EqualOrGreaterActionExecute(Sender: TObject);
var
  CaretX: Integer;
begin
  FilterSynEdit.SetFocus;
  CaretX := FilterSynEdit.CaretX;
  InsertText(' => ');
  //FilterSynEdit.Text := FilterSynEdit.Text + ' => ';
  FilterSynEdit.CaretX := CaretX + 4;
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
  UpdateGutter(FilterSynEdit);
  UpdateSQLSynColors(SynSQLSyn);
end;

procedure TDataFilterDialog.SetCurrentDataFilter(ObjectName: string; SchemaParam: string; Name: string);
var
  i: Integer;
  Found: Boolean;
  KeyValue: string;
begin
  { Get Data Filter }
  KeyValue := Common.EncryptString(ObjectName + '@' + SchemaParam + ':' + Name);
  for i := 0 to ValuesList.RowCount - 1 do
    if KeyValue = ValuesList.Keys[i] then
    begin
      FilterNameEdit.Text := Name; // Copy(ValuesList.Keys[i], Pos(':', ValuesList.Keys[i]) + 1, Length(ValuesList.Keys[i]));
      FilterSynEdit.Text := Common.DecryptString(ValuesList.Values[ValuesList.Keys[i]]);
      Break;
    end;
  { Update Current Data Filter }
  Found := False;
  KeyValue := Common.EncryptString(ObjectName + '@' + SchemaParam + ':CURRENT');
  for i := 0 to ValuesList.RowCount - 1 do
    if KeyValue = ValuesList.Keys[i] then
    begin
       Found := True;
       //ValuesList.Keys[i] := ObjectName + '@' + SchemaParam + ':CURRENT';
       ValuesList.Values[ValuesList.Keys[i]] := Common.EncryptString(Name);
       Break;
    end;
  { insert if not found }
  if not Found then
    ValuesList.InsertRow(KeyValue, Common.EncryptString(Name), True);
end;

procedure TDataFilterDialog.SmallerActionExecute(Sender: TObject);
var
  CaretX: Integer;
begin
  FilterSynEdit.SetFocus;
  CaretX := FilterSynEdit.CaretX;
  InsertText(' < ');
  //FilterSynEdit.Text := FilterSynEdit.Text + ' < ';
  FilterSynEdit.CaretX := CaretX + 3;
end;

procedure TDataFilterDialog.SmallerOrEqualActionExecute(Sender: TObject);
var
  CaretX: Integer;
begin
  FilterSynEdit.SetFocus;
  CaretX := FilterSynEdit.CaretX;
  InsertText(' <= ');
  //FilterSynEdit.Text := FilterSynEdit.Text + ' <= ';
  FilterSynEdit.CaretX := CaretX + 4;
end;

procedure TDataFilterDialog.ToDateActionExecute(Sender: TObject);
var
  CaretX: Integer;
begin
  FilterSynEdit.SetFocus;
  CaretX := FilterSynEdit.CaretX;
  InsertText('TO_DATE('''', ' + QuotedStr(OptionsContainer.DateFormat + ' ' + OptionsContainer.TimeFormat) + ') ');
  //FilterSynEdit.Text := FilterSynEdit.Text + 'TO_DATE('''', ' + QuotedStr(OptionsContainer.DateFormat) + ')';
  FilterSynEdit.CaretX := CaretX + 9;
end;

function TDataFilterDialog.GetCurrentDataFilter(ObjectName: string; SchemaParam: string): string;
var
  i: Integer;
  FilterName, KeyValue: string;
begin
  Result := '';
  FilterName := GetCurrentFilterName(ObjectName, SchemaParam);
  KeyValue := Common.EncryptString(ObjectName + '@' + SchemaParam + ':' + FilterName);
  for i := 0 to ValuesList.RowCount - 1 do
    if KeyValue = ValuesList.Keys[i] then
    begin
      Result := Common.DecryptString(ValuesList.Values[ValuesList.Keys[i]]);
      Break;
    end;
end;

function TDataFilterDialog.GetCurrentFilterName(ObjectName: string; SchemaParam: string): string;
var
  i: Integer;
  KeyValue: string;
begin
  Result := '';
  KeyValue := Common.EncryptString(ObjectName + '@' + SchemaParam + ':CURRENT');
  for i := 0 to ValuesList.RowCount - 1 do
    if KeyValue = ValuesList.Keys[i] then
    begin
      Result := Common.DecryptString(ValuesList.Values[ValuesList.Keys[i]]);
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
  KeyValue := Common.EncryptString(FObjectName + '@' + FSchemaParam + ':CURRENT');
  for i := 0 to ValuesList.RowCount - 1 do
    if KeyValue = ValuesList.Keys[i] then
    begin
       Found := True;
      // ValuesList.Keys[i] := FObjectName + '@' + FSchemaParam + ':CURRENT' + ':' + FilterNameEdit.Text;
       ValuesList.Values[ValuesList.Keys[i]] := Common.EncryptString(FilterNameEdit.Text);
       Break;
    end;
  { insert if not found }
  if not Found then
    ValuesList.InsertRow(KeyValue, Common.EncryptString(FilterNameEdit.Text), True);

  FilterName := Common.EncryptString(FObjectName + '@' + FSchemaParam + ':' + FilterNameEdit.Text);
  if not ValuesList.FindRow(FilterName, i) then
    ValuesList.InsertRow(FilterName, Common.EncryptString(DataFilter), True)
  else
    ValuesList.Values[ValuesList.Keys[i]] := Common.EncryptString(DataFilter);

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
var
  CaretX: Integer;
begin
  FilterSynEdit.SetFocus;
  CaretX := FilterSynEdit.CaretX;
  InsertText(' OR ');
  //FilterSynEdit.Text := FilterSynEdit.Text + ' OR ';
  FilterSynEdit.CaretX := CaretX + 4;
end;

function TDataFilterDialog.GetDataFilter: WideString;
begin
  Result := FilterSynEdit.Text;
end;

procedure TDataFilterDialog.GreaterActionExecute(Sender: TObject);
var
  CaretX: Integer;
begin
  FilterSynEdit.SetFocus;
  CaretX := FilterSynEdit.CaretX;
  InsertText(' > ');
  //FilterSynEdit.Text := FilterSynEdit.Text + ' > ';
  FilterSynEdit.CaretX := CaretX + 3;
end;

procedure TDataFilterDialog.InActionExecute(Sender: TObject);
var
  CaretX: Integer;
begin
  FilterSynEdit.SetFocus;
  CaretX := FilterSynEdit.CaretX;
  InsertText(' IN ()');
  //FilterSynEdit.Text := FilterSynEdit.Text + ' BETWEEN  AND ';
  FilterSynEdit.CaretX := CaretX + 5;
end;

procedure TDataFilterDialog.InequalActionExecute(Sender: TObject);
var
  CaretX: Integer;
begin
  FilterSynEdit.SetFocus;
  CaretX := FilterSynEdit.CaretX;
  InsertText(' <> ');
  //FilterSynEdit.Text := FilterSynEdit.Text + ' <> ';
  FilterSynEdit.CaretX := CaretX + 4;
end;

end.
