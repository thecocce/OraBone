unit OptionsTimeFormat;

interface

uses
  System.SysUtils, System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, BCControls.Edit,
  Vcl.ExtCtrls, Ora, BCCommon.OptionsContainer, BCFrames.OptionsFrame;

type
  TOptionsTimeFormatFrame = class(TOptionsFrame)
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
    destructor Destroy; override;
    procedure GetData; override;
    procedure Init; override;
    procedure PutData; override;
    property Session: TOraSession write FSession;
  end;

function OptionsTimeFormatFrame(AOwner: TComponent; OraSession: TOraSession): TOptionsTimeFormatFrame;

implementation

{$R *.dfm}

uses
  Lib;

var
  FOptionsTimeFormatFrame: TOptionsTimeFormatFrame;

function OptionsTimeFormatFrame(AOwner: TComponent; OraSession: TOraSession): TOptionsTimeFormatFrame;
begin
  if not Assigned(FOptionsTimeFormatFrame) then
    FOptionsTimeFormatFrame := TOptionsTimeFormatFrame.Create(AOwner);
  Result := FOptionsTimeFormatFrame;
  Result.Session := OraSession;
end;

destructor TOptionsTimeFormatFrame.Destroy;
begin
  inherited;
  FOptionsTimeFormatFrame := nil;
end;

procedure TOptionsTimeFormatFrame.Init;
begin
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

procedure TOptionsTimeFormatFrame.PutData;
begin
  OptionsContainer.TimeFormat := TimeFormatEdit.Text;
end;

procedure TOptionsTimeFormatFrame.GetData;
begin
  TimeFormatEdit.Text := OptionsContainer.TimeFormat;
end;

end.
