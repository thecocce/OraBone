unit ConnectDirect;

interface

uses
  Winapi.Windows, System.SysUtils, System.Classes, Vcl.Graphics, Vcl.Forms, Vcl.Controls,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.Dialogs, Winapi.Messages, Vcl.ActnList, OdacVcl,
  Ora, OraError, JvExStdCtrls, JvCombobox, JvEdit, BCEdit, Dlg;

type
  TConnectDirectDialog = class(TDialog)
    ActionList: TActionList;
    ConnectAction: TAction;
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
    ConnectButton: TButton;
    OKButton: TButton;
    CancelButton: TButton;
    Separator1Panel: TPanel;
    procedure ConnectActionExecute(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure SIDEditChange(Sender: TObject);
    procedure ServiceNameEditChange(Sender: TObject);
    procedure Formshow(Sender: TObject);
  private
    FConnectDialog: TConnectDialog;
    FRetries: Integer;
    //FRetry: Boolean;
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
    procedure DoInit;
    procedure DoConnect;
    procedure ClearFields;
  public
    property Username: string read GetUsername write SetUsername;
    property Password: string read GetPassword write SetPassword;
    property Host: string read GetHost write SetHost;
    property Port: string read GetPort write SetPort;
    property SID: string read GetSID write SetSID;
    property ServiceName: string read GetServiceName write SetServiceName;
  published
    function Open(ConnectDialog: TConnectDialog): Integer;
    function Edit: Integer;
  end;

function ConnectDirectDialog: TConnectDirectDialog;

implementation

{$R *.DFM}

uses
  Common, Lib;

var
  FConnectDirectDialog: TConnectDirectDialog;

function ConnectDirectDialog: TConnectDirectDialog;
begin
  if FConnectDirectDialog = nil then
    Application.CreateForm(TConnectDirectDialog, FConnectDirectDialog);
  Result := FConnectDirectDialog;
  Common.SetStyledFormSize(Result);
end;
{
procedure TOraSessionEditorForm.DivConnStr(Server : string; var Service, Port, Host: string);
var
  i: integer;
  St,St1: string;
begin
// Parsing connect string host:1521:orcl
  Host := '';
  Port := '';
  Service := '';
  St := Server;
  if St <> '' then begin
    i := Pos(':', St);
    if i > 0 then begin
      if i > 1 then
        Host := Copy(St, 1, i - 1);
      St := Copy(St, i + 1, Length(St));
      i := Pos(':', St);
      if i > 0 then begin
        St1 := Copy(St, 1, i - 1);
        St := Copy(St, i + 1, Length(St));
        if St <> '' then
          Service := St;
      end
      else
        St1 := St;
    // get Port
      if St1 <> '' then
        try
          Port := IntToStr(StrToInt(St1));
        except
          raise Exception.Create('Invalid port');
        end;
    end
    else
      if St <> '' then
        Host := St;
  end;
end;    }

procedure TConnectDirectDialog.DoInit;
begin
  //FRetry := False;
  FRetries := FConnectDialog.Retries;
  OKButton.Visible := False;
  ConnectButton.Visible := True;

  {edSID.Items.Clear;
    edPort.Items.Clear;
    edHost.Items.Clear;
    for i :=0 to edServer.Items.Count - 1 do begin
      DivConnStr(edServer.Items.Strings[i], Service, Port, Host);
      if edSID.Items.IndexOf(Service)  0 then
        edSID.Items.Add(Service);
      if (Port <> '') and (edPort.Items.IndexOf(Port)  0) then
        edPort.Items.Add(Port);
      if (Host <> '') and (edHost.Items.IndexOf(Host)  0) then
        edHost.Items.Add(Host);
    end;  }
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

procedure TConnectDirectDialog.DoConnect;
begin
  FConnectDialog.Session.UserName := UsernameEdit.Text;
  FConnectDialog.Session.Password := PasswordEdit.Text;
  FConnectDialog.Session.Server := HostEdit.Text + ':' + PortEdit.Text + ':';
  if SIDEdit.Text <> '' then
    FConnectDialog.Session.Server := FConnectDialog.Session.Server + 'sid=' + SIDEdit.Text
  else
    FConnectDialog.Session.Server := FConnectDialog.Session.Server + 'sn=' + ServiceNameEdit.Text;
  FConnectDialog.Session.Options.Direct := True;
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
        12203, 12154: ActiveControl := HostEdit;
      end;
      raise;
    end
    else
      raise;
  end;
end;

procedure TConnectDirectDialog.ConnectActionExecute(Sender: TObject);
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

  DoConnect;

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

function TConnectDirectDialog.Open(ConnectDialog: TConnectDialog): Integer;
begin
  FConnectDialog := ConnectDialog;
  ClearFields;
  DoInit;
  Result := ShowModal;
end;

procedure TConnectDirectDialog.ServiceNameEditChange(Sender: TObject);
begin
  SIDEdit.Enabled := Trim(ServiceNameEdit.Text) = '';
end;

procedure TConnectDirectDialog.SIDEditChange(Sender: TObject);
begin
  ServiceNameEdit.Enabled := Trim(SIDEdit.Text) = '';
end;

function TConnectDirectDialog.Edit: Integer;
begin
  OKButton.Visible := True;
  ConnectButton.Visible := False;
  Result := ShowModal;
end;

end.
