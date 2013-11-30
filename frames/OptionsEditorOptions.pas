unit OptionsEditorOptions;

interface

uses
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, BCControls.ComboBox,
  BCControls.CheckBox, BCControls.Edit, Vcl.ComCtrls;

type
  TEditorOptionsFrame = class(TFrame)
    Panel: TPanel;
    LineSpacingLabel: TLabel;
    TabWidthLabel: TLabel;
    ActiveLineColorBrightnessLabel: TLabel;
    InsertCaretLabel: TLabel;
    NonblinkingCaretColorLabel: TLabel;
    AutoIndentCheckBox: TBCCheckBox;
    TrimTrailingSpacesCheckBox: TBCCheckBox;
    ScrollPastEofCheckBox: TBCCheckBox;
    ScrollPastEolCheckBox: TBCCheckBox;
    LineSpacingEdit: TBCEdit;
    TabWidthEdit: TBCEdit;
    BrightnessTrackBar: TTrackBar;
    TabsToSpacesCheckBox: TBCCheckBox;
    AutoSaveCheckBox: TBCCheckBox;
    InsertCaretComboBox: TBCComboBox;
    UndoAfterSaveCheckBox: TBCCheckBox;
    SmartTabsCheckBox: TBCCheckBox;
    SmartTabDeleteCheckBox: TBCCheckBox;
    TripleClickRowSelectCheckBox: TBCCheckBox;
    NonblinkingCaretCheckBox: TBCCheckBox;
    NonblinkingCaretColorBox: TColorBox;
  private
    { Private declarations }
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
  end;

implementation

{$R *.dfm}

uses
  BCCommon.LanguageStrings;

constructor TEditorOptionsFrame.Create(AOwner: TComponent);
begin
  inherited;
  with InsertCaretComboBox.Items do
  begin
    Add(LanguageDatamodule.GetConstant('VerticalLine'));
    Add(LanguageDatamodule.GetConstant('HorizontalLine'));
    Add(LanguageDatamodule.GetConstant('HalfBlock'));
    Add(LanguageDatamodule.GetConstant('Block'));
  end;
end;

end.
