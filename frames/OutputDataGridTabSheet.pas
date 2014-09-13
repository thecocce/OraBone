unit OutputDataGridTabSheet;

interface

uses
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BCControls.DBGrid, Data.DB, DBAccess, Ora,
  Vcl.StdCtrls, Vcl.ExtCtrls, DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, GridsEh, DBAxisGridsEh, DBGridEh,
  DynVarsEh, System.Types;

type
  TOutputDataGridFrame = class(TFrame)
    StatisticsPanel: TPanel;
    GridPanel: TPanel;
    StatsTimeLabel: TLabel;
    StatsRowsLabel: TLabel;
    GridDataSource: TOraDataSource;
    Grid: TBCDBGrid;
    procedure GridAdvDrawDataCell(Sender: TCustomDBGridEh; Cell, AreaCell: TGridCoord; Column: TColumnEh;
      const ARect: TRect; var Params: TColCellParamsEh; var Processed: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

uses
  Lib;

procedure TOutputDataGridFrame.GridAdvDrawDataCell(Sender: TCustomDBGridEh; Cell, AreaCell: TGridCoord;
  Column: TColumnEh; const ARect: TRect; var Params: TColCellParamsEh; var Processed: Boolean);
begin
  GridDrawStringDataCell(Column, Params);
end;

end.
