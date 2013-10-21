unit HistoryEdit;

interface

uses
  System.SysUtils, System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, SynEdit,
  Vcl.ExtCtrls, BCDialogs.Dlg, SynEditHighlighter, SynHighlighterSQL, Vcl.ComCtrls, BCControls.Edit;

type
  THistoryEditDialog = class(TDialog)
    BottomPanel: TPanel;
    CancelButton: TButton;
    DateLabel: TLabel;
    DatePicker: TDateTimePicker;
    OKButton: TButton;
    Panel1: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    Panel8: TPanel;
    SchemaEdit: TBCEdit;
    SchemaLabel: TLabel;
    Separator1Panel: TPanel;
    SQLLabel: TLabel;
    SQLSynEdit: TSynEdit;
    SynSQLSyn: TSynSQLSyn;
    TimePicker: TDateTimePicker;
    TopPanel: TPanel;
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    function GetHistoryDate: string;
    function GetSchema: string;
    function GetSQLStatement: WideString;
    procedure SetHistoryDate(Value: string);
    procedure SetSchema(Value: string);
    procedure SetSQLStatement(Value: WideString);
  public
    { Public declarations }
    function Open: Boolean;
    property HistoryDate: string read GetHistoryDate write SetHistoryDate;
    property Schema: string read GetSchema write SetSchema;
    property SQLStatement: WideString read GetSQLStatement write SetSQLStatement;
  end;

function HistoryEditDialog: THistoryEditDialog;

implementation

{$R *.dfm}

uses
  BCCommon.StyleUtils, BCCommon.Messages;

const
  CAPTION_TEXT = 'Edit Field: %s';

var
  FHistoryEditDialog: THistoryEditDialog;

function HistoryEditDialog: THistoryEditDialog;
begin
  if not Assigned(FHistoryEditDialog) then
    Application.CreateForm(THistoryEditDialog, FHistoryEditDialog);
  Result := FHistoryEditDialog;
  SetStyledFormSize(Result);
end;

procedure THistoryEditDialog.FormDestroy(Sender: TObject);
begin
  FHistoryEditDialog := nil;
end;

function THistoryEditDialog.Open: Boolean;
begin
  UpdateMargin(SQLSynEdit);
  UpdateSQLSynColors(SynSQLSyn);

  Result := ShowModal = mrOk;
end;

function THistoryEditDialog.GetHistoryDate: string;
begin
  try
    Result := Format('%s %s', [DateToStr(DatePicker.Date), TimeToStr(TimePicker.Time)]);
  except
    on E: Exception do
      ShowErrorMessage(E.Message);
  end;
end;

procedure THistoryEditDialog.SetHistoryDate(Value: string);
begin
  try
    DatePicker.DateTime := StrToDateTime(Value);
    TimePicker.DateTime := StrToDateTime(Value);
  except
    on E: Exception do
      ShowErrorMessage(E.Message);
  end;
end;

function THistoryEditDialog.GetSchema: string;
begin
  Result := SchemaEdit.Text;
end;

procedure THistoryEditDialog.SetSchema(Value: string);
begin
  SchemaEdit.Text := Value;
end;

function THistoryEditDialog.GetSQLStatement: WideString;
begin
  Result := SQLSynEdit.Text;
end;

procedure THistoryEditDialog.SetSQLStatement(Value: WideString);
begin
  SQLSynEdit.Text := Value;
end;

end.
