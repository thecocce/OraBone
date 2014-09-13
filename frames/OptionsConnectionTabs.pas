unit OptionsConnectionTabs;

interface

uses
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, BCControls.CheckBox, Vcl.ExtCtrls,
  BCCommon.OptionsContainer, BCFrames.OptionsFrame, JvExStdCtrls, JvCheckBox;

type
  TOptionsConnectionTabsFrame = class(TOptionsFrame)
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

function OptionsConnectionTabsFrame(AOwner: TComponent): TOptionsConnectionTabsFrame;

implementation

{$R *.dfm}

var
  FOptionsConnectionTabsFrame: TOptionsConnectionTabsFrame;

function OptionsConnectionTabsFrame(AOwner: TComponent): TOptionsConnectionTabsFrame;
begin
  if not Assigned(FOptionsConnectionTabsFrame) then
    FOptionsConnectionTabsFrame := TOptionsConnectionTabsFrame.Create(AOwner);
  Result := FOptionsConnectionTabsFrame;
end;

destructor TOptionsConnectionTabsFrame.Destroy;
begin
  inherited;
  FOptionsConnectionTabsFrame := nil;
end;

procedure TOptionsConnectionTabsFrame.PutData;
begin
  OptionsContainer.ConnectionCloseTabByDblClick := CloseTabByDblClickCheckBox.Checked;
  OptionsContainer.ConnectionCloseTabByMiddleClick := CloseTabByMiddleClickCheckBox.Checked;
  OptionsContainer.ConnectionMultiLine := MultiLineCheckBox.Checked;
  OptionsContainer.ConnectionDoubleBuffered := DoubleBufferedCheckBox.Checked;
  OptionsContainer.ConnectionShowCloseButton := ShowCloseButtonCheckBox.Checked;
  OptionsContainer.ConnectionShowImage := ShowImageCheckBox.Checked;
  OptionsContainer.ConnectionRightClickSelect := RightClickSelectCheckBox.Checked;
end;

procedure TOptionsConnectionTabsFrame.GetData;
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
