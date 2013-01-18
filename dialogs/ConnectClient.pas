unit ConnectClient;

interface

uses
  Winapi.Windows, System.SysUtils, System.Classes, Vcl.Graphics, Vcl.Forms, Vcl.Controls,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.Dialogs, Winapi.Messages, Vcl.ActnList, OdacVcl,
  Ora, OraError, JvExStdCtrls, JvCombobox, BCEdit, JvEdit, BCComboBox, Dlg;

type
  TConnectClientDialog = class(TDialog)
    ActionList: TActionList;
    OKAction: TAction;
    Panel1: TPanel;
    UsernameLabel: TLabel;
    UsernameEdit: TBCEdit;
    Panel2: TPanel;
    OKButton: TButton;
    CancelButton: TButton;
    Separator1Panel: TPanel;
    Panel3: TPanel;
    PasswordLabel: TLabel;
    PasswordEdit: TBCEdit;
    Panel4: TPanel;
    DatabaserLabel: TLabel;
    DatabaseComboBox: TBCComboBox;
    Panel5: TPanel;
    HomeLabel: TLabel;
    HomeComboBox: TBCComboBox;
    procedure OKActionExecute(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure HomeComboBoxKeyPress(Sender: TObject; var Key: Char);
    procedure Formshow(Sender: TObject);
  private
    function GetUsername: string;
    procedure SetUsername(Value: string);
    function GetPassword: string;
    procedure SetPassword(Value: string);
    function GetDatabase: string;
    procedure SetDatabase(Value: string);
    function GetHomeName: string;
    procedure SetHomeName(Value: string);
    procedure DoInit;
    procedure FillDatabaseCombo;
    procedure FillHomeCombo;
    procedure ClearFields;
  public
    function Open(Clear: Boolean): Boolean;
    property Username: string read GetUsername write SetUsername;
    property Password: string read GetPassword write SetPassword;
    property Database: string read GetDatabase write SetDatabase;
    property HomeName: string read GetHomeName write SetHomeName;
  end;

function ConnectClientDialog(AOwner: TComponent): TConnectClientDialog;

implementation

{$R *.DFM}

uses
  Common, OraServices, OraCall, Lib, StyleHooks;

var
  FConnectClientDialog: TConnectClientDialog;

function ConnectClientDialog(AOwner: TComponent): TConnectClientDialog;
begin
  if FConnectClientDialog = nil then
  begin
    FConnectClientDialog := TConnectClientDialog.Create(AOwner);
    FConnectClientDialog.FillHomeCombo;
    FConnectClientDialog.FillDatabaseCombo;
  end;
  Result := FConnectClientDialog;
  StyleHooks.SetStyledFormSize(Result);
end;

procedure TConnectClientDialog.FillDatabaseCombo;
var
  Enum: TOraServerEnumerator;
begin
  if not LoadedOCI then
  try
    DetectOCI; // to show homes info
  except
    { silence }
  end;
  DatabaseComboBox.Clear;
  DatabaseComboBox.Items := Lib.GetServerlist;
  Enum := TOraServerEnumerator.Create;
  DatabaseComboBox.Hint := Enum.GetTNSFileName;
  Enum.Free;
end;

procedure TConnectClientDialog.FillHomeCombo;
var
  i: Integer;
begin
  if not LoadedOCI then
  try
    DetectOCI; // to show homes info
  except

  end;
  HomeComboBox.Clear;
  for i := 0 to Length(OraCall.OracleHomes) - 1 do
    HomeComboBox.Items.Add(OraCall.OracleHomes[i].Name)
end;

procedure TConnectClientDialog.DoInit;
begin
  HomeComboBox.Enabled := HomeComboBox.Items.Count > 0;
  if HomeComboBox.Enabled then
    HomeComboBox.Color := clWindow
  else
    HomeComboBox.Color := clBtnFace;
end;

procedure TConnectClientDialog.FormDestroy(Sender: TObject);
begin
  FConnectClientDialog := nil;
end;

procedure TConnectClientDialog.Formshow(Sender: TObject);
begin
  UsernameEdit.SetFocus;
end;

function TConnectClientDialog.GetUsername: string;
begin
  Result := UsernameEdit.Text
end;

procedure TConnectClientDialog.HomeComboBoxKeyPress(Sender: TObject; var Key: Char);
begin
  Key := #0;
end;

function TConnectClientDialog.GetPassword: string;
begin
  Result := PasswordEdit.Text
end;

function TConnectClientDialog.GetDatabase: string;
begin
  Result := DatabaseComboBox.Text
end;

function TConnectClientDialog.GetHomeName: string;
begin
  Result := '';
  if HomeComboBox.Text <> 'Default' then
    Result := HomeComboBox.Text
end;

procedure TConnectClientDialog.SetUsername(Value: string);
begin
  UsernameEdit.Text := Value;
end;

procedure TConnectClientDialog.SetPassword(Value: string);
begin
  PasswordEdit.Text := Value;
end;

procedure TConnectClientDialog.SetDatabase(Value: string);
begin
  FillDatabaseCombo;
  DatabaseComboBox.ItemIndex := DatabaseComboBox.Items.IndexOf(Value)
end;

procedure TConnectClientDialog.SetHomeName(Value: string);
begin
  FillHomeCombo;
  HomeComboBox.ItemIndex := HomeComboBox.Items.IndexOf(Value)
end;

procedure TConnectClientDialog.OKActionExecute(Sender: TObject);
begin
  if UsernameEdit.Text = '' then
  begin
    Common.ShowMessage(TEXT_USERNAME);
    UsernameEdit.SetFocus;
    Exit;
  end;

  if PasswordEdit.Text = '' then
  begin
    Common.ShowMessage(TEXT_PASSWORD);
    PasswordEdit.SetFocus;
    Exit;
  end;

  ModalResult := mrOK
end;

 procedure TConnectClientDialog.ClearFields;
 begin
   Username := '';
   PassWord := '';
   Database := '';
   HomeName := '';
 end;

function TConnectClientDialog.Open(Clear: Boolean): Boolean;
begin
  if Clear then
    ClearFields;
  DoInit;
  Result := ShowModal = mrOk;
end;

end.
