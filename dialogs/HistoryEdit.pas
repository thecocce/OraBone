unit HistoryEdit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms,
  Vcl.Dialogs, Vcl.StdCtrls, SynEdit, Vcl.ExtCtrls, Dlg, SynEditHighlighter, SynHighlighterSQL,
  Vcl.ComCtrls;

type
  THistoryEditDialog = class(TDialog)
    BottomPanel: TPanel;
    OKButton: TButton;
    CancelButton: TButton;
    Separator1Panel: TPanel;
    TopPanel: TPanel;
    Panel3: TPanel;
    TimePicker: TDateTimePicker;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    SQLSynEdit: TSynEdit;
    SynSQLSyn: TSynSQLSyn;
    SQLLabel: TLabel;
    Panel7: TPanel;
    DateLabel: TLabel;
    Panel8: TPanel;
    SchemaLabel: TLabel;
    SchemaEdit: TEdit;
    DatePicker: TDateTimePicker;
    Panel1: TPanel;
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    function GetHistoryDate: string;
    procedure SetHistoryDate(Value: string);
    function GetSchema: string;
    procedure SetSchema(Value: string);
    function GetSQLStatement: WideString;
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
  Common, Vcl.Themes, StyleHooks;

const
  CAPTION_TEXT = 'Edit Field: %s';

var
  FHistoryEditDialog: THistoryEditDialog;

function HistoryEditDialog: THistoryEditDialog;
begin
  if FHistoryEditDialog = nil then
    Application.CreateForm(THistoryEditDialog, FHistoryEditDialog);
  Result := FHistoryEditDialog;
  Common.SetStyledFormSize(Result);
end;

procedure THistoryEditDialog.FormDestroy(Sender: TObject);
begin
  FHistoryEditDialog := nil;
end;

function THistoryEditDialog.Open: Boolean;
begin
  UpdateGutter(SQLSynEdit);

  Result := ShowModal = mrOk;
end;

function THistoryEditDialog.GetHistoryDate: string;
begin
  try
    Result := Format('%s %s', [DateToStr(DatePicker.Date), TimeToStr(TimePicker.Time)]);
  except
    on E: Exception do
      Common.ShowErrorMessage(E.Message);
  end;
end;

procedure THistoryEditDialog.SetHistoryDate(Value: string);
begin
  try
    DatePicker.DateTime := StrToDateTime(Value);
    TimePicker.DateTime := StrToDateTime(Value);
  except
    on E: Exception do
      Common.ShowErrorMessage(E.Message);
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

initialization

  TStyleManager.Engine.RegisterStyleHook(TCustomSynEdit, TSynEditStyleHook);

end.
