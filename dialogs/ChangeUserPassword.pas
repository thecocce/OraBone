unit ChangeUserPassword;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, JvExStdCtrls, JvEdit, BCControls.Edit, Vcl.ExtCtrls,
  BCDialogs.Dlg;

type
  TChangeUserPasswordDialog = class(TDialog)
    BottomPanel: TPanel;
    CancelButton: TButton;
    ExportButton: TButton;
    PasswordEdit: TBCEdit;
    PasswordLabel: TLabel;
    Separator1Panel: TPanel;
    TopPanel: TPanel;
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    FUserName: string;
  public
    { Public declarations }
    function GetSQL: string;
    function Open(UserName: string): Boolean;
  end;

function ChangeUserPasswordDialog: TChangeUserPasswordDialog;

implementation

{$R *.dfm}

uses
  BCCommon.StyleHooks;

const
  CAPTION_TEXT = 'Change Password of %s';

var
  FChangeUserPasswordDialog: TChangeUserPasswordDialog;

function ChangeUserPasswordDialog: TChangeUserPasswordDialog;
begin
  if not Assigned(FChangeUserPasswordDialog) then
    Application.CreateForm(TChangeUserPasswordDialog, FChangeUserPasswordDialog);
  Result := FChangeUserPasswordDialog;
  SetStyledFormSize(Result);
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
