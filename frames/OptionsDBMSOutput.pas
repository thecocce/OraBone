unit OptionsDBMSOutput;

interface

uses
  System.SysUtils, System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.ComCtrls, BCCommon.OptionsContainer, BCFrames.OptionsFrame;

type
  TOptionsDBMSOutputFrame = class(TOptionsFrame)
    Panel: TPanel;
    PollingIntervalLabel: TLabel;
    PollingIntervalTrackBar: TTrackBar;
    procedure PollingIntervalTrackBarChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    destructor Destroy; override;
    procedure GetData; override;
    procedure PutData; override;
  end;

function OptionsDBMSOutputFrame(AOwner: TComponent): TOptionsDBMSOutputFrame;

implementation

{$R *.dfm}

var
  FOptionsDBMSOutputFrame: TOptionsDBMSOutputFrame;

function OptionsDBMSOutputFrame(AOwner: TComponent): TOptionsDBMSOutputFrame;
begin
  if not Assigned(FOptionsDBMSOutputFrame) then
    FOptionsDBMSOutputFrame := TOptionsDBMSOutputFrame.Create(AOwner);
  Result := FOptionsDBMSOutputFrame;
end;

destructor TOptionsDBMSOutputFrame.Destroy;
begin
  inherited;
  FOptionsDBMSOutputFrame := nil;
end;

procedure TOptionsDBMSOutputFrame.PollingIntervalTrackBarChange(Sender: TObject);
begin
  PollingIntervalLabel.Caption := Format('Polling interval: %d second ', [
    PollingIntervalTrackBar.Position]);
end;

procedure TOptionsDBMSOutputFrame.PutData;
begin
  OptionsContainer.PollingInterval := PollingIntervalTrackBar.Position;
end;

procedure TOptionsDBMSOutputFrame.GetData;
begin
  PollingIntervalTrackBar.Position := OptionsContainer.PollingInterval;
end;

end.
