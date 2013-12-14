unit OptionsObjectFrame;

interface

uses
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, BCControls.ComboBox, Vcl.ExtCtrls,
  BCControls.CheckBox, BCCommon.OptionsContainer;

type
  TObjectFrameFrame = class(TFrame)
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
    procedure GetData(OptionsContainer: TOptionsContainer);
    procedure PutData(OptionsContainer: TOptionsContainer);
  end;

implementation

{$R *.dfm}

procedure TObjectFrameFrame.PutData(OptionsContainer: TOptionsContainer);
begin
  OptionsContainer.ObjectFrameAlign := ButtonPanelAlignComboBox.Text;
  OptionsContainer.ShowObjectCreationAndModificationTimestamp := ShowCreationAndModificationTimestampCheckBox.Checked;
  OptionsContainer.ShowDataSearchPanel := ShowDataSearchPanelCheckBox.Checked;
  OptionsContainer.FilterOnTyping := FilterOnTypingCheckBox.Checked;
end;

procedure TObjectFrameFrame.GetData(OptionsContainer: TOptionsContainer);
begin
  ButtonPanelAlignComboBox.Text := OptionsContainer.ObjectFrameAlign;
  ShowCreationAndModificationTimestampCheckBox.Checked := OptionsContainer.ShowObjectCreationAndModificationTimestamp;
  ShowDataSearchPanelCheckBox.Checked := OptionsContainer.ShowDataSearchPanel;
  FilterOnTypingCheckBox.Checked := OptionsContainer.FilterOnTyping;
end;

end.
