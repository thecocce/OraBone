unit OutputDataGridTabSheet;

interface

uses
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BCControls.DBGrid, Data.DB, DBAccess, Ora,
  Vcl.StdCtrls, Vcl.ExtCtrls, DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, GridsEh, DBAxisGridsEh, DBGridEh;

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
