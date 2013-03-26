unit CreateDBLink;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, CreateObjectDialog, Vcl.StdCtrls, JvExStdCtrls, JvCombobox,
  BCComboBox, JvEdit, BCEdit, Vcl.ImgList, SynEditHighlighter, SynHighlighterSQL, Vcl.ActnList,
  Vcl.ComCtrls, Vcl.ToolWin, JvExComCtrls, JvToolBar, SynEdit, Vcl.ExtCtrls, JvComCtrls,
  BCPageControl, Ora, BCToolBar, Dlg;

type
  TCreateDBLinkDialog = class(TCreateObjectBaseDialog)
    AvailabilityLabel: TLabel;
    LinkNameEdit: TBCEdit;
    LinkNameLabel: TLabel;
    PasswordEdit: TBCEdit;
    PasswordLabel: TLabel;
    PrivateRadioButton: TRadioButton;
    PublicRadioButton: TRadioButton;
    ServiceNameComboBox: TBCComboBox;
    ServiceNameLabel: TLabel;
    SettingsTabSheet: TTabSheet;
    UserNameEdit: TBCEdit;
    UserNameLabel: TLabel;
    procedure FormDestroy(Sender: TObject);
    procedure Formshow(Sender: TObject);
  protected
    function CheckFields: Boolean; override;
    procedure CreateSQL; override;
    procedure GetServiceNames;
    procedure Initialize; override;
  end;

function CreateDBLinkDialog: TCreateDBLinkDialog;

implementation

{$R *.dfm}

uses
  Common, Lib, StyleHooks;

var
  FCreateDBLinkDialog: TCreateDBLinkDialog;

function CreateDBLinkDialog: TCreateDBLinkDialog;
begin
  if not Assigned(FCreateDBLinkDialog) then
    Application.CreateForm(TCreateDBLinkDialog, FCreateDBLinkDialog);
  Result := FCreateDBLinkDialog;
  StyleHooks.SetStyledFormSize(TDialog(Result));
end;

procedure TCreateDBLinkDialog.FormDestroy(Sender: TObject);
begin
  inherited;
  FCreateDBLinkDialog := nil;
end;

procedure TCreateDBLinkDialog.Formshow(Sender: TObject);
begin
  inherited;
  LinkNameEdit.SetFocus;
end;

function TCreateDBLinkDialog.CheckFields: Boolean;
begin
  Result := False;
  if Trim(LinkNameEdit.Text) = '' then
  begin
    Common.ShowErrorMessage('Set link name.');
    LinkNameEdit.SetFocus;
    Exit;
  end;
  if Trim(UserNameEdit.Text) = '' then
  begin
    Common.ShowErrorMessage('Set user name.');
    UserNameEdit.SetFocus;
    Exit;
  end;
  if Trim(PasswordEdit.Text) = '' then
  begin
    Common.ShowErrorMessage('Set password.');
    PasswordEdit.SetFocus;
    Exit;
  end;
  if Trim(ServiceNameComboBox.Text) = '' then
  begin
    Common.ShowErrorMessage('Set service name.');
    ServiceNameComboBox.SetFocus;
    Exit;
  end;
  Result := True;
end;

procedure TCreateDBLinkDialog.GetServiceNames;
begin
 ServiceNameComboBox.Clear;
 ServiceNameComboBox.Items := Lib.GetServerlist;
end;

procedure TCreateDBLinkDialog.Initialize;
begin
  inherited;
  GetServiceNames;
end;

procedure TCreateDBLinkDialog.CreateSQL;
var
  Availability: string;
begin
  SourceSynEdit.Lines.Clear;
  SourceSynEdit.Lines.BeginUpdate;
  Availability := '';
  if PublicRadioButton.Checked then
    Availability := 'PUBLIC ';
  SourceSynEdit.Text := Format('CREATE %sDATABASE LINK %s', [Availability, LinkNameEdit.Text]) + CHR_ENTER;
  SourceSynEdit.Text := SourceSynEdit.Text + Format('  CONNECT TO %s', [UserNameEdit.Text])  + CHR_ENTER;
  SourceSynEdit.Text := SourceSynEdit.Text + Format('  IDENTIFIED BY "%s"', [PasswordEdit.Text])  + CHR_ENTER;
  SourceSynEdit.Text := SourceSynEdit.Text + Format('  USING ''%s'';', [ServiceNameComboBox.Text]);
  SourceSynEdit.Lines.EndUpdate;
end;

end.
