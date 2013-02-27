unit Search;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TSearchDialog = class(TForm)
    CancelButton: TButton;
    CaseSensitiveCheckBox: TCheckBox;
    DirectionRadioGroup: TRadioGroup;
    OkButton: TButton;
    OptionsGroupBox: TGroupBox;
    SearchForComboBox: TComboBox;
    SearchForLabel: TLabel;
    WholeWordsCheckBox: TCheckBox;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormDestroy(Sender: TObject);
    procedure SearchForComboBoxChange(Sender: TObject);
  private
    function GetSearchBackwards: Boolean;
    function GetSearchCaseSensitive: Boolean;
    function GetSearchText: string;
    function GetSearchWholeWords: Boolean;
  public
    property SearchBackwards: Boolean read GetSearchBackwards;
    property SearchCaseSensitive: Boolean read GetSearchCaseSensitive;
    property SearchText: string read GetSearchText;
    property SearchWholeWords: Boolean read GetSearchWholeWords;
  end;

function SearchDialog(Sender: TComponent): TSearchDialog;

implementation

{$R *.DFM}

uses
  Common;

var
  FSearchDialog: TSearchDialog;

function SearchDialog(Sender: TComponent): TSearchDialog;
begin
  if FSearchDialog = nil then
    FSearchDialog := TSearchDialog.Create(Sender);
  Result := FSearchDialog;
end;

procedure TSearchDialog.FormDestroy(Sender: TObject);
begin
  FSearchDialog := nil;
end;

function TSearchDialog.GetSearchBackwards: Boolean;
begin
  Result := DirectionRadioGroup.ItemIndex = 1;
end;

function TSearchDialog.GetSearchCaseSensitive: Boolean;
begin
  Result := CaseSensitiveCheckBox.Checked;
end;

function TSearchDialog.GetSearchText: string;
begin
  Result := SearchForComboBox.Text;
end;

function TSearchDialog.GetSearchWholeWords: Boolean;
begin
  Result := WholeWordsCheckBox.Checked;
end;

procedure TSearchDialog.SearchForComboBoxChange(Sender: TObject);
begin
  OkButton.Enabled := Trim(SearchForComboBox.Text) <> '';
end;

procedure TSearchDialog.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if ModalResult = mrOK then
    InsertTextToCombo(SearchForComboBox);
end;

end.

 