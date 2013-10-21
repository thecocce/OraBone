unit QueryProgress;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms,
  Vcl.Dialogs, Vcl.StdCtrls, ActnList, Ora, BCDialogs.Dlg, System.Actions;

const
  WM_AFTER_SHOW = WM_USER + 301; // custom message

type
  TQueryProgressDialog = class(TDialog)
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
    FOraQuery: TOraQuery;
    FStartTime: TDateTime;
    procedure SetExecutionTimeText(Value: string);
    procedure WMAfterShow(var Msg: TMessage); message WM_AFTER_SHOW;
  public
    { Public declarations }
    function Open(OraQuery: TOraQuery; StartTime: TDateTime): Boolean;
    property ExecutionTimeText: string write SetExecutionTimeText;
    property OnProgress: Boolean read FOnProgress;
  end;

function QueryProgressDialog: TQueryProgressDialog;

implementation

{$R *.dfm}

uses
  BCCommon.StyleUtils;

var
  FQueryProgressDialog: TQueryProgressDialog;

function QueryProgressDialog: TQueryProgressDialog;
begin
  if not Assigned(FQueryProgressDialog) then
    Application.CreateForm(TQueryProgressDialog, FQueryProgressDialog);
  Result := FQueryProgressDialog;
  SetStyledFormSize(Result);
end;

procedure TQueryProgressDialog.CancelActionExecute(Sender: TObject);
begin
  FOnProgress := False;
  ExecutionTimeLabel.Caption := 'Canceling...';
  Application.ProcessMessages;
end;

procedure TQueryProgressDialog.WMAfterShow(var Msg: TMessage);
var
  Success, UserCancel: Boolean;
  //Secs, Min: Integer;
begin
  Success := False;
  UserCancel := False;

  if Assigned(FOraQuery) then
  begin
    while FOraQuery.Executing do
    begin
      {Min := StrToInt(FormatDateTime('n', Now - FStartTime));
      Secs := Min * 60 + StrToInt(FormatDateTime('s', Now - FStartTime));
      if Secs < 1 then
        ExecutionTimeText := FormatDateTime('"Execution time:" s.zzz "s."', Now - FStartTime)
      else
      if Secs < 60 then
        ExecutionTimeText := FormatDateTime('"Execution time:" s "s."', Now - FStartTime)
      else
        ExecutionTimeText := FormatDateTime('"Execution time:" n "min" s "s."', Now - FStartTime);  }
      ExecutionTimeText := Format('Time Elapsed: %s', [System.SysUtils.FormatDateTime('hh:nn:ss.zzz', Now - FStartTime)]);

      if not OnProgress then
      begin
        UserCancel := True;
        Break;
      end;
      Application.ProcessMessages;
    end;
    Success := FOraQuery.Active;
  end;
  if Success and (not UserCancel) then
    ModalResult := mrOk
  else
    ModalResult := mrCancel;
end;

procedure TQueryProgressDialog.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FOnProgress := False;
  Action := caFree;
end;

procedure TQueryProgressDialog.FormDestroy(Sender: TObject);
begin
  FQueryProgressDialog := nil;
end;

procedure TQueryProgressDialog.Formshow(Sender: TObject);
begin
  // Post the custom message WM_AFTER_SHOW to our form
  PostMessage(Self.Handle, WM_AFTER_SHOW, 0, 0);
end;

function TQueryProgressDialog.Open(OraQuery: TOraQuery; StartTime: TDateTime): Boolean;
var
  Rslt: Integer;
begin
  FOnProgress := True;
  ExecutionTimeText := '';
  FOraQuery := OraQuery;
  FStartTime := StartTime;

  Rslt := ShowModal;

  Result := Rslt = mrOK;
end;

procedure TQueryProgressDialog.SetExecutionTimeText(Value: string);
begin
  if FOnProgress then
    ExecutionTimeLabel.Caption := Value;
end;

end.
