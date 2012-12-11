unit DropTable;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms,
  Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Dlg;

type
  TDropTableDialog = class(TDialog)
    TopPanel: TPanel;
    MessageLabel: TLabel;
    CascadeConstraintsCheckBox: TCheckBox;
    PurgeCheckBox: TCheckBox;
    GrayLinePanel: TPanel;
    InfoImage: TImage;
    Panel1: TPanel;
    OKButton: TButton;
    CancelButton: TButton;
    Separator1Panel: TPanel;
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    function GetCascadeConstraints: Boolean;
    function GetPurge: Boolean;
  public
    { Public declarations }
    function Open(TableName: string): Boolean;
    property CascadeConstraints: Boolean read GetCascadeConstraints;
    property Purge: Boolean read GetPurge;
  end;

function DropTableDialog: TDropTableDialog;

implementation

{$R *.dfm}

uses
  Common, Math, StyleHooks;

const
  CAPTION_TEXT = 'Drop table %s, are you sure?';

var
  FDropTableDialog: TDropTableDialog;

function DropTableDialog: TDropTableDialog;
begin
  if FDropTableDialog = nil then
    Application.CreateForm(TDropTableDialog, FDropTableDialog);
  Result := FDropTableDialog;
  StyleHooks.SetStyledFormSize(Result);
end;

procedure TDropTableDialog.FormDestroy(Sender: TObject);
begin
  FDropTableDialog := nil;
end;

function TDropTableDialog.GetCascadeConstraints: Boolean;
begin
  Result := CascadeConstraintsCheckBox.Checked;
end;

function TDropTableDialog.GetPurge: Boolean;
begin
  Result := PurgeCheckBox.Checked;
end;

function TDropTableDialog.Open(TableName: string): Boolean;
begin
  MessageLabel.Caption := Format(CAPTION_TEXT, [TableName]);
  InfoImage.Picture.Icon.Handle := LoadIcon(0, IDI_INFORMATION);
  Width := Max(220, InfoImage.Width + MessageLabel.Width + 40);
  Result := ShowModal = mrOk;
end;

end.
