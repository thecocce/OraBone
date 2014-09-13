unit OptionsEditorTabs;

interface

uses
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, BCControls.CheckBox,
  BCCommon.OptionsContainer, BCFrames.OptionsFrame, JvExStdCtrls, JvCheckBox;

type
  TOptionsEditorTabsFrame = class(TOptionsFrame)
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

function OptionsEditorTabsFrame(AOwner: TComponent): TOptionsEditorTabsFrame;

implementation

{$R *.dfm}

var
  FOptionsEditorTabsFrame: TOptionsEditorTabsFrame;

function OptionsEditorTabsFrame(AOwner: TComponent): TOptionsEditorTabsFrame;
begin
  if not Assigned(FOptionsEditorTabsFrame) then
    FOptionsEditorTabsFrame := TOptionsEditorTabsFrame.Create(AOwner);
  Result := FOptionsEditorTabsFrame;
end;

destructor TOptionsEditorTabsFrame.Destroy;
begin
  inherited;
  FOptionsEditorTabsFrame := nil;
end;

procedure TOptionsEditorTabsFrame.PutData;
begin
  OptionsContainer.EditorCloseTabByDblClick := CloseTabByDblClickCheckBox.Checked;
  OptionsContainer.EditorCloseTabByMiddleClick := CloseTabByMiddleClickCheckBox.Checked;
  OptionsContainer.EditorMultiLine := MultiLineCheckBox.Checked;
  OptionsContainer.EditorDoubleBuffered := DoubleBufferedCheckBox.Checked;
  OptionsContainer.EditorShowCloseButton := ShowCloseButtonCheckBox.Checked;
  OptionsContainer.EditorShowImage := ShowImageCheckBox.Checked;
  OptionsContainer.EditorRightClickSelect := RightClickSelectCheckBox.Checked;
end;

procedure TOptionsEditorTabsFrame.GetData;
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
