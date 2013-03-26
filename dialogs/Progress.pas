unit Progress;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms,
  Vcl.Dialogs, Vcl.StdCtrls, ComCtrls, JvExComCtrls, JvProgressBar, Vcl.ExtCtrls, ActnList, Dlg,
  Vcl.Themes;

type
  TProgressDialog = class(TDialog)
    ActionList: TActionList;
    CancelAction: TAction;
    CancelButton: TButton;
    InformationLabel: TLabel;
    ProgressBar: TJvProgressBar;
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
  Common, StyleHooks;

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
  StyleHooks.SetStyledFormSize(Self);
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

{ TProgressBarStyleHookMarquee }
 {
constructor TProgressBarStyleHookMarquee.Create(AControl: TWinControl);
begin
  inherited;
  FStep := 0;
  Timer := TTimer.Create(nil);
  Timer.Interval := 100;//TProgressBar(Control).MarqueeInterval;
  Timer.OnTimer := TimerAction;
  Timer.Enabled := TJvProgressBar(Control).Marquee;
end;

destructor TProgressBarStyleHookMarquee.Destroy;
begin
  Timer.Free;
  inherited;
end;

procedure TProgressBarStyleHookMarquee.PaintBar(Canvas: TCanvas);
var
  FillR, R: TRect;
  W, Pos: Integer;
  Details: TThemedElementDetails;
begin
  if (TJvProgressBar(Control).Marquee) and StyleServices.Available  then
  begin
    R := BarRect;
    InflateRect(R, -1, -1);
    if Orientation = pbHorizontal then
      W := R.Width
    else
      W := R.Height;

    Pos := Round(W * 0.1);
    FillR := R;
    if Orientation = pbHorizontal then
    begin
      FillR.Right := FillR.Left + Pos;
      Details := StyleServices.GetElementDetails(tpChunk);
    end
    else
    begin
      FillR.Top := FillR.Bottom - Pos;
      Details := StyleServices.GetElementDetails(tpChunkVert);
    end;

    FillR.SetLocation(FStep*FillR.Width, FillR.Top);
    StyleServices.DrawElement(Canvas.Handle, Details, FillR);
    Inc(FStep, 1);
    if FStep mod 10=0 then
      FStep := 0;
  end
  else
  inherited;
end;

procedure TProgressBarStyleHookMarquee.TimerAction(Sender: TObject);
var
  Canvas: TCanvas;
begin
  if StyleServices.Available and (TJvProgressBar(Control).Marquee) and Control.Visible  then
  begin
    Canvas := TCanvas.Create;
    try
      Canvas.Handle := GetWindowDC(Control.Handle);
      PaintFrame(Canvas);
      PaintBar(Canvas);
    finally
      ReleaseDC(Handle, Canvas.Handle);
      Canvas.Handle := 0;
      Canvas.Free;
    end;
  end
  else
  Timer.Enabled := False;
end;   }

initialization

  TStyleManager.Engine.RegisterStyleHook(TJvProgressBar, TProgressBarStyleHookMarquee);


end.
