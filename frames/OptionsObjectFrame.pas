unit OptionsObjectFrame;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, JvExStdCtrls,
  BCControls.ComboBox, Vcl.ExtCtrls, BCControls.CheckBox;

type
  TObjectFrameFrame = class(TFrame)
    Panel: TPanel;
    ButtonPanelAlignLabel: TLabel;
    ButtonPanelAlignComboBox: TBCComboBox;
    ShowCreationAndModificationTimestampCheckBox: TBCCheckBox;
    ShowDataSearchPanelCheckBox: TBCCheckBox;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

end.
