unit ConfirmReplace;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TConfirmReplaceDialog = class(TForm)
    CancelButton: TButton;
    ConfirmationLabel: TLabel;
    Image: TImage;
    NoButton: TButton;
    YesButton: TButton;
    YesToAllButton: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  public
    procedure PrepareShow(AEditorRect: TRect; X, Y1, Y2: integer; AReplaceText: string);
  end;

function ConfirmReplaceDialog: TConfirmReplaceDialog;

implementation

{$R *.DFM}

resourcestring
  SAskReplaceText = 'Replace this occurence of "%s"?';

var
  FConfirmReplaceDialog: TConfirmReplaceDialog;

function ConfirmReplaceDialog: TConfirmReplaceDialog;
begin
  if FConfirmReplaceDialog = nil then
    Application.CreateForm(TConfirmReplaceDialog, FConfirmReplaceDialog);
  Result := FConfirmReplaceDialog;
end;

procedure TConfirmReplaceDialog.FormCreate(Sender: TObject);
begin
  Image.Picture.Icon.Handle := LoadIcon(0, IDI_QUESTION);
end;

procedure TConfirmReplaceDialog.FormDestroy(Sender: TObject);
begin
  FConfirmReplaceDialog := nil;
end;

procedure TConfirmReplaceDialog.PrepareShow(AEditorRect: TRect;
  X, Y1, Y2: integer; AReplaceText: string);
var
  nW, nH: integer;
begin
  ConfirmationLabel.Caption := Format(SAskReplaceText, [AReplaceText]);
  nW := AEditorRect.Right - AEditorRect.Left;
  nH := AEditorRect.Bottom - AEditorRect.Top;

  if nW <= Width then
    X := AEditorRect.Left - (Width - nW) div 2
  else
  begin
    if X + Width > AEditorRect.Right then
      X := AEditorRect.Right - Width;
  end;
  if Y2 > AEditorRect.Top + MulDiv(nH, 2, 3) then
    Y2 := Y1 - Height - 4
  else
    Inc(Y2, 4);
  SetBounds(X, Y2, Width, Height);
end;

end.

