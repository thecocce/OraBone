unit OutputDataGridTabSheet;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, DBGridEhGrouping, GridsEh, DBGridEh, BCDBGrid,
  Data.DB, DBAccess, Ora, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TOutputDataGridFrame = class(TFrame)
    StatisticsPanel: TPanel;
    GridPanel: TPanel;
    StatsTimeLabel: TLabel;
    StatsRowsLabel: TLabel;
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
