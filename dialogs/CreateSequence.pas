unit CreateSequence;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms,
  Vcl.Dialogs, CreateObjectDialog, Vcl.StdCtrls, JvExStdCtrls, JvEdit, BCEdit, Vcl.ImgList, SynEditHighlighter,
  SynHighlighterSQL, ActnList, ComCtrls, ToolWin, JvExComCtrls, JvToolBar, SynEdit, Vcl.ExtCtrls,
  JvComCtrls, BCPageControl, BCToolBar;

type
  TCreateSequenceDialog = class(TCreateObjectBaseDialog)
    SettingsTabSheet: TTabSheet;
    SequenceNameLabel: TLabel;
    SequenceNameEdit: TBCEdit;
    MinValueLabel: TLabel;
    MinValueEdit: TBCEdit;
    MaxValueLabel: TLabel;
    MaxValueEdit: TBCEdit;
    StartWithLabel: TLabel;
    StartWithEdit: TBCEdit;
    IncrementByLabel: TLabel;
    IncrementByEdit: TBCEdit;
    CacheLabel: TLabel;
    CacheEdit: TBCEdit;
    OrderCheckBox: TCheckBox;
    CycleCheckBox: TCheckBox;
    procedure FormDestroy(Sender: TObject);
    procedure Formshow(Sender: TObject);
  private
    { Private declarations }
  protected
    procedure CreateSQL; override;
    function CheckFields: Boolean; override;
    procedure Initialize; override;
  public
    { Public declarations }
  end;

function CreateSequenceDialog: TCreateSequenceDialog;

implementation

{$R *.dfm}

uses
  Common;

var
  FCreateSequenceDialog: TCreateSequenceDialog;

function CreateSequenceDialog: TCreateSequenceDialog;
begin
  if FCreateSequenceDialog = nil then
    Application.CreateForm(TCreateSequenceDialog, FCreateSequenceDialog);
  Result := FCreateSequenceDialog;
  Common.SetStyledFormSize(Result, 371, 295);
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
    Common.ShowErrorMessage('Set sequence name.');
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
