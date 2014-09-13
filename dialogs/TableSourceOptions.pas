unit TableSourceOptions;

interface

uses
  System.SysUtils, System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.ActnList, BCDialogs.Dlg, System.Actions, BCControls.CheckBox, JvExStdCtrls, JvCheckBox;

type
  TTableSourceOptionsDialog = class(TDialog)
    ActionList: TActionList;
    CancelButton: TButton;
    CommentsCheckBox: TBCCheckBox;
    ConstraintsCheckBox: TBCCheckBox;
    CreateTableCheckBox: TBCCheckBox;
    GrantsCheckBox: TBCCheckBox;
    IndexesCheckBox: TBCCheckBox;
    OKAction: TAction;
    OKButton: TButton;
    Panel1: TPanel;
    Panel2: TPanel;
    ParametersCheckBox: TBCCheckBox;
    Separator1Panel: TPanel;
    StorageCheckBox: TBCCheckBox;
    SynonymsCheckBox: TBCCheckBox;
    TriggersCheckBox: TBCCheckBox;
    procedure FormDestroy(Sender: TObject);
    procedure OKActionExecute(Sender: TObject);
  private
    { Private declarations }
    function GetComments: Boolean;
    function GetConstraints: Boolean;
    function GetCreateTable: Boolean;
    function GetGrants: Boolean;
    function GetIndexes: Boolean;
    function GetParameters: Boolean;
    function GetStorage: Boolean;
    function GetSynonyms: Boolean;
    function GetTriggers: Boolean;
    procedure ReadIniFile;
    procedure WriteIniFile;
  public
    { Public declarations }
    function Open: Boolean;
    property Comments: Boolean read GetComments;
    property Constraints: Boolean read GetConstraints;
    property CreateTable: Boolean read GetCreateTable;
    property Grants: Boolean read GetGrants;
    property Indexes: Boolean read GetIndexes;
    property Parameters: Boolean read GetParameters;
    property Storage: Boolean read GetStorage;
    property Synonyms: Boolean read GetSynonyms;
    property Triggers: Boolean read GetTriggers;
  end;

function TableSourceOptionsDialog: TTableSourceOptionsDialog;

implementation

{$R *.dfm}

uses
  BigIni, BCCommon.StyleUtils, BCCommon.FileUtils;

var
  FTableSourceOptionsDialog: TTableSourceOptionsDialog;

function TableSourceOptionsDialog: TTableSourceOptionsDialog;
begin
  if not Assigned(FTableSourceOptionsDialog) then
    Application.CreateForm(TTableSourceOptionsDialog, FTableSourceOptionsDialog);
  Result := FTableSourceOptionsDialog;
  FTableSourceOptionsDialog.ReadIniFile;
  SetStyledFormSize(Result);
end;

procedure TTableSourceOptionsDialog.FormDestroy(Sender: TObject);
begin
  FTableSourceOptionsDialog := nil;
end;

procedure TTableSourceOptionsDialog.OKActionExecute(Sender: TObject);
begin
  WriteIniFile;
  ModalResult := mrOk;
end;

function TTableSourceOptionsDialog.Open: Boolean;
begin
  Result := ShowModal = mrOk;
end;

procedure TTableSourceOptionsDialog.ReadIniFile;
var
  s: string;
begin
  with TBigIniFile.Create(GetINIFilename) do
  try
    s := ReadString('TableSource', 'Options', 'YYYYYYYNN');
    CreateTableCheckBox.Checked := s[1] = 'Y';
    CommentsCheckBox.Checked := s[2] = 'Y';
    IndexesCheckBox.Checked := s[3] = 'Y';
    ConstraintsCheckBox.Checked := s[4] = 'Y';
    TriggersCheckBox.Checked := s[5] = 'Y';
    SynonymsCheckBox.Checked := s[6] = 'Y';
    GrantsCheckBox.Checked := s[7] = 'Y';
    StorageCheckBox.Checked := s[8] = 'Y';
    ParametersCheckBox.Checked := s[9] = 'Y';
  finally
    Free;
  end;
end;

function TTableSourceOptionsDialog.GetCreateTable: Boolean;
begin
  Result := CreateTableCheckBox.Checked;
end;

function TTableSourceOptionsDialog.GetComments: Boolean;
begin
  Result := CommentsCheckBox.Checked;
end;

function TTableSourceOptionsDialog.GetIndexes: Boolean;
begin
  Result := IndexesCheckBox.Checked;
end;

function TTableSourceOptionsDialog.GetConstraints: Boolean;
begin
  Result := ConstraintsCheckBox.Checked;
end;

function TTableSourceOptionsDialog.GetTriggers: Boolean;
begin
  Result := TriggersCheckBox.Checked;
end;

function TTableSourceOptionsDialog.GetSynonyms: Boolean;
begin
  Result := SynonymsCheckBox.Checked;
end;

function TTableSourceOptionsDialog.GetGrants: Boolean;
begin
  Result := GrantsCheckBox.Checked;
end;

function TTableSourceOptionsDialog.GetStorage: Boolean;
begin
  Result := StorageCheckBox.Checked
end;

function TTableSourceOptionsDialog.GetParameters: Boolean;
begin
  Result := ParametersCheckBox.Checked
end;

procedure TTableSourceOptionsDialog.WriteIniFile;
var
  s: string;
begin
  with TBigIniFile.Create(GetINIFilename) do
  try
    s := 'YYYYYYYYY';
    if CreateTableCheckBox.Checked then
      s[1] := 'Y'
    else
      s[1] := 'N';
    if CommentsCheckBox.Checked then
      s[2] := 'Y'
    else
      s[2] := 'N';
    if IndexesCheckBox.Checked then
      s[3] := 'Y'
    else
      s[3] := 'N';
    if ConstraintsCheckBox.Checked then
      s[4] := 'Y'
    else
      s[4] := 'N';
    if TriggersCheckBox.Checked then
      s[5] := 'Y'
    else
      s[5] := 'N';
    if SynonymsCheckBox.Checked then
      s[6] := 'Y'
    else
      s[6] := 'N';
    if GrantsCheckBox.Checked then
      s[7] := 'Y'
    else
      s[7] := 'N';
    if StorageCheckBox.Checked then
      s[8] := 'Y'
    else
      s[8] := 'N';
    if ParametersCheckBox.Checked then
      s[9] := 'Y'
    else
      s[9] := 'N';
    WriteString('TableSource', 'Options', s);
  finally
    Free;
  end;
end;

end.
