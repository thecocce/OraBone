unit AnalyzeTable;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TAnalyzeTableDialog = class(TForm)
    TopPanel: TPanel;
    GroupBox1: TGroupBox;
    ComputeStatisticsRadioButton: TRadioButton;
    EstimateStatisticsRadioButton: TRadioButton;
    BottomPanel: TPanel;
    ExportButton: TButton;
    CancelButton: TButton;
    Separator1Panel: TPanel;
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    FTableName: string;
  public
    { Public declarations }
    function Open(TableName: string): Boolean;
    function GetSQL: string;
  end;

function AnalyzeTableDialog: TAnalyzeTableDialog;

implementation

{$R *.dfm}

const
  CAPTION_TEXT = 'Analyze Table: %s';

var
  FAnalyzeTableDialog: TAnalyzeTableDialog;

function AnalyzeTableDialog: TAnalyzeTableDialog;
begin
  if FAnalyzeTableDialog = nil then
    Application.CreateForm(TAnalyzeTableDialog, FAnalyzeTableDialog);
  Result := FAnalyzeTableDialog;
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
