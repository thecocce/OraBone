unit SchemaCompare;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms,
  Vcl.Dialogs, Vcl.ImgList, ComCtrls, JvExComCtrls, JvComCtrls, BCControls.PageControl, Vcl.StdCtrls, Vcl.Buttons,
  JvExButtons, JvBitBtn, Vcl.ExtCtrls, ToolWin, JvExStdCtrls, JvCombobox, BCControls.ComboBox, VirtualTrees, DB,
  MemDS, DBAccess, Ora, JvStatusBar, BCControls.ProgressBar, BCDialogs.Dlg, JvProgressBar;

type
  TSchemaCompareForm = class(TDialog)
    PageControl: TBCPageControl;
    Schema1TabSheet: TTabSheet;
    Schema2TabSheet: TTabSheet;
    StatusBar: TJvStatusBar;
    TreeImageList: TImageList;
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
    TablesCheckBox: TCheckBox;
    ViewsCheckBox: TCheckBox;
    FunctionsCheckBox: TCheckBox;
    ProceduresCheckBox: TCheckBox;
    PackagesCheckBox: TCheckBox;
    TriggersCheckBox: TCheckBox;
    ConstraintsCheckBox: TCheckBox;
    IndexesCheckBox: TCheckBox;
    SequencesCheckBox: TCheckBox;
    SynonymsCheckBox: TCheckBox;
    DBLinksCheckBox: TCheckBox;
    TableCommentsCheckBox: TCheckBox;
    ColumnNamesCheckBox: TCheckBox;
    ColumnCommentsCheckBox: TCheckBox;
    ProgressBar: TBCProgressBar;
    procedure FormDestroy(Sender: TObject);
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
  private
    { Private declarations }
    FUsername1, FUsername2: string;
    FSessionList: TList;
    procedure DoCompare;
    procedure QueryAfterOpen(VirtualDrawTree: TVirtualDrawTree; SchemaQuery: TOraQuery);
    function GetCompareSQL: string;
  public
    { Public declarations }

    procedure Open(const SessionList: TList);
  end;

function SchemaCompareForm: TSchemaCompareForm;

implementation

{$R *.dfm}

uses
  DataModule, Vcl.Themes, BCCommon.StyleUtils;

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
  Schema1Query.Close;
  Schema2Query.Close;
  Action := caFree;
end;

procedure TSchemaCompareForm.FormDestroy(Sender: TObject);
begin
  FSchemaCompareForm := nil;
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
  Node, ChildNode, Node2, ChildNode2: PVirtualNode;
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
    ParamByName('P_OWNER').AsString := FUsername1;
    Prepare;
    Open;
    ProgressBar.Max := RecordCount;
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
      //NodeData := Schema1VirtualDrawTree.GetNodeData(Node);
      //SimpleText := 'Comparing ' + LowerCase(NodeData.ObjectName) + ' (%d/' + IntToStr(Node.ChildCount) + ')';
      //i := 1;
      ProgressBar.StepIt;
      i := i + Node.ChildCount + 1;
      ChildNode := Node.FirstChild;
    
      while Assigned(ChildNode) do
      begin
        ProgressBar.StepIt;
        //ProgressBar1.
        //StatusBar.Panels[0].Text := Format(SimpleText, [i]);
        //Application.ProcessMessages;
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
          //else
          //if CompareStr(NodeData.ObjectName, NodeData2.ObjectName) < 0 then
          //  Break;
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
        Schema1VirtualDrawTree.DeleteNode(Node)
      else
      begin
        NodeData := Schema1VirtualDrawTree.GetNodeData(Node);
        NodeData.ObjectName := Format('%s [%d]', [NodeData.ObjectName, Node.ChildCount]);
      end;
      Node := Node.NextSibling;
    end;
    Node := Schema2VirtualDrawTree.GetFirst;
    while Assigned(Node) do
    begin
      if Node.ChildCount = 0 then
        Schema2VirtualDrawTree.DeleteNode(Node)
      else
      begin
        NodeData := Schema2VirtualDrawTree.GetNodeData(Node);
        NodeData.ObjectName := Format('%s [%d]', [NodeData.ObjectName, Node.ChildCount]);
      end;
      Node := Node.NextSibling;
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
  //i: Integer;
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
    //i := 0;
    while not Eof do
    begin
      if ObjectType <> FieldByName('OBJECT_TYPE').AsString then
      begin
        if Assigned(ParentNode) then
        begin
          NodeData := VirtualDrawTree.GetNodeData(ParentNode);
          NodeData.ObjectName := NodeData.ObjectName {+ Format(' [%d]', [i])};
        end;
        //i := 0;
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
      //Inc(i);
    end;
    (*if Assigned(ParentNode) then
    begin
      NodeData := VirtualDrawTree.GetNodeData(ParentNode);
      NodeData.ObjectName := NodeData.ObjectName {+ Format(' [%d]', [i])};
    end; *)
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

    {Canvas.Font.Color := clWindowText;
    if (Column = FocusedColumn) and (not Focused) then
    begin
      Canvas.Brush.Color := clBtnFace;
      Canvas.Font.Color := clBlack;
    end; }

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

    case Column of
      0: NodeWidth := Canvas.TextWidth(Trim(Data.ObjectName)) + 2 * TextMargin;
      1: NodeWidth := Canvas.TextWidth(Trim(Data.CompareResult)) + 2 * TextMargin;
    end;
  end;
end;

end.
