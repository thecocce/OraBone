unit CreateFunction;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms,
  Vcl.Dialogs, CreateObjectDialog, MemDS, DBAccess, Ora, Vcl.Buttons, JvExButtons, JvBitBtn, Vcl.DBCtrls,
  BCDBComboBox, Vcl.Mask, BCDBEdit, Vcl.StdCtrls, JvExStdCtrls, JvCombobox, Dlg,
  BCComboBox, JvEdit, BCEdit, Vcl.ImgList, SynEditHighlighter, SynHighlighterSQL, ActnList, ComCtrls,
  ToolWin, JvExComCtrls, JvToolBar, SynEdit, Vcl.ExtCtrls, JvComCtrls, BCPageControl, BCToolBar,
  DBGridEhGrouping, GridsEh, DBGridEh, BCDBGrid, Data.DB;

type
  TCreateFunctionDialog = class(TCreateObjectBaseDialog)
    AddColumnAction: TAction;
    BCDBGrid1: TBCDBGrid;
    BodyPanel: TPanel;
    BodySynEdit: TSynEdit;
    BodyTabSheet: TTabSheet;
    ColumnButtonPanel: TPanel;
    ColumnsDataSource: TOraDataSource;
    ColumnsPanel: TPanel;
    ColumnsQuery: TOraQuery;
    DeleteBitBtn: TJvBitBtn;
    DeleteColumnAction: TAction;
    DownBitBtn: TJvBitBtn;
    FunctionNameEdit: TBCEdit;
    FunctionNameLabel: TLabel;
    InsertBitBtn: TJvBitBtn;
    MoveDownColumnAction: TAction;
    MoveupColumnAction: TAction;
    ParametersTabSheet: TTabSheet;
    ReturnTypeComboBox: TBCComboBox;
    ReturnTypeLabel: TLabel;
    UpBitBtn: TJvBitBtn;
    procedure AddColumnActionExecute(Sender: TObject);
    procedure DeleteColumnActionExecute(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Formshow(Sender: TObject);
    procedure MoveDownColumnActionExecute(Sender: TObject);
    procedure MoveupColumnActionExecute(Sender: TObject);
  protected
    function CheckFields: Boolean; override;
    procedure CreateSQL; override;
    procedure Initialize; override;
  end;

function CreateFunctionDialog: TCreateFunctionDialog;

implementation

{$R *.dfm}

uses
  Common, Lib, StyleHooks;

var
  FCreateFunctionDialog: TCreateFunctionDialog;

function CreateFunctionDialog: TCreateFunctionDialog;
begin
  if not Assigned(FCreateFunctionDialog) then
    Application.CreateForm(TCreateFunctionDialog, FCreateFunctionDialog);
  Result := FCreateFunctionDialog;
  StyleHooks.SetStyledFormSize(TDialog(Result));
end;

procedure TCreateFunctionDialog.FormDestroy(Sender: TObject);
begin
  inherited;
  FCreateFunctionDialog := nil;
end;

procedure TCreateFunctionDialog.Formshow(Sender: TObject);
begin
  inherited;
  FunctionNameEdit.SetFocus;
end;

procedure TCreateFunctionDialog.AddColumnActionExecute(Sender: TObject);
begin
  inherited;
  ColumnsQuery.Append;
end;

procedure TCreateFunctionDialog.DeleteColumnActionExecute(Sender: TObject);
begin
  inherited;
  ColumnsQuery.Delete;
end;

procedure TCreateFunctionDialog.MoveDownColumnActionExecute(Sender: TObject);
begin
  inherited;
  Lib.MoveGridRowDown(ColumnsQuery);
end;

procedure TCreateFunctionDialog.MoveupColumnActionExecute(Sender: TObject);
begin
  inherited;
  Lib.MoveGridRowUp(ColumnsQuery);
end;

function TCreateFunctionDialog.CheckFields: Boolean;
begin
  Result := False;
  if Trim(FunctionNameEdit.Text) = '' then
  begin
    Common.ShowErrorMessage('Set function name.');
    FunctionNameEdit.SetFocus;
    Exit;
  end;
  if Trim(ReturnTypeComboBox.Text) = '' then
  begin
    Common.ShowErrorMessage('Set return type.');
    ReturnTypeComboBox.SetFocus;
    Exit;
  end;
  Result := True;
end;

procedure TCreateFunctionDialog.Initialize;
begin
  inherited;
  UpdateGutter(BodySynEdit);
  with ColumnsQuery do
  begin
    Session := FOraSession;
    Close;
    Open;
  end;
  BodySynEdit.Lines.Text := 'BEGIN' + CHR_ENTER + CHR_ENTER + '  RETURN ;' + CHR_ENTER + 'END;';
end;

procedure TCreateFunctionDialog.CreateSQL;
begin
  SourceSynEdit.Lines.Clear;
  SourceSynEdit.Lines.BeginUpdate;
  { create table }
  with ColumnsQuery do
  begin
    First;
    SourceSynEdit.Lines.Text := Format('CREATE OR REPLACE FUNCTION %s.%s', [FSchemaParam, FunctionNameEdit.Text]);

    if ColumnsQuery.RecordCount = 0 then
      SourceSynEdit.Lines.Text := SourceSynEdit.Lines.Text + CHR_ENTER
    else
    begin
      SourceSynEdit.Lines.Text := SourceSynEdit.Lines.Text + ' (' + CHR_ENTER;
      First;
      while not Eof do
      begin
        SourceSynEdit.Lines.Text := SourceSynEdit.Lines.Text + '  ' + FieldByName('COLUMN_NAME').AsWideString;
        if not FieldByName('INOUT').IsNull then
          SourceSynEdit.Lines.Text := SourceSynEdit.Lines.Text + ' ' + FieldByName('INOUT').AsString;
        SourceSynEdit.Lines.Text := SourceSynEdit.Lines.Text + ' ' + FieldByName('DATA_TYPE').AsWideString;
        Next;
        if not Eof then
          SourceSynEdit.Lines.Text := SourceSynEdit.Lines.Text + ',' + CHR_ENTER;
      end;
      SourceSynEdit.Lines.Text := SourceSynEdit.Lines.Text + ')' + CHR_ENTER;
    end;
    SourceSynEdit.Lines.Text := SourceSynEdit.Lines.Text + '  RETURN ' + ReturnTypeComboBox.Text + CHR_ENTER;
    SourceSynEdit.Lines.Text := SourceSynEdit.Lines.Text + 'AS' + CHR_ENTER;
  end;
  SourceSynEdit.Lines.Text := SourceSynEdit.Lines.Text + BodySynEdit.Text;
  SourceSynEdit.Lines.EndUpdate;
end;

end.
