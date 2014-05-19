unit ObjectTree;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics, Vcl.Controls,
  Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.ImgList, DBAccess, MemData, OdacVcl, DB, Ora, MemDS, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.ToolWin, Vcl.ActnList, JvStringHolder, VirtualTrees, BCControls.Edit, BCControls.ComboBox,
  BCControls.ToolBar, Vcl.Themes, System.Actions, BCCommon.Images, OraCall;

const
  { Tree texts }
  TEXT_ZERO_OBJECTS = '[0]';
  TEXT_COUNT = ' [%d]';
  TEXT_TABLES = 'Tables';
  TEXT_VIEWS = 'Views';
  TEXT_FUNCTIONS = 'Functions';
  TEXT_PACKAGES = 'Packages';
  TEXT_PROCEDURES = 'Procedures';
  TEXT_CONSTRAINTS = 'Constraints';
  TEXT_INDEXES = 'Indexes';
  TEXT_SYNONYMS = 'Synonyms';
  TEXT_TRIGGERS = 'Triggers';
  TEXT_SEQUENCES = 'Sequences';
  TEXT_DBLINKS = 'DB Links';
  TEXT_INVALID_OBJECTS = 'Invalid Objects';
  TEXT_RECYCLE_BIN = 'Recycle Bin';
  TEXT_USERS = 'Users';
  TEXT_IS_TRUE = '=True';

type
  (*TRootNodeData = class
    RootText: string;
    RootType: string;
  end; *)

  PObjectNodeRec = ^TObjectNodeRec;
  TObjectNodeRec = record
    Level: Byte;
    NodeText: string;
    NodeType: string;
    ImageIndex: Byte;
    StateIndex: Byte;
    { Package specification and body }
    SourceType: string;
    CaretX, CaretY: Integer;
  end;

  TObjectTreeFrame = class(TFrame)
    ObjectsQuery: TOraQuery;
    InvalidObjectsQuery: TOraQuery;
    RecycleBinQuery: TOraQuery;
    SchemasQuery: TOraQuery;
    BottomPanel: TPanel;
    ActionList: TActionList;
    SchemaFilterAction: TAction;
    ComboPanel: TPanel;
    SchemaComboBox: TBCComboBox;
    UsersQuery: TOraQuery;
    VirtualDrawTree: TVirtualDrawTree;
    FilterToolBar: TBCToolBar;
    FilterToolButton: TToolButton;
    OraSession: TOraSession;
    procedure SchemaComboBoxKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure SchemaFilterActionExecute(Sender: TObject);
    procedure OraSessionConnectionLost(Sender: TObject; Component: TComponent;
      ConnLostCause: TConnLostCause; var RetryMode: TRetryMode);
    procedure VirtualDrawTreeDrawNode(Sender: TBaseVirtualTree; const PaintInfo: TVTPaintInfo);
    procedure VirtualDrawTreeFreeNode(Sender: TBaseVirtualTree; Node: PVirtualNode);
    procedure VirtualDrawTreeGetNodeWidth(Sender: TBaseVirtualTree; HintCanvas: TCanvas;
      Node: PVirtualNode; Column: TColumnIndex; var NodeWidth: Integer);
    procedure VirtualDrawTreeCreateEditor(Sender: TBaseVirtualTree; Node: PVirtualNode;
      Column: TColumnIndex; out EditLink: IVTEditLink);
    procedure VirtualDrawTreeGetImageIndex(Sender: TBaseVirtualTree; Node: PVirtualNode;
      Kind: TVTImageKind; Column: TColumnIndex; var Ghosted: Boolean; var ImageIndex: Integer);
    procedure SchemaComboBoxChange(Sender: TObject);
    procedure SchemaComboBoxDrawItem(Control: TWinControl; Index: Integer; Rect: TRect;
      State: TOwnerDrawState);
    procedure VirtualDrawTreeInitChildren(Sender: TBaseVirtualTree; Node: PVirtualNode;
      var ChildCount: Cardinal);
    procedure VirtualDrawTreeInitNode(Sender: TBaseVirtualTree; ParentNode, Node: PVirtualNode;
      var InitialStates: TVirtualNodeInitStates);
  private
    { Private declarations }
    FSchemaParam: string;
    //OraSession: TOraSession;
    FObjectName, FObjectType: string;
    FTreeObjects: TStrings;
    FUpdatingSchema: Boolean;
    FFilterObjects: array [0..11] of string;
    procedure ClearTree;
    function InitSession(ConnectString: string = ''): Boolean;
    procedure CreateConnectionTree;
    procedure AddObjects;
    procedure AddInvalidObjects;
    procedure AddUsers;
    procedure AddRecycleBin;
    function AddNode(Query: TOraQuery; ImageIndexes: array of Byte; NodeType: string; NodeText: string): PVirtualNode;
    procedure LoadSchemas;
    procedure SetSchemaParam(Value: string);
    function GetSchemaFilters(SchemaName: string): string;
    procedure ReadIniFile;
    procedure WriteIniFile;
    function GetObjectsSQL: string;
  public
    { Public declarations }
    CurrentFilters: array [0..11] of string;
    constructor Create(AOwner: TComponent); override;
    function Connect(ConnectString: string = ''): Boolean;
    procedure Disconnect;
    procedure Refresh;
    function GetSchemaName: string;
    function GetConnectString: string;
    //function GetSchemaItems: TStringList;
    function GetSelectedObjectText: string;
    function GetSelectedObjectName: string;
    function GetSelectedObjectParentText: string;
    function GetSelectedObjectType: string;
    function GetSelectedObjectStateIndex: Byte;
    function GetSelectedLevel: Byte;
    function GetOraSession: TOraSession;
    property Session: TOraSession read GetOraSession;
    property SchemaParam: string read FSchemaParam write SetSchemaParam;
    property ObjectName: string read FObjectName write FObjectName;
    property ObjectType: string read FObjectType write FObjectType;
    function SetObjectTypeAndName{(Sender: TObject)}: Boolean;
    procedure SetObjectFilter(Name: string; ObjectType: string);
    procedure SetCurrentFilter(Name: string; ObjectType: string);
  end;

  TEditLink = class(TInterfacedObject, IVTEditLink)
  private
    FEdit: TBCEdit;        // One of the property editor System.Classes.
    FTree: TVirtualDrawTree; // A back reference to the tree calling.
    FNode: PVirtualNode;       // The node being edited.
    FColumn: Integer;          // The column of the node being edited.
    OraSession: TOraSession;
    FSchemaParam: string;
    procedure RenameObject(Data: PObjectNodeRec; NewName: string);
  protected
    procedure EditKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  public
    destructor Destroy; override;

    function BeginEdit: Boolean; stdcall;
    function CancelEdit: Boolean; stdcall;
    function EndEdit: Boolean; stdcall;
    function GetBounds: TRect; stdcall;
    function PrepareEdit(Tree: TBaseVirtualTree; Node: PVirtualNode; Column: TColumnIndex): Boolean; stdcall;
    procedure ProcessMessage(var Message: TMessage); stdcall;
    procedure SetBounds(R: TRect); stdcall;
    //property OraSession: TOraSession read OraSession write OraSession;
    property SchemaParam: string write FSchemaParam;
  end;

implementation

{$R *.dfm}

uses
  BCCommon.OptionsContainer, Lib, BigIni, SchemaFilter, DataModule, BCSQL.Tokenizer, System.StrUtils,
  BCCommon.FileUtils, BCCommon.StringUtils, BCCommon.Messages, ConnectList;

constructor TObjectTreeFrame.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FUpdatingSchema := False;
  VirtualDrawTree.NodeDataSize := SizeOf(TObjectNodeRec);
end;

procedure TObjectTreeFrame.ClearTree;
begin
  VirtualDrawTree.Clear;
end;

function TObjectTreeFrame.InitSession(ConnectString: string): Boolean;
var
  s: string;
begin
  Result := True;
  if ConnectString = '' then
  begin
    if not ConnectListDialog(Self).Open(OraSession) then
      Exit(False);
  end
  else
  begin
    s := ConnectString;
    if Pos('^', s) <> 0 then
      s := Copy(s, 0, Pos('^', s) - 1);
    OraSession.ConnectString := s;
  end;

  OraSession.ConnectPrompt := False;
  OraSession.Options.Direct := Pos('Direct=True', OraSession.ConnectString) <> 0;
  if Pos('^', OraSession.ConnectString) <> 0 then
    OraSession.HomeName := Copy(OraSession.ConnectString, Pos('^', OraSession.ConnectString) + 1, Length(OraSession.ConnectString));
  OraSession.Options.DateFormat := OptionsContainer.DateFormat;
  OraSession.Options.UseUnicode := True;
  OraSession.Options.UnicodeEnvironment := True;
end;

function TObjectTreeFrame.GetSchemaFilters(SchemaName: string): string;
var
  i: Integer;
  SchemaFilters: TStrings;
begin
  Result := '';
  { Read SchemaFilter from ini - Schema@server=schema;schema;...}
  SchemaFilters := TStringList.Create;
  //Screen.Cursor := crHourglass;
  with TBigIniFile.Create(GetINIFilename) do
  try
    { read string }
    ReadSectionValues('SchemaFilters', SchemaFilters);
    for i := 0 to SchemaFilters.Count - 1 do
      if SchemaName = DecryptString(System.Copy(SchemaFilters.Strings[i], 0, Pos('=', SchemaFilters.Strings[i]) - 1)) then
      begin
        //Result := DecryptString(ReadString('SchemaFilters', System.Copy(SchemaFilters.Strings[i], 0, Pos('=', SchemaFilters.Strings[i]) - 1), ''));
        Result := DecryptString(System.Copy(SchemaFilters.Strings[i], Pos('=', SchemaFilters.Strings[i]) + 1, Length(SchemaFilters.Strings[i])));
        Break;
      end;
  finally
    SchemaFilters.Free;
    Free;
    //Screen.Cursor := crDefault;
  end;
end;

procedure TObjectTreeFrame.LoadSchemas;
var
  FilterLength: Integer;
  SchemaFilters: string;
  SchemaName: string;
  Schema: string;
begin
  //Screen.Cursor := crSQLWait;
  SchemaName := GetSchemaName;
  SchemaFilters := GetSchemaFilters(SchemaName);
  FilterLength := Length(SchemaFilters);

  if SchemaFilters <> '' then
    FilterToolButton.ImageIndex := IMG_IDX_FILTER_EDIT
  else
  begin
    SchemaFilters := '''''';
    FilterToolButton.ImageIndex := IMG_IDX_FILTER_ADD;
  end;

  with SchemasQuery do
  begin
    SQL.Clear;
    SQL.Add(Format(DM.StringHolder.StringsByName['SchemasSQL'].Text, [SchemaFilters, FilterLength]));
    Open;
    while SchemasQuery.Executing do
      Application.ProcessMessages;
    //Screen.Cursor := crSQLWait;
    try
      Schema := SchemaComboBox.Text;
      SchemaComboBox.Clear;
      while not Eof do
      begin
        //Application.ProcessMessages;
        //Screen.Cursor := crSQLWait;
        SchemaComboBox.Items.Add(FieldByName('USERNAME').AsWideString);
        Next;
      end;
      SchemaComboBox.ItemIndex := SchemaComboBox.Items.IndexOf(Schema);
    finally
      Close;
      //Screen.Cursor := crDefault;
    end;
  end;
end;

{function TObjectTreeFrame.GetSchemaItems: TStringList;
begin
  Result := TStringList.Create;
  Result.AddStrings(SchemaComboBox.Items);
end;}

procedure TObjectTreeFrame.SetSchemaParam(Value: string);
begin
  if FUpdatingSchema then
    Exit;
  FUpdatingSchema := True; { prevent setting schema param utils it's set }

  FSchemaParam := Value;
  SchemaComboBox.ItemIndex := SchemaComboBox.Items.IndexOf(Value);
  //Application.ProcessMessages;
  //Screen.Cursor := crHourglass;
  Refresh;
  //Screen.Cursor := crDefault;
  FUpdatingSchema := False;
end;

procedure TObjectTreeFrame.VirtualDrawTreeCreateEditor(Sender: TBaseVirtualTree; Node: PVirtualNode;
  Column: TColumnIndex; out EditLink: IVTEditLink);
begin
  EditLink := TEditLink.Create;
  TEditLink(EditLink).OraSession := OraSession;
  TEditLink(EditLink).SchemaParam := FSchemaParam;
end;

procedure TObjectTreeFrame.VirtualDrawTreeDrawNode(Sender: TBaseVirtualTree;
  const PaintInfo: TVTPaintInfo);
var
  Data: PObjectNodeRec;
  S: string;
  R: TRect;
  LStyles: TCustomStyleServices;
  LDetails: TThemedElementDetails;
  LColor: TColor;
begin
  inherited;
  LStyles := StyleServices;
  with PaintInfo do
  begin
    Data := VirtualDrawTree.GetNodeData(Node);
    if not Assigned(Data) then
      Exit;

    Canvas.Font.Color := clWindowText;
    Canvas.Font.Style := [];

    if LStyles.Enabled and (vsSelected in PaintInfo.Node.States) then
    begin
      R := ContentRect;
      R.Right := R.Left + NodeWidth;

      LDetails := LStyles.GetElementDetails(tgCellSelected);
      LStyles.DrawElement(Canvas.Handle, LDetails, R);
    end;

    if not LStyles.GetElementColor(LStyles.GetElementDetails(tgCellNormal), ecTextColor, LColor) {or (LColor = clNone)} then
      LColor := LStyles.GetSystemColor(clWindowText);
    //get and set the background color
    Canvas.Brush.Color := LStyles.GetStyleColor(scEdit);
    Canvas.Font.Color := LColor;

    if LStyles.Enabled and (vsSelected in PaintInfo.Node.States) then
    begin
       Canvas.Brush.Color := LStyles.GetSystemColor(clHighlight);
       Canvas.Font.Color := LStyles.GetStyleFontColor(sfMenuItemTextSelected);// GetSystemColor(clHighlightText);
    end
    else
    if not LStyles.Enabled and (vsSelected in PaintInfo.Node.States) then
    begin
      Canvas.Brush.Color := clHighlight;
      Canvas.Font.Color := clHighlightText;
    end;


    Canvas.Font.Style := [];
    if Data.StateIndex = 1 then // status = disabled
    begin
      Canvas.Font.Style := [fsItalic];
      Canvas.Font.Color := clGray;
    end;
    if Data.StateIndex = 2 then // invalid objects
      Canvas.Font.Color := clRed;
    SetBKMode(Canvas.Handle, TRANSPARENT);

    R := ContentRect;
    InflateRect(R, -VirtualDrawTree.TextMargin, 0);
    Dec(R.Right);
    Dec(R.Bottom);

    S := Data.NodeText;
    if Data.Level = 0 then
      if Node.ChildCount > 0 then
        S := S + Format(TEXT_COUNT, [Node.ChildCount]);
    if Length(S) > 0 then
    begin
      with R do
      begin
        if (NodeWidth - 2 * VirtualDrawTree.Margin) > (Right - Left) then
          S := ShortenString(Canvas.Handle, S, Right - Left);
      end;
      DrawTextW(Canvas.Handle, PWideChar(S), Length(S), R, DT_TOP or DT_LEFT or DT_VCENTER or DT_SINGLELINE);
    end;
  end;
end;

procedure TObjectTreeFrame.VirtualDrawTreeFreeNode(Sender: TBaseVirtualTree; Node: PVirtualNode);
var
  Data: PObjectNodeRec;
begin
  Data := Sender.GetNodeData(Node);
  Finalize(Data^);
end;

procedure TObjectTreeFrame.VirtualDrawTreeGetImageIndex(Sender: TBaseVirtualTree;
  Node: PVirtualNode; Kind: TVTImageKind; Column: TColumnIndex; var Ghosted: Boolean;
  var ImageIndex: Integer);
var
  Data: PObjectNodeRec;
begin
  if Kind in [ikNormal, ikSelected] then
  begin
    Data := VirtualDrawTree.GetNodeData(Node);

    ImageIndex := Data.ImageIndex;

    if Data.StateIndex = 2 then // invalid objects
    begin
      case Data.ImageIndex of
        IMG_IDX_TABLE_CHILD: ImageIndex := IMG_IDX_TABLE_INVALID;
        IMG_IDX_VIEW_CHILD: ImageIndex := IMG_IDX_VIEW_INVALID;
        IMG_IDX_FUNCTION_CHILD: ImageIndex := IMG_IDX_FUNCTION_INVALID;
        IMG_IDX_PROCEDURE_CHILD: ImageIndex := IMG_IDX_PROCEDURE_INVALID;
        IMG_IDX_PACKAGE_CHILD: ImageIndex := IMG_IDX_PACKAGE_INVALID;
        IMG_IDX_TRIGGER_CHILD: ImageIndex := IMG_IDX_TRIGGER_INVALID;
        IMG_IDX_CONSTRAINT_CHILD: ImageIndex := IMG_IDX_CONSTRAINT_INVALID;
        IMG_IDX_INDEX_CHILD: ImageIndex := IMG_IDX_INDEX_INVALID;
        IMG_IDX_SEQUENCE_CHILD: ImageIndex := IMG_IDX_SEQUENCE_INVALID;
        IMG_IDX_SYNONYM_CHILD: ImageIndex := IMG_IDX_SYNONYM_INVALID;
        IMG_IDX_DBLINK_CHILD: ImageIndex := IMG_IDX_DBLINK_INVALID;
      else
        ImageIndex := IMG_IDX_INVALID_OBJECT_CHILD;
      end;
    end;
    if Data.StateIndex = 3 then // locked users
      ImageIndex := IMG_IDX_LOCKED;
    if Data.StateIndex = 4 then // expired & locked users
      ImageIndex := IMG_IDX_EXPIRED_AND_LOCKED;
  end;
end;

procedure TObjectTreeFrame.VirtualDrawTreeGetNodeWidth(Sender: TBaseVirtualTree;
  HintCanvas: TCanvas; Node: PVirtualNode; Column: TColumnIndex; var NodeWidth: Integer);
var
  S: string;
  Data: PObjectNodeRec;
begin
  Data := VirtualDrawTree.GetNodeData(Node);
  if Assigned(Data) then
  begin
    S := Trim(Data.NodeText);
    if Data.Level = 0 then
      if Node.ChildCount > 0 then
        S := S + Format(TEXT_COUNT, [Node.ChildCount]);
    NodeWidth := VirtualDrawTree.Canvas.TextWidth(S) + 2 * VirtualDrawTree.TextMargin;
  end;
end;

procedure TObjectTreeFrame.VirtualDrawTreeInitChildren(Sender: TBaseVirtualTree; Node: PVirtualNode;
  var ChildCount: Cardinal);
var
  PackageNode, PackageChildNode: PVirtualNode;
  Data, ParentData, ChildData: PObjectNodeRec;
  OraQuerySpec: TOraQuery;
  StringList: TStringList;
  SQLTokenizer: TSQLTokenizer;
  s, Token: string;
  i: Integer;
  InsideComment, InsideSourceType, {InsideBrackets,} Wrapped, PackageSpec, ReturnFound: Boolean;
  NodeText, NodeType: string;
  ImageIndex, StateIndex: Integer;
begin
  if VirtualDrawTree.SelectedCount = 0 then
    Exit;

  Data := VirtualDrawTree.GetNodeData(Node);
  StateIndex := Data.StateIndex;
  PackageSpec := StateIndex = 10;
  { Package specification and body }
  if Data.Level = 2 then
  begin
    ParentData := VirtualDrawTree.GetNodeData(Node.Parent);
    StringList := TStringList.Create;

    OraQuerySpec := TOraQuery.Create(nil);
    OraQuerySpec.Session := OraSession;
    SQLTokenizer := TSQLTokenizer.Create;
    with OraQuerySpec do
    try
      { Open queries }
      if PackageSpec then
        SQL.Text := DM.StringHolder.StringsByName['PackageSpecificationSQL'].Text
      else
        SQL.Text := DM.StringHolder.StringsByName['PackageBodySQL'].Text;
      ParamByName('P_OBJECT_NAME').AsWideString := ParentData.NodeText; // FObjectName;
      ParamByName('P_OWNER').AsWideString := FSchemaParam;
      Open;
      { read SQL to editor }
      while not Eof do
      begin
        StringList.Text := StringList.Text + FieldByName('TEXT').AsString;
        Next;
      end;
      //Close;
      //UnPrepare;
      Wrapped := False;

      if not PackageSpec then
      begin
        {SQL.Text := DM.StringHolder.StringsByName['PackageBodyLineSQL'].Text;
        ParamByName('P_OBJECT_NAME').AsWideString := FObjectName;
        ParamByName('P_OWNER').AsWideString := FSchemaParam;
        ParamByName('P_LINE').AsInteger := 1;
        Open;     }
        First;
        SQLTokenizer.SetText(FieldByName('TEXT').AsString);
        while (not SQLTokenizer.Eof) and not Wrapped do
        begin
          if SQLTokenizer.TokenStrIs('WRAPPED') then
            Wrapped := True;
          SQLTokenizer.Next;
        end;
      end;
      Close;
      UnPrepare;
      //SynEdit.Text := Trim(UpperCase(SynEdit.Text));
      { check wrapped }
      SQLTokenizer.SetText(StringList.Strings[0]);
      while (not SQLTokenizer.Eof) and not Wrapped do
      begin
        if SQLTokenizer.TokenStrIs('WRAPPED') then
          Wrapped := True;
        SQLTokenizer.Next;
      end;

      if Wrapped then
      begin
        PackageNode := VirtualDrawTree.AddChild(Node);
        Data := VirtualDrawTree.GetNodeData(PackageNode);
        Data.Level := 3;
        Data.NodeText := 'Wrapped';
        Data.NodeType := OBJECT_TYPE_PACKAGE;
        Data.ImageIndex := IMG_IDX_PACKAGE_CHILD;
        //VirtualDrawTree.ValidateNode(Node, False);
      end
      else
      begin
        InsideComment := False;
        InsideSourceType := False;

        i := 0;
        while i < StringList.Count do
        begin
          if Trim(StringList.Strings[i]) <> '' then
          begin
            s := StringList.Strings[i];
            if (InsideComment and (Pos('*/', s) = 0)) then
            begin
              Inc(i);
              Continue
            end
            else
            begin
              if Pos(';', s) <> 0 then
                InsideSourceType := False;

              if InsideComment and (Pos('*/', s) <> 0) then
              begin
                s := Copy(s, Pos('*/', s) + 2, Length(s));
                InsideComment := False;
              end;
              if Pos('--', s) <> 0 then
                s := Copy(s, 1, Pos('--', s) - 1);
              if Pos('/*', s) <> 0 then
              begin
                if Pos('*/', s) = 0 then
                  InsideComment := True;
                s := Copy(s, 1, Pos('/*', s) - 1);
              end;

              SQLTokenizer.SetText(s);

              while (not SQLTokenizer.Eof) and (SQLTokenizer.TokenType = ttWhiteSpace) do
                SQLTokenizer.Next;
              Token := UpperCase(SQLTokenizer.TokenStr);
              SQLTokenizer.Next;
              while (not SQLTokenizer.Eof) and (SQLTokenizer.TokenType = ttWhiteSpace) do
                SQLTokenizer.Next;
              NodeText := '';
              ImageIndex := -1;
              if not InsideSourceType then
              begin
                if PackageSpec and ((Token = 'PACKAGE') or (Token = 'PRAGMA') or (Token = 'END') or
                  (Token = 'IS') or (Token = 'AS')) then
                  // do nothing
                else
                if PackageSpec and SQLTokenizer.TokenStrIs('CONSTANT') then
                begin
                  NodeText := Token;
                  NodeType := 'CONSTANT';
                  ImageIndex := IMG_IDX_CONSTANT;
                end
                else
                if PackageSpec and SQLTokenizer.TokenStrIs('EXCEPTION') then
                begin
                  NodeText := Token;
                  NodeType := 'EXCEPTION';
                  ImageIndex := IMG_IDX_EXCEPTION;
                end
                else
                if PackageSpec and (Token = 'TYPE') then
                begin
                  NodeText := SQLTokenizer.TokenStr;
                  NodeType := 'TYPE';
                  ImageIndex := IMG_IDX_TYPE;
                end
                else
                if Token = 'PROCEDURE' then
                begin
                  NodeText := SQLTokenizer.TokenStr;
                  NodeType := 'PROCEDURE';
                  ImageIndex := IMG_IDX_PROCEDURE;
                end
                else
                if Token = 'FUNCTION' then
                begin
                  NodeText := SQLTokenizer.TokenStr;
                  NodeType := 'FUNCTION';
                  ImageIndex := IMG_IDX_FUNCTION;
                end
                else
                if PackageSpec and (Token = 'CURSOR') then
                begin
                  NodeText := SQLTokenizer.TokenStr;
                  NodeType := 'CURSOR';
                  ImageIndex := IMG_IDX_CURSOR;
                end
                else
                if PackageSpec then
                begin
                  NodeText := Token;
                  NodeType := NodeText;
                  ImageIndex := IMG_IDX_VARIABLE;
                end;
              end;

              if not InsideSourceType and (NodeText <> '') then
              begin
                InsideSourceType := Pos(';', StringList.Strings[i]) = 0;
                PackageNode := VirtualDrawTree.AddChild(Node);
                Data := VirtualDrawTree.GetNodeData(PackageNode);
                Data.Level := 3;
                Data.NodeType := OBJECT_TYPE_PACKAGE;
                Data.NodeText := NodeText;
                Data.SourceType := NodeType;
                Data.ImageIndex := ImageIndex;
                Data.StateIndex := StateIndex;
                Data.CaretX := Pos(NodeText, StringList.Strings[i]);
                Data.CaretY := i + 1;
                //VirtualDrawTree.ValidateNode(Node, False);

                if (NodeType = 'FUNCTION') or (NodeType = 'PROCEDURE') or (NodeType = 'TYPE') then
                begin
                  InsideSourceType := False;
                  { read everything until next ;
                    if first word AS or string empty then skip
                    else remove () and make childnodes (items are separated by ,)}
                  s := Copy(s, Pos(NodeText, s) + Length(NodeText) + 1, Length(s));
                  if Pos('IS', StringList.Strings[i+1]) <> 1 then
                    if Pos(';', StringList.Strings[i]) = 0 then
                    repeat
                      Inc(i);
                      s := s + StringList.Strings[i];
                    until Pos(';', StringList.Strings[i]) <> 0;
                  s := Trim(s);

                  if s <> '' then
                  begin
                    SQLTokenizer.SetText(s);

                    while (not SQLTokenizer.Eof) and ((SQLTokenizer.TokenType = ttWhiteSpace) or
                      (SQLTokenizer.TokenType = ttOpenParens)) do
                      SQLTokenizer.Next;

                    if not SQLTokenizer.TokenStrIs('AS') then
                    begin
                      Token := '';
                      ReturnFound := False;
                      while not SQLTokenizer.Eof do
                      begin
                        if SQLTokenizer.TokenStrIs('RETURN') and not ReturnFound then
                        begin
                          ReturnFound := True;
                          SQLTokenizer.Next;
                          while (not SQLTokenizer.Eof) and (SQLTokenizer.TokenType = ttWhiteSpace) do
                            SQLTokenizer.Next;
                          Data.NodeText := Data.NodeText + ': ' + SQLTokenizer.TokenStr;
                        end;

                        if SQLTokenizer.TokenType = ttColon then
                          Token := Token + ' :'
                        else
                        if SQLTokenizer.TokenStrIs('=') then
                          Token := Token + '='
                        else
                          Token := Trim(Token + ' ' + SQLTokenizer.TokenStr);

                        SQLTokenizer.Next;
                        while (not SQLTokenizer.Eof) and (SQLTokenizer.TokenType = ttWhiteSpace) and
                          (SQLTokenizer.TokenType <> ttComma) and (SQLTokenizer.TokenType <> ttCloseParens) and
                          (SQLTokenizer.TokenType <> ttColon) and (not SQLTokenizer.TokenStrIs('=')) do
                          SQLTokenizer.Next;

                        if (not SQLTokenizer.Eof) and ((SQLTokenizer.TokenType = ttComma) or (SQLTokenizer.TokenType = ttCloseParens)) then
                        begin
                          PackageChildNode := VirtualDrawTree.AddChild(PackageNode);
                          ChildData := VirtualDrawTree.GetNodeData(PackageChildNode);
                          ChildData.Level := 4;
                          ChildData.NodeType := OBJECT_TYPE_PACKAGE;
                          Token := StringReplace(Token, ' . ', '.', []);
                         // Token := StringReplace(Token, 'IS RECORD (', '', []);
                          ChildData.NodeText := Trim(Token);
                          ChildData.ImageIndex := IMG_IDX_VARIABLE;
                          //VirtualDrawTree.ValidateNode(Node, False);
                          Token := '';
                          SQLTokenizer.Next;
                        end;
                      end;
                    end; { if not SQLLexer.TokenStrIs('AS') then }
                  end; { if s <> '' then }
                end; { if not InsideSourceType and (NodeText <> '') then }
              end;
            end;
          end;
          Inc(i);
        end;
      end;
    finally
      if Assigned(StringList) then
        StringList.Free;
      if Assigned(SQLTokenizer) then
        SQLTokenizer.Free;
      if OraQuerySpec.Active then
      begin
        Close;
        UnPrepare;
      end;
      FreeAndNil(OraQuerySpec);
    end;
    ChildCount := VirtualDrawTree.ChildCount[Node];
  end;
end;

procedure TObjectTreeFrame.VirtualDrawTreeInitNode(Sender: TBaseVirtualTree; ParentNode,
  Node: PVirtualNode; var InitialStates: TVirtualNodeInitStates);
var
  Data: PObjectNodeRec;
begin
  inherited;
  Data := VirtualDrawTree.GetNodeData(Node);
  if (Data.Level = 2) or (Data.Level = 3) then
  begin
    VirtualDrawTree.Selected[Node.Parent] := True;
    if Data.Level = 2 then
      Include(InitialStates, ivsHasChildren);
  end;
end;

function TObjectTreeFrame.Connect(ConnectString: string): Boolean;
begin
  Result := False;
  try
    try
      if not InitSession(ConnectString) then
        Exit;
      Application.ProcessMessages;
      Screen.Cursor := crSQLWait;
      OraSession.Connect;
      Result := True;
      ObjectsQuery.Session := OraSession;
      InvalidObjectsQuery.Session := OraSession;
      RecycleBinQuery.Session := OraSession;
      SchemasQuery.Session := OraSession;
      UsersQuery.Session := OraSession;

      LoadSchemas;
    except
      Result := False;
    end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

function TObjectTreeFrame.GetSchemaName: string;
var
  Database: string;
begin
  Result := OraSession.Schema;

  Database := Lib.FormatServer(OraSession.Server);

  Result := Result + '@' + Database;
end;

procedure TObjectTreeFrame.OraSessionConnectionLost(Sender: TObject; Component: TComponent;
  ConnLostCause: TConnLostCause; var RetryMode: TRetryMode);
begin
  RetryMode := rmReconnectExecute;
end;

function TObjectTreeFrame.GetObjectsSQL: string;
var
  i: Integer;
begin
  Result := '';

  for i := 0 to FTreeObjects.Count - 1 do
  begin
    if FTreeObjects.Strings[i] = TEXT_TABLES + TEXT_IS_TRUE then
    begin
      Result := Result + Format(DM.StringHolder.StringsByName['TablesSQL'].Text, [FFilterObjects[0]]);
    end;
    if FTreeObjects.Strings[i] = TEXT_VIEWS + TEXT_IS_TRUE then
    begin
      if Result <> '' then
        Result := Result + ' UNION ALL ';
      Result := Result + Format(DM.StringHolder.StringsByName['ViewsSQL'].Text, [FFilterObjects[1]]);
    end;
    if FTreeObjects.Strings[i] = TEXT_FUNCTIONS + TEXT_IS_TRUE then
    begin
      if Result <> '' then
        Result := Result + ' UNION ALL ';
      Result := Result + Format(DM.StringHolder.StringsByName['FunctionsSQL'].Text, [FFilterObjects[2]]);
    end;
    if FTreeObjects.Strings[i] = TEXT_PROCEDURES + TEXT_IS_TRUE then
    begin
      if Result <> '' then
        Result := Result + ' UNION ALL ';
      Result := Result + Format(DM.StringHolder.StringsByName['ProceduresSQL'].Text, [FFilterObjects[3]]);
    end;
    if FTreeObjects.Strings[i] = TEXT_PACKAGES + TEXT_IS_TRUE then
    begin
      if Result <> '' then
        Result := Result + ' UNION ALL ';
      Result := Result + Format(DM.StringHolder.StringsByName['PackagesSQL'].Text, [FFilterObjects[4]]);
    end;
    if FTreeObjects.Strings[i] = TEXT_TRIGGERS + TEXT_IS_TRUE then
    begin
      if Result <> '' then
        Result := Result + ' UNION ALL ';
      Result := Result + Format(DM.StringHolder.StringsByName['TriggersSQL'].Text, [FFilterObjects[5]]);
    end;
    if FTreeObjects.Strings[i] = TEXT_CONSTRAINTS + TEXT_IS_TRUE then
    begin
      if Result <> '' then
        Result := Result + ' UNION ALL ';
      Result := Result + Format(DM.StringHolder.StringsByName['ConstraintsSQL'].Text, [FFilterObjects[6]]);
    end;
    if FTreeObjects.Strings[i] = TEXT_INDEXES + TEXT_IS_TRUE then
    begin
      if Result <> '' then
        Result := Result + ' UNION ALL ';
      Result := Result + Format(DM.StringHolder.StringsByName['IndexesSQL'].Text, [FFilterObjects[7]]);
    end;
    if FTreeObjects.Strings[i] = TEXT_SEQUENCES + TEXT_IS_TRUE then
    begin
      if Result <> '' then
        Result := Result + ' UNION ALL ';
      Result := Result + Format(DM.StringHolder.StringsByName['SequencesSQL'].Text, [FFilterObjects[8]]);
    end;
    if FTreeObjects.Strings[i] = TEXT_SYNONYMS + TEXT_IS_TRUE then
    begin
      if Result <> '' then
        Result := Result + ' UNION ALL ';
      Result := Result + Format(DM.StringHolder.StringsByName['SynonymsSQL'].Text, [FFilterObjects[9]]);
    end;
    if FTreeObjects.Strings[i] = TEXT_DBLINKS + TEXT_IS_TRUE then
    begin
      if Result <> '' then
        Result := Result + ' UNION ALL ';
      Result := Result + Format(DM.StringHolder.StringsByName['DBLinksSQL'].Text, [FFilterObjects[10]]);
    end;
  end;

  if Result <> '' then
    Result := Format(DM.StringHolder.StringsByName['ObjectsSQL'].Text, [Result]);
end;

procedure TObjectTreeFrame.AddObjects;
var
  i: Integer;
  ObjectsSQL: string;
begin
  with ObjectsQuery do
  try
    Screen.Cursor := crSQLWait;
    SQL.Clear;
    ObjectsSQL := GetObjectsSQL;
    if ObjectsSQL <> '' then
    begin
      SQL.Add(ObjectsSQL);
      ParamByName('P_SCHEMA').AsWideString := FSchemaParam;
      Prepare;
      Open;
      while Executing do
        Application.ProcessMessages;
      Screen.Cursor := crSQLWait;
    end;
    try
      VirtualDrawTree.BeginUpdate;
      for i := 0 to FTreeObjects.Count - 1 do
      begin
        if FTreeObjects.Strings[i] = TEXT_TABLES + TEXT_IS_TRUE then
          AddNode(ObjectsQuery, [IMG_IDX_TABLE_ROOT, IMG_IDX_TABLE_CHILD], OBJECT_TYPE_TABLE, TEXT_TABLES);
        if FTreeObjects.Strings[i] = TEXT_VIEWS + TEXT_IS_TRUE then
          AddNode(ObjectsQuery, [IMG_IDX_VIEW_ROOT, IMG_IDX_VIEW_CHILD],  OBJECT_TYPE_VIEW, TEXT_VIEWS);
        if FTreeObjects.Strings[i] = TEXT_FUNCTIONS + TEXT_IS_TRUE then
          AddNode(ObjectsQuery, [IMG_IDX_FUNCTION_ROOT, IMG_IDX_FUNCTION_CHILD],  OBJECT_TYPE_FUNCTION, TEXT_FUNCTIONS);
        if FTreeObjects.Strings[i] = TEXT_PROCEDURES + TEXT_IS_TRUE then
          AddNode(ObjectsQuery, [IMG_IDX_PROCEDURE_ROOT, IMG_IDX_PROCEDURE_CHILD],  OBJECT_TYPE_PROCEDURE, TEXT_PROCEDURES);
        if FTreeObjects.Strings[i] = TEXT_PACKAGES + TEXT_IS_TRUE then
          AddNode(ObjectsQuery, [IMG_IDX_PACKAGE_ROOT, IMG_IDX_PACKAGE_CHILD],  OBJECT_TYPE_PACKAGE, TEXT_PACKAGES);
        if FTreeObjects.Strings[i] = TEXT_TRIGGERS + TEXT_IS_TRUE then
          AddNode(ObjectsQuery, [IMG_IDX_TRIGGER_ROOT, IMG_IDX_TRIGGER_CHILD],  OBJECT_TYPE_TRIGGER, TEXT_TRIGGERS);
        if FTreeObjects.Strings[i] = TEXT_CONSTRAINTS + TEXT_IS_TRUE then
          AddNode(ObjectsQuery, [IMG_IDX_CONSTRAINT_ROOT, IMG_IDX_CONSTRAINT_CHILD, IMG_IDX_PRIMARY_KEY, IMG_IDX_FOREIGN_KEY, IMG_IDX_UNIQUE_KEY, IMG_IDX_CHECK],  OBJECT_TYPE_CONSTRAINT, TEXT_CONSTRAINTS);
        if FTreeObjects.Strings[i] = TEXT_INDEXES + TEXT_IS_TRUE then
          AddNode(ObjectsQuery, [IMG_IDX_INDEX_ROOT, IMG_IDX_INDEX_CHILD],  OBJECT_TYPE_INDEX, TEXT_INDEXES);
        if FTreeObjects.Strings[i] = TEXT_SEQUENCES + TEXT_IS_TRUE then
          AddNode(ObjectsQuery, [IMG_IDX_SEQUENCE_ROOT, IMG_IDX_SEQUENCE_CHILD],  OBJECT_TYPE_SEQUENCE, TEXT_SEQUENCES);
        if FTreeObjects.Strings[i] = TEXT_SYNONYMS + TEXT_IS_TRUE then
          AddNode(ObjectsQuery, [IMG_IDX_SYNONYM_ROOT, IMG_IDX_SYNONYM_CHILD],  OBJECT_TYPE_SYNONYM, TEXT_SYNONYMS);
        if FTreeObjects.Strings[i] = TEXT_DBLINKS + TEXT_IS_TRUE then
          AddNode(ObjectsQuery, [IMG_IDX_DBLINK_ROOT, IMG_IDX_DBLINK_CHILD],  OBJECT_TYPE_DATABASE_LINK, TEXT_DBLINKS);
        if FTreeObjects.Strings[i] = TEXT_USERS + TEXT_IS_TRUE then
          AddUsers;
        if FTreeObjects.Strings[i] = TEXT_INVALID_OBJECTS + TEXT_IS_TRUE then
          AddInvalidObjects;
        if FTreeObjects.Strings[i] = TEXT_RECYCLE_BIN + TEXT_IS_TRUE then
          if FSchemaParam = OraSession.Schema then
            AddRecycleBin;
      end;
    finally
      if Active then
      begin
        Close;
        UnPrepare;
      end;
      VirtualDrawTree.EndUpdate;
      Screen.Cursor := crDefault
    end;
  except
    { no user objects? }
  end;
end;

procedure TObjectTreeFrame.AddInvalidObjects;
begin
  Screen.Cursor := crSQLWait;
  with InvalidObjectsQuery do
  try
    ParamByName('P_SCHEMA').AsWideString := FSchemaParam;
    Prepare;
    Open;
    while Executing do
      Application.ProcessMessages;
    Screen.Cursor := crSQLWait;
    AddNode(InvalidObjectsQuery, [IMG_IDX_INVALID_OBJECT_ROOT, IMG_IDX_INVALID_OBJECT_CHILD],  OBJECT_TYPE_INVALID_OBJECT, TEXT_INVALID_OBJECTS);
    //UpdateImageOfInvalidObjects(Node);
  finally
    Close;
    UnPrepare;
    Screen.Cursor := crDefault;
  end;
end;

procedure TObjectTreeFrame.AddUsers;
begin
  Screen.Cursor := crSQLWait;
  with UsersQuery do
  try
    SQL.Clear;
    SQL.Text := Format(DM.StringHolder.StringsByName['UsersSQL'].Text, [FFilterObjects[11]]);
    //ParamByName('P_SCHEMA').AsWideString := FSchemaParam;
    Prepare;
    Open;
    while Executing do
      Application.ProcessMessages;
    Screen.Cursor := crSQLWait;
    try
      AddNode(UsersQuery, [IMG_IDX_USER_ROOT, IMG_IDX_USER_CHILD],  OBJECT_TYPE_USER, TEXT_USERS);
    finally
      Close;
      UnPrepare;
      Screen.Cursor := crDefault;
    end;
  except
    { users may not be supported }
  end;
end;

procedure TObjectTreeFrame.AddRecycleBin;
begin
  Screen.Cursor := crSQLWait;
  with RecycleBinQuery do
  try
    Prepare;
    Open;
    while Executing do
      Application.ProcessMessages;
    Screen.Cursor := crSQLWait;
    try
      AddNode(RecycleBinQuery, [IMG_IDX_RECYCLE_BIN_ROOT, IMG_IDX_RECYCLE_BIN_CHILD],  OBJECT_TYPE_RECYCLE_BIN, TEXT_RECYCLE_BIN);
    finally
      Close;
      UnPrepare;
      Screen.Cursor := crDefault;
    end;
  except
    { recycle bin may not be supported }
  end;
end;

procedure OpenNodeByText(ATree: TVirtualDrawTree; ARoot: string; AValue: String);
var
  Node: PVirtualNode;
  Root: string;
  Data: PObjectNodeRec;
begin
  Node := ATree.GetFirst;
  Data := ATree.GetNodeData(Node);
  if ARoot = '' then
    Root := AValue
  else
    Root := ARoot;
  { find the root }
  while Assigned(Node) and (AnsiCompareText(Root, Data.NodeText) <> 0) do
  begin
    Node := Node.NextSibling;
    Data := ATree.GetNodeData(Node);
  end;

  if Root <> AValue then
  begin
    if Assigned(Node) then
    begin
      ATree.Selected[Node] := True;
      ATree.Expanded[Node] := True;
    end;
    { find the child }
    if Assigned(Node) then
    begin
      Node := Node.FirstChild;
      Data := ATree.GetNodeData(Node);
      while Assigned(Node) and (AnsiCompareText(AValue, Data.NodeText) <> 0) do
      begin
        Node := Node.NextSibling;
        Data := ATree.GetNodeData(Node);
      end;
    end;
    if Assigned(Node) then
    begin
      ATree.Selected[Node] := True;
      ATree.Expanded[Node] := True;
    end;
  end;
end;

procedure TObjectTreeFrame.Refresh;
var
  SelectedText, SelectedParentText: string;
begin
  SelectedText := '';
  SelectedParentText := '';
  Screen.Cursor := crHourglass;
  try
    if not FUpdatingSchema and (VirtualDrawTree.SelectedCount > 0) then
    begin
      SelectedText := GetSelectedObjectText;
      SelectedParentText := Self.GetSelectedObjectParentText;
    end;
    ClearTree;
    CreateConnectionTree;
    if SelectedText <> '' then
    begin
      OpenNodeByText(VirtualDrawTree, SelectedParentText, SelectedText);
      VirtualDrawTree.OnClick(nil);
    end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TObjectTreeFrame.SchemaComboBoxChange(Sender: TObject);
begin
  if SchemaParam <> SchemaComboBox.Text then
    SchemaParam := SchemaComboBox.Text;
end;

procedure TObjectTreeFrame.SchemaComboBoxDrawItem(Control: TWinControl; Index: Integer; Rect: TRect;
  State: TOwnerDrawState);
begin
   { ensure the correct highlite color is used }
  SchemaComboBox.Canvas.FillRect(Rect);
  { write the text }
  SchemaComboBox.Canvas.TextOut(Rect.Left + 3, Rect.Top + 1, SchemaComboBox.Items.Strings[Index]);
end;

procedure TObjectTreeFrame.SchemaComboBoxKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 13 then
    SchemaComboBoxChange(Sender);
end;

procedure TObjectTreeFrame.SchemaFilterActionExecute(Sender: TObject);
var
  SchemaFilters: string;
  SchemaName: string;
begin
  SchemaName := GetSchemaName;
  SchemaFilters := GetSchemaFilters(SchemaName);
  if SchemaFilterDialog.Open(OraSession, SchemaName, SchemaFilters) then
    LoadSchemas;
end;

procedure TObjectTreeFrame.ReadIniFile;
var
  i: Integer;
  SectionValues: TStrings;
begin
  if not Assigned(FTreeObjects) then
    FTreeObjects := TStringList.Create
  else
    FTreeObjects.Clear;
  SectionValues := TStringList.Create;
  with TBigIniFile.Create(GetINIFilename) do
  try
    ReadSectionValues('CustomizeObjectTree', FTreeObjects);
    if FTreeObjects.Count = 0 then
    begin
      { add defaults if not found }
      FTreeObjects.Add(TEXT_TABLES + TEXT_IS_TRUE);
      FTreeObjects.Add(TEXT_VIEWS + TEXT_IS_TRUE);
      FTreeObjects.Add(TEXT_FUNCTIONS + TEXT_IS_TRUE);
      FTreeObjects.Add(TEXT_PROCEDURES + TEXT_IS_TRUE);
      FTreeObjects.Add(TEXT_PACKAGES + TEXT_IS_TRUE);
      FTreeObjects.Add(TEXT_TRIGGERS + TEXT_IS_TRUE);
      FTreeObjects.Add(TEXT_CONSTRAINTS + TEXT_IS_TRUE);
      FTreeObjects.Add(TEXT_INDEXES + TEXT_IS_TRUE);
      FTreeObjects.Add(TEXT_SEQUENCES + TEXT_IS_TRUE);
      FTreeObjects.Add(TEXT_SYNONYMS + TEXT_IS_TRUE);
      FTreeObjects.Add(TEXT_DBLINKS + TEXT_IS_TRUE);
      FTreeObjects.Add(TEXT_USERS + TEXT_IS_TRUE);
      FTreeObjects.Add(TEXT_INVALID_OBJECTS + TEXT_IS_TRUE);
      FTreeObjects.Add(TEXT_RECYCLE_BIN + TEXT_IS_TRUE);
    end;
    ReadSectionValues('DefaultSchemaObjectFilters_' + DecryptString(GetSchemaName), SectionValues);
    for i := 0 to SectionValues.Count - 1 do
    begin
      CurrentFilters[i] := EncryptString(System.Copy(SectionValues.Strings[i], Pos('=', SectionValues.Strings[i]) + 1, Length(SectionValues.Strings[i])));
      SetObjectFilter(CurrentFilters[i], GetFilterObjectType(i));
    end;
  finally
    Free;
    SectionValues.Free;
  end;
end;

procedure TObjectTreeFrame.CreateConnectionTree;
begin
  Screen.Cursor := crSQLWait;
  try
    ReadIniFile;
    AddObjects;
  finally
    Screen.Cursor := crDefault;
  end;
end;

function TObjectTreeFrame.GetSelectedObjectType: string;
var
  Data: PObjectNodeRec;
begin
  Result := '';
  if VirtualDrawTree.SelectedCount > 0 then
  begin
    Data := VirtualDrawTree.GetNodeData(VirtualDrawTree.GetFirstSelected);
    Result := Data.NodeType;
  end;
end;

function TObjectTreeFrame.GetSelectedObjectParentText: string;
var
  Data: PObjectNodeRec;
  Node: PVirtualNode;
begin
  Result := '';
  if VirtualDrawTree.SelectedCount > 0 then
  begin
    Node := VirtualDrawTree.GetFirstSelected;
    if Assigned(Node.Parent) then
    begin
      Data := VirtualDrawTree.GetNodeData(Node.Parent);
      if Assigned(Data) then
        Result := Data.NodeText;
    end;
  end;
end;

function TObjectTreeFrame.GetSelectedObjectText: string;
var
  Data: PObjectNodeRec;
begin
  Result := '';
  if VirtualDrawTree.SelectedCount > 0 then
  begin
    Data := VirtualDrawTree.GetNodeData(VirtualDrawTree.GetFirstSelected);
    Result := Data.NodeText;
  end;
end;

function TObjectTreeFrame.GetSelectedObjectName: string;
var
  Data: PObjectNodeRec;
begin
  Result := '';
  if VirtualDrawTree.SelectedCount > 0 then
  begin
    Data := VirtualDrawTree.GetNodeData(VirtualDrawTree.GetFirstSelected.Parent.Parent);
    Result := Data.NodeText;
  end;
end;

function TObjectTreeFrame.GetSelectedObjectStateIndex: Byte;
var
  Data: PObjectNodeRec;
begin
  Result := 0;
  if VirtualDrawTree.SelectedCount > 0 then
  begin
    Data := VirtualDrawTree.GetNodeData(VirtualDrawTree.GetFirstSelected);
    Result := Data.StateIndex;
  end;
end;

function TObjectTreeFrame.GetSelectedLevel: Byte;
var
  Data: PObjectNodeRec;
begin
  Result := 0;
  if VirtualDrawTree.SelectedCount > 0 then
  begin
    Data := VirtualDrawTree.GetNodeData(VirtualDrawTree.GetFirstSelected);
    Result := Data.Level;
  end;
end;

function TObjectTreeFrame.AddNode(Query: TOraQuery; ImageIndexes: array of Byte;
  NodeType: string; NodeText: string): PVirtualNode;
var
  Node, RootNode, PackageRootNode: PVirtualNode;
  Data: PObjectNodeRec;
begin
  //Screen.Cursor := crSQLWait;
  RootNode := VirtualDrawTree.AddChild(nil);
  Data := VirtualDrawTree.GetNodeData(RootNode);
  Data.NodeText := NodeText;
  Data.NodeType := NodeType;
  Data.ImageIndex := ImageIndexes[0];
  Data.StateIndex := 0;
  Data.Level := 0;
  with Query do
  begin
    while (not Eof) and (FieldByName('TYPE').AsString = NodeType) do
    begin
      //Application.ProcessMessages;
      //Screen.Cursor := crSQLWait;
      Node := VirtualDrawTree.AddChild(RootNode);
      Data := VirtualDrawTree.GetNodeData(Node);
      Data.NodeType := NodeType;
      Data.ImageIndex := ImageIndexes[1];
      Data.StateIndex := 0;
      Data.Level := 1;
      { Primary and foreign key constraints have different images }
      if NodeType = 'CONSTRAINT' then
      begin
        if FieldByName('EXTRATYPE').AsWideString = 'P' then
          Data.ImageIndex := ImageIndexes[2];
        if FieldByName('EXTRATYPE').AsWideString = 'R' then
          Data.ImageIndex := ImageIndexes[3];
        if FieldByName('EXTRATYPE').AsWideString = 'U' then
          Data.ImageIndex := ImageIndexes[4];
        if FieldByName('EXTRATYPE').AsWideString = 'C' then
          Data.ImageIndex := ImageIndexes[5];
        if FieldByName('STATUS').AsWideString  = 'DISABLED' then
          Data.StateIndex := 1;
      end
      else
      if NodeType = 'TRIGGER' then
      begin
        if FieldByName('STATUS').AsWideString  = 'DISABLED' then
          Data.StateIndex := 1;
      end
      else
      if NodeType = 'USER' then
      begin
        if (Pos('EXPIRED', FieldByName('STATUS').AsWideString) <> 0) and
          (Pos('LOCKED', FieldByName('STATUS').AsWideString) <> 0) then
          Data.StateIndex := 4
        else
        if Pos('LOCKED', FieldByName('STATUS').AsWideString) <> 0 then
          Data.StateIndex := 3
      end
      else
      if FieldByName('STATUS').AsWideString  = 'DISABLED' then
        Data.StateIndex := 2;
      Data.NodeText := FieldByName('NAME').AsString;
      //VirtualDrawTree.ValidateNode(Node, False);
      if NodeType = 'PACKAGE' then
      begin
        { add specification and body }
        PackageRootNode := Node;
        Node := VirtualDrawTree.AddChild(PackageRootNode);
        Data := VirtualDrawTree.GetNodeData(Node);
        Data.NodeType := NodeType;
        Data.NodeText := 'Specification';
        Data.StateIndex := 10;
        Data.Level := 2;
        Data.ImageIndex := IMG_IDX_SQL_SCRIPT;
        { specifications items are added in OnInitChildren }
        Node := VirtualDrawTree.AddChild(PackageRootNode);
        Data := VirtualDrawTree.GetNodeData(Node);
        Data.NodeType := NodeType;
        Data.NodeText := 'Body';
        Data.StateIndex := 11;
        Data.Level := 2;
        Data.ImageIndex := IMG_IDX_SQL_SCRIPT;
        { body items are added in OnInitChildren }
        //VirtualDrawTree.ValidateNode(Node, False);
      end;
      Next;
    end;

    Result := RootNode;
  end;
 // Screen.Cursor := crDefault;
end;

procedure TObjectTreeFrame.Disconnect;
begin
  FTreeObjects.Free;
  if OraSession.Connected then
  try
    OraSession.Disconnect;
  except
    { silent }
  end;
end;

function TObjectTreeFrame.GetConnectString: string;
begin
  Result := OraSession.ConnectString;
  if not OraSession.Options.Direct then
    Result := OraSession.ConnectString + '^' + OraSession.HomeName;
end;

function TObjectTreeFrame.SetObjectTypeAndName{(Sender: TObject)}: Boolean;
var
  SelectedLevel: Byte;
  OldObjectName: string;
begin
  Result := False;

  if VirtualDrawTree.SelectedCount = 0 then
    Exit;

  SelectedLevel := GetSelectedLevel;
  if SelectedLevel = 0 then
  begin
    FObjectType := '';
    FObjectName := '';
  end;
  if (SelectedLevel = 1) or (SelectedLevel = 3) then
  begin
    FObjectType := GetSelectedObjectType;
    OldObjectName := FObjectName;
    if SelectedLevel = 1 then
      FObjectName := GetSelectedObjectText
    else
      FObjectName := GetSelectedObjectName;
    Result := FObjectName <> OldObjectName;
  end;
end;

procedure TObjectTreeFrame.SetObjectFilter(Name: string; ObjectType: string);
var
  FilterObjects: string;
begin
  FilterObjects := Lib.GetFilterObjectsFromIni(Lib.GetObjectFilterKeyValue(ObjectType, Name, GetSchemaName));

  { Tables }
  if ObjectType = OBJECT_TYPE_TABLE then
    FFilterObjects[0] := IfThen(FilterObjects <> '', Format('AND table_name IN (%s)', [FilterObjects]))
  else
  { Views }
  if ObjectType = OBJECT_TYPE_VIEW then
    FFilterObjects[1] := IfThen(FilterObjects <> '', Format('AND view_name IN (%s)', [FilterObjects]))
  else
  { Functions }
  if ObjectType = OBJECT_TYPE_FUNCTION then
    FFilterObjects[2] := IfThen(FilterObjects <> '', Format('AND name IN (%s)', [FilterObjects]))
  else
  { Procedures }
  if ObjectType = OBJECT_TYPE_PROCEDURE then
    FFilterObjects[3] := IfThen(FilterObjects <> '', Format('AND name IN (%s)', [FilterObjects]))
  else
  { Packages }
  if ObjectType = OBJECT_TYPE_PACKAGE then
    FFilterObjects[4] := IfThen(FilterObjects <> '', Format('AND name IN (%s)', [FilterObjects]))
  else
  { Triggers }
  if ObjectType = OBJECT_TYPE_TRIGGER then
    FFilterObjects[5] := IfThen(FilterObjects <> '', Format('AND trigger_name IN (%s)', [FilterObjects]))
  else
  { Constraints }
  if ObjectType = OBJECT_TYPE_CONSTRAINT then
    FFilterObjects[6] := IfThen(FilterObjects <> '', Format('AND constraint_name IN (%s)', [FilterObjects]))
  else
  { Indexes }
  if ObjectType = OBJECT_TYPE_INDEX then
    FFilterObjects[7] := IfThen(FilterObjects <> '', Format('AND index_name IN (%s)', [FilterObjects]))
  else
  { Sequences }
  if ObjectType = OBJECT_TYPE_SEQUENCE then
    FFilterObjects[8] := IfThen(FilterObjects <> '', Format('AND sequence_name IN (%s)', [FilterObjects]))
  else
  { Synonyms }
  if ObjectType = OBJECT_TYPE_SYNONYM then
    FFilterObjects[9] := IfThen(FilterObjects <> '', Format('AND synonym_name IN (%s)', [FilterObjects]))
  else
  { Database links }
  if ObjectType = OBJECT_TYPE_DATABASE_LINK then
    FFilterObjects[10] := IfThen(FilterObjects <> '', Format('AND db_link IN (%s)', [FilterObjects]))
  else
  { Database links }
  if ObjectType = OBJECT_TYPE_USER then
    FFilterObjects[11] := IfThen(FilterObjects <> '', Format('WHERE username IN (%s)', [FilterObjects]))
end;

procedure TObjectTreeFrame.SetCurrentFilter(Name: string; ObjectType: string);
var
  Index: Integer;
begin
  Index := GetFilterObjectIndex(ObjectType);
  Assert(Index <> -1);
  CurrentFilters[Index] := Name;
  WriteIniFile
end;

{ DefaultSchemaObjectFilters_<schema name> }
procedure TObjectTreeFrame.WriteIniFile;
var
  i: Integer;
  SchemaName: string;
begin
  with TBigIniFile.Create(GetINIFilename) do
  try
    SchemaName := DecryptString(GetSchemaName);
    EraseSection('DefaultSchemaObjectFilters_' + SchemaName);
    for i := 0 to Length(CurrentFilters) - 1 do
      WriteString('DefaultSchemaObjectFilters_' + SchemaName, IntToStr(i), DecryptString(CurrentFilters[i]));
  finally
    Free;
  end;
end;

function TObjectTreeFrame.GetOraSession: TOraSession;
begin
  Result := OraSession;
end;

{ TEditLink }

destructor TEditLink.Destroy;
begin
  //FEdit.Free; This gives AV
  if FEdit.HandleAllocated then
    PostMessage(FEdit.Handle, CM_RELEASE, 0, 0);
  inherited;
end;

procedure TEditLink.EditKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  case Key of
    VK_ESCAPE:
      begin
        FTree.CancelEditNode;
        Key := 0;
      end;
    VK_RETURN:
      begin
        FTree.EndEditNode;
        Key := 0;
      end;
  end;
end;

function TEditLink.BeginEdit: Boolean;
begin
  Result := True;
  FEdit.Show;
  FEdit.SetFocus;
end;

function TEditLink.CancelEdit: Boolean;
begin
  Result := True;
  FEdit.Hide;
end;

procedure TEditLink.RenameObject(Data: PObjectNodeRec; NewName: string);
var
  OldName: string;
  ObjectType, ObjectName: string;
begin
  OldName := Data.NodeText;
  if Data.NodeType = OBJECT_TYPE_CONSTRAINT then
  begin
    {  ALTER object_type object_name RENAME CONSTRAINT old_name TO new_name; }
    { get constraint object type and name }
    with TOraQuery.Create(nil) do
    try
      Session := OraSession;
      SQL.Add(DM.StringHolder.StringsByName['ConstraintTypeAndNameSQL'].Text);
      ParamByName('CONSTRAINT_NAME').AsWideString := OldName;
      Open;
      ObjectType := FieldByName('TYPE').AsWideString;
      ObjectName := FieldByName('NAME').AsWideString;
      Close;
    finally
      Free;
    end;
    OraSession.ExecSQL(Format('ALTER %s %s RENAME CONSTRAINT %s.%s TO %s', [ObjectType, ObjectName,
      FSchemaParam, OldName, NewName]), []);
  end
  else
  begin
    { ALTER object_type old_name RENAME TO new_name; }
    OraSession.ExecSQL(Format('ALTER %s %s.%s RENAME TO %s', [Data.NodeType, FSchemaParam,
      OldName, NewName]), []);
  end;
  //Data.NodeText := NewName;
end;

function TEditLink.EndEdit: Boolean;
var
  Data: PObjectNodeRec;
  Buffer: array[0..254] of Char;
  S: UnicodeString;
begin
  Result := True;

  Data := FTree.GetNodeData(FNode);
  try
    GetWindowText(FEdit.Handle, Buffer, 255);
    S := Buffer;

    if (Length(S) = 0) or (StrContainsChar('\*?/="<>|:,;+^', S)) then
    begin
      MessageBeep;
      if Length(S) > 0 then
        ShowErrorMessage(Format('Error - Invalid Name: %s', [S]));
      Exit;
    end;

    if Data.NodeText = S then
      Exit;

    if not AskYesOrNo(Format('Do you want to rename %s %s to %s?', [Data.NodeType, Data.NodeText, S])) then
    begin
      S := Data.NodeText;
      Exit;
    end;
    FTree.SetFocus;
    RenameObject(Data, S);
    if S <> Data.NodeText then
    begin
      Data.NodeText := S;
      FTree.InvalidateNode(FNode);
    end;
    FTree.SetFocus;
  finally
    FEdit.Hide;
    //Data.NodeText := ShortString(S);
  end;
end;

function TEditLink.GetBounds: TRect;
begin
  Result := FEdit.BoundsRect;
end;

function TEditLink.PrepareEdit(Tree: TBaseVirtualTree; Node: PVirtualNode; Column: TColumnIndex): Boolean;
var
  Data: PObjectNodeRec;
begin
  Result := True;
  FTree := Tree as TVirtualDrawTree;
  FNode := Node;
  FColumn := Column;

  FEdit.Free;
  FEdit := nil;
  Data := FTree.GetNodeData(Node);

  FEdit := TBCEdit.Create(nil);
  with FEdit do
  begin
    Visible := False;
    Parent := Tree;
    Text := Data.NodeText;
    OnKeyDown := EditKeyDown;
    CharCase := ecUpperCase;
  end;
end;

procedure TEditLink.ProcessMessage(var Message: TMessage);
begin
  FEdit.WindowProc(Message);
end;

procedure TEditLink.SetBounds(R: TRect);
var
  Dummy: Integer;
begin
  // Since we don't want to activate grid extensions in the tree (this would influence how the selection is drawn)
  // we have to set the edit's width explicitly to the width of the column.
  FTree.Header.Columns.GetColumnBounds(FColumn, Dummy, R.Right);
  FEdit.BoundsRect := R;
end;

end.

