unit OptionsDBMSOutput;

interface

uses
  System.SysUtils, System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.ComCtrls, BCCommon.OptionsContainer;

type
  TDBMSOutputFrame = class(TFrame)
    Panel: TPanel;
    PollingIntervalLabel: TLabel;
    PollingIntervalTrackBar: TTrackBar;
    procedure PollingIntervalTrackBarChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure GetData(OptionsContainer: TOptionsContainer);
    procedure PutData(OptionsContainer: TOptionsContainer);
  end;

implementation

{$R *.dfm}

procedure TDBMSOutputFrame.PollingIntervalTrackBarChange(Sender: TObject);
begin
  PollingIntervalLabel.Caption := Format('Polling interval: %d second ', [
    PollingIntervalTrackBar.Position]);
end;

procedure TDBMSOutputFrame.PutData(OptionsContainer: TOptionsContainer);
begin
  OptionsContainer.PollingInterval := PollingIntervalTrackBar.Position;
end;

procedure TDBMSOutputFrame.GetData(OptionsContainer: TOptionsContainer);
begin
  PollingIntervalTrackBar.Position := OptionsContainer.PollingInterval;
end;

end.
