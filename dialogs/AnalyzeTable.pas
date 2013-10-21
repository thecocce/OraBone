unit AnalyzeTable;

interface

uses
  System.SysUtils, System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  BCDialogs.Dlg;

type
  TAnalyzeTableDialog = class(TDialog)
    BottomPanel: TPanel;
    CancelButton: TButton;
    ComputeStatisticsRadioButton: TRadioButton;
    EstimateStatisticsRadioButton: TRadioButton;
    ExportButton: TButton;
    GroupBox1: TGroupBox;
    Separator1Panel: TPanel;
    TopPanel: TPanel;
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    FTableName: string;
  public
    { Public declarations }
    function GetSQL: string;
    function Open(TableName: string): Boolean;
  end;

function AnalyzeTableDialog: TAnalyzeTableDialog;

implementation

{$R *.dfm}

uses
  BCCommon.StyleUtils;

const
  CAPTION_TEXT = 'Analyze Table: %s';

var
  FAnalyzeTableDialog: TAnalyzeTableDialog;

function AnalyzeTableDialog: TAnalyzeTableDialog;
begin
  if not Assigned(FAnalyzeTableDialog) then
    Application.CreateForm(TAnalyzeTableDialog, FAnalyzeTableDialog);
  Result := FAnalyzeTableDialog;
  SetStyledFormSize(Result);
end;

procedure TAnalyzeTableDialog.FormDestroy(Sender: TObject);
begin
  FAnalyzeTableDialog := nil;
end;

function TAnalyzeTableDialog.Open(TableName: string): Boolean;
begin
  FTableName := TableName;
  Caption := Format(CAPTION_TEXT, [TableName]);
  Width := Canvas.TextWidth(Caption) + 80;
  Result := ShowModal = mrOk;
end;

function TAnalyzeTableDialog.GetSQL: string;
var
  Statistics: string;
begin
  if ComputeStatisticsRadioButton.Checked then
    Statistics := 'COMPUTE'
  else
    Statistics := 'ESTIMATE';

  { ANALYZE TABLE [table name] COMPUTE/ESTIMATE STATISTICS; }
  Result := Format('ANALYZE TABLE %s %s STATISTICS', [FTableName, Statistics]);
end;

end.
