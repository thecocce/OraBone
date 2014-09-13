unit OptionsOutputTabs;

interface

uses
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, BCControls.CheckBox, Vcl.ExtCtrls,
  BCCommon.OptionsContainer, BCFrames.OptionsFrame, JvExStdCtrls, JvCheckBox;

type
  TOptionsOutputTabsFrame = class(TOptionsFrame)
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
    destructor Destroy; override;
    procedure GetData; override;
    procedure PutData; override;
  end;

function OptionsOutputTabsFrame(AOwner: TComponent): TOptionsOutputTabsFrame;

implementation

{$R *.dfm}

var
  FOptionsOutputTabsFrame: TOptionsOutputTabsFrame;

function OptionsOutputTabsFrame(AOwner: TComponent): TOptionsOutputTabsFrame;
begin
  if not Assigned(FOptionsOutputTabsFrame) then
    FOptionsOutputTabsFrame := TOptionsOutputTabsFrame.Create(AOwner);
  Result := FOptionsOutputTabsFrame;
end;

destructor TOptionsOutputTabsFrame.Destroy;
begin
  inherited;
  FOptionsOutputTabsFrame := nil;
end;

procedure TOptionsOutputTabsFrame.PutData;
begin
  OptionsContainer.OutputCloseTabByDblClick := CloseTabByDblClickCheckBox.Checked;
  OptionsContainer.OutputCloseTabByMiddleClick := CloseTabByMiddleClickCheckBox.Checked;
  OptionsContainer.OutputMultiLine := MultiLineCheckBox.Checked;
  OptionsContainer.OutputDoubleBuffered := DoubleBufferedCheckBox.Checked;
  OptionsContainer.OutputShowCloseButton := ShowCloseButtonCheckBox.Checked;
  OptionsContainer.OutputShowImage := ShowImageCheckBox.Checked;
  OptionsContainer.OutputRightClickSelect := RightClickSelectCheckBox.Checked;
end;

procedure TOptionsOutputTabsFrame.GetData;
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
