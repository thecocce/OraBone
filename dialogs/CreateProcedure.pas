unit CreateProcedure;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms,
  Vcl.Dialogs, CreateObjectDialog, Vcl.Buttons, JvExButtons, JvBitBtn, Vcl.StdCtrls, Vcl.DBCtrls, BCDBComboBox,
  Vcl.Mask, BCDBEdit, MemDS, DBAccess, Ora, JvExStdCtrls, JvEdit, BCEdit,
  Vcl.ImgList, SynEditHighlighter, SynHighlighterSQL, ActnList, ComCtrls, ToolWin, JvExComCtrls,
  JvToolBar, SynEdit, Vcl.ExtCtrls, JvComCtrls, BCPageControl, BCToolBar, DBGridEhGrouping, GridsEh,
  DBGridEh, BCDBGrid, Data.DB;

type
  TCreateProcedureDialog = class(TCreateObjectBaseDialog)
    ProcedureNameLabel: TLabel;
    ProcedureNameEdit: TBCEdit;
    ParametersTabSheet: TTabSheet;
    BodyTabSheet: TTabSheet;
    ColumnsDataSource: TOraDataSource;
    ColumnsQuery: TOraQuery;
    ColumnsPanel: TPanel;
    ColumnButtonPanel: TPanel;
    UpBitBtn: TJvBitBtn;
    DownBitBtn: TJvBitBtn;
    InsertBitBtn: TJvBitBtn;
    DeleteBitBtn: TJvBitBtn;
    BodyPanel: TPanel;
    BodySynEdit: TSynEdit;
    MoveupColumnAction: TAction;
    MoveDownColumnAction: TAction;
    AddColumnAction: TAction;
    DeleteColumnAction: TAction;
    BCDBGrid1: TBCDBGrid;
    procedure FormDestroy(Sender: TObject);
    procedure AddColumnActionExecute(Sender: TObject);
    procedure Formshow(Sender: TObject);
    procedure DeleteColumnActionExecute(Sender: TObject);
    procedure MoveDownColumnActionExecute(Sender: TObject);
    procedure MoveupColumnActionExecute(Sender: TObject);
  private
    { Private declarations }
  protected
    procedure CreateSQL; override;
    function CheckFields: Boolean; override;
    procedure Initialize; override;
  public
    { Public declarations }
  end;

function CreateProcedureDialog: TCreateProcedureDialog;

implementation

{$R *.dfm}

uses
  Common, Lib, StyleHooks;

var
  FCreateProcedureDialog: TCreateProcedureDialog;

function CreateProcedureDialog: TCreateProcedureDialog;
begin
  if FCreateProcedureDialog = nil then
    Application.CreateForm(TCreateProcedureDialog, FCreateProcedureDialog);
  Result := FCreateProcedureDialog;
  Common.SetStyledFormSize(Result, 364, 388);
end;

procedure TCreateProcedureDialog.FormDestroy(Sender: TObject);
begin
  inherited;
  FCreateProcedureDialog := nil;
end;

procedure TCreateProcedureDialog.Formshow(Sender: TObject);
begin
  inherited;
  ProcedureNameEdit.SetFocus;
end;

procedure TCreateProcedureDialog.MoveDownColumnActionExecute(Sender: TObject);
begin
  inherited;
  Lib.MoveGridRowDown(ColumnsQuery);
end;

procedure TCreateProcedureDialog.MoveupColumnActionExecute(Sender: TObject);
begin
  inherited;
  Lib.MoveGridRowUp(ColumnsQuery);
end;

procedure TCreateProcedureDialog.AddColumnActionExecute(Sender: TObject);
begin
  inherited;
  ColumnsQuery.Append;
end;

procedure TCreateProcedureDialog.DeleteColumnActionExecute(Sender: TObject);
begin
  inherited;
  ColumnsQuery.Delete;
end;

function TCreateProcedureDialog.CheckFields: Boolean;
begin
  Result := False;
  if Trim(ProcedureNameEdit.Text) = '' then
  begin
    Common.ShowErrorMessage('Set procedure name.');
    ProcedureNameEdit.SetFocus;
    Exit;
  end;
  Result := True;
end;

procedure TCreateProcedureDialog.Initialize;
begin
  inherited;
  UpdateGutter(BodySynEdit);
  with ColumnsQuery do
  begin
    Session := FOraSession;
    Close;
    Open;
  end;
  BodySynEdit.Lines.Text := 'BEGIN' + CHR_ENTER + CHR_ENTER + 'END;';
end;

procedure TCreateProcedureDialog.CreateSQL;
begin
  SourceSynEdit.Lines.Clear;
  SourceSynEdit.Lines.BeginUpdate;
  { create table }
  with ColumnsQuery do
  begin
    First;
    SourceSynEdit.Lines.Text := Format('CREATE OR REPLACE PROCEDURE %s.%s', [FSchemaParam, ProcedureNameEdit.Text]);

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
    SourceSynEdit.Lines.Text := SourceSynEdit.Lines.Text + 'AS' + CHR_ENTER;
  end;
  SourceSynEdit.Lines.Text := SourceSynEdit.Lines.Text + BodySynEdit.Text;
  SourceSynEdit.Lines.EndUpdate;
end;

end.
