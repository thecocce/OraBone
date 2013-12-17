unit ConnectList;

interface

uses
  System.SysUtils, System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, OdacVcl, Vcl.Dialogs, Vcl.Grids, JvExGrids,
  BCControls.StringGrid, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ActnList, Vcl.ImgList, Vcl.ToolWin, Vcl.ActnMan, Vcl.ActnCtrls,
  Vcl.PlatformDefaultStyleActnCtrls, Vcl.ComCtrls, JvStringGrid, BCControls.ImageList, System.Actions;

type
  TConnectListDialog = class(TForm)
    ActionManager: TActionManager;
    ActionToolBar1: TActionToolBar;
    AddConnectionAction: TAction;
    BottomPanel: TPanel;
    CancelButton: TButton;
    ClientConnectionsStringGrid: TBCStringGrid;
    ClientModeRadioButton: TRadioButton;
    ConnectAction: TAction;
    ConnectButton: TButton;
    DirectConnectionsStringGrid: TBCStringGrid;
    DirectModeRadioButton: TRadioButton;
    EditConnectionAction: TAction;
    ImageList: TBCImageList;
    Label1: TLabel;
    ModeClickAction: TAction;
    RemoveConnectionAction: TAction;
    Separator1Panel: TPanel;
    StringGridPanel: TPanel;
    TopPanel: TPanel;
    procedure AddConnectionActionExecute(Sender: TObject);
    procedure ConnectActionExecute(Sender: TObject);
    procedure EditConnectionActionExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ModeClickActionExecute(Sender: TObject);
    procedure RemoveConnectionActionExecute(Sender: TObject);
  private
    { Private declarations }
    FConnectDialog: TConnectDialog;
    procedure DoConnect(StringGrid: TBCStringGrid);
    procedure DoInit;
    procedure ReadIniFile;
    procedure SetConnectDialog(Value: TConnectDialog);
    procedure SetFields(StringGrid: TBCStringGrid);
    procedure ShowHideByMode;
    procedure WriteConnectionsToIniFile;
    procedure WriteIniFile;
  published
    property ConnectDialog: TConnectDialog read FConnectDialog write SetConnectDialog;
  end;

implementation

{$R *.dfm}

uses
  OraError, BigIni, ConnectClient, ConnectDirect, BCCommon.FileUtils, BCCommon.Messages, BCCommon.StringUtils,
  BCCommon.Lib;

const
  GRID_COLUMN_USER = 0;
  GRID_COLUMN_DATABASE = 1;
  GRID_COLUMN_CONNECTSTRING = 2;
  GRID_COLUMN_HOMENAME = 3;

procedure TConnectListDialog.AddConnectionActionExecute(Sender: TObject);
var
  Database: string;
begin
  if ClientModeRadioButton.Checked then
    with ConnectClientDialog(Self) do
    if Open(True) then
    begin
      ClientConnectionsStringGrid.RowCount := ClientConnectionsStringGrid.RowCount + 1;

      ClientConnectionsStringGrid.Cells[GRID_COLUMN_USER, ClientConnectionsStringGrid.RowCount - 1] :=
        Username;
      ClientConnectionsStringGrid.Cells[GRID_COLUMN_DATABASE, ClientConnectionsStringGrid.RowCount - 1] :=
        Database;
      { Client: schema/password@database }
      ClientConnectionsStringGrid.Cells[GRID_COLUMN_CONNECTSTRING, ClientConnectionsStringGrid.RowCount - 1] :=
        Username + '/' + Password + '@' + Database;
      ClientConnectionsStringGrid.Cells[GRID_COLUMN_HOMENAME, ClientConnectionsStringGrid.RowCount - 1] := HomeName;
      if ClientConnectionsStringGrid.RowCount > 2 then
        ClientConnectionsStringGrid.SortGrid(0);
      WriteConnectionsToIniFile;
    end;

  if DirectModeRadioButton.Checked then
    with ConnectDirectDialog(Self) do
    if Open(True) then
    begin
      DirectConnectionsStringGrid.RowCount := DirectConnectionsStringGrid.RowCount + 1;

      DirectConnectionsStringGrid.Cells[GRID_COLUMN_USER, DirectConnectionsStringGrid.RowCount - 1] :=
        Username;
      { Direct: schema/password@host:port:sid=sid/sn=service name }
      Database := Username + '/' + Password + '@' + Host + ':' + Port + ':';
      if SID <> '' then
      begin
        Database := Database + 'sid=' + SID;
        DirectConnectionsStringGrid.Cells[GRID_COLUMN_DATABASE, DirectConnectionsStringGrid.RowCount - 1] :=
          SID;
      end
      else
      begin
        Database := Database + 'sn=' + ServiceName;
        DirectConnectionsStringGrid.Cells[GRID_COLUMN_DATABASE, DirectConnectionsStringGrid.RowCount - 1] :=
          ServiceName;
      end;
      DirectConnectionsStringGrid.Cells[GRID_COLUMN_CONNECTSTRING, DirectConnectionsStringGrid.RowCount - 1] :=
        Database;
      if DirectConnectionsStringGrid.RowCount > 2 then
        DirectConnectionsStringGrid.SortGrid(0);
      WriteConnectionsToIniFile;
     // ModalResult := mrOk;
    end;
end;

procedure TConnectListDialog.ConnectActionExecute(Sender: TObject);
begin
  if ClientModeRadioButton.Checked then
    DoConnect(ClientConnectionsStringGrid)
  else
    DoConnect(DirectConnectionsStringGrid)
end;

procedure TConnectListDialog.DoConnect(StringGrid: TBCStringGrid);
var
  s, ConnectString: string;
begin
  ConnectString := Trim(StringGrid.Cells[GRID_COLUMN_CONNECTSTRING, StringGrid.Row]);
  if ConnectString <> '' then
  begin
    s := ConnectString;
    if Pos('^', ConnectString) <> 0 then
      s := Copy(s, 0, Pos('^', s) - 1);
    FConnectDialog.Session.ConnectString := s;
    FConnectDialog.Session.Schema := FConnectDialog.Session.Username; { What the fuck, Devart?!?!? }
    FConnectDialog.Session.Options.Direct := DirectModeRadioButton.Checked;
    FConnectDialog.Session.HomeName := StringGrid.Cells[GRID_COLUMN_HOMENAME, StringGrid.Row];
    try
      FConnectDialog.Connection.PerformConnect(False); //True);
      ModalResult := mrOk;
    except
      on E: EOraError do
        Raise;
    end;
  end;
end;

procedure TConnectListDialog.ReadIniFile;
var
  i, j: Integer;
  Connections: TStrings;
  ConnectString, Database, HomeName: string;
  ClientMode: Boolean;
  StringGrid: TBCStringGrid;
begin
  Connections := TStringList.Create;
  with TBigIniFile.Create(GetINIFilename) do
  try
    { Size }
    Width := ReadInteger('ConnectListSize', 'Width', 444);
    Height := ReadInteger('ConnectListSize', 'Height', 456);
    { Position }
    Left := ReadInteger('ConnectListPosition', 'Left', (Screen.Width - Width) div 2);
    Top := ReadInteger('ConnectListPosition', 'Top', (Screen.Height - Height) div 2);
    { Check if the form is outside the workarea }
    Left := SetFormInsideWorkArea(Left, Width);
    ReadSectionValues('Connections', Connections);
    for i := 0 to Connections.Count - 1 do
    begin
      ConnectString := DecryptString(System.Copy(Connections.Strings[i], Pos('=', Connections.Strings[i]) + 1, Length(Connections.Strings[i])));
      { Direct: schema/password@host:port:sid=sid/sn=service name
        Client: schema/password@database^homename }
      Database := Copy(ConnectString, Pos('@', ConnectString) + 1, Length(ConnectString));
      ClientMode := Pos(':', Database) = 0;
      if Pos('^', Database) <> 0 then // client mode
        Database := Copy(Database, 0, Pos('^', Database) - 1);

      if not ClientMode then // direct mode
      begin
        if Pos('sid=', Database) <> 0 then
          Database := Copy(Database, Pos('sid=', Database) + 4, Length(Database));
        if Pos('sn=', Database) <> 0 then
          Database := Copy(Database, Pos('sn=', Database) + 3, Length(Database));
      end;

      HomeName := '';
      if Pos('^', Database) <> 0 then // client mode
        HomeName := Copy(ConnectString, Pos('^', ConnectString) + 1, Length(ConnectString));

      if ClientMode then
        StringGrid := ClientConnectionsStringGrid
      else
        StringGrid := DirectConnectionsStringGrid;

      j := StringGrid.RowCount;
      StringGrid.Cells[GRID_COLUMN_USER, j - 1] := Copy(ConnectString, 0, Pos('/', ConnectString) - 1);
      StringGrid.Cells[GRID_COLUMN_DATABASE, j - 1] := Database;
      StringGrid.Cells[GRID_COLUMN_CONNECTSTRING, j - 1] := ConnectString;
      if HomeName <> '' then
        StringGrid.Cells[GRID_COLUMN_HOMENAME, j - 1] := HomeName;

      //if i < Connections.Count then
      StringGrid.RowCount := j + 1;
    end;
    ClientConnectionsStringGrid.RemoveRow(ClientConnectionsStringGrid.RowCount);
    DirectConnectionsStringGrid.RemoveRow(DirectConnectionsStringGrid.RowCount);
  finally
    Connections.Free;
    Free;
  end;
end;

procedure TConnectListDialog.RemoveConnectionActionExecute(Sender: TObject);
var
  StringGrid: TBCStringGrid;
begin
  if ClientModeRadioButton.Checked then
    StringGrid := ClientConnectionsStringGrid
  else
    StringGrid := DirectConnectionsStringGrid;

  if AskYesOrNo(Format('Remove selected connection %s@%s, are you sure?', [
    StringGrid.Cells[GRID_COLUMN_USER, StringGrid.Row], StringGrid.Cells[GRID_COLUMN_DATABASE, StringGrid.Row]])) then
  begin
    StringGrid.RemoveRow(StringGrid.Row);
    //ShowHideByMode;
    if ClientModeRadioButton.Checked then
      SetFields(ClientConnectionsStringGrid)
    else
      SetFields(DirectConnectionsStringGrid);
    WriteConnectionsToIniFile;
  end;
end;

procedure TConnectListDialog.WriteConnectionsToIniFile;
var
  Ident: Integer;
  BigIniFile: TBigIniFile;

  procedure WriteGrid(StringGrid: TBCStringGrid);
  var
    i: Integer;
    s: string;
  begin
    for i := 1 to StringGrid.RowCount - 1 do
      if StringGrid.Cells[GRID_COLUMN_CONNECTSTRING, i] <> '' then
      begin
        s := StringGrid.Cells[GRID_COLUMN_CONNECTSTRING, i];
        { remove homename }
        if Pos('^', s) <> 0 then
          s := Copy(s, 0, Pos('^', s) - 1);
        { add homename }
        if StringGrid.Cells[GRID_COLUMN_HOMENAME, i] <> '' then
          s := s + '^' + StringGrid.Cells[GRID_COLUMN_HOMENAME, i];
        BigIniFile.WriteString('Connections', IntToStr(Ident), EncryptString(s));
        Inc(Ident);
      end;
  end;

begin
  BigIniFile := TBigIniFile.Create(GetINIFilename);
  with BigIniFile do
  try
    EraseSection('Connections');
    Ident := 0;
    WriteGrid(ClientConnectionsStringGrid);
    WriteGrid(DirectConnectionsStringGrid);
  finally
    BigIniFile.Free;
  end;
end;

procedure TConnectListDialog.WriteIniFile;
var
  BigIniFile: TBigIniFile;
begin
  BigIniFile := TBigIniFile.Create(GetINIFilename);
  with BigIniFile do
  try
    if Windowstate = wsNormal then
    begin
      { Position }
      WriteInteger('ConnectListPosition', 'Left', Left);
      WriteInteger('ConnectListPosition', 'Top', Top);
      { Size }
      WriteInteger('ConnectListSize', 'Width', Width);
      WriteInteger('ConnectListSize', 'Height', Height);
    end;
  finally
    BigIniFile.Free;
  end;
end;

procedure TConnectListDialog.SetFields(StringGrid: TBCStringGrid);
begin
  StringGrid.Cells[GRID_COLUMN_USER, 0] := 'User';
  StringGrid.Cells[GRID_COLUMN_DATABASE, 0] := 'Database';
  StringGrid.Cells[GRID_COLUMN_HOMENAME, 0] := 'Home';
  StringGrid.HideCol(GRID_COLUMN_CONNECTSTRING);

  if ClientModeRadioButton.Checked then
  begin
    StringGrid.ShowCol(GRID_COLUMN_HOMENAME, 17);
    StringGrid.ColWidths[GRID_COLUMN_HOMENAME] := 130;
  end
  else
    StringGrid.HideCol(GRID_COLUMN_HOMENAME);

  ConnectAction.Enabled := StringGrid.Cells[GRID_COLUMN_USER, 1] <> '';
  RemoveConnectionAction.Enabled := ConnectAction.Enabled;
  EditConnectionAction.Enabled := ConnectAction.Enabled;
end;

procedure TConnectListDialog.DoInit;
begin
  ReadIniFile;
  if ClientModeRadioButton.Checked then
    SetFields(ClientConnectionsStringGrid)
  else
    SetFields(DirectConnectionsStringGrid);
  ShowHideByMode;
end;

procedure TConnectListDialog.EditConnectionActionExecute(Sender: TObject);
var
  i: Integer;
  s: string;
begin
  if ClientModeRadioButton.Checked then
  with ConnectClientDialog(Self) do
  begin
    i := ClientConnectionsStringGrid.Row;
    Username := ClientConnectionsStringGrid.Cells[GRID_COLUMN_USER, i];
    Database := ClientConnectionsStringGrid.Cells[GRID_COLUMN_DATABASE, i];
    s := ClientConnectionsStringGrid.Cells[GRID_COLUMN_CONNECTSTRING, i];
    s := Copy(s, Pos('/', s) + 1, Length(s));
    Password := Copy(s, 0, Pos('@', s) - 1);
    HomeName := ClientConnectionsStringGrid.Cells[GRID_COLUMN_HOMENAME, i];
    if Open(False) then
    begin
      ClientConnectionsStringGrid.Cells[GRID_COLUMN_USER, i] := Username;
      ClientConnectionsStringGrid.Cells[GRID_COLUMN_DATABASE, i] := Database;
      { Client: schema/password@database }
      ClientConnectionsStringGrid.Cells[GRID_COLUMN_CONNECTSTRING, i] := Username + '/' + Password + '@' + Database;
      ClientConnectionsStringGrid.Cells[GRID_COLUMN_HOMENAME, i] := HomeName;
      WriteConnectionsToIniFile;
    end;
  end;
  if DirectModeRadioButton.Checked then
  with ConnectDirectDialog(Self) do
  begin
    i := DirectConnectionsStringGrid.Row;
    Username := DirectConnectionsStringGrid.Cells[GRID_COLUMN_USER, i];
    s := DirectConnectionsStringGrid.Cells[GRID_COLUMN_CONNECTSTRING, i];
    s := Copy(s, Pos('/', s) + 1, Length(s));
    Password := Copy(s, 0, Pos('@', s) - 1);
    s := Copy(s, Pos('@', s) + 1, Length(s));
    Host :=  Copy(s, 0, Pos(':', s) - 1);
    s := Copy(s, Pos(':', s) + 1, Length(s));
    Port :=  Copy(s, 0, Pos(':', s) - 1);
    s := Copy(s, Pos(':', s) + 1, Length(s));
    if Pos('sid=', s) <> 0 then
      SID := Copy(s, 5, Length(s));
    if Pos('sn=', s) <> 0 then
      ServiceName := Copy(s, 4, Length(s));
    if Open(False) then
    begin
      DirectConnectionsStringGrid.Cells[GRID_COLUMN_USER, i] :=
        Username;
      { Direct: schema/password@host:port:sid=sid/sn=service name }
      s := Username + '/' + Password + '@' + Host + ':' + Port + ':';
      if ConnectDirectDialog(Self).SID <> '' then
      begin
        s := s + 'sid=' + SID;
        DirectConnectionsStringGrid.Cells[GRID_COLUMN_DATABASE, i] := SID;
      end
      else
      begin
        s := s + 'sn=' + ServiceName;
        DirectConnectionsStringGrid.Cells[GRID_COLUMN_DATABASE, i] := ServiceName;
      end;
      DirectConnectionsStringGrid.Cells[GRID_COLUMN_CONNECTSTRING, i] := s;
      WriteConnectionsToIniFile;
    end;
  end;
end;

procedure TConnectListDialog.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  WriteIniFile;
end;

procedure TConnectListDialog.ShowHideByMode;
begin
  ClientConnectionsStringGrid.Visible := ClientModeRadioButton.Checked;
  DirectConnectionsStringGrid.Visible := DirectModeRadioButton.Checked;
end;

procedure TConnectListDialog.ModeClickActionExecute(Sender: TObject);
begin
  ShowHideByMode;
  if ClientModeRadioButton.Checked then
    SetFields(ClientConnectionsStringGrid)
  else
    SetFields(DirectConnectionsStringGrid)
end;

procedure TConnectListDialog.SetConnectDialog(Value: TConnectDialog);
begin
  FConnectDialog := Value;
  DoInit;
end;

initialization

  if not Assigned(GetClass('TConnectListDialog')) then
    System.Classes.RegisterClass(TConnectListDialog);

end.
