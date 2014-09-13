unit OutputPlanGridTabSheet;

interface

uses
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, GridsEh, DBGridEh, BCControls.DBGrid, Data.DB,
  DBAccess, Ora, Vcl.ExtCtrls, DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DBAxisGridsEh, DynVarsEh;

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
