unit OptionsConnectionTabs;

interface

uses
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, BCControls.CheckBox, Vcl.ExtCtrls,
  BCCommon.OptionsContainer;

type
  TConnectionTabsFrame = class(TFrame)
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

procedure TConnectionTabsFrame.PutData(OptionsContainer: TOptionsContainer);
begin
  OptionsContainer.ConnectionCloseTabByDblClick := CloseTabByDblClickCheckBox.Checked;
  OptionsContainer.ConnectionCloseTabByMiddleClick := CloseTabByMiddleClickCheckBox.Checked;
  OptionsContainer.ConnectionMultiLine := MultiLineCheckBox.Checked;
  OptionsContainer.ConnectionDoubleBuffered := DoubleBufferedCheckBox.Checked;
  OptionsContainer.ConnectionShowCloseButton := ShowCloseButtonCheckBox.Checked;
  OptionsContainer.ConnectionShowImage := ShowImageCheckBox.Checked;
  OptionsContainer.ConnectionRightClickSelect := RightClickSelectCheckBox.Checked;
end;

end.
