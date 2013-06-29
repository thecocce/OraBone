unit OutputPlanGridTabSheet;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, DBGridEhGrouping, GridsEh, DBGridEh, BCControls.BCDBGrid,
  Data.DB, DBAccess, Ora, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TOutputPlanGridFrame = class(TFrame)
    GridPanel: TPanel;
    GridDataSource: TOraDataSource;
    Grid: TBCDBGrid;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

end.
