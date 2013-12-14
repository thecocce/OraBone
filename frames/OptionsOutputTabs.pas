unit OptionsOutputTabs;

interface

uses
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, BCControls.CheckBox, Vcl.ExtCtrls,
  BCCommon.OptionsContainer;

type
  TOutputTabsFrame = class(TFrame)
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
    procedure GetData(OptionsContainer: TOptionsContainer);
    procedure PutData(OptionsContainer: TOptionsContainer);
  end;

implementation

{$R *.dfm}

procedure TOutputTabsFrame.PutData(OptionsContainer: TOptionsContainer);
begin
  OptionsContainer.OutputCloseTabByDblClick := CloseTabByDblClickCheckBox.Checked;
  OptionsContainer.OutputCloseTabByMiddleClick := CloseTabByMiddleClickCheckBox.Checked;
  OptionsContainer.OutputMultiLine := MultiLineCheckBox.Checked;
  OptionsContainer.OutputDoubleBuffered := DoubleBufferedCheckBox.Checked;
  OptionsContainer.OutputShowCloseButton := ShowCloseButtonCheckBox.Checked;
  OptionsContainer.OutputShowImage := ShowImageCheckBox.Checked;
  OptionsContainer.OutputRightClickSelect := RightClickSelectCheckBox.Checked;
end;

procedure TOutputTabsFrame.GetData(OptionsContainer: TOptionsContainer);
begin
  CloseTabByDblClickCheckBox.Checked := OptionsContainer.OutputCloseTabByDblClick;
  CloseTabByMiddleClickCheckBox.Checked := OptionsContainer.OutputCloseTabByMiddleClick;
  MultiLineCheckBox.Checked := OptionsContainer.OutputMultiLine;
  DoubleBufferedCheckBox.Checked := OptionsContainer.OutputDoubleBuffered;
  ShowCloseButtonCheckBox.Checked := OptionsContainer.OutputShowCloseButton;
  ShowImageCheckBox.Checked := OptionsContainer.OutputShowImage;
  RightClickSelectCheckBox.Checked := OptionsContainer.OutputRightClickSelect;
end;

end.
