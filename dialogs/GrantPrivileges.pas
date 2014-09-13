unit GrantPrivileges;

interface

uses
  System.SysUtils, System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, CreateObjectDialog, Vcl.StdCtrls,
  BCControls.ComboBox, BCControls.Edit, Vcl.ImgList, SynEditHighlighter, SynHighlighterSQL, ActnList, ComCtrls, ToolWin,
  JvExComCtrls, SynEdit, Vcl.ExtCtrls, JvComCtrls, BCControls.PageControl, BCControls.ToolBar, BCDialogs.Dlg,
  System.Actions, BCControls.ImageList, BCControls.CheckBox, JvExStdCtrls, JvCheckBox;

type
  TGrantPrivilegesDialog = class(TCreateObjectBaseDialog)
    AlterCheckBox: TBCCheckBox;
    DebugCheckBox: TBCCheckBox;
    DeleteCheckBox: TBCCheckBox;
    ExecuteCheckBox: TBCCheckBox;
    GrantGroupBox: TGroupBox;
    GrantOptionCheckBox: TBCCheckBox;
    InsertCheckBox: TBCCheckBox;
    OnEdit: TBCEdit;
    OnGroupBox: TGroupBox;
    PublicRadioButton: TRadioButton;
    RoleComboBox: TBCComboBox;
    RoleRadioButton: TRadioButton;
    SelectCheckBox: TBCCheckBox;
    SettingsTabSheet: TTabSheet;
    ToGroupBox: TGroupBox;
    UpdateCheckBox: TBCCheckBox;
    UserComboBox: TBCComboBox;
    UserRadioButton: TRadioButton;
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    procedure GetRoles;
    procedure GetUsers;
  protected
    function CheckFields: Boolean; override;
    procedure CreateSQL; override;
    procedure Initialize; override;
  end;

function GrantPrivilegesDialog: TGrantPrivilegesDialog;

implementation

{$R *.dfm}

uses
  DataModule, Ora, BCCommon.StyleUtils, BCCommon.Messages;

var
  FGrantPrivilegesDialog: TGrantPrivilegesDialog;

function GrantPrivilegesDialog: TGrantPrivilegesDialog;
begin
  if not Assigned(FGrantPrivilegesDialog) then
    Application.CreateForm(TGrantPrivilegesDialog, FGrantPrivilegesDialog);
  Result := FGrantPrivilegesDialog;
  SetStyledFormSize(TDialog(Result));
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
    ShowErrorMessage('Set grant.');
    Exit;
  end;
  if UserRadioButton.Checked and (UserComboBox.Text = '') then
  begin
    ShowErrorMessage('Set user.');
    Exit;
  end;
  if RoleRadioButton.Checked and (RoleComboBox.Text = '') then
  begin
    ShowErrorMessage('Set role.');
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
