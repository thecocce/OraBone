unit OptionsEditorToolBar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, BCControls.BCCheckBox;

type
  TEditorToolBarFrame = class(TFrame)
    Panel: TPanel;
    StandardCheckBox: TBCCheckBox;
    PrintCheckBox: TBCCheckBox;
    ExecuteCheckBox: TBCCheckBox;
    IndentCheckBox: TBCCheckBox;
    SortCheckBox: TBCCheckBox;
    CaseCheckBox: TBCCheckBox;
    DBMSCheckBox: TBCCheckBox;
    TransactionCheckBox: TBCCheckBox;
    ToolsCheckBox: TBCCheckBox;
    ModeCheckBox: TBCCheckBox;
    SearchCheckBox: TBCCheckBox;
    CommandCheckBox: TBCCheckBox;
    ExplainPlanCheckBox: TBCCheckBox;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

end.
