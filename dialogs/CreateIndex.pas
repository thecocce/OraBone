unit CreateIndex;

interface

uses
  System.SysUtils, System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, CreateObjectDialog, Vcl.Buttons,
  Grids, JvExGrids, JvStringGrid, BCControls.StringGrid, Vcl.StdCtrls, BCControls.ComboBox, BCControls.Edit,
  Vcl.ImgList, SynEditHighlighter, SynHighlighterSQL, ActnList, ComCtrls, ToolWin, JvExComCtrls, SynEdit, Vcl.ExtCtrls,
  JvComCtrls, BCControls.PageControl, BCControls.ToolBar, BCDialogs.Dlg, System.Actions, BCControls.ImageList;

type
  TCreateIndexDialog = class(TCreateObjectBaseDialog)
    ColumnBottomPanel: TPanel;
    ColumnsPanel: TPanel;
    ColumnsStringGrid: TBCStringGrid;
    ColumnsTabSheet: TTabSheet;
    IndexNameEdit: TBCEdit;
    IndexNameLabel: TLabel;
    MoveDownColumnAction: TAction;
    MoveupColumnAction: TAction;
    NonuniqueRadioButton: TRadioButton;
    TableLabel: TLabel;
    TableNameComboBox: TBCComboBox;
    TableNameEdit: TBCEdit;
    UniquenessLabel: TLabel;
    UniqueRadioButton: TRadioButton;
    ColumnsToolBar: TBCToolBar;
    MoveUpToolButton: TToolButton;
    MoveDownToolButton: TToolButton;
    procedure FormDestroy(Sender: TObject);
    procedure Formshow(Sender: TObject);
    procedure MoveDownColumnActionExecute(Sender: TObject);
    procedure MoveupColumnActionExecute(Sender: TObject);
    procedure TableNameComboBoxChange(Sender: TObject);
  private
    { Private declarations }
    procedure GetColumnNames;
    procedure GetTableNames;
  protected
    function CheckFields: Boolean; override;
    procedure CreateSQL; override;
    procedure Initialize; override;
  end;

function CreateIndexDialog: TCreateIndexDialog;

implementation

{$R *.dfm}

uses
  DataModule, Ora, Lib, BCCommon.StyleUtils, BCCommon.Messages, BCCommon.Lib;

var
  FCreateIndexDialog: TCreateIndexDialog;

function CreateIndexDialog: TCreateIndexDialog;
begin
  if not Assigned(FCreateIndexDialog) then
    Application.CreateForm(TCreateIndexDialog, FCreateIndexDialog);
  Result := FCreateIndexDialog;
  SetStyledFormSize(TDialog(Result));
end;

procedure TCreateIndexDialog.FormDestroy(Sender: TObject);
begin
  inherited;
  FCreateIndexDialog := nil;
end;

procedure TCreateIndexDialog.Formshow(Sender: TObject);
begin
  inherited;
  IndexNameEdit.SetFocus;
end;

procedure TCreateIndexDialog.MoveDownColumnActionExecute(Sender: TObject);
begin
  inherited;
  Lib.MoveStringGridRow(ColumnsStringGrid, 1);
end;

procedure TCreateIndexDialog.MoveupColumnActionExecute(Sender: TObject);
begin
  inherited;
  Lib.MoveStringGridRow(ColumnsStringGrid, -1);
end;

procedure TCreateIndexDialog.TableNameComboBoxChange(Sender: TObject);
begin
  inherited;
  GetColumnNames;
  CreateSQL;
end;

function TCreateIndexDialog.CheckFields: Boolean;
var
  i: Integer;
  Found: Boolean;
begin
  Result := False;
  if Trim(IndexNameEdit.Text) = '' then
  begin
    ShowErrorMessage('Set index name.');
    IndexNameEdit.SetFocus;
    Exit;
  end;
  if Trim(TableNameComboBox.Text) = '' then
  begin
    ShowErrorMessage('Set table name.');
    TableNameComboBox.SetFocus;
    Exit;
  end;
  Found := False;
  for i := 0 to ColumnsStringGrid.RowCount - 1 do
  begin
    if ColumnsStringGrid.Cells[1, i] = 'True' then
    begin
      Found := True;
      Break;
    end;
  end;
  if not Found then
  begin
    ShowErrorMessage('Set columns.');
    Exit;
  end;
  Result := True;
end;

procedure TCreateIndexDialog.GetTableNames;
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
      Next;
    end;
  finally
    Close;
    UnPrepare;
    FreeAndNil(OraQuery);
  end;
end;

procedure TCreateIndexDialog.Initialize;
begin
  inherited;
  if FObjectName <> '' then
  begin
    TableNameEdit.Visible := True;
    TableNameEdit.Text := FObjectName;
    TableNameComboBox.Visible := False;
    TableNameComboBox.Text := FObjectName;
    GetColumnNames;
  end;
  ColumnsStringGrid.Cells[0, 0] := 'Column';
  ColumnsStringGrid.Cells[1, 0] := 'Selected';
  GetTableNames;
end;

procedure TCreateIndexDialog.GetColumnNames;
var
  i: Integer;
  OraQuery: TOraQuery;
begin
  OraQuery := TOraQuery.Create(nil);
  OraQuery.Session := FOraSession;
  OraQuery.SQL.Add(DM.StringHolder.StringsByName['TableColumnsSQL'].Text);
  with OraQuery do
  try
    ParamByName('P_TABLE_NAME').AsWideString := TableNameComboBox.Text;
    ParamByName('P_SCHEMA').AsWideString := FSchemaParam;
    Prepare;
    Open;
    i := 1; // header & first row
    ColumnsStringGrid.RowCount := RecordCount + 1;
    while not Eof do
    begin
      ColumnsStringGrid.Cells[0, i] := FieldByName('COLUMN_NAME').AsString;
      ColumnsStringGrid.Cells[1, i] := 'False';
      Inc(i);
      Next;
    end;
  finally
    Close;
    UnPrepare;
    FreeAndNil(OraQuery);
  end;
end;

procedure TCreateIndexDialog.CreateSQL;
var
  i: Integer;
  Unique, Columns: string;
begin
  SourceSynEdit.Lines.Clear;
  SourceSynEdit.Lines.BeginUpdate;
  Unique := 'UNIQUE';
  if NonuniqueRadioButton.Checked then
    Unique := 'NON' + Unique;
  SourceSynEdit.Lines.Text := Format('CREATE %s INDEX %s.%s ON %s.%s', [Unique, FSchemaParam,
    IndexNameEdit.Text, FSchemaParam, TableNameComboBox.Text]) + CHR_ENTER;
  Columns := '';
  for i := 0 to ColumnsStringGrid.RowCount - 1 do
    begin
      if ColumnsStringGrid.Cells[1, i] = 'True' then
      begin
        if Columns <> '' then
          Columns := Columns + ', ';
        Columns := Columns + ColumnsStringGrid.Cells[0, i];
      end;
    end;
  SourceSynEdit.Lines.Text := SourceSynEdit.Lines.Text + Format('  (%s);', [Columns]);
  SourceSynEdit.Lines.Text := Trim(SourceSynEdit.Lines.Text);
  SourceSynEdit.Lines.EndUpdate;
end;

end.
