unit OptionsSchemaBrowser;

interface

uses
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, BCControls.ComboBox, Vcl.ExtCtrls,
  BCControls.Edit, BCControls.CheckBox, BCCommon.OptionsContainer, BCFrames.OptionsFrame, JvExStdCtrls, JvCheckBox;

type
  TOptionsSchemaBrowserFrame = class(TOptionsFrame)
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
    destructor Destroy; override;
    procedure GetData; override;
    procedure PutData; override;
  end;

function OptionsSchemaBrowserFrame(AOwner: TComponent): TOptionsSchemaBrowserFrame;

implementation

{$R *.dfm}

uses
  System.SysUtils;

var
  FOptionsSchemaBrowserFrame: TOptionsSchemaBrowserFrame;

function OptionsSchemaBrowserFrame(AOwner: TComponent): TOptionsSchemaBrowserFrame;
begin
  if not Assigned(FOptionsSchemaBrowserFrame) then
    FOptionsSchemaBrowserFrame := TOptionsSchemaBrowserFrame.Create(AOwner);
  Result := FOptionsSchemaBrowserFrame;
end;

destructor TOptionsSchemaBrowserFrame.Destroy;
begin
  inherited;
  FOptionsSchemaBrowserFrame := nil;
end;

procedure TOptionsSchemaBrowserFrame.PutData;
begin
  OptionsContainer.SchemaBrowserAlign := ButtonPanelAlignComboBox.Text;
  OptionsContainer.SchemaBrowserShowTreeLines := ShowTreeLinesCheckBox.Checked;
  OptionsContainer.SchemaBrowserIndent := StrToIntDef(IndentEdit.Text, 16);
end;

procedure TOptionsSchemaBrowserFrame.GetData;
begin
  ButtonPanelAlignComboBox.Text := OptionsContainer.SchemaBrowserAlign;
  ShowTreeLinesCheckBox.Checked := OptionsContainer.SchemaBrowserShowTreeLines;
  IndentEdit.Text := IntToStr(OptionsContainer.SchemaBrowserIndent);
end;

end.
