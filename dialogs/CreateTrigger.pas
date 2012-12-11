unit CreateTrigger;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms,
  Vcl.Dialogs, CreateObjectDialog, Vcl.StdCtrls, Vcl.ExtCtrls, JvExStdCtrls, JvCombobox, BCComboBox, JvEdit,
  BCEdit, Vcl.ImgList, SynEditHighlighter, SynHighlighterSQL, ActnList, ComCtrls, ToolWin, JvExComCtrls,
  JvToolBar, SynEdit, JvComCtrls, BCPageControl, BCToolBar, Dlg;

type
  TCreateTriggerDialog = class(TCreateObjectBaseDialog)
    TriggerNameLabel: TLabel;
    TriggerNameEdit: TBCEdit;
    TableLabel: TLabel;
    TableNameComboBox: TBCComboBox;
    SettingsTabSheet: TTabSheet;
    v: TTabSheet;
    BodyTabSheet: TTabSheet;
    WhenRadioGroup: TRadioGroup;
    OnGroupBox: TGroupBox;
    DeleteCheckBox: TCheckBox;
    InsertCheckBox: TCheckBox;
    UpdateCheckBox: TCheckBox;
    ReferencingGroupBox: TGroupBox;
    NewAsLabel: TLabel;
    OldAsLabel: TLabel;
    ReferenceNewEdit: TBCEdit;
    ReferenceOldEdit: TBCEdit;
    WhenClausePanel: TPanel;
    WhenClauseSynEdit: TSynEdit;
    BodyPanel: TPanel;
    BodySynEdit: TSynEdit;
    TableNameEdit: TBCEdit;
    procedure FormDestroy(Sender: TObject);
    procedure Formshow(Sender: TObject);
  private
    { Private declarations }
    procedure GetTableNames;
  protected
    procedure CreateSQL; override;
    function CheckFields: Boolean; override;
    procedure Initialize; override;
  public
    { Public declarations }
  end;

function CreateTriggerDialog: TCreateTriggerDialog;

implementation

{$R *.dfm}

uses
  Common, Ora, DataModule, StyleHooks;

var
  FCreateTriggerDialog: TCreateTriggerDialog;

function CreateTriggerDialog: TCreateTriggerDialog;
begin
  if FCreateTriggerDialog = nil then
    Application.CreateForm(TCreateTriggerDialog, FCreateTriggerDialog);
  Result := FCreateTriggerDialog;
  StyleHooks.SetStyledFormSize(TDialog(Result));
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
    Common.ShowErrorMessage('Set trigger name.');
    TriggerNameEdit.SetFocus;
    Exit;
  end;
  if Trim(TableNameComboBox.Text) = '' then
  begin
    Common.ShowErrorMessage('Set table name.');
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
