unit Parameters;

interface

uses
  System.SysUtils, System.Variants, System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  Ora, Grids, ValEdit, ActnList, Vcl.ExtCtrls, BCDialogs.Dlg;

type
  TValueListEditor = class(ValEdit.TValueListEditor)
  public
    property InplaceEditor; // change this property to public
  end;

  TParametersDialog = class(TDialog)
    CancelButton: TButton;
    OKButton: TButton;
    Panel1: TPanel;
    Panel2: TPanel;
    Separator1Panel: TPanel;
    ValueListEditor: TValueListEditor;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Formshow(Sender: TObject);
    procedure ValueListEditorKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
    FOraQuery: TOraQuery;
    FOraSQL: TOraSQL;
  public
    { Public declarations }
    ValuesList: TValueListEditor; { Save param values }
    function Open(OraQuery: TOraQuery): Boolean; overload;
    function Open(OraSQL: TOraSQL): Boolean; overload;
  end;

function ParametersDialog: TParametersDialog;

implementation

{$R *.dfm}

Uses
  DB, BCCommon.StyleUtils, BCCommon.StringUtils;

var
  FParametersDialog: TParametersDialog;

function ParametersDialog: TParametersDialog;
begin
  if not Assigned(FParametersDialog) then
    Application.CreateForm(TParametersDialog, FParametersDialog);
  Result := FParametersDialog;
  SetStyledFormSize(Result);
end;

procedure TParametersDialog.FormCreate(Sender: TObject);
begin
  ValuesList := TValueListEditor.Create(nil);
  ValuesList.Strings.Clear;
end;

procedure TParametersDialog.FormDestroy(Sender: TObject);
begin
  ValuesList.Free;
  FParametersDialog := nil;
end;

procedure TParametersDialog.Formshow(Sender: TObject);
begin
  with ValueListEditor do
  begin
    Col := 1;
    Row := 1;
    SetFocus;
    EditorMode := True;
    InplaceEditor.SelectAll; // Trick to get the focus in to a first cell!
  end;
end;

function TParametersDialog.Open(OraQuery: TOraQuery): Boolean;
var
  i, j: Integer;
  Rslt: Integer;
  KeyName, KeyValue: string;
begin
  FOraQuery := OraQuery;
  ValueListEditor.Strings.Clear;
  for i := 0 to OraQuery.ParamCount - 1 do
    ValueListEditor.InsertRow(OraQuery.Params[i].Name, DecryptString(ValuesList.Values[EncryptString(OraQuery.Params[i].Name)]), True);

  Rslt := ShowModal;

  for i := 0 to OraQuery.ParamCount - 1 do
    OraQuery.Params[i].Value := ValueListEditor.Values[OraQuery.Params[i].Name];

  for i := 0 to OraQuery.ParamCount - 1 do
  begin
    KeyName := EncryptString(OraQuery.Params[i].Name);
    KeyValue := EncryptString(OraQuery.Params[i].Value);
    ValuesList.FindRow(KeyName, j);
    if j <> -1 then
      ValuesList.Values[KeyName] := KeyValue
    else
      ValuesList.InsertRow(KeyName, KeyValue, True)
  end;

  Result := Rslt = mrOk;
end;

function TParametersDialog.Open(OraSQL: TOraSQL): Boolean;
var
  i, j: Integer;
  Rslt: Integer;
  KeyName, KeyValue: string;
begin
  FOraSQL := OraSQL;
  ValueListEditor.Strings.Clear;
  for i := 0 to OraSQL.ParamCount - 1 do
    ValueListEditor.InsertRow(OraSQL.Params[i].Name, DecryptString(ValuesList.Values[EncryptString(OraSQL.Params[i].Name)]), True);

  Rslt := ShowModal;

  for i := 0 to OraSQL.ParamCount - 1 do
    OraSQL.Params[i].Value := ValueListEditor.Values[OraSQL.Params[i].Name];

  for i := 0 to OraSQL.ParamCount - 1 do
  begin
    KeyName := EncryptString(OraSQL.Params[i].Name);
    KeyValue := EncryptString(OraSQL.Params[i].Value);
    ValuesList.FindRow(KeyName, j);
    if j <> -1 then
      ValuesList.Values[KeyName] := KeyValue
    else
      ValuesList.InsertRow(KeyName, KeyValue, True)
  end;

  Result := Rslt = mrOk;
end;

procedure TParametersDialog.ValueListEditorKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = 13) or (Key = 9) then
  begin
    if ValueListEditor.Row < Pred(ValueListEditor.RowCount) then
      ValueListEditor.Row := ValueListEditor.Row + 1
    else
    if Key = 9 then  { tab goes around }
      ValueListEditor.Row := 1
    else
    if Key = 13 then { enter executes }
      OKButton.Click;
  end;
end;

end.
