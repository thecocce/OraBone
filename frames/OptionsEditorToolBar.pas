unit OptionsEditorToolBar;

interface

uses
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, BCControls.CheckBox,
  BCCommon.OptionsContainer, BCFrames.OptionsFrame;

type
  TOptionsEditorToolbarFrame = class(TOptionsFrame)
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
    destructor Destroy; override;
    procedure GetData; override;
    procedure PutData; override;
  end;

function OptionsEditorToolbarFrame(AOwner: TComponent): TOptionsEditorToolbarFrame;

implementation

{$R *.dfm}

var
  FOptionsEditorToolbarFrame: TOptionsEditorToolbarFrame;

function OptionsEditorToolbarFrame(AOwner: TComponent): TOptionsEditorToolbarFrame;
begin
  if not Assigned(FOptionsEditorToolbarFrame) then
    FOptionsEditorToolbarFrame := TOptionsEditorToolbarFrame.Create(AOwner);
  Result := FOptionsEditorToolbarFrame;
end;

destructor TOptionsEditorToolbarFrame.Destroy;
begin
  inherited;
  FOptionsEditorToolbarFrame := nil;
end;

procedure TOptionsEditorToolbarFrame.PutData;
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

procedure TOptionsEditorToolbarFrame.GetData;
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
