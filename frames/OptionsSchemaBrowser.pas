unit OptionsSchemaBrowser;

interface

uses
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, BCControls.ComboBox, Vcl.ExtCtrls,
  BCControls.Edit, BCControls.CheckBox, BCCommon.OptionsContainer;

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
    procedure GetData(OptionsContainer: TOptionsContainer);
    procedure PutData(OptionsContainer: TOptionsContainer);
  end;

implementation

{$R *.dfm}

uses
  System.SysUtils;

procedure TOptionsSchemaBrowserFrame.PutData(OptionsContainer: TOptionsContainer);
begin
  OptionsContainer.SchemaBrowserAlign := ButtonPanelAlignComboBox.Text;
  OptionsContainer.SchemaBrowserShowTreeLines := ShowTreeLinesCheckBox.Checked;
  OptionsContainer.SchemaBrowserIndent := StrToIntDef(IndentEdit.Text, 16);
end;

procedure TOptionsSchemaBrowserFrame.GetData(OptionsContainer: TOptionsContainer);
begin
  ButtonPanelAlignComboBox.Text := OptionsContainer.SchemaBrowserAlign;
  ShowTreeLinesCheckBox.Checked := OptionsContainer.SchemaBrowserShowTreeLines;
  IndentEdit.Text := IntToStr(OptionsContainer.SchemaBrowserIndent);
end;

end.
