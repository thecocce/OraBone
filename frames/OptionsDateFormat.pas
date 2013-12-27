unit OptionsDateFormat;

interface

uses
  System.SysUtils, System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, BCControls.Edit,
  Vcl.ExtCtrls, Ora, BCCommon.OptionsContainer, BCFrames.OptionsFrame;

type
  TOptionsDateFormatFrame = class(TOptionsFrame)
    Panel: TPanel;
    DateFormatLabel: TLabel;
    ExampleLabel: TLabel;
    DateFormatExampleEdit: TBCEdit;
    DateFormatEdit: TBCEdit;
    DescriptionLabel: TLabel;
    DateFormatDLabel: TLabel;
    DateFormatDDLabel: TLabel;
    DateFormatDDDLabel: TLabel;
    DateFormatDAYLabel: TLabel;
    DateFormatDTextLabel: TLabel;
    DateFormatDDTextLabel: TLabel;
    DateFormatDDDTextLabel: TLabel;
    DateFormatDAYTextLabel: TLabel;
    DateFormatMMLabel: TLabel;
    DateFormatMONLabel: TLabel;
    DateFormatMONTHLabel: TLabel;
    DateFormatYYLabel: TLabel;
    DateFormatYYYYLabel: TLabel;
    DateFormatYYYYTextLabel: TLabel;
    DateFormatYYTextLabel: TLabel;
    DateFormatMONTHTextLabel: TLabel;
    DateFormatMMTextLabel: TLabel;
    DateFormatMONTextLabel: TLabel;
    procedure DateFormatEditChange(Sender: TObject);
  private
    { Private declarations }
    FSession: TOraSession;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure GetData; override;
    procedure PutData; override;
    property Session: TOraSession write FSession;
  end;

function OptionsDateFormatFrame(AOwner: TComponent; OraSession: TOraSession): TOptionsDateFormatFrame;

implementation

{$R *.dfm}

uses
  Lib;

var
  FOptionsDateFormatFrame: TOptionsDateFormatFrame;

function OptionsDateFormatFrame(AOwner: TComponent; OraSession: TOraSession): TOptionsDateFormatFrame;
begin
  if not Assigned(FOptionsDateFormatFrame) then
    FOptionsDateFormatFrame := TOptionsDateFormatFrame.Create(AOwner);
  Result := FOptionsDateFormatFrame;
  Result.Session := OraSession;
end;

destructor TOptionsDateFormatFrame.Destroy;
begin
  inherited;
  FOptionsDateFormatFrame := nil;
end;

constructor TOptionsDateFormatFrame.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  DateFormatEditChange(nil);
end;

procedure TOptionsDateFormatFrame.DateFormatEditChange(Sender: TObject);
begin
  if Trim(DateFormatEdit.Text) <> '' then
  begin
    DateFormatExampleEdit.Font.Color := clGreen;
    try
      DateFormatExampleEdit.Text := Lib.GetSQLFormat(FSession, DateFormatEdit.Text);
    except
      DateFormatExampleEdit.Font.Color := clRed;
      DateFormatExampleEdit.Text := 'Invalid date format!';
    end;
  end;
end;

procedure TOptionsDateFormatFrame.PutData;
begin
  OptionsContainer.DateFormat := DateFormatEdit.Text;
end;

procedure TOptionsDateFormatFrame.GetData;
begin
  DateFormatEdit.Text := OptionsContainer.DateFormat;
end;

end.
