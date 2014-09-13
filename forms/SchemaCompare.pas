unit SchemaCompare;

interface

uses
  Winapi.Windows, System.SysUtils, System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ImgList,
  ComCtrls, JvExComCtrls, JvComCtrls, BCControls.PageControl, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, ToolWin,
  BCControls.ComboBox, VirtualTrees, DB, MemDS, DBAccess, Ora, JvStatusBar, BCControls.ProgressBar, BCDialogs.Dlg,
  JvProgressBar, BCCommon.Images, BCControls.CheckBox, JvExStdCtrls, JvCheckBox;

type
  TSchemaCompareForm = class(TDialog)
    PageControl: TBCPageControl;
    Schema1TabSheet: TTabSheet;
    Schema2TabSheet: TTabSheet;
    StatusBar: TJvStatusBar;
    Schema1Panel: TPanel;
    Schema1VirtualDrawTree: TVirtualDrawTree;
    Schema2Panel: TPanel;
    Schema2VirtualDrawTree: TVirtualDrawTree;
    Schema1Query: TOraQuery;
    Schema2Query: TOraQuery;
    SchemasGroupBox: TGroupBox;
    Schema1Label: TLabel;
    Schema1ComboBox: TBCComboBox;
    Schema2ComboBox: TBCComboBox;
    ComparedObjectsGroupBox: TGroupBox;
    TablesCheckBox: TBCCheckBox;
    ViewsCheckBox: TBCCheckBox;
    FunctionsCheckBox: TBCCheckBox;
    ProceduresCheckBox: TBCCheckBox;
    PackagesCheckBox: TBCCheckBox;
    TriggersCheckBox: TBCCheckBox;
    ConstraintsCheckBox: TBCCheckBox;
    IndexesCheckBox: TBCCheckBox;
    SequencesCheckBox: TBCCheckBox;
    SynonymsCheckBox: TBCCheckBox;
    DBLinksCheckBox: TBCCheckBox;
    TableCommentsCheckBox: TBCCheckBox;
    ColumnNamesCheckBox: TBCCheckBox;
    ColumnCommentsCheckBox: TBCCheckBox;
    ProgressBar: TBCProgressBar;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Schema1ComboBoxChange(Sender: TObject);
    procedure Schema2ComboBoxChange(Sender: TObject);
    procedure VirtualDrawTreeDrawNode(Sender: TBaseVirtualTree; const PaintInfo: TVTPaintInfo);
    procedure VirtualDrawTreeFreeNode(Sender: TBaseVirtualTree; Node: PVirtualNode);
    procedure VirtualDrawTreeGetImageIndex(Sender: TBaseVirtualTree; Node: PVirtualNode;
      Kind: TVTImageKind; Column: TColumnIndex; var Ghosted: Boolean; var ImageIndex: Integer);
    procedure VirtualDrawTreeGetNodeWidth(Sender: TBaseVirtualTree;
  HintCanvas: TCanvas; Node: PVirtualNode; Column: TColumnIndex; var NodeWidth: Integer);
    procedure Schema1ComboBoxDrawItem(Control: TWinControl; Index: Integer; Rect: TRect;
      State: TOwnerDrawState);
    procedure Schema2ComboBoxDrawItem(Control: TWinControl; Index: Integer; Rect: TRect;
      State: TOwnerDrawState);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormResize(Sender: TObject);
  private
    { Private declarations }
    FUsername1, FUsername2: string;
    FSessionList: TList;
    procedure DoCompare;
    procedure QueryAfterOpen(VirtualDrawTree: TVirtualDrawTree; SchemaQuery: TOraQuery);
    function GetCompareSQL: string;
    procedure ReadIniFile;
    procedure WriteIniFile;
  public
    { Public declarations }
    procedure Open(const SessionList: TList);
  end;

function SchemaCompareForm: TSchemaCompareForm;

implementation

{$R *.dfm}

uses
  DataModule, Vcl.Themes, BCCommon.StyleUtils, BigIni, BCCommon.FileUtils, BCCommon.Lib;

type
  PCompareRec = ^TCompareRec;
  TCompareRec = record
    Level: Byte;
    ObjectName: string;
    CompareResult: string;
    ImageIndex: Byte;
  end;

var
  FSchemaCompareForm: TSchemaCompareForm;

function SchemaCompareForm: TSchemaCompareForm;
begin
  if not Assigned(FSchemaCompareForm) then
    Application.CreateForm(TSchemaCompareForm, FSchemaCompareForm);
  Result := FSchemaCompareForm;
  SetStyledFormSize(Result);
end;

procedure TSchemaCompareForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  WriteIniFile;
  Schema1Query.Close;
  Schema2Query.Close;
  Action := caFree;
  inherited;
end;

procedure TSchemaCompareForm.FormCreate(Sender: TObject);
begin
  inherited;
  ReadIniFile;
end;

procedure TSchemaCompareForm.FormDestroy(Sender: TObject);
begin
  FSchemaCompareForm := nil;
  inherited;
end;

procedure TSchemaCompareForm.FormResize(Sender: TObject);
begin
  inherited;
  Schema1ComboBox.Width := SchemasGroupBox.Width div 2 - 26;
  Schema2ComboBox.Width := Schema1ComboBox.Width;
end;

procedure TSchemaCompareForm.Open(const SessionList: TList);
var
  i: Integer;
  s: string;
begin
  FSessionList := SessionList;
  for i := 0 to FSessionList.Count - 1 do
  begin
    s := Format('%s@%s', [TOraSession(FSessionList.Items[i]).Username,
      TOraSession(FSessionList.Items[i]).Server]);
    Schema1ComboBox.Items.Add(s);
    Schema2ComboBox.Items.Add(s);
  end;
  Show;
end;

function TSchemaCompareForm.GetCompareSQL: string;
begin
  Result := '';
  if TablesCheckBox.Checked then
    Result := DM.StringHolder.StringsByName['SchemaCompareTablesSQL'].Text;

  if ViewsCheckBox.Checked then
  begin
    if Result <> '' then
      Result := Result + ' UNION ALL ';
    Result := Result + DM.StringHolder.StringsByName['SchemaCompareViewsSQL'].Text;
  end;

  if FunctionsCheckBox.Checked then
  begin
    if Result <> '' then
      Result := Result + ' UNION ALL ';
    Result := Result + DM.StringHolder.StringsByName['SchemaCompareFunctionsSQL'].Text;
  end;
  
  if ProceduresCheckBox.Checked then
  begin
    if Result <> '' then
      Result := Result + ' UNION ALL ';
    Result := Result + DM.StringHolder.StringsByName['SchemaCompareProceduresSQL'].Text;
  end;
  
  if PackagesCheckBox.Checked then
  begin
    if Result <> '' then
      Result := Result + ' UNION ALL ';  
    Result := Result + DM.StringHolder.StringsByName['SchemaComparePackagesSQL'].Text;
  end;
  
  if TriggersCheckBox.Checked then
  begin
    if Result <> '' then
      Result := Result + ' UNION ALL ';  
    Result := Result + DM.StringHolder.StringsByName['SchemaCompareTriggersSQL'].Text;
  end;
  if ConstraintsCheckBox.Checked then
  begin
    if Result <> '' then
      Result := Result + ' UNION ALL ';
    Result := Result + DM.StringHolder.StringsByName['SchemaCompareConstraintsSQL'].Text;
  end;
  
  if IndexesCheckBox.Checked then
  begin
    if Result <> '' then
      Result := Result + ' UNION ALL ';  
    Result := Result + DM.StringHolder.StringsByName['SchemaCompareIndexesSQL'].Text;
  end;
  
  if SequencesCheckBox.Checked then
  begin
    if Result <> '' then
      Result := Result + ' UNION ALL ';  
    Result := Result + DM.StringHolder.StringsByName['SchemaCompareSequencesSQL'].Text;
  end;

  if SynonymsCheckBox.Checked then
  begin
    if Result <> '' then
      Result := Result + ' UNION ALL ';
    Result := Result + DM.StringHolder.StringsByName['SchemaCompareSynonymsSQL'].Text;
  end;

  if DBLinksCheckBox.Checked then
  begin
    if Result <> '' then
      Result := Result + ' UNION ALL ';
    Result := Result + DM.StringHolder.StringsByName['SchemaCompareDBLinksSQL'].Text;
  end;
  
  if TableCommentsCheckBox.Checked then
  begin
    if Result <> '' then
      Result := Result + ' UNION ALL ';
    Result := Result + DM.StringHolder.StringsByName['SchemaCompareTableCommentsSQL'].Text;
  end;
  
  if ColumnNamesCheckBox.Checked then
  begin  
    if Result <> '' then
      Result := Result + ' UNION ALL ';
    Result := Result + DM.StringHolder.StringsByName['SchemaCompareColumnNamesSQL'].Text;
  end;
  
  if ColumnCommentsCheckBox.Checked then
  begin
    if Result <> '' then
      Result := Result + ' UNION ALL ';
    Result := Result + DM.StringHolder.StringsByName['SchemaCompareColumnCommentsSQL'].Text;
  end;

  if Result <> '' then
    Result := Result + ' ORDER BY 1, 2, 3, 4';
end;

procedure TSchemaCompareForm.DoCompare;
var
  i: Cardinal;
  Node, ChildNode, Node2, ChildNode2, PrevNode: PVirtualNode;
  NodeData, NodeData2: PCompareRec;
  CompareSQL: string;
begin
  CompareSQL := GetCompareSQL;
  { Get all objects of each schema }
  with Schema1Query do
  begin
    { To be sure session is connected. ODAC autodrops sessions if there's different home. }
    if not Session.Connected then
    begin
      Session.ConnectPrompt := False;
      Session.Connect;
      Session.ConnectPrompt := True;
    end;
    Close;
    Unprepare;
    SQL.Clear;
    SQL.Add(CompareSQL);
    if TablesCheckBox.Checked then
    begin
      ParamByName('IMG_IDX_TABLE_ROOT').AsInteger := IMG_IDX_TABLE_ROOT;
      ParamByName('IMG_IDX_TABLE_CHILD').AsInteger := IMG_IDX_TABLE_CHILD;
    end;
    if ViewsCheckBox.Checked then
    begin
      ParamByName('IMG_IDX_VIEW_ROOT').AsInteger := IMG_IDX_VIEW_ROOT;
      ParamByName('IMG_IDX_VIEW_CHILD').AsInteger := IMG_IDX_VIEW_CHILD;
    end;
    if FunctionsCheckBox.Checked then
    begin
      ParamByName('IMG_IDX_FUNCTION_ROOT').AsInteger := IMG_IDX_FUNCTION_ROOT;
      ParamByName('IMG_IDX_FUNCTION_CHILD').AsInteger := IMG_IDX_FUNCTION_CHILD;
    end;
    if ProceduresCheckBox.Checked then
    begin
      ParamByName('IMG_IDX_PROCEDURE_ROOT').AsInteger := IMG_IDX_PROCEDURE_ROOT;
      ParamByName('IMG_IDX_PROCEDURE_CHILD').AsInteger := IMG_IDX_PROCEDURE_CHILD;
    end;
    if PackagesCheckBox.Checked then
    begin
      ParamByName('IMG_IDX_PACKAGE_ROOT').AsInteger := IMG_IDX_PACKAGE_ROOT;
      ParamByName('IMG_IDX_PACKAGE_CHILD').AsInteger := IMG_IDX_PACKAGE_CHILD;
    end;
    if TriggersCheckBox.Checked then
    begin
      ParamByName('IMG_IDX_TRIGGER_ROOT').AsInteger := IMG_IDX_TRIGGER_ROOT;
      ParamByName('IMG_IDX_TRIGGER_CHILD').AsInteger := IMG_IDX_TRIGGER_CHILD;
    end;
    if ConstraintsCheckBox.Checked then
    begin
      ParamByName('IMG_IDX_CONSTRAINT_ROOT').AsInteger := IMG_IDX_CONSTRAINT_ROOT;
      ParamByName('IMG_IDX_CONSTRAINT_CHILD').AsInteger := IMG_IDX_CONSTRAINT_CHILD;
    end;
    if IndexesCheckBox.Checked then
    begin
      ParamByName('IMG_IDX_INDEX_ROOT').AsInteger := IMG_IDX_INDEX_ROOT;
      ParamByName('IMG_IDX_INDEX_CHILD').AsInteger := IMG_IDX_INDEX_CHILD;
    end;
    if SequencesCheckBox.Checked then
    begin
      ParamByName('IMG_IDX_SEQUENCE_ROOT').AsInteger := IMG_IDX_SEQUENCE_ROOT;
      ParamByName('IMG_IDX_SEQUENCE_CHILD').AsInteger := IMG_IDX_SEQUENCE_CHILD;
    end;
    if SynonymsCheckBox.Checked then
    begin
      ParamByName('IMG_IDX_SYNONYM_ROOT').AsInteger := IMG_IDX_SYNONYM_ROOT;
      ParamByName('IMG_IDX_SYNONYM_CHILD').AsInteger := IMG_IDX_SYNONYM_CHILD;
    end;
    if DBLinksCheckBox.Checked then
    begin
      ParamByName('IMG_IDX_DBLINK_ROOT').AsInteger := IMG_IDX_DBLINK_ROOT;
      ParamByName('IMG_IDX_DBLINK_CHILD').AsInteger := IMG_IDX_DBLINK_CHILD;
    end;
    if TableCommentsCheckBox.Checked then
      ParamByName('IMG_IDX_COMMENT').AsInteger := IMG_IDX_COMMENT;
    if ColumnNamesCheckBox.Checked then
      ParamByName('IMG_IDX_TABLE_COLUMN').AsInteger := IMG_IDX_TABLE_COLUMN;
    if ColumnCommentsCheckBox.Checked then
      ParamByName('IMG_IDX_COMMENT').AsInteger := IMG_IDX_COMMENT;
    ParamByName('P_OWNER').AsString := FUsername1;
    Prepare;
    Open;
    ProgressBar.Max := RecordCount;
    ProgressBar.Invalidate;
  end;
  QueryAfterOpen(Schema1VirtualDrawTree, Schema1Query);

  with Schema2Query do
  begin
    if not Session.Connected then
    begin
      Session.ConnectPrompt := False;
      Session.Connect;
      Session.ConnectPrompt := True;
    end;
    Close;
    Unprepare;
    SQL.Clear;
    SQL.Add(CompareSQL);
    if TablesCheckBox.Checked then
    begin
      ParamByName('IMG_IDX_TABLE_ROOT').AsInteger := IMG_IDX_TABLE_ROOT;
      ParamByName('IMG_IDX_TABLE_CHILD').AsInteger := IMG_IDX_TABLE_CHILD;
    end;
    if ViewsCheckBox.Checked then
    begin
      ParamByName('IMG_IDX_VIEW_ROOT').AsInteger := IMG_IDX_VIEW_ROOT;
      ParamByName('IMG_IDX_VIEW_CHILD').AsInteger := IMG_IDX_VIEW_CHILD;
    end;
    if FunctionsCheckBox.Checked then
    begin
      ParamByName('IMG_IDX_FUNCTION_ROOT').AsInteger := IMG_IDX_FUNCTION_ROOT;
      ParamByName('IMG_IDX_FUNCTION_CHILD').AsInteger := IMG_IDX_FUNCTION_CHILD;
    end;
    if ProceduresCheckBox.Checked then
    begin
      ParamByName('IMG_IDX_PROCEDURE_ROOT').AsInteger := IMG_IDX_PROCEDURE_ROOT;
      ParamByName('IMG_IDX_PROCEDURE_CHILD').AsInteger := IMG_IDX_PROCEDURE_CHILD;
    end;
    if PackagesCheckBox.Checked then
    begin
      ParamByName('IMG_IDX_PACKAGE_ROOT').AsInteger := IMG_IDX_PACKAGE_ROOT;
      ParamByName('IMG_IDX_PACKAGE_CHILD').AsInteger := IMG_IDX_PACKAGE_CHILD;
    end;
    if TriggersCheckBox.Checked then
    begin
      ParamByName('IMG_IDX_TRIGGER_ROOT').AsInteger := IMG_IDX_TRIGGER_ROOT;
      ParamByName('IMG_IDX_TRIGGER_CHILD').AsInteger := IMG_IDX_TRIGGER_CHILD;
    end;
    if ConstraintsCheckBox.Checked then
    begin
      ParamByName('IMG_IDX_CONSTRAINT_ROOT').AsInteger := IMG_IDX_CONSTRAINT_ROOT;
      ParamByName('IMG_IDX_CONSTRAINT_CHILD').AsInteger := IMG_IDX_CONSTRAINT_CHILD;
    end;
    if IndexesCheckBox.Checked then
    begin
      ParamByName('IMG_IDX_INDEX_ROOT').AsInteger := IMG_IDX_INDEX_ROOT;
      ParamByName('IMG_IDX_INDEX_CHILD').AsInteger := IMG_IDX_INDEX_CHILD;
    end;
    if SequencesCheckBox.Checked then
    begin
      ParamByName('IMG_IDX_SEQUENCE_ROOT').AsInteger := IMG_IDX_SEQUENCE_ROOT;
      ParamByName('IMG_IDX_SEQUENCE_CHILD').AsInteger := IMG_IDX_SEQUENCE_CHILD;
    end;
    if SynonymsCheckBox.Checked then
    begin
      ParamByName('IMG_IDX_SYNONYM_ROOT').AsInteger := IMG_IDX_SYNONYM_ROOT;
      ParamByName('IMG_IDX_SYNONYM_CHILD').AsInteger := IMG_IDX_SYNONYM_CHILD;
    end;
    if DBLinksCheckBox.Checked then
    begin
      ParamByName('IMG_IDX_DBLINK_ROOT').AsInteger := IMG_IDX_DBLINK_ROOT;
      ParamByName('IMG_IDX_DBLINK_CHILD').AsInteger := IMG_IDX_DBLINK_CHILD;
    end;
    if TableCommentsCheckBox.Checked then
      ParamByName('IMG_IDX_COMMENT').AsInteger := IMG_IDX_COMMENT;
    if ColumnNamesCheckBox.Checked then
      ParamByName('IMG_IDX_TABLE_COLUMN').AsInteger := IMG_IDX_TABLE_COLUMN;
    if ColumnCommentsCheckBox.Checked then
      ParamByName('IMG_IDX_COMMENT').AsInteger := IMG_IDX_COMMENT;
    ParamByName('P_OWNER').AsString := FUsername2;
    Prepare;
    Open;
  end;
  QueryAfterOpen(Schema2VirtualDrawTree, Schema2Query);

  Schema1VirtualDrawTree.BeginUpdate;
  Schema2VirtualDrawTree.BeginUpdate;
  ProgressBar.Visible := True;
  Application.ProcessMessages;
  Screen.Cursor := crHourglass;
  try
    { remove identical objects from trees }
    Node := Schema1VirtualDrawTree.GetFirst;
    Node2 := Schema2VirtualDrawTree.GetFirst;
    i := 0;
    while Assigned(Node) do
    begin
      ProgressBar.StepIt;
      i := i + Node.ChildCount + 1;
      ChildNode := Node.FirstChild;

      while Assigned(ChildNode) do
      begin
        ProgressBar.StepIt;
        NodeData := Schema1VirtualDrawTree.GetNodeData(ChildNode);
        ChildNode2 := Node2.FirstChild;
        while Assigned(ChildNode2) do
        begin
          NodeData2 := Schema2VirtualDrawTree.GetNodeData(ChildNode2);
          if (CompareStr(NodeData.ObjectName, NodeData2.ObjectName) = 0) and
             (CompareStr(NodeData.CompareResult, NodeData2.CompareResult) = 0) then
          begin
            Schema1VirtualDrawTree.DeleteNode(ChildNode);
            Schema2VirtualDrawTree.DeleteNode(ChildNode2);
            Break;
          end;
          ChildNode2 := ChildNode2.NextSibling;
        end;
        ChildNode := ChildNode.NextSibling;

      end;
      ProgressBar.Position := i;
      Node := Node.NextSibling;
      Node2 := Node2.NextSibling;
    end;
    { remove empty roots and set childcount to those which are not empty}
    Node := Schema1VirtualDrawTree.GetFirst;
    while Assigned(Node) do
    begin
      if Node.ChildCount = 0 then
      begin
        PrevNode := Node;
        Node := Node.NextSibling;
        Schema1VirtualDrawTree.DeleteNode(PrevNode)
      end
      else
      begin
        NodeData := Schema1VirtualDrawTree.GetNodeData(Node);
        NodeData.ObjectName := Format('%s [%d]', [NodeData.ObjectName, Node.ChildCount]);
        Node := Node.NextSibling;
      end;
    end;
    Node := Schema2VirtualDrawTree.GetFirst;
    while Assigned(Node) do
    begin
      if Node.ChildCount = 0 then
      begin
        PrevNode := Node;
        Node := Node.NextSibling;
        Schema2VirtualDrawTree.DeleteNode(PrevNode);
      end
      else
      begin
        NodeData := Schema2VirtualDrawTree.GetNodeData(Node);
        NodeData.ObjectName := Format('%s [%d]', [NodeData.ObjectName, Node.ChildCount]);
        Node := Node.NextSibling;
      end;
    end;
  finally
    Schema1VirtualDrawTree.EndUpdate;
    Schema2VirtualDrawTree.EndUpdate;
    ProgressBar.Visible := False;
    StatusBar.Panels[0].Text := 'Done';
    Screen.Cursor := crDefault;
  end;
end;

procedure TSchemaCompareForm.Schema1ComboBoxChange(Sender: TObject);
begin
  Schema1TabSheet.Caption := Schema1ComboBox.Text;
  Schema1Query.Session := TOraSession(FSessionList.Items[Schema1ComboBox.ItemIndex]);
  FUsername1 := Schema1Query.Session.Username;
  Application.ProcessMessages;
  if Schema2ComboBox.Text <> '' then
    DoCompare;
end;

procedure TSchemaCompareForm.Schema1ComboBoxDrawItem(Control: TWinControl; Index: Integer;
  Rect: TRect; State: TOwnerDrawState);
begin
  { ensure the correct highlite color is used }
  Schema1ComboBox.Canvas.FillRect(Rect);
  { write the text }
  Schema1ComboBox.Canvas.TextOut(Rect.Left + 3, Rect.Top + 1, Schema1ComboBox.Items.Strings[Index]);
end;

procedure TSchemaCompareForm.QueryAfterOpen(VirtualDrawTree: TVirtualDrawTree; SchemaQuery: TOraQuery);
var
  ObjectType: string;
  Node, ParentNode: PVirtualNode;
  NodeData: PCompareRec;
begin
  VirtualDrawTree.Clear;
  VirtualDrawTree.NodeDataSize := SizeOf(TSearchRec);
  VirtualDrawTree.BeginUpdate;
  with SchemaQuery do
  begin
    First;
    ObjectType := '';
    ParentNode := nil;
    while not Eof do
    begin
      if ObjectType <> FieldByName('OBJECT_TYPE').AsString then
      begin
        if Assigned(ParentNode) then
        begin
          NodeData := VirtualDrawTree.GetNodeData(ParentNode);
          NodeData.ObjectName := NodeData.ObjectName
        end;
        Node := VirtualDrawTree.AddChild(nil);
        NodeData := VirtualDrawTree.GetNodeData(Node);
        NodeData.Level := 0;
        NodeData.ObjectName := FieldByName('OBJECT_TYPE').AsString;
        NodeData.ImageIndex := FieldByName('LEVEL0_INDEX').AsInteger;
        ParentNode := Node;
      end;
      Node := VirtualDrawTree.AddChild(ParentNode);
      NodeData := VirtualDrawTree.GetNodeData(Node);
      NodeData.Level := 1;
      NodeData.CompareResult := FieldByName('COMPARE_RESULT').AsString;
      NodeData.ObjectName := FieldByName('OBJECT_NAME').AsString;
      NodeData.ImageIndex := FieldByName('LEVEL1_INDEX').AsInteger;
      ObjectType := FieldByName('OBJECT_TYPE').AsString;
      Next;
    end;
  end;
  VirtualDrawTree.EndUpdate;
end;

procedure TSchemaCompareForm.Schema2ComboBoxChange(Sender: TObject);
begin
  Schema2TabSheet.Caption := Schema2ComboBox.Text;
  Schema2Query.Session := TOraSession(FSessionList.Items[Schema2ComboBox.ItemIndex]);
  FUsername2 := Schema2Query.Session.Username;
  Application.ProcessMessages;
  if Schema1ComboBox.Text <> '' then
    DoCompare;
end;

procedure TSchemaCompareForm.Schema2ComboBoxDrawItem(Control: TWinControl; Index: Integer;
  Rect: TRect; State: TOwnerDrawState);
begin
  { ensure the correct highlite color is used }
  Schema2ComboBox.Canvas.FillRect(Rect);
  { write the text }
  Schema2ComboBox.Canvas.TextOut(Rect.Left + 3, Rect.Top + 1, Schema2ComboBox.Items.Strings[Index]);
end;

procedure TSchemaCompareForm.VirtualDrawTreeDrawNode(Sender: TBaseVirtualTree;
  const PaintInfo: TVTPaintInfo);
var
  Data: PCompareRec;
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
      0: S := Data.ObjectName;
      1: S := Data.CompareResult;
    end;

    if Length(S) > 0 then
    begin
      with R do
      begin
        if (NodeWidth - 2 * Margin) > (Right - Left) then
          S := ShortenString(Canvas.Handle, S, Right - Left);
      end;
      Format := DT_TOP or DT_LEFT or DT_VCENTER or DT_SINGLELINE;
      DrawTextW(Canvas.Handle, PWideChar(S), Length(S), R, Format)
    end;

  end;
end;

procedure TSchemaCompareForm.VirtualDrawTreeFreeNode(Sender: TBaseVirtualTree; Node: PVirtualNode);
var
  Data: PCompareRec;
begin
  Data := Sender.GetNodeData(Node);
  if Assigned(Data) then
  begin
    Data^.Level := 0;
    Data^.ObjectName := '';
    Data^.CompareResult := '';
    Data^.ImageIndex := 0;
  end;
end;

procedure TSchemaCompareForm.VirtualDrawTreeGetImageIndex(Sender: TBaseVirtualTree;
  Node: PVirtualNode; Kind: TVTImageKind; Column: TColumnIndex; var Ghosted: Boolean;
  var ImageIndex: Integer);
var
  Data: PCompareRec;
begin
  if Kind in [ikNormal, ikSelected] then
  begin
    Data := TVirtualDrawTree(Sender).GetNodeData(Node);
    if Column = 0 then
      ImageIndex := Data.ImageIndex;
  end;
end;

procedure TSchemaCompareForm.VirtualDrawTreeGetNodeWidth(Sender: TBaseVirtualTree;
  HintCanvas: TCanvas; Node: PVirtualNode; Column: TColumnIndex; var NodeWidth: Integer);
var
  Data: PCompareRec;
begin
  with Sender as TVirtualDrawTree do
  begin
    Data := Sender.GetNodeData(Node);
    if Assigned(Data) then
    case Column of
      0: NodeWidth := Canvas.TextWidth(Trim(Data.ObjectName)) + 2 * TextMargin;
      1: NodeWidth := Canvas.TextWidth(Trim(Data.CompareResult)) + 2 * TextMargin;
    end;
  end;
end;

procedure TSchemaCompareForm.ReadIniFile;
begin
  with TBigIniFile.Create(GetINIFilename) do
  try
    { Size }
    Width := ReadInteger('SchemaCompareSize', 'Width', Round(Screen.Width * 0.5));
    Height := ReadInteger('SchemaCompareSize', 'Height', Round(Screen.Height * 0.5));
    { Position }
    Left := ReadInteger('SchemaComparePosition', 'Left', (Screen.Width - Width) div 2);
    Top := ReadInteger('SchemaComparePosition', 'Top', (Screen.Height - Height) div 2);
    { Check if the form is outside the workarea }
    Left := SetFormInsideWorkArea(Left, Width);
  finally
    Free;
  end;
end;

procedure TSchemaCompareForm.WriteIniFile;
begin
  if Windowstate = wsNormal then
  with TBigIniFile.Create(GetINIFilename) do
  try
    { Position }
    WriteInteger('SchemaComparePosition', 'Left', Left);
    WriteInteger('SchemaComparePosition', 'Top', Top);
    { Size }
    WriteInteger('SchemaCompareSize', 'Width', Width);
    WriteInteger('SchemaCompareSize', 'Height', Height);
  finally
    Free;
  end;
end;

end.
