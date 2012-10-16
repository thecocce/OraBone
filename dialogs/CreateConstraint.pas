unit CreateConstraint;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, CreateObjectDialog, Vcl.Buttons, JvExButtons, JvBitBtn,
  Vcl.Grids, JvExGrids, JvStringGrid, BCStringGrid, Vcl.StdCtrls, JvExStdCtrls, JvCombobox,
  BCComboBox, JvEdit, BCEdit, Vcl.ImgList, SynEditHighlighter, SynHighlighterSQL, Vcl.ActnList,
  Vcl.ComCtrls, Vcl.ToolWin, JvExComCtrls, JvToolBar, SynEdit, Vcl.ExtCtrls, JvComCtrls,
  BCPageControl, Ora, BCToolBar, Dlg;

type
  TCreateConstraintDialog = class(TCreateObjectBaseDialog)
    ConstraintNameLabel: TLabel;
    ConstraintNameEdit: TBCEdit;
    TypeLabel: TLabel;
    PrimaryKeyRadioButton: TRadioButton;
    ForeignKeyRadioButton: TRadioButton;
    CheckRadioButton: TRadioButton;
    UniqueRadioButton: TRadioButton;
    TableLabel: TLabel;
    TableNameComboBox: TBCComboBox;
    ColumnsTabSheet: TTabSheet;
    ReferencedColumnsTabSheet: TTabSheet;
    ConditionTabSheet: TTabSheet;
    RefColumnsPanel: TPanel;
    RefColumnsStringGrid: TBCStringGrid;
    ReferencedColumnsBottomPanel: TPanel;
    JvBitBtn1: TJvBitBtn;
    JvBitBtn2: TJvBitBtn;
    RefColumnTopPanel: TPanel;
    Label1: TLabel;
    RefTableNameComboBox: TBCComboBox;
    ColumnsPanel: TPanel;
    ColumnsStringGrid: TBCStringGrid;
    ColumnBottomPanel: TPanel;
    UpBitBtn: TJvBitBtn;
    DownBitBtn: TJvBitBtn;
    ConditionPanel: TPanel;
    ConditionSynEdit: TSynEdit;
    MoveupColumnAction: TAction;
    MoveDownColumnAction: TAction;
    MoveupRefColumnAction: TAction;
    MoveDownRefColumnAction: TAction;
    TableNameEdit: TBCEdit;
    procedure TableNameComboBoxChange(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure MoveDownColumnActionExecute(Sender: TObject);
    procedure MoveDownRefColumnActionExecute(Sender: TObject);
    procedure MoveupColumnActionExecute(Sender: TObject);
    procedure MoveupRefColumnActionExecute(Sender: TObject);
    procedure PageControlChange(Sender: TObject);
    procedure RefTableNameComboBoxChange(Sender: TObject);
  private
    { Private declarations }
    procedure GetTableNames;
    procedure GetColumnNames(TableName: string; Grid: TBCStringGrid);
  protected
    procedure CreateSQL; override;
    function CheckFields: Boolean; override;
    procedure Initialize; override;
  public
    { Public declarations }
  end;

function CreateConstraintDialog: TCreateConstraintDialog;

implementation

{$R *.dfm}

uses
  Common, DataModule, Lib;

var
  FCreateConstraintDialog: TCreateConstraintDialog;

function CreateConstraintDialog: TCreateConstraintDialog;
begin
  if FCreateConstraintDialog = nil then
    Application.CreateForm(TCreateConstraintDialog, FCreateConstraintDialog);
  Result := FCreateConstraintDialog;
  Common.SetStyledFormSize(TDialog(Result));
end;

procedure TCreateConstraintDialog.FormDestroy(Sender: TObject);
begin
  inherited;
  FCreateConstraintDialog := nil;
end;

procedure TCreateConstraintDialog.MoveDownColumnActionExecute(Sender: TObject);
begin
  inherited;
  Lib.MoveStringGridRow(ColumnsStringGrid, 1);
end;

procedure TCreateConstraintDialog.MoveDownRefColumnActionExecute(Sender: TObject);
begin
  inherited;
  Lib.MoveStringGridRow(RefColumnsStringGrid, 1);
end;

procedure TCreateConstraintDialog.MoveupColumnActionExecute(Sender: TObject);
begin
  inherited;
  Lib.MoveStringGridRow(ColumnsStringGrid, -1);
end;

procedure TCreateConstraintDialog.MoveupRefColumnActionExecute(Sender: TObject);
begin
  inherited;
  Lib.MoveStringGridRow(RefColumnsStringGrid, -1);
end;

procedure TCreateConstraintDialog.PageControlChange(Sender: TObject);
begin
  ReferencedColumnsTabSheet.TabVisible := ForeignKeyRadioButton.Checked;
  ConditionTabSheet.TabVisible := CheckRadioButton.Checked;
  inherited;
end;

procedure TCreateConstraintDialog.RefTableNameComboBoxChange(Sender: TObject);
begin
  inherited;
  GetColumnNames(RefTableNameComboBox.Text, RefColumnsStringGrid);
  CreateSQL;
end;

procedure TCreateConstraintDialog.TableNameComboBoxChange(Sender: TObject);
begin
  inherited;
  GetColumnNames(TableNameComboBox.Text, ColumnsStringGrid);
  CreateSQL;
end;

function TCreateConstraintDialog.CheckFields: Boolean;
var
  i: Integer;
  TrueCount: Integer;
begin
  Result := False;
  if Trim(ConstraintNameEdit.Text) = '' then
  begin
    Common.ShowErrorMessage('Set constraint name.');
    ConstraintNameEdit.SetFocus;
    Exit;
  end;
  if Trim(TableNameComboBox.Text) = '' then
  begin
    Common.ShowErrorMessage('Set table name.');
    TableNameComboBox.SetFocus;
    Exit;
  end;
  TrueCount := 0;
  for i := 0 to ColumnsStringGrid.RowCount - 1 do
    if ColumnsStringGrid.Cells[1, i] = 'True' then
      Inc(TrueCount);
  if TrueCount = 0 then
  begin
    Common.ShowErrorMessage('Set columns.');
    Exit;
  end;
  if (UniqueRadioButton.Checked or CheckRadioButton.Checked) and
    (TrueCount <> 1) then
  begin
    Common.ShowErrorMessage('Unique and Check type allow only one column.');
    Exit;
  end;
  if ForeignKeyRadioButton.Checked then
  begin
    TrueCount := 0;
    for i := 0 to RefColumnsStringGrid.RowCount - 1 do
      if RefColumnsStringGrid.Cells[1, i] = 'True' then
        Inc(TrueCount);
    if TrueCount = 0 then
    begin
      Common.ShowErrorMessage('Set referenced columns.');
      Exit;
    end;
  end;

  Result := True;
end;

procedure TCreateConstraintDialog.GetTableNames;
var
  OraQuery: TOraQuery;
begin
  OraQuery := TOraQuery.Create(nil);
  OraQuery.Session := FOraSession;
  OraQuery.SQL.Add(DM.StringHolder.StringsByName['AllTablesOfSchemaSQL'].Text);
  with OraQuery do
  try
    ParamByName('P_SCHEMA').AsWideString := FSchemaParam;
    Prepare;
    Open;
    while not Eof do
    begin
      TableNameComboBox.Items.Add(FieldByName('TABLE_NAME').AsString);
      RefTableNameComboBox.Items.Add(FieldByName('TABLE_NAME').AsString);
      Next;
    end;
  finally
    Close;
    UnPrepare;
    FreeAndNil(OraQuery);
  end;
end;

procedure TCreateConstraintDialog.GetColumnNames(TableName: string; Grid: TBCStringGrid);
var
  i: Integer;
  OraQuery: TOraQuery;
begin
  OraQuery := TOraQuery.Create(nil);
  OraQuery.Session := FOraSession;
  OraQuery.SQL.Add(DM.StringHolder.StringsByName['TableColumnsSQL'].Text);
  with OraQuery do
  try
    ParamByName('P_TABLE_NAME').AsWideString := TableName;
    ParamByName('P_SCHEMA').AsWideString := FSchemaParam;
    Prepare;
    Open;
    i := 1; // header & first row
    Grid.RowCount := RecordCount + 1;
    while not Eof do
    begin
      Grid.Cells[0, i] := FieldByName('COLUMN_NAME').AsString;
      Grid.Cells[1, i] := 'False';
      Inc(i);
      Next;
    end;
  finally
    Close;
    UnPrepare;
    FreeAndNil(OraQuery);
  end;
end;

procedure TCreateConstraintDialog.Initialize;
begin
  inherited;
  ReferencedColumnsTabSheet.TabVisible := False;
  ConditionTabSheet.TabVisible := False;
  ColumnsStringGrid.Cells[0, 0] := 'Column';
  ColumnsStringGrid.Cells[1, 0] := 'Selected';
  RefColumnsStringGrid.Cells[0, 0] := 'Column';
  RefColumnsStringGrid.Cells[1, 0] := 'Selected';
  GetTableNames;
  SourceSynEdit.Text := '';
  if FObjectName <> '' then
  begin
    TableNameEdit.Visible := True;
    TableNameEdit.Text := FObjectName;
    TableNameComboBox.Visible := False;
    TableNameComboBox.Text := FObjectName;
    GetColumnNames(TableNameComboBox.Text, ColumnsStringGrid);
  end;
end;

function GetColumns(Grid: TBCStringGrid): string;
var
  i: Integer;
begin
  Result := '';
  for i := 0 to Grid.RowCount - 1 do
  begin
    if Grid.Cells[1, i] = 'True' then
    begin
      if Result <> '' then
        Result := Result + ', ';
      Result := Result + Grid.Cells[0, i];
    end;
  end;
end;

procedure TCreateConstraintDialog.CreateSQL;
var
  Columns: string;
begin
  SourceSynEdit.Lines.Clear;
  SourceSynEdit.Lines.BeginUpdate;
  SourceSynEdit.Lines.Text := Format('ALTER TABLE %s', [TableNameComboBox.Text]) + CHR_ENTER;
  SourceSynEdit.Lines.Text := SourceSynEdit.Lines.Text + Format('  ADD CONSTRAINT %s', [ConstraintNameEdit.Text]) + CHR_ENTER;

  Columns := GetColumns(ColumnsStringGrid);

  if PrimaryKeyRadioButton.Checked then
    SourceSynEdit.Lines.Text := SourceSynEdit.Lines.Text + Format('  PRIMARY KEY (%s);', [Columns]) + CHR_ENTER;

  if ForeignKeyRadioButton.Checked then
  begin
    SourceSynEdit.Lines.Text := SourceSynEdit.Lines.Text + Format('  FOREIGN KEY (%s)', [Columns]) + CHR_ENTER;
    Columns := GetColumns(RefColumnsStringGrid);
    SourceSynEdit.Lines.Text := SourceSynEdit.Lines.Text + Format('  REFERENCING %s (%s);', [RefTableNameComboBox.Text, Columns]) + CHR_ENTER;
  end;

  if UniqueRadioButton.Checked then
    SourceSynEdit.Lines.Text := SourceSynEdit.Lines.Text + Format('  UNIQUE (%s);', [Columns]) + CHR_ENTER;

  if CheckRadioButton.Checked then
    SourceSynEdit.Lines.Text := SourceSynEdit.Lines.Text + Format('  CHECK (%s = %s);', [Columns, ConditionSynEdit.Text]) + CHR_ENTER;

  SourceSynEdit.Lines.Text := Trim(SourceSynEdit.Lines.Text);
  SourceSynEdit.Lines.EndUpdate;
end;

end.
