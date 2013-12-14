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
    procedure GetData(OptionsContainer: TOraBoneOptionsContainer);
    procedure PutData(OptionsContainer: TOraBoneOptionsContainer);
  end;

implementation

{$R *.dfm}

uses
  System.SysUtils;

procedure TOptionsSchemaBrowserFrame.PutData(OptionsContainer: TOraBoneOptionsContainer);
begin
  OptionsContainer.SchemaBrowserAlign := ButtonPanelAlignComboBox.Text;
  OptionsContainer.SchemaBrowserShowTreeLines := ShowTreeLinesCheckBox.Checked;
  OptionsContainer.SchemaBrowserIndent := StrToIntDef(IndentEdit.Text, 16);
end;

procedure TOptionsSchemaBrowserFrame.GetData(OptionsContainer: TOraBoneOptionsContainer);
begin
  ButtonPanelAlignComboBox.Text := OptionsContainer.SchemaBrowserAlign;
  ShowTreeLinesCheckBox.Checked := OptionsContainer.SchemaBrowserShowTreeLines;
  IndentEdit.Text := IntToStr(OptionsContainer.SchemaBrowserIndent);
end;

end.
