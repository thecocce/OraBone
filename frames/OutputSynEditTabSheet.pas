unit OutputSynEditTabSheet;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, SynEditHighlighter,
  SynHighlighterSQL, SynEdit, BCSynEdit;

type
  TOutputSynEditFrame = class(TFrame)
    Panel: TPanel;
    SynEdit: TBCSynEdit;
    SynSQLSyn: TSynSQLSyn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

end.
