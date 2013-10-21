unit OutputSynEditTabSheet;

interface

uses
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, SynEditHighlighter,
  SynHighlighterSQL, SynEdit, BCControls.SynEdit;

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
