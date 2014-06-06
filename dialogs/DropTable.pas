unit DropTable;

interface

uses
  Winapi.Windows, System.SysUtils, System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  Vcl.ExtCtrls, BCDialogs.Dlg, BCControls.CheckBox, JvExStdCtrls, JvCheckBox;

type
  TDropTableDialog = class(TDialog)
    CancelButton: TButton;
    CascadeConstraintsCheckBox: TBCCheckBox;
    GrayLinePanel: TPanel;
    InfoImage: TImage;
    MessageLabel: TLabel;
    OKButton: TButton;
    Panel1: TPanel;
    PurgeCheckBox: TBCCheckBox;
    Separator1Panel: TPanel;
    TopPanel: TPanel;
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
  System.Math, BCCommon.StyleUtils;

const
  CAPTION_TEXT = 'Drop table %s, are you sure?';

var
  FDropTableDialog: TDropTableDialog;

function DropTableDialog: TDropTableDialog;
begin
  if not Assigned(FDropTableDialog) then
    Application.CreateForm(TDropTableDialog, FDropTableDialog);
  Result := FDropTableDialog;
  SetStyledFormSize(Result);
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
