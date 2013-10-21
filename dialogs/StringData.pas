unit StringData;

interface

uses
  System.SysUtils, System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, SynEdit,
  Vcl.ExtCtrls, BCDialogs.Dlg;

type
  TStringDataDialog = class(TDialog)
    CancelButton: TButton;
    OKButton: TButton;
    Panel1: TPanel;
    Panel2: TPanel;
    Separator1Panel: TPanel;
    StringDataEdit: TSynEdit;
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    function GetStringData: WideString;
  public
    { Public declarations }
    function Open(FieldName: string; StringData: WideString): Boolean;
    property StringData: WideString read GetStringData;
  end;

function StringDataDialog: TStringDataDialog;

implementation

{$R *.dfm}

uses
  BCCommon.StyleUtils;

const
  CAPTION_TEXT = 'Edit Field: %s';

var
  FStringDataDialog: TStringDataDialog;

function StringDataDialog: TStringDataDialog;
begin
  if not Assigned(FStringDataDialog) then
    Application.CreateForm(TStringDataDialog, FStringDataDialog);
  Result := FStringDataDialog;
  SetStyledFormSize(Result);
end;

procedure TStringDataDialog.FormDestroy(Sender: TObject);
begin
  FStringDataDialog := nil;
end;

function TStringDataDialog.Open(FieldName: string; StringData: WideString): Boolean;
var
  Rslt: Integer;
begin
  UpdateMargin(StringDataEdit);
  Caption := Format(CAPTION_TEXT, [FieldName]);
  StringDataEdit.Text := StringData;

  Rslt := ShowModal;

  Result := Rslt = mrOk;
end;

function TStringDataDialog.GetStringData: WideString;
begin
  Result := StringDataEdit.Text;
end;

end.
