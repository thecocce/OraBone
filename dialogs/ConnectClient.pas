unit ConnectClient;

interface

uses
  Winapi.Windows, System.SysUtils, System.Classes, Vcl.Graphics, Vcl.Forms, Vcl.Controls,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.Dialogs, Winapi.Messages, Vcl.ActnList, OdacVcl,
  Ora, OraError, JvExStdCtrls, JvCombobox, BCEdit, JvEdit, BCComboBox, Dlg;

type
  TConnectClientDialog = class(TDialog)
    ActionList: TActionList;
    ConnectAction: TAction;
    Panel1: TPanel;
    UsernameLabel: TLabel;
    UsernameEdit: TBCEdit;
    Panel2: TPanel;
    ConnectButton: TButton;
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
    procedure ConnectActionExecute(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure HomeComboBoxKeyPress(Sender: TObject; var Key: Char);
    procedure Formshow(Sender: TObject);
  private
    FConnectDialog: TConnectDialog;
    FRetries: Integer;
    //FRetry: Boolean;
    FEdit: Boolean;
    function GetUsername: string;
    procedure SetUsername(Value: string);
    function GetPassword: string;
    procedure SetPassword(Value: string);
    function GetDatabase: string;
    procedure SetDatabase(Value: string);
    function GetHomeName: string;
    procedure SetHomeName(Value: string);
    procedure DoInit;
    procedure DoConnect;
    procedure FillDatabaseCombo;
    procedure FillHomeCombo;
    procedure ClearFields;
  public
    property Username: string read GetUsername write SetUsername;
    property Password: string read GetPassword write SetPassword;
    property Database: string read GetDatabase write SetDatabase;
    property HomeName: string read GetHomeName write SetHomeName;
  published
    function Open(ConnectDialog: TConnectDialog): Integer;
    function Edit: Integer;
  end;

function ConnectClientDialog(AOwner: TComponent): TConnectClientDialog;

implementation

{$R *.DFM}

uses
  Common, OraServices, OraCall, Lib;

var
  FConnectClientDialog: TConnectClientDialog;

function ConnectClientDialog(AOwner: TComponent): TConnectClientDialog;
begin
  if FConnectClientDialog = nil then
    FConnectClientDialog := TConnectClientDialog.Create(AOwner);
  Result := FConnectClientDialog;
  Common.SetStyledFormSize(Result);
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

  //GetOraServerList(edServer.Items, OracleHomePath, ConnectDialog.ReadAliases,
  //    FLocalSession.Options.Net);
end;

procedure TConnectClientDialog.FillHomeCombo;
var
  i: Integer;
begin
  if not LoadedOCI then
  try
    DetectOCI; // to show homes info
  except
    //on E: Exception do
     // Common.ShowError(E.Message);
  end;
  HomeComboBox.Clear;
 // if (DefaultOracleHome >= 0) and (OracleHomeNames[DefaultOracleHome] <> '') then
 //   HomeComboBox.Items[0] := HomeComboBox.Items[0] + ' [' + OracleHomeNames[DefaultOracleHome] + ']';
  for i := 0 to OracleHomeCount - 1 do
    HomeComboBox.Items.Add(OracleHomeNames[i])
end;

procedure TConnectClientDialog.DoInit;
begin
  //FRetry := False;
  FRetries := FConnectDialog.Retries;
  FillHomeCombo;
  FillDatabaseCombo;
  OKButton.Visible := False;
  ConnectButton.Visible := True;
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

procedure TConnectClientDialog.ConnectActionExecute(Sender: TObject);
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

  if not FEdit then
    DoConnect;

  ModalResult := mrOK
end;

procedure TConnectClientDialog.DoConnect;
begin
  FConnectDialog.Session.UserName := Username;
  FConnectDialog.Session.Password := Password;
  FConnectDialog.Session.Server := Database;
  FConnectDialog.Session.HomeName := HomeName;
  FConnectDialog.Session.Options.Direct := False;
  try
    FConnectDialog.Connection.PerformConnect(False); //FRetry);
    ModalResult := mrOk;
  except
    on E:EOraError do begin
      Dec(FRetries);
      //FRetry := True;
      if FRetries = 0 then
        ModalResult := mrCancel;

      case E.ErrorCode of
        1005: ActiveControl := PasswordEdit;
        1017: if ActiveControl <> UsernameEdit then
                ActiveControl := PasswordEdit;
        12203,12154: ActiveControl := DatabaseComboBox;
      end;
      raise;
    end
    else
      raise;
  end;
end;

 procedure TConnectClientDialog.ClearFields;
 begin
   Username := '';
   PassWord := '';
   Database := '';
   HomeName := '';
 end;

function TConnectClientDialog.Open(ConnectDialog: TConnectDialog): Integer;
begin
  FConnectDialog := ConnectDialog;
  ClearFields;
  DoInit;
  Result := ShowModal;
end;

function TConnectClientDialog.Edit: Integer;
begin
  OKButton.Visible := True;
  ConnectButton.Visible := False;
  HomeComboBox.Enabled := HomeComboBox.Items.Count > 0;
  if HomeComboBox.Enabled then
    HomeComboBox.Color := clWindow
  else
    HomeComboBox.Color := clBtnFace;
  Result := ShowModal;
end;

end.
