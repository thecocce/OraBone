unit OptionsTimeFormat;

interface

uses
  System.SysUtils, System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, BCControls.Edit,
  Vcl.ExtCtrls, Ora, BCCommon.OptionsContainer;

type
  TOptionsTimeFormatFrame = class(TFrame)
    Panel: TPanel;
    TimeFormatLabel: TLabel;
    ExampleLabel: TLabel;
    TimeFormatExampleEdit: TBCEdit;
    DescriptionLabel: TLabel;
    TimeFormatHHLabel: TLabel;
    TimeFormatHH24Label: TLabel;
    TimeFormatMILabel: TLabel;
    TimeFormatSSLabel: TLabel;
    TimeFormatSSTextLabel: TLabel;
    TimeFormatMITextLabel: TLabel;
    TimeFormatHH24TextLabel: TLabel;
    TimeFormatHHTextLabel: TLabel;
    TimeFormatEdit: TBCEdit;
    procedure TimeFormatEditChange(Sender: TObject);
  private
    { Private declarations }
    FSession: TOraSession;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    procedure GetData(OptionsContainer: TOraBoneOptionsContainer);
    procedure PutData(OptionsContainer: TOraBoneOptionsContainer);
    property Session: TOraSession write FSession;
  end;

implementation

{$R *.dfm}

uses
  Lib;

constructor TOptionsTimeFormatFrame.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  TimeFormatEditChange(nil);
end;

procedure TOptionsTimeFormatFrame.TimeFormatEditChange(Sender: TObject);
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

procedure TOptionsTimeFormatFrame.PutData(OptionsContainer: TOraBoneOptionsContainer);
begin
  OptionsContainer.TimeFormat := TimeFormatEdit.Text;
end;

procedure TOptionsTimeFormatFrame.GetData(OptionsContainer: TOraBoneOptionsContainer);
begin
  TimeFormatEdit.Text := OptionsContainer.TimeFormat;
end;

end.
