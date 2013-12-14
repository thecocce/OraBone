unit OptionsEditorTabs;

interface

uses
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, BCControls.CheckBox,
  BCCommon.OptionsContainer;

type
  TOptionsEditorTabsFrame = class(TFrame)
    Panel: TPanel;
    CloseTabByDblClickCheckBox: TBCCheckBox;
    CloseTabByMiddleClickCheckBox: TBCCheckBox;
    DoubleBufferedCheckBox: TBCCheckBox;
    MultilineCheckBox: TBCCheckBox;
    ShowCloseButtonCheckBox: TBCCheckBox;
    ShowImageCheckBox: TBCCheckBox;
    RightClickSelectCheckBox: TBCCheckBox;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure GetData(OptionsContainer: TOraBoneOptionsContainer);
    procedure PutData(OptionsContainer: TOraBoneOptionsContainer);
  end;

implementation

{$R *.dfm}

procedure TOptionsEditorTabsFrame.PutData(OptionsContainer: TOraBoneOptionsContainer);
begin
  OptionsContainer.EditorCloseTabByDblClick := CloseTabByDblClickCheckBox.Checked;
  OptionsContainer.EditorCloseTabByMiddleClick := CloseTabByMiddleClickCheckBox.Checked;
  OptionsContainer.EditorMultiLine := MultiLineCheckBox.Checked;
  OptionsContainer.EditorDoubleBuffered := DoubleBufferedCheckBox.Checked;
  OptionsContainer.EditorShowCloseButton := ShowCloseButtonCheckBox.Checked;
  OptionsContainer.EditorShowImage := ShowImageCheckBox.Checked;
  OptionsContainer.EditorRightClickSelect := RightClickSelectCheckBox.Checked;
end;

procedure TOptionsEditorTabsFrame.GetData(OptionsContainer: TOraBoneOptionsContainer);
begin
  CloseTabByDblClickCheckBox.Checked := OptionsContainer.EditorCloseTabByDblClick;
  CloseTabByMiddleClickCheckBox.Checked := OptionsContainer.EditorCloseTabByMiddleClick;
  MultiLineCheckBox.Checked := OptionsContainer.EditorMultiLine;
  DoubleBufferedCheckBox.Checked := OptionsContainer.EditorDoubleBuffered;
  ShowCloseButtonCheckBox.Checked := OptionsContainer.EditorShowCloseButton;
  ShowImageCheckBox.Checked := OptionsContainer.EditorShowImage;
  RightClickSelectCheckBox.Checked := OptionsContainer.EditorRightClickSelect;
end;

end.
