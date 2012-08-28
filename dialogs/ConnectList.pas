unit ConnectList;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, OdacVcl, Vcl.Dialogs, Vcl.Grids, JvExGrids, BCStringGrid, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.ActnList, Vcl.ImgList, Vcl.ToolWin, Vcl.ActnMan, Vcl.ActnCtrls,
  Vcl.PlatformDefaultStyleActnCtrls, Vcl.ComCtrls, JvExComCtrls, JvStatusBar, JvStringGrid,
  BCImageList;

type
  TConnectListDialog = class(TForm)
    TopPanel: TPanel;
    Label1: TLabel;
    ClientModeRadioButton: TRadioButton;
    DirectModeRadioButton: TRadioButton;
    StringGridPanel: TPanel;
    ClientConnectionsStringGrid: TBCStringGrid;
    ActionManager: TActionManager;
    ActionToolBar1: TActionToolBar;
    ImageList: TBCImageList;
    AddConnectionAction: TAction;
    RemoveConnectionAction: TAction;
    BottomPanel: TPanel;
    ConnectButton: TButton;
    CancelButton: TButton;
    ConnectAction: TAction;
    ModeClickAction: TAction;
    EditConnectionAction: TAction;
    JvStatusBar1: TJvStatusBar;
    Separator1Panel: TPanel;
    DirectConnectionsStringGrid: TBCStringGrid;
    procedure ConnectActionExecute(Sender: TObject);
    procedure ModeClickActionExecute(Sender: TObject);
    procedure AddConnectionActionExecute(Sender: TObject);
    procedure RemoveConnectionActionExecute(Sender: TObject);
    procedure EditConnectionActionExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    FConnectDialog: TConnectDialog;
    procedure DoInit;
    procedure DoConnect(StringGrid: TBCStringGrid);
    procedure SetConnectDialog(Value: TConnectDialog);
    procedure ReadIniFile;
    procedure WriteConnectionsToIniFile;
    procedure WriteIniFile;
    procedure ShowHideByMode;
    procedure SetFields(StringGrid: TBCStringGrid);
  public
    { Public declarations }
  published
    property ConnectDialog: TConnectDialog read FConnectDialog write SetConnectDialog;
  end;

implementation

{$R *.dfm}

uses
  OraError, BigIni, Common, ConnectClient, ConnectDirect;

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
    if ConnectClientDialog.Open(FConnectDialog) = mrOk then
    begin
      ClientConnectionsStringGrid.RowCount := ClientConnectionsStringGrid.RowCount + 1;

      ClientConnectionsStringGrid.Cells[GRID_COLUMN_USER, ClientConnectionsStringGrid.RowCount - 1] :=
        ConnectClientDialog.Username;
      ClientConnectionsStringGrid.Cells[GRID_COLUMN_DATABASE, ClientConnectionsStringGrid.RowCount - 1] :=
        ConnectClientDialog.Database;
      { Client: schema/password@database }
      ClientConnectionsStringGrid.Cells[GRID_COLUMN_CONNECTSTRING, ClientConnectionsStringGrid.RowCount - 1] :=
        ConnectClientDialog.Username + '/' + ConnectClientDialog.Password + '@' + ConnectClientDialog.Database;
      ClientConnectionsStringGrid.Cells[GRID_COLUMN_HOMENAME, ClientConnectionsStringGrid.RowCount - 1] := ConnectClientDialog.HomeName;
      ClientConnectionsStringGrid.SortGrid(0);
      WriteConnectionsToIniFile;
      ModalResult := mrOk;
    end;

  if DirectModeRadioButton.Checked then
    if ConnectDirectDialog.Open(FConnectDialog) = mrOk then
    begin
      DirectConnectionsStringGrid.RowCount := DirectConnectionsStringGrid.RowCount + 1;

      DirectConnectionsStringGrid.Cells[GRID_COLUMN_USER, DirectConnectionsStringGrid.RowCount - 1] :=
        ConnectDirectDialog.Username;
      { Direct: schema/password@host:port:sid=sid/sn=service name }
      Database := ConnectDirectDialog.Username + '/' + ConnectDirectDialog.Password + '@' +
        ConnectDirectDialog.Host + ':' + ConnectDirectDialog.Port + ':';
      if ConnectDirectDialog.SID <> '' then
      begin
        Database := Database + 'sid=' + ConnectDirectDialog.SID;
        DirectConnectionsStringGrid.Cells[GRID_COLUMN_DATABASE, DirectConnectionsStringGrid.RowCount - 1] :=
          ConnectDirectDialog.SID;
      end
      else
      begin
        Database := Database + 'sn=' + ConnectDirectDialog.ServiceName;
        DirectConnectionsStringGrid.Cells[GRID_COLUMN_DATABASE, DirectConnectionsStringGrid.RowCount - 1] :=
          ConnectDirectDialog.ServiceName;
      end;
      DirectConnectionsStringGrid.Cells[GRID_COLUMN_CONNECTSTRING, DirectConnectionsStringGrid.RowCount - 1] :=
        Database;
      DirectConnectionsStringGrid.SortGrid(0);
      WriteConnectionsToIniFile;
      ModalResult := mrOk;
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
    FConnectDialog.Session.Options.Direct := DirectModeRadioButton.Checked;
    FConnectDialog.Session.HomeName := StringGrid.Cells[GRID_COLUMN_HOMENAME, StringGrid.Row];
    try
      FConnectDialog.Connection.PerformConnect(False); //True);
      ModalResult := mrOk;
    except
      on E: EOraError do
        raise;
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
  with TBigIniFile.Create(Common.GetINIFilename) do
  try
    { Size }
    Width := ReadInteger('ConnectListSize', 'Width', 444);
    Height := ReadInteger('ConnectListSize', 'Height', 456);
    { Position }
    Left := ReadInteger('ConnectListPosition', 'Left', (Screen.Width - Width) div 2);
    Top := ReadInteger('ConnectListPosition', 'Top', (Screen.Height - Height) div 2);

    ReadSectionValues('Connections', Connections);
    for i := 0 to Connections.Count - 1 do
    begin
      ConnectString := Common.DecryptString(System.Copy(Connections.Strings[i], Pos('=', Connections.Strings[i]) + 1, Length(Connections.Strings[i])));
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

  if Common.AskYesOrNo(Format('Remove selected connection %s@%s, are you sure?', [
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
        BigIniFile.WriteString('Connections', IntToStr(Ident), Common.EncryptString(s));
        Inc(Ident);
      end;
  end;

begin
  BigIniFile := TBigIniFile.Create(Common.GetINIFilename);
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
  BigIniFile := TBigIniFile.Create(Common.GetINIFilename);
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
  begin
    i := ClientConnectionsStringGrid.Row;
    ConnectClientDialog.Username := ClientConnectionsStringGrid.Cells[GRID_COLUMN_USER, i];
    ConnectClientDialog.Database := ClientConnectionsStringGrid.Cells[GRID_COLUMN_DATABASE, i];
    s := ClientConnectionsStringGrid.Cells[GRID_COLUMN_CONNECTSTRING, i];
    s := Copy(s, Pos('/', s) + 1, Length(s));
    ConnectClientDialog.Password := Copy(s, 0, Pos('@', s) - 1);
    ConnectClientDialog.HomeName := ClientConnectionsStringGrid.Cells[GRID_COLUMN_HOMENAME, i];
    if ConnectClientDialog.Edit = mrOk then
    begin
      ClientConnectionsStringGrid.Cells[GRID_COLUMN_USER, i] := ConnectClientDialog.Username;
      ClientConnectionsStringGrid.Cells[GRID_COLUMN_DATABASE, i] := ConnectClientDialog.Database;
      { Client: schema/password@database }
      ClientConnectionsStringGrid.Cells[GRID_COLUMN_CONNECTSTRING, i] :=
        ConnectClientDialog.Username + '/' + ConnectClientDialog.Password + '@' + ConnectClientDialog.Database;
      ClientConnectionsStringGrid.Cells[GRID_COLUMN_HOMENAME, i] := ConnectClientDialog.HomeName;
      WriteIniFile;
    end;
  end;
  if DirectModeRadioButton.Checked then
  begin
    i := DirectConnectionsStringGrid.Row;
    ConnectDirectDialog.Username := DirectConnectionsStringGrid.Cells[GRID_COLUMN_USER, i];
    s := DirectConnectionsStringGrid.Cells[GRID_COLUMN_CONNECTSTRING, i];
    s := Copy(s, Pos('/', s) + 1, Length(s));
    ConnectDirectDialog.Password := Copy(s, 0, Pos('@', s) - 1);
    s := Copy(s, Pos('@', s) + 1, Length(s));
    ConnectDirectDialog.Host :=  Copy(s, 0, Pos(':', s) - 1);
    s := Copy(s, Pos(':', s) + 1, Length(s));
    ConnectDirectDialog.Port :=  Copy(s, 0, Pos(':', s) - 1);
    s := Copy(s, Pos(':', s) + 1, Length(s));
    if Pos('sid=', s) <> 0 then
      ConnectDirectDialog.SID := Copy(s, 5, Length(s));
    if Pos('sn=', s) <> 0 then
      ConnectDirectDialog.ServiceName := Copy(s, 4, Length(s));
    if ConnectDirectDialog.Edit = mrOk then
    begin
      DirectConnectionsStringGrid.Cells[GRID_COLUMN_USER, i] :=
        ConnectDirectDialog.Username;
      { Direct: schema/password@host:port:sid=sid/sn=service name }
      s := ConnectDirectDialog.Username + '/' + ConnectDirectDialog.Password + '@' +
        ConnectDirectDialog.Host + ':' + ConnectDirectDialog.Port + ':';
      if ConnectDirectDialog.SID <> '' then
      begin
        s := s + 'sid=' + ConnectDirectDialog.SID;
        DirectConnectionsStringGrid.Cells[GRID_COLUMN_DATABASE, i] := ConnectDirectDialog.SID;
      end
      else
      begin
        s := s + 'sn=' + ConnectDirectDialog.ServiceName;
        DirectConnectionsStringGrid.Cells[GRID_COLUMN_DATABASE, i] := ConnectDirectDialog.ServiceName;
      end;
      DirectConnectionsStringGrid.Cells[GRID_COLUMN_CONNECTSTRING, i] := s;
      WriteIniFile;
    end;
  end;
end;

procedure TConnectListDialog.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  WriteIniFile;
end;

procedure TConnectListDialog.ShowHideByMode;
//var
//  i: Integer;
begin
  ClientConnectionsStringGrid.Visible := ClientModeRadioButton.Checked;
  DirectConnectionsStringGrid.Visible := DirectModeRadioButton.Checked;
end;
  (*for i := 1 to ConnectionsStringGrid.RowCount - 1 do
  begin
    ConnectionsStringGrid.RowHeights[i] := 17; //ShowRow(i, 17);
    if ClientModeRadioButton.Checked then
    begin
      if (Pos(':', ConnectionsStringGrid.Cells[GRID_COLUMN_CONNECTSTRING, i]) <> 0) or
        (ConnectionsStringGrid.Cells[GRID_COLUMN_CONNECTSTRING, i] = '') then
      begin
        ConnectionsStringGrid.RowHeights[i] := 0; // HideRow(i);
      end
    end
    else
    if DirectModeRadioButton.Checked then
    begin
      if (Pos(':', ConnectionsStringGrid.Cells[GRID_COLUMN_CONNECTSTRING, i]) = 0) or
        (ConnectionsStringGrid.Cells[GRID_COLUMN_CONNECTSTRING, i] = '') then
      begin
        ConnectionsStringGrid.RowHeights[i] := 0; //HideRow(i);
      end;
    end
  end; *
end;   *)

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

  if GetClass('TConnectListDialog') = nil then
    System.Classes.RegisterClass(TConnectListDialog);

end.
