unit ObjectSearch;

interface

uses
  Winapi.Windows, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms,
  Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, JvExButtons, JvBitBtn, Vcl.ExtCtrls, BCControls.Edit, BCDialogs.Dlg,
  ComCtrls, DB, DBAccess, Ora, MemDS, ActnList, VirtualTrees, Vcl.ImgList, System.Actions, BCCommon.Images,
  BCControls.CheckBox;

type
  TObjectSearhForm = class(TDialog)
    ButtonPanel: TPanel;
    SearchForLabel: TLabel;
    SearchForEdit: TBCEdit;
    CaseSensitiveCheckBox: TBCCheckBox;
    SearchBitBtn: TJvBitBtn;
    StatusBar: TStatusBar;
    TreePanel: TPanel;
    ObjectSearchQuery: TOraQuery;
    ActionList: TActionList;
    SearchAction: TAction;
    VirtualDrawTree: TVirtualDrawTree;
    ColumnsQuery: TOraQuery;
    procedure FormDestroy(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SearchActionExecute(Sender: TObject);
    procedure ObjectSearchQueryAfterOpen(DataSet: TDataSet);
    procedure VirtualDrawTreeDrawNode(Sender: TBaseVirtualTree; const PaintInfo: TVTPaintInfo);
    procedure VirtualDrawTreeFreeNode(Sender: TBaseVirtualTree; Node: PVirtualNode);
    procedure VirtualDrawTreeGetImageIndex(Sender: TBaseVirtualTree; Node: PVirtualNode;
      Kind: TVTImageKind; Column: TColumnIndex; var Ghosted: Boolean; var ImageIndex: Integer);
    procedure VirtualDrawTreeGetNodeWidth(Sender: TBaseVirtualTree; HintCanvas: TCanvas;
      Node: PVirtualNode; Column: TColumnIndex; var NodeWidth: Integer);
    procedure SearchForEditKeyPress(Sender: TObject; var Key: Char);
    procedure VirtualDrawTreeInitNode(Sender: TBaseVirtualTree; ParentNode, Node: PVirtualNode;
      var InitialStates: TVirtualNodeInitStates);
    procedure VirtualDrawTreeInitChildren(Sender: TBaseVirtualTree; Node: PVirtualNode;
      var ChildCount: Cardinal);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Open(OraSession: TOraSession);
  end;

function ObjectSearhForm: TObjectSearhForm;

implementation

{$R *.DFM}

uses
  DataModule, Vcl.Themes, BCCommon.StyleUtils, System.UITypes;

type
  PSearchRec = ^TSearchRec;
  TSearchRec = record
    Level: Byte;
    ObjectName: string;
    SearchResult: string;
    ImageIndex: Byte;
  end;

var
  FObjectSearhForm: TObjectSearhForm;

function ObjectSearhForm: TObjectSearhForm;
begin
  if not Assigned(FObjectSearhForm) then
    Application.CreateForm(TObjectSearhForm, FObjectSearhForm);
  Result := FObjectSearhForm;
  SetStyledFormSize(Result);
end;

procedure TObjectSearhForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ObjectSearchQuery.Close;
  ColumnsQuery.Close;
  Action := caFree;
end;

procedure TObjectSearhForm.FormDestroy(Sender: TObject);
begin
  FObjectSearhForm := nil;
end;

procedure TObjectSearhForm.ObjectSearchQueryAfterOpen(DataSet: TDataSet);
var
  i: Integer;
  ObjectType: string;
  Node, ParentNode: PVirtualNode;
  NodeData: PSearchRec;
begin
  VirtualDrawTree.Clear;
  VirtualDrawTree.NodeDataSize := SizeOf(TSearchRec);
  VirtualDrawTree.BeginUpdate;
  with ObjectSearchQuery do
  begin
    First;
    ObjectType := '';
    ParentNode := nil;
    i := 0;
    while not Eof do
    begin
      if ObjectType <> FieldByName('OBJECT_TYPE').AsString then
      begin
        if Assigned(ParentNode) then
        begin
          NodeData := VirtualDrawTree.GetNodeData(ParentNode);
          NodeData.ObjectName := NodeData.ObjectName + Format(' [%d]', [i]);
        end;
        i := 0;
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
      NodeData.SearchResult := FieldByName('SEARCH_RESULT').AsString;
      NodeData.ObjectName := FieldByName('OBJECT_NAME').AsString;
      NodeData.ImageIndex := FieldByName('LEVEL1_INDEX').AsInteger;
      ObjectType := FieldByName('OBJECT_TYPE').AsString;
      Next;
      Inc(i);
    end;
    if Assigned(ParentNode) then
    begin
      NodeData := VirtualDrawTree.GetNodeData(ParentNode);
      NodeData.ObjectName := NodeData.ObjectName + Format(' [%d]', [i]);
    end;
  end;
  VirtualDrawTree.EndUpdate;
end;

procedure TObjectSearhForm.Open(OraSession: TOraSession);
begin
  ObjectSearchQuery.Session := OraSession;
  ColumnsQuery.Session := OraSession;
  Show;
end;

procedure TObjectSearhForm.SearchActionExecute(Sender: TObject);
var
  T1, T2: TTime;
  Min, Secs: Integer;
  TimeDifference: string;
begin
  T1 := Now;
  with ObjectSearchQuery do
  begin
    Close;
    Unprepare;
    SQL.Clear;
    if CaseSensitiveCheckBox.Checked then
      SQL.Add(DM.StringHolder.StringsByName['SearchCaseSensitiveSQL'].Text)
    else
      SQL.Add(DM.StringHolder.StringsByName['SearchNotCaseSensitiveSQL'].Text);
    ParamByName('IMG_IDX_TABLE_ROOT').AsInteger := IMG_IDX_TABLE_ROOT;
    ParamByName('IMG_IDX_TABLE_CHILD').AsInteger := IMG_IDX_TABLE_CHILD;
    ParamByName('IMG_IDX_VIEW_ROOT').AsInteger := IMG_IDX_VIEW_ROOT;
    ParamByName('IMG_IDX_VIEW_CHILD').AsInteger := IMG_IDX_VIEW_CHILD;
    ParamByName('IMG_IDX_FUNCTION_ROOT').AsInteger := IMG_IDX_FUNCTION_ROOT;
    ParamByName('IMG_IDX_FUNCTION_CHILD').AsInteger := IMG_IDX_FUNCTION_CHILD;
    ParamByName('IMG_IDX_PROCEDURE_ROOT').AsInteger := IMG_IDX_PROCEDURE_ROOT;
    ParamByName('IMG_IDX_PROCEDURE_CHILD').AsInteger := IMG_IDX_PROCEDURE_CHILD;
    ParamByName('IMG_IDX_PACKAGE_ROOT').AsInteger := IMG_IDX_PACKAGE_ROOT;
    ParamByName('IMG_IDX_PACKAGE_CHILD').AsInteger := IMG_IDX_PACKAGE_CHILD;
    ParamByName('IMG_IDX_TRIGGER_ROOT').AsInteger := IMG_IDX_TRIGGER_ROOT;
    ParamByName('IMG_IDX_TRIGGER_CHILD').AsInteger := IMG_IDX_TRIGGER_CHILD;
    ParamByName('IMG_IDX_CONSTRAINT_ROOT').AsInteger := IMG_IDX_CONSTRAINT_ROOT;
    ParamByName('IMG_IDX_CONSTRAINT_CHILD').AsInteger := IMG_IDX_CONSTRAINT_CHILD;
    ParamByName('IMG_IDX_INDEX_ROOT').AsInteger := IMG_IDX_INDEX_ROOT;
    ParamByName('IMG_IDX_INDEX_CHILD').AsInteger := IMG_IDX_INDEX_CHILD;
    ParamByName('IMG_IDX_SEQUENCE_ROOT').AsInteger := IMG_IDX_SEQUENCE_ROOT;
    ParamByName('IMG_IDX_SEQUENCE_CHILD').AsInteger := IMG_IDX_SEQUENCE_CHILD;
    ParamByName('IMG_IDX_SYNONYM_ROOT').AsInteger := IMG_IDX_SYNONYM_ROOT;
    ParamByName('IMG_IDX_SYNONYM_CHILD').AsInteger := IMG_IDX_SYNONYM_CHILD;
    ParamByName('IMG_IDX_DBLINK_ROOT').AsInteger := IMG_IDX_DBLINK_ROOT;
    ParamByName('IMG_IDX_DBLINK_CHILD').AsInteger := IMG_IDX_DBLINK_CHILD;
    ParamByName('SEARCHSTRING').AsString := SearchForEdit.Text;
    Prepare;
    Open;
  end;

  with ColumnsQuery do
  begin
    Close;
    Unprepare;
    SQL.Clear;
    if CaseSensitiveCheckBox.Checked then
      SQL.Add(DM.StringHolder.StringsByName['SearchColumnsCaseSensitiveSQL'].Text)
    else
      SQL.Add(DM.StringHolder.StringsByName['SearchColumnsNotCaseSensitiveSQL'].Text);
    ParamByName('SEARCHSTRING').AsString := SearchForEdit.Text;
    Prepare;
    Open;
  end;

  if not ObjectSearchQuery.IsEmpty then
  begin
    T2 := Now;
    Min := StrToInt(FormatDateTime('n', T2 - T1));
    Secs := Min * 60 + StrToInt(FormatDateTime('s', T2 - T1));
    if Secs < 60 then
      TimeDifference := FormatDateTime('s.zzz "s"', T2 - T1)
    else
      TimeDifference := FormatDateTime('n "min" s.zzz "s"', T2 - T1);
    StatusBar.SimpleText := Format('%d occurence(s) have been found in %s', [ObjectSearchQuery.RecordCount, TimeDifference])
  end
  else
    StatusBar.SimpleText := Format('Cannot find the string ''%s''', [SearchForEdit.Text]);
end;

procedure TObjectSearhForm.SearchForEditKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    SearchAction.Execute;
    Key := #0;
  end;
end;

procedure TObjectSearhForm.VirtualDrawTreeDrawNode(Sender: TBaseVirtualTree;
  const PaintInfo: TVTPaintInfo);
var
  Data: PSearchRec;
  S, Temp: UnicodeString;
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
      1: begin
           if (Data.Level = 1) and (Data.SearchResult = 'Object name') and (Pos(UpperCase(SearchForEdit.Text), UpperCase(Data.ObjectName)) = 0) then
             S := ''
           else
             S := Data.SearchResult;
         end;
    end;

    if Length(S) > 0 then
    begin
      with R do
      begin
        if (NodeWidth - 2 * Margin) > (Right - Left) then
          S := ShortenString(Canvas.Handle, S, Right - Left);
      end;
      Format := DT_TOP or DT_LEFT or DT_VCENTER or DT_SINGLELINE;
      if (Data.Level = 0) or (Pos(UpperCase(SearchForEdit.Text), UpperCase(S)) = 0) then
        DrawTextW(Canvas.Handle, PWideChar(S), Length(S), R, Format)
      else
      begin
        Temp := Copy(String(S), 1, Pos(UpperCase(SearchForEdit.Text), UpperCase(S)) - 1);
        DrawTextW(Canvas.Handle, PWideChar(Temp), Length(Temp), R, Format);
        R.Left := R.Left + Canvas.TextWidth(Temp);
        Canvas.Font.Color := clRed;
        Temp := Copy(String(S), Pos(UpperCase(SearchForEdit.Text), UpperCase(S)), Length(SearchForEdit.Text));
        Canvas.Font.Style := Canvas.Font.Style + [fsBold];
        DrawTextW(Canvas.Handle, PWideChar(Temp), Length(Temp), R, Format);
        Canvas.Font.Color := LColor;
        R.Left := R.Left + Canvas.TextWidth(Temp);
        Canvas.Font.Style := Canvas.Font.Style - [fsBold];
        Temp := Copy(String(S), Pos(UpperCase(SearchForEdit.Text), UpperCase(S)) + Length(SearchForEdit.Text), Length(String(S)));
        DrawTextW(Canvas.Handle, PWideChar(Temp), Length(Temp), R, Format);
      end;
    end;

  end;
end;

procedure TObjectSearhForm.VirtualDrawTreeFreeNode(Sender: TBaseVirtualTree; Node: PVirtualNode);
var
  Data: PSearchRec;
begin
  Data := Sender.GetNodeData(Node);
  if Assigned(Data) then
  begin
    Data^.Level := 0;
    Data^.ObjectName := '';
    Data^.SearchResult := '';
    Data^.ImageIndex := 0;
  end;
end;

procedure TObjectSearhForm.VirtualDrawTreeGetImageIndex(Sender: TBaseVirtualTree;
  Node: PVirtualNode; Kind: TVTImageKind; Column: TColumnIndex; var Ghosted: Boolean;
  var ImageIndex: Integer);
var
  Data: PSearchRec;
begin
  if Kind in [ikNormal, ikSelected] then
  begin
    Data := VirtualDrawTree.GetNodeData(Node);
    if Column = 0 then
      ImageIndex := Data.ImageIndex;
  end;
end;

procedure TObjectSearhForm.VirtualDrawTreeGetNodeWidth(Sender: TBaseVirtualTree;
  HintCanvas: TCanvas; Node: PVirtualNode; Column: TColumnIndex; var NodeWidth: Integer);
var
  Data: PSearchRec;
  BoldWidth: Integer;
begin
  with Sender as TVirtualDrawTree do
  begin
    Data := Sender.GetNodeData(Node);
    if Assigned(Data) then
    begin
      BoldWidth := 0;
      if (Pos(SearchForEdit.Text, Data.ObjectName) <> 0) or
        (Pos(SearchForEdit.Text, Data.SearchResult) <> 0) then
      begin
        Canvas.Font.Style := Canvas.Font.Style + [fsBold];
        BoldWidth := Canvas.TextWidth(SearchForEdit.Text);
        Canvas.Font.Style := Canvas.Font.Style - [fsBold];
        BoldWidth := BoldWidth - Canvas.TextWidth(string(SearchForEdit.Text));
      end;

      case Column of
        0: NodeWidth := Canvas.TextWidth(Trim(Data.ObjectName)) + 2 * TextMargin + BoldWidth;
        1: NodeWidth := Canvas.TextWidth(Trim(Data.SearchResult)) + 2 * TextMargin + BoldWidth;
      end;
    end;
  end;
end;

procedure TObjectSearhForm.VirtualDrawTreeInitChildren(Sender: TBaseVirtualTree; Node: PVirtualNode;
  var ChildCount: Cardinal);
var
  Data, ChildData, CommentData: PSearchRec;
  ChildNode, CommentNode: PVirtualNode;
begin
  Data := VirtualDrawTree.GetNodeData(Node);
  if ColumnsQuery.Locate('OBJECT_NAME', Data.ObjectName, []) then
  begin
    while not ColumnsQuery.Eof and (ColumnsQuery.FieldByName('OBJECT_NAME').AsString = Data.ObjectName) do
    begin
      { table comment }
      if ColumnsQuery.FieldByName('ID').AsInteger = 1 then
      begin
        CommentNode := VirtualDrawTree.AddChild(Node);
        CommentData := VirtualDrawTree.GetNodeData(CommentNode);
        CommentData.Level := 3;
        CommentData.ObjectName := 'Table comment';
        CommentData.SearchResult := ColumnsQuery.FieldByName('SEARCH_RESULT').AsString;
        CommentData.ImageIndex := IMG_IDX_COMMENT;
        ColumnsQuery.Next;
      end
      else
      begin
        { column name }
        ChildNode := VirtualDrawTree.AddChild(Node);
        ChildData := VirtualDrawTree.GetNodeData(ChildNode);
        ChildData.Level := 2;
        ChildData.ObjectName := ColumnsQuery.FieldByName('COLUMN_NAME').AsString;
        ChildData.SearchResult := ColumnsQuery.FieldByName('SEARCH_RESULT').AsString;
        ChildData.ImageIndex := IMG_IDX_TABLE_COLUMN;
        ColumnsQuery.Next;

        { if the next row has the same column name then it's a column comment }
        if not ColumnsQuery.Eof and (ColumnsQuery.FieldByName('OBJECT_NAME').AsString = Data.ObjectName) and
          (ColumnsQuery.FieldByName('COLUMN_NAME').AsString = ChildData.ObjectName) then
        begin
          CommentNode := VirtualDrawTree.AddChild(ChildNode);
          CommentData := VirtualDrawTree.GetNodeData(CommentNode);
          CommentData.Level := 3;
          CommentData.ObjectName := 'Column comment';
          CommentData.SearchResult := ColumnsQuery.FieldByName('SEARCH_RESULT').AsString;
          CommentData.ImageIndex := IMG_IDX_COMMENT;
          ColumnsQuery.Next;
        end;
      end;
    end;
    ChildCount := VirtualDrawTree.ChildCount[Node];
  end;
end;

procedure TObjectSearhForm.VirtualDrawTreeInitNode(Sender: TBaseVirtualTree; ParentNode,
  Node: PVirtualNode; var InitialStates: TVirtualNodeInitStates);
var
  Data: PSearchRec;
begin
  inherited;
  Data := VirtualDrawTree.GetNodeData(Node);
  if ColumnsQuery.Active and ColumnsQuery.Locate('OBJECT_NAME', Data.ObjectName, []) then
    Include(InitialStates, ivsHasChildren);
end;

end.
