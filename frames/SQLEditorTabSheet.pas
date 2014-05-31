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
    procedure SynCompletionProposalExecute(Kind: SynCompletionType; Sender: TObject; var CurrentInput: string; var x,
      y: Integer; var CanExecute: Boolean);
    procedure OraSynEditRightEdgeMouseUp(Sender: TObject);
    procedure OraSynEditMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
    function GetMinimapVisible: Boolean;
    procedure SetMinimapVisible(Value: Boolean);
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    procedure UpdateOptionsAndStyles(Right: Integer);
    property MinimapVisible: Boolean read GetMinimapVisible write SetMinimapVisible;
  end;

implementation

{$R *.dfm}

uses
  System.SysUtils, Vcl.Themes, BCCommon.StringUtils, BCCommon.OptionsContainer, BCCommon.StyleUtils, Math,
  SynEditTypes;

const
  TAG_ZERO = 0;
  TAG_NO_MOVE_EVENTS = 1;
  TAG_POINT_IN_SELECTION = 2;

constructor TSQLEditorTabSheetFrame.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Panel.Padding.Right := GetRightPadding;
  UpdateOptionsAndStyles(Panel.Padding.Right);
end;

procedure TSQLEditorTabSheetFrame.SynCompletionProposalExecute(Kind: SynCompletionType; Sender: TObject;
  var CurrentInput: string; var x, y: Integer; var CanExecute: Boolean);
var
  MaxLengthWord: string;
begin
  SynCompletionProposal.NbLinesInWindow := 8; { Bug fix }
  MaxLengthWord := OraSynEdit.SplitTextIntoWords(SynCompletionProposal, OptionsContainer.CompletionProposalCaseSensitive);
  SynCompletionProposal.Width := OraSynEdit.Canvas.TextWidth(MaxLengthWord) + 40;
  CanExecute := SynCompletionProposal.ItemList.Count > 0;
end;

function TSQLEditorTabSheetFrame.GetMinimapVisible: Boolean;
begin
  Result := OraSynEdit.Minimap.Visible;
end;

procedure TSQLEditorTabSheetFrame.OraSynEditMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X,
  Y: Integer);
begin
  if OptionsContainer.EnableSelectionMode and (eoAltSetsColumnMode in OraSynEdit.Options) then
  begin
    OptionsContainer.EnableSelectionMode := False;
    OraSynEdit.Options := OraSynEdit.Options - [eoAltSetsColumnMode];
    OraSynEdit.Selectionmode := smNormal;
  end;
end;

procedure TSQLEditorTabSheetFrame.OraSynEditRightEdgeMouseUp(Sender: TObject);
begin
  OptionsContainer.MarginRightMargin := OraSynEdit.RightEdge.Position;
end;

procedure TSQLEditorTabSheetFrame.SetMinimapVisible(Value: Boolean);
begin
  OraSynEdit.Minimap.Visible := Value;
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

begin
  Panel.Padding.Right := Right;
  { SynCompletionProposal }
  LStyles := StyleServices;
  SetFontAndColors(SynCompletionProposal);
  OptionsContainer.AssignTo(SynCompletionProposal);
end;

end.
