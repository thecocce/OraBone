unit OptionsTimeFormat;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, JvExStdCtrls, JvEdit, BCControls.BCEdit,
  Vcl.ExtCtrls, Ora;

type
  TTimeFormatFrame = class(TFrame)
    Panel: TPanel;
    TimeFormatLabel: TLabel;
    Label25: TLabel;
    TimeFormatExampleEdit: TBCEdit;
    Label26: TLabel;
    Label29: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label47: TLabel;
    Label48: TLabel;
    Label31: TLabel;
    Label30: TLabel;
    TimeFormatEdit: TBCEdit;
    procedure TimeFormatEditChange(Sender: TObject);
  private
    { Private declarations }
    FSession: TOraSession;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    property Session: TOraSession write FSession;
  end;

implementation

{$R *.dfm}

uses
  Lib;

constructor TTimeFormatFrame.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  TimeFormatEditChange(nil);
end;

procedure TTimeFormatFrame.TimeFormatEditChange(Sender: TObject);
begin
  if Trim(TimeFormatEdit.Text) <> '' then
  begin
    TimeFormatExampleEdit.Font.Color := clGreen;
    try
      TimeFormatExampleEdit.Text := Lib.GetSQLFormat(FSession, TimeFormatEdit.Text);
    except
      TimeFormatExampleEdit.Font.Color := clRed;
      TimeFormatExampleEdit.Text := 'Invalid date format!';
    end;
  end
end;

end.
