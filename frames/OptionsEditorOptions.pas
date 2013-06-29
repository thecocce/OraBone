unit OptionsEditorOptions;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, JvExStdCtrls,
  JvCombobox, BCControls.BCComboBox, BCControls.BCCheckBox, JvEdit, BCControls.BCEdit, Vcl.ComCtrls;

type
  TEditorOptionsFrame = class(TFrame)
    Panel: TPanel;
    AutoIndentCheckBox: TBCCheckBox;
    TrimTrailingSpacesCheckBox: TBCCheckBox;
    ScrollPastEofCheckBox: TBCCheckBox;
    ScrollPastEolCheckBox: TBCCheckBox;
    ExtraLinesLabel: TLabel;
    ExtraLinesEdit: TBCEdit;
    TabWidthLabel: TLabel;
    TabWidthEdit: TBCEdit;
    BrightnessTrackBar: TTrackBar;
    ActiveLineColorBrightnessLabel: TLabel;
    TabsToSpacesCheckBox: TBCCheckBox;
    AutoSaveCheckBox: TBCCheckBox;
    InsertCaretComboBox: TBCComboBox;
    InsertCaretLabel: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

end.
