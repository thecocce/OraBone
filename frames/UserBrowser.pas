unit UserBrowser;

interface

uses
  Winapi.Windows, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Ora,
  Vcl.Dialogs, BCControls.DBGrid, Vcl.ComCtrls, JvExComCtrls, JvComCtrls, DBAccess, MemDS, Vcl.ExtCtrls, Vcl.DBCtrls,
  Vcl.Buttons, Vcl.ActnList, BCControls.PageControl, Vcl.ImgList, SynEditHighlighter, SynHighlighterSQL, SynEdit,
  Vcl.AppEvnts, Vcl.Menus, VirtualTrees, Vcl.ToolWin, BCControls.ToolBar, Vcl.PlatformDefaultStyleActnCtrls,
  Vcl.ActnPopup, Data.DB, System.Actions, GridsEh, DBAxisGridsEh, DBGridEh, DBGridEhToolCtrls,
  DBGridEhGrouping, ToolCtrlsEh, BCCommon.Images, DynVarsEh;

type
  TUserBrowserFrame = class(TFrame)
    UserPageControl: TBCPageControl;
    InfoTabSheet: TTabSheet;
    UserPanel: TPanel;
    UserQuery: TOraQuery;
    UserDataSource: TOraDataSource;
    UsersDBGrid: TBCDBGrid;
    ActionList: TActionList;
    CustomizeAction: TAction;
    PageControlPopupActionBar: TPopupActionBar;
    CustomizePageControl1: TMenuItem;
    RolesTabSheet: TTabSheet;
    RolesQuery: TOraQuery;
    RolesPanel: TPanel;
    VirtualDrawTree: TVirtualDrawTree;
    SourceTabSheet: TTabSheet;
    SourcePanel: TPanel;
    SourceSynEdit: TSynEdit;
    SQLEditorAction: TAction;
    SynSQLSyn: TSynSQLSyn;
    PrivilegesQuery: TOraQuery;
    CopyToClipboardAction: TAction;
    SaveToFileAction: TAction;
    InfoButtonPanel: TPanel;
    InfoToolBar: TBCToolBar;
    ToolButton41: TToolButton;
    RefreshAction: TAction;
    RolesButtonPanel: TPanel;
    RolesToolBar: TBCToolBar;
    ToolButton3: TToolButton;
    SourceButtonPanel: TPanel;
    SourceToolBar: TBCToolBar;
    SQLEditorToolButton: TToolButton;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    procedure UserPageControlChange(Sender: TObject);
    procedure CustomizeActionExecute(Sender: TObject);
    procedure RolesQueryAfterOpen(DataSet: TDataSet);
    procedure VirtualDrawTreeFreeNode(Sender: TBaseVirtualTree; Node: PVirtualNode);
    procedure VirtualDrawTreeGetImageIndex(Sender: TBaseVirtualTree; Node: PVirtualNode;
      Kind: TVTImageKind; Column: TColumnIndex; var Ghosted: Boolean; var ImageIndex: Integer);
    procedure VirtualDrawTreeGetNodeWidth(Sender: TBaseVirtualTree; HintCanvas: TCanvas;
      Node: PVirtualNode; Column: TColumnIndex; var NodeWidth: Integer);
    procedure VirtualDrawTreeDrawNode(Sender: TBaseVirtualTree; const PaintInfo: TVTPaintInfo);
    procedure SQLEditorActionExecute(Sender: TObject);
    procedure VirtualDrawTreeInitNode(Sender: TBaseVirtualTree; ParentNode, Node: PVirtualNode;
      var InitialStates: TVirtualNodeInitStates);
    procedure VirtualDrawTreeInitChildren(Sender: TBaseVirtualTree; Node: PVirtualNode;
      var ChildCount: Cardinal);
    procedure CopyToClipboardActionExecute(Sender: TObject);
    procedure SaveToFileActionExecute(Sender: TObject);
    procedure RefreshActionExecute(Sender: TObject);
  private
    { Private declarations }
    FSession: TOraSession;
    FObjectName: string;
    FSchemaParam: string;
    procedure SetSession(OraSession: TOraSession);
    function GetActivePageQuery: TOraQuery;
    procedure SetObjectFrameAlign(Value: TAlign);
  public
    { Public declarations }
    constructor Create(AOwner: TComponent; ParentPanel: TPanel;
      OraSession: TOraSession; SchemaParam: string); reintroduce; overload;
    procedure OpenQuery(RefreshQuery: Boolean);
    property ObjectName: string write FObjectName;
    property SchemaParam: string read FSchemaParam write FSchemaParam;
    property ObjectFrameAlign: TAlign write SetObjectFrameAlign;
    procedure CopyToClipboard;
  end;

implementation

uses
  Main, CustomizePages, Lib, Vcl.Themes, BCCommon.Lib;

type
  PRoleRec = ^TRoleRec;
  TRoleRec = record
    Grantee: string;
    Grantor: string;
    Owner: string;
    ObjectName: string;
    GrantedRole: string;
    AdminOption: string;
    DefaultRole: string;
    ImageIndex: Byte;
  end;

{$R *.dfm}

constructor TUserBrowserFrame.Create(AOwner: TComponent; ParentPanel: TPanel;
  OraSession: TOraSession; SchemaParam: string);
begin
  inherited Create(AOwner);

  Visible := False;
  UserPageControl.TabIndex := 0;
  Parent := ParentPanel;
  SetSession(OraSession);
  FSchemaParam := SchemaParam;
end;

procedure TUserBrowserFrame.UserPageControlChange(Sender: TObject);
begin
  OpenQuery(False);
end;

procedure TUserBrowserFrame.VirtualDrawTreeDrawNode(Sender: TBaseVirtualTree;
  const PaintInfo: TVTPaintInfo);
var
  Data: PRoleRec;
  S: UnicodeString;
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
       Canvas.Font.Color := LStyles.GetStyleFontColor(sfMenuItemTextSelected);// GetSystemColor(clHighlightText);
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
    S := '';
    case Column of
      0: S := Data.GrantedRole;
      1: S := Data.AdminOption;
      2: S := Data.DefaultRole;
      3: S := Data.Grantee;
      4: S := Data.Grantor;
      5: S := Data.Owner;
      6: S := Data.ObjectName;
    end;

    if Length(S) > 0 then
    begin
      with R do
      begin
        if (NodeWidth - 2 * Margin) > (Right - Left) then
          S := ShortenString(Canvas.Handle, S, Right - Left);
      end;
      if (Column = 0) or ((Column >= 3) and (Column <= 6)) then
        Format := DT_TOP or DT_LEFT or DT_VCENTER or DT_SINGLELINE
      else
        Format := DT_TOP or DT_LEFT or DT_VCENTER or DT_CENTER or DT_SINGLELINE;
      DrawTextW(Canvas.Handle, PWideChar(S), Length(S), R, Format);
    end;

  end;
end;

procedure TUserBrowserFrame.VirtualDrawTreeFreeNode(Sender: TBaseVirtualTree; Node: PVirtualNode);
var
  Data: PRoleRec;
begin
  Data := Sender.GetNodeData(Node);
  Finalize(Data^);
end;

procedure TUserBrowserFrame.VirtualDrawTreeGetImageIndex(Sender: TBaseVirtualTree;
  Node: PVirtualNode; Kind: TVTImageKind; Column: TColumnIndex; var Ghosted: Boolean;
  var ImageIndex: Integer);
var
  Data: PRoleRec;
begin
  if Kind in [ikNormal, ikSelected] then
  begin
    Data := VirtualDrawTree.GetNodeData(Node);
    if Column = 0 then
      ImageIndex := Data.ImageIndex;
  end;
end;

procedure TUserBrowserFrame.VirtualDrawTreeGetNodeWidth(Sender: TBaseVirtualTree;
  HintCanvas: TCanvas; Node: PVirtualNode; Column: TColumnIndex; var NodeWidth: Integer);
var
  Data: PRoleRec;
  AMargin: Integer;
begin
  with Sender as TVirtualDrawTree do
  begin
    AMargin := TextMargin;
    Data := Sender.GetNodeData(Node);
    if Assigned(Data) then
    case Column of
      0: NodeWidth := Canvas.TextWidth(Data.GrantedRole) + 2 * AMargin;
      1: NodeWidth := Canvas.TextWidth(Data.AdminOption) + 2 * AMargin;
      2: NodeWidth := Canvas.TextWidth(Data.DefaultRole) + 2 * AMargin;
      3: NodeWidth := Canvas.TextWidth(Data.Grantee) + 2 * AMargin;
      4: NodeWidth := Canvas.TextWidth(Data.Grantor) + 2 * AMargin;
      5: NodeWidth := Canvas.TextWidth(Data.Owner) + 2 * AMargin;
      6: NodeWidth := Canvas.TextWidth(Data.ObjectName) + 2 * AMargin;
    end;
  end;
end;

procedure TUserBrowserFrame.VirtualDrawTreeInitChildren(Sender: TBaseVirtualTree;
  Node: PVirtualNode; var ChildCount: Cardinal);
var
  Data, ChildData: PRoleRec;
  ChildNode: PVirtualNode;
begin
  Data := VirtualDrawTree.GetNodeData(Node);
  if PrivilegesQuery.Locate('GRANTEE', Data.GrantedRole, []) then
  begin
    while not PrivilegesQuery.Eof and (PrivilegesQuery.FieldByName('GRANTEE').AsString = Data.GrantedRole) do
    begin
      ChildNode := VirtualDrawTree.AddChild(Node);
      ChildData := VirtualDrawTree.GetNodeData(ChildNode);
      ChildData.Grantee := PrivilegesQuery.FieldByName('GRANTEE').AsString;
      ChildData.GrantedRole := PrivilegesQuery.FieldByName('PRIVILEGE').AsString;
      ChildData.Grantor := PrivilegesQuery.FieldByName('GRANTOR').AsString;
      ChildData.Owner := PrivilegesQuery.FieldByName('OWNER').AsString;
      ChildData.ObjectName := PrivilegesQuery.FieldByName('TABLE_NAME').AsString;
      ChildData.ImageIndex := IMG_IDX_KEY;
      PrivilegesQuery.Next;
    end;
    ChildCount := VirtualDrawTree.ChildCount[Node];
  end;
end;

procedure TUserBrowserFrame.VirtualDrawTreeInitNode(Sender: TBaseVirtualTree; ParentNode,
  Node: PVirtualNode; var InitialStates: TVirtualNodeInitStates);
var
  Data: PRoleRec;
begin
  inherited;
  Data := VirtualDrawTree.GetNodeData(Node);
  if PrivilegesQuery.Active and PrivilegesQuery.Locate('GRANTEE', Data.GrantedRole, []) then
    Include(InitialStates, ivsHasChildren);
end;

procedure TUserBrowserFrame.SaveToFileActionExecute(Sender: TObject);
begin
  Lib.SaveSQL(Handle, SourceSynEdit);
end;

procedure TUserBrowserFrame.SetSession(OraSession: TOraSession);
var
  i: Integer;
begin
  FSession := OraSession;
  for i := 0 to ComponentCount - 1 do
    if Components[i] is TOraQuery then
      TOraQuery(Components[i]).Session := OraSession;
end;

procedure TUserBrowserFrame.SQLEditorActionExecute(Sender: TObject);
begin
  MainForm.LoadSQLIntoEditor(Format('%s@%s', [UserQuery.Session.Schema, UserQuery.Session.Server]), SourceSynEdit.Text);
end;

procedure TUserBrowserFrame.CopyToClipboardActionExecute(Sender: TObject);
begin
  CopyAllToClipboard(SourceSynEdit);
end;

procedure TUserBrowserFrame.CustomizeActionExecute(Sender: TObject);
begin
  CustomizePageControlDialog.Open(UserPageControl);
end;

function TUserBrowserFrame.GetActivePageQuery: TOraQuery;
begin
  Result := nil;
  if UserPageControl.ActivePage = InfoTabSheet then
    Result := UserQuery
  else
  if UserPageControl.ActivePage = RolesTabSheet then
    Result := RolesQuery
  else
  if UserPageControl.ActivePage = SourceTabSheet then
    Result := RolesQuery
end;

procedure TUserBrowserFrame.OpenQuery(RefreshQuery: Boolean);
var
  OraQuery: TOraQuery;
begin
  OraQuery := GetActivePageQuery;

  if Assigned(OraQuery) then
  begin
    if (not RefreshQuery) and OraQuery.Active and (OraQuery.ParamByName('P_OBJECT_NAME').AsWideString = FObjectName) then
      Exit;

    with OraQuery do
    begin
      Close;
      UnPrepare;
      ParamByName('P_OBJECT_NAME').AsWideString := FObjectName;
      Prepare;
      Open;
      Application.ProcessMessages;
      SetGridColumnWidths(UsersDBGrid)
    end;
  end;
end;

procedure TUserBrowserFrame.RefreshActionExecute(Sender: TObject);
begin
  OpenQuery(True);
end;

procedure TUserBrowserFrame.RolesQueryAfterOpen(DataSet: TDataSet);
var
 // Node: TTreeNode;
  GrantedRole, AdminOption: string;
  Parent: TList;
  Node: PVirtualNode;
  NodeData: PRoleRec;
begin
  with PrivilegesQuery do
  begin
    Close;
    UnPrepare;
    ParamByName('P_OBJECT_NAME').AsWideString := FObjectName;
    Prepare;
    Open;
  end;

  VirtualDrawTree.Clear;
  VirtualDrawTree.NodeDataSize := SizeOf(TRoleRec);
  VirtualDrawTree.BeginUpdate;
  SourceSynEdit.Lines.Clear;
  SourceSynEdit.Lines.BeginUpdate;
  SourceSynEdit.Lines.Text := 'CREATE USER ' + FObjectName + ' IDENTIFIED BY "<password>";' + CHR_ENTER + CHR_ENTER;

  Parent := TList.Create;
  try
    with RolesQuery do
    begin
      First;
      Parent.Add(nil);
      GrantedRole := '';
      while not Eof do
      begin
        { Role }
        Node := VirtualDrawTree.AddChild(Parent.Items[Parent.Count - 1]);
        NodeData := VirtualDrawTree.GetNodeData(Node);
        NodeData.Grantee := FieldByName('GRANTEE').AsString;
        NodeData.GrantedRole := FieldByName('GRANTED_ROLE').AsString;
        NodeData.AdminOption := FieldByName('ADMIN_OPTION').AsString;
        NodeData.DefaultRole := FieldByName('DEFAULT_ROLE').AsString;
        NodeData.ImageIndex := IMG_IDX_USER_CHILD; // role
        { Privilege }
       (* Grantee := NodeData.Grantee;
        if PrivilegesQuery.Locate('GRANTEE', Grantee, []) then
        begin
          while PrivilegesQuery.FieldByName('GRANTEE').AsString = Grantee do
          begin
            Node := VirtualDrawTree.AddChild(Parent.Items[Parent.Count - 1]);
            NodeData := VirtualDrawTree.GetNodeData(Node);
            NodeData.Grantee := PrivilegesQuery.FieldByName('PRIVILEGE').AsString;
            Next;
          end;
        end;  *)
        AdminOption := '';
        if FieldByName('ADMIN_OPTION').AsString = 'YES' then
          AdminOption := ' WITH ADMIN OPTION';

        if FieldByName('GRANTEE').AsString = FObjectName then
          SourceSynEdit.Lines.Text := SourceSynEdit.Lines.Text + 'GRANT ' + FieldByName('GRANTED_ROLE').AsString + ' TO ' + FObjectName + AdminOption + ';' + CHR_ENTER;

        GrantedRole := FieldByName('GRANTED_ROLE').AsString;
        Next;
        if GrantedRole = FieldByName('GRANTEE').AsString then
          Parent.Add(Node)
        else
        begin
          NodeData := VirtualDrawTree.GetNodeData(Parent.Items[Parent.Count - 1]);
          if Assigned(NodeData) then
            GrantedRole := NodeData.GrantedRole
          else
            GrantedRole := '';
          while (Parent.Count > 1) and (GrantedRole <> '') and (GrantedRole <> FieldByName('GRANTEE').AsString) do
          begin
            Parent.Delete(Parent.Count - 1);
            NodeData := VirtualDrawTree.GetNodeData(Parent.Items[Parent.Count - 1]);
            if Assigned(NodeData) then
              GrantedRole := NodeData.GrantedRole
            else
              GrantedRole := '';
          end;
        end;
      end;
      SourceSynEdit.Lines.Text := SourceSynEdit.Lines.Text + 'ALTER USER ' + FObjectName + ' DEFAULT ROLE ALL;';

      First;
    end;
  finally
    Parent.Free;
    VirtualDrawTree.EndUpdate;
    SourceSynEdit.Lines.Text := Trim(SourceSynEdit.Lines.Text);
    SourceSynEdit.Lines.EndUpdate;
  end;
end;

procedure TUserBrowserFrame.SetObjectFrameAlign(Value: TAlign);
begin
  InfoButtonPanel.Align := Value;
  RolesButtonPanel.Align := Value;
  SourceButtonPanel.Align := Value;
end;

procedure TUserBrowserFrame.CopyToClipboard;
begin
  SourceSynEdit.CopyToClipboard
end;

end.
