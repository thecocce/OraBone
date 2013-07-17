unit OptionsDBMSOutput;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, BCControls.CheckBox, Vcl.ExtCtrls,
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
