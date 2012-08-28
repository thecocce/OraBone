unit CreateIndex;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms,
  Vcl.Dialogs, CreateObjectDialog, Vcl.Buttons, JvExButtons, JvBitBtn, Grids, JvExGrids, JvStringGrid,
  BCStringGrid, Vcl.StdCtrls, JvExStdCtrls, JvCombobox, BCComboBox, JvEdit, BCEdit, Vcl.ImgList,
  SynEditHighlighter, SynHighlighterSQL, ActnList, ComCtrls, ToolWin, JvExComCtrls, JvToolBar,
  SynEdit, Vcl.ExtCtrls, JvComCtrls, BCPageControl, BCToolBar;

type
  TCreateIndexDialog = class(TCreateObjectBaseDialog)
    ColumnsTabSheet: TTabSheet;
    IndexNameLabel: TLabel;
    IndexNameEdit: TBCEdit;
    UniquenessLabel: TLabel;
    UniqueRadioButton: TRadioButton;
    NonuniqueRadioButton: TRadioButton;
    TableLabel: TLabel;
    TableNameComboBox: TBCComboBox;
    ColumnsPanel: TPanel;
    ColumnsStringGrid: TBCStringGrid;
    ColumnBottomPanel: TPanel;
    UpBitBtn: TJvBitBtn;
    DownBitBtn: TJvBitBtn;
    MoveupColumnAction: TAction;
    MoveDownColumnAction: TAction;
    TableNameEdit: TBCEdit;
    procedure FormDestroy(Sender: TObject);
    procedure Formshow(Sender: TObject);
    procedure MoveDownColumnActionExecute(Sender: TObject);
    procedure MoveupColumnActionExecute(Sender: TObject);
    procedure TableNameComboBoxChange(Sender: TObject);
  private
    { Private declarations }
    procedure GetTableNames;
    procedure GetColumnNames;
  protected
    procedure CreateSQL; override;
    function CheckFields: Boolean; override;
    procedure Initialize; override;
  public
    { Public declarations }
  end;

function CreateIndexDialog: TCreateIndexDialog;

implementation

{$R *.dfm}

uses
  Common, DataModule, Ora, Lib, Vcl.Themes, StyleHooks;

var
  FCreateIndexDialog: TCreateIndexDialog;

function CreateIndexDialog: TCreateIndexDialog;
begin
  if FCreateIndexDialog = nil then
    Application.CreateForm(TCreateIndexDialog, FCreateIndexDialog);
  Result := FCreateIndexDialog;
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
    Common.ShowErrorMessage('Set index name.');
    IndexNameEdit.SetFocus;
    Exit;
  end;
  if Trim(TableNameComboBox.Text) = '' then
  begin
    Common.ShowErrorMessage('Set table name.');
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
    Common.ShowErrorMessage('Set columns.');
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
  OraQuery.SQL.Add(DM.ObjectTreeStringHolder.StringsByName['AllTablesOfSchemaSQL'].Text);
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
  OraQuery.SQL.Add(DM.ObjectTreeStringHolder.StringsByName['TableColumnsSQL'].Text);
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

initialization

  TStyleManager.Engine.RegisterStyleHook(TCustomSynEdit, TSynEditStyleHook);


end.
