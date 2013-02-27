unit DropUser;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms,
  Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Dlg;

type
  TDropUserDialog = class(TDialog)
    CancelButton: TButton;
    CascadeCheckBox: TCheckBox;
    GrayLinePanel: TPanel;
    InfoImage: TImage;
    MessageLabel: TLabel;
    OKButton: TButton;
    Panel1: TPanel;
    Separator1Panel: TPanel;
    TopPanel: TPanel;
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
  Common, Math, StyleHooks;

const
  CAPTION_TEXT = 'Drop user %s, are you sure?';

var
  FDropUserDialog: TDropUserDialog;

function DropUserDialog: TDropUserDialog;
begin
  if FDropUserDialog = nil then
    Application.CreateForm(TDropUserDialog, FDropUserDialog);
  Result := FDropUserDialog;
  StyleHooks.SetStyledFormSize(Result);
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
