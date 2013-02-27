unit SQLProgress;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms,
  Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, ActnList, Ora, Dlg;

const
  WM_AFTER_SHOW = WM_USER + 302; // custom message

type
  TSQLProgressDialog = class(TDialog)
    ActionList: TActionList;
    CancelAction: TAction;
    CancelButton: TButton;
    ExecutionTimeLabel: TLabel;
    procedure CancelActionExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure Formshow(Sender: TObject);
  private
    { Private declarations }
    FOnProgress: Boolean;
    FOraSQL: TOraSQL;
    FStartTime: TDateTime;
    procedure SetExecutionTimeText(Value: string);
    procedure WMAfterShow(var Msg: TMessage); message WM_AFTER_SHOW;
  public
    { Public declarations }
    property ExecutionTimeText: string write SetExecutionTimeText;
    function Open(OraSQL: TOraSQL; StartTime: TDateTime): Boolean;
  end;

function SQLProgressDialog: TSQLProgressDialog;

implementation

{$R *.dfm}

uses
  Common, StyleHooks;

var
  FSQLProgressDialog: TSQLProgressDialog;

function SQLProgressDialog: TSQLProgressDialog;
begin
  if FSQLProgressDialog = nil then
    Application.CreateForm(TSQLProgressDialog, FSQLProgressDialog);
  Result := FSQLProgressDialog;
  StyleHooks.SetStyledFormSize(Result);
end;

procedure TSQLProgressDialog.CancelActionExecute(Sender: TObject);
begin
  FOnProgress := False;
  ExecutionTimeLabel.Caption := 'Canceling...';
  Application.ProcessMessages;
end;

procedure TSQLProgressDialog.WMAfterShow(var Msg: TMessage);
var
  Success, UserCancel: Boolean;
//  Secs, Min: Integer;
begin
  Success := False;
  UserCancel := False;

  if Assigned(FOraSQL) then
  begin
    while FOraSQL.Executing do
    begin
      {Min := StrToInt(FormatDateTime('n', Now - FStartTime));
      Secs := Min * 60 + StrToInt(FormatDateTime('s', Now - FStartTime));
      if Secs < 1 then
        ExecutionTimeText := FormatDateTime('"Execution time:" s.zzz "s."', Now - FStartTime)
      else
      if Secs < 60 then
        ExecutionTimeText := FormatDateTime('"Execution time:" s "s."', Now - FStartTime)
      else
        ExecutionTimeText := FormatDateTime('"Execution time:" n "min" s "s."', Now - FStartTime);}
      ExecutionTimeText := Format('Time Elapsed: %s', [System.SysUtils.FormatDateTime('hh:nn:ss.zzz', Now - FStartTime)]);
      if not FOnProgress then
      begin
        UserCancel := True;
        Break;
      end;
      Application.ProcessMessages;
    end;
    Success := FOraSQL.ErrorOffset = 0;
  end;
  if Success and (not UserCancel) then
    ModalResult := mrOk
  else
    ModalResult := mrCancel;
end;

procedure TSQLProgressDialog.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FOnProgress := False;
  Action := caFree;
end;

procedure TSQLProgressDialog.FormDestroy(Sender: TObject);
begin
  FSQLProgressDialog := nil;
end;

procedure TSQLProgressDialog.Formshow(Sender: TObject);
begin
  // Post the custom message WM_AFTER_SHOW to our form
  PostMessage(Self.Handle, WM_AFTER_SHOW, 0, 0);
end;

function TSQLProgressDialog.Open(OraSQL: TOraSQL; StartTime: TDateTime): Boolean;
var
  Rslt: Integer;
begin
  FOnProgress := True;
  ExecutionTimeText := '';
  FOraSQL := OraSQL;
  FStartTime := StartTime;

  Rslt := ShowModal;

  Result := Rslt = mrOK;
end;

procedure TSQLProgressDialog.SetExecutionTimeText(Value: string);
begin
  if FOnProgress then
    ExecutionTimeLabel.Caption := Value;
end;

end.
