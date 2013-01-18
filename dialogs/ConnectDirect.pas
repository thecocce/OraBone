unit ConnectDirect;

interface

uses
  Winapi.Windows, System.SysUtils, System.Classes, Vcl.Graphics, Vcl.Forms, Vcl.Controls,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.Dialogs, Winapi.Messages, Vcl.ActnList, OdacVcl,
  Ora, OraError, JvExStdCtrls, JvCombobox, JvEdit, BCEdit, Dlg;

type
  TConnectDirectDialog = class(TDialog)
    ActionList: TActionList;
    OKAction: TAction;
    Panel1: TPanel;
    UsernameLabel: TLabel;
    UsernameEdit: TBCEdit;
    Panel2: TPanel;
    PasswordLabel: TLabel;
    PasswordEdit: TBCEdit;
    Panel3: TPanel;
    DatabaserLabel: TLabel;
    HostEdit: TBCEdit;
    Panel4: TPanel;
    Label1: TLabel;
    PortEdit: TBCEdit;
    Panel5: TPanel;
    Label2: TLabel;
    SIDEdit: TBCEdit;
    Panel6: TPanel;
    Label3: TLabel;
    ServiceNameEdit: TBCEdit;
    Panel7: TPanel;
    OKButton: TButton;
    CancelButton: TButton;
    Separator1Panel: TPanel;
    procedure OKActionExecute(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure SIDEditChange(Sender: TObject);
    procedure ServiceNameEditChange(Sender: TObject);
    procedure Formshow(Sender: TObject);
  private
    function GetUsername: string;
    procedure SetUsername(Value: string);
    function GetPassword: string;
    procedure SetPassword(Value: string);
    function GetHost: string;
    procedure SetHost(Value: string);
    function GetPort: string;
    procedure SetPort(Value: string);
    function GetSID: string;
    procedure SetSID(Value: string);
    function GetServiceName: string;
    procedure SetServiceName(Value: string);
    procedure ClearFields;
  public
    function Open(Clear: Boolean): Boolean;
    property Username: string read GetUsername write SetUsername;
    property Password: string read GetPassword write SetPassword;
    property Host: string read GetHost write SetHost;
    property Port: string read GetPort write SetPort;
    property SID: string read GetSID write SetSID;
    property ServiceName: string read GetServiceName write SetServiceName;
  end;

function ConnectDirectDialog(AOwner: TComponent): TConnectDirectDialog;

implementation

{$R *.DFM}

uses
  Common, Lib, StyleHooks;

var
  FConnectDirectDialog: TConnectDirectDialog;

function ConnectDirectDialog(AOwner: TComponent): TConnectDirectDialog;
begin
  if FConnectDirectDialog = nil then
    FConnectDirectDialog := TConnectDirectDialog.Create(AOwner);
  Result := FConnectDirectDialog;
  StyleHooks.SetStyledFormSize(Result);
end;

procedure TConnectDirectDialog.FormDestroy(Sender: TObject);
begin
  FConnectDirectDialog := nil;
end;

procedure TConnectDirectDialog.Formshow(Sender: TObject);
begin
  PortEdit.Left := UsernameEdit.Left; { style fix }
  UsernameEdit.SetFocus;
end;

function TConnectDirectDialog.GetUsername: string;
begin
  Result := UsernameEdit.Text
end;

procedure TConnectDirectDialog.SetUsername(Value: string);
begin
  UsernameEdit.Text := Value
end;

function TConnectDirectDialog.GetPassword: string;
begin
  Result := PasswordEdit.Text
end;

procedure TConnectDirectDialog.SetPassword(Value: string);
begin
  PasswordEdit.Text := Value
end;

function TConnectDirectDialog.GetHost: string;
begin
   Result := HostEdit.Text
end;

procedure TConnectDirectDialog.SetHost(Value: string);
begin
   HostEdit.Text := Value
end;

function TConnectDirectDialog.GetPort: string;
begin
   Result := PortEdit.Text
end;

procedure TConnectDirectDialog.SetPort(Value: string);
begin
   PortEdit.Text := Value
end;

function TConnectDirectDialog.GetSID: string;
begin
   Result := SIDEdit.Text
end;

procedure TConnectDirectDialog.SetSID(Value: string);
begin
   SIDEdit.Text := Value
end;

function TConnectDirectDialog.GetServiceName: string;
begin
   Result := ServiceNameEdit.Text
end;

procedure TConnectDirectDialog.SetServiceName(Value: string);
begin
   ServiceNameEdit.Text := Value
end;

procedure TConnectDirectDialog.OKActionExecute(Sender: TObject);
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

 procedure TConnectDirectDialog.ClearFields;
 begin
   Username := '';
   Password := '';
   Host := '';
   Port := '';
   SID := '';
   ServiceName := '';
 end;

function TConnectDirectDialog.Open(Clear: Boolean): Boolean;
begin
  if Clear then
    ClearFields;
  Result := ShowModal = mrOk;
end;

procedure TConnectDirectDialog.ServiceNameEditChange(Sender: TObject);
begin
  SIDEdit.Enabled := Trim(ServiceNameEdit.Text) = '';
end;

procedure TConnectDirectDialog.SIDEditChange(Sender: TObject);
begin
  ServiceNameEdit.Enabled := Trim(SIDEdit.Text) = '';
end;

end.
