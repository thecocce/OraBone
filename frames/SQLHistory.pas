unit SQLHistory;

interface

uses
  System.SysUtils, System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, JvExGrids,
  BCControls.StringGrid, Vcl.ComCtrls, Vcl.ToolWin, Vcl.ImgList, Vcl.ActnList, JvStringGrid, BCControls.ImageList,
  BCControls.ToolBar, Vcl.ExtCtrls, System.Actions;

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
    procedure WriteSQLHistoryFile;
    procedure SetFields;
    function AllRowsSelected: Boolean;
    function RowsSelected: Boolean;
    procedure RemoveSelectedRows;
  public
    { Public declarations }
    procedure DoInit;
    procedure AssignOptions;
    procedure SelectAll;
  end;

implementation

{$R *.dfm}

uses
  Main, Lib, BCCommon.OptionsContainer, HistoryEdit, BCCommon.Messages, BCCommon.StringUtils, BCCommon.Lib;

const
  GRID_COLUMN_BOOLEAN = 0;
  GRID_COLUMN_DATETIME = 1;
  GRID_COLUMN_SCHEMA = 2;
  GRID_COLUMN_SQL_STATEMENT = 3;
  GRID_COLUMN_SQL = 4;

procedure TSQLHistoryFrame.SQLEditorActionExecute(Sender: TObject);
begin
  if SQLEditorAction.Enabled then
    MainForm.LoadSQLIntoEditor(SQLHistoryStringGrid.Cells[GRID_COLUMN_SCHEMA, SQLHistoryStringGrid.Row],
      SQLHistoryStringGrid.Cells[GRID_COLUMN_SQL, SQLHistoryStringGrid.Row]);
end;

procedure TSQLHistoryFrame.AssignOptions;
begin
  if OptionsContainer.ObjectFrameAlign = 'Bottom' then
    ToolBar.Align := alBottom
  else
    ToolBar.Align := alTop;
end;

function TSQLHistoryFrame.AllRowsSelected: Boolean;
var
  i: Integer;
begin
  Result := True;
  for i := 1 to SQLHistoryStringGrid.RowCount - 1 do
    if SQLHistoryStringGrid.Cells[GRID_COLUMN_BOOLEAN, i] = 'False' then
    begin
      Result := False;
      Break;
    end;
end;

function TSQLHistoryFrame.RowsSelected: Boolean;
var
  i: Integer;
begin
  Result := False;
  for i := 1 to SQLHistoryStringGrid.RowCount - 1 do
    if SQLHistoryStringGrid.Cells[GRID_COLUMN_BOOLEAN, i] = 'True' then
    begin
      Result := True;
      Break;
    end;
end;

procedure TSQLHistoryFrame.SelectAll;
var
  i: Integer;
begin
  for i := 1 to SQLHistoryStringGrid.RowCount - 1 do
    SQLHistoryStringGrid.Cells[GRID_COLUMN_BOOLEAN, i] := 'True';
end;

procedure TSQLHistoryFrame.RemoveSelectedRows;
var
  i: Integer;
begin
  i := 1;
  while i < SQLHistoryStringGrid.RowCount do
  begin
    if SQLHistoryStringGrid.Cells[GRID_COLUMN_BOOLEAN, i] = 'True' then
      SQLHistoryStringGrid.RemoveRow(i)
    else
      Inc(i);
  end;
end;

procedure TSQLHistoryFrame.CleanUpActionExecute(Sender: TObject);
begin
  if CleanUpAction.Enabled then
  begin
    if AllRowsSelected then
    begin
      if AskYesOrNo('Clean SQL history, are you sure?') then
      begin
        System.SysUtils.DeleteFile(Lib.GetHistoryFile);
        DoInit;
      end;
    end
    else
    if RowsSelected then
    begin
      if AskYesOrNo('Clean selected row(s) from SQL history, are you sure?') then
      begin
        RemoveSelectedRows;
        WriteSQLHistoryFile;
        DoInit;
      end;
    end
    else
      ShowMessage('Select rows to clean. Select all with Ctrl + A.');
  end;
end;

procedure TSQLHistoryFrame.DoInit;
begin
  SQLHistoryStringGrid.HideCol(GRID_COLUMN_SQL);
  ReadSQLHistoryFile;
  SetFields;
  AutoSizeCol(SQLHistoryStringGrid, 1);
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
      if AskYesOrNo('Save changes?') then
      begin
        SQLHistoryStringGrid.Cells[GRID_COLUMN_DATETIME, SQLHistoryStringGrid.Row] := HistoryDate;
        SQLHistoryStringGrid.Cells[GRID_COLUMN_SCHEMA, SQLHistoryStringGrid.Row] := Schema;
        SQLHistoryStringGrid.Cells[GRID_COLUMN_SQL, SQLHistoryStringGrid.Row] := SQLStatement;
        SQLHistoryStringGrid.Cells[GRID_COLUMN_SQL_STATEMENT, SQLHistoryStringGrid.Row] :=
          Copy(SQLHistoryStringGrid.Cells[GRID_COLUMN_SQL, SQLHistoryStringGrid.Row], 0, 200);

        if Length(SQLHistoryStringGrid.Cells[GRID_COLUMN_SQL, SQLHistoryStringGrid.Row]) > 200 then
          SQLHistoryStringGrid.Cells[GRID_COLUMN_SQL_STATEMENT, SQLHistoryStringGrid.Row] :=
            SQLHistoryStringGrid.Cells[GRID_COLUMN_SQL_STATEMENT, SQLHistoryStringGrid.Row] + '...';
        WriteSQLHistoryFile;
      end;
    end;
  finally
    Free;
  end;
end;

procedure TSQLHistoryFrame.WriteSQLHistoryFile;
var
  i: Integer;
  History: TStringList;
begin
  History := TStringList.Create;
  try
    // date;schema;sql#!ENDSQL!#
    for i := 1 to SQLHistoryStringGrid.RowCount - 1 do
      History.Add(EncryptString(
        SQLHistoryStringGrid.Cells[GRID_COLUMN_DATETIME, i] + ';' +
        SQLHistoryStringGrid.Cells[GRID_COLUMN_SCHEMA, i] + ';' +
        SQLHistoryStringGrid.Cells[GRID_COLUMN_SQL, i] + END_OF_SQL_STATEMENT));
    History.SaveToFile(GetHistoryFile);
  finally
    History.Free;
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
      History.Strings[i] := DecryptString(History.Strings[i]);
    try
      i := 0;
      while i < History.Count do
      begin
        SQLHistoryStringGrid.Cells[GRID_COLUMN_BOOLEAN, SQLHistoryStringGrid.RowCount - 1] := 'False';
        s := History.Strings[i];
        SQLHistoryStringGrid.Cells[GRID_COLUMN_DATETIME, SQLHistoryStringGrid.RowCount - 1] :=
          Copy(s, 0, Pos(';', s) - 1);
        s := Copy(s, Pos(';', s) + 1, Length(s));
        SQLHistoryStringGrid.Cells[GRID_COLUMN_SCHEMA, SQLHistoryStringGrid.RowCount - 1] :=
          Lib.FormatSchema(Copy(s, 0, Pos(';', s) - 1));
        s := Copy(s, Pos(';', s) + 1, Length(s));
        while Pos(END_OF_SQL_STATEMENT, s) = 0 do
        begin
          SQLHistoryStringGrid.Cells[GRID_COLUMN_SQL, SQLHistoryStringGrid.RowCount - 1] :=
             SQLHistoryStringGrid.Cells[GRID_COLUMN_SQL, SQLHistoryStringGrid.RowCount - 1] + s + ' ';
          Inc(i);
          s := History.Strings[i];
        end;
        SQLHistoryStringGrid.Cells[GRID_COLUMN_SQL, SQLHistoryStringGrid.RowCount - 1] :=
          SQLHistoryStringGrid.Cells[GRID_COLUMN_SQL, SQLHistoryStringGrid.RowCount - 1] +
          Copy(s, 0, Pos(END_OF_SQL_STATEMENT, s) - 1);
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
