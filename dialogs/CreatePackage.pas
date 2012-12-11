unit CreatePackage;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms,
  Vcl.Dialogs, CreateObjectDialog, Vcl.ImgList, SynEditHighlighter, SynHighlighterSQL, ActnList, Vcl.StdCtrls,
  ComCtrls, ToolWin, JvExComCtrls, JvToolBar, SynEdit, Vcl.ExtCtrls, JvComCtrls, BCPageControl,
  JvExStdCtrls, JvEdit, BCEdit, BCToolBar, Dlg;

type
  TCreatePackageDialog = class(TCreateObjectBaseDialog)
    SpecificationTabSheet: TTabSheet;
    BodyTabSheet: TTabSheet;
    PackageNameLabel: TLabel;
    PackageNameEdit: TBCEdit;
    SepcificationPanel: TPanel;
    SpecificationSynEdit: TSynEdit;
    BodyPanel: TPanel;
    BodySynEdit: TSynEdit;
    procedure FormDestroy(Sender: TObject);
    procedure Formshow(Sender: TObject);
    procedure PackageNameEditExit(Sender: TObject);
  private
    { Private declarations }
  protected
    procedure CreateSQL; override;
  public
    { Public declarations }
  end;

function CreatePackageDialog: TCreatePackageDialog;

implementation

{$R *.dfm}

uses
  Common, StyleHooks;

var
  FCreatePackageDialog: TCreatePackageDialog;

function CreatePackageDialog: TCreatePackageDialog;
begin
  if FCreatePackageDialog = nil then
    Application.CreateForm(TCreatePackageDialog, FCreatePackageDialog);
  Result := FCreatePackageDialog;
  StyleHooks.SetStyledFormSize(TDialog(Result));
end;


procedure TCreatePackageDialog.FormDestroy(Sender: TObject);
begin
  inherited;
  FCreatePackageDialog := nil;
end;

procedure TCreatePackageDialog.Formshow(Sender: TObject);
begin
  inherited;
  PackageNameEdit.SetFocus;
end;

procedure TCreatePackageDialog.PackageNameEditExit(Sender: TObject);
begin
  inherited;
  if Trim(SpecificationSynEdit.Lines.Text) = '' then
  begin
    SpecificationSynEdit.Lines.BeginUpdate;
    SpecificationSynEdit.Lines.Text := Format('CREATE OR REPLACE PACKAGE %s.%s AS', [FSchemaParam, PackageNameEdit.Text]) +
      CHR_ENTER + CHR_ENTER + Format('END %s;', [PackageNameEdit.Text]);
    SpecificationSynEdit.Lines.EndUpdate;
  end;
  if Trim(BodySynEdit.Lines.Text) = '' then
  begin
    BodySynEdit.Lines.BeginUpdate;
    BodySynEdit.Lines.Text := Format('CREATE OR REPLACE PACKAGE BODY %s.%s AS', [FSchemaParam, PackageNameEdit.Text]) +
      CHR_ENTER + CHR_ENTER + Format('END %s;', [PackageNameEdit.Text]);
    BodySynEdit.Lines.EndUpdate;
  end;
end;

procedure TCreatePackageDialog.CreateSQL;
begin
  SourceSynEdit.Lines.Clear;
  SourceSynEdit.Lines.BeginUpdate;
  SourceSynEdit.Lines.Text := SpecificationSynEdit.Lines.Text + CHR_ENTER + '/' + CHR_ENTER + BodySynEdit.Lines.Text;
  SourceSynEdit.Lines.EndUpdate;
end;

end.
