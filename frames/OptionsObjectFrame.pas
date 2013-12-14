unit OptionsObjectFrame;

interface

uses
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, BCControls.ComboBox, Vcl.ExtCtrls,
  BCControls.CheckBox, BCCommon.OptionsContainer;

type
  TOptionsObjectFrameFrame = class(TFrame)
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
    procedure GetData(OptionsContainer: TOraBoneOptionsContainer);
    procedure PutData(OptionsContainer: TOraBoneOptionsContainer);
  end;

implementation

{$R *.dfm}

procedure TOptionsObjectFrameFrame.PutData(OptionsContainer: TOraBoneOptionsContainer);
begin
  OptionsContainer.ObjectFrameAlign := ButtonPanelAlignComboBox.Text;
  OptionsContainer.ShowObjectCreationAndModificationTimestamp := ShowCreationAndModificationTimestampCheckBox.Checked;
  OptionsContainer.ShowDataSearchPanel := ShowDataSearchPanelCheckBox.Checked;
  OptionsContainer.FilterOnTyping := FilterOnTypingCheckBox.Checked;
end;

procedure TOptionsObjectFrameFrame.GetData(OptionsContainer: TOraBoneOptionsContainer);
begin
  ButtonPanelAlignComboBox.Text := OptionsContainer.ObjectFrameAlign;
  ShowCreationAndModificationTimestampCheckBox.Checked := OptionsContainer.ShowObjectCreationAndModificationTimestamp;
  ShowDataSearchPanelCheckBox.Checked := OptionsContainer.ShowDataSearchPanel;
  FilterOnTypingCheckBox.Checked := OptionsContainer.FilterOnTyping;
end;

end.
