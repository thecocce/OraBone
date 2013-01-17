unit CreateObjectDialog;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms,
  Vcl.Dialogs, Ora, Vcl.ImgList, SynEditHighlighter, SynHighlighterSQL, ActnList, ComCtrls, ToolWin, Dlg,
  JvExComCtrls, JvToolBar, SynEdit, Vcl.ExtCtrls, Vcl.StdCtrls, JvComCtrls, BCPageControl,
  DAScript, BCToolBar;

type
  TCreateObjectBaseDialog = class(TDialog)
    ActionList: TActionList;
    OKAction: TAction;
    SQLEditorAction: TAction;
    CopyToClipboardAction: TAction;
    SaveToFileAction: TAction;
    SynSQLSyn: TSynSQLSyn;
    ImageList: TImageList;
    PageControl: TBCPageControl;
    OKButton: TButton;
    CancelButton: TButton;
    SourceTabSheet: TTabSheet;
    SourcePanel: TPanel;
    SourceSynEdit: TSynEdit;
    SourceTopPanel: TPanel;
    TopPanel: TPanel;
    SourceToolBar: TBCToolBar;
    SQLEditorToolButton: TToolButton;
    CopyToClipboardToolButton: TToolButton;
    SaveAsToolButton: TToolButton;
    procedure CopyToClipboardActionExecute(Sender: TObject);
    procedure OKActionExecute(Sender: TObject);
    procedure PageControlChange(Sender: TObject);
    procedure SaveToFileActionExecute(Sender: TObject);
    procedure SQLEditorActionExecute(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure OraScriptError(Sender: TObject; E: Exception; SQL: string;
      var Action: TErrorAction);
  private
    { Private declarations }
    function GetSQL: string;
  protected
    FObjectName: string;
    FOraSession: TOraSession;
    FSchemaParam: string;
    procedure CreateSQL; virtual;
    function CheckFields: Boolean; virtual;
    procedure Initialize; virtual;
  public
    { Public declarations }
    function Open(OraSession: TOraSession; SchemaParam: string): Boolean; overload;
    function Open(OraSession: TOraSession; SchemaParam: string; ObjectName: string): Boolean; overload;
    function ExecuteSQL: Boolean;
  end;

implementation

{$R *.dfm}

uses
  Common, Main, OraScript, OraError, Lib, Vcl.Themes, StyleHooks;

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
  Common.ShowErrorMessage(E.Message);
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

initialization

  TStyleManager.Engine.RegisterStyleHook(TCustomSynEdit, TSynEditStyleHook);

end.
