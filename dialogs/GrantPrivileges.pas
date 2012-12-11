unit GrantPrivileges;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms,
  Vcl.Dialogs, CreateObjectDialog, Vcl.StdCtrls, JvExStdCtrls, JvCombobox, BCComboBox, JvEdit, BCEdit,
  Vcl.ImgList, SynEditHighlighter, SynHighlighterSQL, ActnList, ComCtrls, ToolWin, JvExComCtrls,
  JvToolBar, SynEdit, Vcl.ExtCtrls, JvComCtrls, BCPageControl, BCToolBar, Dlg;

type
  TGrantPrivilegesDialog = class(TCreateObjectBaseDialog)
    SettingsTabSheet: TTabSheet;
    GrantGroupBox: TGroupBox;
    DeleteCheckBox: TCheckBox;
    SelectCheckBox: TCheckBox;
    InsertCheckBox: TCheckBox;
    UpdateCheckBox: TCheckBox;
    OnGroupBox: TGroupBox;
    OnEdit: TBCEdit;
    ToGroupBox: TGroupBox;
    UserRadioButton: TRadioButton;
    RoleRadioButton: TRadioButton;
    PublicRadioButton: TRadioButton;
    UserComboBox: TBCComboBox;
    RoleComboBox: TBCComboBox;
    GrantOptionCheckBox: TCheckBox;
    ExecuteCheckBox: TCheckBox;
    AlterCheckBox: TCheckBox;
    DebugCheckBox: TCheckBox;
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    procedure GetUsers;
    procedure GetRoles;
  protected
    procedure CreateSQL; override;
    function CheckFields: Boolean; override;
    procedure Initialize; override;
  public
    { Public declarations }
  end;

function GrantPrivilegesDialog: TGrantPrivilegesDialog;

implementation

{$R *.dfm}

uses
  Common, DataModule, Ora, StyleHooks;

var
  FGrantPrivilegesDialog: TGrantPrivilegesDialog;

function GrantPrivilegesDialog: TGrantPrivilegesDialog;
begin
  if FGrantPrivilegesDialog = nil then
    Application.CreateForm(TGrantPrivilegesDialog, FGrantPrivilegesDialog);
  Result := FGrantPrivilegesDialog;
  StyleHooks.SetStyledFormSize(TDialog(Result));
end;

procedure TGrantPrivilegesDialog.FormDestroy(Sender: TObject);
begin
  inherited;
  FGrantPrivilegesDialog := nil;
end;

function TGrantPrivilegesDialog.CheckFields: Boolean;
begin
  Result := False;
  if not SelectCheckBox.Checked and
     not InsertCheckBox.Checked and
     not UpdateCheckBox.Checked and
     not DeleteCheckBox.Checked and
     not ExecuteCheckBox.Checked and
     not AlterCheckBox.Checked and
     not DebugCheckBox.Checked then
  begin
    Common.ShowErrorMessage('Set grant.');
    Exit;
  end;
  if UserRadioButton.Checked and (UserComboBox.Text = '') then
  begin
    Common.ShowErrorMessage('Set user.');
    Exit;
  end;
  if RoleRadioButton.Checked and (RoleComboBox.Text = '') then
  begin
    Common.ShowErrorMessage('Set role.');
    Exit;
  end;
  Result := True;
end;

procedure TGrantPrivilegesDialog.GetUsers;
var
  OraQuery: TOraQuery;
begin
  OraQuery := TOraQuery.Create(nil);
  OraQuery.Session := FOraSession;
  OraQuery.SQL.Add(DM.StringHolder.StringsByName['AllUsersSQL'].Text);
  with OraQuery do
  try
    Prepare;
    Open;
    while not Eof do
    begin
      UserComboBox.Items.Add(FieldByName('USERNAME').AsString);
      Next;
    end;
  finally
    Close;
    UnPrepare;
    FreeAndNil(OraQuery);
  end;
end;

procedure TGrantPrivilegesDialog.GetRoles;
var
  OraQuery: TOraQuery;
begin
  OraQuery := TOraQuery.Create(nil);
  OraQuery.Session := FOraSession;
  OraQuery.SQL.Add(DM.StringHolder.StringsByName['DistinctGrantedRolesSQL'].Text);
  with OraQuery do
  try
    Prepare;
    Open;
    while not Eof do
    begin
      RoleComboBox.Items.Add(FieldByName('GRANTED_ROLE').AsString);
      Next;
    end;
  finally
    Close;
    UnPrepare;
    FreeAndNil(OraQuery);
  end;
end;

procedure TGrantPrivilegesDialog.Initialize;
begin
  OnEdit.Text := FSchemaParam + '.' + FObjectName;
  GetUsers;
  GetRoles;
end;

procedure TGrantPrivilegesDialog.CreateSQL;
var
  GrantOption, Privileges, Owner: string;
begin
  try
    Screen.Cursor := crHourglass;
    SourceSynEdit.Clear;
    SourceSynEdit.Lines.BeginUpdate;
    if SelectCheckBox.Checked then
      Privileges := 'SELECT';
    if InsertCheckBox.Checked then
    begin
      if SelectCheckBox.Checked then
        Privileges := Privileges + ', ';
      Privileges := Privileges + 'INSERT';
    end;
    if UpdateCheckBox.Checked then
    begin
      if SelectCheckBox.Checked or InsertCheckBox.Checked then
        Privileges := Privileges + ', ';
      Privileges := Privileges + 'UPDATE';
    end;
    if DeleteCheckBox.Checked then
    begin
      if SelectCheckBox.Checked or InsertCheckBox.Checked or UpdateCheckBox.Checked then
        Privileges := Privileges + ', ';
      Privileges := Privileges + 'DELETE';
    end;
    if ExecuteCheckBox.Checked then
    begin
      if SelectCheckBox.Checked or InsertCheckBox.Checked or UpdateCheckBox.Checked or
        DeleteCheckBox.Checked then
        Privileges := Privileges + ', ';
      Privileges := Privileges + 'EXECUTE';
    end;
    if AlterCheckBox.Checked then
    begin
      if SelectCheckBox.Checked or InsertCheckBox.Checked or UpdateCheckBox.Checked or
        DeleteCheckBox.Checked or ExecuteCheckBox.Checked then
        Privileges := Privileges + ', ';
      Privileges := Privileges + 'ALTER';
    end;
    if DebugCheckBox.Checked then
    begin
      if SelectCheckBox.Checked or InsertCheckBox.Checked or UpdateCheckBox.Checked or
        DeleteCheckBox.Checked or ExecuteCheckBox.Checked or AlterCheckBox.Checked then
        Privileges := Privileges + ', ';
      Privileges := Privileges + 'DEBUG';
    end;
    Owner := 'PUBLIC';
    if UserRadioButton.Checked then
      Owner := UserComboBox.Text;
    if RoleRadioButton.Checked then
      Owner := RoleComboBox.Text;
    GrantOption := '';
    if GrantOptionCheckBox.Checked then
      GrantOption := ' WITH GRANT OPTION';
    SourceSynEdit.Lines.Text := Format('GRANT %s ON %s TO %s%s;', [Privileges, OnEdit.Text, Owner,
      GrantOption]);
    SourceSynEdit.Lines.EndUpdate;
  finally
    Screen.Cursor := crDefault;
  end;
end;

end.
