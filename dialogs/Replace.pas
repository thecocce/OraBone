unit Replace;

{$I SynEdit.inc}

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls, Vcl.ExtCtrls, JvExStdCtrls, JvCombobox, BCComboBox;

type
  TReplaceDialog = class(TForm)
    CancelButton: TButton;
    CaseSensitiveCheckBox: TCheckBox;
    FindButton: TButton;
    OptionsGroupBox: TGroupBox;
    ReplaceAllButton: TButton;
    ReplaceInRadioGroup: TRadioGroup;
    ReplaceWithComboBox: TBCComboBox;
    ReplaceWithLabel: TLabel;
    SearchForComboBox: TBCComboBox;
    SearchForLabel: TLabel;
    WholeWordsCheckBox: TCheckBox;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormDestroy(Sender: TObject);
    procedure SearchForComboBoxKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    function GetReplaceInWholeFile: Boolean;
    function GetReplaceText: string;
    function GetSearchCaseSensitive: Boolean;
    function GetSearchText: string;
    function GetSearchWholeWords: Boolean;
  public
    property ReplaceInWholeFile: Boolean read GetReplaceInWholeFile;
    property ReplaceText: string read GetReplaceText;
    property SearchCaseSensitive: Boolean read GetSearchCaseSensitive;
    property SearchText: string read GetSearchText;
    property SearchWholeWords: Boolean read GetSearchWholeWords;
  end;

function ReplaceDialog: TReplaceDialog;

implementation

{$R *.DFM}

uses
  Common;

var
  FReplaceDialog: TReplaceDialog;

function ReplaceDialog: TReplaceDialog;
begin
  if FReplaceDialog = nil then
    Application.CreateForm(TReplaceDialog, FReplaceDialog);
  Result := FReplaceDialog;
end;

procedure TReplaceDialog.FormDestroy(Sender: TObject);
begin
  FReplaceDialog := nil;
end;

function TReplaceDialog.GetReplaceText: string;
begin
  Result := ReplaceWithComboBox.Text;
end;

function TReplaceDialog.GetSearchCaseSensitive: Boolean;
begin
  Result := CaseSensitiveCheckBox.Checked;
end;

function TReplaceDialog.GetSearchText: string;
begin
  Result := SearchForComboBox.Text;
end;

function TReplaceDialog.GetSearchWholeWords: Boolean;
begin
  Result := WholeWordsCheckBox.Checked;
end;

procedure TReplaceDialog.SearchForComboBoxKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  FindButton.Enabled := (Trim(SearchForComboBox.Text) <> '');
  ReplaceAllButton.Enabled := FindButton.Enabled;
end;

function TReplaceDialog.GetReplaceInWholeFile: Boolean;
begin
  Result := ReplaceInRadioGroup.ItemIndex = 0;
end;

procedure TReplaceDialog.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  inherited;
  if ModalResult = mrOK then
  begin
    InsertTextToCombo(SearchForComboBox);
    InsertTextToCombo(ReplaceWithComboBox);
  end;
end;

end.

 