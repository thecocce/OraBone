unit SQLEditorTabSheet;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, SynEdit, BCControls.OraSynEdit;

type
  TSQLEditorTabSheetFrame = class(TFrame)
    Panel: TPanel;
    OraSynEdit: TBCOraSynEdit;
  private
    { Private declarations }
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
  end;

implementation

{$R *.dfm}

uses
  BCCommon.StyleHooks;

constructor TSQLEditorTabSheetFrame.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Panel.Padding.Right := GetRightPadding;
end;

end.
