unit DataSort;

interface

uses
  System.SysUtils, System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, ActnList,
  JvExStdCtrls, JvListBox, ValEdit, JvStringHolder, Menus, ComCtrls, ToolWin, PlatformDefaultStyleActnCtrls, ActnMan,
  Vcl.ImgList, BCControls.Edit, BCControls.ImageList, BCControls.ToolBar, Vcl.ExtCtrls, BCDialogs.Dlg, System.Actions;

type
  TDataSortDialog = class(TDialog)
    ActionList: TActionList;
    ActionManager: TActionManager;
    AscRadioButton: TRadioButton;
    Button1: TButton;
    CancelButton: TButton;
    ClearSortAction: TAction;
    ClientPanel: TPanel;
    ColumnClickAction: TAction;
    ColumnListBox: TJvListBox;
    DescRadioButton: TRadioButton;
    DownAction: TAction;
    FirstRadioButton: TRadioButton;
    ImageList: TBCImageList;
    JvToolBar1: TBCToolBar;
    Label1: TLabel;
    LastRadioButton: TRadioButton;
    NullsGroupBox: TGroupBox;
    OKAction: TAction;
    OKButton: TButton;
    OrderGroupBox: TGroupBox;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    RemoveAction: TAction;
    Separator1Panel: TPanel;
    SortListBox: TJvListBox;
    SortMultiStringHolder: TJvMultiStringHolder;
    SortNameEdit: TBCEdit;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton6: TToolButton;
    UpAction: TAction;
    procedure ClearSortActionExecute(Sender: TObject);
    procedure ColumnClickActionExecute(Sender: TObject);
    procedure DownActionExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure OKActionExecute(Sender: TObject);
    procedure RemoveActionExecute(Sender: TObject);
    procedure SortListBoxClick(Sender: TObject);
    procedure SortNameEditChange(Sender: TObject);
    procedure SortNameEditKeyPress(Sender: TObject; var Key: Char);
    procedure UpActionExecute(Sender: TObject);
  private
    { Private declarations }
    FObjectName: string;
    FSchemaParam: string;
    function GetDataSort: WideString;
    procedure SetFields;
  public
    { Public declarations }
    ValuesList: TValueListEditor; { Save filter values }
    function GetCurrentDataSort(ObjectName: string; SchemaParam: string): string;
    function GetCurrentSortName(ObjectName: string; SchemaParam: string): string;
    function Open(ObjectName: string; SchemaParam: string; Columns: TStrings{; DataSort: WideString}): Boolean;
    procedure SetCurrentDataSort(ObjectName: string; SchemaParam: string; Name: string);
    property DataSort: WideString read GetDataSort;
  end;

function DataSortDialog: TDataSortDialog;

implementation

{$R *.dfm}

uses
  BCCommon.StyleUtils, BCCommon.StringUtils;

var
  FDataSortDialog: TDataSortDialog;

function DataSortDialog: TDataSortDialog;
begin
  if not Assigned(FDataSortDialog) then
    Application.CreateForm(TDataSortDialog, FDataSortDialog);
  Result := FDataSortDialog;
  SetStyledFormSize(Result);
end;

procedure TDataSortDialog.SetFields;
var
  i, Selected: Integer;
begin
  OKAction.Enabled := (Trim(SortNameEdit.Text) <> '') and
    (Trim(SortListBox.Items.Text) <> '');

  Selected := -1;
  for i := 0 to SortListBox.Count - 1 do
    if SortListBox.Selected[i] then
      Selected := i;


  UpAction.Enabled := (Selected <> -1) and (Selected > 0);
  DownAction.Enabled := (Selected <> -1) and (Selected < SortListBox.Count - 1);
  RemoveAction.Enabled := SortListBox.Count <> 0;
end;

procedure TDataSortDialog.ClearSortActionExecute(Sender: TObject);
begin
  SortListBox.Clear;
end;

procedure TDataSortDialog.ColumnClickActionExecute(Sender: TObject);
var
  i: Integer;
  Options: string;
begin
  if AscRadioButton.Checked then
    Options := ' ASC'
  else
    Options := ' DESC';

  if FirstRadioButton.Checked then
    Options := Options + ' NULLS FIRST'
  else
    Options := Options + ' NULLS LAST';

  for i := 0 to ColumnListBox.Count - 1 do
    if ColumnListBox.Selected[i] then
      SortListBox.Items.Add(Trim(ColumnListBox.Items.Strings[i]) + Options);
  SortListBox.Selected[SortListBox.Count - 1] := True;
  SortListBox.SetFocus;
  SetFields;
end;

procedure TDataSortDialog.SortListBoxClick(Sender: TObject);
begin
  SetFields;
end;

procedure TDataSortDialog.SortNameEditChange(Sender: TObject);
begin
  SetFields;
end;

procedure TDataSortDialog.SortNameEditKeyPress(Sender: TObject; var Key: Char);
begin
  if not (CharInSet(Key, ['a'..'z', 'ä', 'Ä', 'å', 'Å', 'ö', 'Ö', 'A'..'Z', '0'..'9', #8, ' ', '%'])) then
    Key := #0;
end;

procedure TDataSortDialog.UpActionExecute(Sender: TObject);
var
  i: Integer;
begin
  for i := 0 to SortListBox.Count - 1 do
    if SortListBox.Selected[i] then
    begin
      SortListBox.Items.Exchange(i, i - 1);
      SortListBox.Selected[i - 1] := True;
      Break;
    end;
  SetFields;
end;

procedure TDataSortDialog.DownActionExecute(Sender: TObject);
var
  i: Integer;
begin
  for i := 0 to SortListBox.Count - 1 do
    if SortListBox.Selected[i] then
    begin
      SortListBox.Items.Exchange(i, i + 1);
      SortListBox.Selected[i + 1] := True;
      Break;
    end;
  SetFields;
end;

procedure TDataSortDialog.FormCreate(Sender: TObject);
begin
  ValuesList := TValueListEditor.Create(nil);
  ValuesList.Strings.Clear;
end;

procedure TDataSortDialog.SetCurrentDataSort(ObjectName: string; SchemaParam: string; Name: string);
var
  i: Integer;
  Found: Boolean;
  KeyValue: string;
begin
  { Get Data Sort }
  KeyValue := EncryptString(ObjectName + '@' + SchemaParam + ':' + Name);
  for i := 0 to ValuesList.RowCount - 1 do
    if KeyValue = ValuesList.Keys[i] then
    begin
      SortNameEdit.Text := Name;
      SortListBox.Items.Text := DecryptString(ValuesList.Values[ValuesList.Keys[i]]);
      Break;
    end;
  { Update Current Data Sort }
  Found := False;
  KeyValue := EncryptString(ObjectName + '@' + SchemaParam + ':CURRENT');
  for i := 0 to ValuesList.RowCount - 1 do
    if KeyValue = ValuesList.Keys[i] then
    begin
       Found := True;
       //ValuesList.Keys[i] := ObjectName + '@' + SchemaParam + ':CURRENT' + ':$' + Name;
       ValuesList.Values[ValuesList.Keys[i]] := EncryptString(Name);
       Break;
    end;
  { insert if not found }
  if not Found then
    ValuesList.InsertRow(KeyValue, EncryptString(Name), True);
end;

function TDataSortDialog.GetCurrentDataSort(ObjectName: string; SchemaParam: string): string;
var
  i: Integer;
  KeyValue, SortName: string;
begin
  Result := '';
  SortName := GetCurrentSortName(ObjectName, SchemaParam);
  KeyValue := EncryptString(ObjectName + '@' + SchemaParam + ':' + SortName);
  for i := 0 to ValuesList.RowCount - 1 do
    if KeyValue = ValuesList.Keys[i] then
    begin
      Result := DecryptString(ValuesList.Values[ValuesList.Keys[i]]);
      Result := StringReplace(Result, 'NULLS FIRST,', 'NULLS FIRST', [rfReplaceAll]);
      Result := StringReplace(Result, 'NULLS FIRST', 'NULLS FIRST, ', [rfReplaceAll]);
      Result := StringReplace(Result, 'NULLS LAST,', 'NULLS LAST', [rfReplaceAll]);
      Result := StringReplace(Result, 'NULLS LAST', 'NULLS LAST, ', [rfReplaceAll]);
      Result := Trim(Result);
      Result := Copy(Result, 0, Length(Result) - 1); // remove last spot
      Break;
    end;
end;

function TDataSortDialog.GetCurrentSortName(ObjectName: string; SchemaParam: string): string;
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

procedure TDataSortDialog.FormDestroy(Sender: TObject);
begin
  ValuesList.Free;
  FDataSortDialog := nil;
end;

// SortMultiStringHolder name: Object Name@S@SchemaParam
//                             object name@F@FilterName

procedure TDataSortDialog.OKActionExecute(Sender: TObject);
var
  i: Integer;
  KeyValue, SortName: string;
  Found: Boolean;
begin
  { Update Current Data Sort }
  Found := False;
  KeyValue := EncryptString(FObjectName + '@' + FSchemaParam + ':CURRENT');
  for i := 0 to ValuesList.RowCount - 1 do
    if KeyValue = ValuesList.Keys[i] then
    begin
       Found := True;
       //ValuesList.Keys[i] := FObjectName + '@' + FSchemaParam + ':CURRENT' + ':$' + SortNameEdit.Text;
       ValuesList.Values[ValuesList.Keys[i]] := EncryptString(SortNameEdit.Text);
       Break;
    end;
  { insert if not found }
  if not Found then
    ValuesList.InsertRow(KeyValue, EncryptString(SortNameEdit.Text), True);

  SortName := EncryptString(FObjectName + '@' + FSchemaParam + ':' + SortNameEdit.Text);
  if not ValuesList.FindRow(SortName, i) then
    ValuesList.InsertRow(SortName,  EncryptString(DataSort), True)
  else
    ValuesList.Values[ValuesList.Keys[i]] := EncryptString(DataSort);

  ModalResult := mrOk;
end;

function TDataSortDialog.Open(ObjectName: string; SchemaParam: string; Columns: TStrings{; DataSort: WideString}): Boolean;
var
  Rslt: Integer;
begin
  ColumnListBox.Items := Columns;

  SortListBox.Items.Text := '';

  SortNameEdit.Text := GetCurrentSortName(ObjectName, SchemaParam);
  if SortNameEdit.Text = '' then
    SortNameEdit.Text := 'Unnamed';
  if Trim(SortNameEdit.Text) <> '' then
    SortListBox.Items.Text := GetCurrentDataSort(ObjectName, SchemaParam);

  FObjectName := ObjectName;
  FSchemaParam := SchemaParam;
  SetFields;

  Rslt := ShowModal;

  Result := Rslt = mrOk;
end;

procedure TDataSortDialog.RemoveActionExecute(Sender: TObject);
var
  i: Integer;
begin
  for i := 0 to SortListBox.Count - 1 do
    if SortListBox.Selected[i] then
    begin
      SortListBox.Items.Delete(i);
      Break;
    end;
  SetFields;
end;

function TDataSortDialog.GetDataSort: WideString;
begin
  Result := SortListBox.Items.Text;
end;

end.
