unit OptionsSchemaBrowser;

interface

uses
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, BCControls.ComboBox, Vcl.ExtCtrls,
  BCControls.Edit, BCControls.CheckBox;

type
  TOptionsSchemaBrowserFrame = class(TFrame)
    Panel: TPanel;
    ButtonPanelAlignLabel: TLabel;
    ButtonPanelAlignComboBox: TBCComboBox;
    ShowTreeLinesCheckBox: TBCCheckBox;
    IndentLabel: TLabel;
    IndentEdit: TBCEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

end.
