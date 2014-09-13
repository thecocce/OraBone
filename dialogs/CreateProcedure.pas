unit CreateProcedure;

interface

uses
  System.SysUtils, System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, CreateObjectDialog, Vcl.Buttons,
  Vcl.StdCtrls, Vcl.DBCtrls, MemDS, DBAccess, Ora, BCControls.Edit, BCDialogs.Dlg, Vcl.ImgList, SynEditHighlighter,
  SynHighlighterSQL, ActnList, ComCtrls, ToolWin, JvExComCtrls, SynEdit, Vcl.ExtCtrls, JvComCtrls,
  BCControls.PageControl, BCControls.ToolBar, BCControls.DBGrid, Data.DB, System.Actions, GridsEh, DBAxisGridsEh,
  DBGridEh, BCControls.ImageList, DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh;

type
  TCreateProcedureDialog = class(TCreateObjectBaseDialog)
    AddColumnAction: TAction;
    BCDBGrid1: TBCDBGrid;
    BodyPanel: TPanel;
    BodySynEdit: TSynEdit;
    BodyTabSheet: TTabSheet;
    ColumnButtonPanel: TPanel;
    ColumnsDataSource: TOraDataSource;
    ColumnsPanel: TPanel;
    ColumnsQuery: TOraQuery;
    DeleteColumnAction: TAction;
    MoveDownColumnAction: TAction;
    MoveupColumnAction: TAction;
    ParametersTabSheet: TTabSheet;
    ProcedureNameEdit: TBCEdit;
    ProcedureNameLabel: TLabel;
    ParametersToolBar: TBCToolBar;
    MoveUpToolButton: TToolButton;
    MoveDownToolButton: TToolButton;
    AddColumnToolButton: TToolButton;
    DeleteColumnToolButton: TToolButton;
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

function CreateProcedureDialog: TCreateProcedureDialog;

implementation

{$R *.dfm}

uses
  Lib, BCCommon.StyleUtils, BCCommon.Messages, BCCommon.Lib;

var
  FCreateProcedureDialog: TCreateProcedureDialog;

function CreateProcedureDialog: TCreateProcedureDialog;
begin
  if not Assigned(FCreateProcedureDialog) then
    Application.CreateForm(TCreateProcedureDialog, FCreateProcedureDialog);
  Result := FCreateProcedureDialog;
  SetStyledFormSize(TDialog(Result));
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
    ShowErrorMessage('Set procedure name.');
    ProcedureNameEdit.SetFocus;
    Exit;
  end;
  Result := True;
end;

procedure TCreateProcedureDialog.Initialize;
begin
  inherited;
  UpdateMargin(BodySynEdit);
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
