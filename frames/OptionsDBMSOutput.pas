unit OptionsDBMSOutput;

interface

uses
  System.SysUtils, System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.ComCtrls;

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
  end;

implementation

{$R *.dfm}

procedure TDBMSOutputFrame.PollingIntervalTrackBarChange(Sender: TObject);
begin
  PollingIntervalLabel.Caption := Format('Polling interval: %d second ', [
    PollingIntervalTrackBar.Position]);
end;

end.
