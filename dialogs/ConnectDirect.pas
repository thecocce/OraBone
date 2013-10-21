unit ConnectDirect;

interface

uses
  System.SysUtils, System.Classes, Vcl.Graphics, Vcl.Forms, Vcl.Controls, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.Dialogs, Vcl.ActnList, BCControls.Edit, BCDialogs.Dlg, System.Actions;

type
  TConnectDirectDialog = class(TDialog)
    ActionList: TActionList;
    CancelButton: TButton;
    DatabaserLabel: TLabel;
    HostEdit: TBCEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    OKAction: TAction;
    OKButton: TButton;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    PasswordEdit: TBCEdit;
    PasswordLabel: TLabel;
    PortEdit: TBCEdit;
    Separator1Panel: TPanel;
    ServiceNameEdit: TBCEdit;
    SIDEdit: TBCEdit;
    UsernameEdit: TBCEdit;
    UsernameLabel: TLabel;
    procedure FormDestroy(Sender: TObject);
    procedure Formshow(Sender: TObject);
    procedure OKActionExecute(Sender: TObject);
    procedure ServiceNameEditChange(Sender: TObject);
    procedure SIDEditChange(Sender: TObject);
  private
    function GetHost: string;
    function GetPassword: string;
    function GetPort: string;
    function GetServiceName: string;
    function GetSID: string;
    function GetUsername: string;
    procedure ClearFields;
    procedure SetHost(Value: string);
    procedure SetPassword(Value: string);
    procedure SetPort(Value: string);
    procedure SetServiceName(Value: string);
    procedure SetSID(Value: string);
    procedure SetUsername(Value: string);
  public
    function Open(Clear: Boolean): Boolean;
    property Host: string read GetHost write SetHost;
    property Password: string read GetPassword write SetPassword;
    property Port: string read GetPort write SetPort;
    property ServiceName: string read GetServiceName write SetServiceName;
    property SID: string read GetSID write SetSID;
    property Username: string read GetUsername write SetUsername;
  end;

function ConnectDirectDialog(AOwner: TComponent): TConnectDirectDialog;

implementation

{$R *.DFM}

uses
  Lib, BCCommon.StyleUtils;

var
  FConnectDirectDialog: TConnectDirectDialog;

function ConnectDirectDialog(AOwner: TComponent): TConnectDirectDialog;
begin
  if not Assigned(FConnectDirectDialog) then
    FConnectDirectDialog := TConnectDirectDialog.Create(AOwner);
  Result := FConnectDirectDialog;
  SetStyledFormSize(Result);
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
