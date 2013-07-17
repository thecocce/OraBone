unit CreateObjectDialog;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms,
  Vcl.Dialogs, Ora, Vcl.ImgList, SynEditHighlighter, SynHighlighterSQL, ActnList, ComCtrls, ToolWin, BCDialogs.Dlg,
  JvExComCtrls, JvToolBar, SynEdit, Vcl.ExtCtrls, Vcl.StdCtrls, JvComCtrls, BCControls.PageControl,
  DAScript, BCControls.ToolBar, System.Actions;

type
  TCreateObjectBaseDialog = class(TDialog)
    ActionList: TActionList;
    CancelButton: TButton;
    CopyToClipboardAction: TAction;
    CopyToClipboardToolButton: TToolButton;
    ImageList: TImageList;
    OKAction: TAction;
    OKButton: TButton;
    PageControl: TBCPageControl;
    SaveAsToolButton: TToolButton;
    SaveToFileAction: TAction;
    SourcePanel: TPanel;
    SourceSynEdit: TSynEdit;
    SourceTabSheet: TTabSheet;
    SourceToolBar: TBCToolBar;
    SourceTopPanel: TPanel;
    SQLEditorAction: TAction;
    SQLEditorToolButton: TToolButton;
    SynSQLSyn: TSynSQLSyn;
    TopPanel: TPanel;
    procedure CopyToClipboardActionExecute(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure OKActionExecute(Sender: TObject);
    procedure OraScriptError(Sender: TObject; E: Exception; SQL: string; var Action: TErrorAction);
    procedure PageControlChange(Sender: TObject);
    procedure SaveToFileActionExecute(Sender: TObject);
    procedure SQLEditorActionExecute(Sender: TObject);
  private
    { Private declarations }
    function GetSQL: string;
  protected
    FObjectName: string;
    FOraSession: TOraSession;
    FSchemaParam: string;
    function CheckFields: Boolean; virtual;
    procedure CreateSQL; virtual;
    procedure Initialize; virtual;
  public
    { Public declarations }
    function ExecuteSQL: Boolean;
    function Open(OraSession: TOraSession; SchemaParam: string): Boolean; overload;
    function Open(OraSession: TOraSession; SchemaParam: string; ObjectName: string): Boolean; overload;
  end;

implementation

{$R *.dfm}

uses
  Main, OraScript, OraError, Lib, Vcl.Themes, BCCommon.StyleHooks, BCCommon.Messages;

procedure TCreateObjectBaseDialog.PageControlChange(Sender: TObject);
begin
  CreateSQL;
end;

procedure TCreateObjectBaseDialog.CopyToClipboardActionExecute(Sender: TObject);
begin
  Lib.CopyAllToClipboard(SourceSynEdit);
end;

procedure TCreateObjectBaseDialog.OKActionExecute(Sender: TObject);
begin
  if not CheckFields then
    Exit;
  ModalResult := mrOk;
end;

procedure TCreateObjectBaseDialog.SaveToFileActionExecute(Sender: TObject);
begin
  Lib.SaveSQL(Handle, SourceSynEdit);
end;

procedure TCreateObjectBaseDialog.SQLEditorActionExecute(Sender: TObject);
begin
  MainForm.LoadSQLIntoEditor(Format('%s@%s', [FOraSession.Schema, FOraSession.Server]), SourceSynEdit.Text);
  ModalResult := mrCancel;
end;

function TCreateObjectBaseDialog.CheckFields: Boolean;
begin
  Result := True;
end;

procedure TCreateObjectBaseDialog.Initialize;
begin
  SourceSynEdit.Text := '';
  PageControl.ActivePageIndex := 0;
  UpdateGutter(SourceSynEdit);
  UpdateSQLSynColors(SynSQLSyn);
  if Assigned(TStyleManager.ActiveStyle) then
    PageControl.DoubleBuffered := TStyleManager.ActiveStyle.Name = 'Windows';
end;

function TCreateObjectBaseDialog.Open(OraSession: TOraSession; SchemaParam: string): Boolean;
begin
  FOraSession := OraSession;
  Lib.SetSession(Self, OraSession);
  FSchemaParam := SchemaParam;

  Initialize;

  Result := ShowModal = mrOk;
end;

function TCreateObjectBaseDialog.Open(OraSession: TOraSession; SchemaParam: string; ObjectName: string): Boolean;
begin
  FObjectName := ObjectName;
  Result := Open(OraSession, SchemaParam);
end;

procedure TCreateObjectBaseDialog.CreateSQL;
begin
  ;
end;

function TCreateObjectBaseDialog.GetSQL: string;
begin
  CreateSQL;
  Result := SourceSynEdit.Text;
end;

procedure TCreateObjectBaseDialog.OraScriptError(Sender: TObject; E: Exception; SQL: string;
  var Action: TErrorAction);
begin
  ShowErrorMessage(E.Message);
  Action := eaFail;
end;

function TCreateObjectBaseDialog.ExecuteSQL: Boolean;
begin
  Result := True;
  with TOraScript.Create(nil) do
  try
    Session := FOraSession;
    SQL.Text := GetSQL;
    OnError := OraScriptError;
    try
      Execute;
    except
      on E: EOraError do
        Result := False;
    end;
  finally
    Free;
  end;
end;


procedure TCreateObjectBaseDialog.FormDestroy(Sender: TObject);
var
  i: Integer;
begin
  for i := 0 to ComponentCount - 1 do
    if (Components[i] is TOraQuery) then
      if TOraQuery(Components[i]).Active then
        TOraQuery(Components[i]).Close;
end;

end.
