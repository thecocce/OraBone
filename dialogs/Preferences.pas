unit Preferences;

interface

uses
  Winapi.Windows, Winapi.Messages, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, ComCtrls,
  CommCtrl, Registry, Vcl.ExtCtrls, Vcl.Buttons, Menus, SynEdit, SynEditHighlighter,
  SynEditMiscClasses, SynHighlighterWebData, SynEditKeyCmds, System.Classes, BCPageControl,
  System.SysUtils, Vcl.ImgList, SynHighlighterWeb, Grids, JvExComCtrls, JvComCtrls, JvExControls, JvxSlider,
  ActnList, JvExButtons, JvBitBtn, ValEdit, Vcl.Themes, Ora, BCEdit, JvExStdCtrls, JvEdit, JvCombobox,
  BCComboBox;

type
  TOptionsContainer = class;

  TPreferencesDialog = class(TForm)
    FontDialog: TFontDialog;
    ActionList: TActionList;
    SelectFontAction: TAction;
    OKButtonAction: TAction;
    Panel1: TPanel;
    OKButton: TButton;
    CancelButton: TButton;
    Separator1Panel: TPanel;
    Panel2: TPanel;
    PageControl: TBCPageControl;
    EditorTabSheet: TTabSheet;
    EditorFontGroupBox: TGroupBox;
    SpeedButton1: TSpeedButton;
    Panel3: TPanel;
    FontLabel: TLabel;
    LineSpacingGroupBox: TGroupBox;
    Label8: TLabel;
    Label9: TLabel;
    LineSpacingEdit: TBCEdit;
    TabWidthEdit: TBCEdit;
    RightEdgeGroupBox: TGroupBox;
    Label10: TLabel;
    EdgeColumnEdit: TBCEdit;
    GroupBox1: TGroupBox;
    MultilineCheckBox: TCheckBox;
    GutterGroupBox: TGroupBox;
    LineNumbersCheckBox: TCheckBox;
    GutterVisibleCheckBox: TCheckBox;
    PollingIntervalGroupBox: TGroupBox;
    PollingIntervalSlider: TJvxSlider;
    GroupBox2: TGroupBox;
    SchemaBrowserLabel: TLabel;
    ObjectFrameLabel: TLabel;
    SchemaBrowserComboBox: TBCComboBox;
    ObjectFrameComboBox: TBCComboBox;
    DateFormatTabSheet: TTabSheet;
    DateFormatLabel: TLabel;
    DateFormat1Label: TLabel;
    DateFormat2Label: TLabel;
    DateFormat3Label: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label15: TLabel;
    DateFormatEdit: TBCEdit;
    DateFormatExampleEdit: TBCEdit;
    TimeFormatTabSheet: TTabSheet;
    Label16: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label47: TLabel;
    Label48: TLabel;
    TimeFormatExampleEdit: TBCEdit;
    TimeFormatEdit: TBCEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure PollingIntervalSliderChange(Sender: TObject);
    procedure DateFormatEditChange(Sender: TObject);
    procedure SelectFontActionExecute(Sender: TObject);
    procedure OKButtonActionExecute(Sender: TObject);
    procedure TimeFormatEditChange(Sender: TObject);
  private
    FOraSession: TOraSession;
    FOptionsContainer: TOptionsContainer;
    InChanging: Boolean;
    procedure GetData;
    procedure PutData;
    function GetSQLFormat(DateFormat: string): string;
  public
    function Execute(OraSession: TOraSession; EditOptions: TOptionsContainer): Boolean;
  end;

  TOptionsContainer = class(TComponent)
  private
    FExtraLineSpacing: Integer;
    FTabWidth: Integer;
    FRightEdge: Integer;
    FFontName: string;
    FFontSize: Integer;
    FGutterVisible: Boolean;
    FGutterLineNumbers: Boolean;
    FMultiLine: Boolean;
    FPollingInterval: Integer;
    FDateFormat: string;
    FTimeFormat: string;
    FSchemaBrowserAlign: string;
    FObjectFrameAlign: string;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure AssignTo(Dest: TPersistent); override;
  published
    property FontName: string read FFontName write FFontName;
    property FontSize: Integer read FFontSize write FFontSize;
    property ExtraLineSpacing: Integer read FExtraLineSpacing write FExtraLineSpacing;
    property GutterVisible: Boolean read FGutterVisible write FGutterVisible;
    property GutterLineNumbers: Boolean read FGutterVisible write FGutterLineNumbers;
    property MultiLine: Boolean read FMultiLine write FMultiLine;
    property RightEdge: Integer read FRightEdge write FRightEdge;
    property TabWidth: Integer read FTabWidth write FTabWidth;
    property PollingInterval: Integer read FPollingInterval write FPollingInterval;
    property DateFormat: string read FDateFormat write FDateFormat;
    property TimeFormat: string read FTimeFormat write FTimeFormat;
    property SchemaBrowserAlign: string read FSchemaBrowserAlign write FSchemaBrowserAlign;
    property ObjectFrameAlign: string read FObjectFrameAlign write FObjectFrameAlign;
  end;

function PreferencesDialog: TPreferencesDialog;
function OptionsContainer: TOptionsContainer;

implementation

{$R *.dfm}

uses
  Common, Math, UxTheme, DataModule;

const
  CELL_PADDING = 4;

{ TOptionsContainer }

var
  FOptionsContainer: TOptionsContainer;
  FPreferencesDialog: TPreferencesDialog;

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
end;

destructor TOptionsContainer.Destroy;
begin
  FOptionsContainer := nil;
  inherited;
end;

{ TPreferencesDialog }

function PreferencesDialog: TPreferencesDialog;
begin
  if FPreferencesDialog = nil then
    Application.CreateForm(TPreferencesDialog, FPreferencesDialog);
  Result := FPreferencesDialog;
  Common.SetStyledFormSize(Result, 476, 386);

  if Assigned(TStyleManager.ActiveStyle) then
    Result.PageControl.DoubleBuffered := TStyleManager.ActiveStyle.Name = 'Windows';
end;

procedure TPreferencesDialog.FormDestroy(Sender: TObject);
begin
  FPreferencesDialog := nil;
end;

procedure TPreferencesDialog.SelectFontActionExecute(Sender: TObject);
begin
  FontDialog.Font.Name := FontLabel.Font.Name;
  FontDialog.Font.Size := FontLabel.Font.Size;
  if FontDialog.Execute then
  begin
    FontLabel.Font.Assign(FontDialog.Font);
    FontLabel.Caption := FontLabel.Font.Name + ' ' + IntToStr(FontLabel.Font.Size) + 'pt';
  end;
end;

function TPreferencesDialog.GetSQLFormat(DateFormat: string): string;
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

procedure TPreferencesDialog.DateFormatEditChange(Sender: TObject);
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

procedure TPreferencesDialog.TimeFormatEditChange(Sender: TObject);
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

function TPreferencesDialog.Execute(OraSession: TOraSession; EditOptions: TOptionsContainer): Boolean;
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

procedure TPreferencesDialog.GetData;
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
end;

procedure TPreferencesDialog.OKButtonActionExecute(Sender: TObject);
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

procedure TPreferencesDialog.PollingIntervalSliderChange(Sender: TObject);
begin
  PollingIntervalGroupBox.Caption := Format(' DBMS output polling interval: %d second ', [
    PollingIntervalSlider.Value]);
end;

procedure TPreferencesDialog.PutData;
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
end;

procedure TPreferencesDialog.FormCreate(Sender: TObject);
begin
  InChanging := False;
  DateFormatEditChange(nil);
  TimeFormatEditChange(nil);
end;

end.
