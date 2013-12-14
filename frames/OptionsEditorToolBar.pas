unit OptionsEditorToolBar;

interface

uses
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, BCControls.CheckBox,
  BCCommon.OptionsContainer;

type
  TOptionsEditorToolBarFrame = class(TFrame)
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
    procedure GetData(OptionsContainer: TOraBoneOptionsContainer);
    procedure PutData(OptionsContainer: TOraBoneOptionsContainer);
  end;

implementation

{$R *.dfm}

procedure TOptionsEditorToolBarFrame.PutData(OptionsContainer: TOraBoneOptionsContainer);
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

procedure TOptionsEditorToolBarFrame.GetData(OptionsContainer: TOraBoneOptionsContainer);
begin
  ExecuteCheckBox.Checked := OptionsContainer.ToolBarExecute;
  TransactionCheckBox.Checked := OptionsContainer.ToolBarTransaction;
  DBMSCheckBox.Checked := OptionsContainer.ToolBarDBMS;
  ExplainPlanCheckBox.Checked := OptionsContainer.ToolBarExplainPlan;
  StandardCheckBox.Checked := OptionsContainer.ToolBarStandard;
  PrintCheckBox.Checked := OptionsContainer.ToolBarPrint;
  IndentCheckBox.Checked := OptionsContainer.ToolBarIndent;
  SortCheckBox.Checked := OptionsContainer.ToolBarSort;
  CaseCheckBox.Checked := OptionsContainer.ToolBarCase;
  CommandCheckBox.Checked := OptionsContainer.ToolBarCommand;
  SearchCheckBox.Checked := OptionsContainer.ToolBarSearch;
  ModeCheckBox.Checked := OptionsContainer.ToolBarMode;
  ToolsCheckBox.Checked := OptionsContainer.ToolBarTools;
end;

end.
