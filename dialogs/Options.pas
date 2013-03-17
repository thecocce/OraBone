unit Options;

interface

uses
  Winapi.Windows, Winapi.Messages, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, ComCtrls,
  CommCtrl, Registry, Vcl.ExtCtrls, Vcl.Buttons, Menus, SynEdit, SynEditHighlighter, Dlg,
  SynEditMiscClasses, SynHighlighterWebData, SynEditKeyCmds, System.Classes, BCPageControl,
  System.SysUtils, Vcl.ImgList, SynHighlighterWeb, Grids, JvExComCtrls, JvComCtrls, JvExControls, JvxSlider,
  ActnList, JvExButtons, JvBitBtn, ValEdit, Vcl.Themes, Ora, BCEdit, JvExStdCtrls, JvEdit, JvCombobox,
  BCComboBox;

type
  TOptionsContainer = class;

  TOptionsDialog = class(TDialog)
    ActionList: TActionList;
    CancelButton: TButton;
    DateFormat1Label: TLabel;
    DateFormat2Label: TLabel;
    DateFormat3Label: TLabel;
    DateFormatEdit: TBCEdit;
    DateFormatExampleEdit: TBCEdit;
    DateFormatLabel: TLabel;
    DateFormatTabSheet: TTabSheet;
    EdgeColumnEdit: TBCEdit;
    EditorFontGroupBox: TGroupBox;
    EditorTabSheet: TTabSheet;
    FontDialog: TFontDialog;
    FontLabel: TLabel;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    GutterGroupBox: TGroupBox;
    GutterVisibleCheckBox: TCheckBox;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label4: TLabel;
    Label47: TLabel;
    Label48: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    LineNumbersCheckBox: TCheckBox;
    LineSpacingEdit: TBCEdit;
    LineSpacingGroupBox: TGroupBox;
    MultilineCheckBox: TCheckBox;
    ObjectFrameComboBox: TBCComboBox;
    ObjectFrameLabel: TLabel;
    OKButton: TButton;
    OKButtonAction: TAction;
    PageControl: TBCPageControl;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    PollingIntervalGroupBox: TGroupBox;
    PollingIntervalSlider: TJvxSlider;
    RightEdgeGroupBox: TGroupBox;
    SchemaBrowserComboBox: TBCComboBox;
    SchemaBrowserLabel: TLabel;
    SelectFontAction: TAction;
    Separator1Panel: TPanel;
    SpeedButton1: TSpeedButton;
    TabWidthEdit: TBCEdit;
    TimeFormatEdit: TBCEdit;
    TimeFormatExampleEdit: TBCEdit;
    TimeFormatTabSheet: TTabSheet;
    procedure DateFormatEditChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure OKButtonActionExecute(Sender: TObject);
    procedure PollingIntervalSliderChange(Sender: TObject);
    procedure SelectFontActionExecute(Sender: TObject);
    procedure TimeFormatEditChange(Sender: TObject);
  private
    FOptionsContainer: TOptionsContainer;
    FOraSession: TOraSession;
    InChanging: Boolean;
    function GetSQLFormat(DateFormat: string): string;
    procedure GetData;
    procedure PutData;
  public
    function Execute(OraSession: TOraSession; EditOptions: TOptionsContainer): Boolean;
  end;

  TOptionsContainer = class(TComponent)
  private
    FDateFormat: string;
    FExtraLineSpacing: Integer;
    FFontName: string;
    FFontSize: Integer;
    FGutterLineNumbers: Boolean;
    FGutterVisible: Boolean;
    FMultiLine: Boolean;
    FObjectFrameAlign: string;
    FPollingInterval: Integer;
    FRightEdge: Integer;
    FSchemaBrowserAlign: string;
    FTabWidth: Integer;
    FTimeFormat: string;
    FIgnoreCase: Boolean;
    FIgnoreBlanks: Boolean;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure AssignTo(Dest: TPersistent); override;
  published
    property DateFormat: string read FDateFormat write FDateFormat;
    property ExtraLineSpacing: Integer read FExtraLineSpacing write FExtraLineSpacing;
    property FontName: string read FFontName write FFontName;
    property FontSize: Integer read FFontSize write FFontSize;
    property GutterLineNumbers: Boolean read FGutterVisible write FGutterLineNumbers;
    property GutterVisible: Boolean read FGutterVisible write FGutterVisible;
    property IgnoreCase: Boolean read FIgnoreCase write FIgnoreCase;
    property IgnoreBlanks: Boolean read FIgnoreBlanks write FIgnoreBlanks;
    property MultiLine: Boolean read FMultiLine write FMultiLine;
    property ObjectFrameAlign: string read FObjectFrameAlign write FObjectFrameAlign;
    property PollingInterval: Integer read FPollingInterval write FPollingInterval;
    property RightEdge: Integer read FRightEdge write FRightEdge;
    property SchemaBrowserAlign: string read FSchemaBrowserAlign write FSchemaBrowserAlign;
    property TabWidth: Integer read FTabWidth write FTabWidth;
    property TimeFormat: string read FTimeFormat write FTimeFormat;
  end;

function OptionsDialog: TOptionsDialog;
function OptionsContainer: TOptionsContainer;

implementation

{$R *.dfm}

uses
  Common, Math, UxTheme, DataModule, StyleHooks;

const
  CELL_PADDING = 4;

{ TOptionsContainer }

var
  FOptionsContainer: TOptionsContainer;
  FOptionsDialog: TOptionsDialog;

function OptionsContainer: TOptionsContainer;
begin
  if FOptionsContainer = nil then
    FOptionsContainer := TOptionsContainer.Create(nil);
  Result := FOptionsContainer;
end;

procedure TOptionsContainer.AssignTo(Dest: TPersistent);
begin
  if Assigned(Dest) and (Dest is TCustomSynEdit) then
  begin
    TCustomSynEdit(Dest).Font.Name := FFontName;
    TCustomSynEdit(Dest).Font.Size := FFontSize;
    TCustomSynEdit(Dest).Gutter.Visible := FGutterVisible;
    TCustomSynEdit(Dest).Gutter.ShowLineNumbers := FGutterLineNumbers;
    TCustomSynEdit(Dest).ExtraLineSpacing := FExtraLineSpacing;
    TCustomSynEdit(Dest).RightEdge := FRightEdge;
    TCustomSynEdit(Dest).TabWidth := FTabWidth;
  end else
    inherited;
end;

constructor TOptionsContainer.Create(AOwner: TComponent);
begin
  inherited;
  FGutterVisible := True;
  FGutterLineNumbers := True;
  FMultiLine := False;
  FFontName := 'Courier New';
  FFontSize := 10;
  FExtraLineSpacing := 0;
  FRightEdge := 100;
  FTabWidth := 8;
  FPollingInterval := 1;
  FDateFormat := 'DD.MM.YYYY';
  FTimeFormat := 'HH24:MI:SS';
  FSchemaBrowserAlign := 'Bottom';
  FObjectFrameAlign := 'Bottom';
  FIgnoreCase := True;
  FIgnoreBlanks := True;
end;

destructor TOptionsContainer.Destroy;
begin
  FOptionsContainer := nil;
  inherited;
end;

{ TOptionsDialog }

function OptionsDialog: TOptionsDialog;
begin
  if FOptionsDialog = nil then
    Application.CreateForm(TOptionsDialog, FOptionsDialog);
  Result := FOptionsDialog;
  StyleHooks.SetStyledFormSize(Result);
  if Assigned(TStyleManager.ActiveStyle) then
    Result.PageControl.DoubleBuffered := TStyleManager.ActiveStyle.Name = 'Windows';
end;

procedure TOptionsDialog.FormDestroy(Sender: TObject);
begin
  FOptionsDialog := nil;
end;

procedure TOptionsDialog.SelectFontActionExecute(Sender: TObject);
begin
  FontDialog.Font.Name := FontLabel.Font.Name;
  FontDialog.Font.Size := FontLabel.Font.Size;
  if FontDialog.Execute then
  begin
    FontLabel.Font.Assign(FontDialog.Font);
    FontLabel.Caption := FontLabel.Font.Name + ' ' + IntToStr(FontLabel.Font.Size) + 'pt';
  end;
end;

function TOptionsDialog.GetSQLFormat(DateFormat: string): string;
var
  OraQuery: TOraQuery;
begin
  OraQuery := TOraQuery.Create(nil);
  with OraQuery do
  begin
    Session := FOraSession;
    SQL.Add(Format(DM.StringHolder.StringsByName['DateFromDualSQL'].Text, [DateFormat]));
    Open;
    Result := FieldByName('TEXT').AsString;
    Close;
  end;
  FreeAndNil(OraQuery);
end;

procedure TOptionsDialog.DateFormatEditChange(Sender: TObject);
begin
  if Trim(DateFormatEdit.Text) <> '' then
  begin
    DateFormatExampleEdit.Font.Color := clGreen;
    try
      DateFormatExampleEdit.Text := GetSQLFormat(DateFormatEdit.Text);
    except
      DateFormatExampleEdit.Font.Color := clRed;
      DateFormatExampleEdit.Text := 'Invalid date format!';
    end;
  end;
end;

procedure TOptionsDialog.TimeFormatEditChange(Sender: TObject);
begin
  if Trim(TimeFormatEdit.Text) <> '' then
  begin
    TimeFormatExampleEdit.Font.Color := clGreen;
    try
      TimeFormatExampleEdit.Text := GetSQLFormat(TimeFormatEdit.Text);
    except
      TimeFormatExampleEdit.Font.Color := clRed;
      TimeFormatExampleEdit.Text := 'Invalid date format!';
    end;
  end
end;

function TOptionsDialog.Execute(OraSession: TOraSession; EditOptions: TOptionsContainer): Boolean;
begin
  FOraSession := OraSession;
  if (EditOptions = nil) then
  begin
    Result:= False;
    Exit;
  end;
  //Assign the Containers
  FOptionsContainer := EditOptions;
  //Get Data
  GetData;
  //Show the form
  Result:= Showmodal = mrOk;
  //PutData
  if Result then
    PutData;
end;

procedure TOptionsDialog.GetData;
begin
  MultiLineCheckBox.Checked := FOptionsContainer.MultiLine;
  //Gutter
  GutterVisibleCheckBox.Checked := FOptionsContainer.GutterVisible;
  LineNumbersCheckBox.Checked := FOptionsContainer.GutterLineNumbers;
   //Right Edge
  EdgeColumnEdit.Text := IntToStr(FOptionsContainer.RightEdge);
  //Line Spacing
  LineSpacingEdit.Text := IntToStr(FOptionsContainer.ExtraLineSpacing);
  TabWidthEdit.Text := IntToStr(FOptionsContainer.TabWidth);
  //Font
  FontLabel.Font.Name := FOptionsContainer.FontName;
  FontLabel.Font.Size := FOptionsContainer.FontSize;
  FontLabel.Caption := FontLabel.Font.Name + ' ' + IntToStr(FontLabel.Font.Size) + 'pt';
  // Polling Interval
  PollingIntervalSlider.Value := FOptionsContainer.PollingInterval;
  // Date Format
  DateFormatEdit.Text := FOptionsContainer.DateFormat;
  TimeFormatEdit.Text := FOptionsContainer.TimeFormat;
  // Button Panel Align
  SchemaBrowserComboBox.Text := FOptionsContainer.SchemaBrowserAlign;
  ObjectFrameComboBox.Text := FOptionsContainer.ObjectFrameAlign;
  { Compare }
  //FOptionsCompareFrame.IgnoreCaseCheckBox.Checked := FOptionsContainer.IgnoreCase;
  //FOptionsCompareFrame.IgnoreBlanksCheckBox.Checked := FOptionsContainer.IgnoreBlanks;
end;

procedure TOptionsDialog.OKButtonActionExecute(Sender: TObject);
begin
  if DateFormatExampleEdit.Font.Color = clRed then
  begin
    PageControl.ActivePage := DateFormatTabSheet;
    DateFormatEdit.SetFocus;
    ShowErrorMessage('Invalid date format.');
    Exit;
  end;
  if TimeFormatExampleEdit.Font.Color = clRed then
  begin
    PageControl.ActivePage := TimeFormatTabSheet;
    TimeFormatEdit.SetFocus;
    ShowErrorMessage('Invalid time format.');
    Exit;
  end;

  ModalResult := mrOk;
end;

procedure TOptionsDialog.PollingIntervalSliderChange(Sender: TObject);
begin
  PollingIntervalGroupBox.Caption := Format(' DBMS output polling interval: %d second ', [
    PollingIntervalSlider.Value]);
end;

procedure TOptionsDialog.PutData;
var
  vOptions: TSynEditorOptions;

  procedure SetFlag(aOption: TSynEditorOption; aValue: Boolean);
  begin
    if aValue then
      Include(vOptions, aOption)
    else
      Exclude(vOptions, aOption);
  end;

begin
  FOptionsContainer.MultiLine := MultiLineCheckBox.Checked;
  //Gutter
  FOptionsContainer.GutterVisible := GutterVisibleCheckBox.Checked;
  FOptionsContainer.GutterLineNumbers := LineNumbersCheckBox.Checked;
  //Right Edge
  FOptionsContainer.RightEdge := StrToIntDef(EdgeColumnEdit.Text, 100);
  //Line Spacing
  FOptionsContainer.ExtraLineSpacing := StrToIntDef(LineSpacingEdit.Text, 0);
  FOptionsContainer.TabWidth := StrToIntDef(TabWidthEdit.Text, 8);
  //Font
  FOptionsContainer.FontName := FontLabel.Font.Name;
  FOptionsContainer.FontSize := FontLabel.Font.Size;
  // Polling Interval
  FOptionsContainer.PollingInterval := PollingIntervalSlider.Value;
  // Date Format
  FOptionsContainer.DateFormat := DateFormatEdit.Text;
  FOptionsContainer.TimeFormat := TimeFormatEdit.Text;
  // Button Panel Align
  FOptionsContainer.SchemaBrowserAlign := SchemaBrowserComboBox.Text;
  FOptionsContainer.ObjectFrameAlign := ObjectFrameComboBox.Text;
  { Compare }
  //FOptionsContainer.IgnoreCase := FOptionsCompareFrame.IgnoreCaseCheckBox.Checked;
  //FOptionsContainer.IgnoreBlanks := FOptionsCompareFrame.IgnoreBlanksCheckBox.Checked;
end;

procedure TOptionsDialog.FormCreate(Sender: TObject);
begin
  InChanging := False;
  DateFormatEditChange(nil);
  TimeFormatEditChange(nil);
end;

end.
