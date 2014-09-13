unit CreateSequence;

interface

uses
  System.SysUtils, System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, CreateObjectDialog, Vcl.StdCtrls,
  BCControls.Edit, Vcl.ImgList, SynEditHighlighter, SynHighlighterSQL, ActnList, ComCtrls, ToolWin, JvExComCtrls,
  SynEdit, Vcl.ExtCtrls, JvComCtrls, BCControls.PageControl, BCControls.ToolBar, BCDialogs.Dlg, System.Actions,
  BCControls.ImageList, BCControls.CheckBox, JvExStdCtrls, JvCheckBox;

type
  TCreateSequenceDialog = class(TCreateObjectBaseDialog)
    CacheEdit: TBCEdit;
    CacheLabel: TLabel;
    CycleCheckBox: TBCCheckBox;
    IncrementByEdit: TBCEdit;
    IncrementByLabel: TLabel;
    MaxValueEdit: TBCEdit;
    MaxValueLabel: TLabel;
    MinValueEdit: TBCEdit;
    MinValueLabel: TLabel;
    OrderCheckBox: TBCCheckBox;
    SequenceNameEdit: TBCEdit;
    SequenceNameLabel: TLabel;
    SettingsTabSheet: TTabSheet;
    StartWithEdit: TBCEdit;
    StartWithLabel: TLabel;
    procedure FormDestroy(Sender: TObject);
    procedure Formshow(Sender: TObject);
  protected
    function CheckFields: Boolean; override;
    procedure CreateSQL; override;
    procedure Initialize; override;
  end;

function CreateSequenceDialog: TCreateSequenceDialog;

implementation

{$R *.dfm}

uses
  BCCommon.StyleUtils, BCCommon.Messages, BCCommon.Lib;

var
  FCreateSequenceDialog: TCreateSequenceDialog;

function CreateSequenceDialog: TCreateSequenceDialog;
begin
  if not Assigned(FCreateSequenceDialog) then
    Application.CreateForm(TCreateSequenceDialog, FCreateSequenceDialog);
  Result := FCreateSequenceDialog;
  SetStyledFormSize(TDialog(Result));
end;

procedure TCreateSequenceDialog.FormDestroy(Sender: TObject);
begin
  inherited;
  FCreateSequenceDialog := nil;
end;

procedure TCreateSequenceDialog.Formshow(Sender: TObject);
begin
  inherited;
  SequenceNameEdit.SetFocus;
end;

function TCreateSequenceDialog.CheckFields: Boolean;
begin
  Result := False;
  if Trim(SequenceNameEdit.Text) = '' then
  begin
    ShowErrorMessage('Set sequence name.');
    SequenceNameEdit.SetFocus;
    Exit;
  end;
  Result := True;
end;

procedure TCreateSequenceDialog.Initialize;
begin
  inherited;
  { default values }
  MinValueEdit.Text := '1';
  MaxValueEdit.Text := '999999999999999999999999999';
  StartWithEdit.Text := '1';
  IncrementByEdit.Text := '1';
  CacheEdit.Text := '20';
end;

procedure TCreateSequenceDialog.CreateSQL;
begin
  SourceSynEdit.Lines.Clear;
  SourceSynEdit.Lines.BeginUpdate;
  SourceSynEdit.Lines.Text := SourceSynEdit.Lines.Text + 'CREATE SEQUENCE ' + FSchemaParam + '.' + SequenceNameEdit.Text + '' + CHR_ENTER;
    SourceSynEdit.Lines.Text := SourceSynEdit.Lines.Text + '  MINVALUE ' + MinValueEdit.Text + CHR_ENTER;
    SourceSynEdit.Lines.Text := SourceSynEdit.Lines.Text + '  MAXVALUE ' + MaxValueEdit.Text + CHR_ENTER;
    SourceSynEdit.Lines.Text := SourceSynEdit.Lines.Text + '  START WITH ' + StartWithEdit.Text + CHR_ENTER;
    SourceSynEdit.Lines.Text := SourceSynEdit.Lines.Text + '  INCREMENT BY ' + IncrementByEdit.Text + CHR_ENTER;
    if CacheEdit.Text <> '' then
      SourceSynEdit.Lines.Text := SourceSynEdit.Lines.Text + '  CACHE ' + CacheEdit.Text + CHR_ENTER
    else
      SourceSynEdit.Lines.Text := SourceSynEdit.Lines.Text + '  NOCACHE' + CHR_ENTER;
    if CycleCheckBox.Checked then
      SourceSynEdit.Lines.Text := SourceSynEdit.Lines.Text + '  CYCLE' + CHR_ENTER
    else
      SourceSynEdit.Lines.Text := SourceSynEdit.Lines.Text + '  NOCYCLE' + CHR_ENTER;
    if OrderCheckBox.Checked then
      SourceSynEdit.Lines.Text := SourceSynEdit.Lines.Text + '  ORDER'
    else
      SourceSynEdit.Lines.Text := SourceSynEdit.Lines.Text + '  NOORDER';
    SourceSynEdit.Lines.Text := SourceSynEdit.Lines.Text + ';' + CHR_ENTER + CHR_ENTER;
  SourceSynEdit.Lines.EndUpdate;
end;

end.
