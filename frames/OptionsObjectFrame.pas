unit OptionsObjectFrame;

interface

uses
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, BCControls.ComboBox, Vcl.ExtCtrls,
  BCControls.CheckBox, BCCommon.OptionsContainer, BCFrames.OptionsFrame, JvExStdCtrls, JvCheckBox;

type
  TOptionsObjectFrameFrame = class(TOptionsFrame)
    Panel: TPanel;
    ButtonPanelAlignLabel: TLabel;
    ButtonPanelAlignComboBox: TBCComboBox;
    ShowCreationAndModificationTimestampCheckBox: TBCCheckBox;
    ShowDataSearchPanelCheckBox: TBCCheckBox;
    FilterOnTypingCheckBox: TBCCheckBox;
  private
    { Private declarations }
  public
    { Public declarations }
    destructor Destroy; override;
    procedure GetData; override;
    procedure PutData; override;
  end;

function OptionsObjectFrameFrame(AOwner: TComponent): TOptionsObjectFrameFrame;

implementation

{$R *.dfm}

var
  FOptionsObjectFrameFrame: TOptionsObjectFrameFrame;

function OptionsObjectFrameFrame(AOwner: TComponent): TOptionsObjectFrameFrame;
begin
  if not Assigned(FOptionsObjectFrameFrame) then
    FOptionsObjectFrameFrame := TOptionsObjectFrameFrame.Create(AOwner);
  Result := FOptionsObjectFrameFrame;
end;

destructor TOptionsObjectFrameFrame.Destroy;
begin
  inherited;
  FOptionsObjectFrameFrame := nil;
end;

procedure TOptionsObjectFrameFrame.PutData;
begin
  OptionsContainer.ObjectFrameAlign := ButtonPanelAlignComboBox.Text;
  OptionsContainer.ShowObjectCreationAndModificationTimestamp := ShowCreationAndModificationTimestampCheckBox.Checked;
  OptionsContainer.ShowDataSearchPanel := ShowDataSearchPanelCheckBox.Checked;
  OptionsContainer.FilterOnTyping := FilterOnTypingCheckBox.Checked;
end;

procedure TOptionsObjectFrameFrame.GetData;
begin
  ButtonPanelAlignComboBox.Text := OptionsContainer.ObjectFrameAlign;
  ShowCreationAndModificationTimestampCheckBox.Checked := OptionsContainer.ShowObjectCreationAndModificationTimestamp;
  ShowDataSearchPanelCheckBox.Checked := OptionsContainer.ShowDataSearchPanel;
  FilterOnTypingCheckBox.Checked := OptionsContainer.FilterOnTyping;
end;

end.
