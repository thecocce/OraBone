unit StringData;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms,
  Vcl.Dialogs, Vcl.StdCtrls, SynEdit, Vcl.ExtCtrls;

type
  TStringDataDialog = class(TForm)
    Panel1: TPanel;
    OKButton: TButton;
    CancelButton: TButton;
    Separator1Panel: TPanel;
    Panel2: TPanel;
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
  Common, Vcl.Themes, StyleHooks;

const
  CAPTION_TEXT = 'Edit Field: %s';

var
  FStringDataDialog: TStringDataDialog;

function StringDataDialog: TStringDataDialog;
begin
  if FStringDataDialog = nil then
    Application.CreateForm(TStringDataDialog, FStringDataDialog);
  Result := FStringDataDialog;
  Common.SetStyledFormSize(Result, 568, 264);
end;

procedure TStringDataDialog.FormDestroy(Sender: TObject);
begin
  FStringDataDialog := nil;
end;

function TStringDataDialog.Open(FieldName: string; StringData: WideString): Boolean;
var
  Rslt: Integer;
begin
  UpdateGutter(StringDataEdit);
  Caption := Format(CAPTION_TEXT, [FieldName]);
  StringDataEdit.Text := StringData;

  Rslt := ShowModal;

  Result := Rslt = mrOk;
end;

function TStringDataDialog.GetStringData: WideString;
begin
  Result := StringDataEdit.Text;
end;

initialization

  TStyleManager.Engine.RegisterStyleHook(TCustomSynEdit, TSynEditStyleHook);

end.
