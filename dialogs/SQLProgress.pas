unit SQLProgress;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms,
  Vcl.Dialogs, Vcl.StdCtrls, ActnList, Ora, BCDialogs.Dlg, System.Actions;

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
  BCCommon.StyleUtils;

var
  FSQLProgressDialog: TSQLProgressDialog;

function SQLProgressDialog: TSQLProgressDialog;
begin
  if not Assigned(FSQLProgressDialog) then
    Application.CreateForm(TSQLProgressDialog, FSQLProgressDialog);
  Result := FSQLProgressDialog;
  SetStyledFormSize(Result);
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
begin
  Success := False;
  UserCancel := False;

  if Assigned(FOraSQL) then
  begin
    while FOraSQL.Executing do
    begin
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
