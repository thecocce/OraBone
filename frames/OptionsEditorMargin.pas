unit OptionsEditorMargin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.ExtCtrls, Vcl.StdCtrls, BCControls.CheckBox,
  JvExStdCtrls, JvEdit, BCControls.Edit, Vcl.Buttons;

type
  TEditorMarginFrame = class(TFrame)
    Panel: TPanel;
    MarginVisibleCheckBox: TBCCheckBox;
    RightMarginLabel: TLabel;
    RightMarginEdit: TBCEdit;
    AutoSizeCheckBox: TBCCheckBox;
    WidthLabel: TLabel;
    WidthEdit: TBCEdit;
    VisibleRightMarginCheckBox: TBCCheckBox;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

end.
