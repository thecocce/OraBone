unit ConnectList;

interface

uses
  System.SysUtils, System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, OdacVcl, Vcl.Dialogs, Vcl.Grids, JvExGrids,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ActnList, Vcl.ImgList, Vcl.ToolWin, Vcl.ActnMan, Vcl.ActnCtrls, Winapi.Windows,
  Vcl.PlatformDefaultStyleActnCtrls, Vcl.ComCtrls, BCControls.ImageList, System.Actions, VirtualTrees, Vcl.AppEvnts;

type
  PConnectData = ^TConnectData;
  TConnectData = record
    Profile: string;
    Username: string;
    Password: string;
    Database: string;
    HomeName: string;
    Host: string;
    Port: string;
    SID: string;
    ServiceName: string;
    ClientMode: Boolean;
  end;

  TConnectListDialog = class(TForm)
    ActionManager: TActionManager;
    ActionToolBar1: TActionToolBar;
    AddConnectionAction: TAction;
    BottomPanel: TPanel;
    CancelButton: TButton;
    ClientModeRadioButton: TRadioButton;
    ConnectAction: TAction;
    ConnectButton: TButton;
    DirectModeRadioButton: TRadioButton;
    EditConnectionAction: TAction;
    ImageList: TBCImageList;
    Label1: TLabel;
    ModeClickAction: TAction;
    RemoveConnectionAction: TAction;
    Separator1Panel: TPanel;
    StringGridPanel: TPanel;
    TopPanel: TPanel;
    VirtualDrawTree: TVirtualDrawTree;
    ApplicationEvents: TApplicationEvents;
    procedure AddConnectionActionExecute(Sender: TObject);
    procedure ConnectActionExecute(Sender: TObject);
    procedure EditConnectionActionExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RemoveConnectionActionExecute(Sender: TObject);
    procedure ApplicationEventsMessage(var Msg: tagMSG; var Handled: Boolean);
    procedure VirtualDrawTreeCompareNodes(Sender: TBaseVirtualTree; Node1, Node2: PVirtualNode; Column: TColumnIndex;
      var Result: Integer);
    procedure VirtualDrawTreeDblClick(Sender: TObject);
    procedure VirtualDrawTreeDrawNode(Sender: TBaseVirtualTree; const PaintInfo: TVTPaintInfo);
  private
    { Private declarations }
    FConnectDialog: TConnectDialog;
    function GetConnectString(Data: PConnectData; IncludeHome: Boolean = False): string;
    procedure ReadIniFile;
    procedure SetConnectDialog(Value: TConnectDialog);
    procedure WriteConnectionsToIniFile;
    procedure WriteIniFile;
  published
    property ConnectDialog: TConnectDialog read FConnectDialog write SetConnectDialog;
  end;

implementation

{$R *.dfm}

uses
  OraError, BigIni, ConnectClient, ConnectDirect, BCCommon.FileUtils, BCCommon.Messages, BCCommon.StringUtils,
  BCCommon.Lib, Vcl.Themes;

const
  SECTION_CONNECTIONS = 'Connections';
  SECTION_CONNECTIONPROFILES = 'ConnectionProfiles';

// VirtualTree.IsVisible[Node] := False;

procedure TConnectListDialog.AddConnectionActionExecute(Sender: TObject);
var
  Node: PVirtualNode;
  Data: PConnectData;
begin
  if ClientModeRadioButton.Checked then
    with ConnectClientDialog(Self) do
    if Open(True) then
    begin
      Node := VirtualDrawTree.AddChild(nil);
      Data := VirtualDrawTree.GetNodeData(Node);
      Data.Profile := Profile;
      Data.Username := Username;
      Data.Password := Password;
      Data.Database := Database;
      Data.HomeName := HomeName;
    end;

  if DirectModeRadioButton.Checked then
    with ConnectDirectDialog(Self) do
    if Open(True) then
    begin
      Node := VirtualDrawTree.AddChild(nil);
      Data := VirtualDrawTree.GetNodeData(Node);
      Data.Profile := Profile;
      Data.Username := Username;
      Data.Password := Password;
      Data.Host := Host;
      Data.Port := Port;
      if SID <> '' then
        Data.SID := SID
      else
        Data.ServiceName := ServiceName;
    end;
end;

function TConnectListDialog.GetConnectString(Data: PConnectData; IncludeHome: Boolean): string;
begin
  { Direct: Username/password@host:port:sid=sid/sn=service name
    Client: Username/password@database }
  Result := Format('%s/%s@', [Data.Username, Data.Password]);
  if Data.ClientMode then
  begin
    Result := Result + Data.Database;
    if IncludeHome then
      Result := Result + Format('^%s', [Data.HomeName]);
  end
  else
  begin
    Result := Result + Format('%s:%s:', [Data.Host, Data.Port]);
    if Data.SID <> '' then
      Result := Result + Format('sid=%s', [Data.SID]);
    if Data.ServiceName <> '' then
      Result := Result + Format('sn=%s', [Data.ServiceName]);
  end;
end;

procedure TConnectListDialog.ApplicationEventsMessage(var Msg: tagMSG; var Handled: Boolean);
var
  Node: PVirtualNode;
begin
  Node := VirtualDrawTree.GetFirstSelected;
  ConnectAction.Enabled := Assigned(Node);
  RemoveConnectionAction.Enabled := ConnectAction.Enabled;
  EditConnectionAction.Enabled := ConnectAction.Enabled;
end;

procedure TConnectListDialog.ConnectActionExecute(Sender: TObject);
var
  ConnectString: string;
  Node: PVirtualNode;
  Data: PConnectData;
begin
  Node := VirtualDrawTree.GetFirstSelected;
  Data := VirtualDrawTree.GetNodeData(Node);
  if ConnectString <> '' then
  begin
    FConnectDialog.Session.ConnectString := GetConnectString(Data);
    FConnectDialog.Session.Schema := FConnectDialog.Session.Username; { What the fuck, Devart?!?!? }
    FConnectDialog.Session.Options.Direct := not Data.ClientMode;
    FConnectDialog.Session.HomeName := Data.HomeName;
    try
      FConnectDialog.Connection.PerformConnect(False);
      ModalResult := mrOk;
    except
      on E: EOraError do
        Raise;
    end;
  end;
end;

procedure TConnectListDialog.ReadIniFile;
var
  i: Integer;
  s, Temp: string;
  Connections, ConnectionProfiles: TStrings;
  Node: PVirtualNode;
  Data: PConnectData;
begin
  Connections := TStringList.Create;
  ConnectionProfiles := TStringList.Create;
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
    ReadSectionValues(SECTION_CONNECTIONS, Connections);
    ReadSectionValues(SECTION_CONNECTIONPROFILES, ConnectionProfiles);
    for i := 0 to Connections.Count - 1 do
    begin
      Node := VirtualDrawTree.AddChild(nil);
      Data := VirtualDrawTree.GetNodeData(Node);
      s := DecryptString(System.Copy(Connections.Strings[i], Pos('=', Connections.Strings[i]) + 1, Length(Connections.Strings[i])));
      { Direct: Username/password@host:port:sid=sid/sn=service name
        Client: Username/password@database^homename }
      if i < ConnectionProfiles.Count then
        Data.Profile := System.Copy(ConnectionProfiles.Strings[i], Pos('=', ConnectionProfiles.Strings[i]) + 1, Length(ConnectionProfiles.Strings[i]));
      Data.Username := Copy(s, 0, Pos('/', s) - 1);
      Temp :=  Copy(s, 0, Pos('@', s) - 1);
      Data.Password := Copy(Temp, Pos('/', Temp) + 1, Length(Temp));
      Data.Database := Copy(s, Pos('@', s) + 1, Length(s));
      Data.ClientMode := Pos(':', s) = 0;
      if Pos('^', Data.Database) <> 0 then // client mode
        Data.HomeName := Copy(Data.Database, Pos('^', Data.Database) + 1, Length(Data.Database));

      if not Data.ClientMode then // direct mode
      begin
        Temp := Data.Database; // host:port:sid=sid/sn=service name
        Data.Host := Copy(Temp, 0, Pos(':', Temp) - 1);
        Temp := Copy(Temp, Pos(':', Temp) + 1, Length(Temp));
        Data.Port := Copy(Temp, 0, Pos(':', Temp) - 1);
        Temp := Copy(Temp, Pos(':', Temp) + 1, Length(Temp));

        if Pos('sid=', Temp) <> 0 then
          Data.Sid := Copy(Temp, Pos('sid=', Temp) + 4, Length(Temp));
        if Pos('sn=', Temp) <> 0 then
          Data.ServiceName := Copy(Temp, Pos('sn=', Temp) + 3, Length(Temp));

        Data.Database := '';
      end;
    end;
  finally
    Connections.Free;
    ConnectionProfiles.Free;
    Free;
  end;
end;

procedure TConnectListDialog.RemoveConnectionActionExecute(Sender: TObject);
var
  Node: PVirtualNode;
  Data: PConnectData;
  ConnectionProfile: string;
begin
  Node := VirtualDrawTree.GetFirstSelected;
  Data := VirtualDrawTree.GetNodeData(Node);
  ConnectionProfile := '';
  if Trim(Data.Profile) <> '' then
    ConnectionProfile := Format(' ''%s''', [Data.Profile]);
  if AskYesOrNo(Format('Remove selected connection%s, are you sure?', [ConnectionProfile])) then
    VirtualDrawTree.DeleteNode(Node);
end;

procedure TConnectListDialog.WriteConnectionsToIniFile;
var
  i: Integer;
  BigIniFile: TBigIniFile;
  Node: PVirtualNode;
  Data: PConnectData;
begin
  Node := VirtualDrawTree.GetFirst;
  BigIniFile := TBigIniFile.Create(GetINIFilename);
  with BigIniFile do
  try
    EraseSection(SECTION_CONNECTIONS);
    EraseSection(SECTION_CONNECTIONPROFILES);
    i := 0;
    while Assigned(Node) do
    begin
      Data := VirtualDrawTree.GetNodeData(Node);
      BigIniFile.WriteString(SECTION_CONNECTIONS, IntToStr(i), EncryptString(GetConnectString(Data, True)));
      BigIniFile.WriteString(SECTION_CONNECTIONPROFILES, IntToStr(i), Data.Profile);
      Node := VirtualDrawTree.GetNext(Node);
      Inc(i);
    end;
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

procedure TConnectListDialog.EditConnectionActionExecute(Sender: TObject);
var
  Node: PVirtualNode;
  Data: PConnectData;
begin
  Node := VirtualDrawTree.GetFirstSelected;
  Data := VirtualDrawTree.GetNodeData(Node);
  if ClientModeRadioButton.Checked then
  with ConnectClientDialog(Self) do
  begin
    Profile := Data.Profile;
    Username := Data.Username;
    Password := Data.Password;
    Database := Data.Database;
    HomeName := Data.HomeName;
    if Open(False) then
    begin
      Data.Profile := Profile;
      Data.Username := Username;
      Data.Password := Password;
      Data.Database := Database;
      Data.HomeName := HomeName;
    end;
  end;
  if DirectModeRadioButton.Checked then
  with ConnectDirectDialog(Self) do
  begin
    Profile := Data.Profile;
    Username := Data.Username;
    Password := Data.Password;
    Host := Data.Host;
    Port := Data.Port;
    SID := Data.SID;
    ServiceName := Data.ServiceName;
    if Open(False) then
    begin
      Data.Profile := Profile;
      Data.Username := Username;
      Data.Password := Password;
      Data.Host := Host;
      Data.Port := Port;
      Data.SID := SID;
      Data.ServiceName := ServiceName;
    end;
  end;
end;

procedure TConnectListDialog.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  WriteConnectionsToIniFile;
  WriteIniFile;
end;

procedure TConnectListDialog.SetConnectDialog(Value: TConnectDialog);
begin
  FConnectDialog := Value;
  ReadIniFile;
end;

procedure TConnectListDialog.VirtualDrawTreeCompareNodes(Sender: TBaseVirtualTree; Node1, Node2: PVirtualNode;
  Column: TColumnIndex; var Result: Integer);
var
  Data1, Data2: PConnectData;
begin
  if Result = 0 then
  begin
    Data1 := VirtualDrawTree.GetNodeData(Node1);
    Data2 := VirtualDrawTree.GetNodeData(Node2);

    Result := -1;

    if not Assigned(Data1) or not Assigned(Data2) then
      Exit;

    Result := AnsiCompareText(string(Data1.Profile), string(Data2.Profile)) +
      AnsiCompareText(string(Data1.Username), string(Data2.Username));
  end;
end;

procedure TConnectListDialog.VirtualDrawTreeDblClick(Sender: TObject);
begin
  EditConnectionAction.Execute
end;

procedure TConnectListDialog.VirtualDrawTreeDrawNode(Sender: TBaseVirtualTree; const PaintInfo: TVTPaintInfo);
var
  Data: PConnectData;
  S: string;
  R: TRect;
  Format: Cardinal;
  LStyles: TCustomStyleServices;
  LColor: TColor;
begin
  LStyles := StyleServices;
  with Sender as TVirtualDrawTree, PaintInfo do
  begin
    Data := Sender.GetNodeData(Node);

    if not Assigned(Data) then
      Exit;

    if not LStyles.GetElementColor(LStyles.GetElementDetails(tgCellNormal), ecTextColor, LColor) or  (LColor = clNone) then
      LColor := LStyles.GetSystemColor(clWindowText);
    //get and set the background color
    Canvas.Brush.Color := LStyles.GetStyleColor(scEdit);
    Canvas.Font.Color := LColor;

    if LStyles.Enabled and (vsSelected in PaintInfo.Node.States) then
    begin
       Colors.FocusedSelectionColor := LStyles.GetSystemColor(clHighlight);
       Colors.FocusedSelectionBorderColor := LStyles.GetSystemColor(clHighlight);
       Colors.UnfocusedSelectionColor := LStyles.GetSystemColor(clHighlight);
       Colors.UnfocusedSelectionBorderColor := LStyles.GetSystemColor(clHighlight);
       Canvas.Brush.Color := LStyles.GetSystemColor(clHighlight);
       Canvas.Font.Color := LStyles.GetStyleFontColor(sfMenuItemTextSelected);
    end
    else
    if not LStyles.Enabled and (vsSelected in PaintInfo.Node.States) then
    begin
      Canvas.Brush.Color := clHighlight;
      Canvas.Font.Color := clHighlightText;
    end;

    SetBKMode(Canvas.Handle, TRANSPARENT);

    R := ContentRect;
    InflateRect(R, -TextMargin, 0);
    Dec(R.Right);
    Dec(R.Bottom);

    case Column of
      0: S := Data.Profile;
      1: S := Data.Username;
      2: S := Data.Database;
      3: S := Data.Database;
    end;

    if Length(S) > 0 then
    begin
      Format := DT_TOP or DT_LEFT or DT_VCENTER or DT_SINGLELINE;
      DrawText(Canvas.Handle, S, Length(S), R, Format);
    end;
  end;
end;

initialization

  if not Assigned(GetClass('TConnectListDialog')) then
    System.Classes.RegisterClass(TConnectListDialog);

end.
