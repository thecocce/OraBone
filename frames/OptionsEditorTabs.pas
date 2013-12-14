unit OptionsEditorTabs;

interface

uses
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, BCControls.CheckBox,
  BCCommon.OptionsContainer;

type
  TEditorTabsFrame = class(TFrame)
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
    procedure PutData(OptionsContainer: TOptionsContainer);
  end;

implementation

{$R *.dfm}

procedure TEditorTabsFrame.PutData(OptionsContainer: TOptionsContainer);
begin
  OptionsContainer.EditorCloseTabByDblClick := CloseTabByDblClickCheckBox.Checked;
  OptionsContainer.EditorCloseTabByMiddleClick := CloseTabByMiddleClickCheckBox.Checked;
  OptionsContainer.EditorMultiLine := MultiLineCheckBox.Checked;
  OptionsContainer.EditorDoubleBuffered := DoubleBufferedCheckBox.Checked;
  OptionsContainer.EditorShowCloseButton := ShowCloseButtonCheckBox.Checked;
  OptionsContainer.EditorShowImage := ShowImageCheckBox.Checked;
  OptionsContainer.EditorRightClickSelect := RightClickSelectCheckBox.Checked;
end;

end.
