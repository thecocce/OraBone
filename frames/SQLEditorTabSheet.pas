unit SQLEditorTabSheet;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, SynEdit, BCOraSynEdit;

type
  TSQLEditorTabSheetFrame = class(TFrame)
    Panel: TPanel;
    OraSynEdit: TBCOraSynEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

end.
