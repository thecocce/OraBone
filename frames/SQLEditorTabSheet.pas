unit SQLEditorTabSheet;

interface

uses
  Winapi.Windows, Winapi.Messages, System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls,
  SynEdit, BCControls.OraSynEdit, SynCompletionProposal;

type
  TSQLEditorTabSheetFrame = class(TFrame)
    Panel: TPanel;
    OraSynEdit: TBCOraSynEdit;
    SynCompletionProposal: TSynCompletionProposal;
    OraSynEditMiniMap: TBCOraSynEdit;
    SynEditSplitter: TSplitter;
    procedure SynCompletionProposalExecute(Kind: SynCompletionType; Sender: TObject; var CurrentInput: string; var x,
      y: Integer; var CanExecute: Boolean);
    procedure OraSynEditMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure OraSynEditMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure OraSynEditMouseWheel(Sender: TObject; Shift: TShiftState; WheelDelta: Integer; MousePos: TPoint;
      var Handled: Boolean);
    procedure OraSynEditGutterClick(Sender: TObject; Button: TMouseButton; X, Y, Line: Integer; Mark: TSynEditMark);
    procedure OraSynEditKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure OraSynEditKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure OraSynEditMiniMapClick(Sender: TObject);
    procedure OraSynEditMiniMapKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure OraSynEditMiniMapKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure OraSynEditMiniMapMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure OraSynEditMiniMapMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure OraSynEditMiniMapMouseWheel(Sender: TObject; Shift: TShiftState; WheelDelta: Integer; MousePos: TPoint;
      var Handled: Boolean);
    procedure OraSynEditMiniMapPaint(Sender: TObject; ACanvas: TCanvas);
    procedure OraSynEditMiniMapScroll(Sender: TObject; ScrollBar: TScrollBarKind);
  private
    { Private declarations }
    OldSynEditProc, OldSynEditMinimapProc: TWndMethod;
    function GetMinimapVisible: Boolean;
    procedure SynEditGotoLine(SynEdit, SynEditMiniMap: TBCOraSynEdit);
    procedure SynEditMinimapGotoLine(SynEdit, SynEditMiniMap: TBCOraSynEdit);
    procedure SetMinimapVisible(Value: Boolean);
    procedure SynEditWindowProc(var Message: TMessage);
    procedure SynEditMinimapWindowProc(var Message: TMessage);
    procedure Paint(ACanvas: TCanvas; SynEdit, SynEditMiniMap: TBCOraSynEdit);
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    procedure UpdateOptionsAndStyles(Right: Integer);
    property MinimapVisible: Boolean read GetMinimapVisible write SetMinimapVisible;
  end;

implementation

{$R *.dfm}

uses
  System.SysUtils, Vcl.Themes, BCCommon.StringUtils, Options, BCCommon.StyleUtils, Math;

const
  TAG_ZERO = 0;
  TAG_NO_MOVE_EVENTS = 1;
  TAG_POINT_IN_SELECTION = 2;

constructor TSQLEditorTabSheetFrame.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Panel.Padding.Right := GetRightPadding;
  UpdateOptionsAndStyles(Panel.Padding.Right);

  SynEditSplitter.Width := GetSplitterSize;
  UpdateOptionsAndStyles(Panel.Padding.Right);

  OldSynEditProc := OraSynEdit.WindowProc;
  OldSynEditMinimapProc := OraSynEditMinimap.WindowProc;
  OraSynEdit.WindowProc := SynEditWindowProc;
  OraSynEditMinimap.WindowProc := SynEditMinimapWindowProc;
end;

procedure TSQLEditorTabSheetFrame.SynEditWindowProc(var Message: TMessage);
begin
  OldSynEditProc(Message);
  if (Message.Msg = WM_VSCROLL) or (Message.msg = WM_Mousewheel) then
    OldSynEditMinimapProc(Message);
end;

procedure TSQLEditorTabSheetFrame.SynEditMinimapWindowProc(var Message: TMessage);
begin
  OldSynEditMinimapProc(Message);
  if (Message.Msg = WM_VSCROLL) or (Message.msg = WM_Mousewheel) then
    OldSynEditProc(Message);
end;

procedure TSQLEditorTabSheetFrame.OraSynEditGutterClick(Sender: TObject; Button: TMouseButton; X, Y, Line: Integer;
  Mark: TSynEditMark);
begin
  OraSynEdit.CaretX := 0;
  OraSynEdit.CaretY := Line;
  if X < OraSynEdit.Gutter.LeftOffset then
    OraSynEdit.ToggleBookMark;
  SynEditMinimapGotoLine(OraSynEdit, OraSynEditMiniMap);
end;

procedure TSQLEditorTabSheetFrame.OraSynEditKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  SynEditMinimapGotoLine(OraSynEdit, OraSynEditMiniMap);
end;

procedure TSQLEditorTabSheetFrame.OraSynEditKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  SynEditMinimapGotoLine(OraSynEdit, OraSynEditMiniMap);
end;

procedure TSQLEditorTabSheetFrame.OraSynEditMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X,
  Y: Integer);
begin
  OraSynEdit.Tag := TAG_ZERO;
  SynEditMinimapGotoLine(OraSynEdit, OraSynEditMiniMap);
  if OraSynEdit.SelAvail then
    if OraSynEdit.IsPointInSelection(OraSynEdit.DisplayToBufferPos(OraSynEdit.PixelsToRowColumn(X, Y))) then
      OraSynEdit.Tag := TAG_POINT_IN_SELECTION;
end;

procedure TSQLEditorTabSheetFrame.OraSynEditMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
  if (Shift = [ssLeft]) then
    if X > OraSynEdit.Gutter.LeftOffset then
      SynEditMinimapGotoLine(OraSynEdit, OraSynEditMiniMap);
end;

procedure TSQLEditorTabSheetFrame.OraSynEditMouseWheel(Sender: TObject; Shift: TShiftState; WheelDelta: Integer;
  MousePos: TPoint; var Handled: Boolean);
begin
  SynEditMinimapGotoLine(OraSynEdit, OraSynEditMiniMap);
end;

procedure TSQLEditorTabSheetFrame.OraSynEditMiniMapClick(Sender: TObject);
begin
  SynEditGotoLine(OraSynEdit, OraSynEditMiniMap);
end;

procedure TSQLEditorTabSheetFrame.SynEditMinimapGotoLine(SynEdit, SynEditMiniMap: TBCOraSynEdit);
begin
  if SynEdit.Tag = TAG_NO_MOVE_EVENTS then
    Exit;
  if not MinimapVisible then
    Exit;

  if not SynEdit.SelAvail or (SynEdit.Tag = TAG_POINT_IN_SELECTION) then
  begin
    SynEditMiniMap.Text := SynEdit.Text;
    if SynEditMiniMap.CaretY <> SynEdit.CaretY then
    begin
      SynEditMiniMap.GotoLineAndCenter(SynEdit.CaretY);
      SynEditMiniMap.Invalidate;
    end;
    if SynEdit.Tag = TAG_POINT_IN_SELECTION then
      SynEdit.Tag := TAG_NO_MOVE_EVENTS;
  end
  else
  begin
    SynEditMiniMap.SelStart := SynEdit.SelStart;
    SynEditMiniMap.SelEnd := SynEdit.SelEnd;
  end
end;

procedure TSQLEditorTabSheetFrame.OraSynEditMiniMapKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  SynEditGotoLine(OraSynEdit, OraSynEditMinimap);
end;

procedure TSQLEditorTabSheetFrame.OraSynEditMiniMapKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  SynEditGotoLine(OraSynEdit, OraSynEditMinimap);
end;

procedure TSQLEditorTabSheetFrame.OraSynEditMiniMapMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X,
  Y: Integer);
begin
  OraSynEditMinimap.Tag := TAG_ZERO;
  SynEditGotoLine(OraSynEdit, OraSynEditMinimap);
  if OraSynEditMinimap.SelAvail then
    if OraSynEditMinimap.IsPointInSelection(OraSynEditMinimap.DisplayToBufferPos(OraSynEditMinimap.PixelsToRowColumn(X, Y))) then
      OraSynEditMinimap.Tag := TAG_POINT_IN_SELECTION;
end;

procedure TSQLEditorTabSheetFrame.OraSynEditMiniMapMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
  if (Shift = [ssLeft]) then
    if X > OraSynEditMinimap.Gutter.LeftOffset then
      SynEditGotoLine(OraSynEdit, OraSynEditMinimap);
end;

procedure TSQLEditorTabSheetFrame.OraSynEditMiniMapMouseWheel(Sender: TObject; Shift: TShiftState; WheelDelta: Integer;
  MousePos: TPoint; var Handled: Boolean);
begin
  SynEditGotoLine(OraSynEdit, OraSynEditMinimap);
end;

procedure TSQLEditorTabSheetFrame.OraSynEditMiniMapPaint(Sender: TObject; ACanvas: TCanvas);
begin
  Paint(ACanvas, OraSynEdit, OraSynEditMinimap);
end;

procedure TSQLEditorTabSheetFrame.OraSynEditMiniMapScroll(Sender: TObject; ScrollBar: TScrollBarKind);
begin
  OraSynEditMinimap.Invalidate;
end;

procedure TSQLEditorTabSheetFrame.Paint(ACanvas: TCanvas; SynEdit, SynEditMiniMap: TBCOraSynEdit);
var
  Bitmap: TBitmap;
  ARect: TRect;
  LStyles: TCustomStyleServices;
begin
  ARect := ACanvas.ClipRect;
  LStyles := StyleServices;
  Bitmap := TBitmap.Create;
  try
    if LStyles.Enabled then
      Bitmap.Canvas.Brush.Color := LStyles.GetStyleFontColor(sfMenuItemTextDisabled)
    else
      Bitmap.Canvas.Brush.Color := clBtnFace;
    { Top }
    if SynEdit.TopLine > SynEditMiniMap.TopLine then
    begin
      Bitmap.Width := ARect.Right - ARect.Left;
      Bitmap.Height := Min((SynEdit.TopLine - SynEditMiniMap.TopLine) * SynEditMiniMap.LineHeight, SynEditMiniMap.LinesInWindow * SynEditMiniMap.LineHeight);  //ARect.Bottom - ARect.Top;
      Bitmap.Canvas.FillRect(Rect(0, 0, Bitmap.Width, Bitmap.Height));
      ACanvas.Draw(ARect.Left, ARect.Top, Bitmap, 50);
    end;
    { Bottom }
    if SynEdit.TopLine + SynEdit.LinesInWindow < SynEditMiniMap.TopLine + SynEditMiniMap.LinesInWindow then
    begin
      Bitmap.Width := ARect.Right - ARect.Left;
      Bitmap.Height := ARect.Bottom - ARect.Top;
      Bitmap.Canvas.FillRect(Rect(0, 0, Bitmap.Width, Bitmap.Height));
      ACanvas.Draw(ARect.Left, ARect.Top + Max(SynEdit.TopLine - SynEditMiniMap.TopLine + SynEdit.LinesInWindow + 1, 0) * SynEditMiniMap.LineHeight,
        Bitmap, 50);
    end;
  finally
    FreeAndNil(Bitmap);
  end;
end;

procedure TSQLEditorTabSheetFrame.SynCompletionProposalExecute(Kind: SynCompletionType; Sender: TObject;
  var CurrentInput: string; var x, y: Integer; var CanExecute: Boolean);
var
  MaxLengthWord: string;
begin
  SynCompletionProposal.NbLinesInWindow := 8; { Bug fix }
  MaxLengthWord := SplitTextIntoWords(SynCompletionProposal, OraSynEdit, OptionsContainer.CompletionProposalCaseSensitive);
  SynCompletionProposal.Width := OraSynEdit.Canvas.TextWidth(MaxLengthWord) + 40;
  CanExecute := SynCompletionProposal.ItemList.Count > 0;
end;

procedure TSQLEditorTabSheetFrame.SynEditGotoLine(SynEdit, SynEditMiniMap: TBCOraSynEdit);
begin
  if SynEdit.Tag = TAG_NO_MOVE_EVENTS then
    Exit;
  if not MinimapVisible then
    Exit;

  if not SynEditMiniMap.SelAvail or (SynEditMiniMap.Tag = TAG_POINT_IN_SELECTION) then
  begin
    if SynEditMiniMap.CaretY <> SynEdit.CaretY then
    begin
      SynEdit.GotoLineAndCenter(SynEditMiniMap.CaretY);
      SynEditMiniMap.Invalidate;
      SynEdit.Invalidate;
    end;
    if SynEditMiniMap.Tag = TAG_POINT_IN_SELECTION then
      SynEditMiniMap.Tag := TAG_NO_MOVE_EVENTS;
  end
  else
  begin
    SynEdit.SelStart := SynEditMiniMap.SelStart;
    SynEdit.SelEnd := SynEditMiniMap.SelEnd;
  end
end;

function TSQLEditorTabSheetFrame.GetMinimapVisible: Boolean;
begin
  Result := OraSynEditMinimap.Visible;
end;

procedure TSQLEditorTabSheetFrame.SetMinimapVisible(Value: Boolean);
begin
  OraSynEditMinimap.Visible := Value;
  SynEditSplitter.Visible := Value;
  UpdateOptionsAndStyles(GetRightPadding);
end;

procedure TSQLEditorTabSheetFrame.UpdateOptionsAndStyles(Right: Integer);
var
  LStyles: TCustomStyleServices;

  procedure SetFontAndColors(SynCompletionProposal: TSynCompletionProposal);
  begin
    SynCompletionProposal.Font.Name := OraSynEdit.Font.Name;
    SynCompletionProposal.Font.Color := LStyles.GetStyleFontColor(sfEditBoxTextNormal);
    SynCompletionProposal.Font.Size := OraSynEdit.Font.Size;
    if LStyles.Enabled then
    begin
      with SynCompletionProposal do
      begin
        ClBackground := LStyles.GetStyleColor(scEdit);
        ClSelect := LStyles.GetSystemColor(clHighlight);
        ClSelectedText := LStyles.GetSystemColor(clHighlightText);
        ClTitleBackground := LStyles.GetStyleColor(scEdit);
        ClBorder := LStyles.GetStyleColor(scPanel);
      end;
    end
    else
    begin
      with SynCompletionProposal do
      begin
        ClBackground := clWindow;
        ClSelect := clHighlight;
        ClSelectedText := clHighlightText;
        ClTitleBackground := clBtnFace;
        ClBorder := clBtnFace;
      end;
    end;
  end;

  procedure SetMinimapProperties(SynEditMinimap: TBCOraSynEdit);
  begin
    OraSynEditMinimap.Font.Size := OptionsContainer.MinimapFontSize;
    OraSynEditMinimap.Color := OraSynEdit.Color;
    OraSynEditMinimap.Font.Color := OraSynEdit.Font.Color;
    OraSynEditMinimap.Highlighter := OraSynEdit.Highlighter;
    OraSynEditMinimap.Text := OraSynEdit.Text;
    OraSynEditMinimap.ActiveLineColor := OraSynEdit.ActiveLineColor;
    OraSynEditMinimap.RightEdge := OraSynEdit.RightEdge;
    OraSynEditMinimap.SelectedColor.Background := OraSynEdit.SelectedColor.Background;
    OraSynEditMinimap.SelectedColor.Foreground := OraSynEdit.SelectedColor.Foreground;
  end;

begin
  Panel.Padding.Right := Right;
  SetMinimapProperties(OraSynEditMinimap);
  { SynCompletionProposal }
  LStyles := StyleServices;
  SetFontAndColors(SynCompletionProposal);
  OptionsContainer.AssignTo(SynCompletionProposal);
end;

end.
