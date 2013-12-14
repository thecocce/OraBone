unit OptionsDBMSOutput;

interface

uses
  System.SysUtils, System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.ComCtrls, BCCommon.OptionsContainer;

type
  TOptionsDBMSOutputFrame = class(TFrame)
    Panel: TPanel;
    PollingIntervalLabel: TLabel;
    PollingIntervalTrackBar: TTrackBar;
    procedure PollingIntervalTrackBarChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure GetData(OptionsContainer: TOraBoneOptionsContainer);
    procedure PutData(OptionsContainer: TOraBoneOptionsContainer);
  end;

implementation

{$R *.dfm}

procedure TOptionsDBMSOutputFrame.PollingIntervalTrackBarChange(Sender: TObject);
begin
  PollingIntervalLabel.Caption := Format('Polling interval: %d second ', [
    PollingIntervalTrackBar.Position]);
end;

procedure TOptionsDBMSOutputFrame.PutData(OptionsContainer: TOraBoneOptionsContainer);
begin
  OptionsContainer.PollingInterval := PollingIntervalTrackBar.Position;
end;

procedure TOptionsDBMSOutputFrame.GetData(OptionsContainer: TOraBoneOptionsContainer);
begin
  PollingIntervalTrackBar.Position := OptionsContainer.PollingInterval;
end;

end.
