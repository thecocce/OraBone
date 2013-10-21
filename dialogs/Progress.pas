unit Progress;

interface

uses
  System.SysUtils, System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, ComCtrls,
  JvExComCtrls, BCControls.ProgressBar, Vcl.ExtCtrls, ActnList, BCDialogs.Dlg, System.Actions, JvProgressBar;

type
  TProgressDialog = class(TDialog)
    ActionList: TActionList;
    CancelAction: TAction;
    CancelButton: TButton;
    InformationLabel: TLabel;
    ProgressBar: TBCProgressBar;
    ProgressPanel: TPanel;
    TopPanel: TPanel;
    procedure CancelActionExecute(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    FOnProgress: Boolean;
    procedure SetInformationText(Value: string);
    procedure SetProgressPosition(Value: Integer);
  public
    { Public declarations }
    procedure Open(ProgressMin: Integer; ProgressMax: Integer; ShowCancel: Boolean; Marquee: Boolean = False);
    procedure SetRange(ProgressMin: Integer; ProgressMax: Integer);
    property InformationText: string write SetInformationText;
    property OnProgress: Boolean read FOnProgress;
    property ProgressPosition: Integer write SetProgressPosition;
  end;

function ProgressDialog(AOwner: TComponent): TProgressDialog;

implementation

{$R *.dfm}

uses
  BCCommon.StyleUtils;

var
  FProgressDialog: TProgressDialog;

function ProgressDialog(AOwner: TComponent): TProgressDialog;
begin
  if not Assigned(FProgressDialog) then
    FProgressDialog := TProgressDialog.Create(AOwner);
  Result := FProgressDialog;
end;

procedure TProgressDialog.CancelActionExecute(Sender: TObject);
begin
  FOnProgress := False;
  InformationLabel.Caption := 'Canceling...';
  Repaint;
  Application.ProcessMessages;
end;

procedure TProgressDialog.FormDestroy(Sender: TObject);
begin
  FProgressDialog := nil;
end;

procedure TProgressDialog.SetRange(ProgressMin: Integer; ProgressMax: Integer);
begin
  ProgressBar.Position := 0;
  ProgressBar.Min := ProgressMin;
  ProgressBar.Max := ProgressMax;
  ProgressBar.Invalidate;
  Application.ProcessMessages;
end;

procedure TProgressDialog.Open(ProgressMin: Integer; ProgressMax: Integer; ShowCancel: Boolean; Marquee: Boolean = False);
begin
  FOnProgress := True;
  SetRange(ProgressMin, ProgressMax);
  InformationText := '';
  CancelButton.Visible := ShowCancel;
  if ShowCancel then
    Height := 140
  else
    Height := 99;
  OrigHeight := Height;
  SetStyledFormSize(Self);
  ProgressBar.Marquee := Marquee;
  Visible := True;
end;

procedure TProgressDialog.SetInformationText(Value: string);
begin
  if FOnProgress then
  begin
    InformationLabel.Caption := Value;
    Invalidate;
    Application.ProcessMessages;
  end;
end;

procedure TProgressDialog.SetProgressPosition(Value: Integer);
begin
  if FOnProgress then
  begin
    ProgressBar.Position := Value;
    Invalidate;
    Application.ProcessMessages;
  end;
end;

end.
