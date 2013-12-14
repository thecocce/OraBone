unit OptionsEditorToolBar;

interface

uses
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, BCControls.CheckBox,
  BCCommon.OptionsContainer;

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
    procedure PutData(OptionsContainer: TOptionsContainer);
  end;

implementation

{$R *.dfm}

procedure TEditorToolBarFrame.PutData(OptionsContainer: TOptionsContainer);
begin
  OptionsContainer.ToolBarExecute := ExecuteCheckBox.Checked;
  OptionsContainer.ToolBarTransaction := TransactionCheckBox.Checked;
  OptionsContainer.ToolBarDBMS := DBMSCheckBox.Checked;
  OptionsContainer.ToolBarExplainPlan := ExplainPlanCheckBox.Checked;
  OptionsContainer.ToolBarStandard := StandardCheckBox.Checked;
  OptionsContainer.ToolBarPrint := PrintCheckBox.Checked;
  OptionsContainer.ToolBarIndent := IndentCheckBox.Checked;
  OptionsContainer.ToolBarSort := SortCheckBox.Checked;
  OptionsContainer.ToolBarCase := CaseCheckBox.Checked;
  OptionsContainer.ToolBarCommand := CommandCheckBox.Checked;
  OptionsContainer.ToolBarSearch := SearchCheckBox.Checked;
  OptionsContainer.ToolBarMode := ModeCheckBox.Checked;
  OptionsContainer.ToolBarTools := ToolsCheckBox.Checked;
end;

end.
