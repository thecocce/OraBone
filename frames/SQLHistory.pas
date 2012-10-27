unit SQLHistory;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, JvExGrids, BCStringGrid, Vcl.ComCtrls,
  Vcl.ToolWin, JvExComCtrls, JvToolBar, Vcl.ImgList, Vcl.ActnList, JvStringGrid, BCImageList,
  BCToolBar, Vcl.ExtCtrls;

type
  TSQLHistoryFrame = class(TFrame)
    ActionList: TActionList;
    SQLEditorAction: TAction;
    ImageList: TBCImageList;
    CleanUpAction: TAction;
    RefreshAction: TAction;
    ButtonPanel: TPanel;
    ToolBar: TBCToolBar;
    ToolButton1: TToolButton;
    GridPanel: TPanel;
    SQLHistoryStringGrid: TBCStringGrid;
    ToolBar2: TBCToolBar;
    ToolButton6: TToolButton;
    ToolBar3: TBCToolBar;
    ToolButton7: TToolButton;
    Bevel1: TBevel;
    Bevel2: TBevel;
    EditHistoryAction: TAction;
    ToolButton2: TToolButton;
    procedure SQLEditorActionExecute(Sender: TObject);
    procedure CleanUpActionExecute(Sender: TObject);
    procedure RefreshActionExecute(Sender: TObject);
    procedure EditHistoryActionExecute(Sender: TObject);
  private
    { Private declarations }
    procedure ReadSQLHistoryFile;
    procedure SetFields;
  public
    { Public declarations }
    procedure DoInit;
    procedure AssignPreferences;
  end;

implementation

{$R *.dfm}

uses
  Main, Lib, Preferences, Common, HistoryEdit;

const
  GRID_COLUMN_DATETIME = 0;
  GRID_COLUMN_SCHEMA = 1;
  GRID_COLUMN_SQL_STATEMENT = 2;
  GRID_COLUMN_SQL = 3;

procedure TSQLHistoryFrame.SQLEditorActionExecute(Sender: TObject);
begin
  if SQLEditorAction.Enabled then
    MainForm.LoadSQLIntoEditor(SQLHistoryStringGrid.Cells[GRID_COLUMN_SCHEMA, SQLHistoryStringGrid.Row],
      SQLHistoryStringGrid.Cells[GRID_COLUMN_SQL, SQLHistoryStringGrid.Row]);
end;

procedure TSQLHistoryFrame.AssignPreferences;
begin
  if OptionsContainer.ObjectFrameAlign = 'Bottom' then
    ToolBar.Align := alBottom
  else
    ToolBar.Align := alTop;
end;

procedure TSQLHistoryFrame.CleanUpActionExecute(Sender: TObject);
begin
  if CleanUpAction.Enabled then
  begin
    System.SysUtils.DeleteFile(Lib.GetHistoryFile);
    DoInit;
  end;
end;

procedure TSQLHistoryFrame.DoInit;
begin
  SQLHistoryStringGrid.HideCol(GRID_COLUMN_SQL);
  ReadSQLHistoryFile;
  SetFields;
  Common.AutoSizeCol(SQLHistoryStringGrid);
end;

procedure TSQLHistoryFrame.EditHistoryActionExecute(Sender: TObject);
begin
  with HistoryEditDialog do
  try
    HistoryDate := SQLHistoryStringGrid.Cells[GRID_COLUMN_DATETIME, SQLHistoryStringGrid.Row];
    Schema := SQLHistoryStringGrid.Cells[GRID_COLUMN_SCHEMA, SQLHistoryStringGrid.Row];
    SQLStatement := SQLHistoryStringGrid.Cells[GRID_COLUMN_SQL, SQLHistoryStringGrid.Row];
    if Open then
    begin
      SQLHistoryStringGrid.Cells[GRID_COLUMN_DATETIME, SQLHistoryStringGrid.Row] := HistoryDate;
      SQLHistoryStringGrid.Cells[GRID_COLUMN_SCHEMA, SQLHistoryStringGrid.Row] := Schema;
      SQLHistoryStringGrid.Cells[GRID_COLUMN_SQL, SQLHistoryStringGrid.Row] := SQLStatement;
      SQLHistoryStringGrid.Cells[GRID_COLUMN_SQL_STATEMENT, SQLHistoryStringGrid.Row] :=
        Copy(SQLHistoryStringGrid.Cells[GRID_COLUMN_SQL, SQLHistoryStringGrid.Row], 0, 200);

      if Length(SQLHistoryStringGrid.Cells[GRID_COLUMN_SQL, SQLHistoryStringGrid.Row]) > 200 then
        SQLHistoryStringGrid.Cells[GRID_COLUMN_SQL_STATEMENT, SQLHistoryStringGrid.Row] :=
          SQLHistoryStringGrid.Cells[GRID_COLUMN_SQL_STATEMENT, SQLHistoryStringGrid.Row] + '...';
    end;
  finally
    Release;
  end;
end;

procedure TSQLHistoryFrame.ReadSQLHistoryFile;
var
  i: Integer;
  s: string;
  History: TStringList;
begin
  SQLHistoryStringGrid.Clear;
  Application.ProcessMessages;
  SQLHistoryStringGrid.RowCount := 2;
  if FileExists(GetHistoryFile) then
  begin
    History := TStringList.Create;
    History.LoadFromFile(GetHistoryFile);
    for i := 0 to History.Count - 1 do
    begin
      //Application.ProcessMessages;
      History.Strings[i] := Common.DecryptString(History.Strings[i]);
    end;
    try
      i := 0;
      while i < History.Count do
      begin
        //Application.ProcessMessages;
        //s := Common.DecryptString(History.Strings[i], CRYPT_KEY);
        s := History.Strings[i];
        SQLHistoryStringGrid.Cells[GRID_COLUMN_DATETIME, SQLHistoryStringGrid.RowCount - 1] :=
          Copy(s, 0, Pos(';', s) - 1);
        s := Copy(s, Pos(';', s) + 1, Length(s));
        SQLHistoryStringGrid.Cells[GRID_COLUMN_SCHEMA, SQLHistoryStringGrid.RowCount - 1] :=
          Lib.FormatSchema(Copy(s, 0, Pos(';', s) - 1));
        s := Copy(s, Pos(';', s) + 1, Length(s));
        while Pos('#!SQLEND!#', s) = 0 do
        begin
          SQLHistoryStringGrid.Cells[GRID_COLUMN_SQL, SQLHistoryStringGrid.RowCount - 1] :=
             SQLHistoryStringGrid.Cells[GRID_COLUMN_SQL, SQLHistoryStringGrid.RowCount - 1] + s + ' ';
          Inc(i);
          s := History.Strings[i]; //Common.DecryptString(History.Strings[i], CRYPT_KEY);
        end;
        SQLHistoryStringGrid.Cells[GRID_COLUMN_SQL, SQLHistoryStringGrid.RowCount - 1] :=
          SQLHistoryStringGrid.Cells[GRID_COLUMN_SQL, SQLHistoryStringGrid.RowCount - 1] +
          Copy(s, 0, Pos('#!SQLEND!#', s) - 1);
        SQLHistoryStringGrid.Cells[GRID_COLUMN_SQL_STATEMENT, SQLHistoryStringGrid.RowCount - 1] :=
          Copy(SQLHistoryStringGrid.Cells[GRID_COLUMN_SQL, SQLHistoryStringGrid.RowCount - 1], 0, 200);

        if Length(SQLHistoryStringGrid.Cells[GRID_COLUMN_SQL, SQLHistoryStringGrid.RowCount - 1]) > 200 then
          SQLHistoryStringGrid.Cells[GRID_COLUMN_SQL_STATEMENT, SQLHistoryStringGrid.RowCount - 1] :=
            SQLHistoryStringGrid.Cells[GRID_COLUMN_SQL_STATEMENT, SQLHistoryStringGrid.RowCount - 1] + '...';
        Inc(i);
        if i < History.Count then
          SQLHistoryStringGrid.RowCount := SQLHistoryStringGrid.RowCount + 1;
      end;
    finally
      History.Free;
    end;
  end;
end;

procedure TSQLHistoryFrame.RefreshActionExecute(Sender: TObject);
begin
  DoInit;
end;

procedure TSQLHistoryFrame.SetFields;
var
  ItemsFound: Boolean;
begin
  SQLHistoryStringGrid.Cells[GRID_COLUMN_DATETIME, 0] := 'Date';
  SQLHistoryStringGrid.Cells[GRID_COLUMN_SCHEMA, 0] := 'Schema';
  SQLHistoryStringGrid.Cells[GRID_COLUMN_SQL_STATEMENT, 0] := 'SQL Statement';
  ItemsFound := (SQLHistoryStringGrid.RowCount > 1) and (SQLHistoryStringGrid.Cells[GRID_COLUMN_SQL, 1] <> '');
  SQLEditorAction.Enabled := ItemsFound;
  CleanUpAction.Enabled := ItemsFound;
end;

end.
