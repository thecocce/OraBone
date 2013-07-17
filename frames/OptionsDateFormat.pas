unit OptionsDateFormat;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, JvExStdCtrls, JvEdit, BCControls.Edit,
  Vcl.ExtCtrls, Ora;

type
  TDateFormatFrame = class(TFrame)
    Panel: TPanel;
    DateFormatLabel: TLabel;
    Label15: TLabel;
    DateFormatExampleEdit: TBCEdit;
    DateFormatEdit: TBCEdit;
    DateFormat1Label: TLabel;
    DateFormat2Label: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    Label11: TLabel;
    DateFormat3Label: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    Label12: TLabel;
    Label17: TLabel;
    Label19: TLabel;
    Label21: TLabel;
    Label23: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label24: TLabel;
    Label22: TLabel;
    Label18: TLabel;
    Label20: TLabel;
    procedure DateFormatEditChange(Sender: TObject);
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

uses Lib;

constructor TDateFormatFrame.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  DateFormatEditChange(nil);
end;

procedure TDateFormatFrame.DateFormatEditChange(Sender: TObject);
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

end.
