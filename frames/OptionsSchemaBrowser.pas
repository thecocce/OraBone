unit OptionsSchemaBrowser;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, JvExStdCtrls, JvCombobox,
  BCComboBox, Vcl.ExtCtrls;

type
  TOptionsSchemaBrowserFrame = class(TFrame)
    Panel: TPanel;
    ButtonPanelAlignLabel: TLabel;
    ButtonPanelAlignComboBox: TBCComboBox;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

end.
