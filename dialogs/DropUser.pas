unit DropUser;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms,
  Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TDropUserDialog = class(TForm)
    TopPanel: TPanel;
    MessageLabel: TLabel;
    InfoImage: TImage;
    CascadeCheckBox: TCheckBox;
    GrayLinePanel: TPanel;
    Panel1: TPanel;
    CancelButton: TButton;
    OKButton: TButton;
    Separator1Panel: TPanel;
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    function GetCascadeObjects: Boolean;
  public
    { Public declarations }
    function Open(TableName: string): Boolean;
    property CascadeObjects: Boolean read GetCascadeObjects;
  end;

function DropUserDialog: TDropUserDialog;

implementation

{$R *.dfm}

uses
  Common, Math;

const
  CAPTION_TEXT = 'Drop user %s, are you sure?';

var
  FDropUserDialog: TDropUserDialog;

function DropUserDialog: TDropUserDialog;
begin
  if FDropUserDialog = nil then
    Application.CreateForm(TDropUserDialog, FDropUserDialog);
  Result := FDropUserDialog;
  Common.SetStyledFormSize(Result, 220, 141);
end;

procedure TDropUserDialog.FormDestroy(Sender: TObject);
begin
  FDropUserDialog := nil;
end;

function TDropUserDialog.GetCascadeObjects: Boolean;
begin
  Result := CascadeCheckBox.Checked;
end;

function TDropUserDialog.Open(TableName: string): Boolean;
begin
  MessageLabel.Caption := Format(CAPTION_TEXT, [TableName]);

  InfoImage.Picture.Icon.Handle := LoadIcon(0, IDI_INFORMATION);
  Width := Max(220, InfoImage.Width + MessageLabel.Width + 40);

  Result := ShowModal = mrOk;
end;

end.
