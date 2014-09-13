unit CreateUser;

interface

uses
  System.SysUtils, System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, CreateObjectDialog, Grids,
  JvExGrids, JvStringGrid, BCControls.StringGrid, Vcl.StdCtrls, BCControls.Edit, Vcl.ImgList, SynEditHighlighter,
  SynHighlighterSQL, ActnList, ComCtrls, ToolWin, JvExComCtrls, SynEdit, Vcl.ExtCtrls, JvComCtrls,
  BCControls.PageControl, DB, MemDS, DBAccess, Ora, BCControls.ToolBar, BCDialogs.Dlg, System.Actions,
  BCControls.ImageList, BCControls.CheckBox, JvExStdCtrls, JvCheckBox;

type
  TCreateUserDialog = class(TCreateObjectBaseDialog)
    PasswordEdit: TBCEdit;
    PasswordExpiredCheckBox: TBCCheckBox;
    PasswordLabel: TLabel;
    RolesPanel: TPanel;
    RolesQuery: TOraQuery;
    RolesStringGrid: TBCStringGrid;
    RolesTabSheet: TTabSheet;
    UsernameEdit: TBCEdit;
    UsernameLabel: TLabel;
    procedure FormDestroy(Sender: TObject);
  protected
    function CheckFields: Boolean; override;
    procedure CreateSQL; override;
    procedure Initialize; override;
  end;

function CreateUserDialog: TCreateUserDialog;

implementation

{$R *.dfm}

uses
  System.Math, BCCommon.StyleUtils, BCCommon.Messages, BCCommon.Lib;

const
  CELL_PADDING = 4;

var
  FCreateUserDialog: TCreateUserDialog;

function CreateUserDialog: TCreateUserDialog;
begin
  if not Assigned(FCreateUserDialog) then
    Application.CreateForm(TCreateUserDialog, FCreateUserDialog);
  Result := FCreateUserDialog;
  SetStyledFormSize(TDialog(Result));
end;

procedure TCreateUserDialog.FormDestroy(Sender: TObject);
begin
  inherited;
  FCreateUserDialog := nil;
end;

function TCreateUserDialog.CheckFields: Boolean;
begin
  Result := False;
  if Trim(UsernameEdit.Text) = '' then
  begin
    ShowErrorMessage('Enter user name.');
    Exit;
  end;
  if Trim(PasswordEdit.Text) = '' then
  begin
    ShowErrorMessage('Enter password.');
    Exit;
  end;
  Result := True;
end;

procedure TCreateUserDialog.Initialize;
var
  i: Integer;
begin
  inherited;
  UsernameEdit.Text := '';
  PasswordEdit.Text := '';
  PasswordExpiredCheckBox.Checked := False;

  RolesStringGrid.Cells[0, 0] := 'Role';
  RolesStringGrid.Cells[1, 0] := 'Granted';
  RolesStringGrid.Cells[2, 0] := 'Admin';

  with RolesQuery do
  begin
    //ParamByName('P_OBJECT_NAME').AsString := SchemaParam;
    Open;
    i := 1; // header & first row
    RolesStringGrid.RowCount := RecordCount + 1;
    while not Eof do
    begin
      RolesStringGrid.Cells[0, i] := FieldByName('GRANTED_ROLE').AsString;
      RolesStringGrid.Cells[1, i] := 'False';
      RolesStringGrid.Cells[2, i] := 'False';
      Inc(i);
      Next;
    end;
    Close;
  end;
end;

procedure TCreateUserDialog.CreateSQL;
var
  i: Integer;
  AdminOption, PasswordExpire: string;
begin
 try
    Screen.Cursor := crHourglass;
    SourceSynEdit.Clear;
    SourceSynEdit.Lines.BeginUpdate;

    PasswordExpire := '';
    if PasswordExpiredCheckBox.Checked then
      PasswordExpire := ' PASSWORD EXPIRE';
    SourceSynEdit.Lines.Text := 'CREATE USER ' + UsernameEdit.Text + ' IDENTIFIED BY "' + PasswordEdit.Text + '"' + PasswordExpire + ';' + CHR_ENTER + CHR_ENTER;

    for i := 0 to RolesStringGrid.RowCount - 1 do
    begin
      if RolesStringGrid.Cells[1, i] = 'True' then
      begin
        AdminOption := '';
        if RolesStringGrid.Cells[2, i] = 'True' then
          AdminOption := ' WITH ADMIN OPTION';
        SourceSynEdit.Lines.Text := SourceSynEdit.Lines.Text + 'GRANT ' + RolesStringGrid.Cells[0, i] + ' TO ' + UsernameEdit.Text + AdminOption + ';' + CHR_ENTER;
      end;
    end;
    SourceSynEdit.Lines.Text := SourceSynEdit.Lines.Text + 'ALTER USER ' + UsernameEdit.Text + ' DEFAULT ROLE ALL;';
    SourceSynEdit.Lines.EndUpdate;
  finally
    Screen.Cursor := crDefault;
  end;
end;

end.
