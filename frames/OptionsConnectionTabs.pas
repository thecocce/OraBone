unit OptionsConnectionTabs;

interface

uses
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, BCControls.CheckBox, Vcl.ExtCtrls,
  BCCommon.OptionsContainer;

type
  TOptionsConnectionTabsFrame = class(TFrame)
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

procedure TOptionsConnectionTabsFrame.PutData(OptionsContainer: TOraBoneOptionsContainer);
begin
  OptionsContainer.ConnectionCloseTabByDblClick := CloseTabByDblClickCheckBox.Checked;
  OptionsContainer.ConnectionCloseTabByMiddleClick := CloseTabByMiddleClickCheckBox.Checked;
  OptionsContainer.ConnectionMultiLine := MultiLineCheckBox.Checked;
  OptionsContainer.ConnectionDoubleBuffered := DoubleBufferedCheckBox.Checked;
  OptionsContainer.ConnectionShowCloseButton := ShowCloseButtonCheckBox.Checked;
  OptionsContainer.ConnectionShowImage := ShowImageCheckBox.Checked;
  OptionsContainer.ConnectionRightClickSelect := RightClickSelectCheckBox.Checked;
end;

procedure TOptionsConnectionTabsFrame.GetData(OptionsContainer: TOraBoneOptionsContainer);
begin
  CloseTabByDblClickCheckBox.Checked := OptionsContainer.ConnectionCloseTabByDblClick;
  CloseTabByMiddleClickCheckBox.Checked := OptionsContainer.ConnectionCloseTabByMiddleClick;
  MultiLineCheckBox.Checked := OptionsContainer.ConnectionMultiLine;
  DoubleBufferedCheckBox.Checked := OptionsContainer.ConnectionDoubleBuffered;
  ShowCloseButtonCheckBox.Checked := OptionsContainer.ConnectionShowCloseButton;
  ShowImageCheckBox.Checked := OptionsContainer.ConnectionShowImage;
  RightClickSelectCheckBox.Checked := OptionsContainer.ConnectionRightClickSelect;
end;

end.
