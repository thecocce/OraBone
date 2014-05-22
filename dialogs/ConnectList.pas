unit ConnectList;

interface

uses
  System.SysUtils, System.Classes, Vcl.Graphics, BCDialogs.Dlg, Vcl.Controls, Vcl.Forms, OdacVcl, Vcl.Dialogs, Vcl.Grids,
  JvExGrids, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ActnList, Vcl.ImgList, Vcl.ToolWin, Vcl.ActnMan, Vcl.ActnCtrls, Winapi.Windows,
  Vcl.PlatformDefaultStyleActnCtrls, Vcl.ComCtrls, BCControls.ImageList, System.Actions, VirtualTrees, Vcl.AppEvnts,
  Ora;

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

  TConnectListDialog = class(TDialog)
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
    procedure VirtualDrawTreeFreeNode(Sender: TBaseVirtualTree; Node: PVirtualNode);
    procedure VirtualDrawTreeGetNodeWidth(Sender: TBaseVirtualTree; HintCanvas: TCanvas; Node: PVirtualNode;
      Column: TColumnIndex; var NodeWidth: Integer);
    procedure FormCreate(Sender: TObject);
    procedure RadioButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    FOraSession: TOraSession;
    function GetConnectString(Data: PConnectData; IncludeHome: Boolean = False): string;
    procedure ReadIniFile;
    procedure SetNodeVisibility;
    procedure WriteConnectionsToIniFile;
    procedure WriteIniFile;
  public
    function Open(OraSession: TOraSession): Boolean;
  end;

function ConnectListDialog(AOwner: TComponent): TConnectListDialog;

implementation

{$R *.dfm}

uses
  OraError, BigIni, ConnectClient, ConnectDirect, BCCommon.FileUtils, BCCommon.Messages, BCCommon.StringUtils,
  BCCommon.Lib, Vcl.Themes, System.Types, BCCommon.StyleUtils;

const
  SECTION_CONNECTIONS = 'Connections';
  SECTION_CONNECTIONPROFILES = 'ConnectionProfiles';

var
  FConnectListDialog: TConnectListDialog;

function ConnectListDialog(AOwner: TComponent): TConnectListDialog;
begin
  if not Assigned(FConnectListDialog) then
    FConnectListDialog := TConnectListDialog.Create(AOwner);
  Result := FConnectListDialog;
  SetStyledFormSize(Result);
end;

procedure TConnectListDialog.AddConnectionActionExecute(Sender: TObject);
var
  Node: PVirtualNode;
  Data: PConnectData;
begin
  if ClientModeRadioButton.Checked then
    with ConnectClientDialog(Self) do
    try
      if Open(True) then
      begin
        Node := VirtualDrawTree.AddChild(nil);
        Data := VirtualDrawTree.GetNodeData(Node);
        Data.Profile := Profile;
        Data.Username := Username;
        Data.Password := Password;
        Data.Database := Database;
        Data.HomeName := HomeName;
        Data.ClientMode := True;
      end;
    finally
      Free;
    end;

  if DirectModeRadioButton.Checked then
    with ConnectDirectDialog(Self) do
    try
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
        Data.ClientMode := False;
      end;
    finally
      Free;
    end;
end;

function TConnectListDialog.GetConnectString(Data: PConnectData; IncludeHome: Boolean): string;
begin
  { Direct: Username/password@host:port:sid=sid/sn=service name
    Client: Username/password@database }
  Result := System.SysUtils.Format('%s/%s@', [Data.Username, Data.Password]);
  if Data.ClientMode then
  begin
    Result := Result + Data.Database;
    if IncludeHome then
      Result := Result + System.SysUtils.Format('^%s', [Data.HomeName]);
  end
  else
  begin
    Result := Result + System.SysUtils.Format('%s:%s:', [Data.Host, Data.Port]);
    if Data.SID <> '' then
      Result := Result + System.SysUtils.Format('sid=%s', [Data.SID]);
    if Data.ServiceName <> '' then
      Result := Result + System.SysUtils.Format('sn=%s', [Data.ServiceName]);
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

procedure TConnectListDialog.SetNodeVisibility;
var
  i: Integer;
  Node: PVirtualNode;
  Data: PConnectData;
begin
  Node := VirtualDrawTree.GetFirst;
  while Assigned(Node) do
  begin
    Data := VirtualDrawTree.GetNodeData(Node);
    VirtualDrawTree.IsVisible[Node] := ClientModeRadioButton.Checked and Data.ClientMode or
      DirectModeRadioButton.Checked and not Data.ClientMode;
    Node := VirtualDrawTree.GetNext(Node);
  end;
  if ClientModeRadioButton.Checked then
  begin
    for i := 0 to 3 do
      VirtualDrawTree.Header.Columns[i].Width := VirtualDrawTree.Width div 4;
    VirtualDrawTree.Header.Columns[3].Options := VirtualDrawTree.Header.Columns[3].Options + [coVisible]
  end
  else
  begin
    for i := 0 to 2 do
      VirtualDrawTree.Header.Columns[i].Width := VirtualDrawTree.Width div 3;
    VirtualDrawTree.Header.Columns[3].Options := VirtualDrawTree.Header.Columns[3].Options - [coVisible];
  end;
end;

procedure TConnectListDialog.RadioButtonClick(Sender: TObject);
begin
  SetNodeVisibility;
end;

procedure TConnectListDialog.ConnectActionExecute(Sender: TObject);
var
  ConnectString: string;
  Node: PVirtualNode;
  Data: PConnectData;
begin
  Node := VirtualDrawTree.GetFirstSelected;
  Data := VirtualDrawTree.GetNodeData(Node);
  ConnectString := GetConnectString(Data);
  if ConnectString <> '' then
  begin
    FOraSession.ConnectString := ConnectString;
    FOraSession.Schema := Data.Username; { What the fuck, Devart?!?!? }
    FOraSession.Options.Direct := not Data.ClientMode;
    {FConnectDialog.Session.HomeName := Data.HomeName;
    FConnectDialog.Session.Username := Data.Username;
    FConnectDialog.Session.Password := Data.Password;
    if Data.ClientMode then
      FConnectDialog.Session.Server := Data.Database
    else
    begin
      FConnectDialog.Session.Server := System.SysUtils.Format('%s:%s:', [Data.Host, Data.Port]);
      if Data.SID <> '' then
        FConnectDialog.Session.Server := FConnectDialog.Connection.Server + System.SysUtils.Format('sid=%s', [Data.SID]);
      if Data.ServiceName <> '' then
        FConnectDialog.Session.Server := FConnectDialog.Connection.Server + System.SysUtils.Format('sn=%s', [Data.ServiceName]);
    end; }

    //try
      //FOraSession.Connect;
      //ConnectDialog.Connection.PerformConnect(False);
      ModalResult := mrOk;
    {except
      on E: EOraError do
        Raise;
    end;}
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
    {}
    Node := VirtualDrawTree.GetFirst;
    while Assigned(Node) do
    begin
      VirtualDrawTree.DeleteNode(Node);
      Node := VirtualDrawTree.GetFirst;
    end;
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
      begin
        Data.HomeName := Copy(Data.Database, Pos('^', Data.Database) + 1, Length(Data.Database));
        Data.Database := Copy(Data.Database, 0, Pos('^', Data.Database) - 1);
      end;

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
    ConnectionProfile := System.SysUtils.Format(' ''%s''', [Data.Profile]);
  if AskYesOrNo(System.SysUtils.Format('Remove selected connection%s, are you sure?', [ConnectionProfile])) then
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
  try
    Profile := Data.Profile;
    Username := Data.Username;
    Password := Data.Password;
    Database := StringReplace(Data.Database, '.WORLD', '', [rfIgnoreCase]);
    HomeName := Data.HomeName;
    if Open(False) then
    begin
      Data.Profile := Profile;
      Data.Username := Username;
      Data.Password := Password;
      Data.Database := Database;
      Data.HomeName := HomeName;
    end;
  finally
    Free;
  end;

  if DirectModeRadioButton.Checked then
  with ConnectDirectDialog(Self) do
  try
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
  finally
    Free;
  end;
end;

procedure TConnectListDialog.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  WriteConnectionsToIniFile;
  WriteIniFile;
end;

procedure TConnectListDialog.FormCreate(Sender: TObject);
begin
  VirtualDrawTree.NodeDataSize := SizeOf(TConnectData);
end;

procedure TConnectListDialog.FormDestroy(Sender: TObject);
begin
  FConnectListDialog := nil;
end;

procedure TConnectListDialog.FormShow(Sender: TObject);
begin
  SetNodeVisibility;
end;

function TConnectListDialog.Open(OraSession: TOraSession): Boolean;
begin
  FOraSession := OraSession;
  ReadIniFile;
  Result := ShowModal = mrOk;
end;

procedure TConnectListDialog.VirtualDrawTreeCompareNodes(Sender: TBaseVirtualTree; Node1, Node2: PVirtualNode;
  Column: TColumnIndex; var Result: Integer);
var
  Data1, Data2: PConnectData;
  Value1, Value2: string;
begin
  {
  begin
    Data1 := VirtualDrawTree.GetNodeData(Node1);
    Data2 := VirtualDrawTree.GetNodeData(Node2);

    Result := -1;

    if not Assigned(Data1) or not Assigned(Data2) then
      Exit;

    Result := AnsiCompareText(string(Data1.Profile), string(Data2.Profile)) +
      AnsiCompareText(string(Data1.Username), string(Data2.Username));
  end; }
  Data1 := VirtualDrawTree.GetNodeData(Node1);
  Data2 := VirtualDrawTree.GetNodeData(Node2);

  case Column of
    0:
      begin
        Value1 := Data1.Profile;
        Value2 := Data2.Profile;
      end;
    1:
      begin
        Value1 := Data1.Username;
        Value2 := Data2.Username;
      end;
    2:
      begin
        Value1 := Data1.Database;
        Value2 := Data2.Database;
      end;
    3:
      begin
        Value1 := Data1.HomeName;
        Value2 := Data2.HomeName;
      end;
  end;

  if (Value1 = '') or (Value2 = '') then
    Exit;

  Result := AnsiCompareText(Value1, Value2);
end;

procedure TConnectListDialog.VirtualDrawTreeDblClick(Sender: TObject);
begin
  ConnectAction.Execute
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
      2:
        begin
          if Data.ClientMode then
            S := Data.Database
          else
          begin
            // host:port:sid=sid/sn=service name
            S := System.SysUtils.Format('%s:%s:', [Data.Host, Data.Port]);
            if Data.SID <> '' then
              S := S + System.SysUtils.Format('sid=%s', [Data.SID]);
            if Data.ServiceName <> '' then
              S := S + System.SysUtils.Format('sn=%s', [Data.ServiceName]);
          end;

        end;
      3: S := Data.Homename;
    end;

    if Length(S) > 0 then
    begin
      Format := DT_TOP or DT_LEFT or DT_VCENTER or DT_SINGLELINE;
      DrawText(Canvas.Handle, S, Length(S), R, Format);
    end;
  end;
end;

procedure TConnectListDialog.VirtualDrawTreeFreeNode(Sender: TBaseVirtualTree; Node: PVirtualNode);
var
  Data: PConnectData;
begin
  Data := VirtualDrawTree.GetNodeData(Node);
  Finalize(Data^);
  inherited;
end;

procedure TConnectListDialog.VirtualDrawTreeGetNodeWidth(Sender: TBaseVirtualTree; HintCanvas: TCanvas;
  Node: PVirtualNode; Column: TColumnIndex; var NodeWidth: Integer);
begin
  NodeWidth := VirtualDrawTree.Width
end;

initialization

  if not Assigned(GetClass('TConnectListDialog')) then
    System.Classes.RegisterClass(TConnectListDialog);

end.
