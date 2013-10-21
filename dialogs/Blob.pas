unit Blob;

interface

uses
  System.SysUtils, System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB,
  Vcl.ExtCtrls, BCDialogs.Dlg;

type
  TBlobDialog = class(TDialog)
    BottomPanel: TPanel;
    CancelButton: TButton;
    ClearButton: TButton;
    DataSizeLabel: TLabel;
    LoadButton: TButton;
    Panel1: TPanel;
    SaveButton: TButton;
    Separator1Panel: TPanel;
    TopPanel: TPanel;
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function Open(Field: TBlobField): Integer;
  end;

function BlobDialog: TBlobDialog;

implementation

{$R *.dfm}

uses
  BCCommon.StyleUtils;

var
  FBlobDialog: TBlobDialog;

function BlobDialog: TBlobDialog;
begin
  if not Assigned(FBlobDialog) then
    Application.CreateForm(TBlobDialog, FBlobDialog);
  Result := FBlobDialog;
  SetStyledFormSize(Result);
end;

procedure TBlobDialog.FormDestroy(Sender: TObject);
begin
  FBlobDialog := nil;
end;

function TBlobDialog.Open(Field: TBlobField): Integer;
begin
  SaveButton.Enabled := not Field.IsNull;
  DataSizeLabel.Caption := Format(DataSizeLabel.Caption, [Field.BlobSize]);
  Result := ShowModal;
end;

end.
