unit ChangeUserPassword;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, JvExStdCtrls, JvEdit, BCEdit, Vcl.ExtCtrls,
  Dlg;

type
  TChangeUserPasswordDialog = class(TDialog)
    TopPanel: TPanel;
    PasswordLabel: TLabel;
    PasswordEdit: TBCEdit;
    BottomPanel: TPanel;
    ExportButton: TButton;
    CancelButton: TButton;
    Separator1Panel: TPanel;
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    FUserName: string;
  public
    { Public declarations }
    function Open(UserName: string): Boolean;
    function GetSQL: string;
  end;

function ChangeUserPasswordDialog: TChangeUserPasswordDialog;

implementation

{$R *.dfm}

uses
  Common, StyleHooks;

const
  CAPTION_TEXT = 'Change Password of %s';

var
  FChangeUserPasswordDialog: TChangeUserPasswordDialog;

function ChangeUserPasswordDialog: TChangeUserPasswordDialog;
begin
  if FChangeUserPasswordDialog = nil then
    Application.CreateForm(TChangeUserPasswordDialog, FChangeUserPasswordDialog);
  Result := FChangeUserPasswordDialog;
  StyleHooks.SetStyledFormSize(Result);
end;

procedure TChangeUserPasswordDialog.FormDestroy(Sender: TObject);
begin
  FChangeUserPasswordDialog := nil;
end;

function TChangeUserPasswordDialog.Open(UserName: string): Boolean;
begin
  FUserName := UserName;
  Caption := Format(CAPTION_TEXT, [UserName]);
  Width := Canvas.TextWidth(Caption) + 80;
  Result := ShowModal = mrOk;
end;

function TChangeUserPasswordDialog.GetSQL: string;
begin
  Result := Format('ALTER USER %s IDENTIFIED BY "%s"', [FUserName, PasswordEdit.Text]);
end;

end.
