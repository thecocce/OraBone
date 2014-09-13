unit CreateTrigger;

interface

uses
  System.SysUtils, System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, CreateObjectDialog, Vcl.StdCtrls,
  Vcl.ExtCtrls, BCControls.ComboBox, BCControls.Edit, Vcl.ImgList, SynEditHighlighter, SynHighlighterSQL, ActnList,
  ComCtrls, ToolWin, JvExComCtrls, SynEdit, JvComCtrls, BCControls.PageControl, BCControls.ToolBar, BCDialogs.Dlg,
  System.Actions, BCControls.ImageList, BCControls.CheckBox, JvExStdCtrls, JvCheckBox;

type
  TCreateTriggerDialog = class(TCreateObjectBaseDialog)
    BodyPanel: TPanel;
    BodySynEdit: TSynEdit;
    BodyTabSheet: TTabSheet;
    DeleteCheckBox: TBCCheckBox;
    NewAsLabel: TLabel;
    OldAsLabel: TLabel;
    OnGroupBox: TGroupBox;
    ReferenceNewEdit: TBCEdit;
    ReferenceOldEdit: TBCEdit;
    ReferencingGroupBox: TGroupBox;
    SettingsTabSheet: TTabSheet;
    TableLabel: TLabel;
    TableNameComboBox: TBCComboBox;
    TableNameEdit: TBCEdit;
    TriggerNameEdit: TBCEdit;
    TriggerNameLabel: TLabel;
    InsertCheckBox: TBCCheckBox;
    UpdateCheckBox: TBCCheckBox;
    WhenClausePanel: TPanel;
    WhenClauseSynEdit: TSynEdit;
    WhenClauseTabSheet: TTabSheet;
    WhenRadioGroup: TRadioGroup;
    procedure FormDestroy(Sender: TObject);
    procedure Formshow(Sender: TObject);
  private
    { Private declarations }
    procedure GetTableNames;
  protected
    function CheckFields: Boolean; override;
    procedure CreateSQL; override;
    procedure Initialize; override;
  end;

function CreateTriggerDialog: TCreateTriggerDialog;

implementation

{$R *.dfm}

uses
  Ora, DataModule, BCCommon.StyleUtils, BCCommon.Messages, BCCommon.Lib;

var
  FCreateTriggerDialog: TCreateTriggerDialog;

function CreateTriggerDialog: TCreateTriggerDialog;
begin
  if not Assigned(FCreateTriggerDialog) then
    Application.CreateForm(TCreateTriggerDialog, FCreateTriggerDialog);
  Result := FCreateTriggerDialog;
  SetStyledFormSize(TDialog(Result));
end;

procedure TCreateTriggerDialog.FormDestroy(Sender: TObject);
begin
  inherited;
  FCreateTriggerDialog := nil;
end;

procedure TCreateTriggerDialog.Formshow(Sender: TObject);
begin
  inherited;
  TriggerNameEdit.SetFocus;
end;

function TCreateTriggerDialog.CheckFields: Boolean;
begin
  Result := False;
  if Trim(TriggerNameEdit.Text) = '' then
  begin
    ShowErrorMessage('Set trigger name.');
    TriggerNameEdit.SetFocus;
    Exit;
  end;
  if Trim(TableNameComboBox.Text) = '' then
  begin
    ShowErrorMessage('Set table name.');
    TableNameComboBox.SetFocus;
    Exit;
  end;
  Result := True;
end;

procedure TCreateTriggerDialog.GetTableNames;
var
  OraQuery: TOraQuery;
begin
  OraQuery := TOraQuery.Create(nil);
  OraQuery.Session := FOraSession;
  OraQuery.SQL.Add(DM.StringHolder.StringsByName['AllTableAndViewsOfSchemaSQL'].Text);
  with OraQuery do
  try
    ParamByName('P_SCHEMA').AsWideString := FSchemaParam;
    Prepare;
    Open;
    while not Eof do
    begin
      TableNameComboBox.Items.Add(FieldByName('TABLE_NAME').AsString);
      Next;
    end;
  finally
    Close;
    UnPrepare;
    FreeAndNil(OraQuery);
  end;
end;

procedure TCreateTriggerDialog.Initialize;
begin
  inherited;
  if FObjectName <> '' then
  begin
    TableNameEdit.Visible := True;
    TableNameEdit.Text := FObjectName;
    TableNameComboBox.Visible := False;
    TableNameComboBox.Text := FObjectName;
  end;
  GetTableNames;
  WhenClauseSynEdit.Text := '';
  BodySynEdit.Lines.Text := 'BEGIN' + CHR_ENTER + CHR_ENTER + 'END;';
end;

procedure TCreateTriggerDialog.CreateSQL;
var
  When, IDU: string;
begin
  SourceSynEdit.Lines.Clear;
  SourceSynEdit.Lines.BeginUpdate;
  SourceSynEdit.Lines.Text := Format('CREATE OR REPLACE TRIGGER %s', [TriggerNameEdit.Text]) + CHR_ENTER;

  if WhenRadioGroup.ItemIndex = 0 then
    When := 'BEFORE'
  else
    When := 'AFTER';

  if InsertCheckBox.Checked then
    IDU := 'INSERT';
  if DeleteCheckBox.Checked then
  begin
    if InsertCheckBox.Checked then
      IDU := IDU + ' OR ';
    IDU := IDU + 'DELETE';
  end;
  if UpdateCheckBox.Checked then
  begin
    if InsertCheckBox.Checked or DeleteCheckBox.Checked then
      IDU := IDU + ' OR ';
    IDU := IDU + 'UPDATE';
  end;
  SourceSynEdit.Lines.Text := SourceSynEdit.Lines.Text + Format('%s %s ON %s', [When, IDU, TableNameComboBox.Text]) + CHR_ENTER;
  if (ReferenceNewEdit.Text <> 'New') or (ReferenceOldEdit.Text <> 'Old') then
  begin
    SourceSynEdit.Lines.Text := SourceSynEdit.Lines.Text + 'REFERENCING ';
    if ReferenceNewEdit.Text <> 'New' then
      SourceSynEdit.Lines.Text := SourceSynEdit.Lines.Text + 'NEW AS ' + ReferenceNewEdit.Text + ' ';
    if ReferenceOldEdit.Text <> 'Old' then
      SourceSynEdit.Lines.Text := SourceSynEdit.Lines.Text + 'OLD AS ' + ReferenceOldEdit.Text ;
    SourceSynEdit.Lines.Text := SourceSynEdit.Lines.Text + CHR_ENTER;
  end;
  SourceSynEdit.Lines.Text := SourceSynEdit.Lines.Text + 'FOR EACH ROW ';
  if WhenClauseSynEdit.Text <> '' then
    SourceSynEdit.Lines.Text := SourceSynEdit.Lines.Text + 'WHEN ' + WhenClauseSynEdit.Text;
  SourceSynEdit.Lines.Text := SourceSynEdit.Lines.Text + CHR_ENTER;
  SourceSynEdit.Lines.Text := SourceSynEdit.Lines.Text + BodySynEdit.Text;
  SourceSynEdit.Lines.Text := Trim(SourceSynEdit.Lines.Text);
  SourceSynEdit.Lines.EndUpdate;
end;

end.
