unit ConnectClient;

interface

uses
  System.SysUtils, System.Classes, Vcl.Graphics, Vcl.Forms, Vcl.Controls, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.Dialogs, Vcl.ActnList, BCControls.Edit, BCControls.ComboBox, BCDialogs.Dlg, System.Actions;

type
  TConnectClientDialog = class(TDialog)
    ActionList: TActionList;
    CancelButton: TButton;
    DatabaseComboBox: TBCComboBox;
    DatabaserLabel: TLabel;
    HomeComboBox: TBCComboBox;
    HomeLabel: TLabel;
    OKAction: TAction;
    OKButton: TButton;
    ProfilePanel: TPanel;
    ButtonPanel: TPanel;
    PasswordPanel: TPanel;
    DatabasePanel: TPanel;
    HomePanel: TPanel;
    PasswordEdit: TBCEdit;
    PasswordLabel: TLabel;
    Separator1Panel: TPanel;
    ProfileEdit: TBCEdit;
    ProfileLabel: TLabel;
    UsernamePanel: TPanel;
    UsernameLabel: TLabel;
    UsernameEdit: TBCEdit;
    procedure FormDestroy(Sender: TObject);
    procedure Formshow(Sender: TObject);
    procedure HomeComboBoxKeyPress(Sender: TObject; var Key: Char);
    procedure OKActionExecute(Sender: TObject);
  private
    function GetDatabase: string;
    function GetHomeName: string;
    function GetPassword: string;
    function GetProfile: string;
    function GetUsername: string;
    procedure ClearFields;
    procedure DoInit;
    procedure FillDatabaseCombo;
    procedure FillHomeCombo;
    procedure SetDatabase(Value: string);
    procedure SetHomeName(Value: string);
    procedure SetPassword(Value: string);
    procedure SetProfile(Value: string);
    procedure SetUsername(Value: string);
  public
    function Open(Clear: Boolean): Boolean;
    property Profile: string read GetProfile write SetProfile;
    property Database: string read GetDatabase write SetDatabase;
    property HomeName: string read GetHomeName write SetHomeName;
    property Password: string read GetPassword write SetPassword;
    property Username: string read GetUsername write SetUsername;
  end;

function ConnectClientDialog(AOwner: TComponent): TConnectClientDialog;

implementation

{$R *.DFM}

uses
  OraServices, OraCall, Lib, BCCommon.StyleUtils, BCCommon.Messages;

var
  FConnectClientDialog: TConnectClientDialog;

function ConnectClientDialog(AOwner: TComponent): TConnectClientDialog;
begin
  if not Assigned(FConnectClientDialog) then
  begin
    FConnectClientDialog := TConnectClientDialog.Create(AOwner);
    FConnectClientDialog.FillHomeCombo;
    FConnectClientDialog.FillDatabaseCombo;
  end;
  Result := FConnectClientDialog;
  SetStyledFormSize(Result);
end;

procedure TConnectClientDialog.FillDatabaseCombo;
var
  Enum: TOraServerEnumerator;
  OracleHome: TOracleHome;
  StringList: TStringList;
begin
  (*if not LoadedOCI then
  try
    DetectOCI; // to show homes info
  except
    { silence }
  end; *)
  DatabaseComboBox.Clear;
  StringList := Lib.GetServerlist;
  DatabaseComboBox.Items := StringList;
  StringList.Free;
  Enum := TOraServerEnumerator.Create;
  OracleHome := TOracleHome.Create(nil);
  try
    DatabaseComboBox.Hint := Enum.GetTNSFileName(OracleHome);
  finally
    OracleHome.Free;
  end;
  Enum.Free;
end;

procedure TConnectClientDialog.FillHomeCombo;
var
  i: Integer;
begin
  (*if not LoadedOCI then
  try
    DetectOCI; // to show homes info
  except

  end; *)
  HomeComboBox.Clear;
  for i := 0 to OraCall.OracleHomes.Count - 1 do
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
  ProfileEdit.SetFocus;
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

function TConnectClientDialog.GetProfile: string;
begin
  Result := ProfileEdit.Text
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

procedure TConnectClientDialog.SetProfile(Value: string);
begin
  ProfileEdit.Text := Value;
end;

procedure TConnectClientDialog.SetDatabase(Value: string);
begin
  FillDatabaseCombo;
  DatabaseComboBox.ItemIndex := DatabaseComboBox.Items.IndexOf(Value);
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
    ShowMessage(TEXT_USERNAME);
    UsernameEdit.SetFocus;
    Exit;
  end;

  if PasswordEdit.Text = '' then
  begin
    ShowMessage(TEXT_PASSWORD);
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
